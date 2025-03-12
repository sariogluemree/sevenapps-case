//
//  ViewController.swift
//  Case
//
//  Created by Hüseyin Emre Sarıoğlu on 9.03.2025.
//

import UIKit

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "User List"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        bindViewModel()
        viewModel.fetchUsers()
    }
    
    private func bindViewModel() { //viewModel ile iletişimi onUsersFetched closure'ı ile gerçekleştirmeyi tercih ettim.
        viewModel.onUsersFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {
            assertionFailure("UserCell kullanılamadı.")
            return UITableViewCell()
        }
        let user = viewModel.users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedUser = viewModel.users[indexPath.row]
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let vc = sb.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController {
            vc.user = selectedUser //detail sayfasına cell'deki user'ı geçiyorum.
            navigationController?.pushViewController(vc, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true) //detail sayfasından dönüldüğünde cell hala seçili görünmesin diye işlemleri gerçekleştirdikten sonra deselect yapıyorum.
    }


}

