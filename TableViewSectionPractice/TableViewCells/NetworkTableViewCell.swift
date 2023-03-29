//
//  NetworkTableViewCell.swift
//  TableViewSectionPractice
//
//  Created by Gugulethu Mhlanga on 2023/03/29.
//

import Foundation
import UIKit

class NetworkTableViewCell: UITableViewCell {
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var networkNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label.textColor = UIColor.gray
        label.textAlignment = .right
        label.text = "Wi-Fi"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupUI()
    }
    
    func setupUI() {
        addSubview(titleLabel)
        addSubview(networkNameLabel)
        
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        networkNameLabel.rightAnchor.constraint(equalTo: rightAnchor,
                                                constant: -40).isActive = true
        networkNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}
