class MinStack {

    var itens: [Int] = []
    var minStack: [Int] = []

    init() {
    }
    
    func push(_ val: Int) {
        
        itens.insert(val, at: 0)

        if !minStack.isEmpty {
            let min = min(val, minStack[0])
            minStack.insert(min, at: 0)
            print("Min: \(minStack)")
            print("Itens: \(itens)")
        } else {
            minStack.insert(val, at: 0)
        }
    }
    
    func pop() {
        itens.removeFirst()
        minStack.removeFirst()
        print(itens.removeFirst())
    }
    
    func top() -> Int {
        guard let item = itens.first else { fatalError("Is empty") }
        return item
    }
    
    func getMin() -> Int {
        
        return minStack[0]
    }
}

let stacks = MinStack()
stacks.push(-2)
stacks.push(0)
stacks.push(-3)
let minStack0 = stacks.getMin()
stacks.pop()
stacks.top()
let minStack1 = stacks.getMin()
