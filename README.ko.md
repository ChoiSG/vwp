# Vulnerable Wordpress (VWP) 
이 리포는 vavkamil이 만든 [Damn Vulnerable Wordpress](https://github.com/vavkamil/dvwp) 의 개조/변형된 리포입니다. 
VWP는 취약점 분석, 모의침투테스트 훈련, 그리고 소스코드 리뷰를 도와주기 위한 취약한 워드프레스 환경입니다. 

## 원본 리포 
위에 적혀있듯, 이 리포는 vavkamil 이 만든 https://github.com/vavkamil/dvwp 리포를 변형한 것입니다. 

## 설치 & 실행 
VWP 는 docker 와 docker-compose 를 이용해서 설치를 할 수 있습니다. 

```
git clone https://github.com/choisg/vwp.git
cd ./vwp
docker-compose up --build 
```

## VWP 끄기 
```
cd <Directory_to>/vwp
docker-compose down --volumes
```

## 포트 및 계정 정보 
- Wordpress - 127.0.0.1:8000
  - ```
    admin:admin
    editor:editor
    choi:password 
    ```
- PHPMyAdmin - 127.0.0.1:8001
  - ```
    server: mysql
    user: wordpress
    password: wordpress
    ```

- 해당 워드프레스를 다른 컴퓨터에서 접근하려면, 먼저 http://127.0.0.1:8081/wp-admin/options-general.php 여기로 접근한 뒤 "Wordpress Address (URL)" 을 `http://127.0.0.1:8081` 에서 다른 아이피주소로 바꾸면 된다.

## 플러그인 & 취약점 정보
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

## 플러그인 다운로드와 소스코드 분석 
플러그인들은 다음과 같은 주소에서 다운받으실 수 있습니다.  `https://downloads.wordpress.org/plugin/<plugin_name>.<version>.zip`

```
wget https://downloads.wordpress.org/plugin/iwp-client.1.9.4.4.zip
wget https://downloads.wordpress.org/plugin/social-warfare.3.5.2.zip
wget https://downloads.wordpress.org/plugin/wp-advanced-search.3.3.3.zip
wget https://downloads.wordpress.org/plugin/wp-file-upload.4.12.2.zip
wget https://downloads.wordpress.org/plugin/simple-file-list.4.2.2.zip
```

## 플러그인 추가, 버전 변경 

워드프레스 플러그인을 추가하거나 버전을 변경하려면 `./bin/install-wp.sh` 파일에서 관련된 코드를 수정해주면 됩니다. 

원하는 플러그인의 정확한 이름과 버전을 알기위해서는 아래와 같이 해주시면 됩니다. 

1. https://wordpress.org/plugins/ 을 방문한 뒤 원하는 플러그인의 이름을 검색합니다. 
2. 플러그인을 누른 뒤 오른쪽 하단의 `Advanced View` 버튼을 누릅니다.
3. 스크롤을 쭉 내려 특정한 버전을 다운받으며 파일의 이름을 자세히 봅니다. ex) `iwp-client-4.2.2.zip` 
4. `./bin/install-wp.sh` 파일에 관련된 코드를 수정합니다.