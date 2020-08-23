import UIKit

public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() {
        array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

func nearestGreatertoRight(input:[Int]) -> [Int] {
    var output = [Int]()
    // First condition
    var stack = Stack<Int>()
    
    for index in stride(from: input.count, to: 0, by: -1){
        // If stack is empty
        if stack.isEmpty {
            output.append(-1)
        }
        
        // current index is less than old greater
        else if !stack.isEmpty && stack.top! > input[index-1]{
            output.append(stack.top!)
        }

        // current index is greater than old greater
        else if !stack.isEmpty && stack.top! <= input[index-1]{
            while (!stack.isEmpty && stack.top! < input[index-1]) {
                stack.pop()
            }
            if stack.isEmpty{
                output.append(-1)
            } else {
                output.append(stack.top!)
            }
        }
        stack.push(input[index-1])
    }
    return output.reversed()
}

print(nearestGreatertoRight(input: [1,3,2,4]))


