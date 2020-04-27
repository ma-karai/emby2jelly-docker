FROM alpine:latest

#add curl for better handling
RUN apk add --no-cache curl
RUN apk add linux-headers 
# Update & Install dependencies
RUN apk add --no-cache --update \
    git \
    bash \
    libffi-dev \
    openssl-dev \
    bzip2-dev \
    zlib-dev \
    readline-dev \
    sqlite-dev \
    build-base

# Set Python version
ARG PYTHON_VERSION='3.7.0'
RUN export PYTHON_VERSION
# Set pyenv home
ARG PYENV_HOME=/root/.pyenv
RUN export PYENV_HOME

# Install pyenv, then install python versions
RUN git clone --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME && \
    rm -rfv $PYENV_HOME/.git

ENV PATH $PYENV_HOME/shims:$PYENV_HOME/bin:$PATH

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pip install --upgrade pip && pyenv rehash

# Clean
RUN rm -rf ~/.cache/pip

# Done python3.7 setup

# Setup emby2jelly

## setup home folder
RUN mkdir -p /root/.config/Emby2Jelly/ 
ENV Emby2Jelly_HOME=/root/.config/Emby2Jelly/
ARG Emby2Jelly_HOME=/root/.config/Emby2Jelly/
RUN export Emby2Jelly_HOME

RUN touch $Emby2Jelly_HOME/settings.ini
RUN echo \
   "
   [Emby] 
   EMBY_APIKEY = aaaabbbbbbbcccccccccccccdddddddd
   EMBY_URLBASE = http://127.0.0.1:8096/
   [Jelly]
   JELLY_APIKEY = eeeeeeeeeeeeeeeffffffffffffffffggggggggg
   JELLY_URLBASE = http://127.0.0.1:8096/ 
   " > $Emby2Jelly_HOME/settings.ini

RUN git clone --depth 1 https://github.com/CobayeGunther/Emby2Jelly.git $Emby2Jelly_HOME && \
    rm -rfv $Emby2Jelly_HOME/.git
    
#please add requirement txt    
COPY requirements.txt /root/.config/Emby2Jelly/requirements.txt

#RUN pip install -r $Emby2Jelly_HOME/requirements.txt

