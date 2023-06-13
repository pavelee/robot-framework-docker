FROM --platform=linux/amd64 node:20.3.0-bullseye-slim

RUN apt-get update \
    && apt-get install -y \ 
    python3-pip python3-dev \
    libasound2 libdbus-glib-1-2 \
    xvfb curl;

RUN apt-get install -y libgtk-3-0 \                      
    libxcomposite1 \                              
    libxrandr2 \                                  
    libxrender1 \                                 
    libxtst6 \                                    
    libpangocairo-1.0-0 \                         
    libpango-1.0-0 \                             
    libatk1.0-0 \                                
    libcairo-gobject2 \                          
    libcairo2 \                                  
    libgdk-pixbuf-2.0-0 \                        
    libxcursor1 \                                
    libxi6;

RUN pip3 install \
    robotframework \
    robotframework-browser;

RUN rfbrowser init

RUN curl -o rcc https://downloads.robocorp.com/rcc/releases/latest/linux64/rcc
RUN chmod a+x rcc
RUN mv rcc /usr/local/bin/

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod -R +x /bin/entrypoint.sh

ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

ENV ROBOT_OPTIONS=
ENV ROBOT_PATH=/srv/robot

COPY robot /srv/robot

WORKDIR /srv/robot

# CMD  ["tail", "-f", "/dev/null"]
CMD ["entrypoint.sh"]