.PHONY: build_release

create_local_table:
	aws dynamodb create-table --table-name shortened-links --attribute-definitions AttributeName=link-hash,AttributeType=S --key-schema AttributeName=link-hash,KeyType=HASH --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 --endpoint http://localhost:8000

build_release:
	cargo lambda build --release --target aarch64-unknown-linux-gnu

start:
	cargo lambda start

invoke_example:
	cargo lambda invoke lambda-1 --data-file examples/200.json
