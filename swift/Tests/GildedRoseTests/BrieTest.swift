//
//  BrieTest.swift
//  GildedRoseTests
//
//  Created by matthew hermans on 27/01/2022.
//
@testable import GildedRose
import XCTest

class Test: XCTestCase {
    func testBrie() throws {
        let items = [Item(name: "Aged Brie", sellIn: 0, quality: 0), Item(name: "Aged Brie", sellIn: -1, quality: 50), Item(name: "Aged Brie", sellIn: 2, quality: 18)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality , 1)
        XCTAssertEqual(app.items[1].quality, 50)
        XCTAssertEqual(app.items[2].quality, 19)
    }
    
    func testConjuredItems() throws {
        let items = [Item(name: "Conjured Mana Cake", sellIn: 3, quality: 5), Item(name: "Conjured Mana Cake", sellIn: 3, quality: 0)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 3)
        XCTAssertEqual(app.items[1].quality, 0)
    }
    
    func testSulfuras() throws {
        let items = [Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 3, quality: 80)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 80)
    }
    
    func testBackStagePasses() throws {
        let items = [Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 6, quality: 20), Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 3, quality: 20), Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: -1, quality: 20)]
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].quality, 22)
        XCTAssertEqual(app.items[1].quality, 23)
        XCTAssertEqual(app.items[2].quality, 0)
    }
}
