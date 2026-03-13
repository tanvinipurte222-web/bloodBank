# bloodbank

Quick notes before you push this project to GitHub.

1) Sensitive files

- This repo contains local configuration files (e.g. `config.php`, `connection.php`) that currently hold database credentials.
- Do NOT commit those files. A `config.example.php` has been added — copy it to `config.php` and fill in your local credentials before running.

2) How to push from Windows PowerShell

Open PowerShell and run:

```powershell
cd C:\Users\tanvi\Documents\bloodbank\bloodbank
git init
git add .
git commit -m "Initial import: add project files (sensitive files ignored); add config.example and .gitignore)"
git branch -M main
git remote add origin https://github.com/tanvinipurte222-web/bloodBank.git
git push -u origin main
```

Note: GitHub no longer accepts account passwords over HTTPS. If prompted for credentials you must use a Personal Access Token (PAT) or set up SSH keys. If `git` is not recognized, install Git for Windows and re-open PowerShell.

3) Security recommendations (short)
- Replace the `root` DB user and empty password with a dedicated DB user and strong password.
- Hash user passwords (use PHP's `password_hash` and `password_verify`).
- Use prepared statements / parameterized queries everywhere to avoid SQL injection.
- Validate and sanitize all user input and add CSRF protection for forms.

If you'd like, I can: scan and automatically replace plaintext password usage with `password_hash`/`password_verify` examples, or open PR-friendly edits for a handful of files.
