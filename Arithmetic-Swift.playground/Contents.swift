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
//5. Longest Palindromic Substring
func longestPalindrome(_ s: String) -> String {
    
    if s.characters.count == 1 || s.characters.count == 0{
        return s
    }
    var maxLength = 0
    var maxIndex = 0

    let strArray = s.cString(using: String.Encoding.ascii)
    
    //加入差值占位符
    var newStrArray:[CChar] = Array()
    for strIndex in strArray!{
        
        newStrArray.append(strIndex)
        newStrArray.append(CChar(44))
    }
    
    //遍历找出最多的那个位置
    let length = newStrArray.count-1
    for i in 1..<length {
        let currentMaxLength = min(i, length-i)
        
        for j in 0...currentMaxLength {
            if newStrArray[i-j] == newStrArray[i+j] {
                if j > maxLength {
                    
                    maxLength = j
                    maxIndex = i
                }
                
            }else{
                break
            }
        }
    }
    
    //去除间隔符
    var resStrArray:[CChar] = Array()
    for i in maxIndex-maxLength...maxIndex+maxLength+1 {
        if newStrArray[i] != CChar(44) {
            resStrArray.append(newStrArray[i])
        }
    }
    var res = s
    resStrArray.withUnsafeBufferPointer { (ptr) in
        res = String(cString: ptr.baseAddress!)
    }
    return res
    
}




longestPalindrome("ccc#")

func reverse(_ x: Int) -> Int {
    
    
    var isMins =  false
    var num = x
    if num<0 {
        isMins = true
        num = -x
    }
    
    let numStr = String(num)
    
    var newCArray = numStr.cString(using: String.Encoding.utf8)
    newCArray?.removeLast()
    newCArray?.reverse()
 
    let newStr = String(cString:newCArray!)
    let newNum = Int(newStr)
    
    if isMins {
        return -newNum!
    }else{
        return newNum!
    }
}

reverse(1534236469)
//当剩下4个的时候一定会输 类似于数学归纳的方法
func canWinNim(_ n: Int) -> Bool {
 
    return (n % 4 != 0)
    
}
canWinNim(3)


func singleNumber(_ nums: [Int]) -> Int {


    var result = 0
    for i in nums{
        
        result = result^i
        
    }
    return result
}

singleNumber([1,1,2,3,2,4,4,5,5])


  public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
     public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
  }
func maxDepth(_ root: TreeNode?) -> Int {
    
    var maxDepth = 1
    
    if root == nil {
        return 0
    }
    func dfs(leaf:TreeNode? , depth:Int) -> Int{
        
        if leaf?.left == nil && leaf?.right == nil {
            if depth > maxDepth {
                maxDepth = depth
            }
            return maxDepth
        }
        
        if leaf?.left != nil {
            let leftdepth = dfs(leaf: leaf?.left, depth: depth+1)
            if leftdepth > maxDepth {
                maxDepth = leftdepth
            }
        }
        if leaf?.right != nil {
            let rightdepth = dfs(leaf: leaf?.right, depth: depth+1)
            if rightdepth > maxDepth {
                maxDepth = rightdepth
            }
        }
        
        return maxDepth
        
    }
    
    
    return dfs(leaf: root, depth: 1)
}

func invertTree(_ root: TreeNode?) -> TreeNode? {
 
    var newRes = root
    
    func treeResver(leaf: TreeNode?){
        
        if leaf?.left == nil && leaf?.right == nil {
            
            return 
        }
        
       
            
            let temp = leaf?.left
            leaf?.left = leaf?.right
            leaf?.right = temp
            
        
        
        if leaf?.left != nil {
            treeResver(leaf: leaf?.left)
        }
        if leaf?.right != nil {
            treeResver(leaf: leaf?.right)
        }

    }
    
    treeResver(leaf: root)
    return newRes
}

func addDigits(_ num: Int) -> Int {
 
    var res = 0
    var source = num
    while  source != 0{
        res += source % 10
        source /= 10
    }
    if res >= 10 {
        return addDigits(res)
    }
    return res
}

addDigits(19)


func moveZeroes(_ nums: inout [Int]) {
    var zero = -1
    for i in 0..<nums.count {
        
        var temp = nums[i]
        if temp != 0 {
            if zero >= 0 {
                nums[zero] = temp
                zero+=1
                nums[i] = 0
                
            }
        }else{
            if zero == -1 {
                zero = i
            }
        }
        
        
    }
}
var arrayZero = [0,0,1]
moveZeroes(&arrayZero)

