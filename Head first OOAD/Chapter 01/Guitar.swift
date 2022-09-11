//
//  Guitars.swift
//  Head first OOAD
//
//  Created by magdy khalifa on 08/09/2022.
//

import Foundation

enum Builder: String {
    case FENDER, MARTIN, GIBSON, COLLINGS, OLSON, RYAN, PRS, ANY
}

enum GuitarType: String {
    case ACOUSTIC, ELECTRIC;
}

enum Wood: String {
    case INDIAN_ROSEWOOD, BRAZILIAN_ROSEWOOD, MAHOGANY, MAPLE,
         COCOBOLO, CEDAR, ADIRONDACK, ALDER, SITKA;
}

class GuitarSpecs{
    private var builder : Builder;
    private var model : String;
    private var guitarType : GuitarType;
    private var backWood : Wood;
    private var topWood : Wood;
    
    init(_ builder : Builder, _ model : String, _ guitarType : GuitarType, _ backWood : Wood, _ topWood : Wood){
        
        self.builder = builder
        self.model = model
        self.guitarType = guitarType
        self.backWood = backWood
        self.topWood = topWood
    }
    
    func getBuilder() -> String?{
        return self.builder.rawValue;
    }
    func getModel() -> String?{
        return self.model;
    }
    func getGuitarType() -> String?{
        return self.guitarType.rawValue;
    }
    func getBackWood() -> String?{
        return self.backWood.rawValue;
    }
    func getTopWood() -> String?{
        return self.topWood.rawValue;
    }
    
    func matches(_ otherSpecs: GuitarSpecs) -> Bool{
        if otherSpecs.getBuilder() != self.getBuilder(){
            return false
        }
        if otherSpecs.getModel() != nil && otherSpecs.getModel() != "" && otherSpecs.getModel()?.lowercased() != self.getModel()?.lowercased(){
            return false
        }
//
        if otherSpecs.getGuitarType() != self.getGuitarType(){
            return false
        }
//
        if otherSpecs.getTopWood() != self.getTopWood(){
            return false
        }
        if otherSpecs.getBackWood() != self.getBackWood(){
            return false
        }
        return true
    }
}

class Guitar{
    private var serialNumber: String
    private var price: Double
    private var guitarSpecs: GuitarSpecs
    
    init(_ serialNumber : String, _ price : Double, _ guitarSpecs: GuitarSpecs){
        self.serialNumber = serialNumber;
        self.price = price;
        self.guitarSpecs = guitarSpecs
    }
    func getSerialNumber() -> String?{
        return self.serialNumber;
    }

    func getPrice() -> Double{
        return self.price;
    }
    
    func getGuitarSpecs() -> GuitarSpecs{
        return guitarSpecs
    }
}



