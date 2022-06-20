/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import SwiftUI

struct BuyLinks: View {
    @State var buyLinks = [BYLinks]()
    var body: some View {
       
      
            List(buyLinks, id:\.self){links in
                Picker("Buy", selection: $buyLinks){
                    Text(links.name)
                    Link("Buy Now",destination: URL(string: links.url)!)
                    
                    
                }
              
            }
            .task {
            await loadData()
            
            }
        .ignoresSafeArea(.all)
     
               
    
}
    func loadData()async {
         guard let url = URL(string: "https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=CgKtenC5a62LH7yhpdUCGj32mNHbjNKm") else {
             print("Invalid Url")
             return
         }

         do {
             let (data, _) = try await URLSession.shared.data(from: url)

             if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                 buyLinks = decodeResponse.results.lists[0].books[0].buyLinks

                 print(buyLinks)

             }


         }catch {
             print("Invalid data")
         }

     }
    
}
struct BuyLinks_Previews: PreviewProvider {
    static var previews: some View {
        BuyLinks()
    }
}



