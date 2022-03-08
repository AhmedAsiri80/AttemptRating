//
//  ViewController.swift
//  Rating in app
//
//  Created by Ahmed Assiri on 06/08/1443 AH.
//

import StoreKit
import UIKit

class ViewController: UIViewController {

    
    
    private let button: UIButton = {
       let button = UIButton()
        button.setTitle("Rate Now", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 55)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    @objc private func didTapButton() {
        
        let alart = UIAlertController(title: "feedback", message: "Are you enjoying the app? ", preferredStyle: .alert)
        alart.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        alart.addAction(UIAlertAction(title: "Yes I love it ", style: .default, handler: { [weak self]_ in
            guard let scene = self?.view.window?.windowScene else {
            print("no scene")
            return
        }
        SKStoreReviewController.requestReview(in: scene)
            
        
    }))
        alart.addAction(UIAlertAction(title: "No this sucks", style: .default, handler: {_ in} ))
        
        //لاظهار التقييم على الشاشة //
//        guard let scene = view.window?.windowScene else {
//            print("no scene")
//            return
//        }
//        SKStoreReviewController.requestReview(in: scene)
//

        
        present(alart, animated: true)  // عشان يظهر التقييم بصور alert //

    }
}

