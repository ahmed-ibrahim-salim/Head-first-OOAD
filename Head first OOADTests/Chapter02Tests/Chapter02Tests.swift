//
//  Chapter02Tests.swift
//  Head first OOADTests
//
//  Created by magdy khalifa on 11/09/2022.
//

import XCTest
@testable import Head_first_OOAD

class Chapter02Tests: XCTestCase {
    var dogDoor: DogDoor!
    var remote: Remote!

    override func setUpWithError() throws {
        dogDoor = DogDoor()
        remote = Remote(door: dogDoor)
    }

    override func tearDownWithError() throws {
        
    }

    func test_CloseDoor_ClosesDoor(){
        // given
        XCTAssertFalse(remote.isDoorOpen())
        remote.pressButton()
        XCTAssertTrue(remote.isDoorOpen())
        
        // when
        remote.pressButton()
        
        // then
        XCTAssertFalse(remote.isDoorOpen())
    }
    func test_OpenDoor_OpensDoorThenCloseAfterTime(){
        // given
        XCTAssertFalse(remote.isDoorOpen())
        let expectation = expectation(description: "Close Door")
        let expectedTime = 0.001
        
        // when
        remote.pressButton(expectedTime)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + expectedTime){
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: expectedTime + 0.001)
        
        // then
        XCTAssertFalse(remote.isDoorOpen())
    }

}
