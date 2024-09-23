@implementation PLExpandableImageView

- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4 withBorder:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  PLExpandableImageView *v8;
  objc_super v10;

  v5 = a5;
  height = a3.size.height;
  width = a3.size.width;
  v10.receiver = self;
  v10.super_class = (Class)PLExpandableImageView;
  v8 = -[PLExpandableView initWithFrame:](&v10, sel_initWithFrame_, *(_QWORD *)&a4, a3.origin.x, a3.origin.y);
  if (v8)
  {
    v8->_imageView = -[PLImageView initWithFrame:]([PLImageView alloc], "initWithFrame:", 0.0, 0.0, width, height);
    objc_msgSend((id)-[PLExpandableImageView layer](v8, "layer"), "setEdgeAntialiasingMask:", 0);
    -[PLImageView setOpaque:](v8->_imageView, "setOpaque:", 1);
    -[PLExpandableImageView setBorderAndAccessoriesVisible:](v8, "setBorderAndAccessoriesVisible:", v5);
    -[PLExpandableImageView addSubview:](v8, "addSubview:", v8->_imageView);
  }
  return v8;
}

- (PLExpandableImageView)initWithFrame:(CGRect)a3 frameStyle:(int)a4
{
  return -[PLExpandableImageView initWithFrame:frameStyle:withBorder:](self, "initWithFrame:frameStyle:withBorder:", *(_QWORD *)&a4, 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PLExpandableImageView)initWithFrame:(CGRect)a3
{
  return -[PLExpandableImageView initWithFrame:frameStyle:](self, "initWithFrame:frameStyle:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLExpandableImageView;
  -[PLExpandableView dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  char exImageFlags;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  double v16;
  float v17;
  _BOOL8 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  float v24;
  BOOL v25;
  int v26;
  double v27;
  double v28;

  exImageFlags = (char)self->_exImageFlags;
  if ((exImageFlags & 0x18) != 8)
  {
    *(_BYTE *)&self->_exImageFlags = exImageFlags | 8;
    v4 = -[PLExpandableImageView image](self, "image");
    v5 = -[PLExpandableImageView videoView](self, "videoView");
    if (v4 | v5)
    {
      v6 = v5;
      -[PLExpandableImageView bounds](self, "bounds");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      *(float *)&v7 = v11;
      v15 = rintf(*(float *)&v7);
      v16 = rint(v13);
      if (v16 <= v15)
        v17 = v15;
      else
        v17 = v16;
      v18 = (*(_BYTE *)&self->_exImageFlags & 0x40) == 0
         || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1;
      v19 = v14;
      v20 = v12;
      if (v4)
      {
        -[PLImageView sizeThatFits:allowRounding:](self->_imageView, "sizeThatFits:allowRounding:", v18, v17, v17);
        v20 = v21;
        v19 = v22;
      }
      v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice", v18), "userInterfaceIdiom");
      if (v4 && (v23 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v20 > v12 || v19 > v14))
      {
        v24 = v20;
        v12 = rintf(v24);
        v14 = rint(v19);
        -[PLExpandableImageView setBounds:](self, "setBounds:", v8, v10, v12, v14);
      }
      if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1
        && (!v4 ? (v25 = v6 == 0) : (v25 = 1),
            v25 ? (v26 = 0) : (v26 = 1),
            (*(_BYTE *)&self->_exImageFlags & 0x40) != 0 || v26))
      {
        v27 = v8 + (v12 - v20) * 0.5;
        v28 = v10 + (v14 - v19) * 0.5;
      }
      else
      {
        v27 = round(v8 + (v12 - v20) * 0.5);
        v28 = round(v10 + (v14 - v19) * 0.5);
      }
      -[PLImageView setFrame:](self->_imageView, "setFrame:", v27, v28, v20, v19);
    }
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  PLImageView *imageView;
  uint64_t v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint v15;

  y = a3.y;
  x = a3.x;
  imageView = self->_imageView;
  -[PLImageView bounds](imageView, "bounds", a4);
  -[PLImageView convertRect:toView:](imageView, "convertRect:toView:", self);
  v12 = (20.0 - v10) * 0.5;
  v13 = (20.0 - v11) * 0.5;
  if (v12 > 0.0 || v13 > 0.0)
    *(CGRect *)&v8 = CGRectInset(*(CGRect *)&v8, -v12, -v13);
  v15.x = x;
  v15.y = y;
  return CGRectContainsPoint(*(CGRect *)&v8, v15);
}

- (float)_currentScale
{
  double v3;
  double v4;
  double v5;

  -[PLExpandableImageView frame](self, "frame");
  v4 = v3;
  -[PLExpandableView contractedFrame](self, "contractedFrame");
  return v4 / v5;
}

- (float)_expandedScale
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PLExpandableView expandedFrame](self, "expandedFrame");
  v4 = v3;
  v6 = v5;
  -[PLExpandableView contractedFrame](self, "contractedFrame");
  v9 = v6 / v8;
  if (v4 > v6)
    return v4 / v7;
  return v9;
}

- (float)_expansionFraction
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  double v14;
  _BOOL4 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v21;
  double v22;

  -[PLExpandableView contractedFrame](self, "contractedFrame");
  v4 = v3;
  v6 = v5;
  -[PLExpandableImageView imageSize](self, "imageSize");
  v8 = v7;
  v10 = v9;
  *(float *)&v7 = v7 / v9;
  v11 = *(float *)&v7;
  v12 = *(float *)&v7 < 1.0;
  v13 = rint(v6 * *(float *)&v7);
  v14 = rint(v4 / v11);
  if (v12)
    v4 = v13;
  else
    v6 = v14;
  v15 = -[PLExpandableView isTracking](self, "isTracking");
  if (v8 <= v10)
  {
    if (v15)
      v17 = self->_pinchScale * self->_originalSize.height;
    else
      -[PLExpandableImageView frame](self, "frame");
    v21 = v17 - v6;
    -[PLExpandableView expandedFrame](self, "expandedFrame");
    return v21 / (v22 - v6);
  }
  else
  {
    if (v15)
      v16 = self->_pinchScale * self->_originalSize.width;
    else
      -[PLExpandableImageView frame](self, "frame");
    v18 = v16 - v4;
    -[PLExpandableView expandedFrame](self, "expandedFrame");
    return v18 / (v19 - v4);
  }
}

