//
//  DetailTableViewCell.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 15.04.2024.
//

import UIKit
import SnapKit
import Kingfisher

class DetailTableViewController: UITableViewController {
    var modelData: [ModelData] = []
    var model = [ViewModel]()
    let scrollView = UIScrollView()

    var detailImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 6
        return image
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .light)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailImageView)
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(scrollView)
        
        setupScrollView()
        constraint()
    }

    
    private func setupScrollView() {
        scrollView.frame.size.width = view.frame.size.width
        scrollView.frame.size.height = view.frame.size.height
    }

    private func constraint() {
 
        detailImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(20)
            make.width.equalTo(400)
            make.height.equalTo(300)
            make.bottom.equalTo(nameLabel).inset(30)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(20)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(25)
            make.left.equalToSuperview().inset(20)
        }
        
        let descriptionLabelConstraint = [
            descriptionLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(descriptionLabelConstraint)
    }
    
    public func configure(with viewModel: ViewModel) {
        nameLabel.text = viewModel.nameLabel
        userNameLabel.text = viewModel.usernameLabel
        descriptionLabel.text = viewModel.descriptionLabel
        
        detailImageView.kf.indicatorType = .activity
        
        if let imageData = viewModel.detailtImageView {
            let image = KF.ImageResource(downloadURL: URL(string: imageData)!, cacheKey: imageData)
            detailImageView.kf.setImage(with: image)
        } else {
            detailImageView.image = UIImage(named: "NotWifi")
        }
    }
}

// MARK: - SwiftUI

import SwiftUI

struct SearchVCProvider: PreviewProvider {

    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let tabBarVC = NewViewController()

        func makeUIViewController(context: UIViewControllerRepresentableContext<SearchVCProvider.ContainerView>) -> NewViewController {
            return tabBarVC
        }

        func updateUIViewController(_ uiViewController: SearchVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SearchVCProvider.ContainerView>) {
        }
    }
}


