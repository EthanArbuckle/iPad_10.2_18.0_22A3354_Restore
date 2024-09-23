@implementation UIImage

+ (id)_maps_imageWithColor:(id)a3
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  UIImage *ImageFromCurrentImageContext;
  void *v8;
  CGSize v10;
  CGRect v11;

  v3 = a3;
  v10.width = 1.0;
  v10.height = 1.0;
  UIGraphicsBeginImageContext(v10);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v11.origin.x = 0.0;
  v11.origin.y = 0.0;
  v11.size.width = 1.0;
  v11.size.height = 1.0;
  CGContextFillRect(CurrentContext, v11);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v8;
}

+ (id)_maps_circleImageWithDiameter:(double)a3 color:(id)a4
{
  id v5;
  CGContext *CurrentContext;
  id v7;
  CGColor *v8;
  UIImage *ImageFromCurrentImageContext;
  void *v10;
  CGSize v12;
  CGRect v13;

  v5 = a4;
  v12.width = a3;
  v12.height = a3;
  UIGraphicsBeginImageContext(v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  v7 = objc_retainAutorelease(v5);
  v8 = (CGColor *)objc_msgSend(v7, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v8);
  v13.origin.x = 0.0;
  v13.origin.y = 0.0;
  v13.size.width = a3;
  v13.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v13);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v10;
}

- (id)_maps_imageIconWithBackgroundConfiguration:(id)a3
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v20;
  double MidY;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  void *v31;
  double v32;
  CGFloat v33;
  void *v34;
  UIImage *ImageFromCurrentImageContext;
  void *v36;
  CGSize v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v4 = a3;
  v5 = objc_alloc((Class)UIView);
  objc_msgSend(v4, "iconSize");
  v7 = v6;
  objc_msgSend(v4, "iconSize");
  v9 = objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, v8);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v4, "cornerRadius");
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v13, "setCornerRadius:", v12);

  v14 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", self);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "frame");
  objc_msgSend(v14, "alignmentRectForFrame:");
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  MidX = CGRectGetMidX(v39);
  objc_msgSend(v14, "frame");
  v20 = MidX - CGRectGetMidX(v40);
  v41.origin.x = x;
  v41.origin.y = y;
  v41.size.width = width;
  v41.size.height = height;
  MidY = CGRectGetMidY(v41);
  objc_msgSend(v14, "frame");
  v22 = MidY - CGRectGetMidY(v42);
  objc_msgSend(v9, "center");
  v24 = v23 - v20;
  objc_msgSend(v9, "center");
  objc_msgSend(v14, "setCenter:", v24, v25 - v22);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tintColor"));

  objc_msgSend(v14, "setTintColor:", v26);
  objc_msgSend(v9, "addSubview:", v14);
  objc_msgSend(v9, "frame");
  v28 = v27;
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v31, "scale");
  v33 = v32;
  v38.width = v28;
  v38.height = v30;
  UIGraphicsBeginImageContextWithOptions(v38, 0, v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  objc_msgSend(v34, "renderInContext:", UIGraphicsGetCurrentContext());

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v36 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v36;
}

- (id)_maps_colorizedImageWithColor:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat y;
  double v11;
  CGFloat v12;
  CGContext *CurrentContext;
  id v14;
  CGImage *v15;
  UIImage *ImageFromCurrentImageContext;
  void *v17;
  CGSize v19;
  CGRect v20;
  CGRect v21;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  -[UIImage size](self, "size");
  v7 = v6;
  v9 = v8;
  y = CGPointZero.y;
  -[UIImage scale](self, "scale");
  v12 = v11;
  v19.width = v7;
  v19.height = v9;
  UIGraphicsBeginImageContextWithOptions(v19, 0, v12);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v9);
  v14 = objc_retainAutorelease(v4);
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v14, "CGColor"));
  v20.origin.x = CGPointZero.x;
  v20.origin.y = y;
  v20.size.width = v7;
  v20.size.height = v9;
  CGContextFillRect(CurrentContext, v20);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationAtop);
  v15 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v21.origin.x = CGPointZero.x;
  v21.origin.y = y;
  v21.size.width = v7;
  v21.size.height = v9;
  CGContextDrawImage(CurrentContext, v21, v15);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  objc_autoreleasePoolPop(v5);

  return v17;
}

