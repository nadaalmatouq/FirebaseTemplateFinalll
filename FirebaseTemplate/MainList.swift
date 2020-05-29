//
//  MainList.swift
//  ListProject
//
//
/* problems we've faced:
 
 *the image we want it to be a uiimage and not a string in our struct // hasan
 
 */
//
//

import SwiftUI

struct MainList: View {
    
    @EnvironmentObject var env: Env
    @Environment(\.presentationMode) var presentationMode
    @State var isEditTravel = false // this var to make the array edit not append new one
    @State var isEdit = false
    @State var isEditShopping = false
    @State var isEditCeleb = false
    var backgroungColor = "Background"
    @State var isWorkWillAdd = false
    @State var isWorkWillEditT = false
    @State var isWorkWillEditC = false
    @State var isWorkWillEditS = false
    @State var isWorkWillEdit = false   //DONT FORGET TO TOGGLE IT SO WHEN YOU COME BACK AFTER THE FIRST TIME ITS NOT ALWAYS TRUE
    @State var nameList = ""
    
    @State var currentShoppingList : ShoppingList = ShoppingList(lista: Lista(givenName: "", budget: "", id: "", type: "shopping", remaining: ""), id: "", listClothesAccessories: [], listFoodVegetables: [], listElectronicDevices: [], listOthers: [])
    @State var currentLista : Lista = Lista(givenName: "", budget: "", id: "", type: "", remaining: "")
    @State var currentCelebrationList : CelebrationList = CelebrationList(
        lista: Lista(givenName: "", budget: "", id: "", type: "celebration", remaining: ""), id: ""
        , gifts: [] , decoration: [] , clothesAccessories: [] , other: [])
    @State var currentListaCelebration : Lista = Lista(givenName: "", budget: "", id: "", type: "", remaining: "")
    @State var currentTravelList : TravelList = TravelList( lista: Lista(givenName: "", budget: "", id: "", type: "travel", remaining: "") , id: "", spendMoney: [], others: [], beforetraveling: [], aftertraveling: [])
    @State var currentListaTravel : Lista = Lista(givenName: "", budget: "", id: "", type: "", remaining: "")
    var body: some View {
     //   NavigationView{
            ZStack {
                //  Color(backgroungColor)
                Image("bac")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .blur(radius: 3)
                VStack{
                    Text("Listity")
                     .font(Font.custom("Futura Medium", size: 70))
                    .bold()
                        .foregroundColor(Color.white)
                    .shadow(radius: 5)
                    
                        
                        .offset(x: -70, y: 10)
                    
                    //Q@q.com
                    ZStack{
                        Color("Background")
                        .frame(width: 500, height: 600)
                            .offset(x: -40)
                        //  .opacity(0.8)
                        VStack(spacing: 10){
                            ScrollView(.vertical){
                                VStack{
                                    Text("Travel Lists")
                                        .foregroundColor(Color.black)
                                    .font(Font.custom("Futura", size: 30))
                                       // .font(.system(size:24))
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack{
                                            ForEach(self.env.alltravelLists, id: \.self){ i in
                                                VStack{
                                                    
                                                    
                                                    //                                                    if (i.picture! == UIImage(systemName: "camera.circle"))
                                                    //
                                                    //                                                    {
                                                    //                                                        //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
                                                    //                                                        Image("travelicon")
                                                    //                                                            .resizable()
                                                    //                                                            .frame(width: 130, height: 130)
                                                    //                                                            .cornerRadius(10)
                                                    //                                                            .shadow(radius: 10)
                                                    //
                                                    //
                                                    //                                                    }
                                                    //                                                    else{
                                                    //                                                        Image(uiImage: i.picture!)
                                                    //                                                            .resizable()
                                                    //                                                            .frame(width: 130, height: 130)
                                                    //                                                            .cornerRadius(10)
                                                    //                                                            .shadow(radius: 10)
                                                    //                                                    }
                                                    //{
                                                    ZStack{
                                                        Image("travelicon")
                                                        .resizable()
                                                        .scaledToFit()                                                         .cornerRadius(7)                                                       .frame(width: 130, height: 200)
                                                          
                                                                                                                                                                                                                                                                                      .shadow(radius: 5)
                                                    Text(i.lista.givenName)
                                                        .foregroundColor(Color.white)
                                                        .bold()
                                                        .font(.system(size:24))
                                                       
                                                      }
                                                }.onTapGesture {
                                                    self.isWorkWillEditT = true
                                                    self.currentTravelList = i
                                                    self.isEditTravel = true
                                                }.padding(.all, 20)
                                                
                                                
                                            }.sheet(isPresented: $isEditTravel) {
                                                TravelListDetails(isEdit: self.$isEditTravel, currentTravelList: self.$currentTravelList, currentLista: self.$currentListaTravel).environmentObject(self.env)
                                            }
                                        }.frame( height: 80, alignment: .center)
                                    }
                                    
                                }
                                
                                VStack{
                                    Text("Celebration Lists")
                                        .foregroundColor(Color.black)
                                      .font(Font.custom("Futura", size: 30))
                                      
                                    ScrollView(.horizontal, showsIndicators: false){
                                        HStack{
                                            ForEach(self.env.allCelebrationLists){ i in
                                                VStack{
                                                    
                                                    //                            if (i.picture! == UIImage(systemName: "camera.circle"))
                                                    //
                                                    //                            {
                                                    //                                //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
                                                    //                                Image("Celebrate")
                                                    //                                    .resizable()
                                                    //                                    .frame(width: 130, height: 130)
                                                    //                                    .cornerRadius(10)
                                                    //                                    .shadow(radius: 10)
                                                    //
                                                    //
                                                    //                            }
                                                    //                            else{
                                                    //
                                                    //                                Image(uiImage: i.picture!)
                                                    //                                    .resizable()
                                                    //                                    .frame(width: 130, height: 130)
                                                    //                                    .cornerRadius(10)
                                                    //                                    .shadow(radius: 10)
                                                    //
                                                    //                            }
                                                ZStack{
                                                    Image("celebrationicon")
                                                        .resizable()
                                                        .scaledToFit()
                                                        .cornerRadius(7)
                                                    .frame(width: 130, height: 130)
                                                   
                                                     .shadow(radius: 5)
                                                    Text(i.lista.givenName)
                                                        .foregroundColor(Color.white)
                                                        .bold()
                                                        .font(.system(size:24))
                                                        }
                                                }.padding(.all, 20)
                                                    .onTapGesture {
                                                    self.isWorkWillEditC = true
                                                    self.currentCelebrationList = i
                                                    self.isEditCeleb = true
                                                }
                                            }.sheet(isPresented: $isEditCeleb) {
                                                celebrationDetailsList(isEdit: self.$isEditCeleb, currentCelebrationList: self.$currentCelebrationList, currentLista: self.$currentListaCelebration).environmentObject(self.env)
                                            }
                                        }.frame( height: 80, alignment: .center)
                                    }
                                }
                                VStack{
                                                                  Text("Shopping Lists")
                                                                      .foregroundColor(Color.black)
                                                                    .font(Font.custom("Futura", size: 30))
                                                                    
                                                                  ScrollView(.horizontal, showsIndicators: false){
                                                                      HStack{
                                                                          ForEach(self.env.allShoppingLists){ i in
                                                                              VStack{
                                                                                  
                                                                                  //                            if (i.picture! == UIImage(systemName: "camera.circle"))
                                                                                  //
                                                                                  //                            {
                                                                                  //                                //Image(uiImage: UIImage(imageLiteralResourceName: "travelicon"))
                                                                                  //                                Image("Celebrate")
                                                                                  //                                    .resizable()
                                                                                  //                                    .frame(width: 130, height: 130)
                                                                                  //                                    .cornerRadius(10)
                                                                                  //                                    .shadow(radius: 10)
                                                                                  //
                                                                                  //
                                                                                  //                            }
                                                                                  //                            else{
                                                                                  //
                                                                                  //                                Image(uiImage: i.picture!)
                                                                                  //                                    .resizable()
                                                                                  //                                    .frame(width: 130, height: 130)
                                                                                  //                                    .cornerRadius(10)
                                                                                  //                                    .shadow(radius: 10)
                                                                                  //
                                                                                  //                            }
                                                                              ZStack{
                                                                                  Image("shoppingicon")
                                                                                      .resizable()
                                                                                      .scaledToFit()
                                                                                      .cornerRadius(7)
                                                                                  .frame(width: 130, height: 130)
                                                                                 
                                                                                   .shadow(radius: 5)
                                                                                  Text(i.lista.givenName)
                                                                                      .foregroundColor(Color.white)
                                                                                      .bold()
                                                                                      .font(.system(size:24))
                                                                                      }
                                                                              }.padding(.all, 20)
                                                                                  .onTapGesture {
                                                                                  self.isWorkWillEditS = true
                                                                                  self.currentShoppingList = i
                                                                                  self.isEditShopping = true
                                                                              }
                                                                          }.sheet(isPresented: $isEditShopping) {
                                                                              ShoppingListDetail(isEdit: self.$isEditShopping, currentShoppingList: self.$currentShoppingList, currentLista: self.$currentLista).environmentObject(self.env)
                                                                          }
                                                                      }.frame( height: 80, alignment: .center)
                                                                  }
                                                              }
                                
                            }
                            
                        }
                            .padding(.vertical)
                        .padding(.horizontal, 60)
                        
                    }
                    NavigationLink(destination: CreateNewList(isEdit: $isEdit, currentShoppingList: $currentShoppingList, currentLista: $currentLista, currentCelebrationList: $currentCelebrationList, currentTravelList: $currentTravelList).environmentObject(self.env), isActive:
                    self.$env.taskDone2){
                        HStack{
                            Image(systemName: "plus").imageScale(.large)
                                .font(.system(size: 20))
                                .foregroundColor(Color(.white))
                                .frame(width: 60, height: 60)
                                .background(Color("blue"))
                                .clipShape(Circle())
                                
                                .padding(.vertical,10)
                                .shadow(radius: 10)
                            .offset(x: -45)
                        }
                    }//.isDetailLink(self.env.taskDone)
                    //.onTapGesture {
                    //    self.env.taskDone2.toggle()
                    //}
                }.offset(y: -15)
                }
            .onAppear(){
                self.env.GetAllShoppingPosts()
                print("env data", self.env.allShoppingLists)
                self.env.GetAllCelebrationPosts()
                print("env data", self.env.allShoppingLists)
                self.env.GetAllTravelPosts()
                print("env data", self.env.allShoppingLists)
            }//.navigationBarTitle(Text("Listity"))
            .colorMultiply(Color(backgroungColor))
            .onAppear {
                //  self.GetAll3Posts()
                self.env.sheetT = false
                self.env.sheetC = false
                self.env.sheetS = false
            }
        
        .navigationBarBackButtonHidden(true)
        
    }
}

//struct MainList_Previews: PreviewProvider {
//static var previews: some View {
//MainList().environmentObject(Env())
//}
//}
