@implementation _PULightingGradientView

- (_PULightingGradientView)initWithFrame:(CGRect)a3
{
  _PULightingGradientView *v3;
  _PULightingGradientView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PULightingGradientView;
  v3 = -[_PULightingGradientView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_PULightingGradientView setContentMode:](v3, "setContentMode:", 3);
    -[_PULightingGradientView setBackgroundColor:](v4, "setBackgroundColor:", 0);
    -[_PULightingGradientView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
  }
  return v4;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGContext *CurrentContext;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  const __CFArray *v19;
  id v20;
  CGColorSpace *ColorSpace;
  CGGradient *v22;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v25;
  __int128 v26;
  _QWORD v27[6];
  CGPoint v28;
  CGPoint v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v27[5] = *MEMORY[0x1E0C80C00];
  -[_PULightingGradientView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5 > 0.0)
  {
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    CurrentContext = UIGraphicsGetCurrentContext();
    v30.origin.x = v7;
    v30.origin.y = v8;
    v30.size.width = v9;
    v30.size.height = v10;
    CGContextClearRect(CurrentContext, v30);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "set");

    v31.origin.x = v7;
    v31.origin.y = v8;
    v31.size.width = v9;
    v31.size.height = v10;
    CGContextFillRect(CurrentContext, v31);
    v32.origin.x = v7;
    v32.origin.y = v8;
    v32.size.width = v9;
    v32.size.height = v10;
    CGContextClipToRect(CurrentContext, v32);
    v15 = objc_retainAutorelease(v12);
    objc_msgSend(v15, "CGColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_retainAutorelease(v13);
    objc_msgSend(v17, "CGColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v18;
    v27[1] = v18;
    v27[2] = v18;
    v27[3] = v16;
    v27[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 5);
    v19 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v20 = objc_retainAutorelease(v15);
    ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v20, "CGColor", 0, 0x3FE0000000000000, 0x3FECCCCCCCCCCCCDLL, 0x3FEFD70A3D70A3D7, 0x3FF0000000000000, 0));
    v22 = CGGradientCreateWithColors(ColorSpace, v19, (const CGFloat *)&v26);
    v33.origin.x = v7;
    v33.origin.y = v8;
    v33.size.width = v9;
    v33.size.height = v10;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = v7;
    v34.origin.y = v8;
    v34.size.width = v9;
    v34.size.height = v10;
    MinY = CGRectGetMinY(v34);
    v35.origin.x = v7;
    v35.origin.y = v8;
    v35.size.width = v9;
    v35.size.height = v10;
    v25 = CGRectGetMinX(v35);
    v36.origin.x = v7;
    v36.origin.y = v8;
    v36.size.width = v9;
    v36.size.height = v10;
    v29.y = CGRectGetMaxY(v36);
    v28.x = MinX;
    v28.y = MinY;
    v29.x = v25;
    CGContextDrawLinearGradient(CurrentContext, v22, v28, v29, 0);
    CGGradientRelease(v22);

  }
}

@end
