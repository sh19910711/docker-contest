build:
	docker build -t contest .

run:
	docker run \
		-v $(PWD)/.w3m:/root/.w3m \
		-v $(PWD)/wrk:/wrk -w /wrk --rm \
		--name contest -ti contest bash

bash:
	docker exec -ti contest bash

proxy:
	docker exec contest bash -c "HTTP_PROXY= cfproxy --template /root/.contest/template.cpp"