- (CGRect)_snappedExpandedFrame
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[PLExpandableView expandedFrame](self, "expandedFrame");
  v6 = PLIntegralRect(v2, v3, v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)stateDidChangeFrom:(int)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (-[PLExpandableView state](self, "state", *(_QWORD *)&a3) == 1)
  {
    -[PLExpandableView contractedFrame](self, "contractedFrame");
    v5 = v4;
    v7 = v6;
    -[PLExpandableView expandedFrame](self, "expandedFrame");
    v10 = v7 / v9;
    if (v9 > v8)
      v10 = v5 / v8;
    -[PLImageView setPlaceholderScale:](self->_imageView, "setPlaceholderScale:", v10);
  }
}

- (void)_setOriginalSize:(CGSize)a3
{
  self->_originalSize = a3;
}

- (void)beginTrackingPinch:(id)a3
{
  int v5;
  double v6;
  double v7;
  double v8;
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
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  char v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id v43;
  double originalWidth;
  char v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;

  v5 = -[PLExpandableView state](self, "state");
  if (v5 == 1)
  {
    -[PLImageView bounds](self->_imageView, "bounds");
    -[PLExpandableView pinchRect:inView:insetTouches:](self, "pinchRect:inView:insetTouches:", self->_imageView, 1);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[PLImageView convertRect:toView:](self->_imageView, "convertRect:toView:", -[PLExpandableImageView superview](self, "superview"), v6, v8, v10, v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    -[PLImageView convertRect:toView:](self->_imageView, "convertRect:toView:", 0, v7, v9, v11, v13);
    self->_initialExpandingFrame.origin.x = v22;
    self->_initialExpandingFrame.origin.y = v23;
    self->_initialExpandingFrame.size.width = v24;
    self->_initialExpandingFrame.size.height = v25;
    v26 = *(_BYTE *)&self->_exImageFlags | 4;
  }
  else
  {
    -[PLExpandableImageView frame](self, "frame");
    v15 = v27;
    v17 = v28;
    v19 = v29;
    v21 = v30;
    -[PLExpandableView contractedFrame](self, "contractedFrame");
    self->_initialExpandingFrame.origin.x = v31;
    self->_initialExpandingFrame.origin.y = v32;
    self->_initialExpandingFrame.size.width = v33;
    self->_initialExpandingFrame.size.height = v34;
    v26 = *(_BYTE *)&self->_exImageFlags & 0xFB;
  }
  *(_BYTE *)&self->_exImageFlags = v26;
  v35 = -[PLExpandableImageView superview](self, "superview");
  objc_msgSend(a3, "locationOfTouch:inView:", self->super._leftTouchIndex, v35);
  v37 = v36;
  v39 = v38;
  objc_msgSend(a3, "locationOfTouch:inView:", self->super._rightTouchIndex, v35);
  v41 = v40;
  self->_anchorPoint.x = ((v37 + v40) * 0.5 - v15) / v19;
  self->_anchorPoint.y = ((v39 + v42) * 0.5 - v17) / v21;
  self->_originalAngle = atan((v39 - v42) / (v40 - v37));
  v43 = -[PLExpandableImageView _contentView](self, "_contentView");
  objc_msgSend(a3, "locationOfTouch:inView:", self->super._leftTouchIndex, v43);
  objc_msgSend(a3, "locationOfTouch:inView:", self->super._rightTouchIndex, v43);
  UIDistanceBetweenPoints();
  self->_originalWidth = originalWidth;
  if (v37 > v41)
  {
    self->_originalAngle = self->_originalAngle + 3.14159265;
    originalWidth = self->_originalWidth;
  }
  self->_pinchWidth = originalWidth;
  self->_pinchAngle = self->_originalAngle;
  self->_pinchScale = 1.0;
  v45 = *(_BYTE *)&self->_exImageFlags & 0xDC;
  if (v5 == 1)
  {
    *(_BYTE *)&self->_exImageFlags = v45 | 2;
  }
  else
  {
    *(_BYTE *)&self->_exImageFlags = v45 | 0x22;
    self->_centerOffset = (CGSize)*MEMORY[0x1E0C9D820];
  }
  -[PLExpandableImageView bounds](self, "bounds");
  self->_originalBounds.origin.x = v46;
  self->_originalBounds.origin.y = v47;
  self->_originalBounds.size.width = v48;
  self->_originalBounds.size.height = v49;
  -[PLExpandableImageView frame](self, "frame");
  -[PLExpandableImageView _setOriginalSize:](self, "_setOriginalSize:", v50, v51);
}

- (void)setSize:(CGSize)a3 angle:(float)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  double v15;
  float v16;
  double v17;
  double v18;
  float v19;
  float currentAngle;
  double v21;
  BOOL v22;
  double v23;
  BOOL v24;
  __int128 v25;
  double v26;
  double v27;
  float v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  height = a3.height;
  width = a3.width;
  -[PLExpandableImageView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  -[PLExpandableImageView bounds](self, "bounds");
  v14 = width == height;
  if (width >= height)
    v15 = width;
  else
    v15 = height;
  if (v12 != v13)
    v14 = 1;
  v16 = v15;
  v17 = v16;
  if (v14)
    v18 = width;
  else
    v18 = v16;
  if (v14)
    v17 = height;
  v19 = self->_imageRotationAngle + a4;
  currentAngle = self->_currentAngle;
  v21 = vabdd_f64(v18, v9);
  v22 = vabds_f32(v19, currentAngle) < 1.0 && v21 < 1.0;
  v23 = vabdd_f64(v17, v11);
  v24 = v22 && v23 < 1.0;
  if (!v24 || currentAngle != 0.0 && v19 == 0.0 || currentAngle == 0.0 && v19 != 0.0)
  {
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v31.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v31.c = v25;
    *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v26 = v17 / v13;
    v27 = v18 / v12;
    if (v12 < v13)
      v27 = v26;
    v28 = v27;
    CGAffineTransformMakeRotation(&v31, v19);
    v29 = v31;
    CGAffineTransformScale(&v30, &v29, v28, v28);
    v31 = v30;
    -[PLExpandableImageView setTransform:](self, "setTransform:", &v30);
    -[PLImageView setNeedsLayout](self->_imageView, "setNeedsLayout");
    self->_currentAngle = v19;
  }
}

- (float)_borderAlphaForExpansionFraction:(float)a3
{
  double v3;

  v3 = fmax(a3 * -2.0 + 1.0, 0.0);
  if (v3 > 1.0)
    return 1.0;
  return v3;
}

- (void)_updateBorderAndAccessoriesAlpha
{
  PLImageView *imageView;

  -[PLExpandableImageView _expansionFraction](self, "_expansionFraction");
  imageView = self->_imageView;
  -[PLExpandableImageView _borderAlphaForExpansionFraction:](self, "_borderAlphaForExpansionFraction:");
  -[PLImageView setBorderAndAccessoriesAlpha:](imageView, "setBorderAndAccessoriesAlpha:");
}

- (void)_updatePinchWidthAndScaleWithLeftPoint:(CGPoint)a3 rightPoint:(CGPoint)a4
{
  double v5;
  double pinchScale;

  UIDistanceBetweenPoints();
  self->_pinchWidth = v5;
  self->_pinchScale = v5 / self->_originalWidth;
  if (!-[PLExpandableView allowsExpansion](self, "allowsExpansion"))
  {
    pinchScale = self->_pinchScale;
    if (pinchScale > 1.0)
      self->_pinchScale = (1.0 - 1.0 / pinchScale) * 0.2 + 1.0;
  }
}

- (float)continueTrackingPinch:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char exImageFlags;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float v32;
  CGSize *p_centerOffset;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double originalAngle;
  double v41;
  double v42;
  double v43;
  double v44;
  double pinchScale;
  float v46;
  double v47;
  float result;
  double v49;
  double v50;
  double v51;
  _QWORD v52[5];
  float v53;

  v5 = -[PLExpandableImageView _contentView](self, "_contentView");
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._leftTouchLocation.x, self->super._leftTouchLocation.y);
  v7 = v6;
  v9 = v8;
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._rightTouchLocation.x, self->super._rightTouchLocation.y);
  v11 = v10;
  v12 = (v7 + v10) * 0.5;
  v14 = (v9 + v13) * 0.5;
  v50 = v13;
  v51 = v9;
  -[PLExpandableImageView _updatePinchWidthAndScaleWithLeftPoint:rightPoint:](self, "_updatePinchWidthAndScaleWithLeftPoint:rightPoint:", v7, v9, v10);
  exImageFlags = (char)self->_exImageFlags;
  if ((exImageFlags & 0x20) == 0)
  {
    *(_BYTE *)&self->_exImageFlags = exImageFlags | 0x20;
    -[PLExpandableImageView center](self, "center");
    self->_centerOffset.width = v16 - v12;
    self->_centerOffset.height = v17 - v14;
    exImageFlags = (char)self->_exImageFlags;
  }
  if ((exImageFlags & 4) != 0)
  {
    -[PLImageView bounds](self->_imageView, "bounds");
    v19 = v18;
    v21 = v20;
    objc_msgSend((id)-[PLExpandableImageView superview](self, "superview"), "convertRect:fromView:", 0, self->_initialExpandingFrame.origin.x, self->_initialExpandingFrame.origin.y, self->_initialExpandingFrame.size.width, self->_initialExpandingFrame.size.height);
    PLIntegralRect(v22, v23, v24, v25);
    v28 = v26;
    v29 = v27;
    v49 = v21;
    v30 = v27 / v21;
    v31 = v19;
    if (v26 >= v27)
      v30 = v26 / v19;
    v32 = v30;
    -[PLExpandableImageView _setOriginalSize:](self, "_setOriginalSize:", v26, v27);
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __47__PLExpandableImageView_continueTrackingPinch___block_invoke;
    v52[3] = &unk_1E70B5BD8;
    v52[4] = self;
    v53 = v32;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v52, 0.2);
    p_centerOffset = &self->_centerOffset;
    if (v31 + fabs(p_centerOffset->width + p_centerOffset->width) < v28
      && v49 + fabs(self->_centerOffset.height + self->_centerOffset.height) < v29)
    {
      *p_centerOffset = *(CGSize *)MEMORY[0x1E0C9D820];
    }
    *(_BYTE *)&self->_exImageFlags &= ~4u;
  }
  v34 = v12 + self->_centerOffset.width;
  v35 = v14 + self->_centerOffset.height;
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._previousLeftLocation.x, self->super._previousLeftLocation.y);
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", v5, self->super._previousRightLocation.x, self->super._previousRightLocation.y);
  UIDistanceBetweenPoints();
  *(float *)&v36 = v36;
  if (*(float *)&v36 >= 1.0 || (objc_msgSend(a3, "velocity"), fabs(v37) > 0.05))
  {
    v38 = atan((v51 - v50) / (v11 - v7));
    if (v7 <= v11)
      v39 = v38;
    else
      v39 = v38 + 3.14159265;
    if ((*(_BYTE *)&self->_exImageFlags & 1) == 0)
    {
      originalAngle = self->_originalAngle;
      if (vabdd_f64(v39, originalAngle) <= 0.261799388)
      {
LABEL_19:
        objc_msgSend((id)-[PLExpandableImageView layer](self, "layer"), "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
        -[PLExpandableImageView setCenter:](self, "setCenter:", v34, v35);
        -[PLImageView setEdgeAntialiasingEnabled:](self->_imageView, "setEdgeAntialiasingEnabled:", 1);
        pinchScale = self->_pinchScale;
        v46 = self->_originalSize.width * pinchScale;
        v47 = self->_originalAngle - originalAngle;
        *(float *)&v47 = v47;
        -[PLExpandableImageView setSize:angle:](self, "setSize:angle:", rintf(v46), rint(pinchScale * self->_originalSize.height), v47);
        self->_pinchAngle = originalAngle;
        -[PLExpandableImageView _updateBorderAndAccessoriesAlpha](self, "_updateBorderAndAccessoriesAlpha");
        goto LABEL_20;
      }
      self->_originalAngle = v39;
      -[PLExpandableImageView frame](self, "frame");
      self->_anchorPoint.x = (v34 - v41) / v42;
      self->_anchorPoint.y = (v35 - v43) / v44;
      *(_BYTE *)&self->_exImageFlags |= 1u;
    }
    originalAngle = v39;
    goto LABEL_19;
  }
  if (-[PLExpandableView state](self, "state") == 1)
    -[PLExpandableImageView setCenter:](self, "setCenter:", v34, v35);
LABEL_20:
  -[PLExpandableImageView _expansionFraction](self, "_expansionFraction");
  return result;
}

