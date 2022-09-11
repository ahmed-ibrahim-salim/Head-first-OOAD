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
        // given
        let guitarSpecs = GuitarSpecs(.FENDER, "Stratocastor", .ELECTRIC, .ALDER, .ALDER)
        inventory.addGuitar( "V9512", 1549.95, guitarSpecs)
        
        inventory.addGuitar("V95693", 1499.95, guitarSpecs)
        
        let whatErinLikes = GuitarSpecs(.FENDER, "Stratocastor", .ELECTRIC, .ALDER, .ALDER)
        
        // when
        let searchedGuitar = inventory.search(guitarSpecs: whatErinLikes)
        XCTAssertEqual(2, inventory.guitars.count)
        
        // then
        XCTAssertEqual(searchedGuitar?[0].getGuitarSpecs().getBuilder(), Builder.FENDER.rawValue)
        XCTAssertEqual(searchedGuitar?[1].getGuitarSpecs().getBuilder(), Builder.FENDER.rawValue)
    }
    
}
