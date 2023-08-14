result = feature(
    description = "Feature used for the hello world example",
    default = "world",
    rules = [
        ("context-key == \"a\"", "key a"),
        ("context-key == \"b\"", "second rule"),
        ("context-key == \"c\"", "third rule"),
        ("context-key pr", "unknown context-key"),
    ],
)
