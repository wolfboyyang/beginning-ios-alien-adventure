//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        let itemArray = NSArray(contentsOfURL: dataFileURL)!
        var bannedItemIDs = [Int]()
        
        for item in itemArray {
            // check Name if contains "Laser"
            if let name = item["Name"] as? String where name.containsString("Laser") {
                // read the HistoricalData
                if let historicalData = item["HistoricalData"] as? [String:AnyObject] {
                    // chek the CarbonAge if < 30
                    if let age = historicalData["CarbonAge"] as? Int
                        where age < 30 {
                        // it is a banned item
                        if let itemID = item["ItemID"] as? Int {
                            bannedItemIDs.append(itemID)
                        }
                        
                    }
                }
                
            }
        }
        
        return bannedItemIDs
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"