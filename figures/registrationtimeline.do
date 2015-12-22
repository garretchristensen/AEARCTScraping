//Garret Christensen
//Dec 21, 2015
//This file takes the spreadsheet from the AEA Trial Registry and creates a graph of registrations over time.

clear all
set more off
version 12.1

cd /Users/gchrist1/Documents/Research/Registry/rct

//Read in Data from AEA-generated csv
insheet using searchoutput.csv, names

//Turn date of registration into month
gen tempdate=substr(publishedat,1,10)
gen regdate=date(tempdate,"YMD")
*format regdate %td
gen regmonth=mofd(regdate)
format regmonth %tm
label var regmonth "Month and Year"

collapse (count) registrations=regdate, by(regmonth)
label var registrations "AEA Registrations in Given Month"

twoway connected registrations regmonth, title(New AEA Registrations Each Month) ytitle("") // new registrations per month
graph export ./figures/AEANewRegistrations.png, replace

sort regmonth
gen cum_registrations=registrations in 1 //prime the pump
label var cum_registrations "Cumulative AEA Registrations by Month"

local MAX=_N
forvalues X = 2 / `MAX' { //Loop from 2 to the last obs
 replace cum_registrations=cum_registrations[`X'-1]+registrations[`X'] in `X' //previous total plus current additions
}

twoway connected cum_registrations regmonth, title(Total AEA Trial Registrations over Time) ytitle("")
graph export ./figures/AEARegistrations.png, replace
