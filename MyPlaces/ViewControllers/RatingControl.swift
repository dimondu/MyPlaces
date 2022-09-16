//
//  RatingControl.swift
//  MyPlaces
//
//  Created by Дмитрий Дуров on 16.09.2022.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: - Properties
    
    private var ratingButtons: [UIButton] = []
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    var rating = 0
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: - Button action
    
    @objc func ratingButtonTaped(button: UIButton) {
        print("Button pressed")
    }
    
    // MARK: - Private methods
    
    private func setupButtons() {
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        for _ in 0..<starCount {
            // Create the buttom
            let button = UIButton()
            button.backgroundColor = .red
            
            // Add constraints
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            
            button.addTarget(self, action: #selector(ratingButtonTaped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            
            addArrangedSubview(button)
            
            // Add the new button on the rating buttom array
            
            ratingButtons.append(button)
        }
    }
    
}