---
layout: single
permalink: /join/
title: "تولید محتوا"
author_profile: false
excerpt: "نحوه تولید محتوا در انجمن ووفورو"
---
شما طی چند مرحله ی ساده می تونید محتوا بسازید و در ووفورو قرار بدید. یه سری تنظیمات اولیه رو سیستمتون باید انجام بدید:

- یه اکانت گیت هاب بسازید، اگر همین الان دارید که چه بهتر، اگه نه از [این لینک](https://github.com/join) استفاده کنید.
- نرم افزار [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) را روی سیستمتون نصب کنید.
- مشخصات گیت هابتون رو در git وارد کنید. برای لینوکس و مک از ترمینال و برای ویندوز از ‍‍`git bash` که توسط ‍`git` روی سیستمتون نصب شده استفاده کنید
و دستورات زیرو وارد کنید:

```bash
git config --global user.name "<اسم کاملتون>"
git config --global user.email <آدرس ایمیلی که باهاش در گیت هاب ثبت نام کردید>
```

- مخزن کد ووفورو را `clone` کنید (این کلمه ی مخزن ترجمه ی بیخودیه، از این به بعد Repository یا آسون تر repo صداش کنیم!):

```bash
git clone https://github.com/woforo/woforo.github.io.git
```

- پوشه ی ‍`woforo.github.io` که توسط `clone` ایجاد شده رو باز کنید. کلی با این پوشه کار داریم، در ادامه هر مسیری که میگم منظورم توی این پوشه هست.
مثلا اگر گفتم مسیر `_data/authors.yml` منظورم اینه ‍‍`C:\Users\<user\woforo.github.io\_data\authors.yml>`.
- شما آماده ی تولید محتوا هستید!

# ایجاد پروفایل نویسنده


