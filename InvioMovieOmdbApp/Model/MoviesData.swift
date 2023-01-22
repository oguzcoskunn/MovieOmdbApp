//
//  MoviesData.swift
//  InvioMovieOmdbApp
//
//  Created by Oğuz Coşkun on 18.01.2023.
//

import Foundation

struct MoviesData: Codable {
    let Title: String?
    let Year: String?
    let Released: String?
    let Plot: String?
    let Poster: String?
    let imdbRating: String?
    let imdbID: String?
    let `Type`: String?
    let Genre: String?
    let Director: String?
    let Actors: String?
}
