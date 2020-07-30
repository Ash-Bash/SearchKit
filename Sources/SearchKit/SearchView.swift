//
//  SwiftUIView.swift
//  
//
//  Created by Ashley Chapman on 30/07/2020.
//

import SwiftUI

public struct SearchView<Content: View>: View {
    
    // Variables
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    
    @Binding var searchText: String
    var content: () -> Content
    
    public init(_ searchText: Binding<String>, content: @escaping () -> Content) {
        self._searchText = searchText
        self.content = content
    }
    
    @ViewBuilder public var searchResultsList: some View {
        self.content()
    }
    
    @ViewBuilder public var body: some View {
        VStack {
            #if os(iOS)
            if horizontalSizeClass == .compact {
                SearchBar(text: self.$searchText)
                    .padding(.top, 6)
            } else {
                SearchBar(text: self.$searchText)
                    .padding(.top, 6)
                    .frame(width: 400)
            }
            #elseif os(macOS)
            SearchBar(text: self.$searchText)
                .padding(.top, 6)
                .frame(width: 400)
            #endif
            if !self.searchText.isEmpty {
                #if os(iOS)
                if horizontalSizeClass == .compact {
                    self.searchResultsList
                } else {
                    self.searchResultsList
                        .frame(width: 400)
                        .cornerRadius(12)
                        .shadow(radius: 6)
                        .padding(.bottom, 48)
                }
                #elseif os(macOS)
                self.searchResultsList
                    .frame(width: 400)
                    .cornerRadius(12)
                    .shadow(radius: 6)
                    .padding(.bottom, 48)
                #endif
            } else {
                EmptyView()
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(.constant("")) {
            EmptyView()
        }
    }
}

