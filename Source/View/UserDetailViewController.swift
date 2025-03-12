//
//  UserDetailsViewController.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var detailsCardView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "User Details"
        setupCardView()
        displayUserInfo()
    }
    
    //bilgileri bir kart şeklinde göstermek istedim ve ufak bir gölge ekleyerek süsledim.
    private func setupCardView() {
        detailsCardView.layer.cornerRadius = 10
        detailsCardView.layer.borderWidth = 1
        detailsCardView.layer.borderColor = UIColor.lightGray.cgColor

        detailsCardView.layer.shadowColor = UIColor.black.cgColor
        detailsCardView.layer.shadowOpacity = 0.2
        detailsCardView.layer.shadowOffset = CGSize(width: 0, height: 2)
        detailsCardView.layer.shadowRadius = 4
    }
    
    //ui iyileştirmek amacıyla storyboard üzerinden her bilgiye karşılık gelen ikonları image olarak label'ların başına ekledim.
    private func displayUserInfo() {
        guard let user = user else { return }
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.phone
        websiteLabel.text = user.website
        companyLabel.text = user.company.name
    }
    
    @IBAction func back(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}
