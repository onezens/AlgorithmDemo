//
//  main.swift
//  查找- 插值查找
//
//  Created by wz on 2018/12/17.
//  Copyright © 2018 wz. All rights reserved.
//

import Foundation

//思想：基于二分查找算法，将查找点的选择改进为自适应选择，可以提高查找效率。当然，差值查找也属于有序查找。
/**
 * 优化: mid=(low+high)/2, 即 mid=low+1/2*(high-low);
 　　　　通过类比，我们可以将查找的点改进为如下：
 　　　　mid = low+(val-a[low])/(a[high]-a[low])*(high-low)，
        让val的值可以靠近mid
 */
//复杂度分析：查找成功或者失败的时间复杂度均为O(log2(log2n))。
//对于表长较大，而关键字分布又比较均匀的查找表来说，插值查找算法的平均性能比折半查找要好的多。反之，数组中如果分布非常不均匀，那么插值查找未必是很合适的选择。
var count=0
func InsertionSearch(nums:[Int], target: Int) -> Int { //O(n)
    
    var high = nums.count-1
    var low = 0
    
    while low<=high {
        count = count+1
        let mid = low + (target-nums[low])/(nums[high]-nums[low]) * (high - low)
        if target>nums[mid] {
            low=mid+1
        }else if target<nums[mid]{
            high=mid-1
        }else{
            return mid
        }
    }
    return -1
}


func InsertionSearch1(nums:[Int], target:Int, low:Int, high:Int) -> Int {
    count=count+1
    if low>high {
        return -1
    }
    let mid = low+(target-nums[low])/(nums[high] - nums[low]) * (high - low)
    if target>nums[mid] {
        return InsertionSearch1(nums: nums, target: target, low: mid+1, high: high)
    }else if target<nums[mid]{
        return InsertionSearch1(nums: nums, target: target, low: low, high: mid-1)
    }else{
        return mid
    }
}

var nums = [Int]()
let target = 100

var i = 0
while i < 100000000 {
//    if i == target {
//        i = i+1
//        continue
//    }
    nums.append(i)
    i=i+1
}
nums.insert(target, at: 8796655)

Utils.startTime()
print("idx: \(InsertionSearch(nums: nums, target: target))") //2117
print("idx1: \(InsertionSearch1(nums: nums, target:target, low:0 , high:nums.count-1))")
print(Utils.endTime())
print("search count: \(count)")

