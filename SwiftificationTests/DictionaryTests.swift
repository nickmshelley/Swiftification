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

class DictionaryTests: XCTestCase {
    
    func testInit() {
        let array = [(1, 2), (3, 4)]
        let expected = [1: 2, 3: 4]
        let actual = [Int: Int](array)
        XCTAssertEqual(expected, actual)
    }
    
    func testUnion1() {
        let dict1 = [1: 1, 2: 2, 3: 3]
        let dict2 = [1: 4]
        let expected = [1: 4, 2: 2, 3: 3]
        let actual = dict1.union(dict2)
        XCTAssertEqual(expected, actual)
    }
    
    func testUnion2() {
        let dict1 = [1: 2]
        let dict2 = [3: 4]
        let expected = [1: 2, 3: 4]
        let actual = dict1.union(dict2)
        XCTAssertEqual(expected, actual)
    }
    
    func testUnionOperator1() {
        let dict1 = [1: 1, 2: 2, 3: 3]
        let dict2 = [1: 4]
        let expected = [1: 4, 2: 2, 3: 3]
        let actual = dict1 | dict2
        XCTAssertEqual(expected, actual)
    }
    
    func testUnionOperator2() {
        let dict1 = [1: 2]
        let dict2 = [3: 4]
        let expected = [1: 2, 3: 4]
        let actual = dict1 | dict2
        XCTAssertEqual(expected, actual)
    }
    
    func testMapValues() {
        let dictionary = ["lowercase": ["c", "a", "b"], "uppercase": ["A", "C", "B"]]
        let sortedDictionary = dictionary.mapValues { $1.sort(<) }
        XCTAssertEqual(sortedDictionary["lowercase"]!, ["a", "b", "c"])
        XCTAssertEqual(sortedDictionary["uppercase"]!, ["A", "B", "C"])
    }
    
    func testToArray() {
        let dictionary = [1: 2, 3: 4, 5: 6, 7: 8]
        let expected = ["1=2", "3=4", "5=6", "7=8"]
        let actual = dictionary.toArray { "\($0)=\($1)" }
        actual.forEach { XCTAssertTrue(expected.contains($0)) }
        expected.forEach { XCTAssertTrue(actual.contains($0)) }
    }
    
}
