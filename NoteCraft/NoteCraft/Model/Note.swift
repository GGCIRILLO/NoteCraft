//
//  note.swift
//  NoteCraft
//
//  Created by Renato Ferrara on 06/12/23.
//

import Foundation
import SwiftData
import CoreTransferable
import SwiftUI
import UniformTypeIdentifiers

@Model //swiftMacro gives implementations and is needed to define a model for SwiftData
class Note:  Codable{
    
    enum CodingKeys: CodingKey {
        case timestamp, image, tag
      }

    
     var timestamp: Date?
    
     var image: Data?
     
     var tag: String?
 
     init(timestamp: Date, image: Data, tag: String) {
        self.timestamp = timestamp
        self.image = image
        self.tag = tag    }
    
    //init for codable
    
    required init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: CodingKeys.self)
      self.timestamp = try container.decode(Date.self, forKey: .timestamp)
      self.image = try container.decode(Data.self, forKey: .image)
      self.tag = try container.decode(String.self, forKey: .tag)

    }
    
    func encode(to encoder: Encoder) throws {
      var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(timestamp, forKey: .timestamp)
         try container.encode(image, forKey: .image)
        try container.encode(tag, forKey: .tag)

    }
 
    func save() {
             if let context=self.modelContext {
                do {
                    print("I'm gonna try and save the data")
                    try context.save()
                }catch(let error) {
                    print("I found an errore \n")
                    print("error: \(error.localizedDescription)")
                }
            } else {
                print("modelContext is nil")
            }
        }
    
    
}


extension UTType {
    static let Note = UTType(exportedAs: "com.noteCraft")
}


 
extension Note : Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .Note)
        }
    
}


 
