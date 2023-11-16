//
//  File.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 14/11/23.
//

import Foundation
import SwiftUI
class ConvertToCoolEffect {
    static func applyCoolEffect(image: UIImage) -> UIImage? {
        guard let ciImage = CIImage(image: image) else {
            return nil
        }

        let colorFilter = CIFilter(name: "CITemperatureAndTint")
        colorFilter?.setValue(ciImage, forKey: kCIInputImageKey)

      
        let inputTargetNeutral = CIVector(x: 6000, y: 100)
        
        colorFilter?.setValue(inputTargetNeutral, forKey: "inputTargetNeutral")

        // Apply contrast adjustment
        let contrastFilter = CIFilter(name: "CIColorControls")!
        contrastFilter.setValue(colorFilter?.outputImage, forKey: kCIInputImageKey)
        contrastFilter.setValue(1.0, forKey: kCIInputContrastKey)

        // Get the output image from the filters
        guard let outputImage = contrastFilter.outputImage else {
            return nil
        }

        // Convert CIImage to UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
            return nil
        }

        return UIImage(cgImage: cgImage)
    }
}
