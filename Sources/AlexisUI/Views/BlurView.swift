import UIKit
import SwiftUI

public struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style

    public init(style: UIBlurEffect.Style) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView()
        applyEffect(to: view, context: context)
        return view
    }

    public func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        applyEffect(to: uiView, context: context)
    }

    private func applyEffect(to uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
