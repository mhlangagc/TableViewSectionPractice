//
//  ViewController.swift
//  TableViewSectionPractice
//
//  Created by Gugulethu Mhlanga on 2023/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let manageStorageArray = ["Manage Storage"]
    
    let networkArray = ["Network Usage", "Use Less Data for Calls", "Proxy"]
    
    let mediaArray = ["Photos", "Audio", "Video", "Documents"]
    
    lazy var storageAndDataTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(storageAndDataTableView)
        
        storageAndDataTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        storageAndDataTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        storageAndDataTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        storageAndDataTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return manageStorageArray.count
        } else if section == 1 {
            return networkArray.count
        } else {
            return mediaArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            
            let singleLabelCell = tableView.dequeueReusableCell(withIdentifier: "SingleLabelTableViewCellID", for: indexPath) as! SingleLabelTableViewCell
            singleLabelCell.titleLabel.text = manageStorageArray[indexPath.row]
            return singleLabelCell
            
            
            
    
            
        } else if indexPath.section == 1 {
            
            let networkCell = tableView.dequeueReusableCell(withIdentifier: "SingleLabelTableViewCellID", for: indexPath) as! SingleLabelTableViewCell
            networkCell.titleLabel.text = networkArray[indexPath.row]
            
            
            if indexPath.row == 1 {
                networkCell.backgroundColor = UIColor.purple
                networkCell.accessoryType = .none
                networkCell.titleLabel.textColor = UIColor.white
                networkCell.networkSwitch.isHidden = false
            } else {
                networkCell.backgroundColor = UIColor.white
                networkCell.accessoryType = .disclosureIndicator
                networkCell.titleLabel.textColor = UIColor.systemGreen
            }
            
            
            return networkCell
            
        } else {
            
            // Create our cell and change the elements
            let networkCell = tableView.dequeueReusableCell(withIdentifier: "NetworkTableViewCellID", for: indexPath) as! NetworkTableViewCell
            networkCell.titleLabel.text = mediaArray[indexPath.row]
            return networkCell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(48.0)
    }
    
    func doSomething() {
        storageAndDataTableView.register(SingleLabelTableViewCell.self,
                                         forCellReuseIdentifier: "SingleLabelTableViewCellID")
        storageAndDataTableView.register(NetworkTableViewCell.self,
                                         forCellReuseIdentifier: "NetworkTableViewCellID")
    }

}

