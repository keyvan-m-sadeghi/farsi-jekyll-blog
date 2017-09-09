---
permalink: /series/HosseinAbedi/optimization/optimization-intro-2
title: نزول در جهت گرادیان
author: Hossein Abedi
excerpt: معرفی بهینه‌سازی به همراه بررسی تعدادی از روش‌های متداول بهینه‌سازی به همراه مثال
is_cover: false
---

##  نزول در جهت گرادیان

نزول در جهت گرادیان
(Gradient Descent)
یه الگوریتم معروفه
که زیرمجموعه‌ی دسته‌ای از الگوریتم‌ها به نام الگوریتم‌های جستجوی خطی (line search)
قرار می‌گیره.
توی این دسته از روش‌ها ایده‌‌ی اصلی اینه که یه جهت در فضای برداری مسله پیدا می‌کنیم و به صورت تکراری در جهت اون مسیر با اندازه قدم‌هایی معیین حرکت می‌کنیم.
تحت شرایطی این جور حرکت کردن میتونه منجر به جواب‌های خیلی خوبی بشه.

## ایده‌‌ی کلی روش

در این روش 

* یه مقدار شروع به صورت دلخواه انتخاب می‌کنیم 
(به بردار مثل 
$$X_0$$)
که توی دامنه‌ی جستجومون باشه.

* بعد از اینکار یه مقدار آلفا
($$\alpha \in (0, 1)$$)
بنا به شرایط مساله انتخاب می‌کنیم. به این پارامتر می‌گن نرخ یادگیری الگوریتم.

* گرادیان تابع هدف رو محاسبه می‌کنیم:

\begin{align}
F(x_1, x_2, ..., x_D) \rightarrow \nabla{F(x_1, x_2, ..., x_D)} =  [\frac{\partial{F}}{\partial{x_1}},...,\frac{\partial{F}}{\partial{x_D}}] ^ T
\end{align}

* با فورمول زیر به صورت تکراری سعی می‌کنیم به سمت نقطه‌ی بهینه حرکت کنیم:

\begin{align}
X_{i + 1} = X_i - \alpha \nabla{F(X_i)},~ i=1, 2, ...
\end{align}

 ويژگی‌های این روش به‌ شرح هستن:

* همونجور که از بخش محاسبه‌ی گرادیان معلومه، تابع ما باید مشتق‌پذیر باشه که برای همین می‌تونه برای خیلی از مسائل این روش قابل استفاده نباشه
(البته بعضی روش‌ها برای تقریب گرادیان هم وجود داره که ممکنه برای توابعی که مشتق ندارن قابل استفاده باشه)
.
* این روش خیلی سادس و هزینه‌ی محاسباتی چندان زیادی هم نداره 
(نسبت به بعضی روش‌ها که ارزیابی‌های تابع زیادی توشون باید صورت بگیره)
.
* سرعت همگرایی این روش خطیه و ممکنه در خیلی از کابرد‌ها چندان مطلوب نباشه.
* وقتی تابع هدف محدب نباشه این روش خیلی راحت توی بهینه‌ی محلی گیر میوفته.

## پیاده‌سازی

 برای مثال، تابع
[Rosenbrock](https://en.wikipedia.org/wiki/Rosenbrock_function)
رو در نظر بگیرین. این تابع یه تابع دوبعدی غیر محدب (non-convex) هست که به عنوان یه تابع محک برای بررسی عملکرد روش‌های بهینه‌سازی مورد استفاده قرار می‌گیره.
این تابع شکل هندسیش یه دره‌ی عمیقه که نقطه‌ی بهینش در
$$(1, 1)$$
قرار گرفته که که برابر صفره. الگوریتم‌ها باید تا حد ممکن به کف این دره که توش نقطه‌ي کمینه قرار گرفته حرکت‌ کنن.

\begin{align}
&F(x_1, x_2) = (1-x_1)^2 + 100(x_2 - x_1^2)^2 \newline
&\nabla{F(x_1, x_2)} = [-2(1-x_1) -400x_1(x_2 - x_1^2), 200(x_2 - x_1^2)] ^ T
\end{align}

```python
import numpy as np
import matplotlib
import matplotlib.pylab as plt
from time import time
%matplotlib inline
matplotlib.rcParams['figure.figsize'] = (10, 10)

def f(x_1: 'component 1', x_2: 'component 2') -> 'F(x_1, x_2)':
    """Rosenbrock function in 2D, for more information please have a look at 
       `https://en.wikipedia.org/wiki/Rosenbrock_function`
    """
    return (1 - x_1) ** 2 + 100 * (x_2 - x_1 ** 2) ** 2

def gradient_of_objective_function(x_1: 'component 1', x_2: 'component 2') -> '\nabla{F(x_1, x_2)}':
    """Gradinet of Rosenbrock function in 2D, for more information please have a look at 
       `https://en.wikipedia.org/wiki/Rosenbrock_function`
    """
    return np.asarray([-2 * (1 - x_1) - 400 * x_1 * (x_2 - x_1 ** 2), 200 * (x_2 - x_1 ** 2)])

start = time() # a varibale for storing the starting time of the algorithm
gradient_function = gradient_of_objective_function # gradient of objective function to be `minimized` 
alpha = 0.005 # learning rate
x = np.asarray([0, 0]) # initial solution 
max_iteraions = 200 # number of iterations
function_evaluations = [] # a list for saving the progress of SA

for i in range(max_iteraions):
    x = x - alpha * gradient_function(x_1=x[0], x_2=x[1]) 
    function_evaluations.append(f(x_1=x[0], x_2=[1]))

end =  time() # it is all done!
print("best solution found is: ", "(" + str(x) + "," + str(function_evaluations[-1]) + ")")
print("It took about ", end - start,  " seconds")  

plt.plot(function_evaluations)
plt.xlabel('# function evaluations')
plt.ylabel('f(best_solution)')
```
```sh
best solution found is:  ([0.75650369  0.38004224], 18.35220503)
It took about  0.007579326629638672  seconds
```

![gd](/assets/images/HosseinAbedi/images/opt_2.png)
