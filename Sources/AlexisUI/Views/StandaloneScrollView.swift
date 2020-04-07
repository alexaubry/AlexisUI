import SwiftUI

/**
 * A scroll view that is meant to be used outside of a navigation stack and that provides its own status bar cover.
 */

public struct StandaloneScrollView<Content: View>: View {
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            ScrollView {
                content
            }

            GeometryReader { geometry in
                VStack {
                    BlurView(light: .light, dark: .dark)
                        .frame(width: geometry.size.width,
                               height: geometry.safeAreaInsets.top,
                               alignment: .top)

                    Spacer()
                }
            }.edgesIgnoringSafeArea(.all)
        }.background(Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all))
    }
}
