Getting-and-Cleaning-Data
=========================

coursera Getting and Cleaning Data project

Download the source data

Unzip the file getdata-projectfiles-UCI HAR Dataset.zip into your working directory

Say C:\Users\yourname\Documents\R\

The unziped directory containig the source data is: C:\Users\yourname\Documents\R\UCI HAR Dataset

Create a new directory that will store the tidy data: C:\Users\yourname\Documents\R\UCI HAR Dataset\merged

Copy the file run_analysis.R to C:\Users\yourname\Documents\R\

Open RStudio and run : setwd("C:\Users\yourname\Documents\R\")

Run : source("run_analysis.R")

The script will read the source data and it will write, in the directory C:\Users\yourname\Documents\R\UCI HAR Dataset\merged, the following files:

1. processed.txt - a 7.95 MB file  containig a (10299 x 68) data frame

2. tidy.txt - 0.219 MB file containing a (180x68) data frame, the tidy data required
The repo gcdjhu contains also the following files:

1. README.md

2. CodeBook.md

3. run_analysis.R
