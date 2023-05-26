//
//  CameraViewModelProtocol.swift
//  MVVM
//
//  Created by Роман Исламов on 26.05.2023.
//
import UIKit
protocol CameraViewModelProtocol {
    var isFlashEnabled: Bool { get set}
    var isLivePhotoEnabled: Bool { get set }
    var isWideScreenAvilable: Bool { get }
    var isWideScreenEnabled: Bool { get set }
    var isCameraFlipAvailable: Bool { get }
    
    
    func getAvailableCameraModes() -> [CameraMode]
    func gerRecentImage() -> UIImage?
}
