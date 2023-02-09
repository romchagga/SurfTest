//
//  BottomContainerView.swift
//  SurfTest
//
//  Created by macbook on 08.02.2023.
//

import UIKit

class BottomContainerView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Стажировка в Surf"
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let firstCollectionView = FirstCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setConstraints()
        
        self.layer.cornerRadius = 10
        self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setConstraints() {
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24)
        ])
        
        self.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        self.addSubview(firstCollectionView)
        NSLayoutConstraint.activate([
            firstCollectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 12),
            firstCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            firstCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            firstCollectionView.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        self.addSubview(secondDescriptionLabel)
        NSLayoutConstraint.activate([
            secondDescriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            secondDescriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            secondDescriptionLabel.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 24),
            
        ])
        
    }
    
}
