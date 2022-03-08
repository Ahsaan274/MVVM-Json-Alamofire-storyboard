//
//  UserCell.swift
//  MVVM + Json
//
//  Created by Avanza on 28/02/2022.
//

import UIKit

class UserCell: UITableViewCell {

    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var userModel: UserModel? {
        didSet{
            userConfiguration()
        }
    }
    
    func userConfiguration(){
        let status = userModel?.getStatusAndColor()
        lblStatus.text = status?.0
        backgroundColor = status?.1
        
        if let id = userModel?.id{
            lblID.text = "\(id)"
        }else{
            lblID.text = "No ID"
        }
        if let title = userModel?.title{
            lblTitle.text = "\(title)"
        }else{
            lblTitle.text = "No Title"
        }
       
    }
}
