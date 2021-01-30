FROM codercom/code-server

# Install conda
RUN curl -o ~/miniconda.sh -O  https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    chmod +x ~/miniconda.sh && \
    ~/miniconda.sh -b && \
    rm ~/miniconda.sh && \
    /home/coder/miniconda3/bin/conda install conda-build

ENV PATH=$PATH:/home/coder/miniconda3/bin/

# Add extensions
RUN curl -JLO https://github.com/microsoft/vscode-jupyter/archive/2012.11.3.tar.gz  && \
    code-server --install-extension ms-toolsai.jupyter-2020.11.399280825.vsix || true

RUN curl -JLO https://github.com/microsoft/vscode-python/releases/download/2021.1.502429796/ms-python-release.vsix && \
    code-server --install-extension ms-python.python

COPY run.sh /run.sh
EXPOSE 8888
ENTRYPOINT ["/run.sh"]
