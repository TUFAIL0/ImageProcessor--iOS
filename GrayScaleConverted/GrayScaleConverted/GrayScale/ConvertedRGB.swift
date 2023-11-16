import Foundation
import UIKit
import SwiftUI
//Conver RGV VAlue in Gray Scale Value
class GrayscaleConverter {
    static func convertToGrayscale(_ result: [[(red: UInt8, green: UInt8, blue: UInt8)]]) -> [[UInt8]] {
        var grayscaleResult: [[UInt8]] = []
        for row in result {
            var grayscaleRow: [UInt8] = []
            for pixel in row {
                let red = CGFloat(pixel.red)
                let green = CGFloat(pixel.green)
                let blue = CGFloat(pixel.blue)

                let grayscale = UInt8(0.299 * red + 0.587 * green + 0.114 * blue)

                grayscaleRow.append(grayscale)
            }
            grayscaleResult.append(grayscaleRow)
        }
        return grayscaleResult
    }
    
    static func createImageFromGrayscale(result: [[UInt8]]) -> UIImage? {
        let width = result[0].count
        let height = result.count

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

        for y in 0..<height {
            for x in 0..<width {
                let pixelIndex = y * width + x
                grayscalePixelData[pixelIndex] = result[y][x]
            }
        }

        if let grayscaleCGImage = context?.makeImage() {
            return UIImage(cgImage: grayscaleCGImage)
        }

        print("Error creating image from grayscale data.")
        return nil
    }
}

