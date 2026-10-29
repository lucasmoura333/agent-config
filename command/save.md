---
description: Grava um savepoint desta sessao e recomenda /new
---
Use a skill `savepoint` para gravar um savepoint deste bloco.

- Tema/slug: $ARGUMENTS (se vazio, deduza do assunto dominante da sessao).
- Arquivo: `$AGENT_DOCS_DIR/savepoints/AAAA-MM-DD-<slug>.md` (padrao `~/agent-docs`).
- Corpo: estado em 1 paragrafo, ja executado, decisoes, contrato de retomada, pendente/bloqueado.
- Atualize o indice `_INDEX.md` e o painel `TODO.md`/kanban no mesmo bloco.
- Ao final, imprima o caminho do arquivo e recomende `/new`.
