@implementation THImageLayer

- (void)setImageProviderBlock:(id)a3 setLayerBounds:(BOOL)a4 maxSize:(CGSize)a5 outNativeSize:(CGSize *)a6
{
  _BOOL4 v6;
  CGImage *v8;
  double Width;

  if (a3)
  {
    v6 = a4;
    v8 = -[THImageLayer p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:](self, "p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:", a3, a6, a5.width, a5.height);
    -[THImageLayer setContents:](self, "setContents:", v8);
    if (v6)
    {
      Width = (double)CGImageGetWidth(v8);
      -[THImageLayer setBounds:](self, "setBounds:", 0.0, 0.0, Width, (double)CGImageGetHeight(v8));
    }
    CGImageRelease(v8);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", 0, a4, a6, a5.width, a5.height), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THImageLayer setImageProviderBlock:setLayerBounds:maxSize:outNativeSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THImageLayer.m"), 18, CFSTR("invalid nil value for '%s'"),
      "imageProviderBlock");
  }
}

- (CGImage)p_createImageFromImageProviderBlock:(id)a3 withMaxSize:(CGSize)a4 outNativeSize:(CGSize *)a5
{
  double height;
  double width;
  CGImageSource *v8;
  CGImageSource *v9;
  CFDictionaryRef v10;
  float v11;
  CGFloat v12;
  float v13;
  id v14;
  float v15;
  float v16;
  float v17;
  CGImage *ThumbnailAtIndex;

  height = a4.height;
  width = a4.width;
  v8 = (CGImageSource *)(*((uint64_t (**)(id, SEL))a3 + 2))(a3, a2);
  v9 = v8;
  if (a5)
  {
    v10 = CGImageSourceCopyPropertiesAtIndex(v8, 0, 0);
    objc_msgSend(-[__CFDictionary objectForKey:](v10, "objectForKey:", kCGImagePropertyPixelWidth), "floatValue");
    v12 = v11;
    objc_msgSend(-[__CFDictionary objectForKey:](v10, "objectForKey:", kCGImagePropertyPixelHeight), "floatValue");
    a5->width = v12;
    a5->height = v13;

  }
  v14 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", kCFBooleanTrue, kCGImageSourceCreateThumbnailFromImageAlways, 0);
  v15 = width;
  v16 = height;
  v17 = ceilf(fmaxf(v15, v16));
  if (v17 < 1.79769313e308)
    objc_msgSend(v14, "setObject:forKey:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)v17), kCGImageSourceThumbnailMaxPixelSize);
  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(v9, 0, (CFDictionaryRef)v14);
  if (!ThumbnailAtIndex)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THImageLayer p_createImageFromImageProviderBlock:withMaxSize:outNativeSize:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THImageLayer.m"), 62, CFSTR("failed to generate thumbnail image"));

  return ThumbnailAtIndex;
}

@end
