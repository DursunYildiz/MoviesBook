

import Kingfisher
import SwiftUI

struct MoviesView: View {
    @ObservedObject var moviesList = MoviesList()
   
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.bottom)
               
                VStack {
                    TextField("Movie Name", text: $searchText, onCommit: {
                        moviesList.getMovies(moviesName: searchText.trimmingCharacters(in: .whitespaces))
                    })
                            
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white)
                            .frame(height: getRect().height * 0.05)
                        )
                           
                        .padding()
                    Spacer()
                    if moviesList.movies.isEmpty {
                        Text("Movie Not Found").foregroundColor(.white)
                        Spacer()
                    }
                    else {
                        ScrollView {
                            LazyVStack(spacing: 10) {
                                ForEach(moviesList.movies, id: \.id) { movie in
                                    NavigationLink {
                                        MovieDetailView(movieName: movie.title)
                                    } label: {
                                        HStack {
                                            KFImage(URL(string: movie.poster)!)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(height: getRect().height * 0.3)
                                            Spacer()
                                           
                                            VStack(alignment: .center) {
                                                Text(movie.title).font(.body).foregroundColor(.white).bold()
                                                
                                                Text(movie.year).font(.title)
                                                    .foregroundColor(.white).bold()
                                            }
                                            .padding()
                                        }
                                        .padding()
                                    }

                                }
                            }
                        }
                    }
                }
            }.navigationBarTitle("Movies")
                .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            moviesList.getMovies(moviesName: "batman")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
