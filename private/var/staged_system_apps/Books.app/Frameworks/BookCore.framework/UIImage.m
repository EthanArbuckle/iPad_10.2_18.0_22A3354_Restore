@implementation UIImage

+ (id)im_imageWithCGImage:(CGImage *)a3
{
  return objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:", a3);
}

- (CGImage)im_CGImage
{
  return -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
}

- (id)im_imageWithSize:(CGSize)a3
{
  return -[UIImage im_imageWithSize:options:](self, "im_imageWithSize:options:", 1, a3.width, a3.height);
}

- (id)im_imageWithSize:(CGSize)a3 options:(int)a4
{
  double height;
  double width;
  double v8;
  double v9;
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
  double v21;
  UIImage *v23;
  CGRect v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  -[UIImage size](self, "size");
  if (width == v9 && height == v8)
    goto LABEL_20;
  if (a4)
  {
    -[UIImage size](self, "size");
    v12 = width / v11;
    -[UIImage size](self, "size");
    v14 = height / v13;
    if (a4 == 1)
    {
      if (v12 >= v14)
        v15 = height / v13;
      else
        v15 = v12;
    }
    else
    {
      v15 = 1.0;
      if (a4 == 2)
      {
        if (v12 >= v14)
          v15 = v12;
        else
          v15 = v14;
      }
    }
    -[UIImage size](self, "size");
    width = v15 * v16;
    -[UIImage size](self, "size");
    height = v15 * v17;
  }
  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = width;
  v25.size.height = height;
  v26 = CGRectIntegral(v25);
  v18 = v26.size.width;
  v19 = v26.size.height;
  -[UIImage size](self, "size", v26.origin.x, v26.origin.y);
  if (v18 == v21 && v19 == v20)
LABEL_20:
    v23 = self;
  else
    v23 = (UIImage *)objc_claimAutoreleasedReturnValue(-[UIImage im_imageWithPixelSize:](self, "im_imageWithPixelSize:", v18, v19));
  return v23;
}

- (id)im_imageWithPixelSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  CGImage *v6;
  CGImage *v7;
  CGContext *CurrentContext;
  void *v9;
  NSString *v10;
  void *v11;
  CGImage *Image;
  double v13;
  int v15;
  void *v16;
  CGSize v17;
  CGSize v18;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  v6 = -[UIImage im_CGImage](self, "im_CGImage");
  if (v6)
  {
    v7 = v6;
    v17.width = width;
    v17.height = height;
    UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, 0.0, height);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    if (CurrentContext)
    {
      CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
      v19.origin.x = CGPointZero.x;
      v19.origin.y = CGPointZero.y;
      v19.size.width = width;
      v19.size.height = height;
      CGContextDrawImage(CurrentContext, v19, v7);
    }
    else
    {
      v18.width = width;
      v18.height = height;
      v10 = NSStringFromCGSize(v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "-[IMImage im_imageWithPixelSize:] could not create bitmap context with size %@", (uint8_t *)&v15, 0xCu);
      }

    }
    Image = CGBitmapContextCreateImage(CurrentContext);
    -[UIImage scale](self, "scale");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", Image, -[UIImage imageOrientation](self, "imageOrientation"), v13));
    UIGraphicsEndImageContext();
    CGImageRelease(Image);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)im_CGImages
{
  CGImage *v2;

  v2 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  if (v2)
    v2 = (CGImage *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v2));
  return v2;
}

+ (id)im_imageWithCGImages:(id)a3 size:(CGSize)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Utilities/BCImageCompatibility.m", 125, (uint64_t)"+[UIImage(IMCompatibility) im_imageWithCGImages:size:]", (uint64_t)"imageRefs.count <= 1", CFSTR("Multiple imageRefs not supported on iOS."), v5, v6, v7, v10);
  v8 = objc_msgSend(v4, "lastObject");
  if (v8)
    v8 = objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:", v8);

  return v8;
}

