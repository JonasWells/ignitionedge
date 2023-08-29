#!/bin/sh

dest=$MACHINE_NETWORK_SUBNET
gateway=$MACHINE_NETWORK_GATEWAY

printf "%b\n" "Running Zededa/BW-DI Netconfig Script...\n"

printf "%b\n" "Current Kernel Route Table:"
currentKernelRouteConfig=$(route)
printf "%b\n" "$currentKernelRouteConfig \n"

printf "%b\n" "Current IP Route Table:"
currentRouteConfig=$(ip route)
printf "%b\n" "$currentRouteConfig \n"

if [[ -z $dest || -z $gateway ]]; then
   printf "%b\n" "ENV Vars: 'MACHINE_NETWORK_SUBNET' & 'MACHINE_NETWORK_GATEWAY' are not set."
   printf "%b\n" "No adjustments to route table required.\n"
else
   printf "%b\n" "ENV Vars: 'MACHINE_NETWORK_SUBNET' & 'MACHINE_NETWORK_GATEWAY' are provided."
   printf "%b\n" "Netconfig script will attempt to add new route to routing table...\n"

   printf "%b\n" "Configuring new static route... 'ip route add $dest via $gateway'"
   eval "ip route add $dest via $gateway"
   if [ $? -eq 0 ]; then
      printf "%b\n" "Success: Added new IP route.\n"
   else
      printf "%b\n" "Failure: Unable to add IP route.\n"
   fi

   printf "%b\n" "Updated Kernel Route Table:"
   updatedKernelRouteConfig=$(route)
   printf "%b\n" "$updatedKernelRouteConfig \n"

   printf "%b\n" "Updated IP Route Table:"
   updatedRouteConfig=$(ip route)
   printf "%b\n" "$updatedRouteConfig \n"
fi

sleep 5

exit 0
