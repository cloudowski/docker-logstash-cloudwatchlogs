FROM logstash:2.4

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends git rubygems \
  && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && git clone https://github.com/awslabs/logstash-output-cloudwatchlogs.git
RUN cd /tmp/logstash-output-cloudwatchlogs \
  && gem build logstash-output-cloudwatchlogs.gemspec \
  && logstash-plugin install logstash-output-cloudwatchlogs-2.0.0.pre1.gem \
  && cd \
  && rm -fr /tmp/logstash-output-cloudwatchlogs


