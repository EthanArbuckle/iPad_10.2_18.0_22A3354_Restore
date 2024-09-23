@implementation UIImage

+ (id)crl_templateImageWithCGPath:(CGPath *)a3 scale:(double)a4
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGContext *v10;
  CGContext *v11;
  CGImage *Image;
  void *v13;
  void *v14;
  CGRect BoundingBox;
  CGRect v17;

  BoundingBox = CGPathGetBoundingBox(a3);
  x = BoundingBox.origin.x;
  y = BoundingBox.origin.y;
  width = BoundingBox.size.width;
  height = BoundingBox.size.height;
  v10 = sub_100012758(1, BoundingBox.size.width, BoundingBox.size.height, a4);
  if (v10)
  {
    v11 = v10;
    CGContextSaveGState(v10);
    CGContextAddPath(v11, a3);
    CGContextClip(v11);
    CGContextSetRGBFillColor(v11, 1.0, 1.0, 1.0, 1.0);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    CGContextFillRect(v11, v17);
    CGContextRestoreGState(v11);
    Image = CGBitmapContextCreateImage(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0, a4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));

    CGImageRelease(Image);
    CGContextRelease(v11);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)crl_imageWithAlpha:(double)a3 renderingMode:(int64_t)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[6];

  v7 = objc_alloc((Class)UIGraphicsImageRenderer);
  -[UIImage size](self, "size");
  v8 = objc_msgSend(v7, "initWithSize:");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003E073C;
  v12[3] = &unk_101259F28;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithActions:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", a4));

  return v10;
}

- (id)crl_templateImageWithAlpha:(double)a3
{
  return -[UIImage crl_imageWithAlpha:renderingMode:](self, "crl_imageWithAlpha:renderingMode:", 2, a3);
}

- (id)crl_tintedImageWithColor:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v18;
  CGRect v19;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  -[UIImage scale](self, "scale");
  v10 = v9;
  v18.width = v6;
  v18.height = v8;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v10);
  objc_msgSend(v4, "setFill");

  -[UIImage size](self, "size");
  v12 = v11;
  -[UIImage size](self, "size");
  v14 = v13;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v12;
  v19.size.height = v14;
  UIRectFill(v19);
  -[UIImage drawInRect:blendMode:alpha:](self, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v12, v14, 1.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v16;
}

- (id)crl_resizableImage
{
  -[UIImage size](self, "size");
  return -[UIImage resizableImageWithCapInsets:](self, "resizableImageWithCapInsets:");
}

+ (id)crl_imageWithColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:", width, height);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003E096C;
  v12[3] = &unk_101259F50;
  v13 = v6;
  v14 = width;
  v15 = height;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageWithActions:", v12));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithRenderingMode:", 0));

  return v10;
}

+ (id)crl_accessibilityBoldTextAdaptiveImageNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!UIAccessibilityIsBoldTextEnabled()
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingString:", CFSTR("-bold"))),
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v4)),
        v4,
        !v5))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v3));
  }

  return v5;
}

+ (id)crl_bidiConsciousImageNamed:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", a3));
  if (sub_1003A91F4())
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageWithHorizontallyFlippedOrientation"));

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)crl_systemImageNamed:(id)a3 withFallbackCustomImageNamed:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
LABEL_12:
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v6));
    goto LABEL_13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v5));
  if (!v7)
  {
    v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259F70);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E700(v8, v9);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259F90);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIImage(CRLAdditions) crl_systemImageNamed:withFallbackCustomImageNamed:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/UIImage_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 103, 0, "invalid nil value for '%{public}s'", "result");

    goto LABEL_12;
  }
LABEL_13:

  return v7;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4
{
  return _objc_msgSend(a1, "crl_systemImageNamed:withPointSize:weight:", a3, 4, a4);
}

+ (id)crl_imageNamed:(id)a3 withPointSize:(double)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v5, 0, v6));

  return v7;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", a5, a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v7, v8));

  return v9;
}

+ (id)crl_systemImageNamed:(id)a3 withPointSize:(double)a4 weight:(int64_t)a5 scale:(int64_t)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", a5, a6, a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v9, v10));

  return v11;
}

+ (id)crl_systemImageNamed:(id)a3 withFont:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v5, v6));

  return v7;
}

- (id)crl_imageWithRTLMirroringForcedOn:(BOOL)a3
{
  _BOOL4 v3;
  UIImage *v4;
  UIImage *v5;

  v3 = a3;
  v4 = self;
  if (sub_1003A91F4())
  {
    v5 = v4;
    if (!-[UIImage imageOrientation](v4, "imageOrientation"))
    {
      v5 = v4;
      if (v3)
      {
        v5 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage imageFlippedForRightToLeftLayoutDirection](v4, "imageFlippedForRightToLeftLayoutDirection"));

      }
    }
    if ((id)-[UIImage imageOrientation](v4, "imageOrientation") != (id)4 || v3)
    {
      v4 = v5;
    }
    else
    {
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithHorizontallyFlippedOrientation](v4, "imageWithHorizontallyFlippedOrientation"));

    }
  }
  return v4;
}

+ (id)crl_internalSystemImageNamed:(id)a3
{
  return +[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", a3);
}

+ (id)crl_internalSystemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v5, v6));

  return v7;
}

@end
