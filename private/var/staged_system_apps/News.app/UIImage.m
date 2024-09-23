@implementation UIImage

- (id)imageMaskWithColor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  -[UIImage size](self, "size");
  v8 = v7;
  -[UIImage size](self, "size");
  v10 = v9;
  v12 = v11;
  -[UIImage scale](self, "scale");
  v14 = v13;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100029BC4;
  v18[3] = &unk_1000DA180;
  v20 = 0;
  v21 = 0;
  v22 = v6;
  v23 = v8;
  v18[4] = self;
  v19 = v4;
  v15 = v4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v18, v10, v12, v14));

  return v16;
}

- (id)imageMaskWithColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  -[UIImage scale](self, "scale");
  v9 = v8;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100029D48;
  v13[3] = &unk_1000DA1A8;
  v15 = width;
  v16 = height;
  v17 = 0;
  v18 = 0;
  v19 = width;
  v20 = height;
  v13[4] = self;
  v14 = v7;
  v10 = v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v13, width, height, v9));

  return v11;
}

+ (id)imageFromFileURL:(id)a3
{
  const __CFURL *v3;
  const __CFURL *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  CGImage *ImageAtIndex;
  void *v8;
  CFStringRef v10;
  CFBooleanRef v11;

  v3 = (const __CFURL *)a3;
  v4 = v3;
  if (v3 && (v5 = CGImageSourceCreateWithURL(v3, 0)) != 0)
  {
    v6 = v5;
    v10 = kCGImageSourceShouldCacheImmediately;
    v11 = kCFBooleanTrue;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", ImageAtIndex));
    CGImageRelease(ImageAtIndex);
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fr_opaqueImageWithFillColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  -[UIImage scale](self, "scale");
  v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100029FB8;
  v14[3] = &unk_1000D97A8;
  v14[4] = self;
  v15 = v4;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 1, v14, v6, v8, v10));

  return v12;
}

- (id)fr_imageByApplyingAlpha:(double)a3
{
  CGContext *CurrentContext;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGImage *v10;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  CGSize v14;
  CGRect v15;

  -[UIImage size](self, "size");
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[UIImage size](self, "size");
  v7 = v6;
  -[UIImage size](self, "size");
  v9 = v8;
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -v9);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeMultiply);
  CGContextSetAlpha(CurrentContext, a3);
  v10 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v7;
  v15.size.height = v9;
  CGContextDrawImage(CurrentContext, v15, v10);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v12;
}

- (id)fr_tintedImageWithColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  UIImage *v16;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  -[UIImage scale](self, "scale");
  v10 = v9;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A1CC;
  v14[3] = &unk_1000D97A8;
  v15 = v4;
  v16 = self;
  v11 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v14, v6, v8, v10));

  return v12;
}

- (id)fr_imageCroppedToCircleWithBackgroundColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  -[UIImage size](self, "size");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage fr_imageCroppedToCornerRadius:withBackgroundColor:](self, "fr_imageCroppedToCornerRadius:withBackgroundColor:", v4, v8 * 0.5));

  return v9;
}

- (id)fr_imageCroppedToCornerRadius:(double)a3 withBackgroundColor:(id)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  UIImage *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {

    v6 = 0;
  }
  -[UIImage size](self, "size");
  v10 = v9;
  -[UIImage size](self, "size");
  if (v10 >= v11)
    v10 = v11;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002A3C4;
  v15[3] = &unk_1000DA1A8;
  v18 = 0;
  v19 = 0;
  v20 = v10;
  v21 = v10;
  v16 = v6;
  v17 = self;
  v22 = a3;
  v23 = v10;
  v12 = v6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", v6 != 0, v15, v10, v10, 0.0));

  return v13;
}

