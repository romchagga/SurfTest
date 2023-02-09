//
//  ViewController.swift
//  SurfTest
//
//  Created by macbook on 08.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "customImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bottomContainerView : BottomContainerView = {
        let view = BottomContainerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let littleView = ViewForButton()

    var centerConstraint: NSLayoutConstraint!

    var startingConstant: CGFloat  = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConstraints()
        configGesture()
    }
    
    @objc func detectPan(recognizer: UIPanGestureRecognizer) {

        switch recognizer.state {
        case .began:
            self.startingConstant = self.centerConstraint.constant
        case .changed:
            let translation = recognizer.translation(in: self.view)
            self.centerConstraint.constant = self.startingConstant + translation.y
        default:
            break
        }
    }
    
    func configGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(detectPan(recognizer:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        separatorView.addGestureRecognizer(panGesture)
    }

    func setConstraints() {

        view.addSubview(imageView)
        view.addSubview(bottomContainerView)
        view.addSubview(separatorView)
        view.addSubview(littleView)

        separatorView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        separatorView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        self.centerConstraint = separatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120)
        self.centerConstraint.isActive = true
        
        separatorView.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        separatorView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true

        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: separatorView.topAnchor).isActive = true
        
        bottomContainerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        bottomContainerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        bottomContainerView.topAnchor.constraint(equalTo: separatorView.topAnchor).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    
        littleView.translatesAutoresizingMaskIntoConstraints = false
        littleView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        littleView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        littleView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        littleView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
}

