#! /usr/bin/gawk -f
    /^[^;]/{
        gsub(/^@/, "~@", $0);
        gsub(/( *):( *)/, ":", $0);
        print;
    }
