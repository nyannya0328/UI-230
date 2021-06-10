//
//  UI_230_iOS_App.swift
//  UI-230(iOS)
//
//  Created by にゃんにゃん丸 on 2021/06/10.
//

import SwiftUI

@main
struct UI_230_iOS_App: App {
    var body: some Scene {
        #if os(macOS)
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        
    
        #else
        WindowGroup {
            ContentView()
        }
        
        #endif
    }
}

#if os(macOS)
extension NSTextField{
    
    open override var focusRingType: NSFocusRingType{
        
        get{.none}
        set{}
        
        
    }
}
#endif
