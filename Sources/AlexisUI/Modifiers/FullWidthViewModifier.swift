import SwiftUI

/**
 * A modifier that makes the content full-screen.
 */

public struct FullWidthViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        HStack {
            Spacer(minLength: 0)
            content
            Spacer(minLength: 0)
        }
    }
}

extension View {
    /// Returns a modified view that takes the full available width of the screen.
    public func fullWidth() -> ModifiedContent<Self, FullWidthViewModifier> {
        modifier(FullWidthViewModifier())
    }
}
