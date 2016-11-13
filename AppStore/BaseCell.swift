//
//  BaseCell.swift
//  AppStore
//
//  Created by Tihomir Videnov on 11/12/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

