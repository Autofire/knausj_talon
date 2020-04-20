from typing import Set

from talon import Module, Context, actions
import sys

mod = Module()
mod.list('abbreviation',    desc='Common abbreviation')
@mod.capture
def abbreviation(m) -> str:
    "One abbreviation"

ctx = Context()
# List taken from an aenea grammar
ctx.lists['user.abbreviation'] = {
    "administrator": "admin",
    "administrators": "admins",
    "application": "app",
    "applications": "apps",
    "argument": "arg",
    "arguments": "args",
    "attribute": "attr",
    "attributes": "attrs",
    "authenticate": "auth",
    "authentication": "auth",
    "binary": "bin",
    "button": "btn",
    "class": "cls",
    "command": "cmd",
    "configuration": "cfg",
    "config": "cfg",
    "context": "ctx",
    "control": "ctrl",
    "database": "db",
    "define": "def",
    "definition": "def",
    "description": "desc",
    "develop": "dev",
    "development": "dev",
    "dictionary": "dict",
    "dictation": "dict",
    "direction": "dir",
    "directory": "dir",
    "document": "doc",
    "dynamic": "dyn",
    "example": "ex",
    "escape": "esc",
    "execute": "exec",
    "exception": "exc",
    "expression": "exp",
    "extension": "ext",
    "extend": "ext",
    "function": "func",
    "framework": "fw",
    "image": "img",
    "initialize": "init",
    "initializer": "init",
    "instance": "inst",
    "integer": "int",
    "iterate": "iter",
    "java archive": "jar",
    "javascript": "js",
    "keyword": "kw",
    "keyword arguments": "kwargs",
    "language": "lng",
    "library": "lib",
    "length": "len",
    "number": "num",
    "object": "obj",
    "okay": "ok",
    "package": "pkg",
    "parameter": "param",
    "parameters": "params",
    "pixel": "px",
    "position": "pos",
    "point": "pt",
    "previous": "prev",
    "property": "prop",
    "python": "py",
    "query string": "qs",
    "reference": "ref",
    "references": "refs",
    "represent": "repr",
    "representation": "repr",
    "regular expression": "regex",
    "regular expressions": "regex",
    "request": "req",
    "revision": "rev",
    "ruby": "rb",
    "session id": "sid",
    "source": "src",
    "special": "spec",
    "specify": "spec",
    "specific": "spec",
    "specification": "spec",
    "standard": "std",
    "standard in": "stdin",
    "standard out": "stdout",
    "string": "str",
    "synchronize": "sync",
    "synchronous": "sync",
    "system": "sys",
    "utility": "util",
    "utilities": "utils",
    "temporary": "tmp",
    "text": "txt",
    "value": "val",
    "window": "win",
}

@ctx.capture(rule='{user.abbreviation}')
def abbreviation(m):
    return m.abbreviation

@mod.action_class
class Actions:
    def insert_abbreviation(name: str):
        "Insert an abbreviation"
        actions.insert(name)# ctx.lists["user.abbreviation"][name]