//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        
        let planetDataJSONURL = NSBundle.mainBundle().URLForResource("PlanetData", withExtension: "json")!
        let rawPlanetDataJSON = NSData(contentsOfURL: planetDataJSONURL)!
        
        var planetDataArrayFromJSON: NSArray!
        do {
            planetDataArrayFromJSON = try! NSJSONSerialization.JSONObjectWithData(rawPlanetDataJSON, options: NSJSONReadingOptions()) as! NSArray
        }
        
        var planetPoint = -1
        var planet = ""
        if let planetDataDArrayFromJSON = planetDataArrayFromJSON{
            for planetData in planetDataDArrayFromJSON {
                
                var points = planetData["CommonItemsDetected"] as! Int
                points += planetData["UncommonItemsDetected"]! as! Int * 2
                points += planetData["RareItemsDetected"]! as! Int * 3
                points += planetData["LegendaryItemsDetected"] as! Int * 4
                    
                if points > planetPoint {
                    planetPoint = points
                    planet = planetData["Name"] as! String
                }
            }
        }
        return planet
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"