#!/usr/bin/env bash
# Configura banner SSH (pre-login) e painel de status (pos-login) estilo
# USCSS Nostromo / MU/TH/UR 6000.
#   DRY_RUN=1 ./ssh-nostromo.sh   -> so mostra a previa, nao altera nada.
set -euo pipefail

BANNER_PATH="${BANNER_PATH:-/etc/ssh/ssh_banner}"
SSH_CONFIG_PATH="${SSH_CONFIG_PATH:-/etc/ssh/sshd_config}"
MOTD_PATH="${MOTD_PATH:-/etc/profile.d/99-nostromo-status.sh}"
SHIP_NAME="${SHIP_NAME:-USCSS NOSTROMO}"
SHIP_REG="${SHIP_REG:-180924609}"
DRY_RUN="${DRY_RUN:-0}"

TEMP_BANNER="$(mktemp)"
TEMP_MOTD="$(mktemp)"
trap 'rm -f "$TEMP_BANNER" "$TEMP_MOTD"' EXIT

# ---------------------------------------------------------------------------
# BANNER (pre-autenticacao). Texto puro: clientes OpenSSH recentes removem
# sequencias ANSI do banner, entao cores aqui nao funcionariam.
# ---------------------------------------------------------------------------
cat > "$TEMP_BANNER" <<EOF

 ┌──────────────────────────────────────────────────────────────────┐
 │  WEYLAND-YUTANI CORP          "BUILDING BETTER WORLDS"           │
 ├──────────────────────────────────────────────────────────────────┤
 │  VESSEL .......... $SHIP_NAME
 │  REGISTRY ........ $SHIP_REG
 │  SYSTEM .......... MU/TH/UR 6000  INTERFACE 2037
 ├──────────────────────────────────────────────────────────────────┤
 │  *** ACESSO RESTRITO - SOMENTE PESSOAL AUTORIZADO ***            │
 │                                                                  │
 │  TODA ATIVIDADE E MONITORADA, REGISTRADA E AUDITADA.             │
 │  ACESSO NAO AUTORIZADO CONSTITUI VIOLACAO DA LEI E               │
 │  SERA RASTREADO E REPORTADO.                                     │
 │                                                                  │
 │  SE VOCE NAO E AUTORIZADO, DESCONECTE IMEDIATAMENTE.             │
 └──────────────────────────────────────────────────────────────────┘

EOF

# ---------------------------------------------------------------------------
# PAINEL POS-LOGIN (executa a cada login interativo). Heredoc com aspas:
# nada e expandido agora. Sem set -e aqui: um erro nao pode quebrar o login.
# ---------------------------------------------------------------------------
cat > "$TEMP_MOTD" <<'EOF'
# shellcheck shell=bash
# Somente shells interativos com terminal.
if [ -z "${NOSTROMO_FORCE:-}" ]; then
  case $- in *i*) ;; *) return 0 2>/dev/null || exit 0 ;; esac
  [ -t 1 ] || { return 0 2>/dev/null || exit 0; }
fi
[ -n "${NOSTROMO_SHOWN:-}" ] && { return 0 2>/dev/null || exit 0; }
export NOSTROMO_SHOWN=1

# --- Paleta (desligada se NO_COLOR ou terminal sem cor) ---
if [ -z "${NO_COLOR:-}" ] && [ "$(tput colors 2>/dev/null || echo 0)" -ge 8 ]; then
  G=$'\033[32m'; GB=$'\033[1;32m'; A=$'\033[33m'; AB=$'\033[1;33m'
  R=$'\033[1;31m'; C=$'\033[36m'; D=$'\033[2;32m'; N=$'\033[0m'
else
  G=; GB=; A=; AB=; R=; C=; D=; N=
fi

