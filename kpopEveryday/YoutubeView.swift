import SwiftUI
import WebKit

struct YouTubeView: UIViewRepresentable {
    let videoID: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let embedHTML = """
        <html>
        <body style='margin:0;padding:0;'>
        <iframe width='100%' height='100%' src='https://www.youtube.com/embed/\(videoID)?autoplay=0&controls=1&showinfo=0' frameborder='0' allowfullscreen></iframe>
        </body>
        </html>
        """
        uiView.loadHTMLString(embedHTML, baseURL: nil)
    }
}
