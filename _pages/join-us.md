---
layout: single
permalink: /join/
title: "تولید محتوا"
author_profile: false
excerpt: "نحوه تولید محتوا در انجمن ووفورو"
header:
  image: "http://www.webvriksha.com/pics/content.jpg"
---
شما طی چند مرحله ی ساده می تونید محتوا بسازید و در ووفورو قرار بدید. در قدم اول باید یه سری تنظیمات اولیه روی سیستمتون انجام بدید:

- یه اکانت گیت هاب بسازید، اگر همین الان دارید که چه بهتر، اگه نه از [این لینک](https://github.com/join) استفاده کنید.
- در گیت هاب [مخزن کد ووفورو](https://github.com/woforo/woforo.github.io) را `fork` کنید
(این کلمه ی مخزن ترجمه ی بیخودیه، از این به بعد Repository یا آسون تر repo صداش کنیم!):

![fork woforo](/assets/images/join/fork-woforo.png "نحوه Fork کردن ووفورو")
- نرم افزار [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) را روی سیستمتون نصب کنید.
- مشخصات گیت هابتون رو در `git` وارد کنید. برای لینوکس و مک از ترمینال و برای ویندوز از ‍‍`git bash` که توسط ‍`git`
روی سیستمتون نصب شده استفاده کنید و دستورات زیرو وارد کنید:

```bash
git config --global user.name "<اسم کاملتون>"
git config --global user.email <آدرس ایمیلی که باهاش در گیت هاب ثبت نام کردید>
```

- از پروفایل گیت هابتون repoی ووفورو را `clone` کنید:

```bash
git clone https://github.com/<github username>/woforo.github.io.git
```

- پوشه ی ‍`woforo.github.io` که توسط `clone` ایجاد شده رو باز کنید. کلی با این پوشه کار داریم، در ادامه هر مسیری که
میگم منظورم توی این پوشه هست. مثلا اگر گفتم:

`_data/authors.yml`

منظورم اینه:

`C:\Users\<user>\woforo.github.io\_data\authors.yml`

- شما آماده ی تولید محتوا هستید!

# ایجاد پروفایل نویسنده

توضیحات مربوط به نویسنده کنار مطلب درج میشه. به صورت زیر:

![author profile sample](/assets/images/join/author-profile.png "پروفایل نویسنده")

برای اضافه کردن پروفایل به عنوان نویسنده کافیه مقادیر زیرو به فایل اضافه کنید:

`_data/authors.yml`


```yml
Asghar Gholi Mirza:
  name: "اصغر قلی میرزا"
  email: "asghar@gholi.mirza"
  bio: "اهل بزمستانم، روزگارم بد نیست"
  avatar: "<لینک عکس>"
  github: "agmirza"
```

# بلاگ

مطالبی که در یک پست تموم میشن اسمشونو گذاشتیم بلاگ. برای مواقعی خوبه که پست شما یه مطلب مشخص و محدودیو بیان می کنه.

کنوانسیون اسم فایل های بلاگ به این صورته:

- مسیر:

`_posts/<github username>/`

- اسم فایل:

`<YYYY-MM-DD>-<name>.md`

که `<YYYY-MM-DD>` تاریخ میلادیه ایجاد این بلاگه و `<name>` اسم بلاگه که بعدا روی لینک هم همین اسمو میذاریم. ترجیحا اسم معنی دار بذارید
که راحت از روی این اسم بشه تشخیص داد که این کدوم بلاگ بوده.

برای مثال، نویسنده ای که در بخش قبل پروفایلشو ایجاد کردیم می تونه چنین بلاگی ایجاد کنه:

`_posts/agmirza/2017-02-13-jekyll-introduction.md`

مطالب داخل این فایل به فرمت زیر هستند:

```md
---
<front matter>
---
<محتوا>
```

در بخش `<front matter>` اطلاعات تکمیلی این محتوا مشخص میشه:

```yml
---
# لینکی که بلاگ درش قرار میگیره، با کنوانسیون زیر
permalink: /blogs/<github username>/<name>

title: "<تیتر این بلاگ>"

# کلید پروفایل نویسنده در
# authors.yml
author: <author key>

excerpt: "<خلاصه در 100 کاراکتر>"

# مقادیر زیرو اختیاری می تونید اضافه کنید

# دسته بندی ها
categories:
  - <category 1>
  - <category 2>
  - ...
# تگ ها
tags: [<tag 1>, <tag 2>, ...]

header:
  image: "<لینک عکس>"
# تاریخ آخرین تغییرات
modified: <YYYY-MM-DD>
---
```

`<محتوا>` رو به زبان بسیار آسونه [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) تالیف کنید.

بذارید یه مثال کاملم بزنم:

```md
---
permalink: /blogs/agmirza/jekyll-introduction
title: "آشنایی با Jekyll پلتفرمی برای ساختن سایت های استاتیک"
author: Asghar Gholi Mirza
exerpt: "جکیل تکنولوژی بسیار جالبی است که می توانید به سرعت با آن سایت استاتیک بسازید"
categories:
  - طراحی-وب
tags: [jekyll, static, طراحی-وب, استاتیک]
header:
  image: "https://jekyllrb.com/img/logo-2x.png"
modified: 2017-02-14
---

استفاده از جکیل خیلی آسونه.

# نصب کردن جکیل

اول باید Ruby نصب کنید.
...
```

تبریک میگم، بلاگ شما آمادس!

# آپلود کردن محتوا در ووفورو

برای اینکه محتواتون بیاد روی سایت کافیه که تغییراتتونو `commit` کنید، روی پروفایل گیت هابتون `push` کنید و یه `pull request` بفرستید:

```bash
cd woforo.github.io
git commit -m "created a blog introducing jekyll"
git push
```

حالا برید در `fork` خودتون در گیت هاب:

![pull request to woforo](/assets/images/join/pull-request.png "Pull request")

بسیار عالی. با این کار Adminهای ووفورو با ایمیلی که خود گیت هاب بهشون میزنه میفهمن که شما `pull request` فرستادین
و بلافاصله بعد از بررسی `merge` می کنند و در همون لحظه محتوای شما در دسترس میلیون ها (!) کاربر مشتاق قرار میگیره.

# سری آموزشی

مطالب مرتبطی که در یک پست جا نمیشن و در کنار هم بهتر معنی میدن رو میتونین به صورت یه سری آموزشی تدوین کنین. برای مثال
یه سری آموزشی می تونه مفاهیم مقدماتی در سی شارپ رو توضیح بده.

کنوانسیون فایل بندی یه سری آموزشی اینجوریه:

- هر سری آموزشی پوشه ی مخصوص خودشو داره در مسیر زیر:

`_series/<github username>/<name>/`

که `<name>` اسم معنی داریه که بعدا همین اسمو به لینکشم میدیم.

- هر پست از یک سری میره تو فایل خودش با پسوند `md`، برای اینکه ترتیب مشخص باشه قبل از اسم هر فایل یه عدد دو رقمی
می نویسیم. این عددا از ۱۰ شروع میشن و ۱۰ تا برای بعدی بهشون اضافه میشه. اینجوری اگه بعدا خواستیم بین دو تا پست یه
پست جدید اضافه کنیم محبور نیستیم همه ی فایلا رو `rename` کنیم، مثلا بین پست شماره ۲۰ و شماره ۳۰ راحت پست جدیدی
اضافه می کنیم با شماره ۲۵. پس یه سری فرضی به اسم `jekyll-tutorial` که دوستمون اصغر قلی میرزا می خواد بذاره
و سه تا پست داره، اسم فایلاش اینا میشه:
    - /_series/agmirza/jekyll-tutorial/10-why-jekyll.md
    - /_series/agmirza/jekyll-tutorial/20-configuring-jekyll.md
    - /_series/agmirza/jekyll-tutorial/30-site-preview.md
- هر کدوم از این فایلا مثل [بلاگ](/join#بلاگ) ها `<front matter>` دارن. کنوانسیون این `<front matter>` ها کاملا مثل
بلاگ هاست، فقط `permalink` فرق می کنه، یه کلید جدید دارن به اسم `sidebar` و اولین پست یه کلید داره به اسم `is_cover`.
بذارید فایل اولو براتون مثال بزنم:

```md
---
permalink: /series/agmirza/jekyll-tutorial/why-jekyll
title: "چرا از جکیل استفاده کنیم؟"
author: Asghar Gholi Mirza

# ساید بار
sidebar:
# یک کید برای فهرست تعریف می کنیم. ترجیحا هم اسم با خود سری آموزشی
  nav: jekyll-tutorial

# این پست صفحه ی اول است؟
is_cover: true

exerpt: "جکیل یک پلتفرم برای تولید صفحات استاتیک وب است. مقایسه جکیل با سایر گزینه ها"
categories:
  - طراحی-وب
tags: [jekyll, static, طراحی-وب, استاتیک]
header:
  image: "https://jekyllrb.com/img/logo-2x.png"
modified: 2017-02-14
---

<محتوا>
```

همون طور که خودتونم حدس میزنید کلید `is_cover` غیر از صفحه اول در بقیه صفحات نداریم.

- هر سری آموزشی فهرستی داره که کاربرا به راحتی می تونن باهاش بین صفحات مختلف اون سری بچرخند.
این فهرستو در مسیر زیر باید اضافه کنیم:

`_data/navigation.yml`

اینجوری:

```yml
# کلیدی که در
# sidebar: nav:
# وارد کردیم:
jekyll-tutorial:
# عنوان این منو، برای یکپارچگی بذارید فهرست
  - title: "فهرست"
# عنوان و لینک هر کدوم از آیتم های منو
    children:
      - title: "چرا از جکیل استفاده کنیم؟"
        url: /series/agmirza/jekyll-tutorial/why-jekyll
      - title: "نحوه تنظیم کردن جکیل"
        url: /series/agmirza/jekyll-tutorial/configuring-jekyll
      - title: "پیش نمایش سایت"
        url: /series/agmirza/jekyll-tutorial/site-preview
```

و به همین آسونی حالا شما یه سری آموزشی دارید، دمتون گرم! خسته نباشید. [بفرستید بیاد](/join#آپلود-کردن-محتوا-در-ووفورو) روی سایت.
