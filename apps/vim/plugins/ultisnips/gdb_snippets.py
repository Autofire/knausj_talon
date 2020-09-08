import os

from talon import Context, Module, actions, app, ui

ctx = Context()
ctx.matches = r"""
app: vim
mode: user.gdb
mode: command
and code.language: gdb
"""
# spoken name -> snippet name
ultisnips_snippets = {}

private_snippets = {
    "new big break": "bigbr",
}

ctx.lists["user.snippets"] = {**ultisnips_snippets, **private_snippets}