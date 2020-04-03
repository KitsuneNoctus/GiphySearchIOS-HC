//
//  Gif.swift
//  GiphySearchIOS
//
//  Created by Henry Calderon on 4/2/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
/// Array of Gif Objects
struct GifArray: Decodable {
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}

/// Contains giph properties
struct Gif: Decodable {
    var gifSources: GifImages
    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
    }
    /// Returns download url of the originial gif
    func getGifURL() -> String{
        return gifSources.original.url
    }
}
/// Stores the original Gif
struct GifImages: Decodable {
    var original: original
    enum CodingKeys: String, CodingKey {
        case original = "original"
    }
}
/// URL to data of Gif
struct original: Decodable {
    var url: String
}
