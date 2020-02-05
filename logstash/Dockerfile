FROM docker.elastic.co/logstash/logstash:7.5.2

#RUN whoami
#RUN pwd
#RUN cd ~
#RUN pwd

# This is going to be the root location where files will exist under
ENV logstash_home /usr/share/logstash
ENV files_root $logstash_home/files_root
RUN mkdir $files_root

# Add files which need to be processed.
# You will want augment this if we want to have instances processing chunks of data.
ADD dataset/ $files_root/

RUN rm -f $logstash_home/pipeline/logstash.conf
ADD pipeline/ $logstash_home/pipeline/
ADD config/ $logstash_home/config/

RUN mkdir $logstash_home/since_db_path/
RUN touch $logstash_home/since_db_path/file
VOLUME $logstash_home/since_db_path


