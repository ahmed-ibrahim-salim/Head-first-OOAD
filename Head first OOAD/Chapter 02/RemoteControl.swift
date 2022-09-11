//
//  RemoteControl.swift
//  Head first OOAD
//
//  Created by magdy khalifa on 11/09/2022.
//

import Foundation


class Remote {
    private var dogDoor: DogDoor
    
    init(door: DogDoor) {
        self.dogDoor = door;
    }
    
    func pressButton(_ delay: Double = 5.0) {
        if dogDoor.isOpen() {
            dogDoor.close()
        }else{
            dogDoor.openTheDoor(withDelay: delay)
        }
    }
    func isDoorOpen()-> Bool{
        return dogDoor.isOpen()
    }
}
