# 💰 Consultor Financeiro - Agente Inteligente em Prolog

Este repositório contém um Sistema Especialista baseado em regras desenvolvido em **Prolog**. O objetivo do agente inteligente é atuar como um consultor financeiro, avaliando as características de um cliente (nível de risco aceitável, expectativa de lucro, prazo e objetivo final) para deduzir o seu perfil de investidor e recomendar os ativos financeiros mais adequados.

---

## ⚙️ Funcionalidades e Arquitetura

O sistema foi estruturado separando a Base de Conhecimento (Fatos) do Motor de Inferência (Regras lógicas e algoritmos de busca).

### 1. Base de Conhecimento (Fatos)
Os dados do domínio financeiro estão mapeados no código da seguinte forma:
- **Perfis:** `conservador`, `moderado`, `balanceado`, `arrojado`, `agressivo`.
- **Variáveis de Análise:** `risco`, `lucro`, `prazo` e `objetivo`.
- **Ativos Disponíveis:** Tesouro Direto, CDB, Fundos Multimercado, Bolsa de Valores, etc.
- **Massa de Teste:** Clientes fictícios com características pré-definidas para processamento automatizado.

### 2. Motor de Inferência e Algoritmos de Busca
Para encontrar o perfil ideal e realizar as recomendações, o projeto utiliza um método de busca nativo do Prolog:

* **Busca em Profundidade (DFS):** Implementada de forma intrínseca e declarativa. Utiliza o motor nativo do Prolog e *backtracking* para descer até o fundo da árvore de decisão de cada regra de perfil, validando o caminho antes de tentar a próxima opção.
---

## 🚀 Como Executar o Projeto (Via Navegador)

Para rodar este sistema, não é necessária nenhuma instalação. Utilizaremos o **SWISH**, a versão web oficial do SWI-Prolog.

### Passo a Passo

1. Copie todo o código-fonte do arquivo `.pl` deste repositório.
2. Acesse o [SWISH - SWI-Prolog Web](https://swish.swi-prolog.org/).
3. Clique em **Program** para criar um novo arquivo em branco.
4. Cole o código copiado no painel principal (à esquerda).
5. No painel inferior direito (terminal de consultas `?-`), você pode executar os comandos abaixo.

### Consultas Principais

Copie e cole qualquer uma das consultas abaixo no terminal do SWISH e pressione `Enter` (ou clique em **Run!**):

* **Processar a lista completa de clientes de teste e medir o tempo de execução:**
    ```prolog
    main.
    ```
* **Descobrir o perfil de um cliente específico:**
    ```prolog
    identifica_perfil(ana, Perfil).
    ```
* **Obter sugestões de investimentos para um perfil:**
    ```prolog
    sugere_investimento(conservador, Ativo).
    ```
*(Caso a consulta retorne mais de um resultado, o SWISH exibirá o botão `Next` para você iterar sobre as outras opções de investimento disponíveis).*

---

## 🛠️ Tecnologias Utilizadas

- **Linguagem:** Prolog
- **Ambiente:** SWISH (SWI-Prolog Web)
- **Paradigmas:** Programação Lógica, Sistemas Especialistas Baseados em Regras.

---

## 👩‍💻 Autora

**Yasmin Gabrielly**
- GitHub: [@Yaslly-dev](https://github.com/Yaslly-dev)
- Estudante de Análise e Desenvolvimento de Sistemas (ADS).
