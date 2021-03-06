//
// Copyright (c) 2016 Hilton Campbell
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import XCTest
import Swiftification

private struct TestObject {
    
    let name: String
    let type: Int
    
}

class ArrayTests: XCTestCase {
    
    func testSafe() {
        let array: [Int] = [1, 2, 3]
        XCTAssertNil(array[safe: -1])
        XCTAssertEqual(array[safe: 0], array[0])
        XCTAssertEqual(array[safe: 1], array[1])
        XCTAssertEqual(array[safe: 2], array[2])
        XCTAssertNil(array[safe: 3])
    }
    
    func testRandom() {
        let array = Array(1...10)
        for _ in 0...500 {
            let random = array.random()
            XCTAssertTrue(random <= 10 && random >= 1)
        }
    }
    
    func testFind() {
        let array = Array(1...10)
        XCTAssertNotNil(array.find { $0 == 2 })
        XCTAssertNil(array.find { $0 == 15 })
    }
    
    func testShuffle() {
        let array = Array(1...1000)
        let shuffledArray = array.shuffle()
        XCTAssertNotEqual(shuffledArray, array)
        XCTAssertEqual(shuffledArray.sort(), array)
    }
    
    func testShuffleInPlace() {
        var array = Array(1...1000)
        array.shuffleInPlace()
        XCTAssertTrue(array != Array(1...1000))
    }
    
    func testGroupBy() {
        let array = [TestObject(name: "Test", type: 0), TestObject(name: "Test1", type: 0), TestObject(name: "Test2", type: 0), TestObject(name: "Test3", type: 1)]
        let grouped = array.groupBy { $0.type }
        XCTAssertTrue(grouped[0]?.count == 3)
        XCTAssertTrue(grouped[1]?.count == 1)
    }
    
    func testSectionBy() {
        let array = [TestObject(name: "Test", type: 0), TestObject(name: "Test", type: 0), TestObject(name: "Test2", type: 0), TestObject(name: "Test2", type: 1), TestObject(name: "Test2", type: 1)]
        let sectioned = array.sectionBy { $0.name }
        XCTAssertTrue(sectioned[0].title == "Test")
        XCTAssertTrue(sectioned[0].items.count == 2)
        XCTAssertTrue(sectioned[1].title == "Test2")
        XCTAssertTrue(sectioned[1].items.count == 3)
    }
    
    func testTail1() {
        let array = Array(1...10)
        XCTAssertTrue(array.tail(1) == [10])
        XCTAssertTrue(array.tail(3) == [8, 9, 10])
    }

    func testTail2() {
        let array = [1, 2]
        XCTAssertTrue(array.tail(10) == [1, 2])
    }
    
    func testShift() {
        var array = Array(1...10)
        let expected = Array(2...10)
        XCTAssertEqual(array.shift(), 1)
        XCTAssertEqual(array, expected)
    }
    
    func testShiftEmptyArray() {
        var array = Array<Int>()
        XCTAssertNil(array.shift())
        XCTAssertEqual(array, [])
    }
    
    func testTake1() {
        let array = Array(1...10)
        XCTAssertEqual(array.take(5), Array(1...5))
    }
    
    func testTake2() {
        let array = [1, 2]
        XCTAssertEqual(array.take(10), [1, 2])
    }
        
}
