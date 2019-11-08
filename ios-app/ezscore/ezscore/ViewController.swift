//
//  ViewController.swift
//  ezscore
//
//  Created by Karen Papazian on 4/24/19.
//  Copyright © 2019 Karen Papazian. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TeamSelectedDelegate {
    
    var tableView: UITableView!
    
    var favoriteTeams = ["    Choose Favorite Team"]
    var rivalTeams: [String] = ["    Choose Rival Team"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "EZScore"
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
    
        tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: "chosenteams-cell")
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func teamWasSelected(team: String, isRival: Bool) {
        if isRival {
            rivalTeams.append(team)
            tableView.reloadData()
        } else {
            favoriteTeams.append(team)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return favoriteTeams.count
        } else {
            return rivalTeams.count
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let chooseTeamViewController = ChooseTeamViewController()
            let navController = UINavigationController(rootViewController: chooseTeamViewController)
            chooseTeamViewController.delegate = self
            chooseTeamViewController.isRival = indexPath.section == 1
            present(navController, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            navigationController?.pushViewController(TeamScoreViewController(), animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return " Favorite Teams"
        } else {
            return " Rival Teams"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chosenteams-cell", for: indexPath) as! TeamTableViewCell
        if indexPath.section == 0 {
            cell.teamNameLabel.text = favoriteTeams[indexPath.row]
        } else {
            cell.teamNameLabel.text = rivalTeams[indexPath.row]
        }
 
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == 0 { return false }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            if indexPath.section == 0 {
                favoriteTeams.remove(at: indexPath.row)
            } else {
                rivalTeams.remove(at: indexPath.row)
            }
            tableView.reloadData()
        }
    }


}

