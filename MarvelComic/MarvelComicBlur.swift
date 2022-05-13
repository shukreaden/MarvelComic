//
//  VisualEffectBlur.swift
//  MarvelAssignment
//
//  Taken from https://medium.com/@edwurtle/blur-effect-inside-swiftui-a2e12e61e750
//

import SwiftUI
struct MarvelComicBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
