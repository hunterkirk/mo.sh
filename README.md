# mo.sh

`mo.sh` is a simple, powerful Bash script to query **all locally available Ollama models** sequentially with the **same prompt**, collecting their responses into a single timestamped log file.

---

## Features

- Automatically fetches all Ollama models on your local machine via Ollama’s REST API.
- Sorts models by size (smallest to largest).
- Sends a user-provided prompt to each model without streaming.
- Aggregates outputs into one timestamped log file with clear model headers.
- Shows progress and sizes in human-readable MB on the console.
- Easy to customize for any prompt.

---

## Requirements

- Ollama CLI & server running locally (default API at `http://localhost:11434`).
- `curl`
- `jq`
- Bash (tested on Linux/macOS)

---

## Usage

```bash
chmod +x mo.sh
./mo.sh "Your prompt here"
