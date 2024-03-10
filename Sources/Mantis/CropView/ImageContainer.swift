//
//  ImageContainer.swift
//  Mantis
//
//  Created by Echo on 10/29/18.
//  Copyright © 2018 Echo. All rights reserved.
//

import UIKit

 open class ImageContainer: UIView {
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView(frame: bounds)
        addSubview(imageView)
        
        imageView.layer.minificationFilter = .trilinear
        imageView.accessibilityIgnoresInvertColors = true
        imageView.accessibilityIdentifier = "SourceImage"
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
     public init(image: UIImage) {
        super.init(frame: .zero)
        imageView.image = image
        layoutIfNeeded()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }
    
     public func resetImage(image: UIImage) {
        UIView.transition(with: imageView,
                          duration: 0.7,
                          options: [.allowAnimatedContent, .transitionCrossDissolve]) {
            self.imageView.image = image
        }
        layoutIfNeeded()
    }

}

extension ImageContainer: ImageContainerProtocol {
    public func contains(rect: CGRect, fromView view: UIView, tolerance: CGFloat = 0.5) -> Bool {
        let newRect = view.convert(rect, to: self)
        
        let point1 = newRect.origin
        let point2 = CGPoint(x: newRect.maxX, y: newRect.maxY)
        
        let refBounds = bounds.insetBy(dx: -tolerance, dy: -tolerance)
        
        return refBounds.contains(point1) && refBounds.contains(point2)
    }
    
    public func getCropRegion(withCropBoxFrame cropBoxFrame: CGRect, cropView: UIView) -> CropRegion {
        var topLeft = cropView.convert(CGPoint(x: cropBoxFrame.minX, y: cropBoxFrame.minY), to: self)
        var topRight = cropView.convert(CGPoint(x: cropBoxFrame.maxX, y: cropBoxFrame.minY), to: self)
        var bottomLeft = cropView.convert(CGPoint(x: cropBoxFrame.minX, y: cropBoxFrame.maxY), to: self)
        var bottomRight = cropView.convert(CGPoint(x: cropBoxFrame.maxX, y: cropBoxFrame.maxY), to: self)
        
        topLeft = CGPoint(x: topLeft.x / bounds.width, y: topLeft.y / bounds.height)
        topRight = CGPoint(x: topRight.x / bounds.width, y: topRight.y / bounds.height)
        bottomLeft = CGPoint(x: bottomLeft.x / bounds.width, y: bottomLeft.y / bounds.height)
        bottomRight = CGPoint(x: bottomRight.x / bounds.width, y: bottomRight.y / bounds.height)
        
        let calculatedRegion = CropRegion(topLeft: topLeft,
                                          topRight: topRight,
                                          bottomLeft: bottomLeft,
                                          bottomRight: bottomRight)
        
       return calculatedRegion
    }
}
