@implementation BKTextHighlightView

- (BKTextHighlightView)initWithFrame:(CGRect)a3
{
  BKTextHighlightView *v3;
  BKTextHighlightView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKTextHighlightView;
  v3 = -[BKTextHighlightView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView layer](v3, "layer"));
    objc_msgSend(v5, "setMasksToBounds:", 1);

    -[BKTextHighlightView setOpaque:](v4, "setOpaque:", 0);
    -[BKTextHighlightView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BKTextHighlightView *v4;
  BKTextHighlightView *v5;
  void *v6;
  void *v7;

  v4 = [BKTextHighlightView alloc];
  -[BKTextHighlightView frame](self, "frame");
  v5 = -[BKTextHighlightView initWithFrame:](v4, "initWithFrame:");
  -[BKTextHighlightView setHighlightType:](v5, "setHighlightType:", -[BKTextHighlightView highlightType](self, "highlightType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView owner](self, "owner"));
  -[BKTextHighlightView setOwner:](v5, "setOwner:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView image](self, "image"));
  -[BKTextHighlightView setImage:](v5, "setImage:", v7);

  -[BKTextHighlightView currentScale](self, "currentScale");
  -[BKTextHighlightView setCurrentScale:](v5, "setCurrentScale:");
  -[BKTextHighlightView setLightenBlend:](v5, "setLightenBlend:", -[BKTextHighlightView lightenBlend](self, "lightenBlend"));
  return v5;
}

+ (int)bkTextHighlightTypeForIMTextHighlightType:(unint64_t)a3
{
  if (a3 - 1 < 3)
    return a3;
  else
    return 0;
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKTextHighlightView;
  -[BKTextHighlightView didMoveToSuperview](&v4, "didMoveToSuperview");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView image](self, "image"));

  if (!v3)
    -[BKTextHighlightView updateHighlightImage](self, "updateHighlightImage");
}

- (CGRect)_safeInsetRect:(CGRect)a3 widthInset:(double)a4 heightInset:(double)a5
{
  if (a3.size.width <= a4 + a4)
    a4 = 0.0;
  if (a3.size.height <= a5 + a5)
    a5 = 0.0;
  return CGRectInset(a3, a4, a5);
}

- (id)_selectionImage
{
  int type;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CGFloat v9;
  CGFloat v10;
  CGContext *CurrentContext;
  void *v12;
  CGColorSpace *DeviceRGB;
  id v14;
  id v15;
  const __CFArray *v16;
  CGGradient *v17;
  CGFloat MidX;
  CGFloat MinY;
  CGFloat v20;
  UIImage *ImageFromCurrentImageContext;
  void *v22;
  const void *v24[2];
  CGFloat locations[3];
  CGSize v26;
  CGPoint v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  type = self->_type;
  if (type == 3)
  {
    v6 = 0.9;
    v4 = 1.0;
    v5 = 1.0;
  }
  else
  {
    if (type)
    {
      v5 = 0.89;
      v7 = 0.22;
      v4 = 1.0;
      v6 = 1.0;
      goto LABEL_7;
    }
    v4 = 0.647058824;
    v5 = 0.780392157;
    v6 = 0.47;
  }
  v7 = 1.0;
LABEL_7:
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v4, v5, v7, v6));
  -[BKTextHighlightView bounds](self, "bounds");
  v26.width = v9;
  v26.height = v10;
  UIGraphicsBeginImageContextWithOptions(v26, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  -[BKTextHighlightView bounds](self, "bounds");
  -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
  CGContextSaveGState(CurrentContext);
  objc_msgSend(v12, "addClip");
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  *(_OWORD *)locations = xmmword_172FE0;
  v14 = objc_retainAutorelease(v8);
  v24[0] = objc_msgSend(v14, "CGColor");
  v15 = objc_retainAutorelease(v14);
  v24[1] = objc_msgSend(v15, "CGColor", v24[0]);
  v16 = CFArrayCreate(0, v24, 2, &kCFTypeArrayCallBacks);
  v17 = CGGradientCreateWithColors(DeviceRGB, v16, locations);
  -[BKTextHighlightView bounds](self, "bounds");
  MidX = CGRectGetMidX(v29);
  -[BKTextHighlightView bounds](self, "bounds");
  MinY = CGRectGetMinY(v30);
  -[BKTextHighlightView bounds](self, "bounds");
  v20 = CGRectGetMidX(v31);
  -[BKTextHighlightView bounds](self, "bounds");
  v28.y = CGRectGetMaxY(v32);
  v27.x = MidX;
  v27.y = MinY;
  v28.x = v20;
  CGContextDrawLinearGradient(CurrentContext, v17, v27, v28, 0);
  CGGradientRelease(v17);
  CFRelease(v16);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRestoreGState(CurrentContext);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v22;
}

