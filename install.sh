#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${1:---copy}"
DOCS="${AGENT_DOCS_DIR:-$HOME/agent-docs}"

case "$MODE" in
  --copy|--link) ;;
  *) echo "uso: $0 [--copy|--link]" >&2; exit 2 ;;
esac

install_item() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "skip (existe): $dest"
    return
  fi
  mkdir -p "$(dirname "$dest")"
  if [ "$MODE" = "--link" ]; then
    ln -s "$src" "$dest"
  else
    cp -r "$src" "$dest"
  fi
  echo "ok: $dest"
}

for root in "$HOME/.claude/skills" "$HOME/.codex/skills"; do
  install_item "$SRC/skills/savepoint" "$root/savepoint"
  install_item "$SRC/skills/todo" "$root/todo"
done

install_item "$SRC/command/save.md" "$HOME/.config/opencode/command/save.md"

mkdir -p "$DOCS/savepoints" "$DOCS/kanbans" "$DOCS/diary"
[ -f "$DOCS/TODO.md" ] || cp "$SRC/templates/TODO.md" "$DOCS/TODO.md"
[ -f "$DOCS/savepoints/_INDEX.md" ] || printf '# Savepoints\n\n| Data | Tema | Status | Arquivo |\n| --- | --- | --- | --- |\n' > "$DOCS/savepoints/_INDEX.md"
[ -f "$DOCS/savepoints/_TEMPLATE.md" ] || cp "$SRC/templates/savepoint.md" "$DOCS/savepoints/_TEMPLATE.md"
[ -f "$DOCS/kanbans/_TEMPLATE.md" ] || cp "$SRC/templates/kanban.md" "$DOCS/kanbans/_TEMPLATE.md"
[ -f "$DOCS/diary/_TEMPLATE.md" ] || cp "$SRC/templates/diary.md" "$DOCS/diary/_TEMPLATE.md"
echo "ok: $DOCS"

cat <<EOF

Pronto. Proximo passo:
1. Abra o agente e trabalhe um bloco.
2. Ao terminar, peca "savepoint" (ou use /save no opencode).
3. Comece a proxima sessao com /new e diga: "leia o savepoint mais recente e continue".
EOF
