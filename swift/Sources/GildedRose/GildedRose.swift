import CoreFoundation
import Foundation
public class GildedRose {
    static var agedBrie = "Aged Brie"  // added static strings for security reasons and for code readabilty
    static var sulfuras = "Sulfuras, Hand of Ragnaros"
    static var backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static var ConjuredItem = "Conjured"
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            let decayRate = item.name.contains(GildedRose.ConjuredItem) ? -2 : -1 // feature proof for when multiple diffrent conjured items are added
            if item.name != GildedRose.agedBrie && item.name != GildedRose.backstagePasses {
                if item.name != GildedRose.sulfuras {
                    updateQualityitem(item: item, adjustment: decayRate)
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
                            updateQualityitem(item: item, adjustment: decayRate)
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
