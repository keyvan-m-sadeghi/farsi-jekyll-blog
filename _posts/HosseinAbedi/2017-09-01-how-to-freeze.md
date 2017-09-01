---
permalink: /blogs/HosseinAbedi/how-to-freeze
title: مدیریت وابستگی‌ها در پایتون
author: Hossein Abedi
excerpt: ایجاپ فایل وابستگی‌های یک برنامه‌ی پایتون
tags: ["dependency-management", "python", "programing"]
categories: ["python"]
---



# مدیریت کتابخانه‌ها در پایتون

یه مشکلی که من در مورد خیلی بهش که با پایتون کد میزنن بر خوردم این بوده که آدما وقتی می‌خوان یه 
برنامه‌ی پایتون رو که نوشتن به گیت انتقال بدن و یا با داکر ازش یه ایمج بسازن اینه که آدما فایل 
`requirments.txt`
رو همراه برنامه قرار نمی‌دن تا زندگی خودشون رو راحت‌تر کنن. برای همین 

# نصب 

* اول 
virtual enviroment 
پایتون رو با دستور زیر نصب می‌کنیم:

```sh
sudo pip3 install -U virtualenv
```

* بعد از نصب 
virtualenv، 
با دستور زیر یه پوشه می‌سازیم که توش یه مفسر پایتون خشک و خالی نصب شده!

```sh
virtualenv  home/$USER/MyPython
```

بعد اینکار باید برای این ترمینالی که توش هستم

