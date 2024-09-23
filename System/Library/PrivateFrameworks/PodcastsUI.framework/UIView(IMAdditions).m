@implementation UIView(IMAdditions)

- (void)debugHighlightView
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugHighlightViewWithColor:width:", v2, 2.0);

}

- (void)debugHighlightViewBlue
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "blueColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugHighlightViewWithColor:width:", v2, 2.0);

}

- (void)debugHighlightViewWithColor:()IMAdditions width:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "CGColor");
  objc_msgSend(a1, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderColor:", v7);

  objc_msgSend(a1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBorderWidth:", a4);

  objc_msgSend(a1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", 4.0);

  objc_msgSend(v6, "colorWithAlphaComponent:", 0.3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v11);
  v12 = objc_msgSend(v14, "CGColor");
  objc_msgSend(a1, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

}

- (id)snapshot_cg
{
  double v2;
  size_t v3;
  CGColorSpace *DeviceRGB;
  double v5;
  size_t v6;
  double v7;
  CGContext *v8;
  void *v9;
  CGImage *Image;
  void *v11;

  objc_msgSend(a1, "bounds");
  v3 = vcvtd_n_u64_f64(v2, 2uLL);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  objc_msgSend(a1, "bounds");
  v6 = (unint64_t)v5;
  objc_msgSend(a1, "bounds");
  v8 = CGBitmapContextCreate(0, v6, (unint64_t)v7, 8uLL, v3, DeviceRGB, 0x4001u);
  objc_msgSend(a1, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "renderInContext:", v8);

  Image = CGBitmapContextCreateImage(v8);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", Image);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v8);
  return v11;
}

- (id)imageSnapshot
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  char v8;
  CGContextRef CurrentContext;
  void *v10;
  void *v11;
  void *v12;
  CGSize v14;

  objc_msgSend(a1, "bounds");
  if (v2 <= 0.0 || (objc_msgSend(a1, "bounds"), v3 <= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0D7F1C8], "sharedLogger");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/PodcastsUI/PodcastsUI/PodcastsUI/Extensions/UIKit/UIView+IMAdditions.m", 66, CFSTR("Snapshotting a CGSizeZero view: %@"), a1);

    v11 = 0;
  }
  else
  {
    objc_msgSend(a1, "bounds");
    v5 = v4;
    v7 = v6;
    v8 = objc_msgSend(a1, "isOpaque");
    v14.width = v5;
    v14.height = v7;
    IMGraphicsBeginImageContextWithOptions(v14, v8, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(a1, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "renderInContext:", CurrentContext);

    UIGraphicsGetImageFromCurrentImageContext();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }
  return v11;
}

- (id)subviewOfClass:()IMAdditions
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "subviews");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (v10)
      goto LABEL_22;
  }
  else
  {
LABEL_9:

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    while (2)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "subviewOfClass:", a3, (_QWORD)v18);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v10 = (id)v16;
          goto LABEL_21;
        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (v13)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_21:

LABEL_22:
  return v10;
}

- (id)ancestorOfClass:()IMAdditions
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    while ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v2, "superview");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v3;
      if (!v3)
        goto LABEL_5;
    }
    v4 = v2;
  }
  else
  {
LABEL_5:
    v4 = 0;
  }

  return v4;
}

- (id)findFirstResponder
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "isFirstResponder"))
    return a1;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a1, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "findFirstResponder");
        v8 = objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = (void *)v8;

          return v9;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  return 0;
}

- (void)printResponderChain
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  const char *v5;
  uint64_t v6;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = 1;
    do
    {
      objc_msgSend(v2, "description");
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = (const char *)objc_msgSend(v4, "cStringUsingEncoding:", 30);

      printf("%lu. %s\n", v3++, v5);
      objc_msgSend(v2, "nextResponder");
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
    }
    while (v6);
  }
}

