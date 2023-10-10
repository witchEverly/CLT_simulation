This repository was developed as part of a three-phase Communications assignment for a Master's in Data Science course. 
To assist in the presentation, an application was developed using R Shiny.

The application can be found at: <https://witcheverly.shinyapps.io/CLT_simulation/>

## About the Assignment

> The first phase of the assignment required a brief 2-3 minute presentation focused on the Central Limit Theorem.

> The second phase involved a 10-minute live coding demonstration on the same subject.

> The final phase combined elements from the first two, featuring a 10-minute talk and a 5-minute Q&A session to delve deeper into an intriguing aspect of the topic.

All parts of the project were presented to a live audience.

# About the Application

The `CLT_simulation` repository contains code for an R Shiny application. Specifically, the file `app.R` contains the code to run the application.
The application was created to help visualize the Central Limit Theorem in action; it is a dashboard that allows the user to select from a range of well-known statistical distributions, 
including the Exponential, Poisson, and Uniform distributions, among others. The user then selects the number of samples to be taken from that distribution,
and the number of samples to be taken from each sample. 

For each distribution, the application allows the user to input the parameters that conditionally define each distribution.

The application then generates a histogram of the sample means of the distribution. Overlaid on the histograms was planned to be a normal distribution; 
however, due to time constraints and limitations, this was not implemented and a density plot was used instead.

# About the Code 

The code for the application is contained in the file `app.R`. The code is divided into two sections: User Interface and Server Input.

### User Interface

The user interface is divided into two sections: the first section contains the code for the sidebar panel, 
the second section contains the code for the main panel. The sidebar panel contains the code for the user input, 
the main panel contains the code for the histogram plots.

## Server Input

The server is divided into two sections: the first section contains the code for server input, 
the second section contains the code for the histogram plots. The server input contains the code for the user input, 
the histogram plots contain the code to simulate the distributions and generate the histogram plots.

# About the Project