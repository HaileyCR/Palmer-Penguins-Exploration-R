#Installing/loading packages and previewing data to experiment with the Palmer Penguins data

install.packages('tidyverse');
library(tidyverse);
install.packages("palmerpenguins");
library("palmerpenguins");
glimpse(penguins);
head(penguins);
colnames(penguins);

#Looking at bill length
penguins %>%  arrange(bill_length_mm);

penguins2 <- penguins %>%  arrange(bill_length_mm);

View(penguins2);

#Grouping bill lengths
penguins %>% group_by(island) %>% drop_na() %>% summarize(mean_bill_length_mm =
                                                           mean(bill_length_mm));
penguins %>% group_by(island) %>% drop_na() %>% summarize(max_bill_length_mm =
                                                            max(bill_length_mm));
penguins %>% group_by(species,island) %>% drop_na() %>% summarize(mean_bl =
                              mean(bill_length_mm),max_bl = max(bill_length_mm));

#Specifically looking for Adelie species information
penguins %>% filter(species == "Adelie");

#Getting some visualizations with ggplot and determining which is easiest to understand
ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g));

ggplot(data=penguins)+geom_point(mapping=aes(x=bill_length_mm,y=bill_depth_mm));

penguins %>%
  group_by(species) %>%
  drop_na() %>%
  summarize(mean_bill_length=mean(bill_length_mm));

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species));

ggplot(data=penguins)+geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,alpha=species));

ggplot(data=penguins)+geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g));

ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,),color="darkgreen");

ggplot(data=penguins)+
  geom_smooth(mapping=aes(x=flipper_length_mm,y=body_mass_g,linetype=species,color=species));

ggplot(data=penguins)+
  geom_jitter(mapping=aes(x=flipper_length_mm,y=body_mass_g));

ggplot(data=penguins)+
  geom_bar(mapping=aes(x=species,color=island));

ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  facet_wrap(~species);

ggplot(data=penguins,aes(x=flipper_length_mm,y=body_mass_g))+
  geom_point(aes(color=species))+
  facet_grid(sex~species);

ggplot(data=penguins)+
  geom_point(mapping=aes(x=flipper_length_mm,y=body_mass_g,color=species))+
  labs(title="Palmer Penguins: Body Mass vs. Flipper Length",subtitle="Sample of Three Penguin Species",caption="Data collected by Dr. Kristen Gorman")+
  annotate("text", x=220, y=3500, label="The Gentoos are the largest", color="blue", size=4);

ggsave("Three Penguin Species.png")

install.packages('rmarkdown')