- (id)_maps_horizontallyFlippedImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGContext *CurrentContext;
  CGFloat v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGAffineTransform v14;
  CGSize v15;

  -[UIImage size](self, "size");
  v4 = v3;
  v6 = v5;
  -[UIImage scale](self, "scale");
  v8 = v7;
  v15.width = v4;
  v15.height = v6;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v8);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[UIImage size](self, "size");
  v14.a = -1.0;
  v14.b = 0.0;
  v14.c = 0.0;
  v14.d = 1.0;
  v14.tx = v10;
  v14.ty = 0.0;
  CGContextConcatCTM(CurrentContext, &v14);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v12;
}

- (id)_maps_imageInOrientation:(int64_t)a3
{
  CGFloat v5;
  double v6;
  double v7;
  CGFloat v8;
  __int128 v9;
  UIImage *v10;
  __int128 v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  CGAffineTransform v21;
  CGAffineTransform transform;
  CGAffineTransform v23;
  CGSize v24;

  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v23.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v23.c = v9;
  *(_OWORD *)&v23.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  switch(a3)
  {
    case 0:
      v10 = self;
      return v10;
    case 1:
      CGAffineTransformMakeTranslation(&v23, v5, v8);
      v21 = v23;
      CGAffineTransformRotate(&transform, &v21, 3.14159265);
      goto LABEL_9;
    case 2:
      CGAffineTransformMakeTranslation(&v23, 0.0, v5);
      *(_OWORD *)&v21.a = *(_OWORD *)&v23.a;
      *(_OWORD *)&v21.c = *(_OWORD *)&v23.c;
      v11 = *(_OWORD *)&v23.tx;
      goto LABEL_12;
    case 3:
      CGAffineTransformMakeTranslation(&v23, v8, 0.0);
      goto LABEL_14;
    case 4:
      CGAffineTransformMakeTranslation(&v23, v5, 0.0);
      v21 = v23;
      v12 = -1.0;
      v13 = 1.0;
      goto LABEL_8;
    case 5:
      CGAffineTransformMakeTranslation(&v23, 0.0, v8);
      v21 = v23;
      v12 = 1.0;
      v13 = -1.0;
LABEL_8:
      CGAffineTransformScale(&transform, &v21, v12, v13);
LABEL_9:
      v23 = transform;
      goto LABEL_10;
    case 6:
      CGAffineTransformMakeTranslation(&v23, v8, v5);
      v21 = v23;
      CGAffineTransformScale(&transform, &v21, -1.0, 1.0);
      v11 = *(_OWORD *)&transform.tx;
      v23 = transform;
      *(_OWORD *)&v21.a = *(_OWORD *)&transform.a;
      *(_OWORD *)&v21.c = *(_OWORD *)&transform.c;
LABEL_12:
      *(_OWORD *)&v21.tx = v11;
      v15 = 4.71238898;
      goto LABEL_15;
    case 7:
      CGAffineTransformMakeScale(&v23, -1.0, 1.0);
LABEL_14:
      v21 = v23;
      v15 = 1.57079633;
LABEL_15:
      CGAffineTransformRotate(&transform, &v21, v15);
      v23 = transform;
      v14 = v8;
      v8 = v6;
      break;
    default:
LABEL_10:
      v14 = v6;
      break;
  }
  -[UIImage scale](self, "scale", *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
  v17 = v16;
  v24.width = v14;
  v24.height = v8;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v17);
  CurrentContext = UIGraphicsGetCurrentContext();
  transform = v23;
  CGContextConcatCTM(CurrentContext, &transform);
  -[UIImage drawAtPoint:](self, "drawAtPoint:", CGPointZero.x, CGPointZero.y);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v10 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v10;
}

- (id)_maps_colorMonochromeImageWithColor:(id)a3
{
  id v4;
  UIImage *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGImage *v13;
  double v14;
  UIImage *v15;
  _QWORD v17[3];
  _QWORD v18[3];

  v4 = a3;
  v5 = objc_retainAutorelease(self);
  v6 = objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", -[UIImage CGImage](v5, "CGImage")));
  v7 = (void *)v6;
  if (v6)
  {
    v18[0] = v6;
    v17[0] = kCIInputImageKey;
    v17[1] = kCIInputColorKey;
    v8 = objc_msgSend(objc_alloc((Class)CIColor), "initWithColor:", v4);
    v17[2] = kCIInputIntensityKey;
    v18[1] = v8;
    v18[2] = &off_101274B48;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:withInputParameters:](CIFilter, "filterWithName:withInputParameters:", CFSTR("CIColorMonochrome"), v9));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outputImage"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](CIContext, "contextWithOptions:", 0));
      objc_msgSend(v11, "extent");
      v13 = (CGImage *)objc_msgSend(v12, "createCGImage:fromRect:", v11);
      -[UIImage scale](v5, "scale");
      v15 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v13, -[UIImage imageOrientation](v5, "imageOrientation"), v14));
      CGImageRelease(v13);

    }
    else
    {
      v15 = v5;
    }

  }
  else
  {
    v15 = v5;
  }

  return v15;
}

