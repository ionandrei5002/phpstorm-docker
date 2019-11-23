#!/bin/bash

cache="/home/andrei/dockerbuilds/phpstorm-docker/.cache"
phpstorm="/home/andrei/dockerbuilds/phpstorm-docker/.PhpStorm2019.2"
java="/home/andrei/dockerbuilds/phpstorm-docker/.java"
projects="/home/andrei/PhpstormProjects"

if [ -d  "$cache" ]
then 
    echo "Directory $cache exists."
else
    mkdir -p $cache
    echo "Directory $cache created."
fi

if [ -d  "$phpstorm" ]
then 
    echo "Directory $phpstorm exists."
else
    mkdir -p $phpstorm
    echo "Directory $phpstorm created."
fi

if [ -d  "$java" ]
then 
    echo "Directory $java exists."
else
    mkdir -p $java
    echo "Directory $java created."
fi

if [ -d  "$projects" ]
then 
    echo "Directory $projects exists."
else
    mkdir -p $projects
    echo "Directory $projects created."
fi

docker run --rm -it -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $cache:/home/andrei/.cache \
    -v $phpstorm:/home/andrei/.PhpStorm2019.2 \
    -v $java:/home/andrei/.java \
    -v $projects:/home/andrei/PhpstormProjects/ \
    --env _JAVA_AWT_WM_NONREPARENTING=1 \
    --env AWT_TOOLKIT=MToolkit \
    phpstorm-docker:latest