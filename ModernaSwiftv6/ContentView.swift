//
//  ContentView.swift
//  ModernaSwiftv6
//
//  Created by BillU on 2024-11-06.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var allshopping: [ShopThing]

    
    @State var addName = ""
    @State var addAmount = ""

    
    
    var body: some View {
        NavigationSplitView {
            VStack {
                TextField("Name", text: $addName)
                TextField("Amount", text: $addAmount)
                Button(action: addItem) {
                    Text("Add")
                }
                
                List {
                    ForEach(allshopping) { item in
                        NavigationLink {
                            VStack {
                                Text("Item at \(item.name)")
                                Button(item.bought ? "X" : "O") {
                                    item.bought.toggle()
                                }

                            }
                        } label: {
                            HStack {
                                Text("Köp \(item.amount) st \(item.name)")
                                
                                Text(item.bought ? "BOUGHT" : "NOT BOUGHT")
                                
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            //let newItem = Item(timestamp: Date())
            //modelContext.insert(newItem)
            
            let amount = Int(addAmount)
            if(amount == nil) {
                return
            }
            
            let newShoppingItem = ShopThing(name: addName, amount: amount!, bought: false)
            modelContext.insert(newShoppingItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        
        withAnimation {
            for index in offsets {
                modelContext.delete(allshopping[index])
            }
        }
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ShopThing.self, inMemory: true)
}
