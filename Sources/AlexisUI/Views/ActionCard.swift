import SwiftUI

public struct ActionCard<Content: View>: View {
    public let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
        .            .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .foregroundColor(Color(.secondarySystemGroupedBackground))
        ).padding()
        .fullWidth()

    }
}
