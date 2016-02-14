FROM ubuntu:14.04

#install .net core
RUN sh -c 'echo "deb [arch=amd64] http://apt-mo.trafficmanager.net/repos/dotnet/ trusty main"  \
  >/etc/apt/sources.list.d/dotnetdev.list' 
RUN apt-key adv -keyserver apt-mo.trafficmanager.net --recv-keys 417A0893
RUN apt-get update

#RUN apt-get install dotnet=1.0.0.001331-1

## Get DNVM
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev bash 
#RUN  bash ~/.dnx/dnvm/dnvm.sh

## install unzip before installing any dnx versions
## (appears to already be installed on CentOS with GNOME)
RUN yum install -y unzip

## Install CoreCLR latest
#RUN dnvm install latest -r coreclr

#RUN curl https://dotnetcli.blob.core.windows.net/dotnet/beta/Binaries/Latest/dotnet-centos-x64.latest.tar.gz \
#  -o dotnet-centos-x64.latest.tar.gz \
#   && mkdir /opt/dotnet \
#   && tar -xvzf dotnet-centos-x64.latest.tar.gz -C /opt/dotnet



## install libuv
## dnu restore won't operate without this
## (curl already latest version, but ASP.NET on Linux docs currently have this... harmless)


#RUN yum -y install automake libtool curl \
#  && curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | tar zxfv - -C /usr/local/src \
#  && cd /usr/local/src/libuv-1.4.2 \
#  && sh autogen.sh \
#  && sudo ./configure \
#  && make \
#  && make install \
#  && rm -rf /usr/local/src/libuv-1.4.2 && cd ~/ \
#  && ldconfig

## libunwind.x86_64 is in the epel-release repository
## (Not necessary on GNOME, minimal install does not have this installed)
yum -y install epel-release

## Install these CoreCLR dependencies before dnu restore
RUN yum -y install libunwind gettext libcurl-devel openssl-devel zlib
