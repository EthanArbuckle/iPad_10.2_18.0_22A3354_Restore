@implementation UIPDFParagraphWidget

- (UIPDFParagraphWidget)init
{
  char *v2;
  CGColorSpace *DeviceRGB;
  CGImage *v4;
  _BOOL4 v5;
  int v6;
  double v7;
  float v8;
  __int128 v9;
  __int128 v10;
  float v12;
  objc_super v13;
  CGFloat components[2];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)UIPDFParagraphWidget;
  v2 = -[UIPDFParagraphWidget init](&v13, sel_init);
  if (v2)
  {
    *(_OWORD *)components = xmmword_186683178;
    v15 = unk_186683188;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *((_QWORD *)v2 + 20) = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v4 = (CGImage *)objc_msgSend(+[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drag-dot.png")), "CGImage");
    CGImageRetain(v4);
    v12 = 1.0;
    v5 = CPIsRetina(&v12);
    v6 = v5;
    v7 = 14.0;
    v8 = v12;
    if (v5)
      v7 = fmax((float)(1.0 / v12), 0.5) * 28.0;
    *((_QWORD *)v2 + 11) = makeGrabber(v5, 0.0, 0.0, v7, v7, v12);
    *((_QWORD *)v2 + 12) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    *((_QWORD *)v2 + 13) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    *((_QWORD *)v2 + 14) = makeGrabber(v6, 0.0, 0.0, v7, v7, v8);
    objc_msgSend(*((id *)v2 + 11), "setDelegate:", v2);
    objc_msgSend(*((id *)v2 + 12), "setDelegate:", v2);
    objc_msgSend(*((id *)v2 + 13), "setDelegate:", v2);
    objc_msgSend(*((id *)v2 + 14), "setDelegate:", v2);
    CGImageRelease(v4);
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *((_OWORD *)v2 + 1) = *MEMORY[0x1E0C9D628];
    *((_OWORD *)v2 + 2) = v10;
    *(_OWORD *)(v2 + 56) = v9;
    *(_OWORD *)(v2 + 72) = v10;
    v2[48] = 0;
  }
  return (UIPDFParagraphWidget *)v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_grabberColor);
  -[UIPDFParagraphWidget remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)UIPDFParagraphWidget;
  -[UIPDFParagraphWidget dealloc](&v3, sel_dealloc);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  objc_msgSend(a3, "bounds");
  CPCGInsetFillEllipseInRect(a4, self->_grabberColor, v6, v7, v8, v9);
}

