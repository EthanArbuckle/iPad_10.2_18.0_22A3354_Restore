@implementation PLImageView

- (PLImageView)initWithFrame:(CGRect)a3
{
  PLImageView *v3;
  PLImageView *v4;
  UIView *v5;
  CALayer *v6;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)PLImageView;
  v3 = -[PLImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PLImageView setContentMode:](v3, "setContentMode:", 1);
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      -[PLImageView bounds](v4, "bounds");
      v10 = CGRectInset(v9, -1.0, -1.0);
      v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v10.origin.x, v10.origin.y, v10.size.width, v10.size.height);
      v4->_borderView = v5;
      -[UIView setAutoresizingMask:](v5, "setAutoresizingMask:", 18);
      v6 = -[UIView layer](v4->_borderView, "layer");
      -[PLImageView setDrawsBorder:](v4, "setDrawsBorder:", 1);
      -[CALayer setEdgeAntialiasingMask:](v6, "setEdgeAntialiasingMask:", 0);
      -[CALayer setAllowsEdgeAntialiasing:](v6, "setAllowsEdgeAntialiasing:", 1);
      -[PLImageView addSubview:](v4, "addSubview:", v4->_borderView);
      -[UIView setHidden:](v4->_borderView, "setHidden:", 1);
    }
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setEdgeAntialiasingMask:", 0);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setAllowsEdgeAntialiasing:", 1);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setContentsOpaque:", 1);
    objc_msgSend((id)-[PLImageView layer](v4, "layer"), "setAllowsDisplayCompositing:", 0);
    v4->_accessoryViewsAlpha = 1.0;
    v4->_placeholderScale = 1.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[PLImageView setTextBadgeString:](self, "setTextBadgeString:", 0);
  -[PLImageView setVideoView:](self, "setVideoView:", 0);
  -[UIView removeFromSuperview](self->_borderView, "removeFromSuperview");

  v3.receiver = self;
  v3.super_class = (Class)PLImageView;
  -[PLImageView dealloc](&v3, sel_dealloc);
}

- (CGSize)sizeThatFits:(CGSize)a3 allowRounding:(BOOL)a4
{
  _BOOL4 v4;
  double height;
  double width;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  objc_msgSend((id)-[PLImageView image](self, "image"), "size");
  v9 = v8 == *(double *)(MEMORY[0x1E0C9D820] + 8) && v7 == *MEMORY[0x1E0C9D820];
  v10 = v7 / v8;
  if (v9)
    v10 = 1.5;
  if (v10 > 1.0)
  {
    height = width / v10;
    if (!v4)
      goto LABEL_11;
    goto LABEL_10;
  }
  width = height * v10;
  if (v4)
  {
LABEL_10:
    PLPhysicalScreenScale();
    width = rint(width * v11) / v11;
    height = rint(height * v11) / v11;
  }
LABEL_11:
  v12 = width;
  v13 = height;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PLImageView sizeThatFits:allowRounding:](self, "sizeThatFits:allowRounding:", 1, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)renderSnapshotInContext:(CGContext *)a3
{
  _BOOL4 edgeAntialiasingEnabled;
  void *v6;
  double a;
  double b;
  double c;
  double d;
  double v11;
  double v12;
  CGAffineTransform v13;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v16;

  edgeAntialiasingEnabled = self->_edgeAntialiasingEnabled;
  if (!self->_edgeAntialiasingEnabled)
    -[PLImageView setEdgeAntialiasingEnabled:](self, "setEdgeAntialiasingEnabled:", 1);
  v6 = (void *)-[PLImageView layer](self, "layer");
  if ((*((_BYTE *)self + 584) & 1) != 0)
  {
    CGContextGetCTM(&t1, a3);
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&t2, &v13);
    CGAffineTransformConcat(&v16, &t1, &t2);
    a = v16.a;
    b = v16.b;
    c = v16.c;
    d = v16.d;
    PLPhysicalScreenScale();
    objc_msgSend(v6, "setShadowRadius:", sqrt((d * 0.0 + b * (v11 * 4.0)) * (d * 0.0 + b * (v11 * 4.0))+ (c * 0.0 + a * (v11 * 4.0)) * (c * 0.0 + a * (v11 * 4.0))));
  }
  objc_msgSend(v6, "renderInContext:", a3);
  if ((*((_BYTE *)self + 584) & 1) != 0)
  {
    PLPhysicalScreenScale();
    objc_msgSend(v6, "setShadowRadius:", v12 * 4.0);
  }
  -[PLImageView setEdgeAntialiasingEnabled:](self, "setEdgeAntialiasingEnabled:", edgeAntialiasingEnabled);
}

