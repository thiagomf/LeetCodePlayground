import UIKit

func containsDuplicate(_ nums: [Int]) -> Bool {
    var dict = [Int: Int]()
    
    for num in nums {
        if dict[num] != nil {
            return true
        } else {
            dict[num] = 1
        }
    }
    
    return false
}

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var dict = [Character: Int]()
    
    for char in s {
        dict[char, default: 0] += 1
    }
    
    for char in t {
        if let count = dict[char], count > 0 {
            dict[char] = count - 1
        } else {
            return false
        }
    }
    
    return true
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dict = [Int: Int]()
    for (index, value) in nums.enumerated() {
        if let addent = dict[value] {
            return [addent, index]
        } else {
            dict[target - value] = index
        }
    }
    
    return []
}

func groupAnagrams(_ strs: [String]) -> [[String]] {
    // ["eat","tea","tan","ate","nat","bat"]
    var dict = [[Int]: [String]]()
    
    for oneStr in strs {
        var arrChar = [Int](repeating: 0, count: 26)
        for char in oneStr {
            let assicCharValue = Int(char.asciiValue! - 97)
            arrChar[assicCharValue] += 1
        }
        
        dict[arrChar, default: []].append(oneStr)
    }
    
    return Array(dict.values)
}

func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
    var dict = [Int : Int]()
    
    for x in nums {
        dict[x, default: 0] += 1
    }
    
    var buckets = Array(repeating: [Int](), count: nums.count + 1)
    
    for (num, qtd) in dict {
        buckets[qtd].append(num)
    }
    
    var result = [Int]()
    for i in (0 ..< buckets.count).reversed() {
        result += buckets[i]
        if result.count >= k {
            break
        }
    }
    
    return Array(result.prefix(k))
}

let val = productExceptSelf([1,2,3,4])
func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var result = Array(repeating: 1, count: nums.count)
    
    for i in 1 ..< nums.count {
        result[i] = result[i - 1] * nums[i - 1]
        print(result)
    }
    
    var suffix = 1
    for i in (0 ..< nums.count).reversed() {
        print(" i = \(i) number = \(nums[i]) suffix = \(suffix)" )
        result[i] *= suffix
        print(result)
        suffix *= nums[i]
    }
    
    return result
}

//let isValid = isValidSudoku([["5","3",".",".","7",".",".",".","."],
//                             ["6",".",".","1","9","5",".",".","."],
//                             [".","9","8",".",".",".",".","6","."],
//                             ["8",".",".",".","6",".",".",".","3"],
//                             ["4",".",".","8",".","3",".",".","1"],
//                             ["7",".",".",".","2",".",".",".","6"],
//                             [".","6",".",".",".",".","2","8","."],
//                             [".",".",".","4","1","9",".",".","5"],
//                             [".",".",".",".","8",".",".","7","9"]])

let isValid2 = isValidSudoku([[".",".",".",".","5",".",".","1","."],
                              [".","4",".","3",".",".",".",".","."],
                              [".",".",".",".",".","3",".",".","1"],
                              ["8",".",".",".",".",".",".","2","."],
                              [".",".","2",".","7",".",".",".","."],
                              [".","1","5",".",".",".",".",".","."],
                              [".",".",".",".",".","2",".",".","."],
                              [".","2",".","9",".",".",".",".","."],
                              [".",".","4",".",".",".",".",".","."]])

func isValidSudoku(_ board: [[Character]]) -> Bool {
    
    var square = [Character: Bool]()
    
    for i in 0..<9 {
        var line = [Character: Bool]()
        for j in 0..<9 {
            if board[i][j] == "." { continue }
            else {
                if line[board[i][j]] == true {
                    return false
                } else {
                    line[board[i][j], default: false] = true
                }
            }
        }
    }
    
    for j in 0..<9 {
        var col = [Character: Bool]()
        for i in 0..<9 {
            if board[i][j] == "." { continue }
            else {
                if col[board[i][j]] == true {
                    return false
                } else {
                    col[board[i][j], default: false] = true
                }
            }
        }
    }
    
    var dict = [String: [Character]]()
    for i in 0..<9 {
        let posX = i/3
        for j in 0..<9 {
            let posY = j/3
            let value = board[i][j]
            print("[\(posX) \(posY)] => \(value)")
            if value != ".", dict["\(posX)\(posY)", default: []].contains(value) {
                return false
            }
            
            dict["\(posX)\(posY)", default: []].append(value)
        }
    }
    
    return true
}

let res01 = longestConsecutive([100,4,200,1,3,2])

func longestConsecutive(_ nums: [Int]) -> Int {
    
    var set = Set(nums)
    var sequence = 0
    for num in set {
        var count = 1
        var counter = num
        if !set.contains(counter-1) {
            while set.contains(counter+1) {
                count += 1
                counter += 1
            }
            if sequence < count {
                sequence = count
            }
        }
    }
    return sequence
}

func isValid(_ s: String) -> Bool {
    
    var dict: [Character : Character] = ["(" : ")", "[" : "]", "{" : "}"]
    var memory: [Character] = []
    
    for char in s {
        switch (char) {
        case "(", "[", "{" :
            memory.append(dict[char] ?? " ")
        default:
            if memory.isEmpty || memory.removeLast() != char {
                return false
            }
        }
    }
    return memory.isEmpty
}

let value01 = lengthOfLongestSubstring("abcabcbb")

func lengthOfLongestSubstring(_ s: String) -> Int {
    
    var set = Set<Character>()
    var left = 0
    var longestSub = 0
    let arrayOfS = Array(s)
    
    for rigth in 0..<arrayOfS.count {
        
        print("The value : \(arrayOfS[rigth])")
        while set.contains(arrayOfS[rigth]) {
            print("SET contains Rigth => \(arrayOfS[rigth])")
            set.remove(arrayOfS[left])
            print("SET contains Left => \(arrayOfS[left])")
            left += 1
            print("Set after removed: \(set)")
        }
    
        set.insert(arrayOfS[rigth])
        print("insert set => \(set) ")
        longestSub = max(longestSub, rigth - left + 1)
        print("-----------------------------------------")
    }
    
    return longestSub
}
