@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    func testQualityDegradesTwiceAsFastAfterSellByDate() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 0, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 8)
    }
    
    func testQualityNeverNegative() {
        let item = Item(name: "+5 Dexterity Vest", sellIn: 5, quality: 0)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 0)
    }
    
    func testAgedBrieQualityIncrease() {
        let item = Item(name: "Aged Brie", sellIn: 5, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 11)
    }
    
    func testQualityNeverMoreThan50() {
        let item = Item(name: "Aged Brie", sellIn: 5, quality: 50)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 50)
    }

    func testSulfurasNeverChanges() {
        let item = Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.sellIn, 0)
        XCTAssertEqual(item.quality, 80)
    }
    
    func testBackstagePassesQualityIncreaseBy2() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 12)
    }
    
    func testBackstagePassesQualityIncreaseBy3() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 10)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 13)
    }
    
    func testBackstagePassesQualityDropsToZero() {
        let item = Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 0, quality: 50)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 0)
    }
    
    func testConjuredItemQualityDrop() {
        let item = Item(name: "Conjured Mana Cake", sellIn: 7, quality: 4)
        let app = GildedRose(items: [item])
        app.updateQuality()
        XCTAssertEqual(item.quality, 2)
    }
}