- (CGRect)_leftAccessoryViewFrame
{
  UIView *leftAccessoryView;
  CGRect v4;
  CGRect v5;

  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView)
  {
    -[UIView frame](leftAccessoryView, "frame");
    -[UIView bounds](self->_borderView, "bounds");
    CGRectGetMinX(v4);
    UIRectCenteredYInRect();
    return CGRectOffset(v5, self->_leftAccessoryViewOffset.width, self->_leftAccessoryViewOffset.height);
  }
  else
  {
    return *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D648];
  }
}

- (CGRect)_bottomRightAccessoryViewFrame
{
  UIView *bottomRightAccessoryView;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double MaxX;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double MaxY;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat rect;
  CGFloat rect_8;
  double rect_16;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  bottomRightAccessoryView = self->_bottomRightAccessoryView;
  if (bottomRightAccessoryView)
  {
    -[UIView frame](bottomRightAccessoryView, "frame");
    v5 = v4;
    v7 = v6;
    rect_8 = v8;
    v10 = v9;
    -[UIView bounds](self->_borderView, "bounds");
    v12 = v11;
    rect = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    +[PLImageView badgeOffset](PLImageView, "badgeOffset");
    v20 = v19;
    rect_16 = v21;
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    MaxX = CGRectGetMaxX(v34);
    v35.origin.x = v5;
    v23 = v7;
    v35.origin.y = v7;
    v24 = rect_8;
    v35.size.width = rect_8;
    v35.size.height = v10;
    v25 = MaxX - CGRectGetWidth(v35) - v20 + -1.0;
    v36.origin.x = rect;
    v36.origin.y = v14;
    v36.size.width = v16;
    v36.size.height = v18;
    MaxY = CGRectGetMaxY(v36);
    v37.origin.x = v25;
    v37.origin.y = v23;
    v37.size.width = rect_8;
    v37.size.height = v10;
    v27 = MaxY - CGRectGetHeight(v37) - rect_16 + -1.0;
  }
  else
  {
    v25 = *MEMORY[0x1E0C9D648];
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v28 = v25;
  v29 = v24;
  v30 = v10;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v27;
  result.origin.x = v28;
  return result;
}

- (void)layoutSubviews
{
  PLTiledLayer *fullSizeImageTiledLayer;
  CGAffineTransform v4;
  CATransform3D v5;
  CGAffineTransform v6;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)PLImageView;
  -[PLImageView layoutSubviews](&v7, sel_layoutSubviews);
  -[PLImageView bounds](self, "bounds");
  v8.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
  v8.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  v9 = CGRectInset(v8, -1.0, -1.0);
  -[UIView setFrame:](self->_borderView, "setFrame:", v9.origin.x, v9.origin.y, v9.size.width, v9.size.height);
  if (self->_leftAccessoryView)
  {
    -[PLImageView _leftAccessoryViewFrame](self, "_leftAccessoryViewFrame");
    -[UIView setFrame:](self->_leftAccessoryView, "setFrame:");
  }
  if (self->_bottomRightAccessoryView)
  {
    -[PLImageView _bottomRightAccessoryViewFrame](self, "_bottomRightAccessoryViewFrame");
    -[UIView setFrame:](self->_bottomRightAccessoryView, "setFrame:");
  }
  if ((*((_BYTE *)self + 584) & 1) != 0)
    -[PLImageView _updateShadowPath](self, "_updateShadowPath");
  if (self->_fullSizeImageTiledLayer)
  {
    memset(&v6, 0, sizeof(v6));
    -[PLImageView _transformForFullSizeImageTiledLayer](self, "_transformForFullSizeImageTiledLayer");
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setValue:forKey:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD3160]);
    fullSizeImageTiledLayer = self->_fullSizeImageTiledLayer;
    v4 = v6;
    CATransform3DMakeAffineTransform(&v5, &v4);
    -[PLTiledLayer setTransform:](fullSizeImageTiledLayer, "setTransform:", &v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    -[PLImageView updateFullSizeImageVisibleArea](self, "updateFullSizeImageVisibleArea");
  }
}

