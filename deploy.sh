#!/bin/sh
# Deploy app/ to the live web root on the Mail-in-a-Box (CLAUDE.md rule 2).
# Dry run by default; pass --live to apply. Proven on 25 Sep 2026.
#
# macOS ships openrsync, which lacks --chmod and --chown, so the files go over
# as a tarball to a temp dir on the server and the server's GNU rsync does the sync.
set -eu

cd "$(dirname "$0")"
DRY=-n
[ "${1:-}" = "--live" ] && DRY=

if [ -n "$(git status --porcelain app)" ]; then
  echo "app/ has uncommitted changes; commit them first." >&2
  exit 1
fi

COPYFILE_DISABLE=1 tar --exclude .DS_Store -C app -czf - . | ssh miab-new "
  set -e
  D=\$(mktemp -d /tmp/mozmorris-deploy.XXXX)
  trap 'rm -rf \"\$D\"' EXIT
  tar -xzf - -C \"\$D\"
  sudo -n rsync -rlc $DRY --itemize-changes --delete --chmod=D755,F644 --chown=user-data:user-data \"\$D\"/ /home/user-data/www/default/
"

if [ -n "$DRY" ]; then
  echo "Dry run only. Run ./deploy.sh --live to apply."
else
  curl -sI https://mozmorris.co.uk/ | grep -i last-modified
fi