- (CGRect)selectionBoundsInEffectsSpace
{
  CALayer *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer");
  -[UIPDFSelection bounds](-[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection"), "bounds");
  self->_boundsInPDFSpace.origin.x = v4;
  self->_boundsInPDFSpace.origin.y = v5;
  self->_boundsInPDFSpace.size.width = v6;
  self->_boundsInPDFSpace.size.height = v7;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:");
  -[CALayer convertRect:fromLayer:](v3, "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v8, v9, v10, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setSelection:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
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
  CALayer *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGAffineTransform v30[2];

  objc_msgSend(a3, "bounds");
  self->_boundsInPDFSpace.origin.x = x;
  self->_boundsInPDFSpace.origin.y = y;
  self->_boundsInPDFSpace.size.width = width;
  self->_boundsInPDFSpace.size.height = height;
  if (!self->_tracking)
  {
    v9 = x;
    v10 = y;
    v11 = width;
    v12 = height;
    memset(&v30[1], 0, sizeof(CGAffineTransform));
    if (a3)
    {
      objc_msgSend(a3, "transform");
      x = self->_boundsInPDFSpace.origin.x;
      y = self->_boundsInPDFSpace.origin.y;
      width = self->_boundsInPDFSpace.size.width;
      height = self->_boundsInPDFSpace.size.height;
    }
    v30[0] = v30[1];
    self->_boundsInPDFSpace = CGRectApplyAffineTransform(*(CGRect *)&x, v30);
    -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", v9, v10, v11, v12);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v21 = -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer");
    -[CALayer convertRect:fromLayer:](v21, "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v14, v16, v18, v20);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    if (CGRectIsNull(self->_initialRect))
    {
      self->_initialRect.origin.x = v23;
      self->_initialRect.origin.y = v25;
      self->_initialRect.size.width = v27;
      self->_initialRect.size.height = v29;
    }
    -[CALayer addSublayer:](v21, "addSublayer:", self->_leftGrabber);
    -[CALayer addSublayer:](v21, "addSublayer:", self->_rightGrabber);
    -[CALayer addSublayer:](v21, "addSublayer:", self->_topGrabber);
    -[CALayer addSublayer:](v21, "addSublayer:", self->_bottomGrabber);
  }
}

- (void)remove
{
  -[CALayer removeFromSuperlayer](self->_leftGrabber, "removeFromSuperlayer");
  self->_leftGrabber = 0;
  -[CALayer removeFromSuperlayer](self->_rightGrabber, "removeFromSuperlayer");
  self->_rightGrabber = 0;
  -[CALayer removeFromSuperlayer](self->_topGrabber, "removeFromSuperlayer");
  self->_topGrabber = 0;
  -[CALayer removeFromSuperlayer](self->_bottomGrabber, "removeFromSuperlayer");
  self->_bottomGrabber = 0;
  -[CAShapeLayer removeFromSuperlayer](self->_trackingBorder, "removeFromSuperlayer");
  self->_trackingBorder = 0;
}

- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  CALayer **p_topGrabber;
  double v13;
  double v14;
  float v15;
  double v16;
  CALayer **p_bottomGrabber;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  double v26;
  CALayer **p_rightGrabber;
  BOOL result;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), a3.x, a3.y);
  v9 = v8;
  v11 = v10;
  *a4 = *(CGPoint *)MEMORY[0x1E0C9D538];
  *a5 = 0;
  p_topGrabber = &self->_topGrabber;
  -[CALayer position](self->_topGrabber, "position");
  *(float *)&v13 = (v13 - v9) * (v13 - v9) + (v14 - v11) * (v14 - v11);
  v15 = sqrtf(*(float *)&v13);
  v16 = v15;
  p_bottomGrabber = &self->_bottomGrabber;
  -[CALayer position](self->_bottomGrabber, "position");
  *(float *)&v18 = (v18 - v9) * (v18 - v9) + (v19 - v11) * (v19 - v11);
  v20 = sqrtf(*(float *)&v18);
  v21 = v20;
  if (v20 >= v15)
    v22 = v15;
  else
    v22 = v20;
  -[CALayer position](self->_leftGrabber, "position");
  *(float *)&v23 = (v23 - v9) * (v23 - v9) + (v24 - v11) * (v24 - v11);
  v25 = sqrtf(*(float *)&v23);
  v26 = v25;
  if (v22 > v25)
    v22 = v25;
  p_rightGrabber = &self->_rightGrabber;
  -[CALayer position](self->_rightGrabber, "position");
  result = 0;
  *(float *)&v29 = (v29 - v9) * (v29 - v9) + (v30 - v11) * (v30 - v11);
  v31 = sqrtf(*(float *)&v29);
  if (v22 <= v31)
    v32 = v22;
  else
    v32 = v31;
  if (v32 <= 20.0)
  {
    if (v32 == v16)
    {
      -[CALayer position](*p_bottomGrabber, "position");
      v34 = v33;
      v36 = v35;
      -[CALayer bounds](*p_bottomGrabber, "bounds");
      v37 = v36 - CGRectGetHeight(v49);
    }
    else if (v32 == v21)
    {
      -[CALayer position](*p_topGrabber, "position");
      v34 = v38;
      v40 = v39;
      -[CALayer bounds](*p_topGrabber, "bounds");
      v37 = v40 + CGRectGetHeight(v50);
      p_topGrabber = &self->_bottomGrabber;
    }
    else if (v32 == v26)
    {
      -[CALayer position](*p_rightGrabber, "position");
      v42 = v41;
      v37 = v43;
      -[CALayer bounds](*p_rightGrabber, "bounds");
      v34 = v42 - CGRectGetWidth(v51);
      p_topGrabber = &self->_leftGrabber;
    }
    else
    {
      if (v32 != v31)
        return 0;
      -[CALayer position](*p_rightGrabber, "position");
      v45 = v44;
      v37 = v46;
      -[CALayer bounds](self->_leftGrabber, "bounds");
      v34 = v45 + CGRectGetWidth(v52);
      p_topGrabber = &self->_rightGrabber;
    }
    -[CALayer convertPoint:fromLayer:](-[UIView layer](self->_pageView, "layer"), "convertPoint:fromLayer:", -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), v34, v37);
    a4->x = v47;
    a4->y = v48;
    self->_selectedGrabber = *p_topGrabber;
    return 1;
  }
  return result;
}

