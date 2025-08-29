# equip-web assets backup

This repo exists as a backup of assets (images, PDFs, etc).

The assets are `.gitignored` from [github.com/wesort/equip-web](https://github.com/wesort/equip-web) and served to the site directly from a Digitalocean Space using a driver.

## Regular cronjobs run to:
- To _sync_ the files from the Space using s3cmd (every 4 hours on the hour) `0 */4 * * *`
- To _commit_ and _push_ to GitHub (every 4 hours at 5 minutes past the hour) `5 */4 * * *`

## s3cmd setup (using `example` naming)
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
  - Name: something like `example-asset-backup-01`
  - Access Key: `XXX...XXXX`
  - Secret Key: `XXX...XXXX`
- Default Region: `lon1`
- S3 Endpoint: `lon1.digitaloceanspaces.com`
- DNS-style bucket+hostname:port template for accessing a bucket: `example-assets-main-01.lon1.digitaloceanspaces.com`
- Encryption password: [something-random-_-save-it]
- Path to GPG program: `/usr/bin/gpg`
- Use HTTPS protocol: `True`
- HTTP Proxy server name:
- HTTP Proxy server port: `0`
- Test and when prompted save the config
