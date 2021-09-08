//
//  StructViewController.swift
//  PropertyListRead
//
//  Created by swieeft on 2021/09/08.
//

import UIKit

struct UserModel: Codable {
    let name: String
    let gender: String
    let age: String
    let address: String
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case name = "Name"
        case gender = "Gender"
        case age = "Age"
        case address = "Address"
        case email = "Email"
    }
}

class StructViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let url = Bundle.main.url(forResource: "UserInfo", withExtension: "plist") else {
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode(UserModel.self, from: data)
            
            nameLabel.text = result.name
            genderLabel.text = result.gender
            ageLabel.text = result.age
            addressLabel.text = result.address
            emailLabel.text = result.email
        } catch {
            print(error.localizedDescription)
        }
    }
}
