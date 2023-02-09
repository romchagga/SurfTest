//
//  ViewForButton.swift
//  SurfTest
//
//  Created by macbook on 09.02.2023.
//

import UIKit

class ViewForButton: UIView {
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = UIColor(red: 49/255, green: 49/255, blue: 49/255, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dlabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = .gray
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
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -58),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 136),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        self.addSubview(dlabel)
        NSLayoutConstraint.activate([
            dlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dlabel.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
    }
}
