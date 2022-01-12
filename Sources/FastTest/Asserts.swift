import XCTest

/// Assert string contains another string, false if any values are nil
/// - Parameters:
///   - str: string to search
///   - contains: string to search for
public func XCTAssertContains(_ string: String?, _ contains: String?, file: StaticString = #file, line: UInt = #line) {
    switch (string, contains) {
    case (.some(let string), .some(let contains)):
        XCTAssert(string.contains(contains), "\(string) did not contain \(contains)", file: file, line: line)
    case (.some(let string), .none):
        XCTFail("\(string) did not contain nil", file: file, line: line)
    case (.none, .some(let contains)):
        XCTFail("nil did not contain \(contains)", file: file, line: line)
    case (.none, .none):
        XCTFail("Found nil for both arguments", file: file, line: line)
    }
}
