//
//  TypeAlias.swift
//  Mantis
//
//  Created by Echo on 07/07/22.
//  Copyright © 2022 Echo. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

import UIKit

public struct Transformation {
    public var offset: CGPoint
    public var rotation: CGFloat
    public var scale: CGFloat
    public var manualZoomed: Bool
    public var initialMaskFrame: CGRect
    public var maskFrame: CGRect
    public var cropWorkbenchViewBounds: CGRect
}

public struct CropRegion: Equatable {
    public var topLeft: CGPoint
    public var topRight: CGPoint
    public var bottomLeft: CGPoint
    public var bottomRight: CGPoint
}

public struct CropInfo {
    public var translation: CGPoint
    public var rotation: CGFloat
    public var scaleX: CGFloat
    public var scaleY: CGFloat
    public var cropSize: CGSize
    public var imageViewSize: CGSize
    public var originalPixels: CGSize
    public var cropRegion: CropRegion
}

public struct CropOutput {
    public var croppedImage: UIImage?
    public var transformation: Transformation
    public var cropInfo: CropInfo
}
