FROM ubuntu:16.04



RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install software-properties-common -y && \
    apt-get install openjdk-8-jre-headless -y && \
    apt-get install -y unzip wget

RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb ; apt-get -fy install


RUN mkdir -p /opt/selenium \
        && wget --no-verbose https://selenium-release.storage.googleapis.com/3.8/selenium-server-standalone-3.8.1.jar -O /opt/selenium/selenium-server-standalone.jar


ARG CHROME_DRIVER_VERSION=2.35
RUN wget --no-verbose -O /tmp/chromedriver_linux64.zip https://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
  && rm -rf /opt/selenium/chromedriver \
  && unzip /tmp/chromedriver_linux64.zip -d /opt/selenium \
  && rm /tmp/chromedriver_linux64.zip \
  && mv /opt/selenium/chromedriver /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
  && chmod 755 /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION \
  && ln -fs /opt/selenium/chromedriver-$CHROME_DRIVER_VERSION /usr/bin/chromedriver


CMD ["bash"]
# echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
# echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
# apt-get install -y gnupg
# apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
# apt-get update
# echo oracle-java6-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections



# echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
# echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
#apt-get install oracle-java9-installer -y


#docker build -t dmchromium .
# docker run -i -t dmchromium -p 4444:4444 /bin/bash
# docker system prune -a

 # docker run -it --rm -p=0.0.0.0:9222:9222 \ 
 # --name=chrome-headless \
 # -v /tmp/chromedata/:/data alpeware/chrome-headless-trunk

 #https://medium.com/@kenfehling/ui-testing-with-nightwatch-js-headless-chrome-and-docker-part-1-f0ce2e8a23a1