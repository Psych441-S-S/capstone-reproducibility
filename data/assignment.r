setwd("~/Research/Reproducibility&Stats/data")
politics<-read.csv("politics.csv")
str(politics)
summary(politics$optimismscore[politics$testtime=="post"])
politics$subject<-factor(politics$subject)
politics$testtime<-factor(politics$testtime, levels=c("pre", "post"))
str(politics)		

hist(politics$optimismscore[politics$testtime=="post"])
tab<-table(politics$party,politics$sex)
tab


chisq.test(politics$party,politics$sex)


t.test(politics$income[politics$sex=="male"],politics$income[politics$sex=="female"],paired=FALSE,var.equal=FALSE,alternative="two.sided",con.level=.95)




summary(aov(optimismscore~party*sex,data=politics[politics$testtime=="post",]))

library(gplots)
library(ggplot2)
library(dplyr)
temp<-politics[politics$testtime=="post",]%>%group_by(party,sex)%>%
     summarize(means=mean(optimismscore),sems=sd(optimismscore)/sqrt(length(optimismscore)))