//404 Sum of Left Leaves
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    var sum = 0
    
    func dfs(_ leaf:TreeNode?){
        
        if leaf?.left == nil && leaf?.right == nil {
            
            return
        }
        
        if leaf?.left != nil {
            
            if leaf?.left?.left == nil && leaf?.left?.right == nil {
                sum += (leaf?.left?.val)!
                print(leaf?.left?.val)
            }else{
                dfs(leaf?.left)
            }
        }
        if leaf?.right != nil {
            dfs(leaf?.right)
        }
    }
    
    dfs(root)
    return sum
    
}
//26个字母占坑 58个
//409 Longest Palindrome
func longestPalindromeNum(_ s: String) -> Int {
    var res = 0
    
    var letters = Array(repeating: 0, count: 200)
    
    let strArray = s.cString(using: String.Encoding.ascii)
    
    for temp in strArray! {
        
        if letters[temp.hashValue] == 0 {
            letters[temp.hashValue] = 1
        }else{
            letters[temp.hashValue] += 1
        }
        print(temp.hashValue)
    }
    
    for temp in letters {
        if temp > 1 {
            temp % 2 == 0 ? (res += temp) : (res += (temp-1))
        }
    }
    
    if res == s.characters.count {
        return res
    }
    return res + 1;
}
longestPalindromeNum("bbccsdcca")

//383 Ransom Note
func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

    if ransomNote.isEmpty {
        return true
    }
    
    var ranArray = Array(repeating: 0, count: 27)
    var magArray = Array(repeating: 0, count: 27)
    
    for magchar in magazine.cString(using: String.Encoding.ascii)! {
        
        if magchar.hashValue != 0 {
            let index = magchar.hashValue - 96
            if magArray[index] == 0 {
                magArray[index] = 1
            }else{
                magArray[index] += 1
            }
            
        }
        
    }
    
    for ranchar in ransomNote.cString(using: String.Encoding.ascii)! {
        
        if ranchar.hashValue != 0 {
            let index = ranchar.hashValue - 96
            if ranArray[index] == 0 {
                ranArray[index]  = 1
            }else{
                ranArray[index] += 1
            }
            
        }
        
    }
    print(ranArray)
    print(magArray)
    for i in 0..<ranArray.count {
        if ranArray[i] != 0 {
            if ranArray[i] > magArray[i] {
                return false
            }
        }
    }
    
    return true
//    var newStr = ""
//    for magchar in magazine.characters {
//        
//        if ransomNote.contains(String(magchar)) {
//            newStr.append(magchar)
//        }
//        
//    }
//    print(newStr)
//    return newStr.contains(ransomNote)
    
//    var normalRes = 0
//    
//    for normal in magazine.cString(using: String.Encoding.ascii)! {
//        normalRes ^= normal.hashValue
//    }
//
//    var appendRes = 0
//    for append in ransomNote.appending(magazine).cString(using: String.Encoding.ascii)!{
//        appendRes ^= append.hashValue
//    }
//    print(" n = \(normalRes) a = \(appendRes)")
//    return appendRes == normalRes ? true : false
}
canConstruct("fffbfg",
    "effjfggbffjdgbjjhhdegh")

//349. Intersection of Two Arrays
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var res:[Int] = Array()
    
    for num1 in nums1 {
        if nums2.contains(num1) {
            if !res.contains(num1) {
                res.append(num1)
            }
            
        }
    }
    
    return res
}

//100. Same Tree
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    
    
    
    if p?.val != q?.val {
        return false;
    }
    
    if p?.left == nil && p?.right == nil && q?.left == nil && q?.right == nil && p?.val == q?.val {
        return true
    }
    
    
    return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
}
//171. Excel Sheet Column Number
func titleToNumber(_ s: String) -> Int {
    func cifang(_ num: Int ,_ cifang:Int) -> Int{
        if cifang == 0 {
            return 1
        }
        var res = num
        
        for _ in 1..<cifang {
            res *= num
        }
        
        return res
    }
    var res = 0
    
    var cArray = s.cString(using: String.Encoding.ascii)
    
    for i in 0..<(cArray?.count)! - 1 {
        let charNum = (cArray?[i])!.hashValue - 64
        
        res += cifang(26, (cArray?.count)! - 1 - i - 1)*charNum
    }
    
    return res
}
titleToNumber("ABA")

