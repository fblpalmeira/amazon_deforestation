
d<-read.csv("https://github.com/fblpalmeira/amazon_deforestation/blob/main/amazonia_deforestation.csv", sep = ";")

library(ggplot2)
library(png)
library(patchwork)

my_image <- readPNG("mapa-amazonia.png", native = TRUE)
p <- ggplot(data = d,
            mapping = aes(x = year, y = km))
p <- p + scale_x_continuous(breaks=seq(1988,2021,by=1))
p <- p + theme(axis.text.x =
                 element_text(size  = 10,
                              angle = 45,
                              hjust = 1,
                              vjust = 1))
p <- p + scale_y_continuous(breaks=seq(0,30000,by=5000))
p + geom_area( fill="red", alpha=0.4)+

  geom_line(color = "red", size=2) +
  geom_point(color="red", size=3) +
    
  geom_vline(xintercept = 1990, color = "blue", linetype = "longdash") +
  annotate("text", x = 1988.5, y = 0.14, colour = "blue",
           label = "Sarney", size = 5) +
  geom_vline(xintercept = 1992, color = "blue", linetype = "longdash") +   
  annotate("text", x = 1991, y = 0.44,  colour = "blue",
           label = "Collor", size = 5) +  
  geom_vline(xintercept = 1995, color = "blue", linetype = "longdash") +
  annotate("text", x = 1993.5, y = 0.44,  colour = "blue",
           label = "Itamar", size = 5) +
  geom_vline(xintercept = 2003, color = "blue", linetype = "longdash") +
  annotate("text", x = 1999, y = 0.44, colour = "blue",
           label = "FHC", size = 5) +
  geom_vline(xintercept = 2011, color = "blue", linetype = "longdash") +         
  annotate("text", x = 2007, y = 0.44,  colour = "blue",
           label = "Lula", size = 5) +        
  geom_vline(xintercept = 2016, color = "blue", linetype = "longdash") +    
  annotate("text", x = 2013.5, y = 0.44,  colour = "blue",
           label = "Dilma", size = 5) +  
  geom_vline(xintercept = 2019, color = "blue", linetype = "longdash") +  
  annotate("text", x = 2017.5, y = 0.44,  colour = "blue",
           label = "Temer", size = 5) +    
  annotate("text", x = 2020.5, y = 0.44,  colour = "blue",
           label = "Bolsonaro", size = 5) +
  labs(x = "Date",
       y = "Area (km2)",
       title = "") +
  scale_color_discrete(name = "") +
  scale_colour_grey(name = "") + 
  theme_bw() + 
  theme(axis.text.x = element_text(angle = 60, vjust = 0.5, hjust=1))+
  theme (panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+
  labs(caption="Source: INPE (http://terrabrasilis.dpi.inpe.br/)
       Created by @fblpalmeira") +
  inset_element(p = my_image,left = 0.7, bottom = 0.6, right =.975, top = .975)

