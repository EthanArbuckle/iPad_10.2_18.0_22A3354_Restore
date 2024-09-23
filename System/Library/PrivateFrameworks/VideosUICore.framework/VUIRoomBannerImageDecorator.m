@implementation VUIRoomBannerImageDecorator

- (id)decoratorIdentifier
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIRoomBannerImageDecorator;
  -[VUIImageScaleDecorator decoratorIdentifier](&v5, sel_decoratorIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_ru"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)needsAlphaForImage:(id)a3
{
  return 1;
}

- (void)drawInContext:(id)a3 imageRect:(CGRect)a4
{
  double height;
  id v5;
  void *v6;
  id v7;
  id v8;
  const __CFArray *v9;
  CGGradientRef v10;
  CGGradient *v11;
  CGFloat v12;
  CGFloat v13;
  CGContext *v14;
  _QWORD v15[3];
  CGPoint v16;
  CGPoint v17;

  height = a4.size.height;
  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (height > 120.0)
  {
    CGContextTranslateCTM((CGContextRef)objc_msgSend(v5, "CGContext"), 0.0, height);
    CGContextScaleCTM((CGContextRef)objc_msgSend(v6, "CGContext"), 1.0, -1.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15[0] = objc_msgSend(v7, "CGColor");
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15[1] = objc_msgSend(v8, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v9 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

    v10 = CGGradientCreateWithColors(0, v9, 0);
    if (v10)
    {
      v11 = v10;
      v12 = *MEMORY[0x1E0C9D538];
      v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      CGContextSetBlendMode((CGContextRef)objc_msgSend(v6, "CGContext"), kCGBlendModeDestinationIn);
      v14 = (CGContext *)objc_msgSend(v6, "CGContext");
      v16.y = 120.0;
      v16.x = 0.0;
      v17.x = v12;
      v17.y = v13;
      CGContextDrawLinearGradient(v14, v11, v16, v17, 0);
      CGGradientRelease(v11);
    }

  }
}

@end
