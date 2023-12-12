//
//  ContentView.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import SwiftUI
import SwiftData

//Model: Data
//Container: Where things get saved
//Context: how you interact


struct ContentView: View {
    @Environment(\.modelContext) var context //has methods like save, delete etc
    @State var noteTag = ""
    
    @Query var notes: [Note]
    
    //Testing per convertire png to data
    let testingImage = UIImage(named: "testData")
    
    
    var body: some View {
        NavigationView{
            VStack{
                TextField("Add Item", text: $noteTag).textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Save"){
                    guard !noteTag.isEmpty else {
                        return
                    }
                    let newItem = Note(timestamp: Date.now, image: (testingImage?.pngData())!, tag: noteTag)
                    context.insert(newItem)
                    noteTag = ""
                }
                
                Button("Save Imported Note"){
                    context.insert(sharedNote)
                }
                List{
                    ForEach(notes) { note in
                        VStack{
                            Text(note.tag!)
                            //data to image conversiin
                            let convUiImage = UIImage(data: note.image!)
                            Image(uiImage: convUiImage!)
                           
                          ShareLink(
                                item: note,
                                preview: SharePreview(note.tag!,
                                                      image:  Image(uiImage: UIImage(data: note.image!)!)))
                            
                        }
 
 
                        
                        
                    }
                   
                }.overlay {
                    if notes.isEmpty{
                        Text("Nothing")
                    }
                }
            }
        }.navigationTitle("Notes")
    }
}

#Preview {
    ContentView()
}
