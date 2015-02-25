## ELK Logback

Docker image of ELK stack (Elasticsearch + Logstash + Kibana) with Logback input support.

### Get started

1. Pull the docker image: `docker pull fayndee/elk-logback`
2. Run the docker container: `docker run -d -p 9200:9200 -p 4560:4560 -p 4570:4570/udp -p 5601:5601 fayndee/elk-logback`

### Embedded configuration

Service ports are configured as below and are exposed by default.

| port  | protocol | service        | description                  |
|-------|----------|----------------|------------------------------|
| 9200  | TCP      | Elasticsearch  | Elasticsearch service port.  |
| 4560  | TCP      | Logstash       | Logstash TCP input port.     |
| 4570  | UDP      | Logstash       | Logstash UDP input port.     |
| 5601  | TCP      | Kibana         | Kibana UI port.              |

Logstash is configured with two inputs using different protocol `TCP` and `UDP`. Please see the `*.conf` files for details.
