#! /usr/bin/gawk -f
#http://alohakun.blog7.fc2.com/?mode=m&no=355
 
BEGIN {RS = "~@"; printf "digraph G {\n node [shape = record];\n";}
 
/^[0-9]/{
    s = sprintf("%s [label = \"{%s: %s | {", $1, $1, $2);
    for(i = 3; i < NF; i++)
        s = s sprintf("%s | ",$i);
    s = s sprintf("%s}}\"];\n", $i);
    $0 = s;
    while (/([0-9a-zA-Z]+):@([0-9]+)/){
        format = sprintf("<\\1>\\1 \\3\n %s:\\1 -> \\2;", $1);
        $0 = gensub(/([0-9a-zA-Z]+):@([0-9]+)(.*)$/, format, "g");
    };
    printf " %s\n", $0;
}
 
END {print "}"}
