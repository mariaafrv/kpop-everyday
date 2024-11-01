import Foundation

struct APIResponse: Codable {
    let status: String
    let message: String
    let data: [Song]
    let count: Int
}

struct Song: Codable {
    let post: String?
    let date: String
    let artist: String
    let songName: String
    let koreanName: String
    let director: String?
    let video: String
    let type: String
    let release: String
    
    enum CodingKeys: String, CodingKey {
        case post
        case date = "Date"
        case artist
        case songName = "Song Name"
        case koreanName = "Korean Name"
        case director
        case video = "Video"
        case type = "Type"
        case release = "Release"
    }
}
