/k4
mod:{x-y*_x%y}

{,/("fizz";"buzz")@&~(mod[x;])'3 5}'1+!100

{$[0=mod[x;15];"fizzbuzz";0=mod[x;3];"fizz";0=mod[x;5];"buzz";x]}'1+!100

