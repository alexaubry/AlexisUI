import SwiftUI

/**
 * A modifier that makes the content full-screen.
 */

public struct FullWidthViewModifier: ViewModifier {
    public func body(content: Content) -> some View {
        HStack {
            content
            Spacer()
        }
    }
}

extension View {
    /// Returns a modified view that takes the full available width of the screen.
    public func fullWidth() -> ModifiedContent<Self, FullWidthViewModifier> {
        modifier(FullWidthViewModifier())
    }
}
