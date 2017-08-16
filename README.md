# Getting and Cleaning Data - Course Project

This is the Coursera project for the Getting and Cleaning Data course.

## Content
This repository contains the following files:

<li>README.md provides an overview of the output table and how it was created.
<li>tidy_data.txt contains the output data grouped by subjects and activities..
<li>codeBook.md describes the contents of the output data and the variables and transformations used to generate it.
<li>run_analysis.R is the R scr;ipt that was used to create the output table.

## What the run_analysis script does
These are the logical steps run by <b>run_analysis.R</b>

1. Download source data
2. Rename columns along project requirements
3. Merge X,Y and subject tables
4. Append train and test data
5. Extract mean and standard deviation columns
6. Creates a tidy table with average values by subjects and activities.

The output file is named <b>avgBy.txt</b>.

## Source Data
Source data has been obtained from the Human Activity Recognition Using Smartphones Data Set.
For more information visit this link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
