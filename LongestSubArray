//
//  main.swift
//  LongestSubArry
//
//  Created by Yogesh Murugesh on 08/09/25.
//

import Foundation

print("Enter the Array Count:")
var count = 0
if let input = readLine(), let intInput = Int(input) {
    count = intInput
} else {
    print("Entered count is invalid")
    exit(0)
}

print("Enter the Elements:")
var inputArray: [Int] = []
for _ in 0..<count {
    if let input = readLine(),  let intInput = Int(input) {
        inputArray.append(intInput)
    } else {
        print("Entered input is invalid")
        exit(0)
    }
}
//print(inputArray)

if inputArray.contains(0) {
    let zeroOffsetArray = inputArray.enumerated().filter { $1 == 0 }.map(\.offset)
//    print(zeroOffsetArray)
    var outputCount = 0
    for index in 0..<zeroOffsetArray.count {
        if zeroOffsetArray.count > index + 2 {
            let temp1 = zeroOffsetArray[index]
            let temp2 = zeroOffsetArray[index+1]
            let finalTemp1 = ((temp2-1) - temp1)
            
            let temp3 = zeroOffsetArray[index+1]
            let temp4 = zeroOffsetArray[index+2]
            let finalTemp2 = ((temp4-1) - temp3)
            
            let max = finalTemp1 + finalTemp2
            if max > outputCount {
                outputCount = max
            }
//            print("First if: \(outputCount)")
        } else if zeroOffsetArray.count > index + 1 {
            let temp1 = zeroOffsetArray[index]
            let temp2 = zeroOffsetArray[index+1]
           
            var finalTemp1 = ((temp2-1) - temp1)
            if (((inputArray.count - 1) - index + 1) > 0) {
                finalTemp1 += ((inputArray.count - 1) - temp2)
            }
            if finalTemp1 > outputCount {
                outputCount = finalTemp1
            }
//            print("Second if: \(outputCount)")
        } else if zeroOffsetArray.count == 1 {
            outputCount = inputArray.count - 1
//            print("Third if: \(outputCount)")
        }
    }
    print("Ouput is: \(outputCount)")
} else {
    print(inputArray.dropLast().count)
}
