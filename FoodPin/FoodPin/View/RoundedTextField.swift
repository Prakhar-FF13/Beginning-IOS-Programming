//
//  RoundedTextField.swift
//  FoodPin
//
//  Created by Prakhar Kumar on 30/03/21.
//

import UIKit

class RoundedTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding);
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding);
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding);
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        self.layer.borderWidth = 1.0;
        self.layer.borderColor = UIColor.systemGray5.cgColor;
        self.layer.cornerRadius = 10.0;
        self.layer.masksToBounds = true;
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
