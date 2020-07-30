import XCTest
@testable import SearchKit

final class SearchKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SearchKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
