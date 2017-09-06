---
permalink: /series/HosseinAbedi/optimization/optimization-intro-1
title: بهینه‌سازی
author: Hossein Abedi
excerpt: معرفی بهینه‌سازی به همراه بررسی تعدادی از روش‌های متداول بهینه‌سازی به همراه مثال
is_cover: false
---

##  سردکردن تدریجی فلزات

سردکردن تدریجی فلزات 
(Simulated Annealing)
یه الگوریتم معروف توی بهینه‌سازیه که
ایدش خیلی نسبتا سادس ولی کاربردای زیادی توی حل مساله‌های مختلف داره.
  
## ایده‌‌ی کلی روش
در این روش مثل خیلی از روش‌های دیگه‌ی بهینه‌سازی فرض بر اینه که ما می‌خواهیم فضای جستجوی مساله‌ رو طوری بگردیم که به یه نقطه‌ی بهینه‌ی سراسری (global optimum) برسیم. طبق معمول مشکل ما اینه که الگوریتم‌ها هیچ دانشی ممکنه از فضای جستجو نداشنه باشن و فقط در هر قدم می‌تونن چند تا ارزیابی تابع انجام بدن یعنی فقط می‌تونن تا حدی حدث بزنن که 
**عرصه‌ی شایستگی** (fitness landscape) 
 اطرافشون چه شکلیه.
در واقع بفهمن که از نظر بهینگی منطقه‌ای که الان توش هستن چقدر از نواحی قبلی بهتر بوده.

در صورتی هم که تابع مورد نظر چند قله‌ای باشه (که معمولا هم هست) کلا فرار از نقاط بهینه‌ی محلی (local optimum) مشکل بزرگ روش‌های مورد استفادس که هر کدوم یک یا چند تا مکانیزم برای فرار از اون‌ها و رسیدن به نقاط بهینه‌ی سراسری رو استفاده می‌کنن.

![شایستگی](/assets/images/HosseinAbedi/images/opt_0.png)

این روش
 با یه **نامزد جواب** 
  به صورت تصادی شروع می‌کنه و به صورت یکنواخت فضا رو می گرده. در اول کار جواب‌هایی رو که از جواب فعلی بدتر‌ هستن رو با یه احتمالی می‌پذیره ولی به مرور زمان این احتمال که جواب‌های بدتر رو بپذیره با یه مکانیزمی کمتر می‌شه. در واقع در اول کار **جستجوی عمومی** (الگوریتم بخش زیادی از فضا رو می‌گرده)
زیادی داریم و در آخرای کار برعکس میزان جستجوی **جستجوی محلی** (جستجو بیشتر اطراف بهترین جاییه که تا حالا پیدا کردیم) خیلی زیاد می‌شه. 
  
  ويژگی‌های این روش به‌ شرح هستن:
* استفاده در بهینه‌سازی پیوسته و گسسته: خیلی از روش‌های معروفی که وجود دارن برای بهینه‌سازی پیوسته تعریف شدن و زمانی که فضای جستجو گسسته‌ هستش قابل استفاده نیستن. مثلا برای کارایی مثل حل مساله‌ی سودوکو و یا انتخاب ویژگی در مسائل یادگیری ماشین می‌شه از
SA
استفاده کرد.
* این روش یه روش  احتمالاتی 
(stochastic)
حساب می‌شه که در هر تکرار با مقدار شروع مختلف ممکنه جواب‌هایی متفاوت به ما بده. ولی در کل مزایای خیلی از روش‌های احتمالاتی دیگرم مثل عدم احتیاج به مشتق تابع هدف و زمان نسبتا کوتاه اجرا رو داراست.
* این متد یه روش تک‌جوابی به حساب میاد و وقتی هزینه‌ی ارزیابی‌های تابع خیلی ممکنه بالا باشه ممکنه خیلی به کار بیاد. در عین حال خیلی هم سادس و فهمیدن مکانیزم اجرای نسخه‌های مختلف این الگوریتم چندان زیاد نیست.

## مراحل الگوریتم


مراحل اجرای این الگوریتم (نسخه‌‌ای که اینجا توضیح می‌دم نسبتا خیلی سازدس ولی 
نسخه‌های پیچیده‌تر از این با بهبود بخش‌های مختلف همین نسخه قابل ایجادن)
 برای یه مساله‌ی کمینه‌سازی به شرح زیره:

 
* یه نامزد جواب به صورت تصادفی در فضای جستجو ایجاد می‌کنیم و اون رو ارزیابی می‌کنیم:

$$(x_{old}, f(x_{old}))$$

* یه مقدار اولیه‌ی درجه‌‌ی حرارت به همراه یه روش برای کاهش حرارت در هر تکرار انتخاب می‌کنیم:

روش کاهش حرارت هم می‌تونه به صورت

\begin{align}
&t_0 = 1 \newline
&\alpha \in (0, 1), (e.g~\alpha=0.9) \newline
&t_1 = t_0 \newline
&t_{i + 1} = t_i . \alpha, i = 1, 2, 3, .. 
\end{align}


