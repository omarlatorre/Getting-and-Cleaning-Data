Code book for Coursera Getting and Cleaning Data course project

The data set that this code book pertains to is located in the tidy_data.txt file of this repository.

See the README.md file of this repository for background information on this data set.

The structure of the data set is described in the Data section, its variables are listed in the Variables section, and the transformations that were carried out to obtain the data set based on the source data are presented in the Transformations section.
Data

The tidy_data.txt data file is a text file, containing space-separated values.

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.
Variables

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