- (CGSize)_newSizeFromSize:(CGSize)a3
{
  double height;
  double width;
  id v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = -[PLExpandableImageView image](self, "image");
  if (v5)
  {
    objc_msgSend(v5, "size");
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v8 = v6 / v7;
  v9 = width / height;
  v10 = v8;
  if (v8 <= v9)
    width = rint(height * v10);
  else
    height = rint(width / v10);
  v11 = width;
  v12 = height;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setTransformAndCenterForFrame:(CGRect)a3
{
  -[PLExpandableImageView _newSizeFromSize:](self, "_newSizeFromSize:", a3.size.width, a3.size.height);
  -[PLExpandableImageView setSize:angle:](self, "setSize:angle:");
  UIRectGetCenter();
  -[PLExpandableImageView setCenter:](self, "setCenter:");
}

- (float)completeTrackingPinch:(id)a3 toState:(int)a4 duration:(double)a5
{
  int v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v22;
  int v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double pinchWidth;
  float v38;
  double v39;
  float v40;
  float v41;
  float v42;
  double pinchVelocity;
  float v44;
  double v46;
  float v47;
  float v48;
  PLImageView *v49;
  double v50;
  double v51;
  double v52;
  float v53;
  float v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double width;
  double v61;
  double height;
  double v63;
  double v64;
  double v65;
  double v66;
  float v67;
  float v68;
  double v69;
  int v70;
  char *v71;
  double v72;
  double v73;
  double v74;
  char **v75;
  PLImageView *imageView;
  double v77;
  CGRect v79;
  CGRect v80;

  v9 = -[PLExpandableView state](self, "state");
  -[PLExpandableImageView _currentScale](self, "_currentScale");
  v11 = v10;
  if ((*(_BYTE *)&self->_exImageFlags & 2) == 0)
    self->super._pinchVelocity = 0.0;
  -[PLExpandableImageView bounds](self, "bounds");
  UIRectGetCenter();
  -[PLExpandableImageView convertPoint:toView:](self, "convertPoint:toView:", -[PLExpandableImageView superview](self, "superview"), v12, v13);
  v15 = v14;
  v17 = v16;
  __asm { FMOV            V0.2D, #0.5 }
  self->_anchorPoint = _Q0;
  objc_msgSend((id)-[PLExpandableImageView layer](self, "layer"), "setAnchorPoint:", self->_anchorPoint.x, self->_anchorPoint.y);
  -[PLExpandableImageView setCenter:](self, "setCenter:", v15, v17);
  LODWORD(v22) = 0;
  if (a4)
  {
    if (a4 == 4)
    {
      if (v9 == 6 && (v22 = self->super._pinchVelocity, v22 > 0.0))
      {
        v23 = 1;
        v24 = 0.2;
      }
      else
      {
        -[PLExpandableImageView _expandedScale](self, "_expandedScale", v22);
        v41 = v40;
        -[PLExpandableImageView _expansionFraction](self, "_expansionFraction");
        pinchVelocity = self->super._pinchVelocity;
        if (pinchVelocity <= 0.0)
        {
          v23 = 0;
          v24 = 0.3;
        }
        else
        {
          v44 = v41 + (1.0 - v42 * 0.5) * 0.5;
          v24 = (self->_pinchWidth * v44 / v11 - self->_pinchWidth) / pinchVelocity;
          v23 = 0;
          if (v24 > 0.3)
            v24 = 0.3;
        }
      }
      -[PLExpandableImageView _snappedExpandedFrame](self, "_snappedExpandedFrame");
      v56 = v55;
      v58 = v57;
      width = v59;
      height = v61;
      UIRectGetCenter();
      if (v24 <= 0.0 || (*((_BYTE *)&self->super._expandFlags + 1) & 1) != 0)
      {
        -[PLExpandableImageView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishTransition, 0, 0.0);
      }
      else
      {
        v65 = v63;
        v66 = v64;
        if (a3)
        {
          -[PLExpandableImageView _expansionFraction](self, "_expansionFraction");
          v68 = (float)(1.0 - v67) * 0.05 + 1.0;
          if (v24 >= 0.1 && (-[PLExpandableImageView center](self, "center"), UIDistanceBetweenPoints(), v69 >= 50.0))
          {
            -[PLExpandableImageView center](self, "center");
            width = operator||(v56, v58, width, height, v68, v72, v73);
            height = v74;
            v70 = 1;
          }
          else
          {
            v79.size.width = width * v68;
            v79.size.height = height * v68;
            v79.origin.x = v65 - v79.size.width * 0.5;
            v79.origin.y = v66 - v79.size.height * 0.5;
            v80 = CGRectIntegral(v79);
            width = v80.size.width;
            height = v80.size.height;
            v70 = 0;
          }
          v75 = &selRef__bounceToPlace_finished_context_;
          if (!v23)
            v75 = &selRef__bounceBack_finished_context_;
          v71 = *v75;
        }
        else
        {
          v70 = 0;
          v71 = sel_finishTransition;
        }
        objc_msgSend(MEMORY[0x1E0CEABB0], "beginAnimations:context:", 0, 0);
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDuration:", v24);
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationCurve:", 2);
        if ((v70 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelegate:", self);
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDidStopSelector:", v71);
        }
        -[PLExpandableImageView _newSizeFromSize:](self, "_newSizeFromSize:", width, height);
        -[PLExpandableImageView setSize:angle:](self, "setSize:angle:");
        imageView = self->_imageView;
        LODWORD(v77) = 1.0;
        -[PLExpandableImageView _borderAlphaForExpansionFraction:](self, "_borderAlphaForExpansionFraction:", v77);
        -[PLImageView setBorderAndAccessoriesAlpha:](imageView, "setBorderAndAccessoriesAlpha:");
        if (v70)
        {
          objc_msgSend(MEMORY[0x1E0CEABB0], "beginAnimations:context:", 0, 0);
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDuration:", v24 * 1.25);
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelay:", v24 * 0.1);
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelegate:", self);
          objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDidStopSelector:", v71);
          -[PLExpandableImageView setCenter:](self, "setCenter:", v65, v66);
          objc_msgSend(MEMORY[0x1E0CEABB0], "commitAnimations");
        }
        else
        {
          -[PLExpandableImageView setCenter:](self, "setCenter:", v65, v66);
        }
        objc_msgSend(MEMORY[0x1E0CEABB0], "commitAnimations");
      }
      LODWORD(v22) = 1.0;
    }
  }
  else
  {
    -[PLExpandableView contractedFrame](self, "contractedFrame", v22);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v33 = self->_originalAngle - self->_pinchAngle;
    if (v33 < 0.0)
      v33 = -v33;
    v34 = v33 / 3.14159265 * 0.7;
    -[PLExpandableImageView center](self, "center");
    UIRectGetCenter();
    UIDistanceBetweenPoints();
    v36 = v35 * 0.0009765625;
    if (self->super._pinchVelocity >= 0.0)
    {
      v39 = 0.2;
      if (v9 != 3 || a5 >= 0.2)
        v39 = a5;
    }
    else
    {
      pinchWidth = self->_pinchWidth;
      -[PLExpandableImageView _currentScale](self, "_currentScale");
      v39 = (pinchWidth / v38 - self->_pinchWidth) / self->super._pinchVelocity;
    }
    if (v39 < v34)
      v39 = v34;
    if (v39 < v36)
      v39 = v36;
    if (v39 <= 0.3)
      v46 = v39;
    else
      v46 = 0.3;
    -[PLExpandableImageView _expansionFraction](self, "_expansionFraction");
    v48 = v47;
    -[PLImageView setBorderAndAccessoriesVisible:](self->_imageView, "setBorderAndAccessoriesVisible:", 1);
    v49 = self->_imageView;
    *(float *)&v50 = v48;
    -[PLExpandableImageView _borderAlphaForExpansionFraction:](self, "_borderAlphaForExpansionFraction:", v50);
    -[PLImageView setBorderAndAccessoriesAlpha:](v49, "setBorderAndAccessoriesAlpha:");
    if ((*((_BYTE *)&self->super._expandFlags + 1) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "beginAnimations:context:", CFSTR("collapseSingleImage"), 0);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDuration:", v46);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDidStopSelector:", sel_finishTransition);
    }
    -[PLExpandableImageView setTransformAndCenterForFrame:](self, "setTransformAndCenterForFrame:", v26, v28, v30, v32);
    if (v48 >= 0.5)
    {
      if ((*((_BYTE *)&self->super._expandFlags + 1) & 1) == 0)
      {
        v52 = (float)((float)(v48 + -0.5) / v48);
        v53 = (1.0 - v52) * v46;
        v54 = v46 * v52;
        objc_msgSend(MEMORY[0x1E0CEABB0], "beginAnimations:context:", CFSTR("fadeInBorderForCollapse"), 0);
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDuration:", v53);
        objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelay:", v54);
      }
      LODWORD(v51) = 1.0;
      -[PLImageView setBorderAndAccessoriesAlpha:forced:](self->_imageView, "setBorderAndAccessoriesAlpha:forced:", 1, v51);
      -[PLVideoView setAlpha:](-[PLImageView videoView](self->_imageView, "videoView"), "setAlpha:", 0.0);
      if ((*((_BYTE *)&self->super._expandFlags + 1) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0CEABB0], "commitAnimations");
    }
    else
    {
      LODWORD(v51) = 1.0;
      -[PLImageView setBorderAndAccessoriesAlpha:forced:](self->_imageView, "setBorderAndAccessoriesAlpha:forced:", 1, v51);
      -[PLVideoView setAlpha:](-[PLImageView videoView](self->_imageView, "videoView"), "setAlpha:", 0.0);
    }
    if ((*((_BYTE *)&self->super._expandFlags + 1) & 1) != 0)
      -[PLExpandableImageView finishTransition](self, "finishTransition");
    else
      objc_msgSend(MEMORY[0x1E0CEABB0], "commitAnimations");
    LODWORD(v22) = 0;
  }
  *(_BYTE *)&self->_exImageFlags &= ~2u;
  return *(float *)&v22;
}

- (void)_bounceBack:(id)a3 finished:(id)a4 context:(void *)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect v14;

  if ((-[PLExpandableView state](self, "state", a3, a4, a5) & 0xFFFFFFFB) == 2)
  {
    if (objc_msgSend(a4, "BOOLValue"))
    {
      objc_msgSend(MEMORY[0x1E0CEABB0], "beginAnimations:context:", 0, 0);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDuration:", 0.15);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationCurve:", 2);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDelegate:", self);
      objc_msgSend(MEMORY[0x1E0CEABB0], "setAnimationDidStopSelector:", sel__bounceToPlace_finished_context_);
      -[PLExpandableImageView _snappedExpandedFrame](self, "_snappedExpandedFrame");
      v8 = v7;
      v10 = v9;
      UIRectGetCenter();
      v13.size.width = v8 * 0.995000005;
      v13.size.height = v10 * 0.995000005;
      v13.origin.x = v11 - v8 * 0.995000005 * 0.5;
      v13.origin.y = v12 - v10 * 0.995000005 * 0.5;
      v14 = CGRectIntegral(v13);
      -[PLExpandableImageView setTransformAndCenterForFrame:](self, "setTransformAndCenterForFrame:", v14.origin.x, v14.origin.y, v14.size.width, v14.size.height);
      objc_msgSend(MEMORY[0x1E0CEABB0], "commitAnimations");
    }
    else
    {
      -[PLExpandableImageView finishTransition](self, "finishTransition");
    }
  }
}

- (void)_bounceToPlace:(id)a3 finished:(id)a4 context:(void *)a5
{
  _QWORD v7[5];
  _QWORD v8[5];

  if ((-[PLExpandableView state](self, "state", a3, a4, a5) & 0xFFFFFFFB) == 2)
  {
    if (objc_msgSend(a4, "BOOLValue"))
    {
      v7[4] = self;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke;
      v8[3] = &unk_1E70B6370;
      v8[4] = self;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke_2;
      v7[3] = &unk_1E70B6398;
      objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v8, v7, 0.1);
    }
    else
    {
      -[PLExpandableImageView finishTransition](self, "finishTransition");
    }
  }
}