* یه نامزد جواب دیگه هم به در همسایگی قبلی با یه روشی مثلا تپه‌نوردی تولید می‌کنیم و مقدار تابع به ازای اون رو حساب می‌کنیم:

$$(x_{new}, f(x_{new}))$$

* اگر مقدار نامزد جواب اولی بیشتر از دومی بود اولی رو با دومی جایگزین می‌کنیم.
* اگر نامزد جواب تولید شده‌ی دومی بیشتر از اولی بود (جواب دوم بدتر از اولی بود)
به احتمالی که متناسب با

\begin{align}
\exp{(-\frac{(f_new - f_old)}{t_i})}
\end{align}

در هر تکرار جواب بدتر رو می‌پذیریم.

* مراحل الگوریتم رو از بخش جستجوی‌ محلی تا انتهای مقدار ارزیابی‌های مجاز دوباره تکرار می‌کنیم.

## پیاده‌سازی 

مثال زیر رو که مربوط به تابع
[Holder table function](https://en.wikipedia.org/wiki/Test_functions_for_optimization)
هستش رو در نظر بگیرین. این تابع یه تابع دوبعدی هستش که به عنوان یه تابع محک برای بررسی عملکرد روش‌های بهینه‌سازی مورد استفاده قرار می‌گیره.
این تابع توی دامنه‌ی جستجوی خودش چندتا نقطه‌ی بهینه‌ی سراسری و تعداد زیادی نقطه‌ی بهینه‌ی محلی داره.
```python 
import numpy as np

def f(s: 'candidate solution') -> 'f(x)':
    """Holder table function, for more information please have a look at 
       `https://en.wikipedia.org/wiki/Test_functions_for_optimization`
    """
    x = s[0]
    y = s[1]
    return -np.abs(np.sin(x) *np.cos(y) * np.exp(np.abs(1 - np.sqrt(np.power(x, 2) + np.power(y, 2)) / np.pi)))
```
با یه پیاده‌سازی خیلی ساده از
SA
سعی می‌کنیم مقدار بهینه‌ی این تابع رو پید کنیم.

```python
import numpy as np
import matplotlib
import matplotlib.pylab as plt
from time import time
%matplotlib inline
matplotlib.rcParams['figure.figsize'] = (10, 10)

def f(s: 'candidate solution (a numpy array)') -> 'f(x)':
    """Holder table function, for more information please have a look at 
       `https://en.wikipedia.org/wiki/Test_functions_for_optimization`
    """
    x = s[0]
    y = s[1]
    return -np.abs(np.sin(x) * np.cos(y) * np.exp(np.abs(1 - np.sqrt(np.power(x, 2) + np.power(y, 2)) / np.pi)))

def check_boundary(s: 'candidate solution (a numpy array)', boundaries: """
    a tuple (lb, ub) containing lb: lower bound,
    ub: upper bound of the search space""") -> 'candidate solution in the given search space':
    s[s < boundaries[0]] = boundaries[0]
    s[s > boundaries[1]] = boundaries[1]
    return s
    
    
start = time() # a varibale for storing the starting time of the algorithm
objective_function = f # the objective function to be `minimized` 
t_0 = 1 # the initial temperature 
alpha = 0.3 # annealing factor
t = t_0 # the temperature during the annealing process (out annealing scheme is `t_new = t_old * alpha`) 
dim = 2 # dimesion of the search space
boundaries = (-10, 10) # lower and upper boundaries of the search space
x_old = np.random.rand(dim) * (boundaries[1] - boundaries[0]) + boundaries[0] # initializig the solution
f_old = objective_function(x_old) # evalution of the initial solution
max_iteraions = 200 # number of iterations
function_evaluations = [] # a list for saving the progress of SA

for i in range(max_iteraions):
    x_new = x_old + np.random.randn(dim)
    x_new = check_boundary(x_new, boundaries)
    f_new = objective_function(x_new)
    
    if f_new < f_old:
        f_old = f_new
        x_old = x_new
    else:
        delta = f_new - f_old
        p = np.random.rand()
        if p < np.exp(- delta / t):
            f_old = f_new
            x_old = x_new
        
    function_evaluations.append(f_old)
    t = t * alpha

end =  time() # it is all done!
print("best solution found is: ", "(" + str(x_old) + "," + str(f_old) + ")")
print("It took about ", end - start,  " seconds")  

plt.plot(function_evaluations)
plt.xlabel('# function evaluations')
plt.ylabel('f(best_solution)')
```
```sh
best solution found is:  ([7.88728032  9.769077],-18.8318390538)
It took about  0.008672714233398438  seconds
```

![sa](/assets/images/HosseinAbedi/images/opt_1.png)

مقدار بهینه‌ی تابع در
(۱۰ و ۱۰-)
برابر با 
۱۹/۲۰۸۵-
هستش و این پیاده‌سازی توی یه نقطه‌ی بهینه‌ی محلی افتاده ولی به نظرم برای یه پیاده‌سازی خیلی ساده چندان بد نیست.  
