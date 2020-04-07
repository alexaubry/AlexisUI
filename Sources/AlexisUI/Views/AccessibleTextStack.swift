import SwiftUI

public struct AccessibleTextStack<Content: View>: View {
    let content: Content
    let horizontalSpacing: CGFloat?
    let verticalSpacing: CGFloat?
    @Environment(\.sizeCategory) var sizeCategory

    public init(horizontalSpacing: CGFloat? = nil, verticalSpacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Group {
            if sizeCategory.alx_isAccessibilityCategory {
                VStack(alignment: .leading, spacing: verticalSpacing) {
                    content
                }
            } else {
                HStack(alignment: .firstTextBaseline, spacing: horizontalSpacing) {
                    content
                }
            }
        }
    }
}

