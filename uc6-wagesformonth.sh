#!/bin/bash -x

isPartTime=1
isFullTime=2
maxRateinmonth=100
empRatePerhr=20
numOfWorkingDays=20
totalEmphr=0
totalWorkingDays=0

while [[ $totalEmphr -lt $maxRateinmonth && $totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	case $randomCheck in
				$isFullTime )
					emphrs=8
				;;
				$isPartTime )
					emphrs=4
				;;
				*)
					emphrs=0
				;;
	esac

	totalEmphr=$(($totalEmphr+$emphrs))
done

totalsalary=$(($totalEmphr*$empRatePerhr))
