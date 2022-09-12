//
//  Chapter03Tests.swift
//  Head first OOADTests
//
//  Created by magdy khalifa on 12/09/2022.
//

import XCTest
@testable import Head_first_OOAD

class Chapter03Tests: XCTestCase {
    var dogDoor: DogDoor!
    var sut: BarkRecognizer!
    
    override func setUpWithError() throws {
        dogDoor = DogDoor()
        sut = BarkRecognizer()
        sut.dogDoor = dogDoor
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_Recognize_DogIsBarking_OpensDoorThenCloseAfterTime() {
        
        // given
        let expectation = expectation(description: "Door close")
        let expectatedTime = 0.001
        
        XCTAssertFalse(sut.barking)
       
        
        //when
        sut.barking = true
        sut.recognize(withDelay: expectatedTime)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + expectatedTime){
            expectation.fulfill()
        }
        
        //then
        XCTAssertTrue(sut.dogDoor.isOpen())
        waitForExpectations(timeout: expectatedTime + 0.001)
        XCTAssertFalse(sut.dogDoor.isOpen())
    }
    
}