- (id)fr_imageAspectFitToSize:(CGSize)a3 targetScale:(double)a4 croppedToCornerRadius:(double)a5 withMargin:(double)a6 withBackgroundColor:(id)a7 borderColor:(id)a8
{
  double height;
  double width;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIImageOrientation v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void **v49;
  uint64_t v50;
  void (*v51)(uint64_t, CGContext *);
  void *v52;
  id v53;
  UIImage *v54;
  id v55;
  uint64_t *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  UIImageOrientation v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;

  height = a3.height;
  width = a3.width;
  v15 = a7;
  v16 = a8;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v18 = objc_msgSend(v15, "isEqual:", v17);

  if (v18)
  {

    v15 = 0;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v20 = objc_msgSend(v16, "isEqual:", v19);

  if (v20)
  {

    v16 = 0;
  }
  -[UIImage size](self, "size");
  v22 = v21;
  v24 = v23;
  -[UIImage scale](self, "scale");
  v26 = v25;
  v27 = -[UIImage imageOrientation](self, "imageOrientation");
  v28 = width / v22;
  if (width / v22 >= height / v24)
    v28 = height / v24;
  v29 = a4 / v26 * v28;
  v30 = v22 * v26 * v29;
  v31 = v24 * v26 * v29;
  v32 = -(a6 * a4);
  v33 = v30 <= v31;
  v34 = v31 + v32 * 2.0;
  v35 = v30 * (v34 / v31);
  v36 = v30 + v32 * 2.0;
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = sub_100018594;
  v68 = sub_1000184EC;
  v37 = v31 * (v36 / v30);
  if (v33)
    v38 = v35;
  else
    v38 = v36;
  v39 = width * a4;
  v69 = 0;
  v49 = _NSConcreteStackBlock;
  v50 = 3221225472;
  v51 = sub_10002A734;
  v52 = &unk_1000DA1D0;
  v40 = height * a4;
  v57 = v39;
  v58 = v40;
  if (v33)
    v41 = v34;
  else
    v41 = v37;
  v59 = a5;
  v60 = a4;
  v42 = v15;
  v61 = v38;
  v62 = v41;
  v53 = v42;
  v54 = self;
  v43 = v16;
  v55 = v43;
  v56 = &v64;
  v63 = v27;
  +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, &v49, v39, v40, 1.0);
  v44 = (void *)v65[5];
  if (!v44)
  {
    v45 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v46 = objc_alloc((Class)NSString);
      objc_msgSend(v46, "initWithFormat:", CFSTR("invalid nil value for '%s'"), "scaledImage", v49, v50, v51, v52, v53, v54);
      sub_10007A45C();
    }

    v44 = (void *)v65[5];
  }
  v47 = v44;

  _Block_object_dispose(&v64, 8);
  return v47;
}

- (id)fr_colorMonochromeImageWithColor:(id)a3
{
  UIImage *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CGImage *v11;
  void *v12;

  v4 = objc_retainAutorelease(self);
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", -[UIImage CGImage](v4, "CGImage")));
  v7 = objc_msgSend(objc_alloc((Class)CIColor), "initWithColor:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorMonochrome"), CFSTR("inputImage"), v6, CFSTR("inputColor"), v7, CFSTR("inputIntensity"), &off_1000E4AE8, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "outputImage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](CIContext, "contextWithOptions:", 0));
  objc_msgSend(v9, "extent");
  v11 = (CGImage *)objc_msgSend(v10, "createCGImage:fromRect:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v11));
  CGImageRelease(v11);

  return v12;
}

- (id)fr_scaledImageWithMaximumSize:(CGSize)a3
{
  double height;
  double width;
  double v6;

  height = a3.height;
  width = a3.width;
  -[UIImage scale](self, "scale");
  return -[UIImage fr_scaledImageWithMaximumSize:targetScale:](self, "fr_scaledImageWithMaximumSize:targetScale:", width, height, v6);
}

- (id)fr_scaledImageWithMaximumSize:(CGSize)a3 targetScale:(double)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIImageOrientation v14;
  UIImageOrientation v16;
  double v17;
  double v18;
  UIImage *v19;
  double v20;
  UIImage *v21;
  UIImage *v22;
  _QWORD v24[11];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  height = a3.height;
  width = a3.width;
  -[UIImage size](self, "size");
  v9 = v8;
  v11 = v10;
  -[UIImage scale](self, "scale");
  v13 = v12;
  v14 = -[UIImage imageOrientation](self, "imageOrientation");
  if (v9 < width && v11 < height)
  {
    v22 = self;
  }
  else
  {
    v16 = v14;
    v17 = width / v9;
    if (width / v9 >= height / v11)
      v17 = height / v11;
    v18 = a4 / v13 * v17;
    v19 = objc_retainAutorelease(self);
    v20 = v18 * (double)CGImageGetWidth(-[UIImage CGImage](v19, "CGImage"));
    v21 = objc_retainAutorelease(v19);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_100018594;
    v29 = sub_1000184EC;
    v30 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10002AC38;
    v24[3] = &unk_1000DA1F8;
    *(double *)&v24[6] = v18 * (double)CGImageGetHeight(-[UIImage CGImage](v21, "CGImage"));
    *(double *)&v24[7] = v9 * v13 * v18;
    v24[4] = v21;
    v24[5] = &v25;
    *(double *)&v24[8] = v11 * v13 * v18;
    *(double *)&v24[9] = a4;
    v24[10] = v16;
    +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 0, v24, v20);
    v22 = (UIImage *)(id)v26[5];
    _Block_object_dispose(&v25, 8);

  }
  return v22;
}

