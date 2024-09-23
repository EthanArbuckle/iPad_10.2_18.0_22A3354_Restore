@implementation UIView

- (CGRect)imaxFrameFromBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  -[UIView convertRect:toView:](self, "convertRect:toView:", v8, x, y, width, height);
  objc_msgSend(v8, "convertRect:toWindow:", 0);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)imaxFrameToBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
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
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  objc_msgSend(v8, "convertRect:fromWindow:", 0, x, y, width, height);
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)imaxScreenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v3, "scale");
  v5 = v4;

  return v5;
}

- (void)debugHighlightView
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  -[UIView debugHighlightViewWithColor:width:](self, "debugHighlightViewWithColor:width:", v3, 2.0);

}

- (void)debugHighlightViewBlue
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
  -[UIView debugHighlightViewWithColor:width:](self, "debugHighlightViewWithColor:width:", v3, 2.0);

}

- (void)debugHighlightViewWithColor:(id)a3 width:(double)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "CGColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v8, "setBorderColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v9, "setBorderWidth:", a4);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v10, "setCornerRadius:", 4.0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "colorWithAlphaComponent:", 0.3));
  v14 = objc_retainAutorelease(v11);
  v12 = objc_msgSend(v14, "CGColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v13, "setBackgroundColor:", v12);

}

- (id)im_snapshotInContext
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _QWORD v25[5];
  uint8_t buf[4];
  UIView *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  -[UIView bounds](self, "bounds");
  if (v3 <= 0.0 || (v5 = v4, v4 <= 0.0))
  {
    v20 = BCIMLog();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v27 = (UIView *)"-[UIView(IMAdditions) im_snapshotInContext]";
      v28 = 2080;
      v29 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/UIView+IMAdditions.m";
      v30 = 1024;
      v31 = 117;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v22 = BCIMLog();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = self;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "@\"Snapshotting a CGSizeZero view: %@\", buf, 0xCu);
    }

    v19 = 0;
  }
  else
  {
    v6 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    objc_msgSend(v7, "scale");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v10, "bounds");
    v12 = CGSizeScaleToScreen(v11);
    v14 = v13;

    if (v12 < v6 || v14 < v5)
      v9 = CGSizeScaleThatFitsInCGSize(v15, v16, v6, v5, v12, v14);
    objc_msgSend(v7, "setScale:", v9);
    v18 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v7, v6, v5);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_71BCC;
    v25[3] = &unk_28ED00;
    v25[4] = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithActions:", v25));

  }
  return v19;
}

- (id)im_snapshot
{
  return -[UIView im_snapshotAfterScreenUpdates:](self, "im_snapshotAfterScreenUpdates:", 1);
}

- (id)im_snapshotAfterScreenUpdates:(BOOL)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  _QWORD v17[5];
  BOOL v18;
  uint8_t buf[4];
  UIView *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  -[UIView bounds](self, "bounds");
  if (v5 <= 0.0 || (v7 = v6, v6 <= 0.0))
  {
    v12 = BCIMLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v20 = (UIView *)"-[UIView(IMAdditions) im_snapshotAfterScreenUpdates:]";
      v21 = 2080;
      v22 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Views/UIView+IMAdditions.m";
      v23 = 1024;
      v24 = 143;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v14 = BCIMLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = self;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"Snapshotting a CGSizeZero view: %@\", buf, 0xCu);
    }

    v11 = 0;
  }
  else
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v10 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v9, v8, v7);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_71E08;
    v17[3] = &unk_28ED28;
    v17[4] = self;
    v18 = a3;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageWithActions:", v17));

  }
  return v11;
}

- (id)subviewOfClass:(Class)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
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

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews"));
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
      if ((objc_opt_isKindOfClass(v9, a3) & 1) != 0)
        break;
      if (v6 == (id)++v8)
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
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "subviewOfClass:", a3, (_QWORD)v18));
        if (v16)
        {
          v10 = (id)v16;
          goto LABEL_21;
        }
      }
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

