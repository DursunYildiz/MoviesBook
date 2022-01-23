//
//  MoviesViewModel.swift
//  Movies
//
//  Created by A101Mac on 23.01.2022.
//

import Foundation


import Combine

class MoviesList : ObservableObject {

    @Published var movies = [MoviesViewModel]()
    
    func getMovies (moviesName : String) {
        NetworkService.shared.getMovies(url: .searchMovies, parameter: moviesName) { result in
            switch result  {
                
            case .success(let movies):
                DispatchQueue.main.async {
                    self.movies = movies.search.map(MoviesViewModel.init)
                }
            case .failure( _):
                DispatchQueue.main.async {
                    self.movies.removeAll()
                }
            }
        
        }
    }
    
    
    
}
struct MoviesViewModel {
    let movies : Search
    let id = UUID()
    var title:  String {
         movies.title!
    }
    var poster : String {
         movies.poster!
    }
    var year : String {
         movies.year!
    }
    
    
}





