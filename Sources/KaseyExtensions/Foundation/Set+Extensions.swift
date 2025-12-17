import Foundation

extension Set {
    public init(@ArrayBuilder<Element> builder: () -> [Element]) {
        self = Set(builder())
    }
}
