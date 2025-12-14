import Combine
import SwiftUI

extension View {
    public func subscribeToUpdates(
        _ subscribeToUpdates: @escaping (_ subscriptions: inout Set<AnyCancellable>) -> Void
    ) -> some View {
        self.modifier(ViewSubscriptionsModifier(subscribeToUpdates: subscribeToUpdates))
    }
}

private struct ViewSubscriptionsModifier: ViewModifier {
    @State private var subscriptions: Set<AnyCancellable> = []
    let subscribeToUpdates: (_ subscriptions: inout Set<AnyCancellable>) -> Void

    func body(content: Content) -> some View {
        content
            .onViewDidLoad {
                subscriptions.removeAll()
                subscribeToUpdates(&self.subscriptions)
            }
    }
}
