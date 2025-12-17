//
//  ContentView.swift
//  Gross
//
//  Created by Student on 16/12/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // Used to perform CRUD operations
     @Environment(\.modelContext) private var modelContext
     
     
     @Query private var items: [Item]
    var body: some View {
        NavigationStack{
            
            List{
                ForEach(items) { item in
                    Text(item.title)
                        .swipeActions{
                                Button("Delete", role: .destructive){
                                                        modelContext.delete(item)
                                                    }
                                                }
                }
            }
            .navigationTitle("Grocery list")
            .toolbar{
                            ToolbarItem(placement: .topBarTrailing){
                                Button{
                                    // Add button action here
                                } label:{
                                    Image(systemName: "carrot.fill")
                                        .imageScale(.large)
                                }
                            }
                            
                        }
           
            .overlay{
                        if items.isEmpty {
                                    ContentUnavailableView(
                                        "Empty cart",
                                        systemImage: "plus.circle.fill",
                                        description: Text("Add some items")
                                    )
                                }
                        }
        }
    }
}
#Preview("Second list"){
    return ContentView()
}
#Preview("First list") {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