//387. First Unique Character in a String
func firstUniqChar(_ s: String) -> Int {

    var letter = Array(repeating: -1, count: 27)
    var cString = s.cString(using: String.Encoding.ascii)
    var index = -1
    
    for i in 0..<((cString?.count)! - 1) {
        
        let charNum = (cString?[i].hashValue)! - 96
        
        if letter[charNum] == -1 {
            print("c = \(charNum) i = \(i) ")
            letter[charNum] = i
        }else{
            letter[charNum] = -2 //show twice
        }
        
    }
    
    print(letter)
    for pos in 0..<letter.count {
        
        if letter[pos] != -1 && letter[pos] != -2 {
            if index == -1 {
                index = letter[pos]
            }
            if index > letter[pos] {
                index = letter[pos]
            }
        }
    }
    
    return index
    
}

firstUniqChar("fa")

//169. Majority Element

func majorityElement(_ nums: [Int]) -> Int {
    var res = 0
    var num = 0
    var dic:[Int:Int] = [:]
    for index in 0..<nums.count {
        if let value = dic[nums[index]] {
            dic[nums[index]] = 1 + value
        }else{
            dic[nums[index]] = 1
        }
    }
    
    for (key, value) in dic {
        if value > res {
            res = value
            num = key
        }
    }
    
    return num
}

majorityElement([1,2,3,4,5,5,5,5,5,5,23,41,42,35,34,23,34,535,64,43,5,234324,2])

//217. Contains Duplicate 
func containsDuplicate(_ nums: [Int]) -> Bool {
    
    var dic:[Int:Int] = [:]
    //1。遍历 太慢 只做n时间复杂度的
    
    for index in nums{
       dic[index] = 0
    }
    
    if dic.count == nums.count {
        return false
    }
    
    return true
}

containsDuplicate([1,23,4,5,6,7,5])


//401. Binary Watch
func readBinaryWatch(_ num: Int) -> [String] {
    
    
    return [""]
}

//350. Intersection of Two Arrays II
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
 
    var longArray:[Int]
    var shortArray:[Int]
    var res:[Int] = Array();
    if nums1.count > nums2.count {
        longArray = nums1
        shortArray = nums2
    }else{
        shortArray = nums1
        longArray = nums2
    }
    
    for index in 0..<shortArray.count {
        if longArray.contains(shortArray[index]) {
            res.append(shortArray[index])
            longArray.remove(at: longArray.index(of:shortArray[index])!)
        }
    }
    
    return res
}

intersect([1,23,4,5], [1,4,4]);

/**********************************************/

var strs = "A B hello world"
print(strs.cString(using: String.Encoding.ascii))
strs += "there"
let char:Character = "!"
strs.append(char)

//一些特殊字符 通过\转译字符
let einstein = "\" l love u\" - cc "
//unicode码
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


//生成空字符串
var empty = ""
var another = String()

if empty.isEmpty {
    print("i'm empty")
}

//String的拼接

var changeStr = "i"
changeStr += "love u"

//Swift 中的String 是 value类型的 ，并不是对象的类型，不像OC中的NSString一样，每次构造新的String的时候都会复制一份新的。这一特性确保了，你在任何方法和函数中拿到的String都是绝对安全的，除非你去改变它的值的话，一搬这个值是不会变得
//Swift 的编译器会进行优化，只有当你改变值的时候才会去进行拷贝操作，所以用的时候并不会有性能比问题

for character in "Dog!🐶".characters {
    print(changeStr)
}
// D
// o
// g
// !
// 🐶

let singleChar:Character = "!"//只能是一位

//String可以通过Character的数组来构造
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"


var greeting = "hello world"
greeting[greeting.startIndex]

greeting[greeting.index(after: greeting.startIndex)]

greeting[greeting.index(before: greeting.endIndex)]

let index = greeting.index(greeting.startIndex, offsetBy: 3)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index])" ,terminator:" ")
}
//h e l l o   w o r l d
//小技巧
//print(_:separator:terminator:)  两个参数代表 间隔符 和 不换行

greeting.insert("!", at: greeting.endIndex)
greeting.insert(contentsOf: " swift".characters, at: greeting.endIndex)
greeting.insert(contentsOf: " ,".characters, at: greeting.index(greeting.startIndex, offsetBy: 5))

greeting.remove(at: greeting.startIndex)
greeting.removeSubrange(greeting.startIndex..<greeting.index(greeting.startIndex, offsetBy: 3))
greeting.removeSubrange(greeting.index(greeting.endIndex, offsetBy: -6)..<greeting.endIndex)
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



