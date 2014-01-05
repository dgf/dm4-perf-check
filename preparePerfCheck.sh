#!/bin/sh
set -x
# generate and install service artifacts
for service in groovy java scala; do
  echo generate $service
  mvn archetype:generate \
      -DgroupId=de.deepamehta.archetypes.test \
      -DartifactId=simple-rest-$service-plugin \
      -Dversion=1.0-SNAPSHOT \
      -DarchetypeCatalog=http://m2.deepamehta.de \
      -DarchetypeGroupId=de.deepamehta.archetypes \
      -DarchetypeArtifactId=dm4-rest-$service-archetype \
      -DarchetypeVersion=4.1.3 \
      -DinteractiveMode=false
  echo install $service
  cd simple-rest-$service-plugin
  sed -i -e 's/ALL/WARNING/' src/main/resources/logging.properties
  mvn install
  cd ..
done
#EOF
