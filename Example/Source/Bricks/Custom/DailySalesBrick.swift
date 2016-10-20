
//
//  DailySalesBrick.swift
//  BrickKit
//
//  Created by Yusheng Yang on 9/20/16.
//  Copyright © 2016 Wayfair LLC. All rights reserved.
//

import Foundation
import BrickKit

class DailySalesBrick: Brick {
    let dataSource: DailySalesBrickDataSource
    
    init (_ identifier: String, width: BrickDimension = .Ratio(ratio: 1), height: BrickDimension = .Auto(estimate: .Fixed(size: 50)), backgroundColor: UIColor = UIColor.clearColor(), backgroundView: UIView? = nil, dataSource: DailySalesBrickDataSource) {
        self.dataSource = dataSource
        super.init(identifier, width: width, height: height, backgroundColor: backgroundColor, backgroundView: backgroundView)
    }
}


class DailySalesBrickCell: BrickCell, Bricklike {
    typealias BrickType = DailySalesBrick
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameButton: UIButton!
    
    override func updateContent() {
        super.updateContent()
        
        imageView.image = brick.dataSource.image(self)
        nameButton.setTitle(brick.dataSource.buttonTitle(self), forState: .Normal)
    }
}

protocol DailySalesBrickDataSource {
    func image(cell: DailySalesBrickCell) -> UIImage
    func buttonTitle(cell: DailySalesBrickCell) -> String
}

