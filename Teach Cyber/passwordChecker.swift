//
//  passwordChecker.swift
//  Teach Cyber
//
//  Created by Keira Wong on 7/24/22.
//

import Foundation
import SwiftUI

struct passwordChecker: View {
    @State var password : String = ""
    @State var passwordStrength : Int = 0
    
    func checkStrength(_ password: String) -> Int {
        let passwordLength = password.count
        var containsSymbol = false
        var containsUppercase = false

        for character in password {
            if "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(character) {
                containsUppercase = true
            }
            
            if "!£$%&/()=?^;:_ç°§*,.-_".contains(character) {
                containsSymbol = true
            }
        }
        
        if passwordLength > 8 && containsSymbol && containsUppercase {
            return 1
        } else {
            return 0
        }
    }
    
    var body: some View {
        VStack {
            Text("How strong is your password?")
                .padding()
            
            TextField("Enter your password:", text: $password).textFieldStyle(.roundedBorder)
                .frame(width: 250)
            
            HStack {
                if checkStrength(password) == 0  {
                    Text("Weak").foregroundColor(Color.red)
                        .font(.system(size: 30.0)).padding()
                } else {
                    Text("Strong").foregroundColor(Color.green)
                        .font(.system(size: 30.0)).padding()
                }
            }
        }
    }
}

struct passwordCheck_Previews: PreviewProvider {
    static var previews: some View {
        passwordChecker()
    }
}