- (id)_maps_invertedImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithTintColor:](self, "imageWithTintColor:", v3));
  objc_msgSend(v4, "size");
  v6 = v5;
  objc_msgSend(v4, "size");
  v8 = v7;
  objc_msgSend(v4, "size");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "scale");
  v14 = v13;
  v18.width = v10;
  v18.height = v12;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v14);
  objc_msgSend(v4, "drawInRect:", 0.0, 0.0, v6, v8);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);

  UIGraphicsEndImageContext();
  return v16;
}

+ (id)_compositeImageFromImage:(id)a3 paddedToWidth:(double)a4 badge:(id)a5 badgeOffset:(CGPoint)a6
{
  double y;
  double x;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  char IsRightToLeft;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  UIImage *ImageFromCurrentImageContext;
  void *v30;
  CGSize v32;

  y = a6.y;
  x = a6.x;
  v10 = a3;
  v11 = a5;
  objc_msgSend(v10, "size");
  v13 = a4;
  if (x + v12 > a4)
  {
    objc_msgSend(v10, "size");
    v13 = x + v14;
  }
  objc_msgSend(v10, "size");
  v16 = v15 + y * 2.0;
  objc_msgSend(v10, "scale");
  v18 = v17;
  v32.width = v13;
  v32.height = v16;
  UIGraphicsBeginImageContextWithOptions(v32, 0, v18);
  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft(v19);
  v21 = x;
  if ((IsRightToLeft & 1) == 0)
  {
    objc_msgSend(v10, "size", x);
    v23 = a4 - v22 - x;
    v21 = 0.0;
    if (v23 >= 0.0)
    {
      objc_msgSend(v10, "size", 0.0);
      v21 = a4 - v24 - x;
    }
  }
  v25 = objc_msgSend(v10, "drawAtPoint:", v21, y);
  if (v11)
  {
    v26 = 0.0;
    if ((MKApplicationLayoutDirectionIsRightToLeft(v25) & 1) == 0)
    {
      objc_msgSend(v11, "size");
      v26 = v13 - v27;
    }
    objc_msgSend(v11, "size");
    objc_msgSend(v11, "drawAtPoint:", v26, v16 - v28);
  }
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v30;
}

+ (id)_mapsCar_systemImageNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "screenTraitCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v3, v5));

  return v6;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screenTraitCollection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v5, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageByApplyingSymbolConfiguration:", v9));

  return v10;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 pointSize:(double)a4 weight:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screenTraitCollection"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v7, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", a5, a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageByApplyingSymbolConfiguration:", v11));

  return v12;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "screenTraitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v6, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithTextStyle:](UIImageSymbolConfiguration, "configurationWithTextStyle:", v5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageByApplyingSymbolConfiguration:", v10));

  return v11;
}

+ (id)_mapsCar_systemImageNamed:(id)a3 textStyle:(id)a4 weight:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a4;
  v8 = a3;
  v9 = +[UIFont _mapsCar_fontForTextStyle:weight:](UIFont, "_mapsCar_fontForTextStyle:weight:", v7, UIFontWeightForImageSymbolWeight((UIImageSymbolWeight)a5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "screenTraitCollection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:compatibleWithTraitCollection:](UIImage, "systemImageNamed:compatibleWithTraitCollection:", v8, v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageByApplyingSymbolConfiguration:", v14));

  return v15;
}

+ (id)_mapsCar_privateSystemImageNamed:(id)a3 textStyle:(id)a4 scale:(int64_t)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v7, a5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", v6, v8));

  return v9;
}

