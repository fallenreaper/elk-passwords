# How to build a nice logstash container.

There are 2 things which need to be modified on a per user basis.

- In the Dockerfile you will need to updaate the data being passed into this docker container.  Each Container is going to process a defined subset of data.  I dont want to copy that data into the but instead defined at runtime.
     - Using the Volume Binding like below will allow us to link a directory for process TO this container for processing.
- in pipeline/logstash.conf you will need to update the outbound elasticsearach location. By defaualt I set it to localhost, but this container will not have elasticseaarch on it.  It is going to be supplied by a different container.

After standing up Elaticsearch, an IP will be defined.  Use tht IP for the logstash output when building the imagae.  It will remain static.

TODO:  Find a way to mount a specific location instead of forcing us to rebuild images.  I dont want to run the same image multiple times with the same data.

host_directory=/HELLO/WORLD
 
docker run -v $host_directory:/usr/share/logstash/files_root/ \
		logstash-sample:latest




