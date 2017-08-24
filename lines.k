/boiler plate for work with this in a console
w:h:100
abs: {$[x<0;-x;x]}

img: (w;h)#0
cl:  1
pt: 0
pts: (0 0;1 1)
de: {abs(%/{-/pts[;x]}'|!2)}
md: {pts[pt]::x,y;$[pt;line[];];pt::~pt}
line: {{img[x 0;y]::cl;x[1]+:de[];$[0.5>x[1];x;x+(1;-1)]}\[(pts[0;1];de[]-0.5);(&/pts[;0])+!1+abs[-/pts[;0]]]}
ux:   {cl::4!cl+x}

draw: ,(;`cga;`img)

mg[2;5]
mg[22;10]
