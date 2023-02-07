.PHONY: build

build_release:
	cargo lambda build --release --target aarch64-unknown-linux-gnu

start:
	cargo lambda start

invoke_example:
	cargo lambda invoke lambda-1 --data-file examples/200.json