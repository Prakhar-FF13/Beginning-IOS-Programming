//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 07/02/21.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
        
        tableView.dataSource = dataSource;
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>();
        
        snapshot.appendSections([.all])
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"];
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"];
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    enum Section {
        case all;
    };
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        
        let cellIdentifier = "datacell";
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: {
                tableView,
                indexPath,
                restaurantName in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
                cell.nameLabel.text = restaurantName
                cell.thumbnailImageView.image = UIImage(named:self.restaurantImages[indexPath.row])
                cell.locationLabel.text = self.restaurantLocations[indexPath.row];
                cell.typeLabel.text = self.restaurantTypes[indexPath.row];
                
                return cell
            }
        )
        
        return dataSource;
    }
    
    lazy var dataSource = configureDataSource();

}
