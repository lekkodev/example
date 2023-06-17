result = feature(
    description = "Feature used for the hello world example",
    default = "Hello World1?",
    rules = [
        ("context-key == \"a\"", "first rule!"),
        ("context-key == \"b\"", "second rule"),
        ("context-key in [\"snowflake\",\"redshift\"] and environment == \"staging\" and region in [\"us-east-1\"]", "snowflake"),
        ("context-key pr", "unknown context-key"),
    ],
)