- (void)finishTransition
{
  objc_super v3;

  -[PLImageView setEdgeAntialiasingEnabled:](self->_imageView, "setEdgeAntialiasingEnabled:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PLExpandableImageView;
  -[PLExpandableView finishTransition](&v3, sel_finishTransition);
}

- (id)_contentView
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
    || self == 0)
  {
    return 0;
  }
  do
  {
    -[PLExpandableImageView superview](self, "superview");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    self = (PLExpandableImageView *)-[PLExpandableImageView superview](self, "superview");
  }
  while (self);
  return self;
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PLExpandableImageView;
  -[PLExpandableImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  *(_BYTE *)&self->_exImageFlags &= ~8u;
  -[PLExpandableImageView layoutBelowIfNeeded](self, "layoutBelowIfNeeded");
  -[PLImageView updateFullSizeImageVisibleArea](self->_imageView, "updateFullSizeImageVisibleArea");
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  -[PLExpandableImageView center](self, "center");
  if (x != v7 || y != v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)PLExpandableImageView;
    -[PLExpandableImageView setCenter:](&v9, sel_setCenter_, x, y);
  }
}

- (void)setBorderAndAccessoriesVisible:(BOOL)a3
{
  -[PLImageView setBorderAndAccessoriesVisible:](self->_imageView, "setBorderAndAccessoriesVisible:", a3);
}

