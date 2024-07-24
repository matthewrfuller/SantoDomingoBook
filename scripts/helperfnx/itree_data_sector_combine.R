# This function pulls in the four sector data files for each i-Tree export
# from the .eco files that hold the i-Tree reports. Then, it combines the
# sector data into a single data frame for further analysis across all plots.
# This function depends on another helper function named 'itree_readcsv()'.
# There is only one input to consider and that is the pattern of the file name
# to extract from the list of files for the four sectors. This function requires
# that the follow objects are present in the global environment: CN_files, 
# GA_files, SC_files, and ZC_files. These represent the list of file names
# (full paths) for each sector that the string pattern will be found in to
# select for reading into R.
# 
# Arguments:
# string_pattern:  character string; pattern in csv file to be extracted
#
                  

itree_sector_combine <- function(string_pattern) {
  
  list_of_data_inputs <- 
    list(CN = list(CN_files, "CN"),
         GA = list(GA_files, "GA"),
         SC = list(SC_files, "SC"),
         ZC = list(ZC_files, "ZC") )
  
  lapply_out <- lapply(list_of_data_inputs, 
                       function(x) {
                         itree_readcsv(csvfilelist = x[[1]], 
                                       data_file_pattern = string_pattern, 
                                       SectorID = x[[2]])
                         } 
                       ) |>
    reduce(bind_rows)
  
  return(lapply_out)
}