# --- Barra: bar <pct> -> [██████░░░░] colorida por limiar ---
bar() {
  local p=${1:-0} w=20 f i col
  [ "$p" -gt 100 ] && p=100
  f=$(( p * w / 100 ))
  if   [ "$p" -ge 90 ]; then col=$R
  elif [ "$p" -ge 70 ]; then col=$AB
  else col=$GB; fi
  printf '%s[' "$D"
  printf '%s' "$col"
  for ((i=0;i<f;i++));   do printf '█'; done
  printf '%s' "$D"
  for ((i=f;i<w;i++));   do printf '░'; done
  printf ']%s %s%3d%%%s' "$N" "$col" "$p" "$N"
}
row() { printf ' %s│%s %s%-16s%s %s\n' "$D" "$N" "$G" "$1" "$N" "$2"; }
sec() { printf ' %s├─[ %s%s%s ]%s\n' "$D" "$AB" "$1" "$D" "$N"; }

# --- Coleta de dados ---
host=$(hostname 2>/dev/null)
ip=$(hostname -I 2>/dev/null | awk '{print $1}')
os=$( . /etc/os-release 2>/dev/null && echo "$PRETTY_NAME" )
kernel=$(uname -r)
arch=$(uname -m)
up=$(uptime -p 2>/dev/null | sed 's/^up //')
cpu_model=$(awk -F': ' '/model name/ {print $2; exit}' /proc/cpuinfo 2>/dev/null)
cpu_n=$(nproc 2>/dev/null || echo 1)
read -r l1 l5 l15 _ < /proc/loadavg 2>/dev/null
load_pct=$(awk -v l="${l1:-0}" -v n="$cpu_n" 'BEGIN{p=l/n*100; if(p>100)p=100; printf "%d",p}')
mem_pct=$(free 2>/dev/null | awk '/^Mem:/ {printf "%d",$3/$2*100}')
mem_h=$(free -h 2>/dev/null | awk '/^Mem:/ {print $3" / "$2}')
swap_pct=$(free 2>/dev/null | awk '/^Swap:/ {if($2>0) printf "%d",$3/$2*100; else print 0}')
users_n=$(who 2>/dev/null | wc -l)
procs=$(ps -e --no-headers 2>/dev/null | wc -l)
lastlog=$(last -n 2 -R "${USER:-$(id -un)}" 2>/dev/null | sed -n '2p' | awk '{$1="";print}' | sed 's/^ *//')
case $lastlog in begins*|wtmp*) lastlog= ;; esac
failed=$(systemctl --failed --no-legend 2>/dev/null | wc -l)
temp=$(awk '{printf "%.0f", $1/1000}' /sys/class/thermal/thermal_zone0/temp 2>/dev/null)
now=$(date '+%Y-%m-%d %H:%M:%S %Z')

# --- Render ---
printf '\n%s' "$GB"
cat <<'ART'
  ╔╗╔ ╔═╗ ╔═╗ ╔╦╗ ╦═╗ ╔═╗ ╔╦╗ ╔═╗
  ║║║ ║ ║ ╚═╗  ║  ╠╦╝ ║ ║ ║║║ ║ ║
  ╝╚╝ ╚═╝ ╚═╝  ╩  ╩╚═ ╚═╝ ╩ ╩ ╚═╝
ART
printf '%s' "$N"
printf ' %sWEYLAND-YUTANI CORP%s  //  %sMU/TH/UR 6000%s  //  %sINTERFACE 2037%s\n' "$AB" "$N" "$G" "$N" "$C" "$N"
printf ' %s┌──────────────────────────────────────────────────────────────%s\n' "$D" "$N"
user=${USER:-$(id -un 2>/dev/null)}
row "OPERADOR"   "${GB}${user}${N}@${host}  ${D}(sessoes ativas: ${users_n})${N}"
row "TERMINAL"   "$(tty 2>/dev/null)  ${D}${now}${N}"
[ -n "$lastlog" ] && row "ULTIMO ACESSO" "${D}${lastlog}${N}"

sec "NAVEGACAO / REDE"
row "NOME DA NAVE" "${host}"
row "ENDERECO"     "${C}${ip:-n/d}${N}"
row "SIST. BASE"   "${os:-n/d}"
row "NUCLEO"       "${kernel} ${D}(${arch})${N}"
row "TEMPO ATIVO"  "${up:-n/d}"