- (BOOL)isBorderAndAccessoriesVisible
{
  return -[PLImageView isBorderAndAccessoriesVisible](self->_imageView, "isBorderAndAccessoriesVisible");
}

- (void)setImage:(id)a3 isFullscreen:(BOOL)a4
{
  _BOOL4 v4;
  char v7;

  v4 = a4;
  if (-[PLExpandableView allowsExpansion](self, "allowsExpansion") || -[PLExpandableView state](self, "state") != 1)
  {
    if (v4)
      v7 = 64;
    else
      v7 = 0;
    *(_BYTE *)&self->_exImageFlags = *(_BYTE *)&self->_exImageFlags & 0xBF | v7;
    -[PLImageView setImage:](self->_imageView, "setImage:", a3);
    -[PLImageView setOpaque:](self->_imageView, "setOpaque:", 1);
    if (a3)
    {
      *(_BYTE *)&self->_exImageFlags &= ~8u;
      -[PLExpandableImageView layoutSubviews](self, "layoutSubviews");
    }
  }
}

- (void)setImage:(id)a3
{
  -[PLExpandableImageView setImage:isFullscreen:](self, "setImage:isFullscreen:", a3, 0);
}

- (id)image
{
  return (id)-[PLImageView image](self->_imageView, "image");
}

