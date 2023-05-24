result = feature(
    description = "Feature used for the hello world example",
    default = "world",
    rules = [
        ("context-key == \"a\"", "first rule!"),
        ("context-key == \"b\"", "second rule"),
        ("context-key == \"snowflake\"", "Snowflake!?"),
        ("context-key pr", "unknown context-key"),
    ],
)
