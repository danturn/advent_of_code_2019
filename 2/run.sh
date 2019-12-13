#! /bin/bash
function join_by { local IFS=","; shift; echo "$*"; }

function calculate {
  array=$1;
  array[1]=$2;
  array[2]=$3;
  joined=$(join_by , ${array[@]});
  chunked_data=$(echo $joined | sed 's/\([0-9]*,[0-9]*,[0-9]*,[0-9]*,\)/\1\n/g')

  while IFS=, read -r operand f2 f3 f4
  do
    result=0;
    case $operand in
      1) a=${array[$f2]};
        b=${array[$f3]};
        result=$(expr $a + $b);
        array[$f4]=$result;
        ;;
      2) a=${array[$f2]};
        b=${array[$f3]};
        result=$(expr $a \* $b);
        array[$f4]=$result;
        ;;
      99) echo ${array[0]};
        break;
        ;;
    esac
  done <<< $chunked_data;
}

IFS=',' read -r -a array < data
for i in {0..99}
do
  echo $i
  for j in {0..99}
  do
    result=$(calculate $array $i $j);
    if [ $result -eq 19690720 ]; then
      echo "GREAT";
      echo $i;
      echo $j;
      exit 0;
    fi
  done
done

