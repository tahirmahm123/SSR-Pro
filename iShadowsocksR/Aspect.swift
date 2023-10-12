//
//  Aspect.swift
//  iShadowsocksR
//
//  Created by Tahir M. on 11/10/2023.
//  Copyright © 2023 DigitalD.Tech. All rights reserved.
//

import Foundation

struct Aspect {
    
    
    
}

public enum AspectOptions {
    case before
    case after
    case instead
}

public extension NSObject {
    
    class func aspectHook(_ originalSelector: Selector, swizzledSelector: Selector, options: AspectOptions = .instead) {
        let originalMethod = class_getInstanceMethod(self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        
        let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(self, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!);
        }
    }
    
}