- (id)drawnInCircleWithDiameter:(double)a3 backgroundColor:(id)a4
{
  id v6;
  CGContext *v7;
  id v8;
  CGColor *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGImage *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v6 = a4;
  v7 = -[UIImage _contextWithDiameter:](self, "_contextWithDiameter:", a3);
  v8 = objc_retainAutorelease(v6);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  CGContextSetFillColorWithColor(v7, v9);
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = a3;
  v25.size.height = a3;
  CGContextFillEllipseInRect(v7, v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v10, "setFill");

  -[UIImage size](self, "size");
  v12 = v11;
  -[UIImage size](self, "size");
  v14 = v13;
  -[UIImage size](self, "size");
  v15 = a3;
  if (v16 <= a3)
  {
    -[UIImage size](self, "size");
    v15 = v17;
  }
  -[UIImage size](self, "size");
  v18 = a3;
  if (v19 <= a3)
  {
    -[UIImage size](self, "size");
    v18 = v20;
  }
  v21 = (a3 - v14) * 0.5;
  v22 = (a3 - v12) * -0.5;
  v23 = -[UIImage _cgImageFromContext:toFit:](self, "_cgImageFromContext:toFit:", v7, v15, v18);
  v26.origin.x = v21;
  v26.origin.y = v22;
  v26.size.width = v15;
  v26.size.height = v18;
  CGContextClipToMask(v7, v26, v23);
  v27.origin.x = v21;
  v27.origin.y = v22;
  v27.size.width = v15;
  v27.size.height = v18;
  CGContextFillRect(v7, v27);
  return -[UIImage _finaliseCircleImage:withContext:](self, "_finaliseCircleImage:withContext:", 0, v7);
}

- (CGContext)_contextWithDiameter:(double)a3
{
  CGContext *CurrentContext;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a3, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  return CurrentContext;
}

- (CGImage)_cgImageFromContext:(CGContext *)a3 toFit:(CGSize)a4
{
  CGContextTranslateCTM(a3, 0.0, a4.height);
  CGContextScaleCTM(a3, 1.0, -1.0);
  return -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
}

- (id)_finaliseCircleImage:(id)a3 withContext:(CGContext *)a4
{
  UIImage *ImageFromCurrentImageContext;
  void *v5;

  CGContextRestoreGState(a4);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v5;
}

- (id)imageScaledToSize:(CGSize)a3
{
  double height;
  double width;
  UIImage *ImageFromCurrentImageContext;
  void *v7;

  height = a3.height;
  width = a3.width;
  UIGraphicsBeginImageContextWithOptions(a3, 0, 0.0);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, width, height);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v7;
}

+ (id)maps_emptyImageScale:(double)a3
{
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  void *v6;
  CGSize v8;
  CGRect v9;

  v8.width = 72.0;
  v8.height = 72.0;
  UIGraphicsBeginImageContextWithOptions(v8, 1, a3);
  CurrentContext = UIGraphicsGetCurrentContext();
  v9.origin.x = 0.0;
  v9.origin.y = 0.0;
  v9.size.width = 72.0;
  v9.size.height = 72.0;
  CGContextStrokeRect(CurrentContext, v9);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v6;
}

+ (id)_imageProcessingQueue
{
  if (qword_1014D2B30 != -1)
    dispatch_once(&qword_1014D2B30, &stru_1011BDEF8);
  return (id)qword_1014D2B28;
}

- (void)maps_blurredImageScale:(double)a3 isRTL:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  double v14;
  BOOL v15;

  v8 = a5;
  v9 = objc_msgSend((id)objc_opt_class(self), "_imageProcessingQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1006060BC;
  v12[3] = &unk_1011BDF20;
  v14 = a3;
  v15 = a4;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "addOperationWithBlock:", v12);

}

