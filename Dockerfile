FROM ubuntu:focal
ENV DEBIAN_FRONTEND=noninteractive

# create deploy user
RUN useradd --create-home --home /var/lib/deploy deploy

# install apt-get requirements
ADD apt-requirements.txt /tmp/apt-requirements.txt
RUN apt-get update -qq -y && \
  xargs -a /tmp/apt-requirements.txt apt-get install -y --no-install-recommends && \
  apt-get autoremove -y && \
  apt-get clean

RUN npm install npm@latest -g && \
  npm install n requirejs -g && \
  n lts

# install miniconda
ENV PATH="/root/miniconda3/bin:${PATH}"
ARG PATH="/root/miniconda3/bin:${PATH}"
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  mkdir /root/.conda && \
  bash Miniconda3-latest-Linux-x86_64.sh -b && \
  rm -f Miniconda3-latest-Linux-x86_64.sh && \
  conda init bash && \
  . /root/.bashrc

ADD rs_env.yml tmp/rs_env.yml
RUN conda env create -f tmp/rs_env.yml

RUN mkdir -p /var/lib/deploy/robotsearch/data
ADD server.py rr_web.py run /var/lib/deploy/
ADD robotsearch /var/lib/deploy/robotsearch
ADD filtered /var/lib/deploy/filtered
ADD static /var/lib/deploy/static
ADD templates /var/lib/deploy/templates
ADD uploads /var/lib/deploy/uploads

VOLUME /var/lib/deploy/src/robotsearch/data
EXPOSE 5000
ENV HOME /var/lib/deploy
ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "robotsearch", "/var/lib/deploy/run"]
