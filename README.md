# mo.sh

`mo.sh` is a simple, powerful Bash script to query **all locally available Ollama models** sequentially with the **same prompt**, collecting their responses into a single timestamped log file.

```bash
04:01:47 (venv) hunter@socrates projects → ./mo.sh "Who was Led Zeppelin?"
Found 14 models sorted by size (smallest to largest):
 - znbang/bge:small-en-v1.5-f32 (127.42 MB)
 - nomic-embed-text:latest (261.60 MB)
 - huihui_ai/qwen3-abliterated:0.6b (378.34 MB)
 - qwen2.5:0.5b (379.39 MB)
 - qwen3:0.6b (498.44 MB)
 - mxbai-embed-large:latest (638.60 MB)
 - qwen2.5-coder:1.5b-base (940.38 MB)
 - socialnetwooky/llama3.2-abliterated:1b_q8 (1259.88 MB)
 - llama3.2:1b (1259.90 MB)
 - qwen3:1.7b (1296.32 MB)
 - phi3:3.8b (2075.37 MB)
 - dorian2b/vera:latest (4466.13 MB)
 - llama3.1:8b (4692.80 MB)
 - huihui_ai/deepseek-r1-abliterated:latest (4794.87 MB)
===============================
Querying model: znbang/bge:small-en-v1.5-f32
===============================
Saved output for znbang/bge:small-en-v1.5-f32 to mo-20250628-040217.log
===============================
Querying model: nomic-embed-text:latest
===============================
Saved output for nomic-embed-text:latest to mo-20250628-040217.log
===============================
Querying model: huihui_ai/qwen3-abliterated:0.6b
===============================
```
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
```
