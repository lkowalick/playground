/ Function takes two arguments: code, guess

/ Number of White Pegs


/ Number of Total Pegs

score: {nc:+/x=y;dx:#:'=x;nc,(+/(dx[!dx])&(#:'=y)[!dx])-nc}

/attempt at q version:
/ score: {nc:sum x=y; dx: count each group x; nc,(sum(dx[key dx]) min (count each group y)[key dx])-nc}
