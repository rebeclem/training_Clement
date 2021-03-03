data_url <- "https://arcticdata.io/metacat/d1/mn/v2/object/urn%3Auuid%3A35ad7624-b159-4e29-a700-0c0770419941"
bg_chem <- read.csv(data_url, stringsAsFactors = FALSE)

# Sometimes you need to wrap the web address in url() on some platforms
#bg_chem <- read.csv(url(data_url, method = "libcurl"), stringsAsFactors = FALSE)
names(bg_chem)
server <- function(input, output) {
  
  output$depthPlot <- renderPlot({
    
    ggplot(bg_chem, mapping = aes(CTD_Depth, CTD_Salinity)) +
      geom_point(colour="red", size=4) +
      theme_light()
  })
}

sidebarPanel(
  sliderInput("mindepth", "Min depth:", min = 0, max = 500, value = 0),
  sliderInput("maxdepth", "Max depth:", min = 1, max = 500, value = 50)
)
