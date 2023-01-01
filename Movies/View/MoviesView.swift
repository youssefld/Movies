//
//  ContentView.swift
//  Movies
//
//  Created by Youssef Lakouifat on 1/1/23.
//

import SwiftUI
import Kingfisher
struct MoviesView: View {
    
    @StateObject var moviesModel: MoviesModel = MoviesModel()

    var body: some View {
        NavigationView {
            Form {
                ForEach(moviesModel.movies, id: \.id) { movie in
                    NavigationLink(destination: MovieView(movie: movie)) {
                        HStack {
                            KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
                                .resizable()
                                .aspectRatio(contentMode: .fit).frame(width: 50)
                            Text(movie.title)
                        }
                    }
                }
            }
            .navigationTitle("Movies")
        }
        .onAppear {
            moviesModel.loadMovies()
        }
    }
}



struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

struct ImageView: View {
    @State private var image: UIImage?
    let url: String
    
    var body: some View {
        Image(uiImage: image ?? UIImage())
            .onAppear(perform: loadImage)
            .aspectRatio(contentMode: .fit)
    }

    private func loadImage() {
        let finalUrl = "https://image.tmdb.org/t/p/w500"+url
        guard let imageURL = URL(string: finalUrl) else { return }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: imageURL) {
                if let loadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = loadedImage
                    }
                }
            }
        }
    }
}
