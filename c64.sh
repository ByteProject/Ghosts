#!/bin/bash
# builds a Commodore 64 release with loader

#read config file 
source config.sh

#cleanup
rm ${STORY}_c64.d64

#copy resources
cp Resources/loadpic.kla .

#compile
${WRAPPER} -5 ${STORY}.inf
ruby Interpreters/Ozmoo/make.rb -t:c64 -i loadpic.kla -dc:2:9 -ss1:"${LABEL}" -ss2:"Interactive Fiction" -ss3:"${SUBTITLE}" -sw:6 ${STORY}.z5

mv c64_${STORY}.d64 ${STORY}_c64.d64

#post-cleanup
rm loadpic.kla
