//
//  ReplaceRGBwithGrayScale.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 10/11/23.
//

import Foundation
import SwiftUI
//Create a GraySCale Image
class ImageCreator {
    static func createImageFromGrayscale(grayscaleData: [[UInt8]]) -> UIImage? {
        let width = grayscaleData[0].count
        let height = grayscaleData.count

        // Create a bitmap context for the grayscale image
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bytesPerRow = width
        var grayscalePixelData = [UInt8](repeating: 0, count: width * height)

        let context = CGContext(data: &grayscalePixelData,
                                width: width,
                                height: height,
                                bitsPerComponent: 8,
                                bytesPerRow: bytesPerRow,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.none.rawValue)

        // Copy grayscale values to the bitmap context
        for y in 0..<height {
            for x in 0..<width {
                let pixelIndex = y * width + x
                grayscalePixelData[pixelIndex] = grayscaleData[y][x]
            }
        }

        // Create a CGImage from the grayscale pixel data
        if let grayscaleCGImage = context?.makeImage() {
            let newImage = UIImage(cgImage: grayscaleCGImage)
            return newImage
        }

        print("Error creating image from grayscale data.")
        return nil
    }
}