- (id)_maps_composedImageScale:(double)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CGContext *CurrentContext;
  double v12;
  double v13;
  double v14;
  id v15;
  const CGPath *v16;
  UIImage *ImageFromCurrentImageContext;
  void *v18;
  CGSize v20;
  CGRect v21;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _maps_scaleToFillRoundedImage:size:scale:](self, "_maps_scaleToFillRoundedImage:size:scale:", self, 64.0, a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _maps_scaleToFill:size:scale:](self, "_maps_scaleToFill:size:scale:", self, 61.0, a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _maps_blurredImage:scale:](self, "_maps_blurredImage:scale:", v8, a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage _maps_scaleToFillRoundedImage:size:scale:](self, "_maps_scaleToFillRoundedImage:size:scale:", v9, 61.0, a3));

  if (v10)
  {
    v20.width = 72.0;
    v20.height = 72.0;
    UIGraphicsBeginImageContextWithOptions(v20, 0, a3);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (v4)
      v12 = 11.0;
    else
      v12 = 0.0;
    v13 = 5.0;
    if (v4)
    {
      v13 = 0.0;
      v14 = 0.0;
    }
    else
    {
      v14 = 8.0;
    }
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v13, 5.0, 67.0, 67.0, 9.60000038)));
    v16 = (const CGPath *)objc_msgSend(v15, "CGPath");

    CGContextSaveGState(CurrentContext);
    CGContextBeginPath(CurrentContext);
    v21.origin.y = 0.0;
    v21.origin.x = v12;
    v21.size.width = 61.0;
    v21.size.height = 61.0;
    CGContextAddRect(CurrentContext, v21);
    CGContextAddPath(CurrentContext, v16);
    CGContextEOClip(CurrentContext);
    objc_msgSend(v10, "drawInRect:blendMode:alpha:", 0, v12, 0.0, 61.0, 61.0, 0.649999976);
    CGContextRestoreGState(CurrentContext);
    objc_msgSend(v7, "drawInRect:", v14, 8.0, 64.0, 64.0);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v18 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_maps_scaleToFill:(id)a3 size:(double)a4 scale:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIImage *ImageFromCurrentImageContext;
  void *v17;
  CGSize v19;

  v7 = a3;
  objc_msgSend(v7, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v12 = a4 / v11;
  v13 = v10 * v12;
  v14 = v9 * v12;
  v15 = (a4 - v10 * v12) * 0.5;
  v19.width = a4;
  v19.height = a4;
  UIGraphicsBeginImageContextWithOptions(v19, 0, a5);
  objc_msgSend(v7, "drawInRect:", (a4 - v14) * 0.5, v15, v14, v13);

  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v17 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v17;
}

- (id)_maps_scaleToFillRoundedImage:(id)a3 size:(double)a4 scale:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGContext *CurrentContext;
  id v17;
  const CGPath *v18;
  UIImage *ImageFromCurrentImageContext;
  void *v20;
  CGSize v22;

  v7 = a3;
  objc_msgSend(v7, "size");
  v9 = v8;
  objc_msgSend(v7, "size");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v12 = a4 / v11;
  v13 = v10 * v12;
  v14 = v9 * v12;
  v15 = (a4 - v10 * v12) * 0.5;
  v22.width = a4;
  v22.height = a4;
  UIGraphicsBeginImageContextWithOptions(v22, 0, a5);
  CurrentContext = UIGraphicsGetCurrentContext();
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, a4, a4, 7.19999981)));
  v18 = (const CGPath *)objc_msgSend(v17, "CGPath");

  CGContextSaveGState(CurrentContext);
  CGContextAddPath(CurrentContext, v18);
  CGContextClip(CurrentContext);
  CGContextClosePath(CurrentContext);
  objc_msgSend(v7, "drawInRect:", (a4 - v14) * 0.5, v15, v14, v13);

  CGContextRestoreGState(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v20;
}

