import SwiftUI
import Kingfisher

struct MovieView: View {
    let movie: MovieDataModel

    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text(movie.title)
                    .font(.title)
                
                KFImage(URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)"))
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                Text(movie.overview)
                    .font(.body)
                    .lineLimit(nil)
            }
            .padding()
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: MovieDataModel(
            adult: false,
            backdropPath: "/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg",
            genreIDS: [878, 12, 28],
            id: 76600,
            originalLanguage: "en",
            originalTitle: "Avatar: The Way of Water",
            overview: "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
            popularity: 5271.039,
            posterPath: "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
            releaseDate: "2022-12-14",
            title: "Avatar: The Way of Water",
            video: false,
            voteAverage: 7.7,
            voteCount: 3169
        ))
    }
}
            
