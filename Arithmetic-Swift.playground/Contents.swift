//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"

//0-100 桶排序
func TongSort( numbers: [Int])->[Int]{
    var tong : [Int] = [0]
    var res : [Int] = Array()
    for _ in 0...100 {
        tong.append(0)
    }
    
    for num in numbers {
        tong[num] = 1
    }
    
    for i in 0...100 {
        if tong[i] == 1 {
            res.append(i)
        }
    }
    
    return res
    
}

//冒泡排序
func PaoSort( numbers: inout [Int]){
    
    
    for i in 0..<(numbers.count) {
        
        for j in 0..<(numbers.count-1-i) {
            
            
            if numbers[j] > numbers[j+1] {
                let temp = numbers[j]
                
                numbers[j] = numbers[j+1]
                
                numbers[j+1] = temp
            }
        }
        
    }
    
}

//快速排序
func FastSort( numbers: inout [Int] , start : Int , end : Int){
    
    if start < end {
        
        
        let temp = numbers[start]
        var i = start
        var j = end
        
        while i != j {
            
            while(numbers[j] >= temp ) && (i < j) {
                
                j = j - 1
                
            }
            
            
            while(numbers[i] <= temp ) && (i < j) {
                
                i = i + 1
                
            }
            
            
            if i < j {
                let temp = numbers[i]
                
                numbers[i] = numbers[j]
                
                numbers[j] = temp
            }
            

        }
        
        numbers[start] = numbers[i]
        numbers[i] = temp
        
        FastSort(numbers: &numbers , start: start, end: i-1)
        FastSort(numbers: &numbers , start: i + 1, end: end)
    }
    
}

func timeNow()->Double{
    let timeIntervalTongS:TimeInterval = NSDate().timeIntervalSince1970
    let timeStampTongS = Double(timeIntervalTongS)
    return timeStampTongS;
}

func testSortSpeed(list:inout [Int] , sortWays: (inout [Int])->()) -> Double{
    let start = timeNow()
    sortWays(&list)
    let end = timeNow()
    let delayTime = end - start
    return delayTime
}
//两数循环 1. Two Sum
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var res:[Int] = [0,0]
    
    for i in 0..<nums.count {
        for j in i..<nums.count {
            if (nums[i]+nums[j]) == target && i != j{
                res[0] = i
                res[1] = j
            }
        }
    }
    
    return res
}

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
}

//两数相加 2. Add Two Numbers
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {

    func getCode(num1:Int ,num2:Int, jin:Bool) -> (Bool,Int){
        var res = num1 + num2;
        if jin {
            res = res + 1
        }
        if res >= 10 {
            return (true,res % 10)
        }
        return (false,res % 10)
    }
    
    var res:ListNode?
    
    if l1 == nil || l2 == nil {
        return nil
    }
    
    var headL1 = l1
    var headL2 = l2
    var resLast :ListNode?
    var jinwei = false
    while headL1 != nil || headL2 != nil{
        var int1 = 0
        var int2 = 0
        if headL2 != nil {
            int2 = (headL2?.val)!
        }
        if headL1 != nil {
            int1 = (headL1?.val)!
        }
        
        let numRes = getCode(num1:int2 ,num2:int1,jin: jinwei)
        let num = numRes.1
        jinwei = numRes.0
        
        if resLast == nil {
            resLast = ListNode(num)
            res = resLast
        }else{
            resLast?.next = ListNode(num)
            resLast = resLast?.next
        }
        
        headL1 = headL1?.next
        headL2 = headL2?.next
        
    }
    if jinwei {
        resLast?.next = ListNode(1)
    }
    
    
    return res
    
}

//链表翻转 61. Rotate List
func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    
    if head == nil || head?.next == nil{
        return head
    }
    
    var temp = head
    
    if k == 0 {
        return head
    }
    
    //计算length
    var length = 1
    while temp?.next != nil {
        length = length + 1
        temp = temp?.next
    }
    
    if length == k {
        return head
    }
    
    
    //新的位置
    var count = k
    if count > length {
        count = count % length
    }
    if count == 0 {
        return head
    }
    
    //开始移动
    temp = head
    var index = 0
    var res : ListNode?
    
    while temp?.next != nil{
        
        
        if index == (length - count - 1){
            
            res = temp?.next
            
            temp?.next = nil
            
            temp = res!
        }else{
            temp = temp?.next
        }
        index = index + 1
        
    }
    temp?.next = head
    return res
}
let ln5 = ListNode(5)
let ln4 = ListNode(4)
ln4.next = ln5
let ln3 = ListNode(3)
ln3.next = ln4
let ln2 = ListNode(2)
ln2.next = ln3
let ln1 = ListNode(1)
ln1.next = ln2

rotateRight(ln1, 2)
twoSum([0,4,3,0], 0)


//最大不同 318. Maximum Product of Word Lengths
func maxProduct(_ words: [String]) -> Int {
    

    var newArray:[UInt32] = Array()
    var i = 0
    for str in words {
        
        newArray.append(0)
        if let array = str.cString(using: String.Encoding.ascii) {
            for ch in array {
                if ch != 0 {
                    newArray[i] |= UInt32(1) << UInt32(ch - 97)
                }
            }
        }
        i += 1
    }

    var res = 0
    for i in 0..<words.count {
        for j in i+1..<words.count {
            if ((newArray[i] & newArray[j])) == 0 {
                let value = words[i].characters.count *  words[j].characters.count
                
                if value > res {
                    res = value
                }
            }

        }
    }
    
    return res
}

//for i in 0..<1000 {
//    for j in i+1..<1000 {
//        test = i * j
////        print(i*j)
//    }
//}
//var test = "abcdhello"
//let res = test.cString(using: String.Encoding.ascii)
//res?[1]
//["abcw", "baz", "foo", "bar", "xtfn", "abcdef"]
//maxProduct(["abcw", "baz", "foo", "bar", "xtfn", "abcdef"])
//maxProduct(["a", "ab", "abc", "d", "cd", "bcd", "abcd"])

//3. Longest Substring Without Repeating Characters
func lengthOfLongestSubstring(_ s: String) -> Int {

    
    var subStr = ""
    var max = 0
    for char in s.characters {
        print("start \(char) ")
      
        if subStr.contains(String(char)) {
            if(subStr.characters.count > max){
                max = subStr.characters.count
                
                
            }
        
            let range = subStr.range(of: String(char), options: String.CompareOptions.backwards, range: nil, locale: nil)
            
            subStr = subStr.substring(from: (range?.upperBound)!)
            
        }
        subStr.append(char)
        

    }
    if(subStr.characters.count > max){
        max = subStr.characters.count
    }
    
    return max
}

lengthOfLongestSubstring("dvdf")
/**********************************************/


//当前时间的时间戳
let t1 = timeNow()
TongSort(numbers: [13,41,5,56,2,45,67,21,30,3])
let t2 = timeNow()
let tongTime = t2 - t1



var arrayPao = [13,41,5,56,2,45,67,21,30,3]
testSortSpeed(list: &arrayPao, sortWays: PaoSort)
//PaoSort(numbers:  &arrayPao)


let t5 = timeNow()
var array = [13,41,5,56,2,45,67,21,30,3]
FastSort(numbers: &array ,start: 0, end:(array.count - 1) )
let t6 = timeNow()
let fastTime = t6 - t5



