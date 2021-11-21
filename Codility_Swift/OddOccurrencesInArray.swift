//
//  OddOccurrencesInArray.swift
//  Codility_Swift
//
//  Created by Kyungmin Lee on 2021/11/21.
//

import Foundation
import XCTest

/// Lesson 2 -
/// Arrays -
/// [OddOccurrencesInArray](https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/)
/// - Score: 100%
/// - Task Score: 100%
/// - Correctness: 100%
struct OddOccurrencesInArray {
    // Correctness 100%
    // Performance 60%
    // 정확도는 맞지만 속도에서 실패하는 케이스 있음
//    public func solution(_ A : inout [Int]) -> Int {
//        var temp = [Int]()
//
//        for i in A {
//            if temp.contains(i) {
//                let index = temp.firstIndex(of: i)!
//                temp.remove(at: index)
//            } else {
//                temp.append(i)
//            }
//        }
//
//        return temp.popLast()!
//    }
    
    // 배열을 정렬한 후 인덱스를 하나 씩 건너뛰어서 속도를 반으로 줄임
    public func solution(_ A : inout [Int]) -> Int {
        let temp = A.sorted()
        let count = A.count
        var i = 0
        if A.count == 1 {
            return A[0]
        }
    
        while i < count {
            let index1 = i
            let index2 = i + 1
            
            if i == count - 1 {
                return temp[index1]
            }
            
            if temp[index1] != temp[index2] {
                return temp[index1]
            }
            
            i += 2
        }
        
        return 0
    }
}


class OddOccurrencesInArray_Tests: XCTestCase {
    private struct TestCase {
        var A: [Int]
        let output: Int
    }
    
    private var sut: OddOccurrencesInArray!
    private var testCase: TestCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = OddOccurrencesInArray()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        testCase = nil
        try super.tearDownWithError()
    }
    
    func testCase1() {
        // 1. given
        testCase = TestCase(A: [9, 3, 9, 3, 9, 7, 9],
                            output: 7)
        // 2. when
        let output = sut.solution(&testCase.A)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
    
    func testCase2() {
        // 1. given
        testCase = TestCase(A: [2, 2, 3, 3, 4],
                            output: 4)
        // 2. when
        let output = sut.solution(&testCase.A)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
    
}
