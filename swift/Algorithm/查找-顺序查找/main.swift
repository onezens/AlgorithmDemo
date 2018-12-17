//
//  main.swift
//  查找-顺序查找
//
//  Created by wz on 2018/12/17.
//  Copyright © 2018 wz. All rights reserved.
//

import Foundation

//思想：根据顺序依次查找
//顺序查找的时间复杂度为O(n)
func SequenceSearch(nums:[Int], target: Int) -> Int { //O(n)
    
    for (idx, ele) in nums.enumerated() {
        if ele == target {
            return idx
        }
    }
    return -1
}



var nums = [Int]()
let target = 234

var i = 0
while i < 100000000 {
    if i == target {
        i = i+1
        continue
    }
    nums.append(i)
    i=i+1
}
nums.insert(target, at: 8796655)

Utils.startTime()
print(SequenceSearch(nums: nums, target: target)) //2117
print(Utils.endTime())