- (void)_updateShadowPath
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  CGPath *Mutable;
  CGRect v15;

  v3 = (void *)-[PLImageView layer](self, "layer");
  if ((*((_BYTE *)self + 584) & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = +[PLCGPathCache sharedPathCache](PLCGPathCache, "sharedPathCache");
    Mutable = CGPathRetain((CGPathRef)objc_msgSend(v13, "pathForKey:", v6, v8, v10, v12));
    if (!Mutable)
    {
      Mutable = CGPathCreateMutable();
      v15.origin.x = v6;
      v15.origin.y = v8;
      v15.size.width = v10;
      v15.size.height = v12;
      CGPathAddRect(Mutable, 0, v15);
      objc_msgSend(v13, "setPath:forKey:", Mutable, v6, v8, v10, v12);
    }
    objc_msgSend(v4, "setShadowPath:", Mutable);
    CGPathRelease(Mutable);
  }
}

- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
  double height;
  double width;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  PLTiledLayer *v17;

  height = a4.height;
  width = a4.width;
  PLPhysicalScreenScale();
  v11 = v10;
  v12 = (void *)-[PLImageView window](self, "window");
  if (!v12)
    v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication"), "pl_firstKeyWindow");
  objc_msgSend((id)objc_msgSend(v12, "screen"), "bounds");
  v14 = v11 * v13;
  v16 = v11 * v15;
  -[PLTiledLayer removeFromSuperlayer](self->_fullSizeImageTiledLayer, "removeFromSuperlayer");

  v17 = -[PLTiledLayer initWithJPEGData:placeholderImage:screenSize:]([PLTiledLayer alloc], "initWithJPEGData:placeholderImage:screenSize:", a3, 0, v14, v16);
  self->_fullSizeImageTiledLayer = v17;
  -[PLTiledLayer setFrame:](v17, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), width, height);
  self->_fullSizeImageOrientation = a5;
  objc_msgSend((id)-[PLImageView layer](self, "layer"), "addSublayer:", self->_fullSizeImageTiledLayer);
  -[PLImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateFullSizeImageVisibleArea
{
  PLImageView *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double Width;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;

  v3 = self;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v3 = (PLImageView *)-[PLImageView superview](v3, "superview");
    if (!v3)
      return;
  }
  -[PLImageView bounds](v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PLTiledLayer convertRect:fromLayer:](self->_fullSizeImageTiledLayer, "convertRect:fromLayer:", -[PLImageView layer](v3, "layer"), v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v23.origin.x = v5;
  v23.origin.y = v7;
  v23.size.width = v9;
  v23.size.height = v11;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v13;
  v24.origin.y = v15;
  v24.size.width = v17;
  v24.size.height = v19;
  v21 = Width / CGRectGetWidth(v24);
  PLPhysicalScreenScale();
  -[PLTiledLayer setVisibleRectangle:zoomScale:](self->_fullSizeImageTiledLayer, "setVisibleRectangle:zoomScale:", v13, v15, v17, v19, v21 * v22);
}

- (CGAffineTransform)_transformForFullSizeImageTiledLayer
{
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat Width;
  CGFloat v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;

  v5 = MEMORY[0x1E0C9BAA8];
  v22 = *MEMORY[0x1E0C9BAA8];
  v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v23;
  v21 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v21;
  -[PLTiledLayer bounds](self->_fullSizeImageTiledLayer, "bounds");
  v7 = v6;
  v9 = v8;
  -[PLImageView bounds](self, "bounds");
  Width = CGRectGetWidth(v28);
  v11 = Width / v7;
  *(_OWORD *)&v27.a = v22;
  *(_OWORD *)&v27.c = v23;
  *(_OWORD *)&v27.tx = v21;
  CGAffineTransformTranslate(retstr, &v27, v7 * ((Width / v7 + -1.0) * 0.5), v9 * ((Width / v7 + -1.0) * 0.5));
  v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v26.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v26.c = v12;
  *(_OWORD *)&v26.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v27, &v26, v11, v11);
  v13 = *(_OWORD *)&v27.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v27.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v27.tx;
  memset(&v27, 0, sizeof(v27));
  PLTransformForImageOrientationAndSize(self->_fullSizeImageOrientation, (uint64_t)&v27, v7, v9);
  v14 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v26, &t1, -(v7 * 0.5), -(v9 * 0.5));
  v15 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v15;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  t1 = v27;
  v16 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v26, &t1, &t2);
  v17 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v17;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  v18 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformTranslate(&v26, &t1, v7 * 0.5, v9 * 0.5);
  v20 = *(_OWORD *)&v26.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v26.a;
  *(_OWORD *)&retstr->c = v20;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v26.tx;
  return result;
}

