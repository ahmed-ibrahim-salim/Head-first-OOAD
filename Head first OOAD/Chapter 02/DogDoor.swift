//
//  DogDoor.swift
//  Head first OOAD
//
//  Created by magdy khalifa on 11/09/2022.
//

import Foundation


class DogDoor {
    private var open: Bool
    
    init() {
        self.open = false
    }
    
    func openTheDoor(withDelay delay: Double = 5.0) {
        
        self.open = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay){
            self.close()
        }
    }
    
    func close() {
        self.open = false
        
    }
    func isOpen() -> Bool{
        return self.open
    }
}
