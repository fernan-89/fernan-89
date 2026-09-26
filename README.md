<div align="center">

# Andre Silva

**Solutions Architect · Staff Engineer · Cloud & Distributed Systems**

🇺🇸 [English](#-english) · 🇧🇷 [Português](#-português)

</div>

---

## 🇺🇸 English

I design scalable, resilient, business-aligned architectures. My path runs from help desk and datacenter operations to leading Cloud Ops teams and, since 2021, **Senior Solutions Architect at Itaú Unibanco**, where I drive modernization, architectural governance and secure delivery across LATAM units.

On GitHub I keep a hands-on lab: **ThinkLab**, a platform of reactive microservices modeled after the **BIAN** (Banking Industry Architecture Network) service domains, plus automation and data tooling for my home lab.

### 🔭 What I'm working on
- **ThinkLab Platform** — Java 21 + Micronaut 4 + Project Reactor microservices using hexagonal architecture, DDD and BIAN behavior qualifiers (`initiate`, `retrieve`, `update`, `control`).
- **Observability & reliability** — OpenTelemetry / W3C Trace Context, reactive MDC bridging and SRE forensics.
- **Secure by default** — distroless non-root images, read-only filesystems, AOT builds and Kubernetes / OpenShift manifests.
- **AI-assisted engineering** — building software and multi-agent workflows with Anthropic's Claude and prompt engineering.

### 📌 Featured projects

#### ThinkLab — BIAN-aligned reactive microservices platform
Every service uses Java 21, Micronaut 4, Project Reactor, hexagonal architecture, ADRs and distroless non-root images.

| Repository | What it is | Highlights |
| :--- | :--- | :--- |
| [thinklab-platform](https://github.com/fernan-89/thinklab-platform) | Local stack, end-to-end runner and cross-service docs that tie the platform together | Docker Compose · PowerShell · Postman |
| [thinklab-service-kit](https://github.com/fernan-89/thinklab-service-kit) | Shared kit: W3C tracing, Reactor MDC bridge, health warm-up, transactional outbox → NATS JetStream | Java 21 · Micronaut · NATS |
| [micronaut-platform-gateway-service](https://github.com/fernan-89/micronaut-platform-gateway-service) | Single public entry point: routing by BIAN service domain, rate limiting, bearer-token verification | Java 21 · Micronaut · Reactor |
| [micronaut-hash-token-registry-service](https://github.com/fernan-89/micronaut-hash-token-registry-service) | Sovereign identity: cryptographic hash-token lifecycle with forensic audit | MongoDB · OpenTelemetry |
| [micronaut-party-authentication-service](https://github.com/fernan-89/micronaut-party-authentication-service) | Tenant-scoped user IAM: credentials, sessions and JWT rotation | JWT · MongoDB |
| [micronaut-party-reference-data-directory-service](https://github.com/fernan-89/micronaut-party-reference-data-directory-service) | Organisations, units, contacts and billing | MongoDB |
| [micronaut-it-asset-registry-service](https://github.com/fernan-89/micronaut-it-asset-registry-service) | IT asset inventory lifecycle with an immutable audit ledger | MongoDB |
| [micronaut-it-operation-window-service](https://github.com/fernan-89/micronaut-it-operation-window-service) | Maintenance-window scheduling with collision and impact detection | MongoDB |
| [micronaut-notification-dispatch-service](https://github.com/fernan-89/micronaut-notification-dispatch-service) | Event-driven notification delivery from platform domain events | NATS JetStream · MongoDB |

#### Tools & home lab

| Repository | What it is | Highlights |
| :--- | :--- | :--- |
| [home-lab-scripts](https://github.com/fernan-89/home-lab-scripts) | Paired PowerShell + Bash utilities for networking, inventory, Git, Docker and Terraform | PowerShell · Bash · Terraform |
| [hardware-collection](https://github.com/fernan-89/hardware-collection) | 500+ synthetic enterprise IT asset records (hardware, cloud, software, governance) | JSON |
| [xencelabs-quick-keys](https://github.com/fernan-89/xencelabs-quick-keys) | Macro-pad profiles for development (IntelliJ, DataGrip) and gaming | Config |

> ThinkLab code is **source-available for reading only** under a proprietary license (all rights reserved). Tools are MIT unless stated otherwise.

### 🧭 Career
- **Senior Solutions Architect** @ Itaú Unibanco (2021 – present) — modernization, architecture reviews and DevSecOps for Credit Recovery, International Units and PJ Pricing & Customer Engagement.
- **Cloud Ops Team Leader / Analyst** @ BRLink (2019 – 2021) — AWS operations, Infrastructure as Code, automation and observability.
- **Senior IT Infrastructure Analyst** @ ST IT (2019) — AWS, Docker and Elastic Stack.
- **IT Infrastructure & NOC** (2015 – 2019) — high-availability datacenters, VMware, networking, Zabbix and Grafana.
- **Technical Support & Service Desk** (2010 – 2015) — UOLDIVEO, todo! and Connectcom.

### 🎓 Education & certifications
- Postgraduate in Software Architecture and Solutions — IGTI
- B.Sc. in Information Technology — Centro Universitário Nove de Julho
- AWS Certified **Security – Specialty** · **Solutions Architect – Associate** · **Cloud Practitioner**
- Itaú Unibanco: Solutions Architecture Foundation · Associate Privacy Champion
- Leading SAFe 4.5 · O'Reilly (Software Architecture, Distributed Systems, Cloud Native, Docker) · Generative AI at Work · Claude Architect Foundations · Architecture as Code

---

## 🇧🇷 Português

Projeto arquiteturas escaláveis, resilientes e alinhadas ao negócio. Minha trajetória vai do help desk e operação de datacenter à liderança de times de Cloud Ops e, desde 2021, **Arquiteto de Soluções Sênior no Itaú Unibanco**, onde conduzo modernização, governança arquitetural e entrega segura em unidades da América Latina.

Aqui no GitHub mantenho um laboratório prático: **ThinkLab**, uma plataforma de microsserviços reativos modelada a partir dos service domains do **BIAN** (Banking Industry Architecture Network), além de ferramentas de automação e dados para o meu home lab.

### 🔭 No que estou trabalhando
- **Plataforma ThinkLab** — microsserviços em Java 21 + Micronaut 4 + Project Reactor com arquitetura hexagonal, DDD e behavior qualifiers do BIAN (`initiate`, `retrieve`, `update`, `control`).
- **Observabilidade e confiabilidade** — OpenTelemetry / W3C Trace Context, propagação de MDC em fluxos reativos e forense de SRE.
- **Seguro por padrão** — imagens distroless non-root, filesystem somente leitura, builds AOT e manifestos Kubernetes / OpenShift.
- **Engenharia assistida por IA** — desenvolvimento de software e fluxos multiagentes com o Claude, da Anthropic, e engenharia de prompts.

### 📌 Projetos em destaque

#### ThinkLab — plataforma de microsserviços reativos alinhada ao BIAN
Todos os serviços usam Java 21, Micronaut 4, Project Reactor, arquitetura hexagonal, ADRs e imagens distroless non-root.

| Repositório | O que é | Destaques |
| :--- | :--- | :--- |
| [thinklab-platform](https://github.com/fernan-89/thinklab-platform) | Pilha local, runner end-to-end e documentação transversal que integram a plataforma | Docker Compose · PowerShell · Postman |
| [thinklab-service-kit](https://github.com/fernan-89/thinklab-service-kit) | Kit compartilhado: tracing W3C, ponte MDC no Reactor, warm-up de health, outbox transacional → NATS JetStream | Java 21 · Micronaut · NATS |
| [micronaut-platform-gateway-service](https://github.com/fernan-89/micronaut-platform-gateway-service) | Ponto único de entrada: roteamento por service domain BIAN, rate limiting e verificação de bearer token | Java 21 · Micronaut · Reactor |
| [micronaut-hash-token-registry-service](https://github.com/fernan-89/micronaut-hash-token-registry-service) | Identidade soberana: ciclo de vida de tokens de hash criptográficos com auditoria forense | MongoDB · OpenTelemetry |
| [micronaut-party-authentication-service](https://github.com/fernan-89/micronaut-party-authentication-service) | IAM de usuários por tenant: credenciais, sessões e rotação de JWT | JWT · MongoDB |
| [micronaut-party-reference-data-directory-service](https://github.com/fernan-89/micronaut-party-reference-data-directory-service) | Organizações, unidades, contatos e faturamento | MongoDB |
| [micronaut-it-asset-registry-service](https://github.com/fernan-89/micronaut-it-asset-registry-service) | Ciclo de vida do inventário de ativos de TI com ledger de auditoria imutável | MongoDB |
| [micronaut-it-operation-window-service](https://github.com/fernan-89/micronaut-it-operation-window-service) | Agendamento de janelas de manutenção com detecção de colisão e impacto | MongoDB |
| [micronaut-notification-dispatch-service](https://github.com/fernan-89/micronaut-notification-dispatch-service) | Envio de notificações orientado a eventos de domínio da plataforma | NATS JetStream · MongoDB |

#### Ferramentas e home lab

| Repositório | O que é | Destaques |
| :--- | :--- | :--- |
| [home-lab-scripts](https://github.com/fernan-89/home-lab-scripts) | Utilitários em pares PowerShell + Bash para rede, inventário, Git, Docker e Terraform | PowerShell · Bash · Terraform |
| [hardware-collection](https://github.com/fernan-89/hardware-collection) | Mais de 500 registros sintéticos de ativos de TI corporativos (hardware, cloud, software, governança) | JSON |
| [xencelabs-quick-keys](https://github.com/fernan-89/xencelabs-quick-keys) | Perfis de macro pad para desenvolvimento (IntelliJ, DataGrip) e jogos | Config |

> O código do ThinkLab é **aberto apenas para leitura**, sob licença proprietária (todos os direitos reservados). As ferramentas usam MIT, salvo indicação em contrário.

### 🧭 Carreira
- **Arquiteto de Soluções Sênior** @ Itaú Unibanco (2021 – atual) — modernização, validações arquiteturais e DevSecOps em Recuperação de Crédito, Unidades Internacionais e Pricing & Engajamento de Clientes PJ.
- **Líder / Analista de Cloud Ops** @ BRLink (2019 – 2021) — operação AWS, Infraestrutura como Código, automação e observabilidade.
- **Analista de Infraestrutura de TI Sênior** @ ST IT (2019) — AWS, Docker e Elastic Stack.
- **Infraestrutura de TI & NOC** (2015 – 2019) — datacenters de alta disponibilidade, VMware, redes, Zabbix e Grafana.
- **Suporte Técnico & Service Desk** (2010 – 2015) — UOLDIVEO, todo! e Connectcom.

### 🎓 Formação e certificações
- Pós-graduação em Arquitetura de Software e Soluções — IGTI
- Bacharelado em Tecnologia da Informação — Centro Universitário Nove de Julho
- AWS Certified **Security – Specialty** · **Solutions Architect – Associate** · **Cloud Practitioner**
- Itaú Unibanco: Arquitetura de Soluções Foundation · Associate Privacy Champion
- Leading SAFe 4.5 · O'Reilly (Arquitetura de Software, Sistemas Distribuídos, Cloud Native, Docker) · Generative AI at Work · Claude Architect Foundations · Architecture as Code

---

## 🧰 Tech Stack & Tools / Tecnologias e Ferramentas

**Languages & Frameworks**  
![Java](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white) 
![Micronaut](https://img.shields.io/badge/Micronaut-000000.svg?style=for-the-badge&logo=micronaut&logoColor=white) 
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white) 
![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)

**Architecture, Modeling & Governance**  
![C4 Model](https://img.shields.io/badge/C4%20Model-%23111111.svg?style=for-the-badge&logo=databricks&logoColor=white)
![Structurizr](https://img.shields.io/badge/Structurizr-%23000000.svg?style=for-the-badge&logo=codeforces&logoColor=white)
![Draw.io](https://img.shields.io/badge/draw.io-%23F08705.svg?style=for-the-badge&logo=draw.io&logoColor=white)
![Microsoft Visio](https://img.shields.io/badge/Visio-%233955A3.svg?style=for-the-badge&logo=microsoftvisio&logoColor=white)

**Cloud, Containers & AI**  
![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white) 
![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white) 
![OpenShift](https://img.shields.io/badge/OpenShift-EE0000?style=for-the-badge&logo=redhat&logoColor=white) 
![Kubernetes](https://img.shields.io/badge/kubernetes-%23326ce5.svg?style=for-the-badge&logo=kubernetes&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)
![Anthropic](https://img.shields.io/badge/Anthropic-000000?style=for-the-badge&logo=anthropic&logoColor=white)

**Infrastructure as Code, CI/CD & Automation**  
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white) 
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white) 
![YAML](https://img.shields.io/badge/yaml-%23ffffff.svg?style=for-the-badge&logo=yaml&logoColor=151515) 
![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![Bash](https://img.shields.io/badge/GNU%20Bash-4EAA25?style=for-the-badge&logo=GNU%20Bash&logoColor=white) 

**Observability & Monitoring**  
![ElasticStack](https://img.shields.io/badge/-ElasticSearch-005571?style=for-the-badge&logo=elasticsearch&logoColor=white) 
![Grafana](https://img.shields.io/badge/grafana-%23F46800.svg?style=for-the-badge&logo=grafana&logoColor=white) 
![Zabbix](https://img.shields.io/badge/Zabbix-D40000?style=for-the-badge&logo=zabbix&logoColor=white) 
![Dynatrace](https://img.shields.io/badge/Dynatrace-1496FF?style=for-the-badge&logo=dynatrace&logoColor=white) 
![New Relic](https://img.shields.io/badge/New%20Relic-008C99?style=for-the-badge&logo=newrelic&logoColor=white)

**Databases & Storage**  
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)
![MS SQL Server](https://img.shields.io/badge/MS%20SQL%20Server-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)

**Enterprise Infrastructure, OS & Hardware**  
![HP](https://img.shields.io/badge/HP-0096D6?style=for-the-badge&logo=hp&logoColor=white)
![Dell](https://img.shields.io/badge/Dell-007DB8?style=for-the-badge&logo=dell&logoColor=white)
![IBM](https://img.shields.io/badge/IBM-052FAD?style=for-the-badge&logo=ibm&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black) 
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white) 
![CentOS](https://img.shields.io/badge/centos-%23262577.svg?style=for-the-badge&logo=centos&logoColor=white) 
![Windows Server](https://img.shields.io/badge/Windows%20Server-0078D6?style=for-the-badge&logo=windows&logoColor=white) 
![VMware](https://img.shields.io/badge/VMware-607078?style=for-the-badge&logo=vmware&logoColor=white)

**Networking & Security**  
![Cisco](https://img.shields.io/badge/cisco-%231BA0D7.svg?style=for-the-badge&logo=cisco&logoColor=white)
![Fortinet](https://img.shields.io/badge/Fortinet-C81326?style=for-the-badge&logo=fortinet&logoColor=white)

**Home Lab & Hardware**  
![Home Lab](https://img.shields.io/badge/Home%20Lab-20232A?style=for-the-badge&logo=serverless&logoColor=white)
![Home Servers](https://img.shields.io/badge/Home%20Servers-4D4D4D?style=for-the-badge&logo=baremetalsolution&logoColor=white)
![ThinkPad](https://img.shields.io/badge/ThinkPad-E2231A?style=for-the-badge&logo=lenovo&logoColor=white)
