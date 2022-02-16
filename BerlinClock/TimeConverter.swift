import SwiftUI

class TimeConverter {
    
    static func getFiveHours(_ hours: Int) -> [Bool] {
        return getLights(hours / 5, totalCountBulps: 4)
    }
    
    static func getSingleHours(_ hours: Int) -> [Bool] {
        return getLights(hours % 5, totalCountBulps: 4)
    }
    
    static func getFiveMinutes(_ minutes: Int) -> [Bool] {
        return getLights(minutes / 5, totalCountBulps: 11)
    }
    
    static func getSingleMinutes(_ minutes: Int) -> [Bool] {
        return getLights(minutes % 5, totalCountBulps: 4)
    }
    
    static func getSingleSeconds(_ seconds: Int) -> [Bool] {
        if seconds % 2 == 0 {
            return [true]
        } else {
            return [false]
        }
    }
    
    static func getLights (_ turnedOn: Int, totalCountBulps: Int) -> [Bool] {
        let onBulps = Array(repeating: true, count: turnedOn)
        let offBulps = Array(repeating: false, count: totalCountBulps - turnedOn)
        
        return onBulps + offBulps
    }
    
    
}
