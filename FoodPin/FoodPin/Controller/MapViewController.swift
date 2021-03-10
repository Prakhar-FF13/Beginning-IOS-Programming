//
//  MapViewController.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 10/03/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var restaurant = Restaurant();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let geoCoder = CLGeocoder();
        
        geoCoder.geocodeAddressString(restaurant.location, completionHandler: {
            placemarks, error in
            
            if let error = error {
                print(error)
                return
            }
            
            if let placemarks = placemarks {
                let placemark = placemarks[0];
                
                let annotation = MKPointAnnotation();
                
                annotation.title = self.restaurant.name;
                annotation.subtitle = self.restaurant.type;
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate;
                    
                    self.mapView.showAnnotations([annotation], animated: true);
                    
                    self.mapView.selectAnnotation(annotation, animated: true);
                }
            }
        })
    }
}
