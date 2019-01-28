FROM mongo:latest
MAINTAINER Satoshi Murashige

RUN apt-get -y update --fix-missing && apt-get -y upgrade
RUN apt-get install -y sudo wget bzip2 git vim cmake xserver-xorg-dev libgl1-mesa-dev unzip && \
    apt-get install -y python3 python3-pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 &&\
    update-alternatives --install /usr/bin/pip    pip    /usr/bin/pip3    10

# settings
ARG user_name=ubuntu
ARG user_id=1000
ARG group_name=ubuntu
ARG group_id=1000

# create user
RUN groupadd -g ${group_id} ${group_name}
RUN useradd -u ${user_id} -g ${group_id} -d /home/${user_name} \
    --create-home --shell /bin/bash ${user_name}
RUN echo "${user_name} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN chown -R ${user_name}:${group_name} /home/${user_name}

# user settings
ENV HOME /home/${user_name}
ENV LANG en_US.UTF-8
ENV LC_ALL="C"

USER ${user_name}
WORKDIR /work

# Install visipedia/annotation_tools

RUN git clone --depth=1 \
        https://github.com/visipedia/annotation_tools.git ~/annotation_tools && \
    cd ~/annotation_tools && \
    pip install -r requirements.txt

RUN echo 'alias run-server="python3 ~/annotation_tools/run.py $@"' >> ~/.bashrc

WORKDIR /work
CMD ["/bin/bash"]

