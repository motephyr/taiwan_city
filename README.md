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
      option --縣市--
      = options_for_select(TaiwanCity.list)
    select.city-select
      option --鄉鎮市區--
```

请留意：所有选择框都要有 `city-select` class，并都包含于 class='city-group' 的 DOM 元素之下。

選擇後的值前2碼為個人自行編碼，後3碼為台灣的郵遞區號。

```
        {"text": "臺北市" ,"id": "01000"},
        {"text": "新北市" ,"id": "02000"},
        {"text": "基隆"   ,"id": "03000"},
        {"text": "桃園"   ,"id": "04000"},
        {"text": "新竹"   ,"id": "05000"},
        {"text": "苗栗"   ,"id": "06000"},
        {"text": "台中"   ,"id": "07000"},
        {"text": "彰化"   ,"id": "08000"},
        {"text": "南投"   ,"id": "09000"},
        {"text": "雲林"   ,"id": "10000"},
        {"text": "嘉義"   ,"id": "11000"},
        {"text": "台南"   ,"id": "12000"},
        {"text": "高雄"   ,"id": "13000"},
        {"text": "屏東"   ,"id": "14000"},
        {"text": "宜蘭"   ,"id": "15000"},
        {"text": "花蓮"   ,"id": "16000"},
        {"text": "台東"   ,"id": "17000"},
        {"text": "澎湖"   ,"id": "18000"},
        {"text": "金門"   ,"id": "19000"},
        {"text": "馬祖"   ,"id": "20000"},
        {"text": "離島地區","id": "21000"}
```

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
