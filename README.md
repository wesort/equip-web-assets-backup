# equip-web assets backup

This repo exists as a backup of assets (images, PDFs, etc).

The assets are `.gitignored` from [github.com/wesort/equip-web](https://github.com/wesort/equip-web) and served to the site directly from a Digitalocean Space using a driver.

Regular cronjobs run to:
- _sync_ the files from the Space using s3cmd
- `git commit` and `git push` to GitHub


## s3cmd setup
- If a Space is not already created in Digitalocean, create one:
  - datacenter region: LON1 (London)
  - Do not "Enable CDN"
  - Spaces bucket name: `example-assets-main-01`
- Install `s3cmd` to interact with Spaces
- from root: `sudo apt install s3cmd`
- from root: `s3cmd --configure` (this will initate a config wizard)
- Accesss Key and Secret Key:
  - Digitalocean > API > Spaces access keys
  - Permissions: `All Permisssion (Bucket & Objects)`
  - Name: something like `equip-asset-backup-01`
  - Access Key: `XXX...XXXX`
  - Secret Key: `XXX...XXXX`
- Default Region: `ams3`
- S3 Endpoint: `lon1.digitaloceanspaces.com`
- DNS-style bucket+hostname:port template for accessing a bucket: `equip-assets-main-02.lon1.digitaloceanspaces.com`
- Encryption password: [something-random-_-save-it]
- Path to GPG program: `/usr/bin/gpg`
- Use HTTPS protocol: `True`
- HTTP Proxy server name:
- HTTP Proxy server port: `0`
- Test and when prompted save the config
