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
ENV EMBYJELLY_HOME=/root/.config/Emby2Jelly/
ARG EMBYJELLY_HOME=/root/.config/Emby2Jelly/
RUN export EMBYJELLY_HOME

RUN touch $EMBYJELLY_HOME/settings.ini
RUN echo  "[Emby]\n" \
          "EMBY_APIKEY = aaaabbbbbbbcccccccccccccdddddddd\n" \
          "EMBY_URLBASE = http://127.0.0.1:8096/\n" \
          "[Jelly]\n" \
          "JELLY_APIKEY = eeeeeeeeeeeeeeeffffffffffffffffggggggggg\n" \
          "JELLY_URLBASE = http://127.0.0.1:8096/ \n" > $EMBYJELLY_HOME/settings.ini

RUN cat $EMBYJELLY_HOME/settings.ini

RUN git clone --depth 1 https://github.com/CobayeGunther/Emby2Jelly.git $EMBYJELLY_HOME

#RUN rm -rfv $Emby2Jelly_HOME/.git
    
#please add requirement txt    
COPY requirements.txt /root/.config/Emby2Jelly/requirements.txt

#RUN pip install -r $Emby2Jelly_HOME/requirements.txt

