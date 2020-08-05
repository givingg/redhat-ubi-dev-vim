FROM registry.access.redhat.com/ubi8/ubi 
 
ARG WORKSPACE=/root 

RUN yum install gcc make ncurses ncurses-devel nodejs git -y \
    && git clone https://github.com/vim/vim.git \
    && cd vim \
    && ./configure --with-features=huge \
    && make \
    && make install \
    && git config --global user.name "John Doe" \
    && git config --global user.email johndoe@example.com 

WORKDIR $WORKSPACE
COPY .vimrc ${WORKSPACE}/.vimrc 
COPY plug.vim ${WORKSPACE}/.vim/autoload/plug.vim


