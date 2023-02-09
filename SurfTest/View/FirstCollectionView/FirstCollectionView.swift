//
//  CollectionView.swift
//  SurfTest
//
//  Created by macbook on 09.02.2023.
//

import UIKit

class FirstCollectionView: UICollectionView {
    
    var isTappedOnCell = false
    
    let namesCategory = ["IOS", "Android", "Design", "Flutter", "QA", "PM"]

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension FirstCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        namesCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.reuseId, for: indexPath) as! FirstCollectionViewCell
        
        cell.nameCategory.text = namesCategory[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        NotificationCenter.default.post(name: NSNotification.Name("change background color"), object: nil)
        let cell = collectionView.cellForItem(at: indexPath) as! FirstCollectionViewCell
        
        if isTappedOnCell {
            cell.view.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
            cell.nameCategory.textColor = .black
            isTappedOnCell = false
        } else if !isTappedOnCell {
            cell.view.backgroundColor = .black
            cell.nameCategory.textColor = .white
            isTappedOnCell = true
        }
    }
}

    extension FirstCollectionView: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let label = UILabel(frame: CGRect.zero)
            label.text = namesCategory[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width+50, height: 40)
        }
    }