- (UIImage)imageWithTint:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  UIImage *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  -[UIImage size](self, "size");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  v10 = objc_msgSend(v9, "copy");

  -[UIImage scale](self, "scale");
  objc_msgSend(v10, "setScale:");
  v11 = objc_alloc((Class)UIGraphicsImageRenderer);
  -[UIImage size](self, "size");
  v12 = objc_msgSend(v11, "initWithSize:format:", v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_AA20C;
  v16[3] = &unk_2901E0;
  v19 = 0;
  v20 = 0;
  v21 = v6;
  v22 = v8;
  v17 = v4;
  v18 = self;
  v13 = v4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithActions:", v16));

  return (UIImage *)v14;
}

- (id)imageMaskWithColor:(id)a3 forTraitCollection:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resolvedColorWithTraitCollection:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageMaskWithColor:](self, "imageMaskWithColor:", v5));

  return v6;
}

- (id)imageMaskWithColor:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  CGContext *CurrentContext;
  double v10;
  CGImage *v11;
  id v12;
  CGColor *v13;
  UIImage *ImageFromCurrentImageContext;
  void *v15;
  CGSize v17;
  CGRect v18;
  CGRect v19;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  -[UIImage size](self, "size");
  v8 = v7;
  -[UIImage size](self, "size");
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  -[UIImage size](self, "size");
  CGContextTranslateCTM(CurrentContext, 0.0, -v10);
  CGContextSaveGState(CurrentContext);
  v11 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = v6;
  v18.size.height = v8;
  CGContextClipToMask(CurrentContext, v18, v11);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  v12 = objc_retainAutorelease(v4);
  v13 = (CGColor *)objc_msgSend(v12, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v13);
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = v6;
  v19.size.height = v8;
  CGContextFillRect(CurrentContext, v19);
  CGContextRestoreGState(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v15;
}

+ (UIImage)imageWithSolidColor:(id)a3 atSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v6;
  CGContext *CurrentContext;
  id v8;
  CGColor *v9;
  UIImage *ImageFromCurrentImageContext;
  void *v11;
  CGSize v13;
  CGRect v14;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v13.width = width;
  v13.height = height;
  UIGraphicsBeginImageContext(v13);
  CurrentContext = UIGraphicsGetCurrentContext();
  v8 = objc_retainAutorelease(v6);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v9);
  v14.origin.x = 0.0;
  v14.origin.y = 0.0;
  v14.size.width = width;
  v14.size.height = height;
  CGContextFillRect(CurrentContext, v14);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return (UIImage *)v11;
}

+ (id)im_imageWithCenteredIconImage:(id)a3 iconColor:(id)a4 size:(CGSize)a5
{
  double height;
  double width;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  height = a5.height;
  width = a5.width;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v13 = objc_msgSend(v12, "copy");

    objc_msgSend(v8, "scale");
    objc_msgSend(v13, "setScale:");
    v14 = CGRectMakeWithSize(width, height);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v8, "size");
    v23 = CGRectMakeWithSize(v21, v22);
    v28 = CGRectCenterRectInRect(v24, v23, v25, v26, v27, v14, v16, v18, v20);
    v30 = v29;
    v35 = v32;
    v36 = v31;
    v33 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v13, width, height);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_AA610;
    v37[3] = &unk_290208;
    v40 = v14;
    v41 = v16;
    v42 = v18;
    v43 = v20;
    v44 = v28;
    v45 = v30;
    v46 = v36;
    v47 = v35;
    v38 = v8;
    v39 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageWithActions:", v37));

  }
  return v11;
}

- (id)im_imageWithAlpha:(double)a3
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  _QWORD v14[10];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
  v6 = objc_msgSend(v5, "copy");

  -[UIImage scale](self, "scale");
  objc_msgSend(v6, "setScale:");
  -[UIImage size](self, "size");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v6, v7, v9);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_AA7A0;
  v14[3] = &unk_290230;
  v14[5] = 0;
  v14[6] = 0;
  v14[4] = self;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10;
  *(double *)&v14[9] = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithActions:", v14));

  return v12;
}

