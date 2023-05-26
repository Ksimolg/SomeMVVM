//
//  CameraViewModel.swift
//  MVVM
//
//  Created by Роман Исламов on 26.05.2023.
//
import AVFoundation
import Foundation
import UIKit

class CameraViewModel {
    let userDefaults = UserDefaults.standard
    let dbManager = DBService()
}



//M CameraViewModelProtocol

extension CameraViewModel: CameraViewModelProtocol {
    var isFlashEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsFlashEnabled")
        }
        set {
            userDefaults.set(newValue, forKey:"IsFlashEnabled")
        }
    }
    
    var isLivePhotoEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsLivePhotoEnabled")
        }
        set {
            userDefaults.set(newValue, forKey:"IsLivePhotoEnabled")

        }
    }
    
    var isWideScreenAvilable: Bool {
        if let _ = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back){
            return true
        } else {
            return false
        }
    }
    
    var isWideScreenEnabled: Bool {
        get {
            userDefaults.bool(forKey: "IsWideScreenEnabled")
        }
        set {
            userDefaults.set(newValue, forKey: "IsWideScreenEnabled")
        }
    }
    
    var isCameraFlipAvailable: Bool {
        if #available(iOS 3.0, *) {
            return true
        } else {
            return false
        }
    }
    
    func getAvailableCameraModes() -> [CameraMode] {
        var modes = [CameraMode]()
        modes.append(.photo)
        modes.append(.video)
        if let _ = AVCaptureDevice.default(.builtInDualWideCamera, for: .video, position: .back) {
            modes.append(.portrait)
        }
        if #available(iOS 11.0, *) {
            modes.append(.slowMo)
        }
        modes.append(.panorama)
        return modes
    }
    
    func gerRecentImage() -> UIImage? {
        dbManager.getRecentImage()
    }
    
}
