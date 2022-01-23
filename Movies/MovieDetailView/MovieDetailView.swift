//
//  MovieDetailView.swift
//  Movies
//
//  Created by A101Mac on 23.01.2022.
//

import SwiftUI
import Kingfisher
struct MovieDetailView: View {
    @ObservedObject var moviesDetailList = MoviesDetailList()
    let movieName : String
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
            if moviesDetailList.movieDetail == nil {
                Text("Movie Detail Not Found").foregroundColor(.white)
            }
            else {
                VStack(spacing:12) {
                    let movie = moviesDetailList.movieDetail!
                    KFImage(URL(string: movie.poster)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: getRect().height * 0.3)
                    
                    Text(movie.title).foregroundColor(.white).font(.title2)
                    Text(movie.year).foregroundColor(.white).font(.title2)
                    Text(movie.country).foregroundColor(.white).font(.title2)
                    Text(movie.director).foregroundColor(.white).font(.title2)
                    Text(movie.imdbRating).foregroundColor(.white).font(.title2)
                    Spacer()
                }    .padding(.top)
            }
        
        }
        .onAppear {
            moviesDetailList.getMovies(moviesName: movieName)
        }
        .navigationTitle(movieName)
        
    }
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView( movieName: "")
    }
}
