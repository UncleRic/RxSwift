//
//  LoginViewModel.swift
//  LoginValidation
//
//  Created by Frederick C. Lee on 10/4/17.
//  Copyright © 2017 Amourine Technologies. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel {
    // Rx variables:
    var emailText =    Variable<String>("")
    var passwordText = Variable<String>("")
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            return email.characters.count >= 3 && password.characters.count >= 3
        }
    }
}
