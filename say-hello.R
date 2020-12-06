library(optparse)

# default variables
name <- 'R'
hello_count <- 5
output_path <- 'hello.txt'

# 1. read in command line argumenents
option_list <- list(
  make_option(c("--name"), type="character", default=name,
              help="The name to say hello to", metavar="character"),
  make_option(c("--hello-count"), type="integer", default=hello_count,
              help="The number of times to say hello", metavar="integer"),
  make_option(c("--output-path"), type="character", default=output_path,
            help="The file to write our hellos to", metavar="character")
);
opt_parser <- OptionParser(option_list=option_list);
opt <- parse_args(opt_parser);
if (!is.null(opt['name'])) {
    name <- trimws(opt['name'])
}
if (!is.null(opt['hello-count']) ) {
    hello_count <-  as.integer(opt['hello-count'])
}
if (!is.null(opt['output-path']) ) {
    output_path <- trimws(opt['output-path'])
}

print(name)
# create the output path if it doesn't exist
output_dir <- dirname(output_path)
results <- ifelse(!dir.exists(file.path(output_dir)), dir.create(file.path(output_dir), recursive=TRUE), FALSE)
results <- file.create(output_path)

# now lets open the file and write to it
file_connection<-file(output_path, open = "wt")
hello_to_write <- paste(paste("Hello", name, sep=" "), '!', sep="")
for (i in 1:hello_count) {
  print(paste("Writing", hello_to_write, "to", output_path, sep=" "))
  writeLines(hello_to_write, file_connection)

}
close(file_connection)