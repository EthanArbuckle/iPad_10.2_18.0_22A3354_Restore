@implementation TSWClipView

- (TSWClipView)initWithFrame:(CGRect)a3
{
  TSWClipView *v3;
  id v4;
  UIView *v5;
  id v6;
  UIView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWClipView;
  v3 = -[TSWClipView initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIView);
    -[TSWClipView bounds](v3, "bounds");
    v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
    v3->_outerClipView = v5;
    -[TSWClipView addSubview:](v3, "addSubview:", v5);
    v6 = objc_alloc((Class)UIView);
    -[TSWClipView bounds](v3, "bounds");
    v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
    v3->_innerClipView = v7;
    -[UIView addSubview:](v3->_outerClipView, "addSubview:", v7);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWClipView;
  -[TSWClipView dealloc](&v3, "dealloc");
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWClipView;
  -[TSWClipView setFrame:](&v12, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSWClipView bounds](self, "bounds");
  -[UIView setFrame:](-[TSWClipView outerClipView](self, "outerClipView"), "setFrame:", v4, v5, v6, v7);
  -[TSWClipView bounds](self, "bounds");
  -[UIView setFrame:](-[TSWClipView innerClipView](self, "innerClipView"), "setFrame:", v8, v9, v10, v11);
  -[TSWClipView p_clearViewMasks](self, "p_clearViewMasks");
  -[TSWClipView p_updateViewMasks](self, "p_updateViewMasks");
}

- (void)setBounds:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSWClipView;
  -[TSWClipView setBounds:](&v12, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSWClipView bounds](self, "bounds");
  -[UIView setFrame:](-[TSWClipView outerClipView](self, "outerClipView"), "setFrame:", v4, v5, v6, v7);
  -[TSWClipView bounds](self, "bounds");
  -[UIView setFrame:](-[TSWClipView innerClipView](self, "innerClipView"), "setFrame:", v8, v9, v10, v11);
  -[TSWClipView p_clearViewMasks](self, "p_clearViewMasks");
  -[TSWClipView p_updateViewMasks](self, "p_updateViewMasks");
}

- (void)updateClipWithOuterPath:(CGPath *)a3 innerPath:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  TSDBezierPath *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;

  self->_outerPath = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", a3);
  v12 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", a4);
  self->_innerPath = v12;
  self->_fadeSizes.top = top;
  self->_fadeSizes.left = left;
  self->_fadeSizes.bottom = bottom;
  self->_fadeSizes.right = right;
  self->_fadeSizes.top = TSURound(v12, top);
  self->_fadeSizes.bottom = TSURound(v13, self->_fadeSizes.bottom);
  self->_fadeSizes.left = TSURound(v14, self->_fadeSizes.left);
  self->_fadeSizes.right = TSURound(v15, self->_fadeSizes.right);
  -[TSWClipView p_clearViewMasks](self, "p_clearViewMasks");
  -[TSWClipView p_updateViewMasks](self, "p_updateViewMasks");
}

- (void)addBackgroundView:(id)a3
{
  -[UIView insertSubview:belowSubview:](self->_outerClipView, "insertSubview:belowSubview:", a3, self->_innerClipView);
  -[TSWClipView p_updateViewMasks](self, "p_updateViewMasks");
}

- (void)addContentView:(id)a3
{
  -[UIView addSubview:](self->_innerClipView, "addSubview:", a3);
  -[TSWClipView p_updateViewMasks](self, "p_updateViewMasks");
}

- (BOOL)needOuterMask
{
  return -[NSArray count](-[UIView subviews](self->_outerClipView, "subviews"), "count") >= 2 && self->_outerPath != 0;
}

- (BOOL)needInnerMask
{
  NSUInteger v3;

  v3 = -[NSArray count](-[UIView subviews](self->_innerClipView, "subviews"), "count");
  if (v3)
    LOBYTE(v3) = self->_innerPath != 0;
  return v3;
}

- (void)p_clearViewMasks
{
  -[CALayer setMask:](-[UIView layer](self->_outerClipView, "layer"), "setMask:", 0);
  -[CALayer setMask:](-[UIView layer](self->_innerClipView, "layer"), "setMask:", 0);
}

