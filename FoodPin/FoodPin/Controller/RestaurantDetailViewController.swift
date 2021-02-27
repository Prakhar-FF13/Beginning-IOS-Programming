//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 27/02/21.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never;

        restaurantImageView.image = UIImage(named: restaurantImageName);
    }
    
    @IBOutlet var restaurantImageView: UIImageView!
    
    var restaurantImageName = "";
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
