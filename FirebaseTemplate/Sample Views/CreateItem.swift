//
//  ContentView.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import SwiftUI



struct CreateItem: View {
    @State var name: String = ""
    @State var price: String = ""
    @State var itemCreated = false
   // @State var TravelData: TravelModel = TravelModel(id: "", name: "London", budget: 1500.5, remainingBudget: 0.0, image: "https://firebasestorage.googleapis.com/v0/b/pro5-2020.appspot.com/o/6-2-shopping-bag-png-image-thumb.png?alt=media&token=98a67cdd-930a-4c1a-b89c-00784840719e")
    @State var TravelDatas: [TravelModel] = []
    @State var user: userModel = userModel(uid: "", email: "", firstname: "", lastname: "", phoneNumber: "", userType: "")
    var body: some View {
        NavigationView {
            VStack{
                ForEach(TravelDatas){ i in
                    Text("\(i.firstname)")
                }
                
                TextField("Name", text: $name)
                    .padding()
                TextField("price", text: $price)
                    .padding()
                Button("Create item", action: DeletePost)
                Spacer()
            }
            .padding()
            .navigationBarTitle("Create Item")
            .alert(isPresented: $itemCreated, content: createdItemAlert)
        }//.onAppear(perform: TravelGetPosts)
    }
    
    
    func DeletePost()  {
        Networking.DeleteItem(inCollection: "users/\(user.uid)/Post", withDocumentId: "8M1etkOxpKeGb03Auyut", success: {
            print("Deleted!")
        }) { (err) in
            print("error", err)
        }
    }
    
    func getOneDoc() {
        var id = user.uid
        Networking.getSingleDocument("users/\(id)") { (Travel: userModel) in
            self.user = Travel
            print("Single Doc", self.user)
        }
    }
    
//    func TravelGetPosts()  {
//        Networking.getListOf(COLLECTION_NAME: "users/\(id)/Post", success: { (Travel: [TravelModel]) in
//            self.TravelDatas = Travel
//            print("Travel Data = ", Travel)
//        }) { (error) in
//            print("Error!", error)
//        }
//    }
//
//    func TravelAddPost()  {
//        var id = UUID()
////        TravelData.id = "\(id)"
//        Networking.createItem(TravelData, inCollection: "Travel", withDocumentId: "\(id)") {
//            print("success document uploaded")
//        }
//    }
    
    
    func createItem()
    {
        let item = Item(name: self.name, price: Double(self.price)!)
        Networking.createItem(item, inCollection: "shaima") {
            self.itemCreated = true
        }
    }
    
    func createdItemAlert() -> Alert{
        Alert(title: Text("👏🏻"), message: Text("Item has been created successfully"), dismissButton: .default(Text("Done"), action: {
            //
        }))
    }
}

struct CreateItem_Previews: PreviewProvider {
    static var previews: some View {
        CreateItem()
    }
}