- (void)updateHighlightImage
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double top;
  double left;
  double v10;
  double v11;
  double v12;
  double v13;
  CGContext *CurrentContext;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat MinY;
  void *v19;
  void *v20;
  UIImage *ImageFromCurrentImageContext;
  void *v22;
  CGContext *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  UIImage *v29;
  void *v30;
  id v31;
  CGSize v32;
  CGSize v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[BKTextHighlightView frame](self, "frame");
  if (CGRectGetWidth(v34) != 0.0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView superview](self, "superview"));

    if (v3)
    {
      -[BKTextHighlightView setHidden:](self, "setHidden:", 1);
      if (self->_type > 3u)
        v31 = 0;
      else
        v31 = (id)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView _selectionImage](self, "_selectionImage"));
      -[BKTextHighlightView frame](self, "frame");
      v5 = v4;
      v7 = v6;
      top = self->_contentInsets.top;
      left = self->_contentInsets.left;
      v10 = left + 0.0;
      v11 = top + 0.0;
      v12 = v4 - (left + self->_contentInsets.right);
      v13 = v6 - (top + self->_contentInsets.bottom);
      v32.width = v12;
      v32.height = v13;
      UIGraphicsBeginImageContextWithOptions(v32, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      -[BKTextHighlightView frame](self, "frame");
      v15 = -CGRectGetMinX(v35);
      v36.origin.x = v10;
      v36.origin.y = v11;
      v36.size.width = v12;
      v36.size.height = v13;
      v16 = v15 - CGRectGetMinX(v36);
      -[BKTextHighlightView frame](self, "frame");
      v17 = -CGRectGetMinY(v37);
      v38.origin.x = v10;
      v38.origin.y = v11;
      v38.size.width = v12;
      v38.size.height = v13;
      MinY = CGRectGetMinY(v38);
      CGContextTranslateCTM(CurrentContext, v16, v17 - MinY);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextHighlightView superview](self, "superview"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layer"));
      objc_msgSend(v20, "renderInContext:", CurrentContext);

      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v22 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      UIGraphicsEndImageContext();
      if (v31)
      {
        v33.width = v5;
        v33.height = v7;
        UIGraphicsBeginImageContextWithOptions(v33, 0, 0.0);
        v23 = UIGraphicsGetCurrentContext();
        CGContextSaveGState(v23);
        -[BKTextHighlightView lightenBlend](self, "lightenBlend");
        -[BKTextHighlightView bounds](self, "bounds");
        objc_msgSend(v31, "drawInRect:blendMode:alpha:", 0);
        if (!self->_type)
        {
          CGContextSetBlendMode(v23, kCGBlendModeSourceAtop);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5));
          objc_msgSend(v24, "set");

          -[BKTextHighlightView bounds](self, "bounds");
          -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
          objc_msgSend(v25, "stroke");

        }
        CGContextRestoreGState(v23);
        if (-[BKTextHighlightView lightenBlend](self, "lightenBlend"))
          v26 = 2;
        else
          v26 = 1;
        objc_msgSend(v22, "drawInRect:blendMode:alpha:", v26, v10, v11, v12, v13, 1.0);
        if (self->_type == 3)
        {
          CGContextSetBlendMode(v23, kCGBlendModeNormal);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.2));
          objc_msgSend(v27, "setStroke");

          -[BKTextHighlightView bounds](self, "bounds");
          -[BKTextHighlightView _safeInsetRect:widthInset:heightInset:](self, "_safeInsetRect:widthInset:heightInset:");
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:"));
          objc_msgSend(v28, "stroke");

        }
        v29 = UIGraphicsGetImageFromCurrentImageContext();
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        UIGraphicsEndImageContext();
        -[BKTextHighlightView setImage:](self, "setImage:", v30);

      }
      -[BKTextHighlightView setHidden:](self, "setHidden:", 0);

    }
  }
}

- (void)setHighlightType:(int)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    -[BKTextHighlightView updateHighlightImage](self, "updateHighlightImage");
  }
}

- (void)setFrame:(CGRect)a3
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  v13 = CGRectIntegral(a3);
  x = v13.origin.x;
  y = v13.origin.y;
  width = v13.size.width;
  height = v13.size.height;
  -[BKTextHighlightView frame](self, "frame");
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (!CGRectEqualToRect(v14, v15))
  {
    v12.receiver = self;
    v12.super_class = (Class)BKTextHighlightView;
    -[BKTextHighlightView setFrame:](&v12, "setFrame:", x, y, width, height);
    -[BKTextHighlightView updateHighlightImage](self, "updateHighlightImage");
  }
}

- (id)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong(&self->_owner, a3);
}

- (BOOL)imageHighlight
{
  return self->_imageHighlight;
}

- (void)setImageHighlight:(BOOL)a3
{
  self->_imageHighlight = a3;
}

- (float)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(float)a3
{
  self->_currentScale = a3;
}

- (BOOL)lightenBlend
{
  return self->_lightenBlend;
}

- (void)setLightenBlend:(BOOL)a3
{
  self->_lightenBlend = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (int)highlightType
{
  return self->_type;
}

- (AEHighlightLine)highlightLine
{
  return self->_highlightLine;
}

- (void)setHighlightLine:(id)a3
{
  objc_storeStrong((id *)&self->_highlightLine, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightLine, 0);
  objc_storeStrong(&self->_owner, 0);
}

@end