- (id)_maps_blurredImage:(id)a3 scale:(double)a4
{
  CGImage *v5;
  CGColorSpace *ColorSpace;
  CGColorSpace *v7;
  int BitsPerComponent;
  int NumberOfComponents;
  int v10;
  void *v11;
  size_t BytesPerRow;
  size_t Height;
  void *v14;
  int v15;
  int v16;
  int v17;
  CGImage *v18;
  vImage_CGImageFormat v20;
  vImage_Error error;
  vImage_Buffer dest;
  vImage_CGImageFormat format;
  vImage_Buffer buf;

  memset(&buf, 0, sizeof(buf));
  v5 = (CGImage *)objc_msgSend(objc_retainAutorelease(a3), "CGImage");
  ColorSpace = CGImageGetColorSpace(v5);
  v7 = CGColorSpaceRetain(ColorSpace);
  *(_QWORD *)&format.renderingIntent = 0;
  format.bitsPerComponent = CGImageGetBitsPerComponent(v5);
  BitsPerComponent = CGImageGetBitsPerComponent(v5);
  NumberOfComponents = CGColorSpaceGetNumberOfComponents(v7);
  if (CGImageGetAlphaInfo(v5))
    v10 = NumberOfComponents + 1;
  else
    v10 = NumberOfComponents;
  format.bitsPerPixel = v10 * BitsPerComponent;
  format.colorSpace = v7;
  format.bitmapInfo = CGImageGetBitmapInfo(v5);
  *(_OWORD *)&format.version = 0uLL;
  if (vImageBuffer_InitWithCGImage(&buf, &format, 0, v5, 0))
  {
    free(buf.data);
    v11 = 0;
  }
  else
  {
    BytesPerRow = CGImageGetBytesPerRow(v5);
    Height = CGImageGetHeight(v5);
    v14 = malloc_type_malloc(Height * BytesPerRow, 0x1544049FuLL);
    dest.data = v14;
    dest.height = CGImageGetHeight(v5);
    dest.width = CGImageGetWidth(v5);
    dest.rowBytes = CGImageGetBytesPerRow(v5);
    *(_QWORD *)&v20.renderingIntent = 0;
    error = vImageBoxConvolve_ARGB8888(&buf, &dest, 0, 0, 0, (a4 * 12.0) + 1, (a4 * 12.0) + 1, 0, 8u);
    v20.bitsPerComponent = CGImageGetBitsPerComponent(v5);
    v15 = CGImageGetBitsPerComponent(v5);
    v16 = CGColorSpaceGetNumberOfComponents(v7);
    if (CGImageGetAlphaInfo(v5))
      v17 = v16 + 1;
    else
      v17 = v16;
    v20.bitsPerPixel = v17 * v15;
    v20.colorSpace = v7;
    v20.bitmapInfo = CGImageGetBitmapInfo(v5);
    *(_OWORD *)&v20.version = 0uLL;
    v18 = vImageCreateCGImageFromBuffer(&dest, &v20, 0, 0, 0, &error);
    CGColorSpaceRelease(v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v18));
    CGImageRelease(v18);
    free(buf.data);
    free(v14);
  }
  return v11;
}

+ (CGRect)maps_collectionGlyphFractionalRectWithRTL:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = 0.111111112;
  v4 = 0.0;
  if (!a3)
    v4 = 0.111111112;
  v5 = 0.888888896;
  v6 = 0.888888896;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v3;
  result.origin.x = v4;
  return result;
}

+ (id)interSystemTransferFromHexColor:(id)a3 toHexColor:(id)a4 imageWithSize:(int64_t)a5 scale:(double)a6 darkMode:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  CGImage *v17;
  id v18;
  CGImage *v19;
  double Width;
  size_t v21;
  double v22;
  double v23;
  double Height;
  double v25;
  CGFloat v26;
  CGColorSpace *DeviceRGB;
  size_t AlignedBytesPerRow;
  CGContext *v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  CGImage *Image;
  void *v35;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v7 = a7;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeArtworkWithHexColor:](MKTransitArtwork, "stationNodeArtworkWithHexColor:", a3));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKTransitArtwork stationNodeOutlinedArtworkWithHexColor:](MKTransitArtwork, "stationNodeOutlinedArtworkWithHexColor:", v11));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:", v12, a5, v7, a6));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:](UIImage, "_mapkit_transitArtworkImageWithDataSource:size:scale:nightMode:", v13, a5, v7, a6));
  v16 = objc_retainAutorelease(v14);
  v17 = (CGImage *)objc_msgSend(v16, "CGImage");
  v18 = objc_retainAutorelease(v15);
  v19 = (CGImage *)objc_msgSend(v18, "CGImage");
  Width = (double)CGImageGetWidth(v17);
  v21 = CGImageGetWidth(v19);
  v22 = (double)v21;
  if (Width <= (double)v21)
    v23 = (double)v21;
  else
    v23 = Width;
  Height = (double)CGImageGetHeight(v17);
  objc_msgSend(v16, "scale");
  v26 = Height + v25 * 4.0 + (double)CGImageGetWidth(v19);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(4 * (unint64_t)v23);
  v29 = CGBitmapContextCreate(0, (unint64_t)v23, (unint64_t)v26, 8uLL, AlignedBytesPerRow, DeviceRGB, 0x2002u);
  v37.b = 0.0;
  v37.c = 0.0;
  v37.a = 1.0;
  *(_OWORD *)&v37.d = xmmword_100E3C330;
  v37.ty = v26;
  CGContextConcatCTM(v29, &v37);
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v23;
  v38.size.height = v26;
  CGContextClearRect(v29, v38);
  v39.size.height = (double)CGImageGetHeight(v17);
  v39.origin.y = 0.0;
  v39.origin.x = (v23 - Width) * 0.5;
  v39.size.width = Width;
  CGContextDrawImage(v29, v39, v17);
  v30 = (v23 - v22) * 0.5;
  v31 = (double)CGImageGetHeight(v17);
  objc_msgSend(v16, "scale");
  v33 = v31 + v32 * 4.0;
  v40.size.height = (double)CGImageGetHeight(v19);
  v40.origin.x = v30;
  v40.origin.y = v33;
  v40.size.width = v22;
  CGContextDrawImage(v29, v40, v19);
  Image = CGBitmapContextCreateImage(v29);
  objc_msgSend(v16, "scale");
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, 0));
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v29);

  return v35;
}

