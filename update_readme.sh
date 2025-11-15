#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

{
  echo "# Articles"
  echo
  # newest first by modification time
  for f in $(ls -t *.md 2>/dev/null); do
    [ "$f" = "README.md" ] && continue
    # first line as title (strip leading '# ')
    title=$(sed -n '1s/^#\s*//p;1q' "$f")
    [ -z "$title" ] && title="$f"
    echo "- [$title]($f)"
  done
} > README.md
