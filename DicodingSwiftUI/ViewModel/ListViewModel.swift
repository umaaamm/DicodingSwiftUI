//
//  GamesViewModel.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 07/07/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import Foundation

class ListViewModel : ObservableObject {
    
    private let repository: ListRepository
    @Published var isAnimatingLoading: Bool = true

    @Published var dataGames: [Result] = []
    
    init(repository: ListRepository = Services.instance) {
        self.repository = repository
    }
    
    func getGames(){
        self.isAnimatingLoading = true
        self.repository.fetchProduk { (dataGames) in
            DispatchQueue.main.async {
                self.dataGames = dataGames.results
                self.isAnimatingLoading = false
            }
        }
    }
}
