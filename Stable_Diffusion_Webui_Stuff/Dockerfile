#FROM ubuntu:latest
FROM nvidia/cuda:12.0.0-cudnn8-devel-ubuntu22.04
VOLUME /app/webui
WORKDIR /app/webui
RUN apt update 
RUN apt install -y vim python3 libgoogle-perftools4 libtcmalloc-minimal4 git python3-pip ffmpeg libsm6 libxext6 && adduser webui-user 
RUN pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir packaging==21.3 \
  && pip install --no-cache-dir httpx==0.24.1 \
  && pip install --no-cache-dir torch
#RUN install ubuntu-drivers
#RUN ubuntu-drivers install
#RUN ubuntu-drivers install nvidia:525
EXPOSE 7860


#RUN chown webui-user:webui-user run.sh
USER webui-user
COPY --chown=webui-user:webui-user . .
RUN chmod +x run.sh
RUN git config --global --add safe.directory /app/webui
CMD ["./run.sh"]
