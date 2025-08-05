# 🧨 Doom Emacs Configuration

> "The best editor isn’t Emacs, nor Vim. It’s Doom"

This is my cross-platform (macOS + Ubuntu) Doom Emacs configuration.  
It combines Emacs Lisp extensibility, Vim's editing efficiency, and Doom Emacs's streamlined keybinding system.

---

## ✨ Features

- **Evil-mode**: Modal editing with full Vim keybindings (`hjkl`, `:wq`, `gg`, etc.).
- **Space-leader control**: High-level command access via `SPC`, Doom's minimalistic keybinding philosophy.
- **LSP support**: Built-in support for `clangd` and `pyright` via `lsp-mode`.
- **Magit**: Full Git porcelain within Emacs (`SPC g g`).
- **Treemacs**: Project drawer for easy navigation (`SPC o p`).
- **Cross-platform**: Custom macOS keyboard mapping included, compatible with Linux.
- **Custom Escape key**: `jj` acts as Escape in insert/visual modes (via the `key-chord` package).

---

## 📦 Modules Enabled

- **Completion**: `vertico`, `corfu +orderless`
- **UI**: `doom`, `treemacs`, `modeline`, `vc-gutter`, `workspaces`
- **Editor**: `evil +everywhere`, `fold`, `snippets`, `file-templates`
- **Emacs Core**: `dired`, `undo`, `vc`
- **LSP Tools**: `lsp`, `magit`, `lookup`, `eval +overlay`
- **Language Support**:
  - `cc +lsp` (C/C++)
  - `python +lsp`
  - `emacs-lisp`, `sh`, `markdown`, `org`
- **App**: `everywhere` (allows embedding Emacs windows across system)
- **Config**: `default +bindings +smartparens`

---

## 🎮 Keybindings Summary

### 🧠 Vim Editing (Evil-mode)

| Command        | Key                    |
| -------------- | ---------------------- |
| Move cursor    | `h/j/k/l`              |
| Line start/end | `0`, `$`               |
| Word jump      | `w`, `b`, `e`          |
| Insert mode    | `i`, `a`, `I`, `A`     |
| Delete         | `x`, `dd`, `d{motion}` |
| Yank/Copy      | `yy`, `y{motion}`      |
| Paste          | `p`, `P`               |
| Undo / Redo    | `u`, `C-r`             |
| Visual Mode    | `v`, `V`, `C-v`        |
| Window jump    | `C-w h/j/k/l`          |
| Split window   | `:vsp`, `:sp`          |
| Close split    | `:q`                   |

---

### 🔧 Doom Emacs (`SPC` Leader Key)

#### 📁 File & Project

| Command        | Key       |
| -------------- | --------- |
| Find file      | `SPC f f` |
| Recent files   | `SPC f r` |
| Save file      | `SPC f s` |
| Project switch | `SPC p p` |
| Project grep   | `SPC /`   |

#### 📑 Buffer & Window

| Command             | Key       |
| ------------------- | --------- |
| Buffer switch       | `SPC b b` |
| Kill current buffer | `SPC b d` |
| Toggle file tree    | `SPC o p` |
| Split (horizontal)  | `SPC w s` |
| Split (vertical)    | `SPC w v` |
| Focus other window  | `SPC w w` |

#### 🔍 LSP Integration

| Command          | Key       |
| ---------------- | --------- |
| Go to definition | `g d`     |
| Find references  | `g r`     |
| Show hover doc   | `K`       |
| Format buffer    | `SPC c f` |

#### 🐙 Git (Magit)

| Command    | Key       |
| ---------- | --------- |
| Open Magit | `SPC g g` |
| Git blame  | `SPC g b` |

#### ⚙️ Config & Help

| Command             | Key         |
| ------------------- | ----------- |
| Reload config       | `SPC h r r` |
| Describe keybinding | `SPC h m`   |
| Open Doom docs      | `SPC h d h` |
| Restart Emacs       | `SPC q r`   |

---

## 🔸 Minimal Emacs Keybindings (Retained)

| Command         | Key   | Purpose                   |
| --------------- | ----- | ------------------------- |
| Execute command | `M-x` | Always available fallback |
| Cancel command  | `C-g` | Universal cancel/abort    |

---

## 🔁 Cross-platform Notes

- On **macOS**, `Right Option` is mapped to `Meta`, `Left Option` is disabled.
- `jj` acts as Escape in insert/visual modes (via the `key-chord` package).
- Compatible with Ubuntu. `.doom.d/` can be versioned via Git for portability.

---

## 📂 Installation

First, make sure your emacs is installed by following [the official getting started guide](https://github.com/doomemacs/doomemacs/blob/master/docs/getting_started.org#install). You should install the correct version. 

After that, install the basic doom emacs. 

```bash
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

It's recommended to add `~/.emacs.d/bin/` into your `$PATH`, so that you can directly use `doom` command instead of running `~/.emacs.d/bin/doom`. Here is an example on zsh. 

```bash
echo 'export PATH="$HOME/.emacs.d/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

Then remove your original `.doom.d/`, clone this repository, and run `doom sync`.

```bash
rm -rf ~/.doom.d
git clone git@github.com:hanbinzheng/.doom.d.git ~/.doom.d
doom sync
```