- (void)p_updateViewMasks
{
  unsigned int v3;
  CALayer *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  unsigned int v11;
  CALayer *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v3 = -[TSWClipView needOuterMask](self, "needOuterMask");
  v4 = -[UIView layer](self->_outerClipView, "layer");
  if (v3)
  {
    if (-[CALayer mask](v4, "mask"))
      goto LABEL_6;
    -[UIView bounds](self->_outerClipView, "bounds");
    v9 = -[TSWClipView p_outerMaskLayerWithFrame:path:](self, "p_outerMaskLayerWithFrame:path:", -[TSDBezierPath CGPath](self->_outerPath, "CGPath"), v5, v6, v7, v8);
    v4 = -[UIView layer](self->_outerClipView, "layer");
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  -[CALayer setMask:](v4, "setMask:", v10);
LABEL_6:
  v11 = -[TSWClipView needInnerMask](self, "needInnerMask");
  v12 = -[UIView layer](self->_innerClipView, "layer");
  if (!v11)
  {
    v13 = 0;
LABEL_11:
    -[CALayer setMask:](v12, "setMask:", v13);
    return;
  }
  if (!-[CALayer mask](v12, "mask"))
  {
    -[UIView bounds](self->_innerClipView, "bounds");
    v18 = -[TSWClipView p_innerMaskLayerWithBounds:path:fadeSizes:](self, "p_innerMaskLayerWithBounds:path:fadeSizes:", -[TSDBezierPath CGPath](self->_innerPath, "CGPath"), v14, v15, v16, v17, self->_fadeSizes.top, self->_fadeSizes.left, self->_fadeSizes.bottom, self->_fadeSizes.right);
    v12 = -[UIView layer](self->_innerClipView, "layer");
    v13 = v18;
    goto LABEL_11;
  }
}

- (id)p_innerMaskLayerWithBounds:(CGRect)a3 path:(CGPath *)a4 fadeSizes:(UIEdgeInsets)a5
{
  double bottom;
  double top;
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGContext *v20;
  NSArray *v21;
  CGColorSpace *DeviceRGB;
  CGGradient *v23;
  CGFloat MinY;
  CGFloat MaxY;
  CGFloat v26;
  CGFloat v27;
  CGImage *Image;
  id v29;
  CGFloat rect;
  double rect_8;
  double rect_16;
  double rect_24;
  double x;
  double y;
  CGPoint v37;
  CGPoint v38;
  CGPoint v39;
  CGPoint v40;
  CGRect BoundingBox;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  bottom = a5.bottom;
  rect_8 = a5.bottom;
  rect_16 = a3.size.width;
  top = a5.top;
  height = a3.size.height;
  rect_24 = a3.size.height;
  x = a3.origin.x;
  width = a3.size.width;
  y = a3.origin.y;
  -[TSWClipView maskGroupVerticalInset](self, "maskGroupVerticalInset");
  v10 = top;
  v12 = (top + bottom) * 0.5 + v11;
  BoundingBox = CGPathGetBoundingBox(a4);
  v13 = TSDRoundedRectForMainScreen(BoundingBox.origin.x, v12 + BoundingBox.origin.y, BoundingBox.size.width, BoundingBox.size.height + v12 * -2.0);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = (CGContext *)TSUCreateRGBABitmapContext(0, width, height, 1.0);
  v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.0), "CGColor"), -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 1.0), "CGColor"), 0);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v23 = CGGradientCreateWithColors(DeviceRGB, (CFArrayRef)v21, 0);
  CGContextAddPath(v20, a4);
  CGContextClip(v20);
  v42.origin.x = v13;
  v42.origin.y = v15;
  v42.size.width = v17;
  v42.size.height = v19;
  MinY = CGRectGetMinY(v42);
  v43.origin.x = v13;
  v43.origin.y = v15;
  v43.size.width = v17;
  v43.size.height = v19;
  v39.y = v10 + CGRectGetMinY(v43);
  v37.x = 0.0;
  v39.x = 0.0;
  v37.y = MinY;
  CGContextDrawLinearGradient(v20, v23, v37, v39, 0);
  v44.origin.x = v13;
  v44.origin.y = v15;
  v44.size.width = v17;
  v44.size.height = v19;
  MaxY = CGRectGetMaxY(v44);
  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  v40.y = CGRectGetMaxY(v45) - rect_8;
  v38.x = 0.0;
  v40.x = 0.0;
  v38.y = MaxY;
  CGContextDrawLinearGradient(v20, v23, v38, v40, 0);
  CGContextSetRGBFillColor(v20, 0.0, 0.0, 0.0, 1.0);
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v19;
  rect = CGRectGetMinX(v46);
  v47.origin.x = v13;
  v47.origin.y = v15;
  v47.size.width = v17;
  v47.size.height = v19;
  v26 = v10 + CGRectGetMinY(v47);
  v48.origin.x = v13;
  v48.origin.y = v15;
  v48.size.width = v17;
  v48.size.height = v19;
  v27 = CGRectGetWidth(v48);
  v49.origin.x = v13;
  v49.origin.y = v15;
  v49.size.width = v17;
  v49.size.height = v19;
  v50.size.height = CGRectGetHeight(v49) - v10 - rect_8;
  v50.origin.x = rect;
  v50.origin.y = v26;
  v50.size.width = v27;
  CGContextFillRect(v20, v50);
  CGGradientRelease(v23);
  CGColorSpaceRelease(DeviceRGB);
  Image = CGBitmapContextCreateImage(v20);
  CGContextRelease(v20);
  v29 = objc_alloc_init((Class)CALayer);
  objc_msgSend(v29, "setFrame:", x, y, rect_16, rect_24);
  objc_msgSend(v29, "setContents:", Image);
  CGImageRelease(Image);
  return v29;
}

- (id)p_outerMaskLayerWithFrame:(CGRect)a3 path:(CGPath *)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  objc_msgSend(v9, "setPath:", a4);
  return v9;
}

- (UIView)outerClipView
{
  return self->_outerClipView;
}

- (void)setOuterClipView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (UIView)innerClipView
{
  return self->_innerClipView;
}

- (void)setInnerClipView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDBezierPath)outerPath
{
  return self->_outerPath;
}

- (void)setOuterPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSDBezierPath)innerPath
{
  return self->_innerPath;
}

- (void)setInnerPath:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (UIEdgeInsets)fadeSizes
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fadeSizes.top;
  left = self->_fadeSizes.left;
  bottom = self->_fadeSizes.bottom;
  right = self->_fadeSizes.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFadeSizes:(UIEdgeInsets)a3
{
  self->_fadeSizes = a3;
}

- (double)maskGroupVerticalInset
{
  return self->_maskGroupVerticalInset;
}

- (void)setMaskGroupVerticalInset:(double)a3
{
  self->_maskGroupVerticalInset = a3;
}

@end
