#!/bin/sh -l

echo "Get new version based on current version in versions.json"
zone=dockerImage
verPos=file
verFile=versions.json
newVersion=$(bump_versions \
    --zone=$zone \
    --version-pos=$verPos
    $verFile)

echo "::set-output name=newVersion::$newVersion"

