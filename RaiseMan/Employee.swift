//
//  Employee.swift
//  RaiseMan
//
//  Created by joecaz on 6/10/17.
//  Copyright © 2017 Coyote Creek Software. All rights reserved.
//

import Foundation

class Employee: NSObject {
    var name: String? = "New Employee"
    var raise: Float = 0.05
    
    override func validateValue(_ ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKey inKey: String) throws {
        print ("Entered validation function")
        
        let raiseNumber = ioValue.pointee // "memory" is now "pointee" in Swift 3
        if inKey == "raise" && raiseNumber == nil {
            let domain = "UserInputValidationErrorDomain"
            let code = 0
            let userInfo = [NSLocalizedDescriptionKey : "An employee's raise must be a number."]
            throw NSError(domain: domain, code: code, userInfo: userInfo)
        }
    }
}
