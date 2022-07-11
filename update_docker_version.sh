#!/bin/sh -l

echo "Get new version based on current version in versions.json"
zone=dockerImage
verPos=file
verFile=${1:-versions.json}
newVersion=$(bump_versions \
    --zone=$zone \
    --version-pos=$verPos \
    --outfile=$verFile \
    $verFile)

echo "::set-output name=newVersion::$newVersion"

