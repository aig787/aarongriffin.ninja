title: Automatic Commit Signing
date: 2014-11-22 22:01:14
tags:
- Git 
- GPG 
- PGP
categories: Security
---

Most of us don't ever verify signatures of the commits in our favorite repositories and probably don't sign our own. For smaller projects verifying identity probably isn't necessary but for anything where accountability is important, it should be done.

This article is a good example of why (and how) commit signing should be done [A Git Horror Story: Repository Integrity with Signed Commits](http://mikegerwitz.com/papers/git-horror-story). The [official advice of Linus Torvalds](http://git.661346.n2.nabble.com/GPG-signing-for-git-commit-td2582986.html) and it seems the git community in general is to sign tags rather than commits, which is a valid way of doing things, but that article provides a really good argument as to why you should sign everything. 

Regardless, the moral of the story is that your work should be verified and signed by you. I prefer to take the sign everything approach, so that's what I'll be going through here, but the steps for signing tags are very similar.  First things first, if you don't have a keypair you'll need to generate one. 

```bash
~:$ gpg --gen-key
```

Make sure to secure it with a strong passphrase. Without a good passhprase this whole thing is pointless. Next up is modifying your gitconfig to include which key git should use when signing. To do this, add your preferred key id to the user section.


```
[user]
  name = <name>
  email = <email>
  signingkey = <keyid>
```

Now, you can specify that the commit (or tag) should be signed with the -S flag. I like to have it aliased so I don't need to include it every time I commit so I added these lines as well. The commit section should only be used if you want to sign everything.

```
[alias]
  cs = commit -S
  ts = tag --sign

[commit]
  gpgsign = true
```

The last change I made was to add better pretty printing that includes the status of a commits signature. The three options are U (untrusted), G (good), or N (not signed). It can be added with this last alias in your gitconfig.

```
[alias]
  lg = log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) %C(bold yellow)%G?%C(reset) - %C(bold green)(%ar)%C(reset    ) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all
```

It should give you output that looks something like this.

```
* 25791d9 G - (2 weeks ago) Added gpg alias to git config and removed from zsh config - Aaron Griffin
* ab23036 G - (2 weeks ago) Added gpg-agent to zsh plugins - Aaron Griffin
* e31124a G - (2 weeks ago) Added pretty printing of git signatures - Aaron Griffin
* aa78b7d G - (2 weeks ago) Added signature check to .gitconfig lg1 - Aaron Griffin
*   a935a7d N - (2 weeks ago) Merge branch 'master' of github.com:aig787/dotfiles - Aaron Griffin
|\  
| *   1e1b5b0 N - (3 weeks ago) Merge branch 'master' of github.com:aig787/dotfiles - Aaron Griffin
| |\  
| * | 1eac859 N - (3 weeks ago) Added vim and zsh config - Aaron Griffin
* | | caf729d N - (2 weeks ago) Added .gitconfig file - Aaron Griffin
| |/  
|/|   
* | a87fd0e N - (3 weeks ago) Updated readme and configuration script - Aaron Griffin
* | 921749f G - (3 weeks ago) Started configuration script - Aaron Griffin
|/  
* 3efece7 N - (3 weeks ago) Moved dotfiles from personal repo into this one - Aaron Griffin
* a4787e1 N - (3 weeks ago) Initial commit - Aaron Griffin
(END)
```

There you have it, you should now be able to sign everything you feel needs to be verified. This system definitely has its weaknesses, but at least you get some level of certainty as to who made what changes. 
