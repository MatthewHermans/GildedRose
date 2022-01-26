import CoreFoundation
public class GildedRose {
    static var agedBrie = "Aged Brie"  // added static strings for security reasons and for code readabilty
    static var sulfuras = "Sulfuras, Hand of Ragnaros"
    static var backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            if item.name != GildedRose.agedBrie && item.name != GildedRose.backstagePasses {
                if item.name != GildedRose.sulfuras {
                    updateQualityitem(item: item, adjustment: -1)
                }
            } else {
                updateQualityitem(item: item, adjustment: 1)
                
                if item.name == GildedRose.backstagePasses {
                    if item.sellIn < 11 {
                        updateQualityitem(item: item, adjustment: 1)
                    }
                    if item.sellIn < 6 {
                        updateQualityitem(item: item, adjustment: 1)
                    }
                }
            }
            
            if item.name != GildedRose.sulfuras {
                item.sellIn -= 1
            }
            
            if item.sellIn < 0 {
                if item.name != GildedRose.agedBrie {
                    if item.name != GildedRose.backstagePasses {
                        if item.name != GildedRose.sulfuras {
                            updateQualityitem(item: item, adjustment: -1)
                        }
                        
                    } else {
                        item.quality -= item.quality
                    }
                } else {
                    updateQualityitem(item: item, adjustment: 1)
                }
            }
        }
    }
    
    // less nested if statements
    // adjusting the quality was typed manualy everytime
    fileprivate func updateQualityitem(item: Item, adjustment: Int) {
        let newQuality = item.quality + adjustment
        if newQuality <= 50 && newQuality >= 0 {
            item.quality = newQuality
        }
    }
}
