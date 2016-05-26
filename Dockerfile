FROM centos:latest
MAINTAINER Frank Zhao <frank@frankzhao.net>

# Install dependencies
RUN yum -y install \
    gcc libpcap-devel mysql-devel \
    git libtool make \
    && yum clean all

RUN git clone https://github.com/pmacct/pmacct \
    && cd pmacct \
    && ./autogen.sh \
    && ./configure --enable-64bit --enable-mysql --enable-threads \
    && make -j4 \
    && make install

EXPOSE 6343 5678
CMD ["bash"]