- (id)bc_ancestorOfClass:(Class)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  if (v4)
  {
    v5 = (void *)v4;
    while ((objc_opt_isKindOfClass(v5, a3) & 1) == 0)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_5;
    }
    v7 = v5;
  }
  else
  {
LABEL_5:
    v7 = 0;
  }

  return v7;
}

- (id)findFirstResponder
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (-[UIView isFirstResponder](self, "isFirstResponder"))
    return self;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView subviews](self, "subviews", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "findFirstResponder"));
        if (v9)
        {
          v10 = (void *)v9;

          return v10;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 0;
}

- (void)printResponderChain
{
  UIView *v2;
  void *v3;
  uint64_t v4;
  id v5;
  const char *v6;
  uint64_t v7;

  v2 = self;
  if (v2)
  {
    v3 = v2;
    v4 = 1;
    do
    {
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "description")));
      v6 = (const char *)objc_msgSend(v5, "cStringUsingEncoding:", 30);

      printf("%lu. %s\n", v4++, v6);
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nextResponder"));

      v3 = (void *)v7;
    }
    while (v7);
  }
}

- (void)setRoundedCorners:(int64_t)a3 radius:(double)a4
{
  char v4;
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

  v4 = a3;
  -[UIView bounds](self, "bounds");
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
  if ((v4 & 1) != 0)
    v16 = a4;
  else
    v16 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, v16);
  if ((v4 & 2) != 0)
    v17 = a4;
  else
    v17 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, v17);
  if ((v4 & 8) != 0)
    v18 = a4;
  else
    v18 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, MidX, MaxY, v18);
  if ((v4 & 4) != 0)
    v19 = a4;
  else
    v19 = 0.0;
  CGPathAddArcToPoint(Mutable, 0, MinX, MaxY, MinX, MidY, v19);
  CGPathCloseSubpath(Mutable);
  v24 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v24, "setPath:", Mutable);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v20, "setMask:", 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v21, "setMask:", v24);

  CFRelease(Mutable);
}

- (void)attachPopUpAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  CATransform3D v19;
  CATransform3D v20;
  CATransform3D v21;
  CATransform3D v22;
  CATransform3D v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("transform")));
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeScale(&v23, 0.5, 0.5, 1.0);
  memset(&v22, 0, sizeof(v22));
  CATransform3DMakeScale(&v22, 1.2, 1.2, 1.0);
  memset(&v21, 0, sizeof(v21));
  CATransform3DMakeScale(&v21, 0.9, 0.9, 1.0);
  memset(&v20, 0, sizeof(v20));
  CATransform3DMakeScale(&v20, 1.0, 1.0, 1.0);
  v19 = v23;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v19));
  v19 = v22;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v19));
  v19 = v21;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v19));
  v19 = v20;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v19));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v4, v5, v6, v7, 0));

  objc_msgSend(v3, "setValues:", v8);
  LODWORD(v9) = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  LODWORD(v11) = 0.5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v11));
  LODWORD(v13) = 1063675494;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v13));
  LODWORD(v15) = 1.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v10, v12, v14, v16, 0));

  objc_msgSend(v3, "setKeyTimes:", v17);
  objc_msgSend(v3, "setFillMode:", kCAFillModeForwards);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "setDuration:", 0.2);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v18, "addAnimation:forKey:", v3, CFSTR("popup"));

}

- (UIColor)debugingBorderColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", objc_msgSend(v2, "borderColor")));

  return (UIColor *)v3;
}

- (void)setDebugingBorderColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "CGColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v6, "setBorderColor:", v5);

  if (v4)
    v7 = 1.0;
  else
    v7 = 0.0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v8, "setBorderWidth:", v7);

}

