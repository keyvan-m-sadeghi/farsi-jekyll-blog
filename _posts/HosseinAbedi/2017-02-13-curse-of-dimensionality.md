---
permalink: /blogs/HosseinAbedi/curse-of-dimensionality
title: Curse of Dimensionality And Dimensionality Reduction
author: Hossein Abedi
excerpt: "A brief Introduction to Curse of Dimensionality"
tags: ["dimensionality-reduction", "curse-of-dimensionality", "ML"]
categories: ["machine-learning"]
header:
  image: "/assets/images/HosseinAbedi/headers/cod.png"
---

## Introduction

This could mean a lot of things in different contexts but in the context of machine learning, it a is simple but important concept. I am going to describe it in an example:

* Assume that you have plotted a square in the $$x-y$$ plane $$(D=2)$$ with side length of $$ n \in N$$ and then you partition each side of this square into $$n$$ mutually exclusive line segments with length $$1$$. By doing this you can create a checkerboard of  $$n\times n = n^2$$ unit squares.
* Then scatter $$N$$ uniformly generated points described by coordinates $$(x, y)$$ in the big square.
* The density of the data points in this space (big square) is $$\frac{N}{n^2}$$.
* We have on average $$\frac{N}{n^2}$$ points in each unit square.
* Repeat the plotting again but this time set $$D=3$$ (i.e. $$x-y-z$$ space) and partition the cube with side length of $$n$$ into $$n^3$$ unit cubes.
* Then we scatter $$N$$ uniformly generated points with coordinates $$(x, y, z)$$ in the big cube.
* This time the density of the data points in this space (big cube) is $$\frac{N}{ n^3}$$.
* We have on average $$\frac{N}{n^3}$$ points in each unit cube.
* As you can see, as $$D$$ gets bigger and bigger with limited number of the existing data $$(N)$$, many of this squares and cubes (hyper-cubes in bigger dimensions) will be empty (pay attention to the exponential growth of the number of hyper-cubes i.e. $$n^D$$) whereas the number of the data points does not grow exponentially (as shown in the figure below).  This results in a sparse representation of the $$N$$ data points (on average $$\frac{N}{n^d}$$ data points for each hyper-cube!) and could cripple many algorithms because these algorithms usually need **sufficient** number of data points in a space with dimension $$D$$ but as as you will experience in the real world, most of the time, the set of data points is not **big enough**!

![](/assets/images/HosseinAbedi/images/cod0.png)
<center>the volume of the space grows exponentially with increase in D</center>

## PCA

Many methods have been introduced through the years for dimensionality reduction. Among them, we can consider PCA (Principle Component Analysis) and its derivatives the most common ones. In the simple version of PCA, we calculate the covariance matrix (that is symmetrical and semi-definite positive, so it eigen values are non-negative) $$\Sigma$$ of the data points and then decompose it to  $$\Sigma=\Phi^T \Lambda \Phi$$ where
$$\Lambda$$ is a diagonal matrix of sorted eigen values of $$\Sigma$$ and $$\Phi$$ is the matrix of corresponding eigen vectors.
After finding the eigen vectors (that are mutually perpendicular), it is an easy task to transform the old data to the new vector space knowing that we could compress a possibly huge amount of information (could say variation or variance) of the orginal data is preserved in a few components of the transformed points.  
Here the real numbers representing the eigen values are associated with the amount of information that the corresponding dimension contain, so after the calculations we take **k dimensions** of the all dimensions with the biggest eigen values and dump the rest!

**Note**: In a ***representational point of view***, by applying PCA we reduce the dimensions but this does not mean that we dumped the irrelevant features and preserved the relevent ones.
The main benefits of applying PCA are
* to reduce the computational cost subject to the fact that the most information be preserved,
* and solve the problem of having not enough data points in a relatively big space.

Despite the benefits of PCA we should not forget that the chosen set of dimensions can not guarantee better performance in a ***predictor's point of view***.

## Sample Codes

```python
import numpy as np
from sklearn.decomposition import PCA
X = np.array([[-1, -1], [-2, -1], [-3, -2], [1, 1], [2, 1], [3, 2]])
pca = PCA(n_components=2)
pca.fit(X)
PCA(copy=True, n_components=2, whiten=False)
print(pca.explained_variance_ratio_) 
```

## More Stuff

* [Python example](http://scikit-learn.org/stable/modules/generated/sklearn.decomposition.PCA.html)
* [R example](http://www.r-bloggers.com/pca-and-k-means-clustering-of-delta-aircraft)
