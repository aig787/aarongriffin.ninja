title: Automatic Commit Signing
date: 2014-11-21 15:27:14
tags: Git
categories: Security
---

Most of us don't ever verify signatures of the commits in our favorite repositories and probably don't sign our own. For smaller projects verifying identity probably isn't necessary but for anything where accountability is important, it should be done.

This article is a good example of why (and how) commit signing should be done [A Git Horror Story: Repository Integrity with Signed Commits](http://mikegerwitz.com/papers/git-horror-story). The [official advice of Linus Torvalds](http://git.661346.n2.nabble.com/GPG-signing-for-git-commit-td2582986.html) and it seems the git community in general is to sign tags rather than commits, which is a valid way of doing things, but that article provides a really good argument as to why you should sign everything. 

Regardless, the moral of the story is that your work should be verified and signed by you.
