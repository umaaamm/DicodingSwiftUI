//
//  ContentView.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 07/07/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var modelGames = ListViewModel()
    var body: some View {
        LoadingView(isShowing: self.$modelGames.isAnimatingLoading) {
            NavigationView {
                List {
                    if self.modelGames.dataGames.count > 0 {
                        ForEach(self.modelGames.dataGames) { item in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15, style: .continuous).fill(Color("putih_bg"))
                                LayoutList(item: item)
                                NavigationLink(destination: DetailProduk(itemDetail: item )){
                                    EmptyView()
                                }
                            }
                        }
                    }
                }
                .navigationBarItems(trailing:
                    VStack {
                        NavigationLink(destination: Profil()) {
                            Image(systemName: "person.crop.circle.fill").foregroundColor(.white)
                        }
                        .buttonStyle(PlainButtonStyle())
                })
                    .navigationBarTitle(Text("All Games"))
            }
            .accentColor( .white)
            .onAppear {
                self.modelGames.getGames()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
