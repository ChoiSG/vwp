
# Vulnerable Wordpress (VWP) 
This repo is a modified version of the DVWP made by vavkamil - https://github.com/vavkamil/dvwp . 

VWP is an intentionally created vulnerable wordpress environment made for vulnerability research, penetration testing practices, and source code review. 

한글 문서를 보시려면 [README.ko.md](README.ko.md) 를 참고해주세요.

## Credits
As mentioned above, this repo is a modified/forked version of DVWP made by vavkamil - https://github.com/vavkamil/dvwp . All credits goes to vavkamil. 

## Installation 
VWP requires docker and docker-compose.
```
git clone https://github.com/choisg/vwp.git
cd ./vwp
docker-compose up --build 
```

## Shutdown
```
cd <Directory_to>/vwp
export IP_ADDRESS=$(hostname -I | awk '{print $1}')
export HOST_IP_ADDRESS=$(hostname -I | awk '{print $1}')
docker-compose down --volumes
```

## Services & Default Credentails
- Wordpress - 127.0.0.1:8081
  - ```
    admin:admin
    editor:editor
    choi:password 
    ```
- PHPMyAdmin - 127.0.0.1:8082
  - ```
    server: mysql
    user: wordpress
    password: wordpress
    ```

- Do visit the wordpress from another machine, you need to change Wordpress Address (URL) from http://127.0.0.1:8081/wp-admin/options-general.php . Then, change `http://127.0.0.1:8081` to whatever IP Address you have.

## Plugins 
* [InfiniteWP Client < 1.9.4.5 - Authentication Bypass](https://wpvulndb.com/vulnerabilities/10011)
  - CVE-2020-8772

* [WordPress File Upload < 4.13.0 - Directory Traversal to RCE](https://wpvulndb.com/vulnerabilities/10132)
  - CVE-2020-10564

* [Social Warfare <= 3.5.2 - Unauthenticated Arbitrary Settings Update](https://wpvulndb.com/vulnerabilities/9238)
  - CVE-2019-9978

* [WP Advanced Search < 3.3.4 - Unauthenticated Database Access and Remote Code Execution](https://wpvulndb.com/vulnerabilities/10115)
  - no CVE

* [Simple File List <= 4.2.2](https://www.cybersecurity-help.cz/vdb/SB2020042711)
  - no CVE

## Download Plugin's Source code 
All plugins can be downloaded from `https://downloads.wordpress.org/plugin/<plugin_name>.<version>.zip`

```
wget https://downloads.wordpress.org/plugin/iwp-client.1.9.4.4.zip
wget https://downloads.wordpress.org/plugin/social-warfare.3.5.2.zip
wget https://downloads.wordpress.org/plugin/wp-advanced-search.3.3.3.zip
wget https://downloads.wordpress.org/plugin/wp-file-upload.4.12.2.zip
wget https://downloads.wordpress.org/plugin/simple-file-list.4.2.2.zip
```

## Adding/Modifying Plugins 

Add/Modify plugin names and versions from `./bin/install-wp.sh` file. 
For specific plugin files, search the following. 

1. Visit https://wordpress.org/plugins/ and search your plugin name 
2. On the right side, click on `Advanced View`
3. Scroll down to `Please select a specific version to download`, and find the version name. Remember the filename when you download it ex) `iwp-client-4.2.2.zip` 
4. Edit `./bin/install-wp.sh`
