//
//  JsonPlaceHolderService.swift
//  CleanPlacesTableHolder
//
//  Created by İSMAİL AÇIKYÜREK on 19.07.2022.
//

import Foundation
import Alamofire

protocol JsonPlaceHolderProtokol {
    func fethAllPost(onSuccess : @escaping ([PostModel]) -> Void,  onFail : @escaping  (String?)->Void)
}

enum JsonPlaceHolderPath  : String {
    case POSTS = "/posts"
}

extension JsonPlaceHolderPath {
    func WithBaseURl() -> String {
        return "https://jsonplaceholder.typicode.com\(self.rawValue)"
    }
}

struct JsonPlaceHolderService : JsonPlaceHolderProtokol {
    func fethAllPost(onSuccess: @escaping([PostModel]) -> Void, onFail: @escaping(String?) -> Void) {
        AF.request(JsonPlaceHolderPath.POSTS.WithBaseURl(), method: .get).validate().responseDecodable(of: [PostModel].self) { (response) in            
            
            guard let items = response.value else {
                onFail(response.debugDescription)
                return
            }
            onSuccess(items)
        }
    }
}
