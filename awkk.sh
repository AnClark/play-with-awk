#!/bin/bash

awk '
	{
		for(i=1; i<=3; i++){
			print $i
		}
		
	}
' test.txt
