import UIKit
import SwiftUI

public struct BlurView: UIViewRepresentable {
    let lightBlurEffectStyle: UIBlurEffect.Style
    let darkBlurEffectStyle: UIBlurEffect.Style

    public init(light: UIBlurEffect.Style, dark: UIBlurEffect.Style) {
        self.lightBlurEffectStyle = light
        self.darkBlurEffectStyle = dark
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
        switch context.environment.colorScheme {
        case .light:
            uiView.effect = UIBlurEffect(style: lightBlurEffectStyle)
        case .dark:
            uiView.effect = UIBlurEffect(style: darkBlurEffectStyle)
        @unknown default:
            uiView.effect = UIBlurEffect(style: lightBlurEffectStyle)
        }
    }
}
