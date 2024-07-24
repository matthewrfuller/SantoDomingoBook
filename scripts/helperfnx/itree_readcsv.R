# READ IN FILES FROM I-TREE FROM LIST OF FILES FOR A SECTOR
# csvfilelist:        r object list of full file paths that can be read in by 
#                     readr::read_csv
# data_file_pattern:  character string; pattern in csv file to be extracted
#
# sector_id:          character string; the character string ID given to that 
#                     data set. For SD data, it is one of: CN, CZ, GA, SC

itree_readcsv <- function(csvfilelist, data_file_pattern, SectorID) {
  data_df <- 
    readr::read_csv(file = csvfilelist[grep(pattern = data_file_pattern, 
                                            x = csvfilelist)]) |>
    mutate(SectorID = SectorID) |>
    mutate(across(.cols = any_of(c("Crew")), .fns = as.character))
  
  return(data_df)
}
