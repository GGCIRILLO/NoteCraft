//
//  ContentView.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @Query private var drawings : [DrawingModel]
    @State private var showSheet = false

    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
//                    } label: {
//                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
        VStack{
//            ForEach(drawings){ drawing in
//                Text(drawing.title)
//            }
        }
        .overlay(alignment: .bottomTrailing) {
            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: "square.and.pencil")
                    .font(.title)
                    .foregroundStyle(.black)
                    .padding()
                    .background(.orange)
                    .shadow(radius: 10)
                    .clipShape(Circle())
            })
        }
        .sheet(isPresented: $showSheet, content: {
            
        })
    }
// 
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
