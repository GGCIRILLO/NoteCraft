//
//  NoteCraftApp.swift
//  NoteCraft
//
//  Created by Luigi Cirillo on 05/12/23.
//

import SwiftUI
import SwiftData

@main
class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    @Environment(\.modelContext) var context //has methods like save, delete etc

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow()
        self.window = window
        window.rootViewController = UIHostingController(rootView: ContentView().modelContainer(for: Note.self))
        window.makeKeyAndVisible()
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        do {
            print("I'm in \n")
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let importedNote = try decoder.decode(Note.self, from: data)
            
            print(importedNote.tag!)
            
            
            let newItem = Note(timestamp: importedNote.timestamp!, image: importedNote.image!, tag: importedNote.tag!)
            //context.insert(newItem)
        } catch {
            print("Unable to load data: \(error)")
        }
        
        return true
    }
    

    
}

 struct NoteCraftApp: App {
     @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate //handling file opening


    var body: some Scene {
        WindowGroup {
            ContentView()
        }
     }
}
