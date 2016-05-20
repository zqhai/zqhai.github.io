FROM hub.c.163.com/nce2/nodejs:0.12.2
MAINTAINER 0@zhangqianhai.com

# 修改源列表
RUN wget http://mirrors.163.com/.help/sources.list.vivid
RUN cp -f sources.list.vivid /etc/apt/sources.list

RUN apt-get update

# 安装环境
RUN apt-get install -y --force-yes ruby
RUN apt-get install -y --force-yes ruby-dev
#RUN apt-get install -y nodejs
RUN apt-get install -y --force-yes gcc
RUN apt-get install -y --force-yes make

# 修改gem sourece
RUN gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/

RUN gem install jekyll

# jekyll build 依赖
RUN gem install jekyll-paginate

COPY . /srv/jekyll
WORKDIR /srv/jekyll

RUN jekyll bulid

CMD jekyll serve