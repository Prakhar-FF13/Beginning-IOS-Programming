//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 12/03/21.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundImageView.image = UIImage(named: restaurant.image);
        
        let blurEffect = UIBlurEffect(style: .dark);
        let blurEffectView = UIVisualEffectView(effect: blurEffect);
        blurEffectView.frame = view.bounds;
        backgroundImageView.addSubview(blurEffectView);
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600.0, y: 0);
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0);
        
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform);
        
        for rateButton in rateButtons {
            rateButton.alpha = 0;
            rateButton.transform = moveScaleTransform;
        }
        
        let moveUpTransform = CGAffineTransform.init(translationX: 0, y: -600);
        
        closeButton.transform = moveUpTransform;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        var delayTime = 0.1;
        
        for rateButton in self.rateButtons {
            UIView.animate(withDuration: 0.4,
                delay: delayTime,
                options:[],
                animations: {
                rateButton.alpha = 1;
                rateButton.transform = .identity;
            }, completion: nil);
            
            delayTime += 0.05;
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.1,
            options:[],
            animations: {
            self.closeButton.transform = .identity;
        }, completion: nil);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
