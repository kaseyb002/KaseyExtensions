import Foundation

@resultBuilder
internal enum ArrayBuilder<Element> {
    static func buildExpression(_ expression: Element) -> [Element] { [expression] }
    static func buildExpression(_ expression: [Element]) -> [Element] { expression }
    static func buildBlock(_ components: [Element]...) -> [Element] {
        components.flatMap { $0 }
    }
    static func buildOptional(_ component: [Element]?) -> [Element] {
        component ?? []
    }
    static func buildEither(first component: [Element]) -> [Element] { component }
    static func buildEither(second component: [Element]) -> [Element] { component }
    static func buildArray(_ components: [[Element]]) -> [Element] {
        components.flatMap { $0 }
    }
    static func buildLimitedAvailability(_ component: [Element]) -> [Element] { component }
    static func buildFinalResult(_ component: [Element]) -> [Element] { component }
}

extension Array {
    public init(@ArrayBuilder<Element> builder: () -> [Element]) {
        self = builder()
    }
}
