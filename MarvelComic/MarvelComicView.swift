//
//  ContentView.swift
//  MarvelComic
//
//  Created by Shukre Ahmed on 5/11/22.
//

import SwiftUI
import Foundation

extension Color {
    static let readNow = Color(red: 93 / 255, green: 38 / 255, blue: 145 / 255)
    static let comicGray = Color(red: 25 / 255, green: 25 / 255, blue: 26 / 255)
    static let comicWhite = Color(red: 207 / 255, green: 207 / 255, blue: 208 / 255)
}

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
}

struct ReadNowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.readNow)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ComicAccessoryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Spacer()
            configuration.label.foregroundColor(.white)
            Spacer()
        }
        .padding()
        .background(Color.comicGray)
        .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct ComicAccessoryButtonTextStyle: View{
    var text:  String
    var scaleFactor: CGFloat = 0.020
    var leading: Bool = true
    
    var body: some View {
        Text(self.text)
            .foregroundColor(Color.comicWhite)
            .font(.headline.weight(.bold))
            .font(.system(size: 50))
            .minimumScaleFactor(self.scaleFactor)
            .font(.subheadline.weight(.bold))
            .frame(maxWidth:.infinity, alignment: leading ? .leading : .center)
    }
}

struct MarvelComicView: View {
    let comic = MarvelComicService().getComicData().data.results[0]
    var body: some View {
        ZStack() {
            Color.comicGray
                .preferredColorScheme(.dark)
            VStack() {
                HStack() {
                    Text("")
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(Color.comicWhite)
                    })
                        .padding(EdgeInsets(top: 30, leading: 0, bottom: 0, trailing: 0))
                }
                .padding()
                Spacer()
                ZStack() {
                    AsyncImage(url: URL(string: comic.thumbnail.path + "." + comic.thumbnail.thumbnailExtension), scale: 2.5)
                    MarvelComicBlur(style: .light)
                    HStack() {
                        AsyncImage(url: URL(string: comic.thumbnail.path + "." + comic.thumbnail.thumbnailExtension), scale: 3.8)
                        Spacer()
                        VStack() {
                            Button(action: {}, label: {
                                ComicAccessoryButtonTextStyle(text: "READ NOW", scaleFactor: 0.030, leading: false)
                            }).buttonStyle(ReadNowButtonStyle())
                            Button(action: {}, label: {
                                HStack() {
                                    Image(systemName: "checkmark.circle.fill")
                                    Divider().background(Color.comicWhite)
                                    ComicAccessoryButtonTextStyle(text: "MARK AS READ", leading: true)
                                }
                            }).buttonStyle(ComicAccessoryButtonStyle())
                            
                            Button(action: {}, label: {
                                HStack() {
                                    Image(systemName: "plus.circle.fill")
                                    Divider().background(Color.comicWhite)
                                    ComicAccessoryButtonTextStyle(text: "ADD TO LIBRARY", leading: true)
                                }
                            }).buttonStyle(ComicAccessoryButtonStyle())
                            Button(action: {}, label: {
                                HStack() {
                                    Image(systemName: "arrow.down.to.line.compact")
                                    Divider().background(Color.comicWhite)
                                    ComicAccessoryButtonTextStyle(text: "READ OFFLINE", leading: true)
                                }
                            }).buttonStyle(ComicAccessoryButtonStyle())
                        }
                    }
                    .padding()
                }
                ScrollView {
                    VStack(alignment: .leading) {
                        Text(comic.title)
                            .foregroundColor(Color.comicWhite)
                            .font(.largeTitle.weight(.light))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        Spacer()
                        Divider().background(Color.comicWhite)
                        Text("The Story")
                            .foregroundColor(Color.comicWhite)
                            .font(.subheadline.weight(.bold))
                            .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                        Spacer()
                        Text(comic.resultDescription.trimmingLeadingAndTrailingSpaces())
                            .foregroundColor(Color.comicWhite)
                            .font(.body.weight(.light))
                    }
                }
                Spacer()
                HStack() {
                    Button(action: {}, label: {
                        HStack() {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color.comicWhite)
                            Text("PREVIOUS")
                                .foregroundColor(Color.comicWhite)
                                .font(.subheadline.weight(.bold))
                        }
                    })
                    Spacer()
                    Button(action: {}, label: {
                        HStack() {
                            Text("NEXT")
                                .foregroundColor(Color.comicWhite)
                                .font(.subheadline.weight(.bold))
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.comicWhite)
                        }
                    })
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
            }
            .padding()
        }.ignoresSafeArea()
    }
}

struct MarvelComicView_Previews: PreviewProvider {
    static var previews: some View {
        MarvelComicView()
    }
}
