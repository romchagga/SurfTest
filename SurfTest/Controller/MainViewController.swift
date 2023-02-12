//
//  ViewController.swift
//  SurfTest
//
//  Created by macbook on 08.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    
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
    
    let pinnedView = PinnedView()

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
        view.addSubview(pinnedView)

        NSLayoutConstraint.activate([
            separatorView.leftAnchor.constraint(equalTo: view.leftAnchor),
            separatorView.rightAnchor.constraint(equalTo: view.rightAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: separatorView.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            bottomContainerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            bottomContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomContainerView.topAnchor.constraint(equalTo: separatorView.topAnchor),
            bottomContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        pinnedView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pinnedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pinnedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pinnedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pinnedView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        self.centerConstraint = separatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 120)
        self.centerConstraint.isActive = true
    
    }
    
}

