//
//  NOCListTableViewController.swift
//  NOCList
//
//  Created by Ben Gohlke on 5/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class NOCListTableViewController: UITableViewController
{
    private var agents: [(coverName: String, realName: String, accessLevel: Int, compromised: Bool)] = []
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Agents"
        loadNOCList()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "\(compromisedCount())"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return agents.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgentCell", for: indexPath)
        
        let aNewAgent = agents[indexPath.row]
        
        cell.textLabel!.text = aNewAgent.coverName
        cell.detailTextLabel!.text = aNewAgent.realName
        
        
        if aNewAgent.compromised == true {
            cell.backgroundColor = UIColor(hue: 0, saturation: 0.4, brightness: 0.9, alpha: 1.0)
        } else {
            cell.backgroundColor = .white
        }

        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let selectedAgent = agents[selectedIndexPath.row]
        let agentDetailVC = segue.destination as! AgentDetailViewController
        agentDetailVC.agent = selectedAgent
    }
    
    // MARK: - Private
    private func loadNOCList() {
        let agent1 = (coverName: "Ethan Hunt", realName: "Tom Cruise", accessLevel: 8, compromised: true)
        let agent2 = (coverName: "Jim Phelps", realName: "Jon Voight", accessLevel: 9, compromised: false)
        let agent3 = (coverName: "Claire Phelps", realName: "Emmanuelle Beart", accessLevel: 5, compromised: false)
        let agent4 = (coverName: "Eugene Kittridge", realName: "Henry Czerny", accessLevel: 10, compromised: true)
        let agent5 = (coverName: "Franz Krieger", realName: "Jean Reno", accessLevel: 4, compromised: false)
        let agent6 = (coverName: "Luther Stickell", realName: "Ving Rhames", accessLevel: 4, compromised: false)
        let agent7 = (coverName: "Sarah Davies", realName: "Kristin Scott Thomas", accessLevel: 5, compromised: true)
        let agent8 = (coverName: "Max RotGrab", realName: "Vanessa Redgrave", accessLevel: 4, compromised: false)
        let agent9 = (coverName: "Hannah Williams", realName: "Ingeborga Dapkūnaitė", accessLevel: 5, compromised: true)
        let agent10 = (coverName: "Jack Harmon", realName: "Emilio Estevez", accessLevel: 6, compromised: true)
        let agent11 = (coverName: "Frank Barnes", realName: "Dale Dye", accessLevel: 9, compromised: false)
        
        agents.append(contentsOf: [agent1, agent2, agent3, agent4, agent5, agent6, agent7, agent8, agent9, agent10, agent11])
        
    }
    private func compromisedCount() -> String {
        var totalCount = 0
        
        for aNewAgent in agents {
            if aNewAgent.compromised == true {
                    totalCount += 1
                }
            else {}
                
            }
        return "\(totalCount) compromised agents."
        }
    
    }
