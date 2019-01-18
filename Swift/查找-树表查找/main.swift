//
//  main.swift
//  查找-树表查找
//
//  Created by wz on 2018/12/19.
//  Copyright © 2018 wz. All rights reserved.
//

import Foundation

//二叉树查找算法

/**
 二叉查找树 BinarySearch Tree or Binary Sort Tree （二叉排序树）
 1. 左子树所有的节点的值，小于根节点，并且不为空
 2. 右子树所有的节点的值，大于更节点，并且不为空
 3. 任意节点的左右子树也为二叉树
 */

//复杂度分析：和二分查找一样，插入和查找的时间复杂度均为O(logn)，但是在最坏的情况下仍然会有O(n)的时间复杂度

//　基于二叉查找树进行优化，进而可以得到其他的树表查找算法，如平衡树、红黑树等高效算法。
