//
//  AddNewNote.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import SwiftUI

struct AddNewNote: View {
    @Environment(\.modelContext) private var viewContext
    @Environment (\.isPresented) private var presentationMode
    
    @State private var canvasTitle = ""
    
    var body: some View {
            NavigationView{
                Form{
                    Section{
                        TextField("Canvas Title", text: $canvasTitle)
                    }
                }
                .navigationViewStyle(StackNavigationViewStyle())
                .navigationTitle(Text("Add New Canvas"))
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                }), trailing: Button(action: {
                    if !canvasTitle.isEmpty{
                        let drawing = Drawing(context: viewContext)
                        drawing.title = canvasTitle
                        drawing.id = UUID()
                        
                        do {
                            try viewContext.save()
                        }
                        catch{
                            print(error)
                        }
                        
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Save")
                }))
            }
        }
    }
}

#Preview {
    AddNewNote()
}
