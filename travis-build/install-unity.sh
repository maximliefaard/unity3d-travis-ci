#! /bin/sh

# See https://unity3d.com/get-unity/download/archive
# to get download URLs
UNITY_DOWNLOAD_CACHE="$(pwd)/unity_download_cache"
UNITY_OSX_PACKAGE_URL="https://download.unity3d.com/download_unity/292b93d75a2c/MacEditorInstaller/Unity.pkg?_ga=2.230872095.1877898192.1557134722-1654540184.1556282109"
UNITY_WINDOWS_TARGET_PACKAGE_URL="https://beta.unity3d.com/download/46dda1414e51/MacEditorTargetInstaller/UnitySetup-Windows-Support-for-Editor-2017.2.0f3.pkg"
PACKAGE_FILENAME="Unity_download.pkg"

# Downloads a file if it does not exist
download() { 
	echo "\n\nEntered download method with: $1\n\n"

	URL=$1
	FILE=`basename "$URL"`
	
	# Downloads a package if it does not already exist in cache
	if [ ! -e $UNITY_DOWNLOAD_CACHE/`basename "$URL"` ] ; then
		echo "\n\n$FILE does not exist. Downloading from $URL: \n\n"
		mkdir -p "$UNITY_DOWNLOAD_CACHE"
		curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` "$URL"
		#curl -o $UNITY_DOWNLOAD_CACHE/`basename "$URL"` gdrive.sh | bash -s $URL
		#curl gdrive.sh | bash -s $URL
	else
		echo "\n\n$FILE Exists. Skipping download.\n\n"
	fi
}

# Downloads and installs a package from an internet URL
install() {
	echo "\n\nEntered install method with: $1\n\n"
	
	PACKAGE_URL=$1
	download $1
	
	echo "\n\nInstalling `basename "$PACKAGE_URL"`\n\n"
	echo "\n\nRunning ls"
	ls
	echo "\n\nRunning ls unity_download_cache"
	ls unity_download_cache
	echo "\n\nCalling installer command with: $PACKAGE_FILENAME \n\n"
	
	sudo installer -dumplog -package $UNITY_DOWNLOAD_CACHE/`basename "$PACKAGE_FILENAME"` -target /
}



echo "\n\nContents of Unity Download Cache:\n\n"
ls $UNITY_DOWNLOAD_CACHE

echo "\n\nInstalling Unity...\n\n"
install $UNITY_OSX_PACKAGE_URL
#install $UNITY_WINDOWS_TARGET_PACKAGE_URL
