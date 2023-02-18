# ベースイメージの設定で基本的にFROMが１行目に来る
FROM ruby:3.0.1

# rails c中に日本語入力するための設定
ENV LANG C.UTF-8

# コンテナ内でDockerイメージを作成するためのコマンド（必要なパッケージをインストール）
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# yarnパッケージ管理ツールをインストール
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
    && apt-get install apt-transport-https \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y nodejs \
    && mkdir /base


# これ以降で実行するコマンドのディレクトリを指定
WORKDIR /base

# コピーしたいもの（ホスト側）をコンテナのディレクトリに追加する
COPY Gemfile /base/Gemfile
COPY Gemfile.lock /base/Gemfile.lock

RUN gem install bundler
RUN bundle install

# puma.sockを配下するディレクトリを作成
RUN mkdir -p tmp/sockets