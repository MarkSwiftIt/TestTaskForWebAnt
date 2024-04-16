//
//  CoreCollectionViewCell.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 13.04.2024.
//

import UIKit
import Kingfisher
import SnapKit

class CoreCollectionViewCell: UICollectionViewCell {
    static let idendifier = "CoreCollectionViewCell"

    let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        constraint()
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.kf.cancelDownloadTask()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraint() {
        imageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
}
