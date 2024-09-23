@implementation _TVUberBlurImageDecorator

- (id)decorate:(id)a3 scaledWithSize:(CGSize)a4 croppedToFit:(BOOL)a5
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double x;
  double y;
  double v25;
  double v26;
  void *v27;
  double v28;
  CGFloat v29;
  CGContext *CurrentContext;
  double v31;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v33;
  id v34;
  id v35;
  const __CFArray *v36;
  CGGradient *v37;
  CGGradient *v38;
  double v39;
  id v40;
  TVImage *v41;
  CGImage *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  void *v51;
  void *v52;
  id v53;
  CGImage *v54;
  size_t Width;
  size_t Height;
  void *v57;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  CGDataProvider *DataProvider;
  const CGFloat *Decode;
  size_t v63;
  CGImage *v64;
  CGImage *v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  double v71;
  CGFloat v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  CGImage *v82;
  CGImage *v83;
  CGFloat v84;
  CGFloat v85;
  void *v86;
  CGContext *c;
  id v89;
  void *v90;
  CGAffineTransform v91;
  CGAffineTransform v92;
  _QWORD v93[2];
  CGFloat locations[2];
  uint64_t v95;
  CGSize v96;
  CGPoint v97;
  CGSize v98;
  CGPoint v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  v95 = *MEMORY[0x24BDAC8D0];
  v6 = (objc_class *)MEMORY[0x24BDF6AC8];
  v7 = a3;
  v8 = [v6 alloc];
  v9 = objc_retainAutorelease(v7);
  v10 = objc_msgSend(v9, "image");

  v11 = (void *)objc_msgSend(v8, "initWithCGImage:", v10);
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;

  if (self->_blurType > 1)
  {
    -[_TVUberBlurImageDecorator gradientColor](self, "gradientColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      v45 = v43;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.117647059, 0.117647059, 0.117647059, 0.2);
      v45 = (id)objc_claimAutoreleasedReturnValue();
    }
    v40 = v45;

    _TVBlurredImageWithOptionsAndOverlayColorForImage(v11, 13, v40, v14, v16, 2.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v42 = CGImageRetain((CGImageRef)objc_msgSend(objc_retainAutorelease(v46), "CGImage"));
      if (v42)
        goto LABEL_22;
    }
    if (objc_msgSend(v47, "ioSurface"))
    {
      objc_msgSend(v47, "ioSurface");
      v42 = (CGImage *)_UICreateCGImageFromIOSurfaceWithOptions();
      if (v42)
      {
LABEL_22:
        v89 = v40;
        v90 = v47;
        objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "scale");
        v50 = v49;
        v98.width = v14;
        v98.height = v16;
        UIGraphicsBeginImageContextWithOptions(v98, 0, v50);

        c = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(c, 0.0, v16);
        CGContextScaleCTM(c, 1.0, -1.0);
        +[TVMLUtilities TVMLKitBundle](TVMLUtilities, "TVMLKitBundle");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "tv_imageNamed:", CFSTR("Music_Uber_Blur_Gradient"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = objc_retainAutorelease(v52);
        v54 = (CGImage *)objc_msgSend(v53, "CGImage");
        Width = CGImageGetWidth(v54);
        Height = CGImageGetHeight(v54);
        v57 = v11;
        BitsPerComponent = CGImageGetBitsPerComponent(v54);
        BitsPerPixel = CGImageGetBitsPerPixel(v54);
        BytesPerRow = CGImageGetBytesPerRow(v54);
        DataProvider = CGImageGetDataProvider(v54);
        Decode = CGImageGetDecode(v54);
        v63 = BitsPerComponent;
        v11 = v57;
        v64 = v42;
        v65 = CGImageMaskCreate(Width, Height, v63, BitsPerPixel, BytesPerRow, DataProvider, Decode, 0);
        CGContextSetBlendMode(c, kCGBlendModeCopy);
        objc_msgSend(v11, "size");
        v67 = v66;
        v69 = v68;
        v70 = v14 / v66;
        v71 = v16 / v68;
        if (v70 < v71)
          v70 = v71;
        CGAffineTransformMakeScale(&v91, v70, v70);
        v102.origin.x = 0.0;
        v102.origin.y = 0.0;
        v102.size.width = v67;
        v102.size.height = v69;
        v103 = CGRectApplyAffineTransform(v102, &v91);
        v72 = *MEMORY[0x24BDBEFB0];
        v73 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        +[TVMLUtilities centerRect:inRect:](TVMLUtilities, "centerRect:inRect:", v103.origin.x, v103.origin.y, v103.size.width, v103.size.height, *MEMORY[0x24BDBEFB0], v73, v14, v16);
        v75 = v74;
        v77 = v76;
        v79 = v78;
        v81 = v80;
        v82 = (CGImage *)objc_msgSend(objc_retainAutorelease(v11), "CGImage");
        v104.origin.x = v75;
        v104.origin.y = v77;
        v104.size.width = v79;
        v104.size.height = v81;
        CGContextDrawImage(c, v104, v82);
        CGContextSetBlendMode(c, kCGBlendModeNormal);
        v83 = CGImageCreateWithMask(v42, v65);
        objc_msgSend(v53, "size");
        v105.size.width = v84;
        v105.size.height = v85;
        v105.origin.x = v72;
        v105.origin.y = v73;
        CGContextDrawImage(c, v105, v83);
        UIGraphicsGetImageFromCurrentImageContext();
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        if (v86)
          v42 = -[TVImage initWithCGImageRef:preserveAlpha:]([TVImage alloc], "initWithCGImageRef:preserveAlpha:", objc_msgSend(objc_retainAutorelease(v86), "CGImage"), 0);
        else
          v42 = 0;
        CFRelease(v83);
        CFRelease(v65);
        CFRelease(v64);

        v40 = v89;
        v47 = v90;
      }
    }
    else
    {
      v42 = 0;
    }

    goto LABEL_30;
  }
  objc_msgSend(v11, "size");
  v18 = v17;
  v20 = v19;
  v21 = v14 / v17;
  v22 = v16 / v19;
  if (v21 < v22)
    v21 = v22;
  CGAffineTransformMakeScale(&v92, v21, v21);
  v100.origin.x = 0.0;
  v100.origin.y = 0.0;
  v100.size.width = v18;
  v100.size.height = v20;
  v101 = CGRectApplyAffineTransform(v100, &v92);
  x = v101.origin.x;
  y = v101.origin.y;
  v25 = v101.size.width;
  v26 = v101.size.height;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "scale");
  v29 = v28;
  v96.width = v14;
  v96.height = v16;
  UIGraphicsBeginImageContextWithOptions(v96, 0, v29);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  +[TVMLUtilities centerRect:inRect:](TVMLUtilities, "centerRect:inRect:", x, y, v25, v26, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v14, v16);
  v31 = 1.0;
  objc_msgSend(v11, "drawInRect:blendMode:alpha:", 17);
  CGContextRestoreGState(CurrentContext);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (DeviceRGB)
  {
    v33 = DeviceRGB;
    if (self->_blurStyle != 1)
      v31 = 0.0;
    *(_OWORD *)locations = xmmword_222E76EB0;
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v31, 0.2);
    v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v93[0] = objc_msgSend(v34, "CGColor");
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", v31, 0.0);
    v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v93[1] = objc_msgSend(v35, "CGColor");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v93, 2);
    v36 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    v37 = CGGradientCreateWithColors(v33, v36, locations);
    if (v37)
    {
      v38 = v37;
      v39 = 0.598958333;
      if (self->_blurType == 1)
        v39 = 0.5;
      v97.x = v14 * v39;
      v99.x = v97.x + v14 * 0.104166667;
      v97.y = 0.0;
      v99.y = 0.0;
      CGContextDrawLinearGradient(CurrentContext, v37, v97, v99, 3u);
      CFRelease(v38);
    }
    CFRelease(v33);

  }
  UIGraphicsGetImageFromCurrentImageContext();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  if (v40)
  {
    v41 = [TVImage alloc];
    v40 = objc_retainAutorelease(v40);
    v42 = -[TVImage initWithCGImageRef:preserveAlpha:](v41, "initWithCGImageRef:preserveAlpha:", objc_msgSend(v40, "CGImage"), 0);
  }
  else
  {
    v42 = 0;
  }
LABEL_30:

  return v42;
}

- (id)decoratorIdentifier
{
  return CFSTR("uber");
}

- (UIColor)gradientColor
{
  return self->_gradientColor;
}

- (void)setGradientColor:(id)a3
{
  objc_storeStrong((id *)&self->_gradientColor, a3);
}

- (unint64_t)blurType
{
  return self->_blurType;
}

- (void)setBlurType:(unint64_t)a3
{
  self->_blurType = a3;
}

- (unint64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(unint64_t)a3
{
  self->_blurStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientColor, 0);
}

@end
