score: {nc:+/x=y;dx:#:'=x;nc,(+/dx&(#:'=y)[!dx])-nc}
score: {nc,(+/dx&(#:'=y)[!dx:#:'=x])-nc:+/x=y}

/new version

score: {nc,(4-#{x_x?y}/[x;y])-nc:+/x=y}

/attempt at q version:
score: {nc:sum x=y; dx: count each group x; nc,(sum (dx[key dx]) min (count each group y)[key dx])-nc}


score: {n,4-(n:+/x=y)+#{x_x?y}/[x;y]}
score: {n,4-(n:+/x=y)+#{x_x?y}/["1114";"1111"]}


x: "1114"
y: "1111"

score: {n,4-(n:sum x=y)+count{x _x?y}/[x;y]}
score: {n,4-(n:+/x=y)+#{(x[0]_x[0]?y;x[0][z]=y)}/[(x;0);y;!4]}
