//
//  ViewModel.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 13.04.2024.
//

import Foundation

class ViewModel {
    var nameLabel: String?
    var usernameLabel: String?
    var descriptionLabel: String?
    var detailtImageView: String?
    
    var imageToUrl: Data? = nil

    
    init(nameLabel: String? = nil, usernameLabel: String? = nil, descriptionLabel: String? = nil, detailtImageView: String? = nil) {
        self.nameLabel = nameLabel
        self.usernameLabel = usernameLabel
        self.descriptionLabel = descriptionLabel
        self.detailtImageView = detailtImageView
    }
}
