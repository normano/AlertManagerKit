//
//  CustomAlertButton.swift
//  
//
//  Created by Alex Nagy on 07.01.2021.
//

import SwiftUI

public struct CustomAlertButton {

    public enum Variant {
        case cancel
        case regular
    }

    public let content: AnyView
    public let action: () -> Void
    public let type: Variant
    public let isDisabled: Bool

    public var isCancel: Bool {
        type == .cancel
    }

    public static func cancel<Content: View>(@ViewBuilder content: @escaping () -> Content) -> CustomAlertButton {
        CustomAlertButton(content: content, action: { /* close */ }, type: .cancel)
    }

    public static func regular<Content: View>(@ViewBuilder content: @escaping () -> Content,
        action: @escaping () -> Void, isDisabled: Bool = false) -> CustomAlertButton {
        CustomAlertButton(content: content, action: action, type: .regular, isDisabled: isDisabled)
    }

    public init<Content: View>(@ViewBuilder content: @escaping () -> Content, action: @escaping () -> Void, type: Variant, isDisabled: Bool = false) {
        self.content = AnyView(content())
        self.type = type
        self.action = action
        self.isDisabled = isDisabled
    }
}