- (void)setImage:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLImageView;
  -[PLImageView setImage:](&v4, sel_setImage_, a3);
  if ((*((_BYTE *)self + 584) & 1) != 0)
    -[PLImageView _updateShadowPath](self, "_updateShadowPath");
}

- (void)setTransitionProgress:(double)a3
{
  double transitionProgress;
  _BOOL4 v6;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  CFAbsoluteTime Current;
  double v12;
  float v13;
  float v14;
  double v15;

  transitionProgress = self->_transitionProgress;
  v6 = a3 < 1.0;
  if (transitionProgress < 1.0)
    v6 = 0;
  v8 = a3 >= 1.0 && transitionProgress < 1.0 || v6;
  if (transitionProgress >= 1.0)
  {
    if ((*((_BYTE *)self + 584) & 1) != 0)
      *((_BYTE *)self + 584) |= 2u;
    -[PLImageView _setShadowEnabled:force:](self, "_setShadowEnabled:force:", 0, v8);
  }
  else
  {
    if ((*((_BYTE *)self + 584) & 1) != 0)
      v9 = 1;
    else
      v9 = (*((unsigned __int8 *)self + 584) >> 1) & 1;
    -[PLImageView _setShadowEnabled:force:](self, "_setShadowEnabled:force:", v9, v8);
    *((_BYTE *)self + 584) &= ~2u;
    if ((*((_BYTE *)self + 584) & 1) != 0)
    {
      v10 = (void *)-[PLImageView layer](self, "layer");
      Current = CFAbsoluteTimeGetCurrent();
      if (self->_transitionProgress * -3.0 + 1.0 >= 0.0)
        v12 = self->_transitionProgress * -3.0 + 1.0;
      else
        v12 = 0.0;
      objc_msgSend(v10, "shadowOpacity");
      v14 = v13 - v12;
      v15 = fabsf(v14);
      if (v15 > 0.035 || (v15 = Current - self->_lastShadowAlphaTime, v15 > 0.0333333333))
      {
        self->_lastShadowAlphaTime = Current;
        *(float *)&v15 = v12;
        objc_msgSend(v10, "setShadowOpacity:", v15);
      }
    }
  }
  self->_transitionProgress = a3;
}

- (void)setShadowEnabled:(BOOL)a3
{
  -[PLImageView _setShadowEnabled:force:](self, "_setShadowEnabled:force:", a3, 0);
}

- (void)_setShadowEnabled:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = a3;
  if (((*((unsigned __int8 *)self + 584) ^ a3) & 1) != 0 || a4)
  {
    v6 = (void *)-[PLImageView layer](self, "layer");
    v7 = v6;
    if (v4 && self->_transitionProgress < 1.0)
    {
      objc_msgSend(v6, "setShadowColor:", objc_msgSend((id)__shadowColor, "CGColor"));
      LODWORD(v8) = 1060320051;
      objc_msgSend(v7, "setShadowOpacity:", v8);
      PLPhysicalScreenScale();
      v10 = v9 * 0.0;
      PLPhysicalScreenScale();
      objc_msgSend(v7, "setShadowOffset:", v10, v11 * 3.0);
      PLPhysicalScreenScale();
      objc_msgSend(v7, "setShadowRadius:", v12 * 4.0);
      if (-[PLImageView image](self, "image"))
        -[PLImageView _updateShadowPath](self, "_updateShadowPath");
    }
    else
    {
      objc_msgSend(v6, "setShadowColor:", 0);
      LODWORD(v13) = 0;
      objc_msgSend(v7, "setShadowOpacity:", v13);
    }
  }
  *((_BYTE *)self + 584) = *((_BYTE *)self + 584) & 0xFE | v4;
}

- (BOOL)isShadowEnabled
{
  return *((_BYTE *)self + 584) & 1;
}

