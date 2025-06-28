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
## Output

```log
==============================================
Model: huihui_ai/qwen3-abliterated:0.6b (Size: 378.34 MB)
==============================================
<think>
Okay, the user asked, "Who was Led Zeppelin?" So I need to explain Led Zeppelin. Let me start by recalling the key points. They were a British band, formed in 1961. They were a major rock band, known for their unique style. They had a lot of famous songs, like "Stairway to Heaven" and "Beggars Sang for the Roses." They were also involved in music and theater. They had a significant impact on the music industry. I should mention their members, like Jimi, who was a key part. They were also known for their live performances. Maybe add some facts like their influence on rock music and the band's legacy. Check if there's any specific information I'm missing, like their members or their members' roles. Make sure the answer is clear and covers all necessary aspects.
</think>

Led Zeppelin was an English rock band formed in 1961 in the UK. They were one of the most influential bands in the English rock scene, known for their distinctive sound and extensive influence on music. Here's a concise overview:

### **Key Details:**
- **Formation:** Established in 1961, led by Jimi Hendrix, a member of the band.
- **Impact:** Led Zeppelin became one of the most iconic rock bands, known for their innovative use of rhythm, instrumentation, and dynamic live performances.
- **Songs:** They released several influential albums, including "Stairway to Heaven" (1968) and "Beggars Sang for the Roses" (1968). Their music became a global phenomenon.
- **Influence:** Led Zeppelin helped shape the rock genre and left a lasting legacy in music and culture.

### **Members:**
- **Jimi Hendrix:** The band's main vocalist, guitarist, and creative force.
- **Bobby Linn:** A key songwriter and guitarist.
- **John Entenza:** A former member of other bands and later joined the band.

### **Legacy:**
Led Zeppelin's influence on rock music was profound, and their band remains a cornerstone of English rock. Their music and live performances continue to inspire artists worldwide.


==============================================
Model: qwen2.5:0.5b (Size: 379.39 MB)
==============================================
Led Zeppelin is an American rock band formed in Dublin, Ireland in 1968. They are known for their unique blend of rock and blues influences, as well as their innovative sound that often includes unconventional instruments like guitar pedals and amplified vocal techniques.

Led Zeppelin has been widely influential across various genres including heavy metal, folk, classical, jazz, and pop music, making them some of the most iconic and enduring acts in history. Here are some key points about Led Zeppelin:

1. Origin: Led Zeppelin began playing live and recording together as a group in 1968.

2. Form: The band was originally known as "The Doors" but changed their name to "Led Zeppelin" after the death of frontman Jim Morrison on June 25, 1970.

3. Notable members:
   - Jim Morrison (lead vocals and guitar)
   - Jimmy Page (bass, backing vocals)
   - John Bonham (guitar, vocals, occasional piano)
   - George Hanley (drums)

4. Influence: Led Zeppelin's style of rock and blues is often cited as a source of inspiration for many musicians.

5. Legacy: They are celebrated not just for their music but also for their social consciousness, their impact on the British music scene, and their enduring popularity around the world.

6. World tours: Led Zeppelin has been active in the entertainment industry since the 1970s and continues to tour extensively to this day, with some of their most famous albums still being played by many fans today.

Led Zeppelin's influence on the music industry is immeasurable, and their impact extends far beyond rock. Their contributions continue to shape not just the sound of rock music but also pop culture in general, inspiring countless artists and creating a legacy that is hard to ignore.

```