+ (id)_maps_maneuverImageForTransitArrivalInfo:(id)a3 shieldSize:(int64_t)a4 forDarkBackground:(BOOL)a5
{
  id v8;
  GuidanceManeuverView *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  _BYTE v28[496];
  _BYTE v29[496];
  _BYTE __dst[496];
  _BYTE __src[496];

  v8 = a3;
  v9 = -[GuidanceManeuverView initWithFrame:]([GuidanceManeuverView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  +[SignStyle arrowMetricsForStyle:](SignStyle, "arrowMetricsForStyle:", 0);
  memcpy(__dst, __src, sizeof(__dst));
  -[GuidanceManeuverView setArrowMetrics:](v9, "setArrowMetrics:", __dst);
  +[SignStyle junctionArrowMetricsForStyle:](SignStyle, "junctionArrowMetricsForStyle:", 0);
  memcpy(v28, v29, sizeof(v28));
  -[GuidanceManeuverView setJunctionArrowMetrics:](v9, "setJunctionArrowMetrics:", v28);
  -[GuidanceManeuverView setFraming:](v9, "setFraming:", 1);
  if (a5)
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v10 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v11 = (void *)v10;
  -[GuidanceManeuverView setArrowColor:](v9, "setArrowColor:", v10);

  v12 = 18;
  if (v8)
  {
    v13 = objc_msgSend(v8, "destinationLocation");
    if (v13 == 2)
      v14 = 34;
    else
      v14 = 18;
    if (v13 == 1)
      v12 = 33;
    else
      v12 = v14;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GuidanceManeuverArtwork artworkWithManeuver:](GuidanceManeuverArtwork, "artworkWithManeuver:", v12));
  -[GuidanceManeuverView setManeuverArtwork:](v9, "setManeuverArtwork:", v15);

  -[GuidanceManeuverView intrinsicContentSize](v9, "intrinsicContentSize");
  v18 = v16;
  v19 = v17;
  if (v16 >= v17)
    v20 = v17;
  else
    v20 = v16;
  objc_msgSend(a1, "_maps_minSideLengthForShieldSize:", a4);
  if (v20 > 0.0 && v22 > 0.0)
  {
    v23 = v22 / v20;
    if (v23 > 1.0)
      v23 = 1.0;
    v18 = v18 * v23;
    v19 = v19 * v23;
  }
  v24 = UIRoundToViewScale(v9, v21, v18);
  -[GuidanceManeuverView setBounds:](v9, "setBounds:", 0.0, 0.0, v24, UIRoundToViewScale(v9, v25, v19));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidanceManeuverView imageRepresentation](v9, "imageRepresentation"));

  return v26;
}

+ (double)_maps_minSideLengthForShieldSize:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)a3 <= 7)
    return dbl_100E3C340[a3];
  return result;
}

+ (id)_maps_applicationIconWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "scale");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v3, 2));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_maps_imageWithAspectFitScalingForMaximumDimension:(double)a3
{
  return -[UIImage _maps_imageWithAspectFitScalingForMaximumSize:](self, "_maps_imageWithAspectFitScalingForMaximumSize:", a3, a3);
}

- (id)_maps_imageWithAspectFitScalingForMaximumSize:(CGSize)a3
{
  double width;
  BOOL v4;
  double height;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  CGSize v17;

  width = a3.width;
  v4 = a3.width > 0.00000011920929 && a3.height > 0.00000011920929;
  if (!v4)
    return 0;
  height = a3.height;
  -[UIImage size](self, "size");
  if (v8 <= width && v9 <= height)
    return self;
  v4 = v8 <= v9;
  v11 = height * (v8 / v9);
  v12 = width * (v9 / v8);
  if (v4)
    width = v11;
  else
    height = v12;
  -[UIImage scale](self, "scale");
  v14 = v13;
  v17.width = width;
  v17.height = height;
  UIGraphicsBeginImageContextWithOptions(v17, 0, v14);
  -[UIImage drawInRect:](self, "drawInRect:", CGPointZero.x, CGPointZero.y, width, height);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v16;
}

