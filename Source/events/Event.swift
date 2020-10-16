//
//  Event.swift
//  Pods
//
//  Created by Yuri Strot on 12/20/16.
//
//

import Foundation

open class Event {

    public weak var node: MacawNode?

    var consumed = false

    init(node: MacawNode) {
        self.node = node
    }

    public func consume() {
        consumed = true
    }
}
