import SwiftUI

public extension View {
    /// Hides the rendered toolbar title while keeping `navigationTitle`
    /// intact for the back-button long-press menu.
    func toolbarTitleHidden(_ hidden: Bool = true) -> some View {
        modifier(HiddenTitleModifier(hidden: hidden))
    }
}

private struct HiddenTitleModifier: ViewModifier {
    let hidden: Bool

    func body(content: Content) -> some View {
        if hidden {
            #if os(iOS)
            if #available(iOS 26.0, *) {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .title) {
                            Color.clear
                                .frame(width: 0, height: 0)
                                .accessibilityHidden(true)
                        }
                    }
            } else {
                content
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Color.clear
                                .frame(width: 0, height: 0)
                                .accessibilityHidden(true)
                        }
                    }
            }
            #else
            content.toolbar {
                ToolbarItem(placement: .principal) {
                    Color.clear
                        .frame(width: 0, height: 0)
                        .accessibilityHidden(true)
                }
            }
            #endif
        } else {
            content
        }
    }
}
