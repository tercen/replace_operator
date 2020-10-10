# Replace operator

##### Description

The `replace` operator performs the replacement of the first or all matches of a string.

##### Usage

Input projection|.
---|---
`row`        | character, strings to be replaced

Properties|.
---|---
`type`        | character, replace the `first` or `all` matches (default: all)
`what`        | character, pattern to be matched (regular expression)
`by`        | character, a replacement for matched pattern

Output relations|.
---|---
`string`        | character, string with replaced matches

##### Details

The operator is based on the R functions `gsub` and `sub`.

##### See Also

[separate_operator](https://github.com/tercen/separate_operator)

