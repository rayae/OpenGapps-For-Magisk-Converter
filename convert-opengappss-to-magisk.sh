#!/bin/bash

usage(){
echo "
  usage : $0 <opengapps flashable zip file> <output directory>

    e.g : $0 gapps.zip ./magisk-template/system
"
}


#blacklist for skip convert
blacklist=(
googleonetimeinitializer-all 
gmssetup-all 
setupwizarddefault-all 
setupwizardtablet-all 
googlepartnersetup-all 
packageinstallergoogle-all 
carriersetup-all 
backuprestore-all 
googlebackuptransport-all
)

# check_compatibility(){
# if [ zip 1> ]
# echo "
# 	Have you installed : tar lzip zip
# "
# exit 1
# }
clean_up(){
	echo "[EXIT] CLEAN UP"
	cd "$src"
	rm -rf "$tmp"
}

if test -z "$1" || test -z "$2";then
	usage
	exit 1
fi

opengapps="$PWD/$1"
output="$PWD/$2"

src="$PWD"
tmp="$PWD/.converting-$(date +%s)"

# check_compatibility

trap clean_up EXIT

set -e

mkdir "$tmp"

echo "Unzipping $opengapps..."
unzip -q "$opengapps" -d "$tmp/gapps"


cd "$tmp/gapps/Core/"
for f in *.tar.lz
do
	echo "Unpacking...Core/$f"
	lzip -cd "$f" | tar x
done
cd "$src"

cd "$tmp/gapps/GApps/"
for f in *.tar.lz
do
	echo "Unpacking...GApps/$f"
	lzip -cd "$f" | tar x
done
cd "$src"

rm -rf "$output"

mkdir "$output"


for dir in `find "$tmp/gapps/Core" "$tmp/gapps/GApps" -depth 1 -type d`
do
	bn=$(basename "$dir")
	if [[ "${blacklist[@]}" =~ "$bn" ]];then
		echo "[BLACKLIST] Skip convert -> $bn"
		continue
	fi
	if test -d "$dir/common";then

		echo "[CONVERT] $bn --> type:common"
		cd "$dir/common"
		cp -rf * "$output/"

	elif test -d "$dir/nodpi";then

		echo "[CONVERT] $bn --> type:nodpi"
		cd "$dir/nodpi"
		cp -rf * "$output/"

	else
		echo "Matched nothins in $dir"
	fi

done

cd "$src"

echo "Wow, converted!"

exit 0



