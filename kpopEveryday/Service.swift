import Foundation
import Combine

class KpopAPI {
  private let baseURL = "https://k-pop.p.rapidapi.com/songs/random"
  private let headers = [
    "x-rapidapi-host": "k-pop.p.rapidapi.com",
    "x-rapidapi-key": "be6998a4b5msh474520a499e8e80p1916a8jsn8aca31088195"
  ]
  
  func fetchRandomSong() -> AnyPublisher<Song, Error> {
    guard let url = URL(string: baseURL) else {
      return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
    
    return URLSession.shared.dataTaskPublisher(for: request)
      .map(\.data)
      .decode(type: APIResponse.self, decoder: JSONDecoder())
      .map { $0.data.first! }
      .eraseToAnyPublisher()
  }
}