- (void)setBorderAndAccessoriesVisible:(BOOL)a3
{
  char v3;
  char v4;

  v3 = *((_BYTE *)self + 584);
  if (((((v3 & 4) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v4 = 4;
    else
      v4 = 0;
    *((_BYTE *)self + 584) = v3 & 0xFB | v4;
    -[UIView setHidden:](self->_borderView, "setHidden:", !a3);
  }
}

- (BOOL)isBorderAndAccessoriesVisible
{
  return (*((unsigned __int8 *)self + 584) >> 2) & 1;
}

- (void)parentDidLayout
{
  -[UIView setAutoresizingMask:](self->_borderView, "setAutoresizingMask:", 0);
}

- (void)setBorderAndAccessoriesAlpha:(float)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  CFAbsoluteTime Current;
  double v8;

  v4 = a4;
  if ((*((_BYTE *)self + 584) & 4) == 0)
    -[PLImageView setBorderAndAccessoriesVisible:](self, "setBorderAndAccessoriesVisible:", 1);
  Current = CFAbsoluteTimeGetCurrent();
  if (a3 == 1.0
    || a3 == 0.0
    || v4
    || (-[UIView alpha](self->_borderView, "alpha"), *(float *)&v8 = v8, vabds_f32(*(float *)&v8, a3) >= 0.035)
    || Current - self->_lastBorderAlphaTime >= 0.0333333333)
  {
    self->_lastBorderAlphaTime = Current;
    -[UIView setAlpha:](self->_borderView, "setAlpha:", a3);
    -[PLImageView _updatePlaceholderAlpha](self, "_updatePlaceholderAlpha");
  }
}

- (void)setBorderAndAccessoriesAlpha:(float)a3
{
  -[PLImageView setBorderAndAccessoriesAlpha:forced:](self, "setBorderAndAccessoriesAlpha:forced:", 0);
}

- (float)borderAndAccessoriesAlpha
{
  double v2;

  -[UIView alpha](self->_borderView, "alpha");
  return v2;
}

- (void)setDrawsBorder:(BOOL)a3
{
  char v3;
  char v5;
  CALayer *v6;
  CALayer *v7;

  v3 = *((_BYTE *)self + 584);
  if (((((v3 & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      v5 = 8;
    else
      v5 = 0;
    *((_BYTE *)self + 584) = v3 & 0xF7 | v5;
    v6 = -[UIView layer](self->_borderView, "layer");
    v7 = v6;
    if ((*((_BYTE *)self + 584) & 8) != 0)
    {
      pl_dispatch_once();
      -[CALayer setContents:](v7, "setContents:", __BorderImage___borderImage);
      PLPhysicalScreenScale();
      -[CALayer setContentsScale:](v7, "setContentsScale:");
      -[CALayer setContentsCenter:](v7, "setContentsCenter:", 0.5, 0.5, 0.0, 0.0);
    }
    else
    {
      -[CALayer setContents:](v6, "setContents:", 0);
    }
  }
}

- (BOOL)drawsBorder
{
  return (*((unsigned __int8 *)self + 584) >> 3) & 1;
}

- (void)setDimmed:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;

  v3 = a3;
  v4 = (void *)-[PLImageView layer](self, "layer");
  LODWORD(v5) = 1.0;
  if (v3)
    *(float *)&v5 = 0.5;
  objc_msgSend(v4, "setOpacity:", v5);
}

- (BOOL)isDimmed
{
  float v2;

  objc_msgSend((id)-[PLImageView layer](self, "layer"), "opacity");
  return v2 < 1.0;
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  uint64_t v4;

  if (self->_edgeAntialiasingEnabled != a3)
  {
    self->_edgeAntialiasingEnabled = a3;
    if (a3)
      v4 = 15;
    else
      v4 = 0;
    objc_msgSend((id)-[PLImageView layer](self, "layer"), "setEdgeAntialiasingMask:", v4);
    -[CALayer setEdgeAntialiasingMask:](-[UIView layer](self->_borderView, "layer"), "setEdgeAntialiasingMask:", v4);
  }
}

- (void)setShowsPlaceholder:(BOOL)a3
{
  BOOL v4;
  PLPhotoTilePlaceholderView *placeholderView;
  PLPhotoTilePlaceholderView *v6;
  PLPhotoTilePlaceholderView *v7;
  PLPhotoTilePlaceholderView *v8;

  v4 = self->_showsPlaceholder != a3 || !a3;
  if (v4 || !self->_placeholderView)
  {
    self->_showsPlaceholder = a3;
    placeholderView = self->_placeholderView;
    if (a3)
    {

      v6 = [PLPhotoTilePlaceholderView alloc];
      -[PLImageView bounds](self, "bounds");
      v7 = -[PLPhotoTilePlaceholderView initWithFrame:](v6, "initWithFrame:");
      self->_placeholderView = v7;
      -[PLPhotoTilePlaceholderView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
      v8 = self->_placeholderView;
      if (self->_borderView)
        -[PLImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v8);
      else
        -[PLImageView addSubview:](self, "addSubview:", v8);
      -[PLImageView _updatePlaceholderLayout](self, "_updatePlaceholderLayout");
      -[PLImageView _updatePlaceholderAlpha](self, "_updatePlaceholderAlpha");
    }
    else
    {
      -[PLPhotoTilePlaceholderView removeFromSuperview](placeholderView, "removeFromSuperview");

      self->_placeholderView = 0;
    }
  }
}

- (void)setPlaceholderScale:(double)a3
{
  if (self->_placeholderScale != a3)
  {
    self->_placeholderScale = a3;
    -[PLImageView _updatePlaceholderLayout](self, "_updatePlaceholderLayout");
  }
}

- (CGSize)placeholderSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[PLImageView bounds](self, "bounds");
  v3 = v2 + 1.0;
  v5 = v4 + 1.0;
  result.height = v3;
  result.width = v5;
  return result;
}

- (void)_updatePlaceholderLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double placeholderScale;
  double v12;
  double v13;
  double v14;
  double v15;
  PLPhotoTilePlaceholderView *placeholderView;
  CGAffineTransform v17;
  CGAffineTransform v18;

  if (self->_placeholderView)
  {
    -[PLImageView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[PLImageView placeholderSize](self, "placeholderSize");
    placeholderScale = self->_placeholderScale;
    v13 = v12 / placeholderScale;
    memset(&v18, 0, sizeof(v18));
    v15 = v14 / placeholderScale;
    CGAffineTransformMakeScale(&v18, placeholderScale, placeholderScale);
    -[PLPhotoTilePlaceholderView setFrame:](self->_placeholderView, "setFrame:", v4, v6, v13, v15);
    -[PLPhotoTilePlaceholderView setCenter:](self->_placeholderView, "setCenter:", floor(v8 * 0.5), floor(v10 * 0.5));
    placeholderView = self->_placeholderView;
    v17 = v18;
    -[PLPhotoTilePlaceholderView setTransform:](placeholderView, "setTransform:", &v17);
  }
}

- (void)_updatePlaceholderAlpha
{
  double v3;

  -[UIView alpha](self->_borderView, "alpha");
  -[PLPhotoTilePlaceholderView setAlpha:](self->_placeholderView, "setAlpha:", fmin(fmax(log(v3 + 0.08) * -0.4, 0.0), 1.0));
}

- (id)textBadgeString
{
  return -[UILabel text](self->_textBadge, "text");
}

- (void)setTextBadgeString:(id)a3
{
  UILabel *textBadge;
  void *v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *v10;

  textBadge = self->_textBadge;
  if (textBadge)
  {
    -[UILabel removeFromSuperview](textBadge, "removeFromSuperview");

    self->_textBadge = 0;
  }
  if (a3)
  {
    v6 = (void *)objc_opt_class();
    -[PLImageView bounds](self, "bounds");
    v9 = (UILabel *)objc_msgSend(v6, "textBadgeForString:photoSize:", a3, v7, v8);
    self->_textBadge = v9;
    v10 = v9;
    -[PLImageView addSubview:](self, "addSubview:", self->_textBadge);
  }
}

- (void)setLeftAccessoryView:(id)a3
{
  -[PLImageView setLeftAccessoryView:animated:](self, "setLeftAccessoryView:animated:", a3, 0);
}

- (void)setLeftAccessoryView:(id)a3 animated:(BOOL)a4
{
  UIView *leftAccessoryView;
  _BOOL4 v5;
  UIView *v8;
  UIView *v9;
  __int128 v10;
  double v11;
  _QWORD v12[6];
  _QWORD v13[5];
  _QWORD v14[5];
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  leftAccessoryView = self->_leftAccessoryView;
  if (leftAccessoryView != a3)
  {
    v5 = a4;
    v8 = leftAccessoryView;

    v9 = (UIView *)a3;
    self->_leftAccessoryView = v9;
    if (v9)
    {
      -[UIView addSubview:](self->_borderView, "addSubview:", v9);
      -[CALayer setAllowsGroupOpacity:](-[UIView layer](self->_borderView, "layer"), "setAllowsGroupOpacity:", 1);
      -[PLImageView _leftAccessoryViewFrame](self, "_leftAccessoryViewFrame");
      -[UIView setFrame:](self->_leftAccessoryView, "setFrame:");
      -[UIView setAlpha:](self->_leftAccessoryView, "setAlpha:", self->_accessoryViewsAlpha);
      if (v5)
      {
        -[UIView setAlpha:](self->_leftAccessoryView, "setAlpha:", 0.0);
        -[UIView bounds](self->_leftAccessoryView, "bounds");
        v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v17.c = v10;
        *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        *(_OWORD *)&v16.a = *(_OWORD *)&v17.a;
        *(_OWORD *)&v16.c = v10;
        *(_OWORD *)&v16.tx = *(_OWORD *)&v17.tx;
        CGAffineTransformTranslate(&v17, &v16, v11 * -2.0, 0.0);
        v15 = v17;
        CGAffineTransformScale(&v16, &v15, 0.1, 1.0);
        v17 = v16;
        -[UIView setTransform:](self->_leftAccessoryView, "setTransform:", &v16);
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke;
        v14[3] = &unk_1E70B6370;
        v14[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.4);
      }
    }
    else
    {
      if (v5)
      {
        v12[5] = self;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke_2;
        v13[3] = &unk_1E70B6370;
        v13[4] = v8;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __45__PLImageView_setLeftAccessoryView_animated___block_invoke_3;
        v12[3] = &unk_1E70B5C40;
        v12[4] = v8;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v13, v12, 0.4);
      }
      else
      {
        -[UIView removeFromSuperview](v8, "removeFromSuperview");
      }
      -[CALayer setAllowsGroupOpacity:](-[UIView layer](self->_borderView, "layer"), "setAllowsGroupOpacity:", 0);
    }
    -[PLImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeftAccessoryViewOffset:(CGSize)a3
{
  if (a3.width != self->_leftAccessoryViewOffset.width || a3.height != self->_leftAccessoryViewOffset.height)
  {
    self->_leftAccessoryViewOffset = a3;
    -[PLImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setBottomRightAccessoryView:(id)a3
{
  -[PLImageView setBottomRightAccessoryView:animated:](self, "setBottomRightAccessoryView:animated:", a3, 0);
}

- (void)setBottomRightAccessoryView:(id)a3 animated:(BOOL)a4
{
  UIView *bottomRightAccessoryView;
  _BOOL4 v5;
  UIView *v8;
  UIView *v9;
  _QWORD v10[5];
  _QWORD v11[6];
  _QWORD v12[5];

  bottomRightAccessoryView = self->_bottomRightAccessoryView;
  if (bottomRightAccessoryView != a3)
  {
    v5 = a4;
    v8 = bottomRightAccessoryView;

    v9 = (UIView *)a3;
    self->_bottomRightAccessoryView = v9;
    if (v8)
    {
      if (v5)
      {
        v11[5] = self;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke;
        v12[3] = &unk_1E70B6370;
        v12[4] = v8;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_2;
        v11[3] = &unk_1E70B5C40;
        v11[4] = v8;
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v12, v11, 0.2);
      }
      else
      {
        -[UIView removeFromSuperview](v8, "removeFromSuperview");
      }
      if (!self->_bottomRightAccessoryView)
        goto LABEL_11;
    }
    else if (!v9)
    {
LABEL_11:
      -[PLImageView setNeedsLayout](self, "setNeedsLayout");
      return;
    }
    -[UIView addSubview:](self->_borderView, "addSubview:");
    -[PLImageView _bottomRightAccessoryViewFrame](self, "_bottomRightAccessoryViewFrame");
    -[UIView setFrame:](self->_bottomRightAccessoryView, "setFrame:");
    -[UIView setAlpha:](self->_bottomRightAccessoryView, "setAlpha:", self->_accessoryViewsAlpha);
    if (v5)
    {
      -[UIView setAlpha:](self->_bottomRightAccessoryView, "setAlpha:", 0.0);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_3;
      v10[3] = &unk_1E70B6370;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v10, 0.2);
    }
    goto LABEL_11;
  }
}

- (void)setAccessoryViewsAlpha:(double)a3
{
  if (self->_accessoryViewsAlpha != a3)
  {
    self->_accessoryViewsAlpha = a3;
    -[UIView setAlpha:](self->_leftAccessoryView, "setAlpha:", a3);
    -[UIView setAlpha:](self->_bottomRightAccessoryView, "setAlpha:", a3);
  }
}

- (PLVideoView)videoView
{
  return self->_videoView;
}

- (void)setVideoView:(id)a3
{
  PLVideoView *videoView;
  PLVideoView *v6;
  PLVideoView *v7;

  videoView = self->_videoView;
  if (videoView != a3)
  {
    if ((PLImageView *)-[PLVideoView superview](videoView, "superview") == self)
      -[PLVideoView removeFromSuperview](self->_videoView, "removeFromSuperview");

    v6 = (PLVideoView *)a3;
    self->_videoView = v6;
    if (v6)
    {
      -[PLVideoView setAlpha:](v6, "setAlpha:", 1.0);
      v7 = self->_videoView;
      if (self->_borderView)
        -[PLImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7);
      else
        -[PLImageView addSubview:](self, "addSubview:", v7);
    }
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (UIView)leftAccessoryView
{
  return self->_leftAccessoryView;
}

- (CGSize)leftAccessoryViewOffset
{
  double width;
  double height;
  CGSize result;

  width = self->_leftAccessoryViewOffset.width;
  height = self->_leftAccessoryViewOffset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIView)bottomRightAccessoryView
{
  return self->_bottomRightAccessoryView;
}

- (double)accessoryViewsAlpha
{
  return self->_accessoryViewsAlpha;
}

- (BOOL)showsPlaceholder
{
  return self->_showsPlaceholder;
}

- (double)placeholderScale
{
  return self->_placeholderScale;
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return result;
}

uint64_t __52__PLImageView_setBottomRightAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 552), "setAlpha:", 1.0);
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 544), "setAlpha:", 1.0);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 544);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v2, "setTransform:", v5);
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __45__PLImageView_setLeftAccessoryView_animated___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDescendantOfView:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return result;
}

+ (void)initialize
{
  if (MGGetBoolAnswer())
  {
    if ((id)objc_opt_class() == a1)
      __shadowColor = objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  }
}

+ (BOOL)shouldDrawShadows
{
  return __shouldDrawShadows;
}

+ (CGSize)badgeOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 6.0;
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)textBadgeForString:(id)a3 photoSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v16;

  height = a4.height;
  width = a4.width;
  if (!__textBadgeTextColor)
  {
    __textBadgeTextColor = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithWhite:alpha:", 1.0, 1.0);
    __textBadgeShadowColor = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithWhite:alpha:", 0.25, 1.0);
    __textBadgeBackgroundColor = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA478]), "initWithWhite:alpha:", 0.1, 0.5);
    if (a3)
      goto LABEL_3;
