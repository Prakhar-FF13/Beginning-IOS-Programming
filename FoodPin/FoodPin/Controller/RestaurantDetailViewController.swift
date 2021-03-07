//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 21/10/2020.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeaderView!

    var restaurant: Restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = .none;
        tableView.contentInsetAdjustmentBehavior = .never;
        
        navigationController?.navigationBar.prefersLargeTitles = false;
        
        headerView.nameLabel.text = restaurant.name;
        headerView.typeLabel.text = restaurant.type;
        headerView.headerImageView.image = UIImage(named: restaurant.image);
        
        let heartImage = restaurant.isFavorite ? "heart.fill": "heart";
        
        headerView.heartButton.tintColor = restaurant.isFavorite ? .systemYellow : .white;
        
        headerView.heartButton.setImage(UIImage(systemName: heartImage), for: .normal);
    }
}

extension RestaurantDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
            cell.descriptionLabel.text = restaurant.description;
            
            return cell;
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTwoColumnCell.self), for: indexPath) as! RestaurantDetailTwoColumnCell
            
            cell.column1TitleLabel.text = "Address";
            cell.column1TextLabel.text = restaurant.location;
            
            cell.column2TitleLabel.text = "Phone";
            cell.column2TitleLabel.text = restaurant.phone;
            
            return cell;
            
        default:
            fatalError("Failed to initialize the table view cell for detail view controller");
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
