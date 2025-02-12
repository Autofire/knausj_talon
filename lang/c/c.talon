mode: command
and code.language: c
-
tag(): user.code_operators
tag(): user.code_comment
tag(): user.code_block_comment
tag(): user.code_generic
settings():
    user.code_private_function_formatter = "SNAKE_CASE"
    user.code_protected_function_formatter = "SNAKE_CASE"
    user.code_public_function_formatter = "SNAKE_CASE"
    user.code_private_variable_formatter = "SNAKE_CASE"
    user.code_protected_variable_formatter = "SNAKE_CASE"
    user.code_public_variable_formatter = "SNAKE_CASE"
    # whether or not to use uint_8 style datatypes
    #    user.use_stdint_datatypes = 1


action(user.code_operator_indirection): "*"
action(user.code_operator_address_of): "&"
action(user.code_operator_structure_dereference): "->"
action(user.code_operator_subscript):
    insert("[]")
    key(left)
action(user.code_operator_assignment): " = "
action(user.code_operator_subtraction): " - "
action(user.code_operator_subtraction_assignment): " -= "
action(user.code_operator_addition): " + "
action(user.code_operator_addition_assignment): " += "
action(user.code_operator_multiplication): " * "
action(user.code_operator_multiplication_assignment): " *= "
#action(user.code_operator_exponent): " ** "
action(user.code_operator_division): " / "
action(user.code_operator_division_assignment): " /= "
action(user.code_operator_modulo): " % "
action(user.code_operator_modulo_assignment): " %= "
action(user.code_operator_equal): " == "
action(user.code_operator_not_equal): " != "
action(user.code_operator_greater_than): " > "
action(user.code_operator_greater_than_or_equal_to): " >= "
action(user.code_operator_less_than): " < "
action(user.code_operator_less_than_or_equal_to): " <= "
action(user.code_operator_and): " && "
action(user.code_operator_or): " || "
action(user.code_operator_bitwise_and): " & "
action(user.code_operator_bitwise_and_assignment): " &= "
action(user.code_operator_bitwise_or): " | "
action(user.code_operator_bitwise_or_assignment): " |= "
action(user.code_operator_bitwise_exclusive_or): " ^ "
action(user.code_operator_bitwise_exclusive_or_assignment): " ^= "
action(user.code_operator_bitwise_left_shift): " << "
action(user.code_operator_bitwise_left_shift_assignment): " <<= "
action(user.code_operator_bitwise_right_shift): " >> "
action(user.code_operator_bitwise_right_shift_assignment): " >>= "
action(user.code_null): "NULL"
action(user.code_is_null): " == NULL "
action(user.code_is_not_null): " != NULL"
action(user.code_state_if):
    insert("if () {\n}\n")
    key(up:2 left:3)
action(user.code_state_else_if):
    insert("else if () {\n}\n")
    key(up:2 left:3)
action(user.code_state_else):
    insert("else\n{\n}\n")
    key(up:2)
action(user.code_state_switch):
    insert("switch ()")
    edit.left()
action(user.code_state_case):
    insert("case \nbreak;")
    edit.up()
action(user.code_state_for): "for "
action(user.code_state_go_to): "goto "
action(user.code_state_while):
    insert("while ()")
    edit.left()
action(user.code_state_return): "return "
action(user.code_break): "break;"
action(user.code_next): "continue;"
action(user.code_true): "true"
action(user.code_false): "false"
action(user.code_type_definition): "typedef "
action(user.code_typedef_struct):
    insert("typedef struct")
    insert("{\n\n}")
    edit.up()
    key(tab)
action(user.code_from_import): "using "
action(user.code_include): insert("#include ")
action(user.code_include_system):
    insert("#include <>")
    edit.left()
action(user.code_include_local):
    insert('#include ""')
    edit.left()
action(user.code_comment): "//"
action(user.code_block_comment):
    insert("/*")
    key(enter)
    key(enter)
    insert("*/")
    edit.up()
action(user.code_block_comment_prefix): "/*"
action(user.code_block_comment_suffix): "*/"

^funky <user.text>$: user.code_default_function(text)
^static funky <user.text>$: user.code_private_static_function(text)


hash define: "#define "
hash undefine: "#undef "
hash if define: "#ifdef "
hash if: "#if "
hash error: "#error "
hash else if: "#elif "
hash end if: "#endif "
hash pragma: "#pragma "
state default: "default:\nbreak;"

block:
    insert("{\n\n}")
    key(up)

#control flow
#best used with a push like command
#the below example may not work in editors that automatically add the closing bracket
#if so uncomment the two lines and comment out the rest accordingly
push brackets:
    edit.line_end()
    insert("{}")
    edit.left()
    key(enter)
    key(enter)
    edit.up()

declare <user.c_variable>:
    insert("{c_variable} ")

# Declare variables or structs etc.
# Ex: int * myList
#declare <user.c_variable> <phrase>:
#    insert("{c_variable} ")
#    insert(user.formatted_text(phrase, "PRIVATE_CAMEL_CASE,NO_SPACES"))

declare <user.c_variable> <user.letter>:
    insert("{c_variable} {letter} ")

# Ex. (int *)
cast to <user.c_cast>: "{c_cast}"
basic cast to <user.c_basic_cast>: "{c_basic_cast}"
standard cast to <user.c_stdint_cast>: "{c_stdint_cast}"
state <user.c_types>: "{c_types}"
<user.c_pointers>: "{c_pointers}"
<user.c_signed>: "{c_signed}"
basic <user.c_basic_types>: "{c_basic_types}"
standard <user.c_stdint_types>: "{c_stdint_types}"

toggle includes: user.code_toggle_libraries()
include <user.code_libraries>:
    user.code_insert_library("", code_libraries)
    key(end enter)

cycle data type: user.cycle_c_datatype()
show data type: user.current_c_datatype()

###
# Documentation
###
# JavaDoc-style Doxygen
# https://www.doxygen.nl/manual/docblocks.html
# TODO - this might be something to generalize and have set up in settings
dock fun:
    user.paste("/**\n* \n*/")
    key(up end)
dock var:
    user.insert_cursor("/**< [|].*/")
dock in:
    insert("@param[in] ")
dock out:
    insert("@param[out] ")
dock in out:
    insert("@param[in, out] ")
dock return:
    insert("@return")
dock file:
    insert("/** @file */")
