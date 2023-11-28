//: [Previous](@previous)

import Foundation

let out = generatedParenteses(3)
print(out)

func generatedParenteses(_ num: Int) -> [String] {
    
    var outputArray = [String]()
    func backtrack(_ currentString: String,
                   _ openN: Int, _ closeN: Int, _ max: Int) {
        
        if currentString.count == max * 2 {
            outputArray.append(currentString)
            return
        }
        
        if openN < max {
            let parenteses = currentString+"("
            backtrack(parenteses, openN + 1, closeN, max)
        }
        
        if closeN < openN {
            let parenteses = currentString+")"
            backtrack(parenteses, openN, closeN+1, max)
        }
    }
    
    backtrack("", 0 , 0, num)
    return outputArray
}

//comece com a e acabe com b

let generated = generatedVogals(6)
print(generated)

func generatedVogals(_ num: Int) -> [String] {
    
    var vogals = [String]()
    
    func backtrack( _ collectVogals: String, _ open: Int, _ close: Int, _ max: Int) {
        
        if collectVogals.count == max {
            if collectVogals.last == "b" {
                vogals.append(collectVogals)
            }
            return
        }
        
        if open < max {
            let vogal = collectVogals + "a"
            backtrack(vogal, open + 1, close, max)
        }
        
        if close < open {
            let vogal = collectVogals + "b"
            backtrack(vogal, open, close + 1, max)
        }
    }
    
    backtrack("", 0, 0, num)
    return vogals
    
}



/*
backtrack -> [], "", 0 , 0, 2
openN : 0 < max: 2
parenteses: (
 
backtract -> [], (, 1, 0, 2
openN: 1 < max: 2
parenteses: ((

backtrack -> [], ((, 2, 0, 2
openN: 2 - max: 2
closeN: 0 < openN: 2
parenteses: (()

backtrack -> [], ((), 2, 1, 2
closeN: 1 < openN: 2
parenteses: (())

backstrack -> [], (()), 2, 2, 2
outputArray = (())


*/
