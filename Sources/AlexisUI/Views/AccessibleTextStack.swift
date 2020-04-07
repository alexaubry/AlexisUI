import SwiftUI

public struct AccessibleTextStack<Content: View>: View {
    let content: Content
    @Environment(\.sizeCategory) var sizeCategory

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        Group {
            if sizeCategory.alx_isAccessibilityCategory {
                VStack(alignment: .leading) {
                    content
                }
            } else {
                HStack(alignment: .firstTextBaseline) {
                    content
                }
            }
        }
    }
}

