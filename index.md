---
title       : Developing Data Products
subtitle    : Weight Loss App
author      : Priscilla Ciaccio
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
runtime     : shiny
---

## Developing Data Products Project

This is the final project for the Coursera Developing Data Products Course.

The requirements for the project are to create and deploy a Shiny application, and prepare a presentation using Slidify or RStudio Presenter.

The application that I developed is a weight loss application.  It can follow your progress from your starting weight to your goal weight. After you enter your starting weight and your final  goal, you can enter your weights as of different dates so that you can see your progress to your goal.

---

## Weight Loss App

The purpose of this app is to calculate and keep track of 
your progress to your weight loss goal.

This app:
* Calculates how much weight has been lost since the starting weight.
* Calculates the percent of body weight that has been lost
* Calculates how much more weight needs to be lost to obtain goal weight.
* Gives some encouragement to help progress towards the goal.

--- 

## How to use the App

For this app, none of the variables get recorded until the "Set" Buttons are used.

Steps to using the app:

* You need to enter your goal weight and then hit the "Set Goal Weight" Button.
* Enter the date you started your diet and what your starting weight was and hit the "Set Starting Weight" Button.
* Then you can update your weight and the days of the weight in and watch your progress to your goal weight. You must hit the "Set Current Weight" Button after each progression.

--- 

## How to use the App (Continued)

As you enter your information the main pannel will show the information you entered and all calculations toward your goal.


```r
goal<-150
weight1<-200
weight2<-190
```

You have lost 10 lbs and have 40 lbs still left to lose to meet your goal.

---

<!--html_preserve--><div class="container-fluid">
<div class="row">
<div class="col-sm-12">
<h1>Weight Loss Project</h1>
</div>
</div>
<div class="row">
<div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label for="goal">Your Goal Weight</label>
<input id="goal" type="number" class="form-control" value="150" min="100" max="600" step="0.1"/>
</div>
<div class="form-group shiny-input-container">
<label for="weight">Weight, in lbs</label>
<input id="weight" type="number" class="form-control" value="200" min="100" max="600" step="0.1"/>
</div>
<div id="date" class="shiny-date-input form-group shiny-input-container">
<label class="control-label" for="date">Date:</label>
<input type="text" class="form-control datepicker" data-date-language="en" data-date-weekstart="0" data-date-format="yyyy-mm-dd" data-date-start-view="month"/>
</div>
<button id="goButton3" type="button" class="btn btn-default action-button">Set Goal Weight</button>
<button id="goButton" type="button" class="btn btn-default action-button">Set Starting Weight</button>
<button id="goButton2" type="button" class="btn btn-default action-button">Set Current Weight</button>
</form>
</div>
<div class="col-sm-8">
<h2>Results of weight loss</h2>
<div id="text1" class="shiny-html-output"></div>
<div id="text2" class="shiny-html-output"></div>
<div id="text3" class="shiny-html-output"></div>
<pre id="text4" class="shiny-text-output"></pre>
</div>
</div>
</div><!--/html_preserve-->


