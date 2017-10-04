//
//  ViewController.swift
//  LoginValidation
//
//  Created by Frederick C. Lee on 10/4/17.
//  Copyright © 2017 Amourine Technologies. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginEnabledLabel: UILabel!
    
    var loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = emailTextField.rx.text.map {$0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordTextField.rx.text.map {$0 ?? ""}.bind(to: loginViewModel.passwordText)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        _ = loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.loginEnabledLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.loginEnabledLabel.textColor = isValid ? .green : .red
            print("isValid: \(isValid)")
        }).disposed(by: disposeBag)
    }
}

