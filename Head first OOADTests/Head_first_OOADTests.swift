//
//  Head_first_OOADTests.swift
//  Head first OOADTests
//
//  Created by magdy khalifa on 08/09/2022.
//

import XCTest
@testable import Head_first_OOAD

class Head_first_OOADTests: XCTestCase {
    var inventory: Inventory!
    
    override func setUpWithError() throws {
        inventory = Inventory()
    }
    
    override func tearDownWithError() throws {}
    
    func test_findGuitar_returnsGuitar(){
        inventory.addGuitar( "V9512", 1549.95, .FENDER, "Stratocastor", .ELECTRIC, .ALDER, .ALDER)
        
        inventory.addGuitar("V95693", 1499.95, .FENDER, "Stratocastor", .ELECTRIC, .ALDER, .ALDER)
        
        let whatErinLikes =  Guitar("", 0, Builder.FENDER, "Stratocastor", Types.ELECTRIC, Wood.ALDER, Wood.ALDER)
        
        let searchedGuitar = inventory.search(searchGuitar: whatErinLikes)
        
        XCTAssertEqual(searchedGuitar?[0].getBuilder(), Builder.FENDER.rawValue)
        XCTAssertEqual(searchedGuitar?[1].getBuilder(), Builder.FENDER.rawValue)
    }
    
}
