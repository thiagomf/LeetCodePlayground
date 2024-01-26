//: [Previous](@previous)

import Foundation

let result = romanToInt("IV")

func romanToInt(_ s: String) -> Int {
    
    var roman: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    var result = 0
    
    let charArray = Array(s)
    
    for index in 0..<charArray.count {
        
        if index + 1 < s.count, roman[charArray[index]] ?? 0 < roman[charArray[index+1]] ?? 0 {
            result -= roman[charArray[index]] ?? 0
        } else {
            result += roman[charArray[index]] ?? 0
        }
    }
    
    return result
}

let prefix = longestCommonPrefix(["flower","flow","flight"])

func longestCommonPrefix(_ strs: [String]) -> String {
    
    var min = strs.min() ?? ""
    for str in strs {
        while !str.hasPrefix(min) {
            min.removeLast()
        }
    }
    
    return min
}


let missing = missingNumber([0,1])


func missingNumber(_ nums: [Int]) -> Int {
    
    var numElem = nums.count
    let shortedArray = nums.sorted()
    var counter = 0
    
    while counter < numElem {
        if shortedArray[counter] == counter {
            counter += 1
        } else {
            return counter
        }
    }
    
    return counter + 1
}

let sea = searchBinary([-1,0,3,5,9,12], 9)

func searchBinary(_ nums: [Int], _ target: Int) -> Int {
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        
        let medium = (right + left) / 2
        
        if nums[medium] < target {
            left = medium + 1
        } else if nums[medium] > target {
            right = medium - 1
        } else {
            return medium
        }
    }
    
    return -1
    
}

let sear = searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3)

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    let rows = matrix.count
    let cols = matrix[0].count
    
    var left = 0
    var right = rows * cols - 1
    
    while left <= right {
        
        let mid = left + (right - left) / 2
        
        print("Meio: \(mid)")
        
        let line = mid / cols
        let colum = mid % cols
        
        print("Line: \(line), colum: \(colum)")
        
        let midValue = matrix[line][colum]
        
        if midValue == target {
            return true
        } else if midValue < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return false
}
