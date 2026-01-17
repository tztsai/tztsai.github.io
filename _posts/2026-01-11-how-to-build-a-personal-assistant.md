---
layout: post
title: How to Build a Personal Assistant
categories:
  - essays
author: Caster
---
## Framework

- Processor: Claude/Gemini with the ability of tool calls
- Memory: a single GitHub repo with MCP - search, read, write, etc.
	- A block of memory is called a *Record*, which is stored in an MD file with YAML frontmatter.
	- A thread of memory (like an AI conversation or an X post with comments) is stored in an HTML file organizing Records in a **tree** structure.
- (Optional) Advanced Retrieval: Onyx - MCP (hybrid search, web search), deep research, GitHub repo connector
- Network I/O: Chrome DevTools MCP
	- The browser can run in user's personal computer or on cloud, with AI acting as a proxy of user with operations like scrolling, clicking, reading, writing, etc.
	- Collect user's saved content on different platforms into Memory, e.g. browser bookmarks, YouTube video lists, X posts, AI conversations...
	- Automatically accomplish user specified tasks, e.g. research and report a kind of goods on Facebook Market, build a knowledge base from all of a user like Naval's posts on X and Substack, etc.
- User I/O: a common messaging app like WhatsApp, WeChat, or Telegram, with the AI assistant serving as a bot - save (notes, images/videos, urls, etc.), search, ask, etc.
	- Send any message to chat with the assistant
	- Share any content from another app to the chat bot to save or reference it
	- Use `!` prefix to save a note as MD file in Memory
	- Use `?` prefix to search in Memory and get a temporary URL directing to a web page rendering search results
	- Use `/` slash commands to call predefined programs saved in Memory

## Personal Web

As user collecting and connecting content of personal interest from WWW into their personal repo, they build a ***personal web***. We need to develop a framework to browse this personal web, rendering MD or HTML files in the Memory as web UI elements.

## Agent Workflow

**Plan -> Execute -> Output**

Think of the plan as a program, written in a basic programming language with support of variable definition, sequential execution, conditional execution, for loop, function definition & calling, etc. 

The LLM agent at first acts as a planner, writing a program according to user's command. The key part is calling various functions including (1) MCP tools, (2) LLM itself (with prompts and optionally a set of tools (if provided, it becomes a "subagent")), (3) predefined agent programs saved in MD in Memory, etc.
Then the agent program is executed deterministically, generating a data flow, which usually ends with an LLM report presented to the user as output.
