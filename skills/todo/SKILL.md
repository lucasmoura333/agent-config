---
name: todo
description: Mantem um TODO e kanbans enxutos e acionaveis, com cards linkados aos savepoints. Use ao concluir ou retomar um bloco, consolidar tarefas, ou quando o usuario pedir TODO/kanban/diario.
---
# TODO & Kanbans

Base: `$AGENT_DOCS_DIR` (padrao `~/agent-docs`). Markdown puro: funciona em Obsidian, VS Code,
GitHub e no proprio terminal. O painel existe para o **humano** e para a **proxima sessao** lerem
pouco, nao para acumular historico.

## Estrutura

```text
$AGENT_DOCS_DIR/
├── TODO.md                 # radar do mes
├── kanbans/<slug>.md       # uma frente/epico por arquivo
├── diary/AAAA-MM-DD.md     # nota diaria (opcional)
└── savepoints/             # handoffs da skill savepoint
```

`TODO.md` tem apenas estas secoes:

```markdown
## Frentes ativas
- [ ] <frente> -> [kanban](kanbans/<slug>.md)

## Fixes rapidos
- [ ] <acao pequena e verificavel>

## Concluidos
- [x] <acao> -> [savepoint](savepoints/AAAA-MM-DD-<slug>.md) · [diario](diary/AAAA-MM-DD.md)
```

`kanbans/<slug>.md` usa colunas de fluxo (ajuste a vontade):
`## Backlog`, `## Em progresso`, `## Validacao`, `## Concluido`.

## Ao concluir um bloco

1. Identificar o destino:
   - **Frente/epico** -> card no `kanbans/<slug>.md`;
   - **ajuste pequeno** -> `## Fixes rapidos` do `TODO.md`.
2. Marcar `- [x]` e anexar os links relativos:
   `-> [savepoint](savepoints/AAAA-MM-DD-<slug>.md) · [diario](diary/AAAA-MM-DD.md)`.
3. Cadastrar o proximo `- [ ]` derivado do **Contrato de retomada** do savepoint.
4. Se houver nota diaria, fechar a subsecao com:
   `Retomada: [savepoint](savepoints/AAAA-MM-DD-<slug>.md)`.

## Ao retomar um bloco

1. Abrir o `kanban` da frente (ou o `TODO.md` se for fix avulso).
2. Ler o ultimo `- [x]` e seguir os links do savepoint/diario para restaurar o estado.
3. Puxar o proximo `- [ ]` para `## Em progresso`.

## Regras

- Um card = uma acao verificavel, em uma linha.
- Nao colar logs, transcricoes ou dumps no TODO; isso pertence ao savepoint ou a um doc.
- Concluidos ficam no mes corrente; quando o TODO crescer, mova os antigos para `archive/AAAA-MM.md`.
- Nao inventar tarefas: card novo precisa de origem (savepoint, pedido do usuario, issue).
- Nada de commit/push/PR/migration/producao sem ordem expressa.
