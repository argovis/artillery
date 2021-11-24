docker image build -t argovis/artillery:test .
for config in 1p1m 1p3m 1p10m 3p1m 3p3m 3p10m 10p1m 10p3m 10p10m
do
	for endpoint in overview single-prof single-day
	do
		echo $config $endpoint
		docker container run -v $(pwd)/reports:/reports argovis/artillery:test artillery run --output /reports/out.json --config config-${config}.yaml test-${endpoint}.yaml
		docker container run -v $(pwd)/reports:/reports argovis/artillery:test artillery report --output /reports/report-${config}-${endpoint}.html /reports/out.json
		sleep 60
	done
done