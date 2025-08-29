#!/bin/bash
# make executable: chmod +x s3cmd-main-sync-down.sh
s3cmd sync -r --skip-existing --verbose --delete-removed s3://equip-assets-main-02/ ~/backup-equip-assets/assets/

# If RemoteDisconnected error add: --no-check-md5
# ie: https://github.com/s3tools/s3cmd/issues/960
# s3cmd sync -r --skip-existing --verbose --delete-removed --no-check-md5 s3://equip-assets-main-02/ ~/backup-equip-assets/assets/
