//
//  ContentView.swift
//  Neumorphic
//
//  Created by mohammad yasir on 03/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var tap = false
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        VStack {
            HStack {
                topButton(systemName: "square.and.arrow.up")
                Spacer()
                Text("PLAYING NOW")
                    .foregroundColor(Color.gray)
                    .fontWeight(.semibold)
                Spacer()
                topButton(systemName: "pencil")
            }
            .padding()
            
            VStack {
                Image("image2")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 250, height:250)
                    .overlay(RoundedRectangle(cornerRadius: 250)
                                .stroke(Color(#colorLiteral(red: 0.8775726651, green: 0.9143450303, blue: 0.9729609983, alpha: 1)), lineWidth: 6))
                    .shadow(radius: 40)
                
            }
            
            ListView()
            
            
            
            Spacer()
        }
        .padding(.top , 50)
        .frame(maxWidth : .infinity , maxHeight: .infinity)
        .background(Color(#colorLiteral(red: 0.9021994472, green: 0.9361426234, blue: 0.993503511, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct topButton: View {
    
    var systemName = "square.and.arrow.up"
    
    var body: some View {
        VStack{
            Image(systemName: systemName)
                .font(Font.system(.subheadline))
                .frame(width: 50, height: 50)
                .background(
                    ZStack {
                        Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1))
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .padding(2)
                            .blur(radius: 2)
                    }
                )
                .clipShape(RoundedRectangle(cornerRadius: 40, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1)), radius: 20, x: 10, y: 10)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6741759418)), radius: 4, x: 3, y: 3)
        }
    }
}

struct ListView: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        VStack {
            List{
                ForEach(store.updates) { update in
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text(update.title)
                                    .font(.system(size: 20, weight: .semibold))
                                Text(update.subTitle)
                                    .font(.system(size: 15, weight: .light))
                            }
                            Spacer()
                            Image(systemName: "play.fill")
                                .font(Font.system(.title))
                                .foregroundColor(Color(#colorLiteral(red: 0.9999158978, green: 1, blue: 0.9998719096, alpha: 1)))
                                .shadow(radius: 10)
                        }
                        .padding()
                    }
                    .frame(width: 350, height: 60)
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1))
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                                )
                                .padding(2)
                                .blur(radius: 2)
                        }
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: Color(#colorLiteral(red: 0.7531503439, green: 0.8171861172, blue: 0.9221240282, alpha: 1)), radius: 20, x: 10, y: 10)
                    .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -10, y: -10)
                    .listRowBackground(Color(#colorLiteral(red: 0.8775726651, green: 0.9143450303, blue: 0.9729609983, alpha: 1)))
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top , 20)
        }
    }
}

struct Update : Identifiable {
    var id = UUID()
    var title : String
    var subTitle : String
}

let updateData = [
    Update(title: "Helix", subTitle: "Flume"),
    Update(title: "Never Be Like You", subTitle: "Unknown"),
    Update(title: "Say It", subTitle: "Tim"),
    Update(title: "Thats You !", subTitle: "Subweb"),
    Update(title: "Yo Maaan", subTitle: "Tokenn"),
    Update(title: "Martin Me", subTitle: "Mimn")
]

