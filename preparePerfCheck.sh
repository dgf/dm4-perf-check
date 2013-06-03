#!/bin/sh

# generate and install service artifacts
for service in groovy java scala; do
  echo generate $service
  mvn archetype:generate \
      -DgroupId=de.deepamehta.archetypes.test \
      -DartifactId=simple-rest-$service-plugin \
      -Dversion=1.0-SNAPSHOT \
      -DarchetypeCatalog=http://ci.deepamehta.de \
      -DarchetypeGroupId=de.deepamehta.archetypes \
      -DarchetypeArtifactId=dm4-rest-$service-archetype \
      -DarchetypeVersion=4.1 \
      -DinteractiveMode=false
  echo install $service
  cd simple-rest-$service-plugin
  sed -ie 's/FINEST/DEBUG/' src/main/resources/logging.properties
  mvn install
  cd ..
done

