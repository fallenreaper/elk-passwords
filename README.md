# elk-passwords

At first I was working on implementing ELK on a Raspberry Pi.  I noticed that while it works somewhat, there are limitations when it comes to Elasticsearch. The issue I hwas having was a java based circular lock after 1.3B documents created and processed with logstash.

As an alternative, i am also developing Clusters for both Logstash and Elasticsearch in order to spin up and tare down containization.  That way, we can Ideally, scale this up here and there, and start adding things like swarms or kubernetes pod development.
