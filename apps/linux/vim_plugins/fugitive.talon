os: linux
app: /term/
win.title: /VIM/
-

(fugitive|git) status: ":Gstatus\n"
(fugitive|git) diff: ":Gdiff\n"
(fugitive|git) split diff: ":Gsplitdiff!"
(fugitive|git) write: ":Gwrite"
(fugitive|git) force write: ":Gwrite!"
(fugitive|git) blame: ":Gblame\n"
(fugitive|git) commit: ":G commit\n"
(fugitive|git) add (current|this) file: ":G add %\n"
(fugitive|git) add everything: ":G add -u\n"
(fugitive|git) reset (current|reset) file: ":G reset HEAD %\n"