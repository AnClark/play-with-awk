#!/bin/bash

awk '
	{
		for(i=1; i<=NF; i++){
			if($i ~ /^u0_/){
				print $i;
				break;
			}
		}
		
	}
' test.txt
