//: [Previous](@previous)

import Foundation

let value = isPalindrome("KAIAK")


func isPalindrome(_ s: String) -> Bool {
    
    let value = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
    var begin = 0
    var finish = value.count - 1
    
    while begin <= finish {
        if value[begin] == value[finish] {
            begin += 1
            finish -= 1
        } else
        {
            return false
        }
    }
    
    return true
}

let total = twoSum([2,7,11,15], 9)
print(total)

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var finished = numbers.count - 1
    var begin = 0
    while begin <= finished {
        let searchNumber = target - numbers[begin]
        if numbers[finished] == searchNumber {
            return [begin+1, finished]
        } else {
            finished -= 1
        }
    }
    return [begin, finished]
}

let total2 = twoSum2([3,8,10,18,22,30], 9)
print(total2)

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        
        // Based on the sum, move one of the pointers.
        if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        } else {
            // Found the pair that sums to the target.
            // Return the indices (1-indexed).
            return [left + 1, right + 1]
        }
    }
    
    return []
}

var resp = threeSum([-1,0,1,2,-1,-4])

print(resp)

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    let sortedNums = nums.sorted()
    var response = Set<[Int]>()
    
    for i in 0 ..< sortedNums.count {
        
        var j = i + 1
        var k = sortedNums.count-1
        
        while j < k {
            
            let sum = sortedNums[i] + sortedNums[j] + sortedNums[k]
            
            if sum == 0 {
                
                response.insert([sortedNums[i], sortedNums[j], sortedNums[k]])
                j += 1
                k -= 1
                
            } else if sum < 0 {
                
                j += 1
                
            } else {
                
                k -= 1
            }
        }
    }
    
    return Array(response)
}

let result = maxArea([1,8,6,2,5,4,8,3,7])
print(result)

func maxArea(_ height: [Int]) -> Int {
    var result: Int = 0
    var l: Int = 0
    var r: Int = height.count - 1
    
    while l < r {
        
        let area = (r - l) * min(height[l], height[r])
        result = max(area, result)
        
        if height[l] < height[r] {
            l += 1
        } else {
            r -= 1
        }
    }
    
    return result
}

func isPalindrome(_ s: String) -> Bool {
    
    let value = Array(s.lowercased().filter { $0.isLetter || $0.isNumber })
    var begin = 0
    var finish = value.count - 1
    
    while begin <= finish {
        if value[begin] == value[finish] {
            begin += 1
            finish -= 1
        } else
        {
            return false
        }
    }
    
    return true
}
let value = isPalindrome("KAIAK")
print(value)

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var finished = numbers.count - 1
    var begin = 0
    while begin <= finished {
        let searchNumber = target - numbers[begin]
        if numbers[finished] == searchNumber {
            return [begin+1, finished+1]
        } else {
            finished -= 1
        }
    }
    return [begin, finished]
}

let sum = twoSum2([3,8,10,18,22,30], 32)
print(sum)

func twoSum2(_ numbers: [Int], _ target: Int) -> [Int] {
    var left = 0
    var right = numbers.count - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        
        // Based on the sum, move one of the pointers.
        if sum < target {
            left += 1
        } else if sum > target {
            right -= 1
        } else {
            // Found the pair that sums to the target.
            // Return the indices (1-indexed).
            return [left + 1, right + 1]
        }
    }
    
    return []
}
