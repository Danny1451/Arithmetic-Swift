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



