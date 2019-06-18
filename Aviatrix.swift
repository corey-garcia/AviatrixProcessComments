//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    
    //added in Iteration 0
    var running : Bool
    var author : String
    
    //added in Iteration 2
    var totalDistance : Int
    var maxFuel : Int
    var milesPerGallon : Double
    var fuelCost: Double
    var fuelLevel: Int
    
    //added in Iteration 1
    var currentLocation : String
    
    
    
    func start() -> Bool {
        //added in Iteration 0
        running = false
        return running
    }
    
    func refuel() -> Double {
        //added in Iteration 2
        var refuelAmount = maxFuel - fuelLevel
        var data = AviatrixData() //not clear, must be able to access fuel prices
        var fuelPrices = data.fuelPrices
        var cityFuelCost = fuelPrices[currentLocation] //reach into price array, pull out the price for our current city
        var totalCost = Double(refuelAmount) * cityFuelCost! //force RA to be Double, unwrap cityFuelCost -> Major trouble!
        fuelCost = fuelCost + totalCost
        return totalCost
    }
    
    //added in Iteration 1
    func flyTo(destination : String) {
        //Added in Iteration 2; common mistake: this must be BEFORE we update currentLocation
        var distanceTravelled = distanceTo(from: currentLocation, target: destination)
        //Iteration 1
        currentLocation = destination
        
        //Added in Iteration 2
        totalDistance = totalDistance + distanceTravelled
        var fuelUsed = milesPerGallon * Double(distanceTravelled)//force this to be a double; not apparent
        fuelLevel = fuelLevel - Int(fuelUsed) //force this to be an Int; not apparent

    }
    
    //added in Iteration 1
    //added the return Int (not clear in directions) to this
    func distanceTo(from: String, target : String) -> Int {
        //line of code on 33 is super confusing and not at all apparent from the directions, but you have to create a new object of Aviatrix Data in order to be able to access the data there, and to be able to use the knownDistances function
        var data = AviatrixData()
        var from = currentLocation
        var distance = data.knownDistances[from]![target]!
        return distance
    }
    
    //added in Iteration 1
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
    
    //added in Iteration 0
    init(authorName: String) {
        author = authorName
        running = false
        //added in Iteration 1; it defaults to St. Louis
        currentLocation = "St. Louis"
        //added in Iteration 2
        totalDistance = 0
        maxFuel = 5000
        fuelLevel = 5000
        milesPerGallon = 0.4
        fuelCost = 0
    }
}
