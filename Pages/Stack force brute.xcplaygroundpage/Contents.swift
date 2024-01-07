//: [Previous](@previous)

let resp = dailyTemperatures([71,69,66,72,64,61,70,76])
func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    
    var stack = [(value: Int, index: Int)]()
    var outVal: [Int] = Array(repeating: 0, count: temperatures.count)
    
    for (index, value) in temperatures.enumerated() {
        while let lastStack = stack.last, lastStack.value < value {
            outVal[lastStack.index] = index - lastStack.index
            stack.removeLast()
        }
        
        stack.append((value, index))
    }
    
    print(stack)
    return outVal
}

/*
 
 temperature -> value: 71 / index: 0
 lastStack = nil
 stack = value: 71 / index: 0
 --------
 
 temperature -> value: 69 / index: 1
 lastStack = value: 71 / index: 0
 X 71 < 69
 stack = value: 71 / index: 0 | value: 69 / index: 1
 
 temperature -> value: 66 / index: 2
 lastStack = value: 69 / index: 1
 X 69 < 66
 stack = value: 71 / index: 0 | value: 69 / index: 1 | value: 66 / index: 2
 
 temperature -> value: 72 / index: 3
 lastStack = value: 66 / index: 2
 ok -> 66 < 72
 output = value: 1 / index: 2
 
 stack = value: 71 / index: 0 | value: 69 / index: 1
 lastStack = value: 69 / index: 1
 ok -> 69 < 72
 output = value: 2 / index: 1 | value: 1 / index: 2
 
 stack = value: 71 / index: 0
 lastStack = value: 71 / index: 0
 ok -> 71 < 72
 output = value 3 index: 0 | value: 2 / index: 1 | value: 1 / index: 2
 */
