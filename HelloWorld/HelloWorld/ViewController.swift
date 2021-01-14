//
//  ViewController.swift
//  HelloWorld
//
//  Created by Prakhar Kumar on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.black;
    }
    
    @IBAction func showMessage(sender: UIButton) {
        let emojiDict = ["👾": "alien",
                         "👻": "ghost",
                         "🤓": "glasses",
                         "🤖": "robot"
        ];
        
        let selectedButton = sender;
        
        if let wordToLookup = selectedButton.titleLabel?.text{
            let meaning = emojiDict[wordToLookup];
            
            let alertController = UIAlertController(
                title: "Meaning",
                message: meaning,
                preferredStyle: UIAlertController.Style.alert
            )
                
            alertController.addAction(
                UIAlertAction(
                    title: "OK",
                    style: UIAlertAction.Style.default,
                    handler: nil
                )
            )
            
            present(
                alertController,
                animated: true,
                completion: nil
            )
        }
    }

}