- (CGPoint)viewOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)layout
{
  double v3;
  double v4;
  double v5;
  double v6;
  CALayer *v7;
  double v8;
  double v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
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
  double MinX;
  double MaxX;
  double MidX;
  double v37;
  CATransform3D v38;
  CATransform3D v39;
  CATransform3D v40;
  CATransform3D v41;
  CATransform3D v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v3) = 1.0;
  -[CALayer setOpacity:](self->_leftGrabber, "setOpacity:", v3);
  LODWORD(v4) = 1.0;
  -[CALayer setOpacity:](self->_rightGrabber, "setOpacity:", v4);
  LODWORD(v5) = 1.0;
  -[CALayer setOpacity:](self->_topGrabber, "setOpacity:", v5);
  LODWORD(v6) = 1.0;
  -[CALayer setOpacity:](self->_bottomGrabber, "setOpacity:", v6);
  v7 = -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer");
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", self->_boundsInPDFSpace.origin.x, self->_boundsInPDFSpace.origin.y, self->_boundsInPDFSpace.size.width, self->_boundsInPDFSpace.size.height);
  -[CALayer convertRect:fromLayer:](v7, "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CALayer convertRect:fromLayer:](v7, "convertRect:fromLayer:", 0, 0.0, 0.0, 1.0, 1.0);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  if (-[UIView window](self->_pageView, "window"))
  {
    -[CALayer convertRect:toLayer:](v7, "convertRect:toLayer:", -[UIView layer](self->_pageView, "layer"), v21, v23, v25, v27);
    -[UIWindow convertRect:toWindow:](-[UIView window](self->_pageView, "window"), "convertRect:toWindow:", 0, v28, v29, v30, v31);
    v25 = v32;
    v27 = v33;
  }
  memset(&v42, 0, sizeof(v42));
  CATransform3DMakeScale(&v42, v25, v27, 1.0);
  v41 = v42;
  -[CALayer setTransform:](self->_leftGrabber, "setTransform:", &v41);
  v40 = v42;
  -[CALayer setTransform:](self->_rightGrabber, "setTransform:", &v40);
  v39 = v42;
  -[CALayer setTransform:](self->_topGrabber, "setTransform:", &v39);
  v38 = v42;
  -[CALayer setTransform:](self->_bottomGrabber, "setTransform:", &v38);
  v43.origin.x = v13;
  v43.origin.y = v15;
  v43.size.width = v17;
  v43.size.height = v19;
  MinX = CGRectGetMinX(v43);
  v44.origin.x = v13;
  v44.origin.y = v15;
  v44.size.width = v17;
  v44.size.height = v19;
  -[CALayer setPosition:](self->_leftGrabber, "setPosition:", MinX, CGRectGetMidY(v44));
  v45.origin.x = v13;
  v45.origin.y = v15;
  v45.size.width = v17;
  v45.size.height = v19;
  MaxX = CGRectGetMaxX(v45);
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v19;
  -[CALayer setPosition:](self->_rightGrabber, "setPosition:", MaxX, CGRectGetMidY(v46));
  v47.origin.x = v13;
  v47.origin.y = v15;
  v47.size.width = v17;
  v47.size.height = v19;
  MidX = CGRectGetMidX(v47);
  v48.origin.x = v13;
  v48.origin.y = v15;
  v48.size.width = v17;
  v48.size.height = v19;
  -[CALayer setPosition:](self->_topGrabber, "setPosition:", MidX, CGRectGetMinY(v48));
  v49.origin.x = v13;
  v49.origin.y = v15;
  v49.size.width = v17;
  v49.size.height = v19;
  v37 = CGRectGetMidX(v49);
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v19;
  -[CALayer setPosition:](self->_bottomGrabber, "setPosition:", v37, CGRectGetMaxY(v50));
  -[CALayer setNeedsDisplay](self->_leftGrabber, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_rightGrabber, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_topGrabber, "setNeedsDisplay");
  -[CALayer setNeedsDisplay](self->_bottomGrabber, "setNeedsDisplay");
}