- (id)fr_croppedImageWithAspectRatio:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGImage *v14;
  CGImage *v15;
  void *v16;
  CGRect v18;

  -[UIImage scale](self, "scale");
  v6 = v5;
  -[UIImage size](self, "size");
  v8 = v6 * v7;
  -[UIImage size](self, "size");
  v10 = v6 * v9;
  if (a3 <= 1.0)
  {
    v11 = v10 * a3;
    v12 = v10;
  }
  else
  {
    v11 = v8;
    v12 = v8 / a3;
  }
  v13 = (v10 - v12) * 0.5;
  v14 = -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
  v18.origin.x = (v8 - v11) * 0.5;
  v18.origin.y = v13;
  v18.size.width = v11;
  v18.size.height = v12;
  v15 = CGImageCreateWithImageInRect(v14, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v15));
  CGImageRelease(v15);
  return v16;
}

- (id)fr_imageByScalingAndCroppingForSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  UIImage *v7;
  double v8;
  double v9;
  double v10;
  double v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  UIImage *v17;
  void *v18;
  _QWORD v20[4];
  UIImage *v21;
  double v22;
  double v23;
  double v24;
  double v25;

  height = a3.height;
  width = a3.width;
  v7 = self;
  -[UIImage size](v7, "size");
  v10 = 0.0;
  if (v8 == width && v9 == height)
  {
    v14 = width;
    v15 = height;
    v16 = 0.0;
  }
  else
  {
    v12 = width / v8;
    v13 = width / v8 < height / v9;
    if (width / v8 <= height / v9)
      v12 = height / v9;
    v14 = v8 * v12;
    v15 = v9 * v12;
    if (v13)
    {
      v16 = (width - v14) * 0.5;
    }
    else
    {
      v16 = 0.0;
      v10 = fmin(-(v15 / 3.0 + height * -0.5), 0.0);
    }
  }
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002AEF8;
  v20[3] = &unk_1000DA220;
  v22 = v16;
  v23 = v10;
  v24 = v14;
  v25 = v15;
  v21 = v7;
  v17 = v7;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v20, width, height, a4));

  return v18;
}

- (id)fr_imageByCroppingSubRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  UIImage *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v16[4];
  UIImage *v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  -[UIImage size](v7, "size");
  v9 = v8;
  v11 = v10;
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (CGRectIsEmpty(v22))
    goto LABEL_4;
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v9;
  v23.size.height = v11;
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  if (!CGRectContainsRect(v23, v24))
  {
LABEL_4:
    v14 = 0;
  }
  else
  {
    -[UIImage scale](v7, "scale");
    v13 = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002B030;
    v16[3] = &unk_1000DA220;
    v17 = v7;
    v18 = x;
    v19 = y;
    v20 = width;
    v21 = height;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v16, width, height, v13));

  }
  return v14;
}

