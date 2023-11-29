let teste = generateParenthesis(2)
print(teste)

func generateParenthesis(_ n: Int) -> [String] {
    
    var res = [String]()
    
    var stack = Stack<String>()
    
    func backtrack(_ openN: Int, _ closedN: Int) {
        if (openN, closedN) == (openN, n) {
            res.append(stack.joined())
            print("Array unido: \(res)")
            print("---- união -----")
            return
        }
        if openN < n {
            stack.push("(")
            print(stack)
            print("Open: \(openN+1), Closed: \(closedN)")
            backtrack(openN + 1, closedN)
            print("Depois do backtrack Open ==> \(openN+1)")
            stack.pop()
            print("Pop Open \(openN+1) ==> \(stack)")
        }
        if closedN < openN {
            stack.push(")")
            print(stack)
            print("Open: \(openN), Closed: \(closedN+1)")
            backtrack(openN, closedN + 1)
            print("Depois do backtrack Close ==> \(closedN+1)")
            stack.pop()
            print("Pop Close \(closedN+1) ==> \(stack)")
        }
    }
    backtrack(0, 0)
    return res
}

struct Stack<T> {
    private var arr = [T]()
    
    mutating func push(_ ele: T) {
        arr.append(ele)
    }
    
    mutating func pop() -> T? {
        if arr.isEmpty {
            return nil
        }
        return arr.removeLast()
    }
    
    func joined() -> String {
        return arr.map { "\($0)" }.joined()
    }
}

let result = carFleet(10, [10,8,0,5,3], [2,4,1,1,3])

func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
    
    let cars = Array(zip(position, speed)).sorted{$0.0 < $1.0}
    
    var stack: [Double] = []
    
    for (p, s) in cars {
        
        let time = Double((target - p) / s)
        
        if !stack.isEmpty, time >= stack.last! {
            stack.removeLast()
        }
        
        stack.append(time)
    }
    
    return stack.count
}
