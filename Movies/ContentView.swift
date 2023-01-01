//
//  ContentView.swift
//  Movies
//
//  Created by Youssef Lakouifat on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var moviesModel: MoviesModel = MoviesModel()

    
    var body: some View {
        NavigationView{
            Form{
                ForEach(moviesModel.movies, id: \.id) { movie in
                    Text(movie.originalTitle)
                }
            }.navigationTitle("Movies")
        }.onAppear{
            moviesModel.loadMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
