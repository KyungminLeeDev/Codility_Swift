//
//  CyclicRotation.swift
//  Codility_Swift
//
//  Created by Kyungmin Lee on 2021/10/31.
//

import Foundation
import XCTest

/// Lesson 2 -
/// Arrays -
/// [CyclicRotation](https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/)
/// - Score: 100%
/// - Task Score: 100%
/// - Correctness: 100%
struct CyclicRotation {
    public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
        guard A.isEmpty == false else {
            return A
        }
        guard K > 0 else {
            return A
        }
        
        for _ in 0..<K {
            let last = A.removeLast()
            A.insert(last, at: 0)
        }
        
        return A
    }
}

class CyclicRotation_Tests: XCTestCase {
    private struct TestCase {
        var A: [Int]
        let K: Int
        let output: [Int]
    }
    
    private var sut: CyclicRotation!
    private var testCase: TestCase!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CyclicRotation()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        testCase = nil
        try super.tearDownWithError()
    }
    
    func testCase1() {
        // 1. given
        testCase = TestCase(A: [3, 8, 9, 7, 6],
                            K: 3,
                            output: [9, 7, 6, 3, 8])
        
        // 2. when
        let output = sut.solution(&testCase.A, testCase.K)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
    
    func testCase2() {
        // 1. given
        testCase = TestCase(A: [0, 0, 0],
                            K: 1,
                            output: [0, 0, 0])
        
        // 2. when
        let output = sut.solution(&testCase.A, testCase.K)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
    
    func testCase3() {
        // 1. given
        testCase = TestCase(A: [1, 2, 3, 4],
                            K: 4,
                            output: [1, 2, 3, 4])
        
        // 2. when
        let output = sut.solution(&testCase.A, testCase.K)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
    
    func testCase4_EmptyArray() {
        // 1. given
        testCase = TestCase(A: [],
                            K: 4,
                            output: [])
        
        // 2. when
        let output = sut.solution(&testCase.A, testCase.K)
        
        // 3. then
        XCTAssertEqual(output, testCase.output)
    }
}
