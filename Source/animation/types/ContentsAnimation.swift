internal class ContentsAnimation: AnimationImpl<[MacawNode]> {

    init(animatedGroup: Group, valueFunc: @escaping (Double) -> [MacawNode], animationDuration: Double, delay: Double = 0.0, autostart: Bool = false, fps: UInt = 30) {

        super.init(observableValue: animatedGroup.contentsVar, valueFunc: valueFunc, animationDuration: animationDuration, delay: delay, fps: fps)
        type = .contents
        node = animatedGroup

        if autostart {
            self.play()
        }
    }

    init(animatedGroup: Group, factory: @escaping (() -> ((Double) -> [MacawNode])), animationDuration: Double, delay: Double = 0.0, autostart: Bool = false, fps: UInt = 30) {
        super.init(observableValue: animatedGroup.contentsVar, factory: factory, animationDuration: animationDuration, delay: delay, fps: fps)
        type = .contents
        node = animatedGroup

        if autostart {
            self.play()
        }
    }

    open override func reverse() -> Animation {
        let factory = { () -> (Double) -> [MacawNode] in
            let original = self.timeFactory()
            return { (t: Double) -> [MacawNode] in
                original(1.0 - t)
            }
        }

        let reversedAnimation = ContentsAnimation(animatedGroup: node as! Group,
                                                  factory: factory, animationDuration: duration, fps: logicalFps)
        reversedAnimation.progress = progress
        reversedAnimation.completion = completion

        return reversedAnimation
    }
}

public extension AnimatableVariable where T: ContentsInterpolation {

    func animation(_ f: @escaping (Double) -> [MacawNode]) -> Animation {
        let group = node! as! Group
        return ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: 1.0, delay: 0.0, autostart: false)
    }

    func animation(_ f: @escaping ((Double) -> [MacawNode]), during: Double = 1.0, delay: Double = 0.0) -> Animation {
        let group = node! as! Group
        return ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: during, delay: delay, autostart: false)
    }

    func animation(during: Double = 1.0, delay: Double = 0.0, _ f: @escaping ((Double) -> [MacawNode])) -> Animation {
        let group = node! as! Group
        return ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: during, delay: delay, autostart: false)
    }

    func animate(_ f: @escaping (Double) -> [MacawNode]) {
        let group = node! as! Group
        _ = ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: 1.0, delay: 0.0, autostart: true)
    }

    func animate(_ f: @escaping ((Double) -> [MacawNode]), during: Double = 1.0, delay: Double = 0.0) {
        let group = node! as! Group
        _ = ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: during, delay: delay, autostart: true)
    }

    func animate(during: Double = 1.0, delay: Double = 0.0, _ f: @escaping ((Double) -> [MacawNode])) {
        let group = node! as! Group
        _ = ContentsAnimation(animatedGroup: group, valueFunc: f, animationDuration: during, delay: delay, autostart: true)
    }
}