- (void)setFullSizeImageJPEGData:(id)a3 size:(CGSize)a4 orientation:(int64_t)a5
{
  -[PLImageView setFullSizeImageJPEGData:size:orientation:](self->_imageView, "setFullSizeImageJPEGData:size:orientation:", a3, a5, a4.width, a4.height);
}

- (void)setName:(id)a3
{
  -[PLImageView setName:](self->_imageView, "setName:", a3);
}

- (NSString)name
{
  return -[PLImageView name](self->_imageView, "name");
}

- (BOOL)showsPlaceholder
{
  return -[PLImageView showsPlaceholder](self->_imageView, "showsPlaceholder");
}

- (void)setShowsPlaceholder:(BOOL)a3
{
  -[PLImageView setShowsPlaceholder:](self->_imageView, "setShowsPlaceholder:", a3);
}

- (id)imageView
{
  return self->_imageView;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend((id)-[PLImageView image](self->_imageView, "image"), "size");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)frameOfImage
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  *(_BYTE *)&self->_exImageFlags &= ~8u;
  -[PLExpandableImageView layoutIfNeeded](self, "layoutIfNeeded");
  v3 = (void *)-[PLExpandableImageView superview](self, "superview");
  objc_msgSend(-[PLExpandableImageView imageView](self, "imageView"), "frame");
  objc_msgSend(v3, "convertRect:fromView:", self);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (PLVideoView)videoView
{
  return -[PLImageView videoView](self->_imageView, "videoView");
}

