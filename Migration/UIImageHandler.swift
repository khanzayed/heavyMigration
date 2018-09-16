//
//  UIImageHandler.swift
//  Migration
//
//  Created by Faraz Habib on 16/09/18.
//  Copyright © 2018 Faraz Habib. All rights reserved.
//

import Foundation
import UIKit

enum FileDirectoryName : String {
    case ProfileImages =  "ProfileImages"
    case ChatImages    =  "ChatImages"
    case ChatDocument  =  "ChatDocument"
}

class UIIImageHandler {
    
    static let shared = UIIImageHandler()
    
    let queue : DispatchQueue!
    
    private init() {
        queue = DispatchQueue(label: "UIIImageHandler")
    }
    
    private func getDocumentsDirectoryForProfiles() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        let dataPath = documentsDirectory.appendingPathComponent(FileDirectoryName.ProfileImages.rawValue)
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                print(error.localizedDescription)
                return nil
            }
        }
        
        return dataPath
    }
    
    private func getDocumentsDirectoryForChatThread(_ thread : String) -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        let additionalPath = "\(FileDirectoryName.ChatImages.rawValue)/\(thread)"
        let dataPath = documentsDirectory.appendingPathComponent(additionalPath)
        if !FileManager.default.fileExists(atPath: dataPath.path) {
            do {
                try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: false, attributes: nil)
            } catch let error {
                print(error.localizedDescription)
                return nil
            }
        }
        return dataPath
    }
    
    internal func getProfileImageFromDocumentsDirectory(_ fileName : String, completion : (UIImage?) -> Void) {
        queue.sync {
            guard let path = getDocumentsDirectoryForProfiles() else {
                return
            }
            
            let filePath = path.appendingPathComponent("\(fileName).png")
            if FileManager.default.fileExists(atPath: filePath.path), let image = UIImage(contentsOfFile: filePath.path) {
                completion(image)
            } else {
                print("File do not exist")
                completion(nil)
            }
        }
    }
    
    internal func getChatImageFromDocumentsDirectory(_ thread : String, fileName : String, completion : (UIImage?) -> Void) {
        queue.sync {
            guard let path = getDocumentsDirectoryForChatThread(thread) else {
                return
            }
            
            let filePath = path.appendingPathComponent("\(fileName).png")
            if FileManager.default.fileExists(atPath: filePath.path), let image = UIImage(contentsOfFile: filePath.path) {
                completion(image)
            } else {
                print("File do not exist")
                completion(nil)
            }
        }
    }
    
    internal func saveImageToDocumentDirectory(_ image : UIImage, forDirectoryName : FileDirectoryName, chatThread : String? = nil, fileName : String) {
        queue.sync {
            switch forDirectoryName {
            case .ChatImages:
                guard let thread = chatThread, let path = getDocumentsDirectoryForChatThread(thread) else {
                    return
                }
                
                if let data = UIImagePNGRepresentation(image) {
                    let filename = path.appendingPathComponent("\(fileName).png")
                    try? data.write(to: filename)
                }
            case .ProfileImages:
                guard let path = getDocumentsDirectoryForProfiles() else {
                    return
                }
                
                if let data = UIImagePNGRepresentation(image) {
                    let filename = path.appendingPathComponent("\(fileName).png")
                    do {
                        try data.write(to: filename)
                    } catch let error {
                        print(error.localizedDescription)
                    }
                }
                break
            case .ChatDocument:
                break
            }
        }
    }
    
    internal func removeProfileImageFromDocumentDirectory(_ fileName : String) {
        queue.sync {
            guard let path = getDocumentsDirectoryForProfiles() else {
                return
            }
            
            let filePath = path.appendingPathComponent("\(fileName).png")
            do {
                try FileManager.default.removeItem(at: filePath)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    internal func removeChatImages(_ thread : String) {
        queue.sync {
            guard let path = getDocumentsDirectoryForChatThread(thread) else {
                return
            }
            
            do {
                try FileManager.default.removeItem(at: path)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
