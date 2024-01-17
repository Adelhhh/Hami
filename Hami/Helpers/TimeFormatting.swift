//
//  TimeFormatting.swift
//  Hami
//
//  Created by Adel Hassanpour on 2024-01-04.
//

import Foundation

func calcTimeSince(date: Date) -> String {
    let minuts = Int(-date.timeIntervalSinceNow)/60
    let hours = minuts/60
    let days = hours/24
    
    if minuts < 120 {
        return "\(minuts) minuts ago"
    } else if minuts >= 120 && hours < 48 {
        return "\(hours) hours ago"
    } else {
        return "\(days) days ago"
    }
}
