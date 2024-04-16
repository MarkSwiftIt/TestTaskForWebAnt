//
//  CollectionReusableView.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 16.04.2024.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    static let identifier = "CollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
