import SwiftUI

/**
 * Represents the two possible font family types: system or custom.
 */

public enum FontFamily {
    /// The system font, with the specified design.
    case system(Font.Design)

    /// A custom font, identified by its family name.
    case custom(String)

    /// A system font with the default design.
    public static var system: FontFamily {
        .system(.default)
    }
}

/**
 * A modifier that sets the font to an automatically scaling font, using the provided properties.
 */

public struct DynamicFontModifier: ViewModifier {
    let fontFamily: FontFamily
    let baseFontSize: CGFloat
    let fontWeight: Font.Weight
    @Environment(\.sizeCategory) var sizeCategory

    /// Creates the modifier using the required values.
    /// - parameter fontFamily: The family of the font to use inside this view.
    /// - parameter baseFontSize: The font size to use for the default content size category, e.g. 17 for body.
    /// - parameter fontWeight: The weight to apply to the font.
    public init(fontFamily: FontFamily, baseFontSize: CGFloat, fontWeight: Font.Weight) {
        self.fontFamily = fontFamily
        self.baseFontSize = baseFontSize
        self.fontWeight = fontWeight
    }

    public func body(content: Content) -> some View {
        let traitsCollection = UITraitCollection(
            preferredContentSizeCategory: UIContentSizeCategory(sizeCategory)
        )

        let scaledFontSize = UIFontMetrics(forTextStyle: .body)
            .scaledValue(for: baseFontSize, compatibleWith: traitsCollection)

        switch fontFamily {
        case .system(let design):
            return content
                .font(.system(size: scaledFontSize, weight: fontWeight, design: design))

        case .custom(let familyName):
            return content
                .font(Font
                    .custom(familyName, size: scaledFontSize)
                    .weight(fontWeight)
                )
        }
    }
}

extension View {
    /// Returns a modified view that uses an automatically-scaling font for its text.
    /// - parameter family: The family of the font to use inside this view.
    /// - parameter fontSize: The font size to use for the default content size category, e.g. 17 for body.
    /// - parameter weight: The weight to apply to the font.
    public func dynamicFont(family: FontFamily, baseSize: CGFloat, weight: Font.Weight) -> ModifiedContent<Self, DynamicFontModifier> {
        modifier(DynamicFontModifier(fontFamily: family, baseFontSize: baseSize, fontWeight: weight))
    }
}
