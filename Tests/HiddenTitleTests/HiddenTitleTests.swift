import XCTest
import SwiftUI
@testable import HiddenTitle

final class HiddenTitleTests: XCTestCase {
    func testModifierCompilesAndApplies() throws {
        // Confirm it compiles and can be applied without crashing for both true and false
        let viewWithHiddenTitle = Text("Hello World")
            .navigationTitle("Main Screen")
            .toolbarTitleHidden(true)
        
        let viewWithVisibleTitle = Text("Hello World")
            .navigationTitle("Main Screen")
            .toolbarTitleHidden(false)
        
        XCTAssertNotNil(viewWithHiddenTitle)
        XCTAssertNotNil(viewWithVisibleTitle)
    }
}
