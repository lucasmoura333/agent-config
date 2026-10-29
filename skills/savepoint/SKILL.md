---
name: savepoint
description: Grava um savepoint compacto da sessao atual como fonte de retomada e recomenda /new. Use ao encerrar um bloco, trocar de assunto ou quando o usuario pedir savepoint.
---
# Savepoint

Objetivo: fechar um bloco com um handoff curto. Uma sessao nova deve continuar lendo **so** o
savepoint, sem reenviar o historico. Isso corta o contexto (e o custo) reenviado a cada mensagem.

## Caminhos

- Raiz: `$AGENT_DOCS_DIR` (padrao `~/agent-docs`).
- Arquivo: `$AGENT_DOCS_DIR/savepoints/AAAA-MM-DD-<slug>.md` (slug curto em kebab-case).
- Indice: `$AGENT_DOCS_DIR/savepoints/_INDEX.md`.
- Painel: `$AGENT_DOCS_DIR/TODO.md` e `$AGENT_DOCS_DIR/kanbans/<slug>.md`.
- Em repo proprio, se preferir versionar: `docs/savepoints/` na raiz do repo.

## Passos

1. Definir o tema/slug do bloco (ex.: `checkout-refactor`).
2. Coletar o estado real sem inflar contexto:
   - `git -C <repo> branch --show-current` e `git log -1 --oneline`;
   - `git -C <repo> status --short` completo (inclui untracked; anote o que fica fora de commit);
   - testes/comandos executados e resultado (classifique falhas pre-existentes).
3. Escrever o arquivo com este frontmatter (ajuste os valores):
   `id`, `title`, `date`, `type: savepoint`, `status: active`, `project`, `tags`, `related`.
4. Corpo conciso, sem narracao, com estas secoes:
   - **Estado em 1 paragrafo**: branch/SHA, o que esta commitado x no working tree, caveats do ambiente.
   - **Ja executado**: bullets com `arquivo:linha` para cada peca central.
   - **Decisoes e logica (nao perder)**:
     - invariantes/contratos alterados no formato `antes -> depois` e **por que**;
     - assimetrias e trade-offs conscientes;
     - limitacoes conhecidas e o que ficou **de fora de proposito** (decisao, nao pendencia).
   - **Contrato de retomada**:
     - **nao refazer** (o que ja esta fechado);
     - ordem dos proximos passos (1, 2, 3...);
     - portoes de autorizacao (commit, push, PR, issue, migration, producao);
     - pre-condicoes de ambiente para rodar/testar.
   - **Pendente / Bloqueado**: so o que realmente falta.
   - **Gargalos**: armadilhas do ambiente e o comando exato que contorna.
   - **Evidencia de teste**: comandos + totais + falhas pre-existentes.
   - **Fontes de verdade**: docs, ADRs, plano/TODO, codigo e testes.
5. Atualizar `_INDEX.md` (tabela: data | tema | status | arquivo).
6. Atualizar o painel com a skill `todo` **no mesmo bloco**: marcar o card concluido, linkar o
   savepoint e deixar o proximo card aberto.
7. Gate de qualidade (todos obrigatorios):
   - [ ] toda mudanca central tem `arquivo:linha`?
   - [ ] cada "por que" relevante esta registrado (nao so o "o que")?
   - [ ] o que nao deve ser refeito esta explicito?
   - [ ] limitacoes conscientes estao separadas das pendencias?
   - [ ] testes/evidencias e falhas pre-existentes estao classificados?
   - [ ] TODO/kanban aponta para este savepoint e o proximo card existe?
8. Encerrar imprimindo: `Savepoint gravado em <path>. Recomendo /new para o proximo bloco.`

Regras: nao inventar (marque `(a confirmar)` quando faltar dado); escreva no idioma do usuario;
nada de commit/push/PR/migration/producao sem ordem expressa.
