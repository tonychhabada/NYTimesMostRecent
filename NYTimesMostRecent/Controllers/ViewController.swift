//
//  ViewController.swift
//  NYTimesMostRecent
//
//  Created by Tony Chhabada on 17/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
 let viewModel = MostRecentViewModel()
    var url:String!

    override func viewDidLoad() {
        super.viewDidLoad()
         Utilities.sharedInstance.showProgresDialog(message: "Loading", view: self.view)
            viewModel.fetchArticles(completionHandler:{ result in
                Utilities.sharedInstance.hideProgressDialog(view: self.view)
                self.tableView.reloadData()
            })
        // Do any additional setup after loading the view, typically from a nib.
    }

  

}

extension ViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MostRecentTableViewCell
        let article = viewModel.articles[indexPath.row]
        cell.configureCell(title: article.title, author: article.byline,publishedDate: article.published_date)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles[indexPath.row]
        
        url = article.url
        self.performSegue(withIdentifier: "newsdetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "newsdetail") {
            var viewController = segue.destination as! NewsDetailViewController
            viewController.url = url
        }
    }
    
    
}

