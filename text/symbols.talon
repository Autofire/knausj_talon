question [mark]: "?"
score: "_"
double dash: "--"
triple quote: '"""'
triple tick: "'''"
gravy: "```"
(dot dot | dotdot): ".."
ellipses: "..."
(comma and | spamma): ", "
plus: "+"
arrow: "->"
dub arrow: "=>"
new line: "\\n"
carriage return: "\\r"
line feed: "\\r\\n"
end of file: "EOF"
dotty: "../"

empty (string|quotes):
    insert('""')
    key(left)
empty escaped (string|quotes):
    insert('\\"\\"')
    key(left)
    key(left)
empty ticks:
    "''"
    key(left)
empty escaped ticks:
    insert("\\'\\'")
    key(left)
    key(left)
empty round:
    insert("()")
    key(left)
empty (square | list):
    insert("[]")
    key(left)
empty (bracket | braces):
    insert("{}")
    key(left)
empty percent:
    insert("%%")
    key(left)
empty coals:
    insert("::")
    key(left)

[pair] (round):
    insert("()")
    edit.left()
escaped (round):
    insert("\\(\\)")
    edit.left()
    edit.left()
[pair] (brackets|braces):
    insert("{}")
    edit.left()
[pair] (square|squares):
    insert("[]")
    edit.left()
[pair] angles: 
    insert("<>")
    edit.left()
[pair] graves: 
    insert("``")
    edit.left()
[pair] percents: 
    insert("%%")
    edit.left()
[pair] ticks: 
    insert("''")
    edit.left()
[pair] quotes: 
    insert('""')
    edit.left()

# XXX - add support for additional text navigation options?
angle that:
    text = edit.selected_text()
    user.paste("<{text}>")
(bracket | brace) that:
    text = edit.selected_text()
    user.paste("{{{text}}}")
round that:
    text = edit.selected_text()
    user.paste("({text})")
percent that:
    text = edit.selected_text()
    user.paste("%{text}%")
quote that:
    text = edit.selected_text()
    user.paste('"{text}"')
glob line:
    insert("s///g")
    key(left:3)

    

