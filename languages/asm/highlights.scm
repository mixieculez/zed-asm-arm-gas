; The parser treats GNU ARM's @ comments as complete line_comment nodes.
(line_comment) @comment
(block_comment) @comment

; Instructions, registers, directives, labels, and operands.
(instruction kind: (_) @keyword)
(meta kind: (meta_ident) @keyword.directive)
(label [(ident) (word)] @function (#set! "priority" 110))
((reg) @variable.builtin
  (#match? @variable.builtin "(?i)^(r([0-9]|1[0-5])|sp|lr|pc|ip|sb)$"))
(address) @label
(meta (ident) @variable)
((instruction kind: (word) @call_opcode (ident) @function)
  (#match? @call_opcode "(?i)^blx?$"))
(int) @constant.numeric
(float) @number
(string) @string

["{" "}" "[" "]" "(" ")"] @punctuation.bracket
["," ":" "!"] @punctuation.delimiter
