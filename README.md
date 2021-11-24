# Argovis API Load Testing

This repo contains some scripts and config to do some basic load testing of Argovis' API.

## Running the Load Tests

1. The test procedure is captured in `run.sh`; run this, it may take a couple hours depending on test config.

2. Once tests complete, have a look in `reports/`. There will be HTML pages describing perf under load for all the configuragtions considered. Most interesting number is median response time; ideally, this should be stable over time. Monotonically increasing repsonse times means the server is getting increasingly bogged down and will timeout or crash eventually.

## Test Config

Tests are defined by the combination of one `config-*` file and one `test-*` file:

 - `config-<x>p<y>m.yaml` configures a test that simulates `x` people hitting the API once a second for `y` minutes.
 - `test-<description>` configures a test to hit the route described in the name. See the `url` field for the specific route.