- (unint64_t)colorAtPixelX:(unint64_t)a3 y:(unint64_t)a4
{
  double v7;
  double v8;
  CGImage *v9;
  CGImageRef v10;
  CGImage *v11;
  CGColorSpace *DeviceRGB;
  CGContext *v13;
  unsigned int data;
  CGRect v16;
  CGRect v17;

  -[UIImage scale](self, "scale");
  v8 = v7;
  v9 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v16.origin.x = v8 * (double)a3;
  v16.origin.y = v8 * (double)a4;
  v16.size.width = 1.0;
  v16.size.height = 1.0;
  v10 = CGImageCreateWithImageInRect(v9, v16);
  if (!v10)
    return -1;
  v11 = v10;
  data = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v13 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, DeviceRGB, 0x4002u);
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = 1.0;
  v17.size.height = 1.0;
  CGContextDrawImage(v13, v17, v11);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v13);
  CGImageRelease(v11);
  return bswap32(data);
}

- (void)dumpAsPNGToCachesNamed:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSData *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
  v5 = objc_msgSend(v4, "hasSuffix:", CFSTR("png"));

  if ((v5 & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("png")));

    v11 = (id)v6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication applicationCacheDirectory](UIApplication, "applicationCacheDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v11));

  v9 = UIImagePNGRepresentation(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "writeToFile:atomically:", v8, 0);

}

+ (UIImage)imageWithColor:(id)a3
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
  return (UIImage *)v8;
}

+ (id)invisibleImage
{
  if (qword_30DBD0 != -1)
    dispatch_once(&qword_30DBD0, &stru_290250);
  return (id)qword_30DBC8;
}

- (unint64_t)im_averageColor
{
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  void *v5;
  id v6;
  CGSize v8;

  v8.width = 1.0;
  v8.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v8, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationMedium);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, 1.0, 1.0);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  v6 = objc_msgSend(v5, "colorAtPixelX:y:", 0, 0);

  return (unint64_t)v6;
}

- (BOOL)im_isLikelyBlank
{
  CGImage *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  CGColorSpace *DeviceRGB;
  CGContext *v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  BOOL v17;
  CGRect v19;

  v2 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v3 = (unsigned __int8 *)malloc_type_calloc(1uLL, 0x9C40uLL, 0xBEECF5AAuLL);
  if (!v3)
    return 0;
  v4 = v3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v6 = CGBitmapContextCreate(v4, 0x64uLL, 0x64uLL, 8uLL, 0x190uLL, DeviceRGB, 5u);
  CGColorSpaceRelease(DeviceRGB);
  if (!v6)
  {
    v9 = 0;
    goto LABEL_34;
  }
  v7 = 1;
  CGContextSetInterpolationQuality(v6, kCGInterpolationNone);
  v19.size.width = 100.0;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.height = 100.0;
  CGContextDrawImage(v6, v19, v2);
  v8 = 0;
  v9 = 1;
  while (!v7)
  {
    if (!v9 || v8 >> 6 >= 0x271)
      goto LABEL_33;
    v7 = 0;
    v10 = v4[v8];
    v11 = v4[v8 + 1];
    v12 = v4[v8 + 2];
LABEL_17:
    v17 = v10 < 2 && v11 < 2 && v12 < 2;
    v9 = v9 && v17;
    v8 += 4;
  }
  if (v8 >> 6 < 0x271)
  {
    v10 = v4[v8];
    v11 = v4[v8 + 1];
    v12 = v4[v8 + 2];
    v7 = v10 > 0xFD && v11 > 0xFD && v12 > 0xFD;
    goto LABEL_17;
  }
  v9 = 1;
LABEL_33:
  CGContextRelease(v6);
LABEL_34:
  free(v4);
  return v9;
}

- (id)bc_imageWithConfiguration:(id)a3 limitedToContentSizeCategory:(id)a4
{
  id v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSComparisonResult v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  NSString *v15;

  v6 = a3;
  v7 = (NSString *)a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection currentTraitCollection](UITraitCollection, "currentTraitCollection"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "preferredContentSizeCategory"));
  v10 = UIContentSizeCategoryCompareToCategory(v9, v7);

  if (v10 == NSOrderedDescending)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_AAD74;
    v14[3] = &unk_290278;
    v15 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "traitCollectionByModifyingTraits:", v14));
    +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage imageWithConfiguration:](self, "imageWithConfiguration:", v6));
  +[UITraitCollection setCurrentTraitCollection:](UITraitCollection, "setCurrentTraitCollection:", v8);

  return v12;
}

@end
