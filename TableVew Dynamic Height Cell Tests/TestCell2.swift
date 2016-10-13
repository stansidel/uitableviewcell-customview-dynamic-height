//
//  TestCell2.swift
//  TableVew Dynamic Height Cell Tests
//
//  Created by Stanislav Sidelnikov on 10/13/16.
//  Copyright © 2016 Yandex. All rights reserved.
//

import UIKit

class TestCell2: UITableViewCell {

    override func awakeFromNib() {
        print("TestCell2 awakeFromNib")
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        print("TestCell2 layoutSubviews")
        super.layoutSubviews()
    }
    
    override func intrinsicContentSize() -> CGSize {
        print("TestCell2 intrinsicContentSize")
        return super.intrinsicContentSize()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
