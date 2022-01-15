no longer using this due perfromance issue use rclone

# wordops-backup-sftp

WordOps easy backup

This bash script will take backup of your wordops wordpress installation and upload it on remote server via sftp
currently only support single website

## Pre requirties :

- create backup dir in /var/www/
- install lftp

## First time setup:

```
wget https://raw.githubusercontent.com/harsh8511/wordops-backup-sftp/main/bak.sh && chmod +x bak.sh
```

## Then

Edit the 2-8 lines of bak.sh in nano editor with your own website domain , SFTP credentials and your file paths.

## Run backup

run ```./bak.sh``` to intiate backup.

## Automate backup

you can automate backup using cron job

run
```crontab -e```

add this job
```0 0 * * * ./bak.sh >/dev/null 2>&1```

this will take your wordpress website backup everyday midnight and upload it on remote sftp server.
