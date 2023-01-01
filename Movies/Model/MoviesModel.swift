//
//  MovieModel.swift
//  Movies
//
//  Created by Youssef Lakouifat on 1/1/23.
//

import Alamofire
import Foundation

// MARK: - MovieDataModel
struct MovieDataModel: Decodable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieResponseDataModel: Decodable {
    let movies: [MovieDataModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movies = try container.decode([MovieDataModel].self, forKey: .results)

    }
}

final class MoviesModel: ObservableObject {
    
    @Published var movies: [MovieDataModel] = []
    
    func loadMovies() {
            AF.request("https://api.themoviedb.org/3/discover/movie?api_key=2ec9870ebb2d0902cb51a6ea71a41dd4")
                .responseDecodable(of: MovieResponseDataModel.self) { [weak self] response in
                    guard let self = self, let moviesResponse = response.value else { return }
                    self.movies = moviesResponse.movies
                }
        }
}
