# dotfiles

An in progress dotfile repo!

## Steps:

- Run the script
  - If this is for a work machine, then pass in the work email, e.g. `./init.sh work=my-new-work-email@gmail.com`

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/hamlim/dotfiles/refs/heads/main/init.sh)"
```

## What this repo does:

In this repo I have a plain `init.sh` script that initalizes the system with my usual go-to defaults for a variety of services and apps.

Specifcally:

- Setup Git
- Setup Homebrew
- Install common homebrew flasks
- Install common dev tools:
  - Install bun
  - Install deno
- Setup "better-screenshot"
  - Allows you to take a screenshot and copies it to a clipboard and also saves it to Dropbox
  - See also: https://www.icloud.com/shortcuts/a74f9842e3fb41fb811a91c8ebdf37f7

## Manual Intervention Needed:

- Go Lang: https://go.dev/dl/
- Raycast: https://www.raycast.com/
- Arc: https://arc.net/
- Obsidian: https://obsidian.md/
- Cursor: https://www.cursor.com/
- Warp: https://www.warp.dev/
- Dropbox: https://www.dropbox.com/install
- Dropbox Capture: https://capture.dropbox.com
- HTTPie: https://httpie.io/
- 1Password: https://1password.com/downloads/mac
- ChatGPT: https://openai.com/chatgpt/desktop/
- Rectangle: https://rectangleapp.com/
