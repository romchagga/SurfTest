//
//  SecondCollectionView.swift
//  SurfTest
//
//  Created by macbook on 12.02.2023.
//

import UIKit

class SecondCollectionView: UICollectionView {

    var isTappedOnCell = false
    
    let namesCategory = ["IOS", "Android", "Design", "QA", "Flutter", "PM"]
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        
        delegate = self
        dataSource = self
        
        register(SecondCollectionViewCell.self, forCellWithReuseIdentifier: SecondCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SecondCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        namesCategory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.reuseId, for: indexPath) as! SecondCollectionViewCell
        
        cell.nameCategory.text = namesCategory[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SecondCollectionViewCell
        
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
extension SecondCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = namesCategory[indexPath.item]
        label.sizeToFit()
        return CGSize(width: label.frame.width+50, height: 40)
    }
}