- (CGRect)adjustRect:(CGRect)a3 toPoint:(CGPoint)a4
{
  CGFloat x;
  double height;
  double width;
  CGFloat y;
  CGFloat v8;
  CALayer *selectedGrabber;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  x = a4.x;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v8 = a3.origin.x;
  selectedGrabber = self->_selectedGrabber;
  if (selectedGrabber == self->_leftGrabber)
  {
    width = a3.size.width + CGRectGetMinX(a3) - a4.x;
    v8 = x;
  }
  else if (selectedGrabber == self->_rightGrabber)
  {
    width = a3.size.width + a4.x - CGRectGetMaxX(a3);
  }
  else
  {
    v10 = a4.y;
    if (selectedGrabber == self->_bottomGrabber)
    {
      height = a3.size.height + a4.y - CGRectGetMaxY(a3);
    }
    else
    {
      height = a3.size.height + CGRectGetMinY(a3) - a4.y;
      y = v10;
    }
  }
  v11 = v8;
  v12 = y;
  v13 = width;
  v14 = height;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setSelectedGrabberPosition:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double MinY;
  CALayer *selectedGrabber;
  double MinX;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(a3);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MinY = CGRectGetMinY(v12);
  selectedGrabber = self->_selectedGrabber;
  if (selectedGrabber == self->_leftGrabber)
  {
    v15.origin.x = x;
    v15.origin.y = y;
    v15.size.width = width;
    v15.size.height = height;
    MinX = CGRectGetMinX(v15);
LABEL_7:
    MidX = MinX;
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinY = CGRectGetMidY(v17);
    goto LABEL_8;
  }
  if (selectedGrabber == self->_rightGrabber)
  {
    v16.origin.x = x;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    MinX = CGRectGetMaxX(v16);
    goto LABEL_7;
  }
  if (selectedGrabber == self->_bottomGrabber)
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    MidX = CGRectGetMidX(v13);
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    MinY = CGRectGetMaxY(v14);
  }
LABEL_8:
  -[CALayer setPosition:](self->_selectedGrabber, "setPosition:", MidX, MinY);
}

- (void)track:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPath *Mutable;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat width;
  CGFloat v20;
  CGFloat height;
  CALayer **p_leftGrabber;
  double v23;
  double v24;
  double v25;
  double MinX;
  CALayer *selectedGrabber;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), x, y);
  v7 = v6;
  v9 = v8;
  Mutable = CGPathCreateMutable();
  if (self->_tracking)
  {
    -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), x, y);
    -[UIPDFParagraphWidget adjustRect:toPoint:](self, "adjustRect:toPoint:", self->_initialRect.origin.x, self->_initialRect.origin.y, self->_initialRect.size.width, self->_initialRect.size.height, v12, v13);
    v15 = v14;
    v17 = v16;
    width = v18;
    height = v20;
    self->_currentTrackingRect.origin.x = v14;
    self->_currentTrackingRect.origin.y = v16;
    self->_currentTrackingRect.size.width = v18;
    self->_currentTrackingRect.size.height = v20;
    -[UIPDFParagraphWidget setSelectedGrabberPosition:](self, "setSelectedGrabberPosition:");
  }
  else
  {
    p_leftGrabber = &self->_leftGrabber;
    LODWORD(v11) = 0;
    -[CALayer setOpacity:](self->_leftGrabber, "setOpacity:", v11);
    LODWORD(v23) = 0;
    -[CALayer setOpacity:](self->_rightGrabber, "setOpacity:", v23);
    LODWORD(v24) = 0;
    -[CALayer setOpacity:](self->_topGrabber, "setOpacity:", v24);
    LODWORD(v25) = 0;
    -[CALayer setOpacity:](self->_bottomGrabber, "setOpacity:", v25);
    selectedGrabber = self->_selectedGrabber;
    if (!selectedGrabber)
    {
      MinX = CGRectGetMinX(self->_initialRect);
      if (v7 >= MinX)
      {
        MinX = CGRectGetMaxX(self->_initialRect);
        p_leftGrabber = &self->_rightGrabber;
        if (v7 <= MinX)
        {
          MinX = CGRectGetMinY(self->_initialRect);
          if (v9 <= MinX)
            p_leftGrabber = &self->_topGrabber;
          else
            p_leftGrabber = &self->_bottomGrabber;
        }
      }
      selectedGrabber = *p_leftGrabber;
      self->_selectedGrabber = *p_leftGrabber;
    }
    LODWORD(MinX) = 1.0;
    -[CALayer setOpacity:](selectedGrabber, "setOpacity:", MinX);
    self->_trackingBorder = (CAShapeLayer *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    -[CAShapeLayer setStrokeColor:](self->_trackingBorder, "setStrokeColor:", -[UIColor CGColor](+[UIColor blueColor](UIColor, "blueColor"), "CGColor"));
    -[CAShapeLayer setFillColor:](self->_trackingBorder, "setFillColor:", 0);
    -[CALayer insertSublayer:atIndex:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "insertSublayer:atIndex:", self->_trackingBorder, 0);
    self->_tracking = 1;
    -[UIPDFParagraphWidget setSelectedGrabberPosition:](self, "setSelectedGrabberPosition:", self->_initialRect.origin.x, self->_initialRect.origin.y, self->_initialRect.size.width, self->_initialRect.size.height);
    self->_currentTrackingRect.origin = self->_initialRect.origin;
    self->_currentTrackingRect.size = self->_initialRect.size;
    v15 = self->_initialRect.origin.x;
    v17 = self->_initialRect.origin.y;
    width = self->_initialRect.size.width;
    height = self->_initialRect.size.height;
  }
  v28.origin.x = v15;
  v28.origin.y = v17;
  v28.size.width = width;
  v28.size.height = height;
  CGPathAddRect(Mutable, 0, v28);
  -[CAShapeLayer setPath:](self->_trackingBorder, "setPath:", Mutable);
  CGPathRelease(Mutable);
}

