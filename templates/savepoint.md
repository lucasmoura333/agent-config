---
id: savepoint-AAAA-MM-DD-<slug>
title: <titulo curto>
date: AAAA-MM-DD
type: savepoint
status: active
project: <projeto>
tags: [savepoint]
related: []
---

# <titulo>

## Estado em 1 paragrafo

Branch `<branch>` em `<sha>`. Commitado: <...>. Working tree: <...>. Caveats: <...>.

## Ja executado

- `arquivo:linha` — <o que foi feito>

## Decisoes e logica (nao perder)

- <antes> -> <depois>: <por que>
- <trade-off consciente>
- Fora de proposito: <o que nao foi feito e por que>

## Contrato de retomada

**Nao refazer:**
- <item fechado>

**Proximos passos:**
1. <passo>

**Portoes de autorizacao:** commit, push, PR, issue, migration, producao — so com ordem expressa.

**Pre-condicoes:** <DB, fila, scheduler, flags, credenciais>

## Pendente / Bloqueado

- <item> — <bloqueio>

## Gargalos

- <armadilha> — <comando que contorna>

## Evidencia de teste

- `<comando>` -> <total/falhas; falhas pre-existentes: sim/nao>

## Fontes de verdade

- <docs, ADRs, TODO, codigo, testes>
