---
permalink: /blogs/HosseinAbedi/moving-z-score
title: Moving Z-Score
author: Hossein Abedi
excerpt: A brief Introduction to `Moving Z-Score`
tags: ["anomaly-detection", "outlier-detection", "ML"]
categories: ["machine-learning"]
---



## Introduction

The moving Z-score for a point $$x_t$$
is defined as the value of $$x_t$$
standardized by subtracting the moving mean just prior to time $$t$$
and dividing by the moving standard deviation just prior to $$t$$.
Suppose $$w$$
is the abbreviation for the window_size in terms of the number of observations. Then the moving Z-score is:
<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <mi>z</mi>
  <mo stretchy="false">(</mo>
  <msub>
    <mi>x</mi>
    <mi>t</mi>
  </msub>
  <mo stretchy="false">)</mo>
  <mo>=</mo>
  <mfrac>
    <mrow>
      <msub>
        <mi>x</mi>
        <mi>t</mi>
      </msub>
      <mo>&#x2212;<!-- − --></mo>
      <msub>
        <mrow class="MJX-TeXAtom-ORD">
          <mover>
            <mi>x</mi>
            <mo stretchy="false">&#x00AF;<!-- ¯ --></mo>
          </mover>
        </mrow>
        <mi>t</mi>
      </msub>
    </mrow>
    <msub>
      <mi>s</mi>
      <mi>t</mi>
    </msub>
  </mfrac>
</math>

where the moving average is:
<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <msub>
    <mrow class="MJX-TeXAtom-ORD">
      <mover>
        <mi>x</mi>
        <mo stretchy="false">&#x00AF;<!-- ¯ --></mo>
      </mover>
    </mrow>
    <mi>t</mi>
  </msub>
  <mo>=</mo>
  <mo stretchy="false">(</mo>
  <mn>1</mn>
  <mrow class="MJX-TeXAtom-ORD">
    <mo>/</mo>
  </mrow>
  <mi>w</mi>
  <mo stretchy="false">)</mo>
  <munderover>
    <mo>&#x2211;<!-- ∑ --></mo>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>i</mi>
      <mo>=</mo>
      <mi>t</mi>
      <mo>&#x2212;<!-- − --></mo>
      <mi>w</mi>
    </mrow>
    <mrow class="MJX-TeXAtom-ORD">
      <mi>t</mi>
      <mo>&#x2212;<!-- − --></mo>
      <mn>1</mn>
    </mrow>
  </munderover>
  <msub>
    <mi>x</mi>
    <mi>i</mi>
  </msub>
</math>

and the moving standard deviation is:
<math xmlns="http://www.w3.org/1998/Math/MathML" display="block">
  <msub>
    <mi>s</mi>
    <mi>t</mi>
  </msub>
  <mo>=</mo>
  <msqrt>
    <mo stretchy="false">(</mo>
    <mn>1</mn>
    <mrow class="MJX-TeXAtom-ORD">
      <mo>/</mo>
    </mrow>
    <mi>w</mi>
    <mo stretchy="false">)</mo>
    <munderover>
      <mo>&#x2211;<!-- ∑ --></mo>
      <mrow class="MJX-TeXAtom-ORD">
        <mi>i</mi>
        <mo>=</mo>
        <mi>t</mi>
        <mo>&#x2212;<!-- − --></mo>
        <mi>w</mi>
      </mrow>
      <mrow class="MJX-TeXAtom-ORD">
        <mi>t</mi>
        <mo>&#x2212;<!-- − --></mo>
        <mn>1</mn>
      </mrow>
    </munderover>
    <mo stretchy="false">(</mo>
    <msub>
      <mi>x</mi>
      <mi>i</mi>
    </msub>
    <mo>&#x2212;<!-- − --></mo>
    <msub>
      <mrow class="MJX-TeXAtom-ORD">
        <mover>
          <mi>x</mi>
          <mo stretchy="false">&#x00AF;<!-- ¯ --></mo>
        </mover>
      </mrow>
      <mi>t</mi>
    </msub>
    <msup>
      <mo stretchy="false">)</mo>
      <mn>2</mn>
    </msup>
  </msqrt>
  <mi>.</mi>
</math>
 Since there are not sufficient points to calculate the moving average and moving standard deviation at the beginning, we suppose that  the moving Z-score at points within window_size observations of the beginning of a series are undefined. The scores of these values are represented by missing (undefined) values.

Whenever there is no variation in the values preceding a given observation (i.e. a series of constant values), the moving Z-score can be infinite or undefined. 

## Notice:
Moving z-score is calculated under a set of assumptions that can limit its applicability in the real world problems. These assumptions are as foolows: 
* in a certain window data points may have a distribution with definite variance (variance is not infinite)
* and mean of the data points is not undefined.

For example, in case of [Cauchy](https://en.wikipedia.org/wiki/Cauchy_distribution) and [Levy](https://en.wikipedia.org/wiki/L%C3%A9vy_distribution) distributions have infinite variances and also means of the distributions are undefined, z-score could not be very helpful for finding the abnormal data points.
The main advantages of this method are 
* its simplicity 
* and the capability of it to be used for finding anomalous data points in a stream of data (online anomaly detection).






