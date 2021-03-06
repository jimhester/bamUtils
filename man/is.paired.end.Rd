% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bamUtils.R
\name{is.paired.end}
\alias{is.paired.end}
\alias{get.mate.gr}
\title{Check if BAM file is paired end by using 0x1 flag}
\usage{
is.paired.end(bams)

get.mate.gr(reads)
}
\arguments{
\item{bams}{vector of input BAMs}
}
\value{
boolean returns TRUE if BAM file is paired-end, returns FALSE if BAM not paired-end

\code{GRanges} corresponding to mates of reads
}
\description{
Check if BAM file is paired-end by using 0x1 flag, 
pipes to 'samtools' via command line

Create GRanges of read mates from reads
}
