import UIKit
import SwiftUI

extension UIContentSizeCategory {
    /// Creates a UIContentSizeCategory from a SwiftUI content size category.
    init(_ contentSizeCategory: ContentSizeCategory) {
        switch contentSizeCategory {
        case .extraSmall:
            self = .extraSmall
        case .small:
            self = .small
        case .medium:
            self = .medium
        case .large:
            self = .large
        case .extraLarge:
            self = .extraLarge
        case .extraExtraLarge:
            self = .extraExtraLarge
        case .extraExtraExtraLarge:
            self = .extraExtraExtraLarge
        case .accessibilityMedium:
            self = .accessibilityMedium
        case .accessibilityLarge:
            self = .accessibilityLarge
        case .accessibilityExtraLarge:
            self = .accessibilityExtraLarge
        case .accessibilityExtraExtraLarge:
            self = .accessibilityExtraExtraLarge
        case .accessibilityExtraExtraExtraLarge:
            self = .accessibilityExtraExtraExtraLarge
        @unknown default:
            self = .large
        }
    }
}

extension ContentSizeCategory {
    public var alx_isAccessibilityCategory: Bool {
        if #available(iOS 13.4, *) {
            return isAccessibilityCategory
        } else {
            return UIContentSizeCategory(self).isAccessibilityCategory
        }
    }
}
