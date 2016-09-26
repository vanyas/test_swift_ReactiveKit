//
//  CheckInOptionsViewModel.swift
//  demoAppReactiveKit
//
//  Created by Vangeli Ontiveros Islas on 25/09/16.
//  Copyright © 2016 Vangeli Ontiveros Islas. All rights reserved.
//

import Foundation
import ReactiveKit
import ReactiveKit.Swift
import Bond

class CheckInOptionsViewModel {
    
    //MARK: - *** Private properties ***
    private let disposeBag = DisposeBag()
    
    
//    private var textFielsHaveText : Signal1<Bool>{
//        get{
//            return
//                combineLatest(username,
//                              password, combine: { usernameValue, passwordValue in
//            
//                guard let usernameValue = usernameValue,
//                      let passwordValue = passwordValue
//                    else{
//                        return false
//                }
//            
//               return !usernameValue.isEmpty && !passwordValue.isEmpty
//                                
//            })
//        }
//    }
//    

    
    //MARK: - Public Properties
    //MARK: - View properties
    public let aggreButtonEnabled = Property<Bool>(false)
    public let username = Property<String?>("")
    public let password = Property<String?>("")
    public let switchControlOn = Property<Bool>(false)
    
    
    //MARK: - Init
    init() {
       username.combineLatest(with: password, combine: {
        usernameValue, passwordValue -> Bool in
        guard let usernameValue = usernameValue,
            let passwordValue = passwordValue
            else{
                return false
        }
        return !usernameValue.isEmpty && !passwordValue.isEmpty
        
       }).bind(to: aggreButtonEnabled)
    
        aggreButtonEnabled.observeNext{ fieldsFilled in
            print("both fields contain text \(fieldsFilled)")
        }.disposeIn(disposeBag)

    }
    
    
}
