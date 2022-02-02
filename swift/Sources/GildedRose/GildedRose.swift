import CoreFoundation
import Foundation
public class GildedRose {
    static var agedBrie = "Aged Brie"  // added static strings for security reasons and for code readabilty
    static var sulfuras = "Sulfuras, Hand of Ragnaros"
    static var backstagePasses = "Backstage passes to a TAFKAL80ETC concert"
    static var ConjuredItem = "Conjured"
    static var itemsThatDontDecay = [GildedRose.agedBrie, GildedRose.backstagePasses, GildedRose.sulfuras]
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            let decayRate = item.name.contains(GildedRose.ConjuredItem) ? -2 : -1 // feature proof for when multiple diffrent conjured items are added
            // if all conjured items are in a array then you can use this code GildedRose.Conjureditems.contains(item.name)
            let doesDecay = !GildedRose.itemsThatDontDecay.contains(item.name)
            
            if doesDecay { updateQualityitem(item: item, adjustment: decayRate) }
            if item.name == GildedRose.agedBrie { updateQualityitem(item: item, adjustment: 1) }
            
            let qualityIncrease = item.sellIn < 6 ? 3 : item.sellIn < 11 ? 2 : 1  // if sell in date is smaller then 6 then add 3 if not but its smaller then 11 then add 2 if not add 1
            if item.name == GildedRose.backstagePasses { updateQualityitem(item: item, adjustment: qualityIncrease) }
            
            if item.name != GildedRose.sulfuras { item.sellIn -= 1 }
            
            if item.sellIn < 0 { handleExpireditems(item: item, doesDecay: doesDecay, decayRate: decayRate) }
        }
    }
    
    // less nested if statements
    // adjusting the quality was typed manualy everytime
    // did this because if you split this function in mulitple functions you will have mulitple diffrent functions in updateQuality() sow it will be nested again in my opinion.
    fileprivate func updateQualityitem(item: Item, adjustment: Int) {
        let newQuality = item.quality + adjustment
        if newQuality <= 50 && newQuality >= 0 {
            item.quality = newQuality
        }
    }
    
    fileprivate func handleExpireditems(item: Item, doesDecay: Bool, decayRate: Int) {
        if doesDecay {
            updateQualityitem(item: item, adjustment: decayRate)
            // if sellin < 0 then the quality gets decreased for a second time.
        } else if item.name != GildedRose.agedBrie && item.name == GildedRose.backstagePasses{
            item.quality -= item.quality
        }
    }
}
