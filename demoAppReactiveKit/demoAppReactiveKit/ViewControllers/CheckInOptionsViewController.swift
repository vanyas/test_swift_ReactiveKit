//
//  CheckInOptionsViewController.swift
//  demoAppReactiveKit
//
//  Created by Vangeli Ontiveros Islas on 25/09/16.
//  Copyright © 2016 Vangeli Ontiveros Islas. All rights reserved.
//

import UIKit
import ReactiveKit
import Bond

class CheckInOptionsViewController: UITableViewController {
    private let disposeBag = DisposeBag()
    //MARK: - Outlets
    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var buttonAgree: UIButton!
    
    //MARK: - Private Properties
    let checkInOptionsViewModel = CheckInOptionsViewModel()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textFieldUsername.bnd_text.bind(to: checkInOptionsViewModel.username)
        textFieldPassword.bnd_text.bind(to: checkInOptionsViewModel.password)
        switchControl.bnd_isOn.bind(to: checkInOptionsViewModel.switchControlOn)
        
        
        checkInOptionsViewModel.aggreButtonEnabled.bind(to: buttonAgree.bnd_isEnabled)
        
    
        checkInOptionsViewModel.aggreButtonEnabled.observeNext { (enabled) in
            
            let greenColor = enabled ? UIColor.green :
                            UIColor.green.withAlphaComponent(0.5)
            
            self.buttonAgree.backgroundColor = greenColor
            
        }.disposeIn(disposeBag)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
