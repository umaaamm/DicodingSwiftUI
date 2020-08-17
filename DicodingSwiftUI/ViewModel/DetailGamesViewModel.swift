//
//  DetailGamesViewModel.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 17/08/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import Foundation

class DetailGamesViewModel : ObservableObject {
    
    private let DetailGamesRepository: DetailGamesListRepository
    @Published var isAnimatingLoading: Bool = true
    @Published var dataDetailGames: DetailGamesModel?
    
    init(DetailGamesRepository: DetailGamesListRepository = Services.instance) {
        self.DetailGamesRepository = DetailGamesRepository
    }
    
    func getDetailGames(slug : String){
        self.isAnimatingLoading = true

        self.DetailGamesRepository.getGamesDetail(slug : slug) { (dataDetailGames) in
            DispatchQueue.main.async {
                self.dataDetailGames = dataDetailGames
                self.isAnimatingLoading = false

            }
        }
    }
}
