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
        
        restaurantStackView.layer.cornerRadius = 10.0;

        restaurantImageView.image = UIImage(named: restaurant.image);
        restaurantName.text = restaurant.name;
        restaurantType.text = restaurant.type;
        restaurantLocation.text = restaurant.location;
    }
    
    @IBOutlet var restaurantImageView: UIImageView!
    @IBOutlet var restaurantName: UILabel!
    @IBOutlet var restaurantType: UILabel!
    @IBOutlet var restaurantLocation: UILabel!
    @IBOutlet var restaurantStackView: UIStackView!
    
    var restaurant: Restaurant = Restaurant(name: "", type: "", location: "", image: "", isFavorite: false);
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