- (BOOL)isViewSizeFullScreenInWindow:(id)a3 ignoreInWindowCheck:(BOOL)a4
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
  char v26;

  v6 = a3;
  -[UIView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  if (v6)
  {
    v13 = v7;
    v14 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));

    if (v15)
    {
      -[UIView convertRect:toView:](self, "convertRect:toView:", v6, v13, v14, v10, v12);
      objc_msgSend(v6, "convertRect:toWindow:", 0);
      v10 = v16;
      v12 = v17;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  }
  v19 = v18;
  objc_msgSend(v18, "bounds");
  v21 = v20;
  v23 = v22;

  v24 = v12 == v23 && v10 == v21;
  if (v24 || a4)
  {
    if (v24)
    {
      v26 = 1;
      goto LABEL_18;
    }
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));

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

- (BOOL)im_isCompactWidth
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "horizontalSizeClass") == (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)im_isCompactHeight
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "verticalSizeClass") == (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)im_isPartialScreen
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
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
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView window](self, "window"));
  if (!v2)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
    if (!v2)
      return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v8, "bounds");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v11, "bounds");
  v13 = v12;

  objc_msgSend(v2, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screen"));
  objc_msgSend(v22, "bounds");
  if (vabdd_f64(v15, v26) >= 0.00999999978
    || vabdd_f64(v17, v23) >= 0.00999999978
    || vabdd_f64(v19, v24) >= 0.00999999978
    || vabdd_f64(v21, v25) >= 0.00999999978)
  {
    objc_msgSend(v2, "bounds");
    v27 = vabdd_f64(v31, v5) >= 0.00999999978
       || vabdd_f64(v28, v7) >= 0.00999999978
       || vabdd_f64(v29, v10) >= 0.00999999978
       || vabdd_f64(v30, v13) >= 0.00999999978;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSArray)bc_constraintsToFillSuperview
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v18[0] = v15;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  v18[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  v18[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v18[3] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 4));

  return (NSArray *)v14;
}

- (NSArray)bc_constraintsToFitInSuperviewCentered
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  double v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _BYTE v38[128];
  _QWORD v39[4];

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self, "superview"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v30));
  v39[0] = v29;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintLessThanOrEqualToAnchor:", v5));
  v39[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self, "leadingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintLessThanOrEqualToAnchor:", v8));
  v39[2] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self, "trailingAnchor"));
  v32 = v3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintLessThanOrEqualToAnchor:", v11));
  v39[3] = v12;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 4));

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v28;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v34;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v13);
        LODWORD(v15) = 1147207680;
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v18), "setPriority:", v15);
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v16);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](self, "centerXAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v20));
  v37[0] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](self, "centerYAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "centerYAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v23));
  v37[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 2));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v25));

  return (NSArray *)v26;
}

- (CGRect)adjustRectCenter:(CGRect)a3 fromView:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  double MidX;
  double MidY;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MidY = CGRectGetMidY(v17);
  -[UIView convertPoint:fromView:](self, "convertPoint:fromView:", v9, MidX, MidY);
  v13 = v12;
  v15 = v14;

  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  return CGRectOffset(v18, v13 - MidX, v15 - MidY);
}

- (BOOL)im_isStyleDark
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView traitCollection](self, "traitCollection"));
  v3 = objc_msgSend(v2, "bc_userInterfaceStyleDark");

  return v3;
}

+ (void)bc_animateWithDelay:(double)a3 springAnimation:(id)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  _BCCustomAnimationCurveFactory *v16;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v16 = objc_alloc_init(_BCCustomAnimationCurveFactory);
  -[_BCCustomAnimationCurveFactory setSpringAnimation:](v16, "setSpringAnimation:", v13);
  objc_msgSend(v13, "settlingDuration");
  v15 = v14;

  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", a5 | 0x60000, v16, v12, v11, v15, a3);
}

- (id)imaxParentAnnotationPopoverViewController
{
  return __IMAccessibilityGetAssociatedObject(self, &unk_3115A0);
}

- (void)imaxSetParentAnnotationPopoverViewController:(id)a3
{
  __IMAccessibilitySetAssociatedNonRetainedObject(self, &unk_3115A0, a3);
}

@end
