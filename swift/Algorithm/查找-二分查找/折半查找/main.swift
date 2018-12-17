//
//  main.swift
//  查找-二分查找/折半查找
//
//  Created by wz on 2018/12/17.
//  Copyright © 2018 wz. All rights reserved.
//

import Foundation

//思想：有序，获取中间元素判断，判断大小，然后向划分区域块查找
//折半查找的前提条件是需要有序表顺序存储，对于静态查找表，一次排序后不再变化，折半查找能得到不错的效率。但对于需要频繁执行插入或删除操作的数据集来说，维护有序的排序会带来不小的工作量，那就不建议使用。

//复杂度分析：最坏情况下，关键词比较次数为log2(n+1)，且期望时间复杂度为O(log2n)；
var count = 0
func BinarySearch(nums:[Int], target: Int, lowIdx: Int, highIdx: Int) -> Int { //O(1)
    count = count+1
    let midIdx = lowIdx+(highIdx-lowIdx)/2;
    if midIdx>highIdx || midIdx<lowIdx {
        return -1
    }
    let mid = nums[midIdx]
    if mid > target {
        return BinarySearch(nums: nums, target: target, lowIdx: lowIdx, highIdx: midIdx-1)
    }else if mid < target {
        return BinarySearch(nums: nums, target: target, lowIdx: midIdx+1, highIdx: highIdx)
    }else {
        return midIdx
    }
}

func BinarySearch1(nums:[Int], target: Int) -> Int {
    var high = nums.count-1
    var low = 0
    
    while low<=high {
        count = count+1
        let mid = low + (high-low)/2
        if nums[mid] > target {
            high = mid-1
        }else if nums[mid] < target {
            low = mid+1
        }else{
            return mid
        }
    }
    return -1
}



var nums = [Int]()
let target = 8796655
var i = 1
while i < 100000000 {
//    if i == target {
//        i = i+1
//        continue
//    }
    nums.append(i)
    i=i+1
}

print("start...")
Utils.startTime()
//print(BinarySearch(nums: nums, target: target, lowIdx: 0, highIdx: nums.count-1)) //0~1
print(BinarySearch1(nums: nums, target: target)) //0~1
print(Utils.endTime())
print("search count: \(count)")
