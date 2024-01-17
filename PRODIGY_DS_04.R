#installing packagesrr
install.packages("ggplot2")
install.packages("syuzhet")
library(syuzhet)
setwd("C:\\Users\\donkr\\OneDrive\\Desktop\\CST\\prodigy")
amazon_review <- read.csv("C:\\Users\\donkr\\OneDrive\\Desktop\\CST\\prodigy\\amazon_review.csv")
View(amazon_review)
review1<-as.character(amazon_review$Review.Content)
get_nrc_sentiment('happy')
get_nrc_sentiment('abuse')
n1<-get_nrc_sentiment(review1)
View(n1)
review_sentimentanalysis<-cbind(amazon_review$Review.Content,n1)
#representing sentiment analysis based on amazon feedback
barplot(colSums(n1), col = rainbow(10),ylab='Count',main= 'Sentiment Analysis based on amazon feedback')
setwd("C:\\Users\\donkr\\OneDrive\\Desktop\\CST\\prodigy")
amazon_review <- read.csv("C:\\Users\\donkr\\OneDrive\\Desktop\\CST\\prodigy\\amazon_review.csv")
library(tibble)
#analyzing the various emotions of people
text.amazon_review <- tibble(text = tolower(amazon_review$Review.Content))
emotions <- get_nrc_sentiment(text.amazon_review$text)
View(emotions)
emo_bar <- colSums(emotions)
emo_bar
emo_sum <- data.frame(count=emo_bar , emotion=names(emo_bar))
emo_sum
library(ggplot2)
ggplot(emo_sum, aes(x= reorder(emotion, -count), y = count,fill=topo.colors(10))) + geom_bar(stat = 'identity')

