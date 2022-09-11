//
//  Inventory.swift
//  Head first OOAD
//
//  Created by magdy khalifa on 11/09/2022.
//

import Foundation

class Inventory{
    var guitars: [Guitar]
    
    init(){
        self.guitars = []
    }
    
    func addGuitar(_ serialNumber: String,_ price: Double,_ guitarSpecs: GuitarSpecs) {
        let guitar = Guitar(serialNumber, price, guitarSpecs)
        guitars.append(guitar)
    }
    
    func getGuitar(serialNumber: String)-> Guitar? {
        for guitar in guitars where guitar.getSerialNumber() == serialNumber{
            return guitar
        }
        return nil
    }
    
    func search(guitarSpecs: GuitarSpecs)-> [Guitar]?{
        var foundGuitars = [Guitar]()
        for guitar in guitars{
            if !guitarSpecs.matches(guitar.getGuitarSpecs()){ continue }
            foundGuitars.append(guitar)
        }
        if foundGuitars.isEmpty{
            return nil
        }
        return foundGuitars
    }
}
