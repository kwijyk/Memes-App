//
//  MemesScreenVC.swift
//  Memes App
//
//  Created by Sergio on 12/21/17.
//  Copyright © 2017 Sergio. All rights reserved.
//

import UIKit

class MemesScreenVC: UIViewController {
    
    @IBOutlet private weak var ibCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Memes"
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionAdd))
        navigationItem.rightBarButtonItem = barButton
        
        ibCollectionView.register(MemeCVC.nib, forCellWithReuseIdentifier: MemeCVC.reuseIdentifier)
    }

    // MARK: - Action
    @objc func actionAdd() {
        
    }
}

extension MemesScreenVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemeCVC.reuseIdentifier, for: indexPath)
        return cell
    }
}

extension MemesScreenVC: UICollectionViewDelegateFlowLayout {

    var minimumItemSpacing: CGFloat { return 20 }
    var sectionInsets: UIEdgeInsets { return UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20) }
    var itemsPerRow: CGFloat { return 2 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left + sectionInsets.right + minimumItemSpacing * (itemsPerRow - 1)
        let availableWidth = collectionView.bounds.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return  CGSize(width: widthPerItem, height: widthPerItem)
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
//
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumItemSpacing
    }

}
