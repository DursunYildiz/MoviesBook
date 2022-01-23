//
//  MovieDetailViewModel.swift
//  Movies
//
//  Created by A101Mac on 23.01.2022.
//

import Foundation

class MoviesDetailList: ObservableObject {
    @Published var movieDetail: MoviesDetailViewModel? = nil
    
    @Published var isLoading: Bool = false
    func getMovies(moviesName: String) {
        isLoading = true
        
        let movieName = moviesName.replacingOccurrences(of: " ", with: "%20")
        
        NetworkService.shared.getMovieDetail(url: .movieDetail, parameter: movieName) { result in
            
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.movieDetail = MoviesDetailViewModel(movies: movie)
                }
            case .failure(let err):
                print(err)
            }
            self.isLoading = false
        }
    }
}

struct MoviesDetailViewModel {
    let movies: MoviesDetailModel
    let id = UUID()
    var title: String {
        movies.title!
    }

    var poster: String {
        movies.poster!
    }

    var year: String {
        movies.year!
    }

    var actors: String {
        movies.actors!
    }

    var country: String {
        movies.country!
    }

    var director: String {
        movies.director!
    }

    var imdbRating: String {
        movies.imdbRating!
    }
}
