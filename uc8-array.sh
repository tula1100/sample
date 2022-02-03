#!/bin/bash -x

isParttime=1
isFulltime=2
maxHoursInMonth=100
empRatePerHr=20
numOfWorkingDays=20
totalEmpHr=0
totalWorkingDays=0

function getWorkingHours()
{
	case $1 in
		$isFulltime )
			emphrs=8
			;;
		$isParttime )
			emphrs=4
			;;
		*)
			emphrs=0
			;;
	esac
}

function getempwage()
{
	echo $(($1*$empRatePerHr))
}

while [[ $totalEmpHr -lt $maxHoursInMonth && $totalWorkingDays -lt $numOfWorkingDays ]]
do
	((totalWorkingDays++))
	randomCheck=$((RANDOM%3))
	getWorkingHours $randomCheck
	totalEmpHr=$(($totalEmpHr+$emphrs))
	dailyWages[$totalWorkingDays]=$(($emphrs*$empRatePerHr))
done

totalsalary="$( getempwage $totalEmpHr )"
echo ${dailyWages[@]}

