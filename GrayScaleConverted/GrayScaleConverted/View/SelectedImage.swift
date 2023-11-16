//
//  SelectedImage.swift
//  GrayScaleConverted
//
//  Created by Tufail Ahmad on 15/11/23.
//

import SwiftUI
struct SelectedImageDetailView: View {
    @Binding var selectedImage: Image?

    var body: some View {
        VStack {
            // Display the detailed view of the selected image
            selectedImage ?? Image(systemName: "photo") // Use a default image or placeholder
                .resizable()
                .scaledToFit()
                .aspectRatio(contentMode: .fit) as! Image
        }
        .navigationBarTitle("", displayMode: .inline)
    }
}
