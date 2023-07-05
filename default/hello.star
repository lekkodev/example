result = feature(
    description = "Feature used for the hello world example",
    default = "world",
    rules = [
        ("context-key == \"a\"", "key a"),
        ("context-key == \"b\"", "second rule"),
        ("context-key == \"snowflake\" and environment == \"staging\" and region in [\"us-east-1\"]", "snowflake"),
        ("context-key pr", "unknown context-key"),
    ],
)
