## Orcamento de Contexto (reduzir custo de token)

Requer as skills `savepoint`/`todo` e `AGENT_DOCS_DIR` (padrao `~/agent-docs`).

Meta: manter o contexto de trabalho enxuto. Historico longo e saidas de ferramenta sao o que
estoura a janela.

- **Savepoint + `/new` por tarefa (regra de ouro)**: ao trocar de assunto/tarefa, grave um savepoint
  em `$AGENT_DOCS_DIR/savepoints/AAAA-MM-DD-<slug>.md` e sugira `/new` para o proximo bloco. O
  savepoint e a fonte de retomada; nao dependa do historico da sessao.
- **`/compact`** (alias `/summarize`): SO para continuar a MESMA tarefa numa sessao ja longa.
  E resgate pontual, nao rotina (o resumo volta a custar a cada turno).
- **Gatilhos de janela**: ~50% = parar de expandir e consolidar; ~60-70% = `/compact` se for
  continuar a mesma tarefa, senao savepoint + `/new`.
- **Alertas**: sessao com mais de um tema, ou o agente relendo/re-enviando o mesmo arquivo 2x =
  hora de encerrar o bloco (savepoint + `/new`).
- **Truncamento de comandos**: filtre saidas volumosas (`head -n 50`, `tail -n 50`, `grep`).
- **Nunca `cat`/`less` em binario**: confirme com `file <path>` antes.
- **Leitura cirurgica**: inspecione apenas trechos/arquivos necessarios.
- **Isolamento de tarefas pesadas**: varreduras amplas e analises forenses via subagentes.
- **Nunca reler o mesmo arquivo**: referencie `arquivo:linha`.
