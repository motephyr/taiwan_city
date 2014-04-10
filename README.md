# TaiwanCity 台灣縣市下拉列表 

此rubygem 程式結構以[china_city](https://github.com/saberma/china_city)做參考，保留大部分原文說明。只在不同處做修改

支持 Rails3.1, Rails3.2, Rails4.0。

请留意，Rails3.1 与 Ruby2.0 不兼容，sprockets 无法正常解析 application.js，请使用 Ruby1.9。

## 简介

这是一个基于 Rails Engine 开发的插件，為 Rails 專案增加縣,市區二級下拉列表。

## 安装

### Gemfile

    gem 'taiwan_city'

### app/assets/javascripts/application.js

    //= require 'jquery'
    //= require 'taiwan_city/jquery.taiwan_city'

### config/routes.rb

    mount TaiwanCity::Engine => '/taiwan_city'

## 使用

在页面中加入选择框，示例代码使用 slim 格式

```ruby
  .city-group
    select.city-select
      option --省份--
      = options_for_select(TaiwanCity.list)
    select.city-select
      option --城市--
    select.city-select
      option --地区--
```

请留意：所有选择框都要有 `city-select` class，并都包含于 class='city-group' 的 DOM 元素之下。

選擇後的值為台灣的郵遞區號。

## 贡献

```bash
git clone https://github.com/motephyr/taiwan_city.git
cd taiwan_city
rake appraisal:install
cd spec/dummy
rails server # http://localhost:3000/taiwan_city
```

## 感謝作者

* [saberma](https://github.com/saberma)