- (id)fr_bannerImageWithLogo:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, CGContextRef);
  void *v20;
  UIImage *v21;
  id v22;
  uint64_t *v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v4 = a3;
  -[UIImage scale](self, "scale");
  v6 = v5;
  -[UIImage size](self, "size");
  v8 = v6 * v7;
  -[UIImage size](self, "size");
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = sub_100018594;
  v34 = sub_1000184EC;
  v35 = 0;
  v10 = (double)(unint64_t)(v6 * 17.0 * 0.5 + v6 * v9);
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10002B264;
  v20 = &unk_1000DA248;
  v24 = v6 * 17.0 * 0.5;
  v25 = v8;
  v26 = v6 * v9;
  v21 = self;
  v27 = (unint64_t)v8;
  v28 = v6 * 17.0;
  v11 = v4;
  v22 = v11;
  v23 = &v30;
  v29 = v6;
  +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, &v17, (double)(unint64_t)v8, v10, 1.0);
  v12 = (void *)v31[5];
  if (!v12)
  {
    v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_alloc((Class)NSString);
      objc_msgSend(v14, "initWithFormat:", CFSTR("invalid nil value for '%s'"), "bannerImage", v17, v18, v19, v20, v21);
      sub_10007A4C0();
    }

    v12 = (void *)v31[5];
  }
  v15 = v12;

  _Block_object_dispose(&v30, 8);
  return v15;
}

+ (id)fr_immediatelyLoadedImageWithData:(id)a3 scale:(double)a4
{
  const __CFData *v5;
  const __CFData *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;
  uint64_t v10;
  void *v11;
  CFStringRef v13;
  CFBooleanRef v14;

  v5 = (const __CFData *)a3;
  v6 = v5;
  if (v5 && (v7 = CGImageSourceCreateWithData(v5, 0)) != 0)
  {
    v8 = v7;
    v13 = kCGImageSourceShouldCacheImmediately;
    v14 = kCFBooleanTrue;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
    if (a4 <= 1.0)
      v10 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", ImageAtIndex));
    else
      v10 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", ImageAtIndex, 0, a4));
    v11 = (void *)v10;
    CGImageRelease(ImageAtIndex);
    CFRelease(v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)fr_immediatelyLoadedImageWithData:(id)a3
{
  return objc_msgSend(a1, "fr_immediatelyLoadedImageWithData:scale:", a3, 1.0);
}

+ (id)fr_imageWithColor:(id)a3 size:(CGSize)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;

  height = a4.height;
  width = a4.width;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002B598;
  v11[3] = &unk_1000DA270;
  v13 = 0;
  v14 = 0;
  v12 = a3;
  v15 = width;
  v16 = height;
  v17 = a5;
  v8 = v12;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v11, width, height, 0.0));

  return v9;
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3
{
  return -[UIImage fr_darkAndBlurredImageWithContext:withBlurRadius:vibrancyAmount:](self, "fr_darkAndBlurredImageWithContext:withBlurRadius:vibrancyAmount:", a3, 5.0, 10.0);
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5
{
  return -[UIImage fr_darkAndBlurredImageWithContext:withBlurRadius:vibrancyAmount:alpha:](self, "fr_darkAndBlurredImageWithContext:withBlurRadius:vibrancyAmount:alpha:", a3, a4, a5, 0.7);
}

- (id)fr_darkAndBlurredImageWithContext:(id)a3 withBlurRadius:(double)a4 vibrancyAmount:(double)a5 alpha:(double)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGImage *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;

  v28 = a3;
  v27 = objc_msgSend(objc_alloc((Class)CIImage), "initWithImage:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIGaussianBlur")));
  objc_msgSend(v10, "setValue:forKey:", v27, kCIInputImageKey);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  objc_msgSend(v10, "setValue:forKey:", v11, CFSTR("inputRadius"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIVibrance")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "outputImage"));
  objc_msgSend(v12, "setValue:forKey:", v13, kCIInputImageKey);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  objc_msgSend(v12, "setValue:forKey:", v14, CFSTR("inputAmount"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConstantColorGenerator")));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, a6));
  objc_msgSend(v15, "setValue:forKey:", v26, CFSTR("inputColor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "valueForKey:", CFSTR("outputImage")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMultiplyBlendMode")));
  objc_msgSend(v17, "setValue:forKey:", v16, CFSTR("inputImage"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "outputImage"));
  objc_msgSend(v17, "setValue:forKey:", v18, CFSTR("inputBackgroundImage"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "outputImage"));
  objc_msgSend(v27, "extent");
  v20 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v19);

  -[UIImage scale](self, "scale");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v20, -[UIImage imageOrientation](self, "imageOrientation"), v21));
  CGImageRelease(v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fr_opaqueImageWithFillColor:", v23));

  return v24;
}

