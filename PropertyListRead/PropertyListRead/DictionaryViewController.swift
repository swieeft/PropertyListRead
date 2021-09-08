//
//  DictionaryViewController.swift
//  PropertyListRead
//
//  Created by swieeft on 2021/09/08.
//

import UIKit

class DictionaryViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // forResource에는 생성한 plist의 이름을 넣어줍니다.
        guard let url = Bundle.main.url(forResource: "UserInfo", withExtension: "plist") else {
            return
        }
        
        guard let dictionary = NSDictionary(contentsOf: url) else {
            return
        }
        
        // 각 데이터 형에 맞도록 캐스팅 해줍니다.
        nameLabel.text = dictionary["Name"] as? String
        genderLabel.text = dictionary["Gender"] as? String
        ageLabel.text = dictionary["Age"] as? String
        addressLabel.text = dictionary["Address"] as? String
        emailLabel.text = dictionary["Email"] as? String
    }
}
