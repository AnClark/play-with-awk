data_perm_list_file=dplf.txt


for line_id in $(awk '{print NR}' ${data_perm_list_file}); do
	line=$(sed -n ${line_id}p ${data_perm_list_file})
	data_path=$(echo ${line} | awk -F " " '{print $NF}')
	owner=$(echo ${line} | awk -F " " '
		{for(i=1; i<=NF; i++)
			{
				if( $i ~ /^u0_/)
				{
					print $i;
					break;
				}
			}
		}
	')
	group=$owner
	
	echo "-------------------------------------"
	echo "Current App: "$data_path
	echo "chown -Rv" $owner $data_path
	echo "chgrp -Rv" $group $data_path
	echo "-------------------------------------"
	
	#chown -Rv $owner $data_path
	#chgrp -Rv $group $data_path
done
