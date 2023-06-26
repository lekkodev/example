result = feature(
    description = "Feature used for the hello world example",
    default = "elliot",
    rules = [
        ("context-key == \"a\"", "first rule!"),
        ("context-key == \"b\"", "second rule"),
        ("context-key == \"snowflake\" and environment == \"staging\" and region in [\"us-east-1\"]", "snowflake"),
        ("context-key pr", "unknown context-key"),
    ],
)
