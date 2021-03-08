Nobel winners
================

``` r
library(tidyverse)
```

-   ECLearn &gt; Assignments &gt;
    `in-class exercise, Nobels and sales + Data import` &gt; open
    `nobels-csv.Rmd` and knit.
-   Read in the `nobels.csv` file from the `data-raw/` folder.
-   Split into two (STEM and non-STEM):
    -   Create a new data frame, `nobel_stem`, that filters for the STEM
        fields (Physics, Medicine, Chemistry, and Economics).
    -   Create another data frame, `nobel_nonstem`, that filters for the
        remaining fields.  
-   Write out the two data frames to `nobel-stem.csv` and
    `nobel-nonstem.csv`, respectively, to `data/`.

**Hint:** Use the `%in%` operator when `filter()`ing.

Let’s first load the data:

``` r
nobel <- ___(___)
```

Then let’s split the data into two:

``` r
# stem laureates
___ <- nobel %>%
  filter(___)

# non-steam laureates
___ <- nobel %>%
  filter(___)
```

And finally write out the data:

``` r
# add code for writing out the two data frames here
```
