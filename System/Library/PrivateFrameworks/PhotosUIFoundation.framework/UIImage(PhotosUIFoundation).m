@implementation UIImage(PhotosUIFoundation)

- (id)px_tintedImageWithColor:()PhotosUIFoundation
{
  CGFloat v4;
  CGFloat v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGSize v15;
  CGRect v16;

  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = a3;
  objc_msgSend(a1, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "scale");
  v12 = v11;
  v15.width = v8;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v12);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0);
  objc_msgSend(v6, "setFill");

  v16.origin.x = v4;
  v16.origin.y = v5;
  v16.size.width = v8;
  v16.size.height = v10;
  UIRectFillUsingBlendMode(v16, kCGBlendModeSourceIn);
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v13;
}

- (double)px_pixelSize
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "scale");
  return v3 * v4;
}

- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "contentInsets");
  objc_msgSend(a1, "px_tintedCircularImageWithColor:backgroundColor:backgroundInsets:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)px_tintedCircularImageWithColor:()PhotosUIFoundation backgroundColor:backgroundInsets:
{
  id v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGContext *CurrentContext;
  void *v25;
  CGSize v27;
  CGRect v28;
  CGRect v29;

  v14 = a8;
  v15 = *MEMORY[0x24BDBF090];
  v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v17 = a7;
  objc_msgSend(a1, "size");
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1, "scale");
  v23 = v22;
  v27.width = v19;
  v27.height = v21;
  UIGraphicsBeginImageContextWithOptions(v27, 0, v23);
  objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 17, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), 1.0);
  objc_msgSend(v17, "setFill");

  v28.origin.x = v15;
  v28.origin.y = v16;
  v28.size.width = v19;
  v28.size.height = v21;
  UIRectFillUsingBlendMode(v28, kCGBlendModeSourceIn);
  if (v14)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v14, "setFill");
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationAtop);
    v29.origin.x = a3 + v15;
    v29.origin.y = a2 + v16;
    v29.size.width = v19 - (a3 + a5);
    v29.size.height = v21 - (a2 + a4);
    CGContextFillEllipseInRect(CurrentContext, v29);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v25;
}

+ (id)px_imageNamed:()PhotosUIFoundation bundle:
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "px_imageNamed:configuration:bundle:", v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)px_imageNamed:()PhotosUIFoundation configuration:bundle:
{
  return objc_msgSend(MEMORY[0x24BEBD640], "imageNamed:inBundle:withConfiguration:", a3, a5, a4);
}

+ (id)px_systemImageNamed:()PhotosUIFoundation withConfiguration:
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)px_imageFromSolidColor:()PhotosUIFoundation
{
  id v3;
  CGContext *CurrentContext;
  id v5;
  CGColor *v6;
  void *v7;
  CGSize v9;
  CGRect v10;

  v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContext(v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  v5 = objc_retainAutorelease(v3);
  v6 = (CGColor *)objc_msgSend(v5, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v6);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v7;
}

@end
