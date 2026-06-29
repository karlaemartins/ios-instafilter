//
//  FilterOption.swift
//  Project13-InstaFilter
//
//  Created by Karla E. Martins Fernandes on 24/06/26.
//

import Foundation


enum FilterOption: CaseIterable {
    case bumpDistortion
    case gaussianBlur
    case pixellate
    case sepia
    case twirlDistortion
    case unsharpMask
    case vignette
    
    
    var displayName: String {
        switch self {
        case .bumpDistortion:
            return "Bump Distortion"
            
        case .gaussianBlur:
            return "Gaussian Blur"
            
        case .pixellate:
            return "Pixellate"
            
        case .sepia:
            return "Sepia"
            
        case .twirlDistortion:
            return "Twirl Distortion"
            
        case .unsharpMask:
            return "Unsharp Mask"
            
        case .vignette:
            return "Vignette"
        }
    }
    
    var coreImageName: String {
        switch self {
        case .bumpDistortion:
            return "CIBumpDistortion"
            
        case .gaussianBlur:
            return "CIGaussianBlur"
            
        case .pixellate:
            return "CIPixellate"
            
        case .sepia:
            return "CISepiaTone"
            
        case .twirlDistortion:
            return "CITwirlDistortion"
            
        case .unsharpMask:
            return "CIUnsharpMask"
            
        case .vignette:
            return "CIVignette"
        }
    }
}
