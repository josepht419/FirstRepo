//
//  HomeView.swift
//  Munchin
//
//  Created by Joseph Torres on 4/30/21.
//

import SwiftUI



struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    
    
    var body: some View {
        VStack {
            
            
            HStack {
                Text("MunchinSafe")
                    .font(.system(size: 28, weight: .bold))
                
                Spacer()
                
                AvatarView(showProfile: $showProfile)
                
                Button(action: { self.showUpdate.toggle() }) {
                    Image(systemName: "suit.heart")
                        .renderingMode(.original)
                        .font(.system(size: 16, weight: .medium))
                        .frame(width: 36, height: 36)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                }
                .sheet(isPresented: $showUpdate) {
                    UpdateList()
                }
            }
            .padding(.horizontal)
            .padding(.top, 30)
            .padding(.leading, 14)
            
            
//            This is to make it scroll vertically
            
            ScrollView (showsIndicators: false) {
                VStack (spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            SectionView(section: item)
                                .rotation3DEffect(Angle(degrees:
                                       Double(geometry.frame(in:
                                       .global).minY) / 50),
                                       axis: (x: 10.0, y: 0.0, z: 0.0))
            
            //ScrollView (.horizontal, showsIndicators: false) {
                //HStack (spacing: 20) {
                    //ForEach(sectionData) { item in
                        //GeometryReader { geometry in
                            //SectionView(section: item)
                                //.rotation3DEffect(Angle(degrees:
                                       //Double(geometry.frame(in:
                                       //.global).minX - 30) / -20),
                                       //axis: (x: 0.0, y: 10.0, z: 0.0))
                                
                                
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            
            
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .top)
                    .cornerRadius(40)
                
            }
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.8), radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Find a Restaurant", text: "8 near me", logo: "updatedLogo", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))),
    Section(title: "Your Favorite Foods", text: "5 Favorited", logo: "logoN", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))),
    Section(title: "Work in Process", text: "No Idea", logo: "logoN", image: Image(uiImage: #imageLiteral(resourceName: "Card1")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
    
]