+ (id)warningImageOfSize:(double)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemYellowColor](UIColor, "systemYellowColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageNamed:ofSize:color:", CFSTR("exclamationmark.circle.fill"), v5, a3));

  return v6;
}

+ (id)chargeImageOfSize:(double)a3 batteryLevel:(unint64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[VehicleBatteryView colorForBatteryLevel:](VehicleBatteryView, "colorForBatteryLevel:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageNamed:ofSize:color:", CFSTR("bolt.circle.fill"), v6, a3));

  return v7;
}

+ (id)imageNamed:(id)a3 ofSize:(double)a4 color:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 0, a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithConfiguration:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithRenderingMode:", 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_flatImageWithColor:", v7));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithRenderingMode:", 1));
  return v13;
}

- (id)_maps_mostCommonColor
{
  id v3;
  void *v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[4];
  _QWORD v22[4];
  id v23;
  Block_layout *v24;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10090E438;
  v22[3] = &unk_1011DBD20;
  v24 = &stru_1011DBCF8;
  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v23 = v3;
  -[UIImage _enumeratePixelsWithBlock:](self, "_enumeratePixelsWithBlock:", v22);
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_10090E4F4;
  v19 = sub_10090E504;
  v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10090E50C;
  v14[3] = &unk_1011DBD48;
  v14[4] = v21;
  v14[5] = &v15;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v16[5], "componentsSeparatedByString:", CFSTR(",")));
  v5 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
  *v5 = objc_msgSend(v6, "integerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 1));
  v5[1] = objc_msgSend(v7, "integerValue");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 2));
  v5[2] = objc_msgSend(v8, "integerValue");

  v5[3] = 0;
  LOBYTE(v9) = *v5;
  LOBYTE(v10) = v5[1];
  LOBYTE(v11) = v5[2];
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", (double)v9 * 0.00392156863, (double)v10 * 0.00392156863, (double)v11 * 0.00392156863, 1.0));
  free(v5);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

  return v12;
}

- (void)_enumeratePixelsWithBlock:(id)a3
{
  void (**v4)(id, char *, _BYTE *);
  CGImage *v5;
  unint64_t Width;
  unint64_t Height;
  char v8;
  char *v9;
  CGColorSpace *DeviceRGB;
  CGContext *v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char v19;
  char v20;
  CGRect v21;

  v4 = (void (**)(id, char *, _BYTE *))a3;
  v5 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  Width = CGImageGetWidth(v5);
  Height = CGImageGetHeight(v5);
  v8 = 1;
  v9 = (char *)malloc_type_calloc(4 * Width * Height, 1uLL, 0x100004077774924uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v18 = v9;
  v11 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, DeviceRGB, 0x4001u);
  CGColorSpaceRelease(DeviceRGB);
  v21.size.width = (double)Width;
  v21.size.height = (double)Height;
  v21.origin.x = 0.0;
  v21.origin.y = 0.0;
  CGContextDrawImage(v11, v21, v5);
  CGContextRelease(v11);
  v12 = 0;
  v20 = 0;
  while (1)
  {
    v19 = v8;
    v13 = qword_100E3C6F0[v12];
    if (v13 < Height)
      break;
LABEL_8:
    v8 = 0;
    v12 = 1;
    if ((v19 & 1) == 0)
      goto LABEL_9;
  }
  v14 = &v18[(4 * Width + 4) * v13];
  v15 = qword_100E3C6F0[v12];
  while (1)
  {
    v16 = v14;
    v17 = v13;
    if (v13 < Width)
      break;
LABEL_7:
    v15 += v13;
    v14 += 4 * Width * v13;
    if (v15 >= Height)
      goto LABEL_8;
  }
  while (1)
  {
    v4[2](v4, v16, &v20);
    if (v20)
      break;
    v17 += v13;
    v16 += 4 * v13;
    if (v17 >= Width)
      goto LABEL_7;
  }
LABEL_9:
  free(v18);

}

@end
