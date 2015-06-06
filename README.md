# Exploratory Data Analysis

## Course Project 1

I've submitted five R source files for this assignment:

* getTwoDaysPowerData.R
* plot1.R
* plot2.R
* plot3.R
* plot4.R

Note that issuing the command `source("plot1.R")` will immediately begin producing Plot 1.

The same is true for each of the other plot source files.

Each of the four plot files executes the following code before producing the plot:

```
if(!exists("twoDaysPowerData")) {
  source("getTwoDaysPowerData.R")

  twoDaysPowerData <- getTwoDaysPowerData()
}
```

This ensures that the plot source files can be run in any order, and also ensures that the long process of downloading the data source zip file and reading the file within that zip file into a table is only performed once, presuming that the variables aren't cleared from the session between the calls to produce a plot.

