echo "Preparing containers for Demo.."

swift post -r ".r:*" archive
swift post -r ".r:*" current -H "X-Versions-Location: archive"

echo "Done"
swift list
swift stat archive
swift stat current
