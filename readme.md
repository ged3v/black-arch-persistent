# 🏴‍☠️ BlackArch Docker Setup Guide

## Table of Contents
1. [Quick Start (Temporary)](#-quick-start-temporary)
2. [Persistent Installation](#-persistent-installation)
   - [Root User](#root-user)
   - [Non-Root User](#non-root-user)
3. [Bonus Features](#-bonus-features)

---

## 🚀 Quick Start (Temporary)
**Ideal for:** One-time usage (container self-destructs after exit)

```bash
# Pull the image
docker pull blackarchlinux/blackarch

# Run with auto-cleanup
docker run -it --rm blackarchlinux/blackarch /bin/bash
```

**Optional:** Mount a working directory  
*(Example mounts current folder to /pentest in container)*
```bash
docker run -it -v $(pwd):/pentest --rm blackarchlinux/blackarch /bin/bash
```

---

## 💾 Persistent Installation
**Ideal for:** Regular usage with saved changes

### Root User
```bash
# Build the image
sudo docker build -t blackarch-persistent .

# Run as root
sudo docker run -it blackarch-persistent
```

### Non-Root User (Recommended)
```bash
# Build (same as above)
sudo docker build -t blackarch-persistent .

# Run with proper hostname
sudo docker run -it --hostname blackarch blackarch-persistent
```
**Features:**
- Default user: `hacker` (with passwordless sudo)
- Custom shell prompt
- Persistent home directory

---

## 🎁 Bonus Features

### Mount Local Folder
```bash
sudo docker run -it -v $(pwd):/workspace blackarch-persistent
```

### Rebuild After Changes
```bash
sudo docker build -t blackarch-persistent .
```

---

**Pro Tip:** Use `Ctrl+P+Q` to detach from container without stopping it.

---
