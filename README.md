# SearchKit

_Example_
``
NavigationView {
    ZStack(alignment: .top) {
        List(self.listData, id: \.self) { item in
            Text(item)
        }
        .offset(CGSize(width: 0, height: 48))
        SearchView(self.$searchText) {
            List { 
                Section(header: Text("Search Results")) {
                    ForEach(self.listData.filter({ searchText.isEmpty ? true : $0.contains(searchText) }), id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
    .navigationTitle(Text("Search Test"))
}
.navigationViewStyle(StackNavigationViewStyle())
``
