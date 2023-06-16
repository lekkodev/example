result = feature(
    description = "Feature used for the hello world example",
    default = "hello world",
    rules = [
        ("context-key == \"a\"", "first rule!"),
        ("context-key == \"b\"", "second rule"),
        ("context-key == \"snowflake\"", "we like snowflake"),
        ("context-key pr", "unknown context-key"),
    ],
)
