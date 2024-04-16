//
//  NetworkService.swift
//  TestForWebAnt
//
//  Created by Mark Goncharov on 13.04.2024.
//

import Foundation
import RxSwift
import RxAlamofire
import RxCocoa

struct Constants {
    static let urlNew = "https://gallery.prod1.webant.ru/api/photos?new=true&limit=10"
    static let urlPopular = "https://gallery.prod1.webant.ru/api/photos?popular=true"
}

class NetworkService {
    static let shared = NetworkService()
    private let disposeBag = DisposeBag()
    
    
    public func getNewImages(refresh: Bool = false, completion: @escaping ((Model?)->())) {
        guard let url = URL(string: Constants.urlNew) else { return }
        
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = [
            "accept": "application/json"
        ]
        
        RxAlamofire.requestJSON(request).subscribe { (response, any) in
            if 200..<300 ~= response.statusCode {
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: any)
                    let modelData = try JSONDecoder().decode(Model.self, from: data)
                    completion(modelData)

                } catch let error {
                    print(error)
                    print("error")
                }
            }
        }.disposed(by: disposeBag)
    }
    
    public func getPopularImages(completion: @escaping ((Model?)->())) {
        guard let url = URL(string: Constants.urlPopular) else { return }
        var request = URLRequest(url: url)
        request.method = .get
        request.headers = [
            "accept": "application/json"
        ]
        
        RxAlamofire.requestJSON(request).subscribe { (response, any) in
            if 200..<300 ~= response.statusCode {
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: any)
                    let modelData = try JSONDecoder().decode(Model.self, from: data)
                    completion(modelData)

                } catch let error {
                    print(error)
                    print("error")
                }
            }
        }.disposed(by: disposeBag)
    }
}