- (void)setVideoView:(id)a3
{
  -[PLImageView setVideoView:](self->_imageView, "setVideoView:", a3);
}

- (double)imageRotationAngle
{
  return self->_imageRotationAngle;
}

- (void)setShadowEnabled:(BOOL)a3
{
  -[PLImageView setShadowEnabled:](self->_imageView, "setShadowEnabled:", a3);
}

- (BOOL)isShadowEnabled
{
  return -[PLImageView isShadowEnabled](self->_imageView, "isShadowEnabled");
}

- (void)setTransitionProgress:(double)a3
{
  -[PLImageView setTransitionProgress:](self->_imageView, "setTransitionProgress:", a3);
}

- (double)transitionProgress
{
  double result;

  -[PLImageView transitionProgress](self->_imageView, "transitionProgress");
  return result;
}

- (BOOL)isBeingManipulated
{
  unsigned int v2;

  v2 = -[PLExpandableView state](self, "state") - 1;
  return v2 < 7 && v2 != 3;
}

- (void)setTextBadgeString:(id)a3
{
  -[PLImageView setTextBadgeString:](self->_imageView, "setTextBadgeString:", a3);
}

- (void)renderSnapshotInContext:(CGContext *)a3
{
  -[PLImageView renderSnapshotInContext:](self->_imageView, "renderSnapshotInContext:", a3);
}

- (PLManagedAsset)photo
{
  return self->_photo;
}

- (void)setPhoto:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 800);
}

uint64_t __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "_snappedExpandedFrame");
  return objc_msgSend(v1, "setTransformAndCenterForFrame:");
}

uint64_t __57__PLExpandableImageView__bounceToPlace_finished_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishTransition");
}

uint64_t __47__PLExpandableImageView_continueTrackingPinch___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, *(float *)(a1 + 40), *(float *)(a1 + 40));
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "_updateBorderAndAccessoriesAlpha");
}

+ (double)imageBorderWidth
{
  return 6.0;
}

@end
