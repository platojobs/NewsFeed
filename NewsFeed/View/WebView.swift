//
//  WebView.swift
//  NewsFeed
//
//  Created by Jobs Plato on 2024/7/26.
//

import SwiftUI
#if canImport(WebKit)
import WebKit
#endif


struct WebView: UIViewRepresentable {

    var url: URL

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