sec "PROPULSAO / PROCESSAMENTO"
row "NUCLEOS"      "${cpu_n}x ${D}${cpu_model:-n/d}${N}"
row "CARGA CPU"    "$(bar "$load_pct")  ${D}${l1} ${l5} ${l15}${N}"
[ -n "$temp" ] && row "TEMPERATURA" "$(bar "$temp")  ${D}${temp}°C${N}"
row "PROCESSOS"    "${procs}"

sec "SUPORTE DE VIDA / ARMAZENAMENTO"
row "MEMORIA"      "$(bar "${mem_pct:-0}")  ${D}${mem_h}${N}"
row "SWAP"         "$(bar "${swap_pct:-0}")"
while read -r mnt use size used; do
  p=${use%\%}
  row "DISCO ${mnt:0:10}" "$(bar "${p:-0}")  ${D}${used}/${size}${N}"
done < <(df -hP -x tmpfs -x devtmpfs -x squashfs -x overlay 2>/dev/null \
         | awk 'NR>1 && !seen[$1]++ {print $6, $5, $2, $3}' | head -n 4)

sec "ESTADO DO SISTEMA"
if [ "${failed:-0}" -gt 0 ]; then
  row "SERVICOS" "${R}ALERTA: ${failed} unidade(s) com falha${N}  ${D}(systemctl --failed)${N}"
else
  row "SERVICOS" "${GB}NOMINAL${N}"
fi
[ -f /var/run/reboot-required ] && row "REINICIO" "${AB}PENDENTE${N}"

printf ' %s└──────────────────────────────────────────────────────────────%s\n' "$D" "$N"
printf ' %sCOMANDO?%s _\n\n' "$GB" "$N"
unset -f bar row sec
EOF

# ---------------------------------------------------------------------------
# PREVIA (sem alterar o sistema)
# ---------------------------------------------------------------------------
if [ "$DRY_RUN" = "1" ]; then
  echo "================ BANNER (pre-login) ================"
  cat "$TEMP_BANNER"
  echo "================ PAINEL (pos-login) ================"
  NOSTROMO_FORCE=1 bash "$TEMP_MOTD" || true
  exit 0
fi

# ---------------------------------------------------------------------------
# INSTALACAO
# ---------------------------------------------------------------------------
command -v sudo >/dev/null || { echo "sudo e necessario." >&2; exit 1; }

sudo cp "$TEMP_BANNER" "$BANNER_PATH"
BACKUP="$SSH_CONFIG_PATH.bak.$(date +%Y%m%d-%H%M%S)"
sudo cp "$SSH_CONFIG_PATH" "$BACKUP"

# Remove Banner existente e insere ANTES do primeiro bloco Match (se houver).
sudo sed -i -E '/^[[:space:]]*#?[[:space:]]*Banner[[:space:]]/d' "$SSH_CONFIG_PATH"
if sudo grep -qE '^[[:space:]]*Match[[:space:]]' "$SSH_CONFIG_PATH"; then
  sudo sed -i -E "0,/^[[:space:]]*Match[[:space:]]/s||Banner $BANNER_PATH\n&|" "$SSH_CONFIG_PATH"
else
  printf 'Banner %s\n' "$BANNER_PATH" | sudo tee -a "$SSH_CONFIG_PATH" >/dev/null
fi

# Valida antes de recarregar; se falhar, restaura o backup.
if ! sudo sshd -t -f "$SSH_CONFIG_PATH"; then
  echo "sshd_config invalido, restaurando $BACKUP" >&2
  sudo cp "$BACKUP" "$SSH_CONFIG_PATH"
  exit 1
fi

sudo cp "$TEMP_MOTD" "$MOTD_PATH"
sudo chmod 644 "$MOTD_PATH"   # profile.d e 'source'd, nao precisa de +x

if systemctl is-active --quiet ssh; then sudo systemctl reload ssh
elif systemctl is-active --quiet sshd; then sudo systemctl reload sshd; fi

echo "MU/TH/UR 6000: interface configurada. Backup em $BACKUP"
