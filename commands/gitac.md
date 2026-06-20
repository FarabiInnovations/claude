Add and commit all staged and unstaged changes with a generated commit message.

Steps:
1. Run `git status` and `git diff` (staged + unstaged) in parallel to see what changed.
2. Run `git log --oneline -5` to learn the commit message style of this repo.
3. Stage the changed files with `git add` (specific files, never `git add -A` or `git add .`).
4. Draft a concise commit message based on the diff — focus on the "why", not the "what". Follow the repo's existing commit style.
5. Commit with the message, appending `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>` on a separate line.
6. Run `git status` to confirm the commit succeeded.

If the user provided args (`$ARGUMENTS`), use them as the commit message directly instead of generating one.
