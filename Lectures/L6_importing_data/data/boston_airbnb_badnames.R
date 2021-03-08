boston_airbnb <- read_csv("HW/HW_02_BostonAirBnB/student_report/data/boston_airBnB_data.csv")

names(boston_airbnb)

boston_airbnb %>%
  rename(`Number of bathrooms` = "bathrooms",
         `ID` = "id",
         `Price` = "price",
         `Number of Bedrooms` = "bedrooms",
         `n beds` = "beds",
         `Review Scores Rating` = "review_scores_rating",
         `Number of reviews` = "number_of_reviews") -> 
  bad_boston_airbnb

readr::write_csv(x = bad_boston_airbnb,file = "Lectures/L6_importing_data/data/boston_airbnb_badnames.csv")



