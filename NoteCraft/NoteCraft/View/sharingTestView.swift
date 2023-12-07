//
//  sharingTestView.swift
//  NoteCraft
//
//  Created by Renato Ferrara on 07/12/23.
//
import SwiftUI
import Foundation
import CoreTransferable
 

struct sharingTestView: View {

    let image = Image("testData")
    let testingImage = UIImage(named: "testData")?.pngData()
    var note:Note{
        return  Note(timestamp: Date.now, image: testingImage!, tag: "Testing tag")
    }
    
    var body: some View {
        VStack{
            image
                .resizable()
                .scaledToFit()
            let convUiImage = UIImage(data: note.image!)
 
            ShareLink(item: note, preview: SharePreview(note.tag!, image:  Image(uiImage: convUiImage!)
 ))
        }
    }
}
