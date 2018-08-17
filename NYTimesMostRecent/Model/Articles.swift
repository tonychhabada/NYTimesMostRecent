//
//  Articles.swift
//  NYTimesMostRecent
//
//  Created by Tony Chhabada on 17/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import Foundation
import SwiftyJSON

class Articles{
    var title:String!
    var url:String!
    var byline:String!
    var published_date:String!
    
    func parseJson(result:String) -> [Articles]{
        var articles = [Articles]()
        do{
            let data1 = result.data(using: .utf8)!
            let json =  try JSON(data: data1)
            let jsonArray = json["results"].array
            for resultItem in jsonArray! {
                let articleObject = Articles()
                articleObject.title = resultItem["title"].stringValue
                articleObject.url =  resultItem["url"].stringValue
                articleObject.byline = resultItem["byline"].stringValue
                articleObject.published_date = resultItem["published_date"].stringValue
                articles.append(articleObject)
            }
          
        }catch{
            print("test")
            
        }
    return articles
    }
}
