#installs necessary packages, only need to do once
install.packages("ggplot2")
install.packages("readxl")

#activates the packages, start here everytime you open program
library(ggplot2)
library(readxl)

#sets the file directory, set this to where you have your excel files
setwd("C:/Users/theod/Downloads")

#grabs the data from excel, the [,c(2,8)] part determines which collumns are used and puts it into a dataframe df
df = read_excel("Data for violin plots-03-13-23.xlsx")[,c(2,8)]

#seperates frozen and FFPE into different dataframes these values will need to be changed if your collumn length is different than 174 
#[3:176] makes it so we leave out the rows without data from the excel file
#xaxis <- rep(c(1),each=174) line gives an x axis that is all the same value so we can plot the yaxis
Frozen <- as.numeric(df$...2[3:176])
FFPE <- as.numeric(df$...8[3:176])
xaxis <- rep(c(1),each=174)
dfFrozen <- data.frame(xaxis,Frozen)
dfFFPE <- data.frame(xaxis, FFPE)

# Basic violin plot Frozen
p <- ggplot(dfFrozen, aes(x=xaxis, y=Frozen)) + 
  geom_violin()
p
# Rotate the violin plot
p + coord_flip()

#final plot
ggplot(dfFrozen, aes(x=xaxis, y=Frozen)) + 
  geom_violin(trim=FALSE, size=1.2) +
geom_boxplot(width=0.1) +
#makes background white
theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.background = element_rect(fill='transparent'),
    legend.box.background = element_rect(fill='transparent')
  ) +
labs(y= "Values", x = "Frozen") +
  stat_summary(fun=mean, geom="point", size=4, color="blue") +
stat_summary(fun=median, geom="point", size=4, color="red")
#determines the mean and median and adds them to graph
 


# Basic violin plot FFPE
p <- ggplot(dfFFPE, aes(x=xaxis, y=FFPE)) + 
  geom_violin()
p
# Rotate the violin plot
p + coord_flip()

ggplot(dfFFPE, aes(x=xaxis, y=FFPE)) + 
  geom_violin(trim=FALSE, size=1.5) +
  geom_boxplot(width=0.1) +
theme(
    panel.background = element_rect(fill='transparent'),
    plot.background = element_rect(fill='transparent', color=NA),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.background = element_rect(fill='transparent'),
    legend.box.background = element_rect(fill='transparent')
  )  +
  labs(y= "Values", x = "FFPE") +
  stat_summary(fun=mean, geom="point", size=4, color="blue") +
  stat_summary(fun=median, geom="point", size=4, color="red")
#determines the mean and median and adds them to graph
