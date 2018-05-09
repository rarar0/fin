## How I got an HTTPS SSL certificate with certbot

Matthew directed me toward this source on how to use certbot: 

https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-14-04

Here are the steps I followed

1) Install certbot with apt-get

```
sudo apt-get update && apt-get install python-certbot-apache
```

2) Add firewall rules!

You need to allow tcp/udp traffic on ports 80 for HTTP and 443 for HTTPS, this can be done in 4 commands.
```
sudo iptables -I INPUT -i eth0 -p udp --dport 80 -j ACCEPT
sudo iptables -I INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
sudo iptables -I INPUT -i eth0 -p tcp --dport 443 -j ACCEPT
sudo iptables -I INPUT -i eth0 -p udp --dport 443 -j ACCEPT
```
Note that the "-i eth0" command is not required

You can list all iptable rules with ```sudo iptables -L```


3)Run certbot and insert the domain you wish to get an SSL cert for

```
sudo certbot --apache -d example.com
```

* If you are having troubles around this step like I did, you may have to restart the apache service using systemctl

```
sudo systemctl restart apache2
```

```
sudo systemctl status apache2
```

And that should be it! The certbot will give you a link to ssllabs allowing you to check and see if you have a working
SSL certificate!

[Image](https://i.imgur.com/pocPsdK.png)
