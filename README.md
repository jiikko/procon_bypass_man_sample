# procon_bypass_man_sample
https://github.com/splaspla-hacker/procon_bypass_man を使ったサンプルです

## インストール
```
ssh pi@pi.local
mkdir -p ~/src
cd ~/src
git clone https://github.com/jiikko/procon_bypass_man_sample.git
cd procon_bypass_man_sample
rbenv install 3.0.1
sudo gem i bundler
```

## 使い方
```shell
bundle exec sudo ruby app.rb
```

systemdのserviceとして登録することsshが要らなくなります

### web からの場合
* Open http://pi.local:9090
