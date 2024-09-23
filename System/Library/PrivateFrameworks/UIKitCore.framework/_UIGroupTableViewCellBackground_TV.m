@implementation _UIGroupTableViewCellBackground_TV

- (_UIGroupTableViewCellBackground_TV)initWithFrame:(CGRect)a3 backgroundImageColor:(id)a4 cornerRadius:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  _UIGroupTableViewCellBackground_TV *v12;
  _UIGroupTableViewCellBackground_TV *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIGroupTableViewCellBackground_TV;
  v12 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
    -[_UIGroupTableViewCellBackground_TV updateBackgroundImageColor:cornerRadius:](v12, "updateBackgroundImageColor:cornerRadius:", v11, a5);

  return v13;
}

- (void)updateBackgroundImageColor:(id)a3 cornerRadius:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  CGColorSpace *DeviceRGB;
  CGFloat v13;
  CGFloat Height;
  CGContext *v15;
  id v16;
  id v17;
  CGColor *v18;
  id v19;
  CGColor *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const CGPath *v25;
  const CGPath *v26;
  CGColor *v27;
  id v28;
  CGImage *Image;
  void *v30;
  UIImageView *backgroundImageView;
  UIImageView *v32;
  UIImageView *v33;
  UIImageView *v34;
  __int128 v35;
  __int128 v36;
  double v37;
  CGSize v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v6 = a3;
  v7 = v6;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  v35 = 0u;
  v36 = 0u;
  v37 = a4;
  if (v6)
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v35, (char *)&v35 + 8, &v36, (char *)&v36 + 8);
  objc_msgSend(v8, "valueWithBytes:objCType:", &v35, "{TVShadowComponentsKey=ddddd}");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSValue isEqualToValue:](self->_currentShadowKey, "isEqualToValue:", v9, v35, v36, *(_QWORD *)&v37))
  {
    objc_storeStrong((id *)&self->_currentShadowKey, v9);
    if (_MergedGlobals_1_22 != -1)
      dispatch_once(&_MergedGlobals_1_22, &__block_literal_global_518);
    objc_msgSend((id)qword_1ECD79F30, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = v7;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v39.origin.x = 10.0;
      v39.origin.y = 10.0;
      v39.size.width = a4 + a4 + 10.0;
      v39.size.height = v39.size.width;
      v13 = CGRectGetWidth(v39) + 20.0;
      v40.origin.x = 10.0;
      v40.origin.y = 10.0;
      v40.size.width = a4 + a4 + 10.0;
      v40.size.height = v40.size.width;
      Height = CGRectGetHeight(v40);
      v15 = CGBitmapContextCreate(0, (unint64_t)v13, (unint64_t)(Height + 20.0), 8uLL, 0, DeviceRGB, 0x2002u);
      CGColorSpaceRelease(DeviceRGB);
      CGContextSaveGState(v15);
      if (a4 == 0.0)
        +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", 10.0, 10.0, a4 + a4 + 10.0, a4 + a4 + 10.0);
      else
        +[UIBezierPath _bezierPathWithPillRect:cornerRadius:](UIBezierPath, "_bezierPathWithPillRect:cornerRadius:", 10.0, 10.0, a4 + a4 + 10.0, a4 + a4 + 10.0, a4 + 1.0);
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      CGContextAddPath(v15, (CGPathRef)objc_msgSend(v16, "CGPath"));
      +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.05);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (CGColor *)objc_msgSend(v17, "CGColor");

      +[UIColor blackColor](UIColor, "blackColor");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = (CGColor *)objc_msgSend(v19, "CGColor");

      v38.width = 0.0;
      v38.height = 0.0;
      CGContextSetShadowWithColor(v15, v38, 10.0, v20);
      CGContextSetFillColorWithColor(v15, v18);
      CGContextFillPath(v15);
      CGContextRestoreGState(v15);
      v21 = 10.0;
      v22 = 10.0;
      v23 = a4 + a4 + 10.0;
      v24 = v23;
      if (a4 == 0.0)
        v25 = CGPathCreateWithRect(*(CGRect *)&v21, 0);
      else
        v25 = CGPathCreateWithRoundedRect(*(CGRect *)&v21, a4, a4, 0);
      v26 = v25;
      CGContextAddPath(v15, v25);
      if (v7)
      {
        v27 = (CGColor *)objc_msgSend(objc_retainAutorelease(v11), "CGColor");
      }
      else
      {
        +[UIColor clearColor](UIColor, "clearColor");
        v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v27 = (CGColor *)objc_msgSend(v28, "CGColor");

      }
      CGContextSetFillColorWithColor(v15, v27);
      CGContextSetBlendMode(v15, kCGBlendModeCopy);
      CGContextFillPath(v15);
      CGPathRelease(v26);
      Image = CGBitmapContextCreateImage(v15);
      CFRelease(v15);
      +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", Image);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(Image);
      objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 1, a4 + 10.0, a4 + 10.0, a4 + 10.0, a4 + 10.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)qword_1ECD79F30, "setObject:forKey:", v10, v9);
    }
    backgroundImageView = self->_backgroundImageView;
    if (!backgroundImageView)
    {
      v32 = [UIImageView alloc];
      -[UIView bounds](self, "bounds");
      v42 = CGRectInset(v41, -10.0, -10.0);
      v33 = -[UIImageView initWithFrame:](v32, "initWithFrame:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
      v34 = self->_backgroundImageView;
      self->_backgroundImageView = v33;

      -[UIView setAutoresizingMask:](self->_backgroundImageView, "setAutoresizingMask:", 18);
      -[UIView addSubview:](self, "addSubview:", self->_backgroundImageView);
      backgroundImageView = self->_backgroundImageView;
    }
    -[UIImageView setImage:](backgroundImageView, "setImage:", v10);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundImageView, 0);
  objc_storeStrong((id *)&self->_currentShadowKey, 0);
}

@end
