//
//  SecondCollectionViewCell.swift
//  SurfTest
//
//  Created by macbook on 12.02.2023.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "SecondCollectionViewCell"
    
    let nameCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Medium", size: 14)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let view: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstrainst() {
        addSubview(view)
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        addSubview(nameCategory)
        NSLayoutConstraint.activate([
            nameCategory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            nameCategory.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            nameCategory.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            nameCategory.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
            
        ])
        
    }
}
