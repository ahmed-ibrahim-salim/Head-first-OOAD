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

enum Types: String {
    case ACOUSTIC, ELECTRIC;
}

enum Wood: String {
    case INDIAN_ROSEWOOD, BRAZILIAN_ROSEWOOD, MAHOGANY, MAPLE,
         COCOBOLO, CEDAR, ADIRONDACK, ALDER, SITKA;
}

class Inventory{
    var guitars: [Guitar]
    
    init(){
        self.guitars = []
    }
    
    func addGuitar(_ serialNumber: String,_ price: Double, _ builder: Builder, _ model: String,_ Types: Types,_ backWood: Wood,_ topWood: Wood) {
        let guitar = Guitar(serialNumber, price, builder,
                            model, Types, backWood, topWood)
        guitars.append(guitar)
    }
    
    func getGuitar(serialNumber: String)-> Guitar? {
        for guitar in guitars where guitar.getSerialNumber() == serialNumber{
            return guitar
        }
        return nil
    }
    func search(searchGuitar: Guitar)-> [Guitar]?{
        var foundGuitars = [Guitar]()
        for guitar in guitars{
            let builder = searchGuitar.getBuilder()
            if builder != nil && builder != "" && guitar.getBuilder() != builder{
                continue
            }
            let model = searchGuitar.getModel()?.lowercased()
            if model != nil && model != "" && guitar.getModel()?.lowercased() != model{
                continue
            }
            let Types = searchGuitar.getTypes()
            if Types != nil && Types != "" && guitar.getTypes() != Types{
                continue
            }
            let topWood = searchGuitar.getTopWood()
            if topWood != nil && topWood != "" && guitar.getTopWood() != topWood{
                continue
            }
            let backWood = searchGuitar.getBackWood()
            if backWood != nil && backWood != "" && guitar.getBackWood() != backWood{
                continue
            }
            foundGuitars.append(guitar)
        }
        if foundGuitars.isEmpty{
            return nil
        }
        return foundGuitars
    }
}

class Guitar{
    private var serialNumber : String;
    private var builder : Builder;
    private var model : String;
    private var Types : Types;
    private var backWood : Wood;
    private var topWood : Wood;
    private var price : Double;
    
    init(_ serialNumber : String, _ price : Double, _ builder : Builder, _ model : String, _ Types : Types, _ backWood : Wood, _ topWood : Wood){
        self.serialNumber = serialNumber;
        self.price = price;
        self.builder = builder;
        self.model = model;
        self.Types = Types;
        self.backWood = backWood;
        self.topWood = topWood;
    }
    
    func getSerialNumber() -> String?{
        return self.serialNumber;
    }
    func getBuilder() -> String?{
        return self.builder.rawValue;
    }
    func getModel() -> String?{
        return self.model;
    }
    func getTypes() -> String?{
        return self.Types.rawValue;
    }
    func getBackWood() -> String?{
        return self.backWood.rawValue;
    }
    func getTopWood() -> String?{
        return self.topWood.rawValue;
    }
    func getPrice() -> Double{
        return self.price;
    }
}



