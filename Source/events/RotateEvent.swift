open class RotateEvent: Event {

    public let angle: Double

    init(node: MacawNode, angle: Double) {
        self.angle = angle
        super.init(node: node)
    }

}
