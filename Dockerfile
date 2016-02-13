FROM centos:7

## Get DNVM
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh

## install unzip before installing any dnx versions
## (appears to already be installed on CentOS with GNOME)
RUN sudo yum install -y unzip

## Install CoreCLR latest
RUN dnvm install latest -r coreclr

## install libuv
## dnu restore won't operate without this
## (curl already latest version, but ASP.NET on Linux docs currently have this... harmless)

#RUN sudo yum -y install automake libtool curl
#RUN curl -sSL https://github.com/libuv/libuv/archive/v1.4.2.tar.gz | sudo tar zxfv - -C /usr/local/src
#cd /usr/local/src/libuv-1.4.2
#RUN sudo sh autogen.sh
#RUN sudo ./configure
#RUN sudo make
#RUN sudo make install
#RUN sudo rm -rf /usr/local/src/libuv-1.4.2 && cd ~/
#RUN sudo ldconfig

## libunwind.x86_64 is in the epel-release repository
## (Not necessary on GNOME, minimal install does not have this installed)
#RUN sudo yum -y install epel-release

## Install these CoreCLR dependencies before dnu restore
#sudo yum -y install libunwind gettext libcurl-devel openssl-devel zlib
