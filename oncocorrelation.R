gene.cor.bar<- function(my_data,orderbyabs=FALSE){

library("ggplot2")


N<- names(my_data)[2:ncol(my_data)]
cor <- integer(ncol(my_data)-1)
p <- integer(ncol(my_data)-1)

for (i in 1:length(cor))
 {
  cor[i] <- cor(my_data$x, my_data[,(i+1)], method = c("pearson", "kendall", "spearman"))
  p[i] <- cor.test(my_data$x, my_data[,(i+1)], method = c("pearson", "kendall", "spearman"))$p.value
 }

Mcor<-data.frame( gene = paste(N,"\n",round(cor,3),"\n","p=",round(p,3)), correlation=cor)
newcor<-Mcor[order(Mcor$correlation),]

if (orderbyabs==TRUE)
 {
ggplot(newcor,aes(x= reorder(gene,-abs(correlation)), y = correlation))+
geom_bar(stat="identity",fill= ifelse(newcor$correlation<0, rgb(1,0.5,0.5),rgb(0.5,0.8,1)))+
labs(x = "Gene")+
labs(y = "Correlation")
 }
else
{
ggplot(newcor,aes(x= reorder(gene,-correlation), y = correlation))+
geom_bar(stat="identity",fill= ifelse(newcor$correlation<0, rgb(1,0.5,0.5),rgb(0.5,0.8,1)))+
labs(x = "Gene")+
labs(y = "Correlation")
}
}


