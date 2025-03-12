//
//  UserCell.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
    
}
