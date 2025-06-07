//
//  ContentView.swift
//  ImagesSUI
//
//  Created by Ángel González on 06/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showPicker = false
    @State private var showCamera = false
    @State private var showSourceChoice = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var image: UIImage?

        var body: some View {
            VStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                } else {
                    Text("No se ha tomado ninguna foto")
                        .foregroundColor(.cyan)
                }

                Button("Tomar Foto") {
                    showSourceChoice = true
                }
                .padding()
                .confirmationDialog("Selecciona una fuente", isPresented: $showSourceChoice) {
                                Button("Cámara") {
                                    sourceType = .camera
                                    showPicker = true
                                }
                                Button("Galería") {
                                    sourceType = .photoLibrary
                                    showPicker = true
                                }
                                Button("Cancelar", role: .cancel) {}
                            }
                            .sheet(isPresented: $showPicker) {
                                ImagePicker(sourceType: sourceType, selectedImage: $image)
                            }
            }
            .padding()
        }
}

#Preview {
    ContentView()
}
