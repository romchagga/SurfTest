//
//  CollectionView.swift
//  SurfTest
//
//  Created by macbook on 09.02.2023.
//

import UIKit

class CollectionView: UICollectionView {
    
    let namesCategory = ["IOS", "Android", "Design", "Flutter", "QA", "PM"]

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        delegate = self
        dataSource = self
        
        register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

extension CollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        
        cell.nameCategory.text = namesCategory[indexPath.row]
        return cell
    }
}

    extension CollectionView: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let label = UILabel(frame: CGRect.zero)
            label.text = namesCategory[indexPath.item]
            label.sizeToFit()
            return CGSize(width: label.frame.width+50, height: 40)
        }
    }
