//
//  CustomView.swift
//  TableVew Dynamic Height Cell Tests
//
//  Created by Stanislav Sidelnikov on 10/13/16.
//  Copyright © 2016 Yandex. All rights reserved.
//

import UIKit

class CustomView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    private var layoutSize = CGSizeZero
    
    override func layoutSubviews() {
        print("customView layoutSubviews - start")
        super.layoutSubviews()
        let width = CGRectGetWidth(bounds)
        layoutSize = CGSize(width: width, height: width)
        invalidateIntrinsicContentSize()
        print("customView layoutSubviews - end")
    }
    
    override func intrinsicContentSize() -> CGSize {
        print("customView intrinsicContentSize")
        return CGSizeMake(UIViewNoIntrinsicMetric, layoutSize.height)
    }
}
