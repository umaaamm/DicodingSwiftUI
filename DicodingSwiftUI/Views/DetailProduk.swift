//
//  DetailProduk.swift
//  DicodingSwiftUI
//
//  Created by Kurniawan Gigih Lutfi Umam on 16/08/20.
//  Copyright © 2020 Kurniawan Gigih Lutfi Umam. All rights reserved.
//

import SwiftUI

struct DetailProduk : View {
    let itemDetail : Result
    @ObservedObject var detailGames = DetailGamesViewModel()
    
    var body: some View {
        LoadingView(isShowing: self.$detailGames.isAnimatingLoading) {
            List {
                ImageBanner(withURL: self.itemDetail.background_image ?? "").listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).padding(.bottom)
                VStack(alignment: .leading) {
                    HStack{
                        Text(self.itemDetail.name).font(.headline)
                        Image(systemName: "play.circle.fill").foregroundColor(.yellow).font(.subheadline).padding(.leading)
                        Text("\(String(self.itemDetail.playtime ?? 0)) hours").foregroundColor(Color.gray).font(.subheadline)
                    }
                    HStack{
                        ForEach(0..<Int(self.itemDetail.rating)){ i in
                            Image(systemName: "star.fill").foregroundColor(.yellow).font(.subheadline)
                        }
                        if (self.itemDetail.rating >= 4.5) { Image(systemName: "star.lefthalf.fill").foregroundColor(.yellow).font(.subheadline) }
                        Text(String(self.itemDetail.rating)).font(.subheadline).foregroundColor(Color.gray)
                        Spacer(minLength: 5)
                        
                    }
                    Text(self.detailGames.dataDetailGames?.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil) ?? "-").font(.subheadline)
                }
            }
            .navigationBarTitle(Text(self.itemDetail.name))
            .onAppear{
                
                self.detailGames.getDetailGames(slug: self.itemDetail.slug)
                
                if #available(iOS 14.0, *) {
                } else {
                    UITableView.appearance().tableFooterView = UIView()
                }
                UITableView.appearance().separatorStyle = .none
            }
        }
    }
}

struct DetailProduk_Previews: PreviewProvider {
    static var previews: some View {
        DetailProduk(itemDetail: Result(id: 1, slug: "Dummy Slug", name: "Dummy Nama", released: "2020-08-17", background_image: "Dummy Gambar", rating: 4.5, playtime: 30))
    }
}
