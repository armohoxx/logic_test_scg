//
//  ViewController.swift
//  logic_test_scg
//
//  Created by Phattarapon Jungtakarn on 24/7/2566 BE.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: 1.Please write a function to find the index that has the sum of left’s elements equal to the sum of right’s elements
        let input1 = [1, 3, 5, 7, 9]
        let input2 = [3, 6, 8, 1, 5, 10, 1, 7]
        let input3 = [3, 5, 6]
        
        let index1 = findIndexWithEqualLeftRightSums(input1)
        let index2 = findIndexWithEqualLeftRightSums(input2)
        let index3 = findIndexWithEqualLeftRightSums(input3)
        
        if index1 != nil {
            print("middle index is \(index1 ?? 0)")
        } else {
            print("index not found")
        }
        
        if index2 != nil {
            print("middle index is \(index2 ?? 0)")
        } else {
            print("index not found")
        }
        
        if index3 != nil {
            print("middle index is \(index3 ?? 0)")
        } else {
            print("index not found")
        }
       
        //MARK: 2.Please write a function to detect that incoming string is palindrome or not
        print(isPalindromeString("aka"))
        print(isPalindromeString("Level"))
        print(isPalindromeString("Hello"))
        print(isPalindromeString("Arm"))
        print(isPalindromeString("A"))
        print(isPalindromeString(""))
    }
    
    func findIndexWithEqualLeftRightSums(_ nums: [Int]) -> Int? {
        guard nums.count >= 2 else {
            return nil
        }
        
        let totalSum = nums.reduce(0, +)
        
        var leftSum = 0
        
        for (index, num) in nums.enumerated() {
            let rightSum = totalSum - leftSum - num
            
            if leftSum == rightSum {
                return index
            }
            
            leftSum += num
        }
        
        return nil
    }

    func isPalindromeString(_ input: String) -> String {
        let lowercaseInput = input.lowercased()
        let alphanumericInput = lowercaseInput.filter { $0.isLetter || $0.isNumber }
        
        guard alphanumericInput.count > 1 else {
            return "\(input)" + " is a palindrome"
        }
        
        var leftPointer = alphanumericInput.startIndex
        var rightPointer = alphanumericInput.index(before: alphanumericInput.endIndex)
        
        while leftPointer < rightPointer {
            if alphanumericInput[leftPointer] != alphanumericInput[rightPointer] {
                return "\(input)" + " isn’t a palindrome"
            }
            leftPointer = alphanumericInput.index(after: leftPointer)
            rightPointer = alphanumericInput.index(before: rightPointer)
        }
        
        return "\(input)" + " is a palindrome"
    }
    
}

