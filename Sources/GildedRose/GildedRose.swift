public class GildedRose {
    var items: [Item]

    public init(items: [Item]) {
        self.items = items
    }

    public func updateQuality() {
        for item in items {
            updateItemQuality(item)
        }
    }

    private func updateItemQuality(_ item: Item) {
        switch item.name {
        case "Sulfuras, Hand of Ragnaros":
            break
        case "Aged Brie":
            updateAgedBrie(item)
        case "Backstage passes to a TAFKAL80ETC concert":
            updateBackstagePasses(item)
        default:
            updateRegularItem(item)
        }
    }

    private func updateAgedBrie(_ item: Item) {
        item.sellIn -= 1
        
        if item.quality < 50 {
            item.quality += 1
        }
        
        if item.sellIn < 0 && item.quality < 50 {
            item.quality += 1
        }
    }

    private func updateBackstagePasses(_ item: Item) {
        item.sellIn -= 1
        
        if item.quality < 50 {
            item.quality += 1
            if item.sellIn < 11 && item.quality < 50 {
                item.quality += 1
            }
            if item.sellIn < 6 && item.quality < 50 {
                item.quality += 1
            }
        }

        if item.sellIn < 0 {
            item.quality = 0
        }
    }

    private func updateRegularItem(_ item: Item) {
        item.sellIn -= 1
        
        if item.quality > 0 {
            item.quality -= 1
        }
        
        if item.sellIn < 0 && item.quality > 0 {
            item.quality -= 1
        }
    }
}
