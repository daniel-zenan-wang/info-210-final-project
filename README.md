# info-201-final-project

## [Link to our published Shiny App](https://mckaulay-edu.shinyapps.io/info-201-final-project/)

>Data from 2012 to 2015 is not complete that is why some charts have gray areas, or at 0. 

#Project Description

1. What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.

  We will be looking at crime rates and other crime related data for all counties in Washington State. We got our data from the http://sac.ofm.wa.gov/ Washington
  State Statistical Analysis Center.

2. Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should hone in on one of these audiences.

  Our target audience are homeowners looking to buy a home in a Washington county. We want to find trends in the data
  of crimes in Washington to see if we can discover which counties are the safest to live in. On the big picture, we will be analyzing crime data to see how crime rates change by year and location in Washington State and drawing conclusions about the safety of various counties.
  
3. What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.

  -Which counties should be avoided by potential Washington homeowners?
  -Where does crime occur most, what could be possible reasons why?
  -Where is the safest place in Washington state?

#Technical Description

1. What will be the format of your final product (Shiny app, HTML page or slideshow compiled with KnitR, etc.)?

  -We will be using the Shiny app to display our report.

2. How will you be reading in your data (i.e., are you using an API, or is it a static .csv/.json file)?

  This is a regular csv file.

3. What types of data-wrangling (reshaping, reformatting, etc.) will you need to do to your data?

  We are looking to subset and filter the data according to state and county. We will then explore that dataset further, looking for trends in crime by examining variables for each instance.

4. What (major/new) libraries will be using in this project (no need to list common libraries that are used in many projects such as dplyr)

  We will be using ggplot2, maps, mapdata and RColorBrewer in our project. These will be used to create the visual repesentations of crime.
  
5. What questions, if any, will you be answering with statistical analysis/machine learning?

  None.
  
6. What major challenges do you anticipate? 

  This will be our first project working together and applying our technical skills. I think it will be challenging learning shiny and 
  applying all the different things we learned to put together in a finished product.
