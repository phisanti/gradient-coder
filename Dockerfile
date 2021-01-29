FROM codercom/code-server

# Install conda
RUN curl -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /home/coder/conda && \
     rm ~/miniconda.sh && \
    /home/coder/bin/conda install conda-build

ENV PATH=$PATH:/home/coder/miniconda3/bin/

COPY run.sh /run.sh
EXPOSE 8888
ENTRYPOINT ["/run.sh"]
