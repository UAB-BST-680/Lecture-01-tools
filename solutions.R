
library(gt)

source_top <- md('__Fisher, R. A__. (1936) The use of multiple measurements in taxonomic problems _Annals of Eugenics_, 7, Part II, 179–188.')
source_mid <- md("The data were collected by Anderson, Edgar (1935). The irises of the Gaspe Peninsula, _Bulletin of the American Iris Society_, 59, 2–5.")
source_btm <- md("All table values are in __centimeters__.")

iris_tbl <- iris[c(1:3, 51:53, 101:103), ] %>% 
  gt(groupname_col = 'Species') %>% 
  tab_header(title = 'Iris dataset',
    subtitle = 'The first three rows for each species are presented') %>% 
  cols_label(
    Sepal.Length = 'Sepal Length',
    Sepal.Width = 'Sepal Width',
    Petal.Length = 'Petal Length',
    Petal.Width = 'Petal Width'
  ) %>% 
  cols_align('center') %>% 
  tab_style(locations = cells_row_groups(), 
    style = cell_text(weight = 'bold')) %>% 
  tab_source_note(source_top) %>% 
  tab_source_note(source_mid) %>% 
  tab_source_note(source_btm)

readr::write_rds(iris_tbl, 'iris_table.rds')
