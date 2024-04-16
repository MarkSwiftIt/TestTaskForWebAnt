//
//  NewViewController.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 13.04.2024.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class NewViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let model = NetworkService.getInstance()
    private var dataSourse: RxCollectionViewSectionedAnimatedDataSource<ModelSection>!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CoreCollectionViewCell.self, forCellWithReuseIdentifier: CoreCollectionViewCell.idendifier)
        collectionView.layer.masksToBounds = true
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New"
        view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        model.getNewImages()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    private func setupUI() -> Void {
        dataSourse = RxCollectionViewSectionedAnimatedDataSource<ModelSection>(
            configureCell: {dataSourse, collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoreCollectionViewCell.idendifier, for: indexPath) as! CoreCollectionViewCell
                cell.imageView.acce
            }
    }
}

extension NewViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoreCollectionViewCell.idendifier, for: indexPath)
        cell.layer.cornerRadius = 8
        cell.backgroundColor = .gray
//
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-10)/2
        return CGSize(width: size, height: size)
    }
}
