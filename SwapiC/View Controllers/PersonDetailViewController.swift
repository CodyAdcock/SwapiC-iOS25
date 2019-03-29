//
//  PersonDetailViewController.swift
//  SwapiC
//
//  Created by Cody on 3/28/19.
//  Copyright © 2019 Cody Adcock. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    @objc var person: CRAPerson?{
        didSet{
            loadViewIfNeeded()
            updateViews()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func updateViews(){
        guard let person = person else {return}
        
        nameLabel.text = person.name
        massLabel.text = "Mass: " + person.mass
        heightLabel.text = "Height: " + person.height
        
        if let image = UIImage(named: person.name.lowercased()){
            imageView.image = image
        }else{
            imageView.image = UIImage(named: "notFound")
        }
    }

}
