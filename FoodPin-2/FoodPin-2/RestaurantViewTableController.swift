//
//  RestaurantViewTableController.swift
//  FoodPin-2
//
//  Created by Prakhar Kumar on 15/02/21.
//

import UIKit

class RestaurantViewTableController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true;
        
        tableView.dataSource = dataSource;
        
        tableView.separatorStyle = .none;
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>();
        
        snapshot.appendSections([.all]);
        snapshot.appendItems(restaurantNames, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false);
    }
    
    enum Section {
        case all;
    };
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"];
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkee", "posatelier", "bourkestreetbakery", "haigh", "palomino", "upstate", "traif", "graham", "waffleandwolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "cask"];
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsFavourite = Array(repeating: false, count: 21);
    
    func configureDataSource() -> UITableViewDiffableDataSource<Section, String> {
        
        let cellIdentifier = "datacell";
        let dataSource = UITableViewDiffableDataSource<Section, String>(
            tableView: tableView,
            cellProvider: {
                tableView,
                indexPath,
                restaurantName in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell;
                
                cell.nameLabel.text = restaurantName;
                cell.typeLabel.text = self.restaurantTypes[indexPath.row];
                cell.locationLabel.text = self.restaurantLocations[indexPath.row];
                cell.thumbnailImage.image = UIImage(named: self.restaurantImages[indexPath.row]);
                cell.accessoryType = self.restaurantIsFavourite[indexPath.row] ? .checkmark : .none;
                
                
                return cell;
            }
        );
        
        return dataSource;
    }
    
    lazy var dataSource = configureDataSource();
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet);
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell;
                popoverController.sourceRect = cell.bounds;
            }
        }
        
        // cancel action.
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil);
        
        optionMenu.addAction(cancelAction);
        
        // reserve action.
        let reserveActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Not available yet", message: "Sorry, this feature is not available yet. Please retry later.", preferredStyle: .alert);
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil));
            
            self.present(alertMessage, animated: true, completion: nil);
        }
        
        let reserveAction = UIAlertAction(title: "Reserve a table", style: .default, handler: reserveActionHandler);
        
        optionMenu.addAction(reserveAction);
        
        // favourite action.
        let favouriteAction = UIAlertAction(title: "Favourite", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            cell?.accessoryType = .checkmark;
            cell?.tintColor = .systemYellow;
            self.restaurantIsFavourite[indexPath.row] = true;
        });
        
        optionMenu.addAction(favouriteAction);
        
        let unFavouriteAction = UIAlertAction(title: "Remove from favourites", style: .default, handler: {
            (action: UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath)
            
            cell?.accessoryType = .none;
            self.restaurantIsFavourite[indexPath.row] = false;
        });
        
        optionMenu.addAction(unFavouriteAction);
        
        tableView.deselectRow(at: indexPath, animated: false);
        
        present(optionMenu, animated: true, completion: nil)
    }

}
