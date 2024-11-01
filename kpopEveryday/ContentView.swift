import SwiftUI
import Combine

struct ContentView: View {
  @ObservedObject var viewModel = KpopEverydayViewModel()
  
  var body: some View {
    ZStack {
      Color.black
        .ignoresSafeArea()
      
      VStack {
        if let song = viewModel.song {
                       Text("Artist: \(song.artist)")
            .foregroundStyle(.white)
                       Text("Song Name: \(song.songName)")
            .foregroundStyle(.white)
                       Text("Release Date: \(song.date)")
            .foregroundStyle(.white)
                       Link("Watch Video", destination: URL(string: song.video)!)
            .foregroundStyle(.white)
                   } else {
                       Text("Loading...")
                           .onAppear {
                               viewModel.loadRandomSong()
                           }
                   }
//
//        
//        Text("A música de hoje é")
//          .font(.custom("Montserrat", size: 36)) // Substitua por uma fonte desejada
//          .fontWeight(.bold)
//          .padding()
//          .foregroundColor(.white)
//          .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 5)
//          .multilineTextAlignment(.center)
//        
//        YouTubeView(videoID: "dM2MAOavweU")
//          .frame(height: 200)
//          .cornerRadius(10)
//          .padding()
//        
//        Text("Sweetest obsession - Twice")
//          .font(.title)
//          .foregroundStyle(.white)
      }
      Spacer()
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = KpopEverydayViewModel()
    ContentView(viewModel: viewModel)
  }
}
