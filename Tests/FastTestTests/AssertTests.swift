    import XCTest
    @testable import FastTest

    final class AssertTests: XCTestCase {
        func testAssertContains() {
            XCTAssertContains("a string", "str")

            let option = XCTExpectedFailure.Options()
            
            option.issueMatcher = { $0.description.contains("foo did not contain bar") }
            XCTExpectFailure("foo did not contain bar", options: option)
            XCTAssertContains("foo", "bar")
            
            option.issueMatcher = { $0.description.contains("foo did not contain nil") }
            XCTExpectFailure("foo did not contain nil", options: option)
            XCTAssertContains("foo", nil)
            
            option.issueMatcher = { $0.description.contains("nil did not contain bar") }
            XCTExpectFailure("nil did not contain bar", options: option)
            XCTAssertContains(nil, "bar")
            
            option.issueMatcher = { $0.description.contains("Found nil for both arguments") }
            XCTExpectFailure("Found nil for both arguments", options: option)
            XCTAssertContains(nil, nil)
        }
    }
