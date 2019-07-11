//
//  AgentDetailViewController.swift
//  NOCList
//
//  Created by Casualty on 7/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AgentDetailViewController: UIViewController {
    
    @IBOutlet weak var coverNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var accessLevelLabel: UILabel!
    
    var agent: (coverName: String, realName: String, accessLevel: Int, compromised: Bool)!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverNameLabel.text = agent.coverName
        realNameLabel.text = agent.realName
        accessLevelLabel.text = "\(agent.accessLevel)"
        
        if agent.compromised == true {
            view.backgroundColor = UIColor(hue: 0, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
