//
//  View 5.swift
//  profile attempt 11
//
//  Created by razan on 04/12/2023.
//


import SwiftUI
import AVFoundation

struct CameraView: View {
    @State private var cameraAuthorizationStatus: AVAuthorizationStatus = .notDetermined
    @State private var isShowingCamera = false

    var body: some View {
        NavigationView {
            VStack {
                CameraAuthorizationView(cameraAuthorizationStatus: $cameraAuthorizationStatus)

                Button(action: {
                    requestCameraAccess()
                }) {
                    Text("Open Camera")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(cameraAuthorizationStatus != .notDetermined)
            }
        }
        .sheet(isPresented: $isShowingCamera) {
            CameraCaptureView(isPresented: $isShowingCamera)
        }
    }

    private func requestCameraAccess() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                cameraAuthorizationStatus = granted ? .authorized : .denied
                if granted {
                    isShowingCamera = true
                }
            }
        }
    }
}

struct CameraAuthorizationView: View {
    @Binding var cameraAuthorizationStatus: AVAuthorizationStatus

    var body: some View {
        VStack {
            Text("Camera Authorization Status: \(cameraAuthorizationStatus.rawValue)")
                .padding()
        }
        .onAppear {
            checkCameraAuthorization()
        }
    }

    private func checkCameraAuthorization() {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        cameraAuthorizationStatus = status
    }
}

struct CameraCaptureView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let cameraViewController = UIImagePickerController()
        cameraViewController.sourceType = .camera
        cameraViewController.delegate = context.coordinator
        return cameraViewController
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraCaptureView

        init(parent: CameraCaptureView) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // Handle the captured image or video here
            // You can implement this part based on your specific requirements

            parent.isPresented = false
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.isPresented = false
        }
    }
}


struct CloFitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
