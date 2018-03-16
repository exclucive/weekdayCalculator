//: Playground - noun: a place where people can play

import UIKit

/*
 Create the function weekdayOf(year: 2018, months: 3, day: 14) -> "Wed"
 which will print the name of weekday based on date
 refference date is current date
 */

let days_in_month: [Int:Int] = [
    1: 31,
    2: 28, // leap year 29
    3: 31,
    4: 30,
    5: 31,
    6: 30,
    7: 31,
    8: 31,
    9: 30,
    10: 31,
    11: 30,
    12: 31,
]

let weekdays = ["sun", "mon", "tue", "wed", "thu", "fri", "sat"]
let ref_date = (year: 2018, month: 3, day: 14, weekday: 4)

func isLeapYear(_ year: Int) -> Bool {
    if year%4 == 0 {
        if year%100 == 0 {
            if year%400 == 0 {
                return true
            } else { 
                return false
            }
        } else {
            return true 
        }
    } else {
        return false
    }
}

func daysScienceJan1(year: Int, month: Int, day: Int) -> Int {
    var days = 0
    var currentMonth = month - 1
    
    while currentMonth > 0 {
        let additionDay = (isLeapYear(year) && currentMonth == 2) ? 1 : 0
        days += days_in_month[currentMonth]! + additionDay
        currentMonth -= 1
    }
    
    return days + day - 1
}

func daysInYear(_ year: Int) -> Int {
    return isLeapYear(year) ? 366 : 365
}

func numberOfDaysBetween(year1: Int, year2: Int) -> Int {
    var numberOfDays = 0
    for year in year1..<year2 {
        numberOfDays += daysInYear(year)
    }
    
    return numberOfDays
}

func weekdayOf(year: Int, month: Int, day: Int) -> String? {
    let bottomDateDaysUntilJ1 = daysScienceJan1(year: year, month: month, day: day)
    let upperDateDaysUntilJ1 = daysScienceJan1(year: ref_date.year, month: ref_date.month, day: ref_date.day)
    
    let numberOfDays = numberOfDaysBetween(year1: year, year2: ref_date.year) - bottomDateDaysUntilJ1 + upperDateDaysUntilJ1
    
    var dayIndex = 7 - numberOfDays%7 - ref_date.weekday
    if dayIndex < 0 {
        dayIndex = dayIndex + 7
    }
    
    return weekdays[dayIndex]
}

weekdayOf(year: 2018, month: 9, day: 1)
//numberOfDaysBetween(year1: 2016, year2: 2018)
//daysScienceJan1(year: 2018, month: 3, day: 14)