- (id)fr_applyDarkEffect
{
  void *v3;
  void *v4;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.196078431, 0.196078431, 0.196078431, 0.45));
  LOBYTE(v6) = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIImage applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:](self, "applyBlurWithRadius:tintColor:saturationDeltaFactor:maskImage:targetSize:screenScale:opaque:logoRect:logoImage:logoText:cornerRadius:punchThroughBanner:allowAldenTint:", v3, 0, 0, 0, 0, 0, 44.0, 1.3, CGSizeZero.width, CGSizeZero.height, 0.0, *(_QWORD *)&CGRectZero.origin.x, *(_QWORD *)&CGRectZero.origin.y, *(_QWORD *)&CGRectZero.size.width, *(_QWORD *)&CGRectZero.size.height,
                   0,
                   v6));

  return v4;
}

- (CGRect)filledRectForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = CGRectGetWidth(a3);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v9 = v8 / CGRectGetHeight(v29);
  -[UIImage size](self, "size");
  v11 = v10;
  -[UIImage size](self, "size");
  v13 = v11 / v12;
  v14 = v11 / v12 - v9;
  if (v14 < 0.0)
    v14 = -v14;
  if (v14 > 0.00000011920929)
  {
    v15 = x;
    v16 = y;
    v17 = width;
    v18 = height;
    if (v9 <= v13)
    {
      v22 = CGRectGetHeight(*(CGRect *)&v15);
      v23 = v13 * v22;
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v24 = CGRectGetWidth(v32);
      y = 0.0;
      v33.origin.x = 0.0;
      v33.origin.y = 0.0;
      v33.size.width = v23;
      v33.size.height = v22;
      x = (v24 - CGRectGetWidth(v33)) * 0.5;
      height = v22;
      width = v23;
    }
    else
    {
      v19 = CGRectGetWidth(*(CGRect *)&v15);
      v20 = v19 / v13;
      v30.origin.x = x;
      v30.origin.y = y;
      v30.size.width = width;
      v30.size.height = height;
      v21 = CGRectGetHeight(v30);
      x = 0.0;
      v31.origin.x = 0.0;
      v31.origin.y = 0.0;
      v31.size.width = v19;
      v31.size.height = v20;
      y = (v21 - CGRectGetHeight(v31)) * 0.5;
      height = v20;
      width = v19;
    }
  }
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (UIImage)imageWithCornerRadius:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
  v6 = v5;
  -[UIImage size](self, "size");
  return -[UIImage imageWithCornerRadius:scale:targetSize:](self, "imageWithCornerRadius:scale:targetSize:", a3, v6, v7, v8);
}

- (UIImage)imageWithCornerRadius:(double)a3 scale:(double)a4 targetSize:(CGSize)a5
{
  _QWORD v6[5];
  CGSize v7;
  double v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002BC04;
  v6[3] = &unk_1000DA298;
  v7 = a5;
  v8 = a3;
  v6[4] = self;
  return (UIImage *)(id)objc_claimAutoreleasedReturnValue(+[FRMacros imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:](FRMacros, "imageFromNewGraphicsContextWithSize:opaque:scale:contextBlock:", 0, v6, a5.width, a5.height, a4));
}

