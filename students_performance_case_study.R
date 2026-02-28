library(tidyverse)
students <- read.csv("StudentsPerformance.csv")
head(students)
str(students)
summary(students)
colnames(students)
colSums(is.na(students))
mean(students$math.score)
mean(students$reading.score)
mean(students$writing.score)
students %>%
  group_by(gender) %>%
  summarise(
    avg_math = mean(math.score),
    avg_reading = mean(reading.score),
    avg_writing = mean(writing.score)
  )
ggplot(students, aes(x = gender, y = math.score, fill = gender)) +
  geom_boxplot() +
  labs(
    title = "Math Scores by Gender",
    x = "Gender",
    y = "Math Score"
  ) +
  theme_minimal()
ggplot(students, aes(x = reading.score, y = writing.score)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Reading vs Writing Scores",
    x = "Reading Score",
    y = "Writing Score"
  ) +
  theme_minimal()
students %>%
  group_by(gender) %>%
  summarise(mean_writing = mean(writing.score))
