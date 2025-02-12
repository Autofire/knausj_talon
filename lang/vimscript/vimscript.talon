mode: user.vimscript
and code.language: vimscript
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_generic
# XXX - revisit these
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"


###
# Generic Actions - see appropriate generic talon file for spoken command
###

# operators - see lang/operators.talon
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "

# comments - see lang/code_comment.talon
action(user.code_comment): "\""

# conditionals - see lang/programming.talon
action(user.code_state_if):
  insert("if ")
action(user.code_state_else_if):
  insert("elseif ")
action(user.code_state_else):
  insert("else")

action(user.code_private_function): "function "
action(user.code_protected_function): "function "
action(user.code_public_function): "function "


###
# VIM Script Specific
###
assign [<user.vimscript_scope>] (variable|var) [<user.text>] [over]:
    insert("let ")
    insert(vimscript_scope or '')
    user.code_private_variable_formatter(text)

[<user.vimscript_scope>] (variable|var) [<user.text>] [over]:
    insert(vimscript_scope or '')
    user.code_private_variable_formatter(text)

# see lang/vimscript/vimscript.py for list
<user.vimscript_functions>:
    insert("{vimscript_functions} ")

# XXX - possibly overlap with some programming.talon
state command: "command! "
state end if: "endif"
state end for: "endfor"
state end while: "endwhile"
state end function: "endfunction"
state continue: "continue"


# XXX - should be a generic
# function calling
funk <user.text>:
    insert(user.formatted_text(text, "snake"))
    insert("()")
    edit.left()