- (id)applyBlurWithRadius:(double)a3 tintColor:(id)a4 saturationDeltaFactor:(double)a5 maskImage:(id)a6 targetSize:(CGSize)a7 screenScale:(double)a8 opaque:(BOOL)a9 logoRect:(CGRect)a10 logoImage:(id)a11 logoText:(id)a12 cornerRadius:(double)a13 punchThroughBanner:(BOOL)a14 allowAldenTint:(BOOL)a15
{
  double height;
  double width;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  void *v34;
  unsigned int v35;
  char v36;
  uint64_t v37;
  UIImage *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  UIImage *v45;
  UIImage *v46;
  double v47;
  UIImage *v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  id v59;
  UIImage *v60;
  id v61;
  CGColorSpace *DeviceRGB;
  id v63;
  id v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v77;
  _QWORD v78[4];
  id v79;
  uint64_t *v80;
  uint64_t *v81;
  CGColorSpace *v82;
  double v83;
  double v84;
  double v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  UIImage *v95;
  id v96;
  UIImage *v97;
  id v98;
  uint64_t *v99;
  CGRect v100;
  double v101;
  double v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  double v107;
  id v108;
  BOOL v109;
  BOOL v110;
  char v111;
  BOOL v112;
  _QWORD v113[15];
  BOOL v114;
  BOOL v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t (*v119)(uint64_t, uint64_t);
  void (*v120)(uint64_t);
  id v121;

  height = a7.height;
  width = a7.width;
  v24 = a4;
  v25 = a6;
  v26 = a11;
  v77 = a12;
  if (width <= 0.0 || height <= 0.0)
  {
    -[UIImage size](self, "size");
    width = v27;
    height = v28;
  }
  if (fabs(a8) < 0.00999999978)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread](FRMacros, "deviceScreenScaleFromPotentialBackgroundThread");
    a8 = v29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 1.0));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v32 = objc_msgSend(v30, "_isSimilarToColor:withinPercentage:", v31, 0.1);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 1.0));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.392156863, 1.0));
  v35 = objc_msgSend(v33, "_isSimilarToColor:withinPercentage:", v34, 0.1);

  v36 = v32 | v35;
  if (((v32 | v35) & 1) == 0 && a15)
  {
    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "colorWithAlphaComponent:", 0.5));

    v24 = (id)v37;
  }
  if (width < 1.0 || height < 1.0)
  {
    v49 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007A524(v49, self);
    goto LABEL_36;
  }
  v38 = objc_retainAutorelease(self);
  if (!-[UIImage CGImage](v38, "CGImage"))
  {
    v50 = FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007A5EC((uint64_t)v38, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_36;
  }
  if (v25)
  {
    v39 = objc_retainAutorelease(v25);
    if (!objc_msgSend(v39, "CGImage"))
    {
      v65 = FCDefaultLog;
      if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
        sub_10007A71C((uint64_t)v39, v65, v66, v67, v68, v69, v70, v71);
LABEL_36:
      v64 = 0;
      goto LABEL_37;
    }
  }
  -[UIImage filledRectForRect:](v38, "filledRectForRect:", CGPointZero.x, CGPointZero.y, width, height);
  v74 = v41;
  v75 = v40;
  v43 = v42;
  v73 = v44;
  v45 = v38;
  v46 = v45;
  v47 = fabs(a5 + -1.0);
  if (a3 > 0.00000011920929 || v47 > 0.00000011920929)
  {
    v116 = 0;
    v117 = &v116;
    v118 = 0x3032000000;
    v119 = sub_100018594;
    v120 = sub_1000184EC;
    v121 = 0;
    v113[0] = _NSConcreteStackBlock;
    v113[1] = 3221225472;
    v113[2] = sub_10002C46C;
    v113[3] = &unk_1000DA2E8;
    *(double *)&v113[6] = width;
    *(double *)&v113[7] = height;
    v113[8] = v75;
    v113[9] = v74;
    v113[10] = v43;
    v113[11] = v73;
    v114 = a3 > 0.00000011920929;
    *(double *)&v113[12] = a8;
    *(double *)&v113[13] = a3;
    v115 = v47 > 0.00000011920929;
    *(double *)&v113[14] = a5;
    v113[4] = v45;
    v113[5] = &v116;
    +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v113, width, height, a8);
    v57 = (void *)v117[5];
    if (!v57)
    {
      v58 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "resultImage");
        sub_10007A6B8();
      }

      v57 = (void *)v117[5];
    }
    v48 = v57;

    _Block_object_dispose(&v116, 8);
  }
  else
  {
    v48 = v45;
  }
  v59 = -[UIImage imageOrientation](v46, "imageOrientation");
  v116 = 0;
  v117 = &v116;
  v118 = 0x3032000000;
  v119 = sub_100018594;
  v120 = sub_1000184EC;
  v121 = 0;
  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472;
  v92[2] = sub_10002C81C;
  v92[3] = &unk_1000DA310;
  v93 = v24;
  v100 = a10;
  v101 = width;
  v102 = height;
  v103 = v75;
  v104 = v74;
  v105 = v43;
  v106 = v73;
  v94 = v77;
  v95 = v46;
  v109 = a3 > 0.00000011920929;
  v96 = v25;
  v60 = v48;
  v97 = v60;
  v110 = a14;
  v111 = v36 ^ 1;
  v112 = a15;
  v98 = v26;
  v99 = &v116;
  v107 = a8;
  v108 = v59;
  +[FRMacros useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:forceSRGB:scale:contextBlock:", 0, 1, v92, width, height, a8);
  if (!v117[5])
  {
    v61 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "outputImage");
      sub_10007A654();
    }

  }
  if (a13 <= 0.00000011920929)
  {
    v64 = (id)v117[5];
  }
  else
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v86 = 0;
    v87 = &v86;
    v88 = 0x3032000000;
    v89 = sub_100018594;
    v90 = sub_1000184EC;
    v91 = 0;
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10002CD9C;
    v78[3] = &unk_1000DA360;
    v82 = DeviceRGB;
    v83 = a8;
    v63 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 1.0 / (a8 + a8), 1.0 / (a8 + a8), width - 1.0 / a8, height - 1.0 / a8, a13));
    v79 = v63;
    v80 = &v116;
    v84 = width;
    v85 = height;
    v81 = &v86;
    +[FRMacros useManagedContextWithSize:opaque:scale:contextBlock:](FRMacros, "useManagedContextWithSize:opaque:scale:contextBlock:", 0, v78, width, height, a8);
    CGColorSpaceRelease(DeviceRGB);
    v64 = (id)v87[5];

    _Block_object_dispose(&v86, 8);
  }

  _Block_object_dispose(&v116, 8);
