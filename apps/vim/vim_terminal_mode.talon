win.title: /VIM MODE:t/
-

tag(): user.vim_terminal


pop (terminal|term):
    key(ctrl-\ ctrl-n)

# pop terminal mode and scroll up once, from this point onward you can scroll
# like normal
# XXX - scroll up just become contextual on mode
# rabbit up:
action(edit.page_up):
    key(ctrl-\ ctrl-n ctrl-b)
scroll up:
    key(ctrl-\ ctrl-n ctrl-b)

# this causes exclusive terminal windows to exit without requiring key press or
# dropping to a new empty buffer
exit terminal:
    key(ctrl-\)
    key(ctrl-n)
    insert("ZQ")

# shadow are commands are for copying and pasting the entire line from a given point
shadow <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("y$")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

shadow fuzzy <user.text>:
    user.vim_normal_mode_exterm(":call search(\"{text}\", 'bcW')\n")
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()

shadow <number_small> <user.text>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert(":call search(\"{text}\", 'c', line('.'))\n")
    insert("y$")
    insert(":set nohls\n")
    user.vim_set_insert_mode()
    edit.paste()

shadow <number_small> <user.ordinals>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("{ordinals-1}W")
    insert("y$")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

# echo commands are for copying words from a given point
echo <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("yE")
    user.vim_command_mode(":set nohls\n")
    # See `:help pattern`
    # \_s   - match single white space
    # \{2,} - at least two in a row
    user.vim_command_mode(":let @+=substitute(strtrans(@+), '\\_s\\{{2,}}', '', 'g')\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

echo (last <number_small>|<number_small> last):
    user.vim_normal_mode_exterm("{number_small}k")
    insert('$T ')
    insert("yE")
    user.vim_set_insert_mode()
    edit.paste()
    key(space)

echo <number_small> <user.ordinals>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("{ordinals-1}W")
    insert("yE")

    user.vim_set_insert_mode()
    edit.paste()
    key(space)

# yankee are commands are for copying the remaining line from a given point
yankee <number_small>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("y$")
    user.vim_command_mode(":let @+=substitute(strtrans(@+), '\\_s\\{{2,}}', '', 'g')\n")
    user.vim_set_insert_mode()

yankee <number_small> <user.ordinals>:
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("{ordinals-1}W")
    insert("y$")
    user.vim_set_insert_mode()

yankee (last <number_small>|<number_small> last):
    user.vim_normal_mode_exterm("{number_small}k")
    insert('$T ')
    insert("yE")
    user.vim_set_insert_mode()

yankee command:
    user.vim_normal_mode_exterm("0f y$")
    user.vim_command_mode(":let @+=substitute(strtrans(@+), '\\_s\\{{2,}}', '', 'g')\n")
    user.vim_set_insert_mode()


# this is used for pexpect interactive environments
# https://pexpect.readthedocs.io/en/stable/api/pexpect.html#spawn-class
# note that you can't use this from within command line itself, because the
# terminal may not trigger depending on what the interactive command is. who
# had actually needs to be global
python escape: key(ctrl-])

# this assumes you list some directories with find or whatever, then you want
# to pivot into one of them beasts on what was listed. you say the relative
# number, in it will jump to that point copy the line and then jump you in
pivot <number_small>:
    insert("cd ")
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    insert("y$")
    user.vim_command_mode(":let @+=substitute(strtrans(@+), '\\_s\\{{2,}}', '', 'g')\n")
    user.vim_set_insert_mode()
    edit.paste()
    key(enter)

river <number_small>:
    insert("cd ")
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    key(ctrl-w)
    key(f)


pillar <number_small>:
    insert("cd ")
    user.vim_normal_mode_exterm("{number_small}k")
    key('0')
    user.vim_command_mode(":vertical wincmd f\n")

# Combine the pwd with the path at a relative offset and place the result in
# the clipboard
folder yank merge <number_small>:
    user.vim_command_mode_exterm(":let @+ = getcwd() . '/'\n")
    user.vim_normal_mode("{number_small}k0")
    user.vim_command_mode(":let @+ .= substitute(strtrans(getline('.')), '\\_s\\{{2,}}', '', 'g')\n")
    user.vim_set_insert_mode()
