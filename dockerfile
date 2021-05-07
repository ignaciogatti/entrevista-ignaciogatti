ADD file:204fb7ccb19ff7e863331131138621ff4d22720b3718e8f296902cc7d4f635b5 in /
RUN set -xe
   &&  echo '#!/bin/sh' > /usr/sbin/policy-rc.d
   &&  echo 'exit 101' >> /usr/sbin/policy-rc.d
   &&  chmod +x /usr/sbin/policy-rc.d
   &&  dpkg-divert --local --rename --add /sbin/initctl
   &&  cp -a /usr/sbin/policy-rc.d /sbin/initctl
   &&  sed -i 's/^exit.*/exit 0/' /sbin/initctl
   &&  echo 'force-unsafe-io' > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
   &&  echo 'DPkg::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' > /etc/apt/apt.conf.d/docker-clean
   &&  echo 'APT::Update::Post-Invoke { "rm -f /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/cache/apt/*.bin || true"; };' >> /etc/apt/apt.conf.d/docker-clean
   &&  echo 'Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";' >> /etc/apt/apt.conf.d/docker-clean
   &&  echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/docker-no-languages
   &&  echo 'Acquire::GzipIndexes "true"; Acquire::CompressionTypes::Order:: "gz";' > /etc/apt/apt.conf.d/docker-gzip-indexes
   &&  echo 'Apt::AutoRemove::SuggestsImportant "false";' > /etc/apt/apt.conf.d/docker-autoremove-suggests
RUN rm -rf /var/lib/apt/lists/*
RUN sed -i 's/^#\s*\(deb.*universe\)$/\1/g' /etc/apt/sources.list
RUN mkdir -p /run/systemd
   &&  echo 'docker' > /run/systemd/container
CMD ["/bin/bash"]
LABEL maintainer=Zimovnov Andrey <zimovnov@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c apt-get update
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c apt-get install -yq python3-pip htop nano git wget libglib2.0-0 ffmpeg
ADD file:fd37d33f53f5568ccb214f14e5a78bac5995caa96a4e959eb3b0a6c10b386307 in /
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c pip3 install --upgrade pip
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c pip3 install -r requirements.txt
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c jupyter nbextension enable --py --sys-prefix widgetsnbextension
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c jupyter contrib nbextension install --user
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c jupyter nbextension enable codefolding/main
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c echo "c.NotebookApp.port = 8080" >> /root/.jupyter/jupyter_notebook_config.py
|1 DEBIAN_FRONTEND=noninteractive /bin/sh -c echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py
WORKDIR /root
EXPOSE 7007 8080
CMD ["jupyter" "notebook" "--no-browser" "--allow-root"]
jupyter notebook --no-browser --allow-root