LABEL_7:
    v7 = 0;
    return v7;
  }
  if (!a3)
    goto LABEL_7;
LABEL_3:
  v7 = objc_alloc_init(MEMORY[0x1E0CEA700]);
  objc_msgSend(v7, "setTextAlignment:", 1);
  objc_msgSend(v7, "setLineBreakMode:", 5);
  objc_msgSend(v7, "setBaselineAdjustment:", 1);
  objc_msgSend(v7, "setTextColor:", __textBadgeTextColor);
  objc_msgSend(v7, "setBackgroundColor:", __textBadgeBackgroundColor);
  objc_msgSend(v7, "setShadowColor:", __textBadgeShadowColor);
  objc_msgSend(v7, "setShadowOffset:", 1.0, 1.0);
  objc_msgSend(v7, "setFont:", UISystemFontBoldForSize());
  objc_msgSend(v7, "setMinimumScaleFactor:", 0.7);
  objc_msgSend((id)objc_msgSend(v7, "layer"), "setCornerRadius:", 3.0);
  objc_msgSend(v7, "setAutoresizingMask:", 13);
  objc_msgSend(v7, "setText:", a3);
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10 + 6.0;
  if (v11 > width + -12.0 + -6.0)
  {
    objc_msgSend(v7, "setAdjustsFontSizeToFitWidth:", 1);
    v11 = width + -12.0 + -6.0;
  }
  v12 = (width - v11) * 0.5;
  v13 = height - v9 + -6.0 + -3.0;
  v14 = v9;
  v16 = CGRectIntegral(*(CGRect *)(&v11 - 2));
  objc_msgSend(v7, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  return v7;
}

@end
