#! /bin/sh

# See https://unity3d.com/get-unity/download/archive
# to get download URLs
UNITY_DOWNLOAD_CACHE="$(pwd)/unity_download_cache"
UNITY_OSX_PACKAGE_URL="https://download.unity3d.com/download_unity/292b93d75a2c/MacEditorInstaller/Unity.pkg?_ga=2.230872095.1877898192.1557134722-1654540184.1556282109"
UNITY_WINDOWS_TARGET_PACKAGE_URL="https://beta.unity3d.com/download/46dda1414e51/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2017.2.0f3.pkg"
PACKAGE_FILENAME="Unity.pkg"

# Downloads a file if it does not exist
download() {

	URL=$1
	FILE=`basename "$URL"`
	
	# Downloads a package if it does not already exist in cache
	if [ ! -e $UNITY_DOWNLOAD_CACHE/`basename "$URL"` ] ; then
		echo "$FILE does not exist. Downloading from $URL: "
		mkdir -p "$UNITY_DOWNLOAD_CACHE"
		curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` "$URL"
		#curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` gdrive.sh | bash -s $URL
		#curl gdrive.sh | bash -s $URL
	else
		echo "$FILE Exists. Skipping download."
	fi
}

# Downloads and installs a package from an internet URL
install() {
	PACKAGE_URL=$1
	download $1
	
	echo "Installing `basename "$PACKAGE_URL"`"
	ls
	sudo installer -dumplog -package $UNITY_DOWNLOAD_CACHE/`basename "$PACKAGE_FILENAME"` -target /
}



echo "Contents of Unity Download Cache:"
ls $UNITY_DOWNLOAD_CACHE

echo "Installing Unity..."
install $UNITY_OSX_PACKAGE_URL
#install $UNITY_WINDOWS_TARGET_PACKAGE_URL
