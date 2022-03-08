//
//  ViewController.swift
//  MVVM + Json
//
//  Created by Avanza on 28/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModelUser.vc = self
        viewModelUser.getAllUserDataAF()
        tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        tableView.backgroundColor = .systemRed
    }
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        let model = viewModelUser.arrUsers[indexPath.row]
        cell?.userModel = model
        return cell!
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

