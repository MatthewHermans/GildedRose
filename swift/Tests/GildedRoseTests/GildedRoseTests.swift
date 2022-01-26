@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {

    func testFoo() throws {
        let items = [Item(name: "foo", sellIn: 0, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }
    
    func AgedBrieIncreasesInQuality() {
        let items = [Item(name: "Aged Brie", sellIn: 2, quality: 2)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "Aged Brie")
    }
    
    func AgedBrieIncreasesDoubleInQualityWhenOff() {
        let items = [Item(name: "Aged Brie", sellIn: -1, quality: 4)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "Aged Brie")
    }
}
