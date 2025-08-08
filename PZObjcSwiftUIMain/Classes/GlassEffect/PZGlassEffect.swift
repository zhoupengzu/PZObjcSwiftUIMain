//
//  PZGlassEffect.swift
//  PZObjcSwiftUIHome
//
//  Created by admin on 2025/8/8.
//

import SwiftUI

@available(iOS 14.0, *)
struct PZGlassEffect: View {
    @Namespace var namespace
    @Namespace var otherNamespace
    @State var expanded = false
    var body: some View {
        if #available(iOS 26.0, *) {
            Text("Hello, World!")
                .padding(40)
                .glassEffect(.regular.interactive())
            GlassEffectContainer(spacing: 20.0) {
                HStack(spacing: 40.0) {
                    Image(systemName: "scribble.variable")
                        .frame(width: 80.0, height: 80.0)
                        .font(.system(size: 36))
                        .glassEffect()
                        .glassEffectID("Pensil", in: namespace)


                    if expanded {
                        Image(systemName: "eraser.fill")
                            .frame(width: 80.0, height: 80.0)
                            .font(.system(size: 36))
                            .glassEffect()
                            .glassEffectID("Eraser", in: namespace)
                    }

                        // An `offset` shows how Liquid Glass effects react to each other in a container.
                        // Use animations and components appearing and disappearing to obtain effects that look purposeful.
//                        .offset(x: -40.0, y: 0.0)
                }
                Button("expanded") {
                    withAnimation(.easeInOut(duration: 2)) {
                        expanded.toggle()
                    }
                }
                .buttonStyle(.glass)
            }
        }
    }
}

@objcMembers
public class PZGlassEffectSwiftController:NSObject {
    public static func createController() -> UIViewController {
        if #available(iOS 14.0, *) {
            return UIHostingController(rootView: PZGlassEffect())
        } else {
            // Fallback on earlier versions
            return UIViewController()
        }
    }
}

#Preview {
    if #available(iOS 14.0, *) {
        PZGlassEffect()
    } else {
        // Fallback on earlier versions
    }
}
