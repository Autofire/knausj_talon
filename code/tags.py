from talon import Context, Module

mod = Module()

tagList = [
    "debugger",
    "disassembler",
    "gdb",
    "libptmalloc",
    "libdlmalloc",
    "libheap",
    "git",  # commandline tag for git commands
    "ida",
    "tabs",
    "tmux",
    "windbg",
    "yay",
    "apt",
    "buku",
    "ghidra_server",
    "nmcli",
    "taskwarrior",
    "timewarrior",
    "make",
    "kubectl",
    "tmux",
    "docker",
    "vagrant",
    "git",
    "pulse_audio",
    "docker",
    # allows programs running inside of a terminal (ex: gdb) to share
    # common terminal commands like ctrl+c, but without actually
    # supporting all of this shell commands themselves (ls, cd, etc)
    "terminal_program",
    # a tag for defining very specific terminal command line editor
    # commands, see command_line_editing_readline.talon
    "readline",
    "shell_edit_emacs",
    "htop",
    "taskwarrior_tui",
    "vimium",
]

for entry in tagList:
    mod.tag(entry, f"tag to load {entry} and/or related plugins ")
