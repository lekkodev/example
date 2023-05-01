# Template

This repository acts as a template for initializing new config repositories. 

The template includes a `default` namespace with a single boolean feature flag defined in `example.star`.

All proto definitions are stored under the top-level `proto` directory. This directory also includes the [buf image](https://docs.buf.build/reference/images) (`image.bin`) needed to dynamically resolve all user-defined protobuf types.
