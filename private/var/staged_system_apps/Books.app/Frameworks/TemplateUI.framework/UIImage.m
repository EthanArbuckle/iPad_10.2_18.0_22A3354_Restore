@implementation UIImage

+ (id)tui_imageNamed:(id)a3 inBundle:(id)a4
{
  return +[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", a3, a4, 0);
}

- (id)tui_imageMaskWithColor:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;

  v4 = a3;
  -[UIImage size](self, "size");
  v6 = v5;
  v8 = v7;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_170A08;
  v18[3] = &unk_243318;
  v20 = v5;
  v21 = v7;
  v22 = 0;
  v23 = 0;
  v24 = v5;
  v25 = v7;
  v18[4] = self;
  v19 = v4;
  v9 = v4;
  v10 = objc_retainBlock(v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat defaultFormat](UIGraphicsImageRendererFormat, "defaultFormat"));
  v12 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v11, v6, v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_170AAC;
  v16[3] = &unk_243340;
  v17 = v10;
  v13 = v10;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageWithActions:", v16));

  return v14;
}

- (BOOL)tui_isWideGamut
{
  UIImage *v2;
  CGColorSpace *ColorSpace;

  v2 = objc_retainAutorelease(self);
  return -[UIImage CGImage](v2, "CGImage")
      && (ColorSpace = CGImageGetColorSpace(-[UIImage CGImage](objc_retainAutorelease(v2), "CGImage"))) != 0
      && CGColorSpaceIsWideGamutRGB(ColorSpace);
}

- (BOOL)tui_isDeepColor
{
  UIImage *v2;
  CGImage *v3;

  v2 = objc_retainAutorelease(self);
  v3 = -[UIImage CGImage](v2, "CGImage");
  if (v3)
    LOBYTE(v3) = CGImageGetBitsPerPixel(-[UIImage CGImage](objc_retainAutorelease(v2), "CGImage")) == 64;
  return (char)v3;
}

- (BOOL)tui_isMulticolorSymbolWithSymbolRenderingMode:(unint64_t)a3
{
  if (a3 - 1 < 2)
    return -[UIImage _isHierarchicalColorSymbolImage](self, "_isHierarchicalColorSymbolImage");
  if (a3 == 3)
    return -[UIImage _isMultiColorSymbolImage](self, "_isMultiColorSymbolImage");
  return 0;
}

+ (id)tui_imageWithCGImage:(CGImage *)a3
{
  return objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:", a3);
}

- (CGImage)tui_CGImage
{
  return -[UIImage CGImage](objc_retainAutorelease(self), "CGImage");
}

- (id)tui_initWithCGImage:(CGImage *)a3 scale:(double)a4
{
  return objc_msgSend(objc_alloc((Class)UIImage), "initWithCGImage:scale:orientation:", a3, 0, a4);
}

@end
