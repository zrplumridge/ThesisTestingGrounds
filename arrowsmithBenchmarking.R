install.packages("ggplot2")
library(ggplot2)
# DatabaseTools is downloaded from google sheet with data I had collected
# Moved to df to be able to modify names for access without modifying original information in case of deletion
df <- Database_tools
colnames(df)[colnames(df)== 'A # arrowsmith'] <- 'AValues'
colnames(df)[colnames(df)== 'C # arrowsmith'] <- 'CValues'
colnames(df)[colnames(df)== 'A+C'] <- 'ACValues'
colnames(df)[colnames(df)== '# B Results'] <- 'BResults'
colnames(df)[colnames(df)== 'Ignored articles (overlapping)'] <- 'Overlap'
colnames(df)[colnames(df)== 'Total Time'] <- 'TotalTime'
colnames(df)[colnames(df)== 'Job ID'] <- 'JobID'
colnames(df)[colnames(df)== 'Date Tested'] <- 'TestDate'
colnames(df)[colnames(df)== 'Input A'] <- 'InputA'
colnames(df)[colnames(df)== 'Input C'] <- 'InputC'
colnames(df)[colnames(df)== 'Start Date'] <- 'StartDate'
colnames(df)[colnames(df)== 'End Date'] <- 'EndDate' #could be interesting for a non scatterplot

ggplot(df, aes(x = Years, y = BResults)) + geom_point() +
  ggtitle("Years vs number of B results") + 
  xlim(0, 80) +
  xlab("Years of Articles") +
  ylab("B Results") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

ggplot(df, aes(x = Years, y = ACValues)) + geom_point() +
  ggtitle("Years vs number of A and C articles") +
  xlim(0, 80) +
  xlab("Years of Articles") +
  ylab("A and C articles") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

ggplot(df, aes(x = ACValues, y = BResults)) + geom_point() +
  ggtitle("A and C articles vs B results") +
  xlab("A and C articles") +
  ylab("B results") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

ggplot(df, aes(x = ACValues, y = TotalTime)) + geom_point() +
  ggtitle("A and C articles vs run time") +
  xlab("A and C articles") +
  ylab("run time") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)
#how do we get the regression equation though? 

ggplot(df, aes(x = AValues, y = TotalTime)) + geom_point() +
  ggtitle("A articles vs run time") +
  xlab("A  articles") +
  ylab("run time") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

#df, aes(x = CValues, y = TotalTime)
ggplot(df, aes(y = AValues, x = Years)) + 
  geom_point(aes(color = "Articles in Set A")) + 
  geom_point(data = df, aes(y = CValues, x = Years, color = "Articles in Set C")) +
  geom_point(data = df, aes(y = BResults, x = Years, color = "Articles in Set B")) +
  ylim(0, 130000) +
  xlab("Numbers of articles") +
  ylab("Years") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

ggplot(df, aes(y = AValues, x = TotalTime)) + 
  geom_point(aes(color = "Articles in Set A")) + 
  geom_point(data = df, aes(y = CValues, x = TotalTime, color = "Articles in Set C")) +
  geom_point(data = df, aes(y = BResults, x = TotalTime, color = "Articles in Set B")) +
  ylim(0, 130000) +
  xlab("Numbers of articles over the years") +
  ylab("run time") +
  theme(legend.position = "right") + 
  geom_smooth(method = "loess", formula = y ~ x)

# want one where only 4 year increments or averages or something
# but wtf is this math
# box plot or something might be better for this actually or something stacking
# want to incorporate passage of time / start dates changing but lengths of time vary so averages? normalize
ggplot(df, aes(y = AValues, x = (Years))) + 
  geom_point(aes(color = "Articles in Set A")) + 
  geom_point(data = df, aes(y = CValues, x = (Years), color = "Articles in Set C")) +
  geom_point(data = df, aes(y = BResults, x = (Years), color = "Articles in Set B")) +
  xlab("Years") +
  ylab("Numbers of articles") +
  theme(legend.position = "right")
