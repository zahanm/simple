[![Slack Room][slack-badge]][slack-link]

# Simple

> "Simple can be harder than complex" -  Steve Jobs

A prompt inspired by the @mathiasbynens's [prompt]

<img src="https://github.com/sotayamashita/simple/blob/master/media/media.png" width="370" />

## Install

**With [Fisherman]** (Not implemented yet)

```fish
fisher i simple
```

**With Manually**

```fish
# Make it be backup
mv ~/.config/fisherman/functions/fish_prompt.fish ~/.config/fisherman/functions/fish_prompt.fish.old
mv ~/.config/fisherman/functions/fish_right_prompt.fish ~/.config/fisherman/functions/fish_right_prompt.fish.old

# Install git
git clone git@github.com:sotayamashita/simple.git
mv /path/to/simple/functions/fish_prompt.fish ~/.config/fisherman/functions/fish_prompt.fish
mv /path/to/simple/functions/fish_right_prompt.fish ~/.config/fisherman/functions/fish_right_prompt.fish
```

## Terminal Settings

+ 13pt Monaco with 1.1 vertical spacing.

[slack-link]: https://fisherman-wharf.herokuapp.com/
[slack-badge]: https://img.shields.io/badge/slack-join%20the%20chat-00B9FF.svg?style=flat-square

[Fisherman]: https://github.com/fisherman/fisherman
[prompt]: https://github.com/mathiasbynens/dotfiles/blob/master/.bash_prompt
