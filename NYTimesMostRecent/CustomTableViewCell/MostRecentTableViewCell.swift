//
//  MostRecentTableViewCell.swift
//  NYTimesMostRecent
//
//  Created by Tony Chhabada on 17/08/18.
//  Copyright © 2018 Tony Chhabada. All rights reserved.
//

import UIKit

class MostRecentTableViewCell: UITableViewCell {

    @IBOutlet weak var lblPublishedDate: UILabel!
    @IBOutlet weak var lblBy: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    
    func configureCell(title:String,author:String,publishedDate:String){
        self.lblTitle.text = title
        self.lblBy.text = author
        self.lblPublishedDate.text = publishedDate
    }

}
