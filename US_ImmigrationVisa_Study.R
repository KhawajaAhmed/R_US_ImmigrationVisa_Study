library(ggplot2)
continent = read.csv("continent.csv")

perc_applicants=round(prop.table(table(continent$Continent))*100,2)

df_continent = data.frame(
  continent = c("Africa", "Asia", "Europe", "North America","Oceania","South America"),
  freq = c(55,49,48,26,16,13),
  perc_applicants = c(26.57,23.67,23.19,12.56,7.73,6.28)
)

continent_order = c("South America", "Oceania", "North America", "Europe","Asia","Africa")
df_continent$continent = factor(df_continent$continent, levels = continent_order)

ggplot(data=df_continent, aes(x=freq,y=continent, fill=continent))+
  geom_col(position="dodge", width=.5)+
  scale_x_continuous(limits = c(0, 55), breaks = seq(0, 55, by = 5))+
  theme(legend.position = "none")+
  xlab("\nPercent of Applicants")+
  ylab("Continent")+
  scale_fill_manual(values=c("purple","red","green","blue","yellow","orange") 
  )+
  theme(axis.title.y=element_text(angle=0))+
  geom_text(
    aes(label = paste0(perc_applicants,"%")),
    position = position_dodge(width = 0.65),
    hjust = 1.1,
    size = 3,
    color = c("black","black","white","black","white","white")
  )