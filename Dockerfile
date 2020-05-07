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
RUN git clone -b docker-friendly --depth 1 https://github.com/pyenv/pyenv.git $PYENV_HOME && \
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
ENV EMBY2JELLY_HOME=/root/.config/Emby2Jelly/
ARG EMBY2JELLY_HOME=/root/.config/Emby2Jelly/
RUN export EMBY2JELLY_HOME

RUN git clone --depth 1 https://github.com/CobayeGunther/Emby2Jelly.git $EMBY2JELLY_HOME
RUN rm -rfv $EMBY2JELLY_HOME/.git

ENV EMBY_APIKEY=aaaabbbbbbbcccccccccccccddddddddtest
ARG EMBY_APIKEY=aaaabbbbbbbcccccccccccccddddddddtest

ENV EMBY_URLBASE=http://127.0.0.1:8096/test/
ARG EMBY_URLBASE=http://127.0.0.1:8096/test/

ENV JELLY_APIKEY=eeeeeeeeeeeeeeeffffffffffffffffgggggggggtest
ARG JELLY_APIKEY=eeeeeeeeeeeeeeeffffffffffffffffgggggggggtest

ENV JELLY_URLBASE=http://127.0.0.2:8096/
ARG JELLY_URLBASE=http://127.0.0.2:8096/

ENV NEW_USER_PWD=pls_change_your_pwd_test
ARG NEW_USER_PWD=pls_change_your_pwd_test

    
#please add proper requirement txt    
COPY requirements.txt $EMBY2JELLY_HOME/requirements.txt
RUN pip install -r $EMBY2JELLY_HOME/requirements.txt

COPY start.sh /root/start.sh
RUN chmod +x  /root/start.sh

#ENTRYPOINT ["/root/start.sh"]


