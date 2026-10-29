# Por que isso reduz o consumo de token

O custo de uma sessao de agente nao depende so do tamanho do seu prompt: a cada mensagem, o
historico acumulado e reenviado. Uma sessao longa vira uma bola de neve — o mesmo arquivo lido 3x,
saidas de ferramenta enormes e decisoes antigas continuam sendo pagas em todo turno.

O padrao **savepoint + TODO** ataca isso em dois pontos:

1. **Corta o historico por bloco.** O savepoint e um resumo de 1-2 KB com estado, decisoes e
   proximo passo. A proxima sessao comeca lendo so ele, em vez de replays de horas de conversa.
2. **Tira estado do chat.** TODO, kanban e diario vivem em arquivos. O agente consulta o card
   certo quando precisa, em vez de carregar o plano inteiro no contexto.

## Numeros medidos (direcionais)

Medicao em uso real de opencode (set/out de 2026, ~6.000 mensagens de assistente), comparando
antes e depois da adocao de savepoint + sessao nova por bloco:

| Metrica | Antes | Depois | Variacao |
| --- | ---: | ---: | ---: |
| Custo por mensagem | $0.00255 | $0.00131 | -49% |
| Contexto medio por mensagem | 389.953 tok | 137.557 tok | -65% |
| Mensagens por sessao | 142 | 88 | -38% |

Ressalvas: amostra de 48h, cargas e modelos misturados. Trate como direcional, nao como benchmark
controlado. O ganho maior vem de **encerrar o bloco na hora certa**, nao de micro-otimizar prompt.

## Regras praticas

- Um assunto = uma sessao. Terminou? savepoint + `/new`.
- `/compact` so quando for continuar a mesma tarefa e a sessao ja estiver longa.
- Filtre saidas de comando (`head`, `tail`, `grep`) e evite reler o mesmo arquivo.
- Deixe o plano no TODO/kanban, nao na conversa.
- Varreduras grandes e analises forenses: subagente, que devolve so o resumo.
