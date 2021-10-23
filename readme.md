## Thursday, October 14, 2021 @ 10:47:36 AM

I've alwayss intended to have a safe place to manage my dotfiles, and it's gotten more crucial the more I use POP OS.

I had found lots of articles and tutorials showing various ways this can be done, but my favorite is [this topic on HackerNews](https://news.ycombinator.com/item?id=11070797). It seems pretty straight forward! I really like not having to symlink everything.

---

Create a bare repo:
```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
```

Open `.zshrc` and add this new alias at the bottom:
```
alias dot='/usr/local/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

Don't forget to `source ~/.zshrc`

`cd` into `$HOME/.dotfiles` and add my repo:
```
dot config --local status.showUntrackedFiles no
dot remote add origin git@github:jjaimealeman/.dotfiles.git
```

Now I can run `dot` from anywhere. Example:
```
dot add ~/.zshrc && dot commit -m'add .zshrc' && dot push
```

SIMPLE! 👍
