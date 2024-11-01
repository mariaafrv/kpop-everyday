import SwiftUI
import Combine

class KpopEverydayViewModel: ObservableObject {
  // todas propriedades acessadas por outras classes devem ser @published
  @Published var currentDate: Date = Date()
  @Published var song: Song?
  @Published var partOfDay: String?
  private var cancellables = Set<AnyCancellable>()
  private let api = KpopAPI()
  
  
  func getFormattedCurrentDate() -> String{
    return currentDate.formatted().description
  }
  
  func loadRandomSong() {
    api.fetchRandomSong()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { completion in
        if case .failure(let error) = completion {
          print("Error fetching song: \(error)")
        }
      }, receiveValue: { [weak self] song in
        self?.song = song
      })
      .store(in: &cancellables)
  }
  
  func getTimeOfTheDay() -> String {
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: currentDate)
    
    if hour >= 5 && hour < 12 {
        partOfDay = "Bom dia!"
    } else if hour >= 12 && hour < 18 {
        partOfDay = "Boa tarde!"
    } else {
        partOfDay = "Boa noite!"
    }
    return partOfDay ?? "Olá!"
  }
}
