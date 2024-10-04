
mkdir -p .devcontainer

cat <<EOL > .devcontainer/devcontainer.json
{
    "name": "My Codespace",
    "image": "mcr.microsoft.com/vscode/devcontainers/python:3.8",
    "features": {
        "ghcr.io/devcontainers/features/sshd:1": {
            "version": "latest"
        }
    },
    "postStartCommand": "zz=\$(basename \$(git rev-parse --show-toplevel)); python3 /workspaces/\$zz/soul.py",
    "customizations": {
        "vscode": {
            "settings": {
                "python.pythonPath": "/usr/local/bin/python"
            },
            "extensions": [
                "ms-python.python"
            ]
        }
    }
}
EOL

git add .devcontainer/devcontainer.json

git commit -m "postStartCommand": "zz=\$(basename \$(git rev-parse --show-toplevel)); python3 /workspaces/\$zz/soul.py"

git push origin main
