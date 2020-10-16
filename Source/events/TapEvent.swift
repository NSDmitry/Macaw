open class TapEvent: Event {

    public let location: Point

    init(node: MacawNode, location: Point) {
        self.location = location
        super.init(node: node)
    }

}
