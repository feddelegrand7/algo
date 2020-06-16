
<!-- README.md is generated from README.Rmd. Please edit that file -->

# algo

<!-- badges: start -->

<!-- badges: end -->

The `algo` package allows you to implement the [Algolia
Places](https://community.algolia.com/places/) Address Search Auto
Completion Menu on shiny Text Inputs.

## Setup

In order to use the Algolia Places JavaScript library, you’ll need
create a free
[Places](https://community.algolia.com/places/pricing.html) application
in which you can get an **ID** and an **API KEY**. The library is free
up to 1,000 requests / day which is quite cool for most users.

After that, set your credentials within the **.Renviron** file which can
be opened with:

``` r

# install.packages("usethis")

usethis::edit_r_environ()
```

Then, store the value of your credentials as follows:

``` r
# These credentials are fakes and used  to give you an idea

ALGOLIA_ID= LSKDFNSFSD  

ALGOLIA_KEY= 29453SKVNEV43T3G3KVEEV
```

Finally, save your .Renviron file, close it and restart your R session.

## Installation

You can install the development version of `algo` from Github with:

``` r

# install.packages("remotes")

remotes::install_github("feddelegrand7/algo")
```

## How to use the algo package

The `algo` package has two functions:

  - `use_algolia()`: you must put the `use_algolia()` function at the
    beginning of your shiny UI. It doesn’t take any argument. It only
    allows you to activate the Algolia Places JavaScript library.

  - `algo()`: you’ll implement an address search auto completion menu on
    any shiny text input using this function.

## Example

Let’s create a basic shiny application to demonstrate the features of
the package:

``` r

library(shiny)
library(algo)


ui <- fluidPage(
  
  use_algolia(), 
  
  
  textInput(inputId = "inp1", label = "Please introduce your address", width = "800px"), 
  
  
  algo(element = "#inp1", type = "address") # Don't forget to add the # to your ID
  
)


server <- function(input, output) {




}

shinyApp(ui, server)
```

![](man/figures/algoexample.gif)

## Code of Conduct

Please note that the algo project is released with a [Contributor Code
of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.