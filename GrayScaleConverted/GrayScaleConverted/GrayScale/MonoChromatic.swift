//
//  MonoChromatic.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 14/11/23.
//

import Foundation
import UIKit
import CoreImage

class MonoChromatic {
    static func convertToMonochrome(image: UIImage) -> UIImage? {
        guard let ciImage = CIImage(image: image) else {
            return nil
        }

        // Apply a filter to convert the image to monochrome
        let filter = CIFilter(name: "CIColorControls", parameters: [
            kCIInputImageKey: ciImage,
            kCIInputSaturationKey: 1.5
        ])

        // Get the output image from the filter
        guard let outputImage = filter?.outputImage else {
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


