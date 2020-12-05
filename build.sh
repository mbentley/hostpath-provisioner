#!/bin/sh

# run glide depending on if we just need to update or not
if [ ! -d "${PWD}/vendor" ]
then
  echo "vendor not found; performing install"
  /usr/bin/glide install -v
else
  echo "vendor found; performing update"
  /usr/bin/glide update -v
fi
echo "done"; echo

echo "Building hostpath-provisioner..."
CGO_ENABLED=0 /usr/bin/go build -a -ldflags '-extldflags "-static"' -o hostpath-provisioner .
echo "done"; echo
