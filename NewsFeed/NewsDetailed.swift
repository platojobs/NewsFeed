//
//  NewsDetailed.swift
//  NewsFeed
//
//  Created by   admin on 17.11.2020.
//

import SwiftUI

struct NewsDetailed: View {
    @State private var showWebView = false
    var article: ViewModel
    var body: some View {
        NavigationView {
            VStack(alignment:.leading ){
                
                if article.image != nil {
                    Image(uiImage: article.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                Text(article.title)
                    .lineLimit(nil)
                    .font(.title2)
                Text(article.description)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
                
                HStack(alignment: .firstTextBaseline) {
                    Text(article.sourceName)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    Text(article.publishedAt)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
                .padding(.top)
                
                
                if let utl = URL(string: article.urlWeb) {
                   // Link("Read more...", destination: URL)
                       // .padding(.top)
                    Button {
                        showWebView.toggle()
                        print(article.urlWeb)
                    }label: {
                        Text("阅读更多")
                    }
                    .padding(.top)
                    .sheet(isPresented: $showWebView, content: {
                        WebView(url: utl)
                    })
                }
                Spacer()
            }
            .padding()            
        }
        
    }
}

struct NewsDetailed_Previews: PreviewProvider {
    static var previews: some View {
        let article = Article(source: Source(id: nil, name: "name"), author: nil, title: "Title", description: "description", url: "http://google.com", urlToImage: nil, publishedAt: "14:52")
        NewsDetailed(article: ViewModel(article: article))
        
    }
}