- (void)setRoundedCorners:()IMAdditions radius:
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MidY;
  CGFloat MaxY;
  CGPath *Mutable;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CGFloat MidX;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  objc_msgSend(a1, "bounds");
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;
  MinX = CGRectGetMinX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  MinY = CGRectGetMinY(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  MidY = CGRectGetMidY(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MaxY = CGRectGetMaxY(v30);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, MinX, MidY);
  if ((a4 & 1) != 0)
    v16 = a2;
  else
    v16 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, v16);
  if ((a4 & 2) != 0)
    v17 = a2;
  else
    v17 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, v17);
  if ((a4 & 8) != 0)
    v18 = a2;
  else
    v18 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, v18);
  if ((a4 & 4) != 0)
    v19 = a2;
  else
    v19 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, v19);
  CGPathCloseSubpath(Mutable);
  v24 = objc_alloc_init(MEMORY[0x1E0CD2840]);
  objc_msgSend(v24, "setPath:", Mutable);
  objc_msgSend(a1, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setMask:", 0);

  objc_msgSend(a1, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setMask:", v24);

  CFRelease(Mutable);
}

- (void)attachPopUpAnimation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;
  CATransform3D v24;

  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v24, 0, sizeof(v24));
  CATransform3DMakeScale(&v24, 0.5, 0.5, 1.0);
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeScale(&v23, 1.2, 1.2, 1.0);
  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 0.9, 0.9, 1.0);
  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeScale(&v21, 1.0, 1.0, 1.0);
  v3 = (void *)MEMORY[0x1E0C99D20];
  v20 = v24;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v23;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v22;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v21;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", v4, v5, v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setValues:", v8);
  v9 = (void *)MEMORY[0x1E0C99D20];
  LODWORD(v10) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = 1063675494;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithObjects:", v11, v13, v15, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setKeyTimes:", v18);
  objc_msgSend(v2, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v2, "setRemovedOnCompletion:", 0);
  objc_msgSend(v2, "setDuration:", 0.2);
  objc_msgSend(a1, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addAnimation:forKey:", v2, CFSTR("popup"));

}

- (id)debugingBorderColor
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0DC3658];
  objc_msgSend(a1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithCGColor:", objc_msgSend(v2, "borderColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setDebugingBorderColor:()IMAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  id v8;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGColor");
  objc_msgSend(a1, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBorderColor:", v5);

  if (v4)
    v7 = 1.0;
  else
    v7 = 0.0;
  objc_msgSend(a1, "layer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", v7);

}

- (BOOL)isViewSizeFullScreenInWindow:()IMAdditions ignoreInWindowCheck:
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;
  void *v25;
  _BOOL8 v26;

  v6 = a3;
  objc_msgSend(a1, "bounds");
  v10 = v9;
  v12 = v11;
  if (v6)
  {
    v13 = v7;
    v14 = v8;
    objc_msgSend(a1, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(a1, "convertRect:toView:", v6, v13, v14, v10, v12);
      objc_msgSend(v6, "convertRect:toWindow:", 0);
      v10 = v16;
      v12 = v17;
    }
    objc_msgSend(v6, "screen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
  objc_msgSend(v18, "bounds");
  v21 = v20;
  v23 = v22;

  v24 = v12 == v23 && v10 == v21;
  if (v24 || (a4 & 1) != 0)
  {
    if (v24)
    {
      v26 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    objc_msgSend(a1, "window");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = 0;
      goto LABEL_18;
    }
  }
  v26 = v10 == v23 && v12 == v21;
LABEL_18:

  return v26;
}

- (double)adjustRectCenter:()IMAdditions fromView:
{
  id v12;
  double MidX;
  double MidY;
  double v15;
  double v16;
  double v17;
  double v18;
  double result;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v12 = a7;
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = a2;
  v21.origin.y = a3;
  v21.size.width = a4;
  v21.size.height = a5;
  MidY = CGRectGetMidY(v21);
  objc_msgSend(a1, "convertPoint:fromView:", v12, MidX, MidY);
  v16 = v15;
  v18 = v17;

  v22.origin.x = a2;
  v22.origin.y = a3;
  v22.size.width = a4;
  v22.size.height = a5;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v22, v16 - MidX, v18 - MidY);
  return result;
}

- (BOOL)isHorizontallySpecified
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") != 0;

  return v2;
}

- (BOOL)isHorizontallyCompact
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 1;

  return v2;
}

- (BOOL)isHorizontallyRegular
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 2;

  return v2;
}

- (BOOL)isVerticallySpecified
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") != 0;

  return v2;
}

- (BOOL)isVerticallyCompact
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") == 1;

  return v2;
}

- (BOOL)isVerticallyRegular
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "verticalSizeClass") == 2;

  return v2;
}

@end
