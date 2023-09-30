# Static site template

## Deploying the static site

1. Copy the `sample.env` file to `.env` and edit the contents
2. Run `./deploy --push`

## Setting up the server

> This assumes you have a domain name `example.org` pointing to your server

1. ssh into the server
2. Install nginx `sudo apt update && sudo apt install -y nginx`
3. Create a file `/etc/nginx/sites-available/example.org` and add the following contents
```
server {
  listen 80;
  listen [::]:80;

  server_name example.org;

  root /var/www/public;
  index index.html;
}
```
4. Symlink to sites-enabled `ln -s /etc/nginx/conf.d/sites-available/nginx.conf /etc/nginx/conf.d/sites-enabled`
5. Restart the nginx daemon `sudo systemctl restart nginx`
6. Install certbot `sudo snap install --classic certbot`
7. Install ssl certificates `sudo certbot --nginx`
