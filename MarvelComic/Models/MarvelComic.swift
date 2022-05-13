//
//  MarvelComic.swift
//  MarvelComic
//
//  Created by Shukre Ahmed on 5/12/22.
//

import Foundation

struct Comic: Decodable {
    let data: DataClass
}

struct DataClass: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let title, resultDescription: String
    let thumbnail: Thumbnail

    enum CodingKeys: String, CodingKey {
        case title
        case resultDescription = "description"
        case thumbnail
    }
}

struct Thumbnail: Decodable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
