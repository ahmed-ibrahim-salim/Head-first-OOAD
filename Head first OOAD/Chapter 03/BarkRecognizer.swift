//
//  BarkRecognizer.swift
//  Head first OOAD
//
//  Created by magdy khalifa on 12/09/2022.
//

import Foundation

class BarkRecognizer {
    
    var dogDoor: DogDoor
    var barking: Bool
    
    init(){
        self.dogDoor = DogDoor()
        self.barking = false
    }
    
    func recognize(withDelay delay: Double){
        barking ? dogDoor.openTheDoor(withDelay: delay) : print("Not barking")
    }
}