- (void)endTracking
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  -[CAShapeLayer removeFromSuperlayer](self->_trackingBorder, "removeFromSuperlayer");
  self->_trackingBorder = 0;
  self->_tracking = 0;
  LODWORD(v3) = 1.0;
  -[CALayer setOpacity:](self->_leftGrabber, "setOpacity:", v3);
  LODWORD(v4) = 1.0;
  -[CALayer setOpacity:](self->_rightGrabber, "setOpacity:", v4);
  LODWORD(v5) = 1.0;
  -[CALayer setOpacity:](self->_topGrabber, "setOpacity:", v5);
  LODWORD(v6) = 1.0;
  -[CALayer setOpacity:](self->_bottomGrabber, "setOpacity:", v6);
  self->_selectedGrabber = 0;
  -[UIPDFParagraphWidget selectionBoundsInEffectsSpace](self, "selectionBoundsInEffectsSpace");
  self->_initialRect.origin.x = v7;
  self->_initialRect.origin.y = v8;
  self->_initialRect.size.width = v9;
  self->_initialRect.size.height = v10;
  -[UIPDFParagraphWidget layout](self, "layout");
}

- (CGRect)selectionRectangle
{
  CGRect *p_currentTrackingRect;
  CGSize size;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_currentTrackingRect = &self->_currentTrackingRect;
  if (CGRectIsNull(self->_currentTrackingRect))
  {
    size = self->_initialRect.size;
    p_currentTrackingRect->origin = self->_initialRect.origin;
    p_currentTrackingRect->size = size;
  }
  x = self->_currentTrackingRect.origin.x;
  y = self->_currentTrackingRect.origin.y;
  width = self->_currentTrackingRect.size.width;
  height = self->_currentTrackingRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)currentSelectionPointOnPage
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)hide
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v3) = 0;
  -[CALayer setOpacity:](self->_leftGrabber, "setOpacity:", v3);
  LODWORD(v4) = 0;
  -[CALayer setOpacity:](self->_rightGrabber, "setOpacity:", v4);
  LODWORD(v5) = 0;
  -[CALayer setOpacity:](self->_topGrabber, "setOpacity:", v5);
  LODWORD(v6) = 0;
  -[CALayer setOpacity:](self->_bottomGrabber, "setOpacity:", v6);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (UIPDFPageView)pageView
{
  return self->_pageView;
}

- (void)setPageView:(id)a3
{
  self->_pageView = (UIPDFPageView *)a3;
}

- (CGPoint)initialSelectionPointOnPage
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialSelectionPointOnPage.x;
  y = self->_initialSelectionPointOnPage.y;
  result.y = y;
  result.x = x;
  return result;
}

@end
