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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        setConstraints()
        
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
        
    }
    
}
