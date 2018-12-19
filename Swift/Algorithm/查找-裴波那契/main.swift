//
//  main.swift
//  查找-裴波那契
//
//  Created by wz on 2018/12/19.
//  Copyright © 2018 wz. All rights reserved.
//

import Foundation

//斐波那契数列：1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89…….（从第三个数开始，后边每一个数都是前两个数的和）。然后我们会发现，随着斐波那契数列的递增，前后两个数的比值会越来越接近0.618
//思想：也是二分查找的一种提升算法，通过运用黄金比例的概念在数列中选择查找点进行查找，提高查找效率。同样地，斐波那契查找也属于一种有序查找算法
//复杂度分析：最坏情况下，时间复杂度为O(log2n)，且其期望复杂度也为O(log2n)

//构造裴波那契数列
func Fibonacci(length:Int) -> [Int] {
    var f_arr = [Int]()
    f_arr.insert(1, at: 0)
    f_arr.insert(1, at: 1)
    for idx in 2..<length {
        f_arr.insert(f_arr[idx-1] + f_arr[idx-2], at: idx)
    }
    return f_arr
}


func FibonacciSearch(_ nums:[Int], _ target: Int) -> Int {
    
    let f_arr = Fibonacci(length: nums.count)
    var k:Int = 0
    
    //查找满足要求的k
    while nums.count>f_arr[k] {
        k=k+1
    }
    var low=0
    var high=nums.count-1
    var new_nums = nums
    //填充空白
    if k>nums.count {
        for idx in nums.count...k {
            new_nums.insert(nums[high], at: idx)
        }
    }
    
    //开始查找
    while low<=high {
        
        let mid = low+f_arr[k-1]
        if new_nums[mid] == target {
            return mid>nums.count ? nums.count-1 : mid
        }else if new_nums[mid] > target {
            high = mid-1
            k = k-1
        }else {
            low = mid+1
            k = k-2
        }
    }
    
    return -1
    
}

print(FibonacciSearch([1,2,3,4,5,6,7,8,9], 9))
