open class Pattern: Fill {

    public let content: MacawNode
    public let bounds: Rect
    public let userSpace: Bool

    public init(content: MacawNode, bounds: Rect, userSpace: Bool = false) {
        self.content = content
        self.bounds = bounds
        self.userSpace = userSpace
    }
}
