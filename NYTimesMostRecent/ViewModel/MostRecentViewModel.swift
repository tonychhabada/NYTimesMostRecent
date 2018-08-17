//
//  MostRecentViewModel.swift
//  NYTimesMostRecent
//
//  Created by Tony Chhabada on 17/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import Foundation
import SwiftyJSON
class MostRecentViewModel{
    var articles = [Articles]()

    func fetchArticles(completionHandler: @escaping (String) -> Void){
        HttpConections.sharedInstance.submitGetRequest( url: AllUrls.articleUrl+AllUrls.apiKey, completionHandler: { result in
            let articleObject = Articles();
            self.articles = articleObject.parseJson(result: result)
            completionHandler(result);
        })
        
    }
}
