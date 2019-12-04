function calculate {
  echo $(expr $1 / 3 - 2);
}

total=0;
while read p; do
  current=$(calculate $p);
  total=$(expr $total + $current);

  fuel_cost=$current;
  while [ $fuel_cost -gt 6 ]
  do
    fuel_cost=$(calculate $fuel_cost);
    total=$(expr $total + $fuel_cost);
  done

done <data
echo $total;