LABEL_37:

  return v64;
}

- (CGSize)fr_sizeThatFills:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UIImage size](self, "size");
  v7 = v5 * (height / v6);
  if (v7 < width)
  {
    height = v6 * (width / v5);
    v7 = width;
  }
  v8 = v7;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

+ (id)fr_gradientImageForTextSize:(CGSize)a3 withStartColor:(id)a4 endColor:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  CGContext *CurrentContext;
  id v11;
  id v12;
  id v13;
  id v14;
  NSArray *v15;
  CGColorSpace *DeviceRGB;
  CGGradient *v17;
  float v18;
  CGFloat v19;
  UIImage *ImageFromCurrentImageContext;
  void *v21;
  CGFloat locations[3];
  CGSize v24;
  CGPoint v25;
  CGPoint v26;
  CGPoint v27;
  CGPoint v28;

  height = a3.height;
  width = a3.width;
  v8 = a5;
  v9 = a4;
  v24.width = width;
  v24.height = height;
  UIGraphicsBeginImageContext(v24);
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v11 = objc_retainAutorelease(v9);
  v12 = objc_msgSend(v11, "CGColor");

  v13 = objc_retainAutorelease(v8);
  v14 = objc_msgSend(v13, "CGColor");

  v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v14, 0, 0, 0x3FF0000000000000);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v17 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v15, locations);
  v25.x = 0.0;
  v25.y = 0.0;
  v27.x = width;
  v27.y = height;
  CGContextDrawLinearGradient(CurrentContext, v17, v25, v27, 0);
  v18 = width + height * 0.5;
  v19 = ceilf(v18);
  v26.x = 0.0;
  v26.y = 0.0;
  v28.x = width;
  v28.y = height;
  CGContextDrawRadialGradient(CurrentContext, v17, v26, 0.0, v28, v19, 0);
  CGGradientRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  UIGraphicsPopContext();
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  return v21;
}

+ (int64_t)fr_estimatedImageTypeWithData:(id)a3
{
  id v3;
  int64_t v4;
  unsigned __int8 v6;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
    goto LABEL_6;
  v6 = 0;
  v4 = 1;
  objc_msgSend(v3, "getBytes:length:", &v6, 1);
  if (v6 < 0x4Eu)
    goto LABEL_6;
  if (v6 != 255)
  {
    if (v6 == 137)
    {
      v4 = 2;
      goto LABEL_7;
    }
LABEL_6:
    v4 = 0;
  }
LABEL_7:

  return v4;
}

@end
