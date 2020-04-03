//
//  GifCell.swift
//  GiphySearchIOS
//
//  Created by Henry Calderon on 4/1/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit
class GifCell: UITableViewCell {
    ///GIF to be displayed
    var gif: Gif?
    ///Image view to Contain our gif
    var gifView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Make sure cell has gif object
        if gif != nil {
            // Grab gif from gif object and display it inside image view
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
            addSubview(gifView)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
