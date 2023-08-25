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
            if containsConjured(item.name) {
                updateConjuredItem(item)
            } else {
                updateRegularItem(item)
            }
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
    
    private func updateConjuredItem(_ item: Item) {
        let degradeAmount = 2
        if item.quality > degradeAmount {
            item.quality -= degradeAmount
        } else {
            item.quality = 0
        }
        item.sellIn -= 1
    }
    
    private func containsConjured(_ name: String) -> Bool {
        let target = "Conjured"
        for i in 0..<(name.count - target.count + 1) {
            let startIndex = name.index(name.startIndex, offsetBy: i)
            let endIndex = name.index(startIndex, offsetBy: target.count)
            if String(name[startIndex..<endIndex]) == target {
                return true
            }
        }
        return false
    }
}
