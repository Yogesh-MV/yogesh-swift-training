//
//  main.swift
//  SongSearch
//
//  Created by Yogesh Murugesh on 22/09/25.
//

import Foundation

print("Enter the comma (,) seperated search term")
let searchTerm = readLine()
let yearValue = readLine()
if let searchValue = searchTerm?.lowercased().split(separator: ", "), searchValue.count > 0 {
    if let songData = loadJSON() {
        let yearValue = Int(yearValue ?? "0")!
        let filteredData = songData.filter { song in
            if yearValue >= 1900 && yearValue <= 2025 {//As per given input
                if song.year == yearValue {
                    let songDetails = ("\(song.title) \(song.artist) \(song.genre)".lowercased())
                    return searchValue.contains(where: songDetails.contains)
                } else {
                    return false
                }
            } else {
                let songDetails = ("\(song.title) \(song.artist) \(song.genre)".lowercased())
                return searchValue.contains(where: songDetails.contains)
            }
        }
        print("Result Count: \(filteredData.count)")
        for data in filteredData {
            print("Title: \(data.title) | Artist: \(data.artist) | Genre: \(data.genre) | Year: \(data.year)")
        }
    } else {
        print("No Songs Found")
    }
} else {
    print("Invalid Search Term")
}

func loadJSON() -> [Songs]? {
    let url = URL(fileURLWithPath: "/Users/yogesh/Library/CloudStorage/OneDrive-MALLOWTECHNOLOGIESPRIVATELIMITED(2)/iOS Training/SongSearch/SongSearch/Songs.json")

    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let songData = try decoder.decode(SongsData.self, from: data)
        return songData.songs
    } catch {
        print("Error: \(error)")
        return nil
    }
}

struct SongsData: Codable {
let songs: [Songs]
}

struct Songs: Codable {
let title: String
let artist: String
let genre: String
let year: Int
}
