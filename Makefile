build:
	docker build -t baandab/hamachi:0.1 .

run:
	docker run -it --net="host" --privileged="true" baandab/hamachi bash

bash:
	docker-compose exec agent bash
