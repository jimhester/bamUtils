% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bamUtils.R
\name{bam.cov.tile}
\alias{bam.cov.tile}
\alias{oneoffs}
\title{Get coverage as GRanges from BAM on genome tiles across seqlengths of genome}
\usage{
bam.cov.tile(bam.file, window = 100, chunksize = 1e+05, min.mapq = 30,
  verbose = TRUE, max.tlen = 10000, st.flag = "-f 0x02 -F 0x10",
  fragments = TRUE, region = NULL, do.gc = FALSE, midpoint = TRUE)

oneoffs(out.file, bam, ref, min.bq = 30, min.mq = 60, indel = FALSE,
  chunksize = 10000, verbose = TRUE)
}
\arguments{
\item{bam.file}{string Input BAM file}

\item{window}{integer Window size (in bp) (default == 1e2)}

\item{chunksize}{integer Size of window (default == 1e5)}

\item{min.mapq}{integer Minimim map quality reads to consider for counts (default == 30)}

\item{verbose}{boolean "verbose" flag (default == TRUE)}

\item{max.tlen}{max paired-read insert size to consider}

\item{st.flag}{boolean Samtools flag to filter reads on (default == '-f 0x02 -F 0x10')}

\item{fragments}{boolean Flag (default == FALSE)}

\item{region}{um? (default == NULL)}

\item{do.gc}{boolean Flag to execute garbage collection via 'gc()' (default == FALSE)}

\item{midpoint}{boolean Flag if TRUE will only use the fragment midpoint, if FALSE will count all bins that overlap the fragment}

\item{out.file}{file to dump tsv to}

\item{bam}{bam file path}

\item{ref}{fasta path}

\item{min.bq}{integer minimum base quality}

\item{min.mq}{integer minimum mapping quality}

\item{indel}{logical flag whether to collect one off indels (default is substitution)}

\item{chunksize}{number of mpileup lines to put into memory}

\item{verbose}{logical flag}
}
\value{
GRanges of "window" bp tiles across seqlengths of bam.file with meta data field $counts specifying fragment counts centered
in the given bin.
}
\description{
Quick way to get tiled coverage via piping to samtools (e.g. ~10 CPU-hours for 100bp tiles, 5e8 read pairs)

Gets coverage for window size "window" [bp], pulling "chunksize" records at a time and incrementing bin
corresponding to midpoint or overlaps of corresponding (proper pair) fragment (uses TLEN and POS for positive strand reads that are part of a proper pair)

Calls samtools mpileup to dump tsv of "one off" variants / sites (i.e. that are present in exactly one read per site)
}
\note{
The denominator (ie total reads) is just the sum of counts$records
}
