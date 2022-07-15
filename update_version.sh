#!/usr/bin/env bash

set -e
set -o pipefail

if [[ $# -lt 2 ]]; then
    echo "Usage: $0 --zone <zone> --ver-pos <verPos> --version"
    echo "<version> <input-file>"
    echo "Only one option is required: --zone"
    exit 1;
fi

zone=""
verPos="file"
version=""
verFile="versions.json"

while [[ $# -gt 0 ]];
do
    k=$1; shift;
    case $k in
        --zone)
            zone=$1;
            shift
            ;;
        --version)
            version=$1;
            shift
            ;;
        --ver-pos)
            verPos=$1;
            shift
            ;;
        *)
            verFile=$k
            ;;
    esac
done

if [[ "$zone" == "" ]]; then
    echo "--zone is required"
    exit 2
fi

echo "Get new version based on current version in $verFile"

if [[ "$version" == "" ]]; then # bump version
    newVersion=$(bump_versions \
        --zone=$zone \
        --version-pos=$verPos \
        --outfile=$verFile \
        $verFile)
else # use user-provided one
    newVersion=$(bump_versions \
        --zone=$zone \
        --version=$version \
        --outfile=$verFile \
        $verFile)
fi

echo "::set-output name=newVersion::$newVersion"

