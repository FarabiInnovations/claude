Add, commit, push to the current branch, then monitor the CI pipeline until it completes.

Steps:
1. Run `git status`, `git diff` (staged + unstaged), and `git log --oneline -5` in parallel.
2. Stage the changed files with `git add` (specific files, never `git add -A` or `git add .`).
3. Draft a concise commit message based on the diff — focus on the "why", not the "what". Follow the repo's existing commit style.
4. If the user provided args (`$ARGUMENTS`), use them as the commit message instead of generating one.
5. Commit with the message, appending `Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>` on a separate line.
6. Run `git status` to confirm the commit, then push to the current branch with `git push`.
7. Monitor the pipeline by polling `gh run list --branch <current-branch> --limit 1 --json status,conclusion,headSha` every ~60s until the run completes or fails, then report the result.
