//
//  Services.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 07/07/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import Foundation

typealias ListCompletion = (_ List: RawgGames) -> Void
typealias ListCompletionDetailGames = (_ List: DetailGamesModel) -> Void


protocol ListRepository {
    func fetchProduk(completion: @escaping ListCompletion)
}

protocol DetailGamesListRepository {
    func getGamesDetail(slug: String, completion: @escaping ListCompletionDetailGames)
}

class Services: ListRepository, DetailGamesListRepository {
    
    static let instance: Services = Services()
    
    private let baseApiUrl = "https://api.rawg.io"
    private let urlSession = URLSession.shared
    
    func fetchProduk(completion: @escaping ListCompletion) {
        let url = self.generateUrl(path: UrlPath.urlDetail)
        self.urlSession.dataTask(with: url){ (data, response, error) in
            if let errorResponse = error {
                print("Error response : \(errorResponse.localizedDescription)")
            }else {
                do {
                    let result = try JSONDecoder().decode(RawgGames.self, from: data!)
                    completion(result)
                }catch let error {
                    print("Failed to get produk : \(error)")
                }
            }
        }.resume()
    }
    
    func getGamesDetail(slug: String, completion: @escaping ListCompletionDetailGames) {
        let url = URL(string: "\(baseApiUrl)/api/games/\(slug)")!
        self.urlSession.dataTask(with: url){ (data, response, error) in
            if let errorResponse = error {
                print("Error response detail games : \(errorResponse.localizedDescription)")
            }else {
                do {
                    let result = try JSONDecoder().decode(DetailGamesModel.self, from: data!)
                    completion(result)
                }catch let error {
                    print("Failed to get detail games : \(error)")
                }
            }
        }.resume()
    }
    
    private func generateUrl(path: String) -> URL{
        let url = "\(self.baseApiUrl)/\(path)"
        return URL(string: url)!
    }
    
    private func generateUrlDetail(path: String, slug: String) -> URL{
        let url = "\(self.baseApiUrl)/\(path)/\(slug)"
        return URL(string: url)!
    }
}

struct UrlPath {
    static let urlDetail = "api/games?page=1"
}

