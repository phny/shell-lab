#!/bin/bash
#!/bin/bash

FAIL=0

echo "starting"

echo "job1 star" && sleep 4 &
echo "job2 star" && sleep 4 &
echo "job3 star" && sleep 4 &
echo "job4 star" && sleep 4 &
echo "job5 star" && sleep 4 &

for job in `jobs -p`
do
    wait $job || let "FAIL+=1"
done

if [ "$FAIL" == "0" ];
then
    echo "all job success"
else
    echo "failure job num: ($FAIL)"
fi
