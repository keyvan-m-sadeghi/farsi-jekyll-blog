---
permalink: /blogs/HosseinAbedi/how-to-freeze
title: مدیریت وابستگی‌ها در پایتون
author: Hossein Abedi
excerpt: ایجاد فایل وابستگی‌های یک برنامه‌ی پایتون
tags: ["dependency-management", "python", "programing"]
categories: ["python"]
---



## مدیریت کتابخانه‌ها در پایتون

یه مشکلی که من در مورد خیلی‌ها که با پایتون کد میزنن بر خوردم این بوده که آدما وقتی می‌خوان یه 
برنامه‌ی پایتون رو که نوشتن به گیت انتقال بدن و یا با داکر ازش یه ایمج بسازن اینه که آدما فایل 
`requirments.txt`
رو همراه برنامه قرار نمی‌دن تا زندگی خودشون رو راحت‌تر کنن. برای همین 
تصمیم گرفتم در قالب یه پست یه روش ایجاد این فایل رو روی
Ubuntu
و
Debian
توضیح بدم.

## نصب 

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

![](/assets/images/HosseinAbedi/images/req_0.png)

بعد اینکار برای ترمینالی که توش هستیم با دستور زیر این مفسر رو فعال می‌کنیم. در واقع تا وقتی این تب از ترمینال رو نبستیم مفسر پایتون نصب‌شده توی 
MyPython
استفاده می‌شه.

```sh
source  /home/$USER/MyPython/bin/activate 
```

![](/assets/images/HosseinAbedi/images/req_1.png)

بعد از اینکه مفسر پایتون مورد نظر رو فعال کردیم به پوشه‌ای که کد‌های خفن پایتونمون توشه می‌ریم و سعی می‌کنیم و برنامه‌ی خودمون رو اجرا کنیم.

برای مثال فرض کنین که برنامه‌ی خفن ما یه ماژول هستن که توش کد زیر اجرا میشه:

```python
import numpy as np
import pylab as plt

if __name__ == "__main__":
    
    mu = 10
    sigma = 3
    xs = sigma * np.random.randn(1000) + mu

    plt.hist(xs, bins=50)
    plt.show()

```

طی اجرای برنامه‌ها با مفسر تازه نصب‌شده پایتون برای هر کتابخونه یه ارور می‌گیریم که با استفاده از اون ارور می‌تونیم کتابخونه‌های مورد نظر رو با استفاده از
pip
برای همین مفسر نصب کنیم.

![](/assets/images/HosseinAbedi/images/req_2.png)
![](/assets/images/HosseinAbedi/images/req_3.png)
![](/assets/images/HosseinAbedi/images/req_4.png)
![](/assets/images/HosseinAbedi/images/req_5.png)


بعد از نصب همه‌ی کتابخونه‌ها، دیگه برنامه‌ی ما به خوبی اجرا می‌شه. بعد از نصب کتابخونه‌ها ما اسم و ورژن کتابخونه‌های این برنامه رو توی یه فایل تکست که معمولا اسمش هست
requirements.txt
رو
با دستور زیر ذخیره می‌کنیم.

```sh
pip freeze >> requirements.txt 
```
بعد از اینکار مفسر نصبشده رو غیر فعالش می‌کنیم.

```sh
deactivate 
```
![](/assets/images/HosseinAbedi/images/req_6.png)
![](/assets/images/HosseinAbedi/images/req_7.png)

## استفاده از فایل وابستگی‌ها

هر کس اگه خواست از برنامه‌ی ما
استفاده کنه به راحتی می‌تونه وابستگی‌های برنامه رو با داشتن فایل
requirements.txt 
با 

```sh
sudo pip3 install -r requirements.txt
```
نصب کنه!

