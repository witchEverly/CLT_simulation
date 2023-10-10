This repository was developed as part of a three-phase Communications assignment for a Master's in Data Science course. 
To assist in the presentation, an application was developed using R Shiny.

The application can be found at: <https://witcheverly.shinyapps.io/CLT_simulation/>


## About the Assignment

> The first phase of the assignment required a brief 2-3 minute presentation focused on the Central Limit Theorem.

> The second phase involved a 10-minute live coding demonstration on the same subject.

> The final phase combined elements from the first two, featuring a 10-minute talk and a 5-minute Q&A session to delve deeper into an intriguing aspect of the topic.

All parts of the project were presented to a live audience.

## Table of Contents
1. [About the Application](#About-the-Application)
2. [About the Code](#About-the-Code)
3. [About the Project](#About-the-Project)


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

The first part of the project introduced the basic case: when the data are already normally distributed. In this context, the CLT is not needed, as the sample mean actually follows a normal distribution (this is an exact distribution, not an asymptotic one). To illustrate this, we generated 1000 sample means of normally distributed samples of size 1 (i.e., 1000 iid normally distributed random variables) and ploted the histogram of those values. We observed a bell-shape, characteristic of the normal distribution.

![alt text](https://github.com/witchEverly/CLT_simulation/blob/main/Normal_distribution.png?raw=true)


We then went on to explore the importance of the CLT in Data Science:

- Foundation of Inferential Statistics: The CLT is a fundamental concept in statistics that underpins much of inferential statistics. It allows us to make inferences about a population based on sample data, which is essential when it's impractical or impossible to study an entire population.
- Normal Distribution Approximation: The CLT states that the sampling distribution of the sample mean becomes approximately normally distributed as the sample size increases, regardless of the shape of the population distribution. This property simplifies statistical analysis and hypothesis testing.
- Robustness: The CLT is robust and applicable to a wide range of population distributions, including those that are not normally distributed. This makes it a versatile tool for statistical analysis in various fields.
- Sample Size Impact: It highlights the critical role of sample size. The larger the sample size, the closer the sampling distribution of the sample mean approximates a normal distribution. This knowledge guides researchers in choosing appropriate sample sizes for their studies.
- Quality Assurance: In industries like pharmaceuticals and manufacturing, where quality assurance is crucial, CLT helps ensure that products meet certain standards and specifications.
- Real-World Applications: CLT is used in numerous real-world scenarios, including opinion polls, quality control in manufacturing, medical research, and financial modeling. It provides a reliable framework for making decisions and predictions in these fields.


Next, we discussed the practical applications of the Central Limit Theorem (CLT) in the context of quality control in a factory producing 100 million t-shirts annually. Highlighting the challenges of ensuring a defect rate of 1 in 1,000 in massive orders, and choosing the right sample size was emphasized. We also touched on the rule of thumb that for effective sampling, we need to see at least 5 of each side - defective and non-defective. The common assumption of a sample size of 30, based on the CLT, was reviewed using a binomial distribution, revealing that due to the extreme variance, it did not yield the expected bell curve. Then we concluded that, for these settings, a more appropriate sample size is 5,000 to accurately reflect the CLT and ensure product quality, emphasizing the importance of context and variance in determining sample sizes.

![alt text](https://github.com/witchEverly/CLT_simulation/blob/main/sample_size.png?raw=true)

![alt text](https://github.com/witchEverly/CLT_simulation/blob/main/rule_of_thumb.png?raw=true)




We also focused on some edge-case where the CLT does not apply: the Cauchy distribution. Basically, this is because the assumption of a finite second-order-moment isn't satisfied for this distribution (it doesn't even have a finite expected-value, so the law of large numbers can't be used as well). We illustrated this using the app, showing that, no watter the sample size or the number of samples, the histogram of sample means as a whole will never get close enough to a bell-shape. This is because the Cauchy distribution will generate extremely big values (in absolute value) with high probability, and this will be reflected in the sample means, which will in turn prevent the distribution from converging to a normal distribution.

![alt text](https://github.com/witchEverly/CLT_simulation/blob/main/Cauchy_distribution.png?raw=true)


[JESSICA'S PART]


