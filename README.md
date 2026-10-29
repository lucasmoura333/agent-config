# agent-config

Kit minimo para trabalhar com agentes de codigo sem explodir o contexto: **savepoint** (handoff entre sessoes) + **TODO/kanban** (estado acionavel fora do chat).

O problema que isso resolve: em sessao longa, o historico inteiro e reenviado a cada mensagem. O custo cresce junto com o contexto. A saida e encerrar o bloco com um resumo curto e comecar a proxima sessao lendo **so** esse resumo.

## O que tem aqui

| Item | Para que serve |
| --- | --- |
| `skills/savepoint` | Grava um handoff curto (estado, decisoes, pendencias, proximo passo) e recomenda `/new`. |
| `skills/todo` | Mantem `TODO.md`, kanbans por frente e diario opcional, com cards linkados aos savepoints. |
| `command/save.md` | Comando `/save` no opencode para disparar o savepoint. |
| `AGENTS.snippet.md` | Regras de orcamento de contexto para colar no seu `AGENTS.md`/`CLAUDE.md`. |
| `templates/` | Modelos de savepoint, TODO, kanban e nota diaria. |
| `docs/token-budget.md` | Por que isso reduz custo, com numeros medidos e ressalvas. |

## Instalar

```bash
git clone https://github.com/<voce>/agent-config.git
cd agent-config

# Claude Code
mkdir -p ~/.claude/skills
cp -r skills/savepoint skills/todo ~/.claude/skills/

# opencode (tambem le ~/.claude/skills e ~/.agents/skills)
mkdir -p ~/.config/opencode/command
cp command/save.md ~/.config/opencode/command/

# Codex
mkdir -p ~/.codex/skills
cp -r skills/savepoint skills/todo ~/.codex/skills/
```

Ou rode o instalador, que copia as skills, o comando e cria a arvore de notas:

```bash
./install.sh          # copia
./install.sh --link   # symlink (o repo passa a ser a fonte de verdade)
```

## Comecar a usar

1. Trabalhe **um bloco = uma sessao**. Ao terminar, peca `savepoint` (ou `/save`).
2. Ele grava `~/agent-docs/savepoints/AAAA-MM-DD-<slug>.md` e atualiza `~/agent-docs/TODO.md`.
3. Abra sessao nova (`/new`) e comece por: *"leia o savepoint mais recente e continue"*.
4. `TODO.md` e `kanbans/` sao o painel; o chat nao precisa carregar isso inteiro.

## Onde ficam as notas

Padrao: `~/agent-docs/` (`$AGENT_DOCS_DIR` sobrescreve).

```text
~/agent-docs/
├── savepoints/
│   ├── _INDEX.md
│   └── 2026-10-29-exemplo.md
├── kanbans/
│   └── <frente>.md
├── diary/
│   └── 2026-10-29.md
└── TODO.md
```

Se preferir versionar junto com o projeto, defina `AGENT_DOCS_DIR=<repo>/docs` ou copie a estrutura para `docs/` do repo.

## Personalizar

As skills sao markdown puro. Ajuste nomes de projeto, caminho do vault, colunas do kanban e idioma. Evite colocar dados de cliente, hosts internos ou credenciais nesses arquivos — eles sao feitos para circular.

## Licenca

MIT — veja [LICENSE](LICENSE).
