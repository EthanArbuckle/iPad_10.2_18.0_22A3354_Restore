@implementation UIPDFTextRangeWidget

- (UIPDFTextRangeWidget)init
{
  UIPDFTextRangeWidget *v2;
  CGColorSpace *DeviceRGB;
  CGImage *v4;
  _BOOL4 v5;
  double v6;
  CALayer *v7;
  CALayer *v8;
  double v9;
  CALayer *v10;
  float v12;
  objc_super v13;
  CGFloat components[2];
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)UIPDFTextRangeWidget;
  v2 = -[UIPDFTextRangeWidget init](&v13, sel_init);
  if (v2)
  {
    *(_OWORD *)components = xmmword_186683178;
    v15 = unk_186683188;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v2->_grabberColor = CGColorCreate(DeviceRGB, components);
    CGColorSpaceRelease(DeviceRGB);
    v2->_startSelectionGrabber = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v2->_startHandle = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v4 = (CGImage *)objc_msgSend(+[UIImage kitImageNamed:](UIImage, "kitImageNamed:", CFSTR("kb-drag-dot.png")), "CGImage");
    CGImageRetain(v4);
    v12 = 1.0;
    v5 = CPIsRetina(&v12);
    v6 = 14.0;
    if (v5)
      v6 = fmax((float)(1.0 / v12), 0.5) * 28.0;
    v2->_handleHeight = v6;
    v2->_handleWidth = v6;
    -[CALayer setBounds:](v2->_startHandle, "setBounds:", 0.0, 0.0, v6, v6);
    -[CALayer setDelegate:](v2->_startHandle, "setDelegate:", v2);
    v7 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v2->_startBar = v7;
    -[CALayer setBackgroundColor:](v7, "setBackgroundColor:", v2->_grabberColor);
    -[CALayer addSublayer:](v2->_startSelectionGrabber, "addSublayer:", v2->_startBar);
    -[CALayer addSublayer:](v2->_startSelectionGrabber, "addSublayer:", v2->_startHandle);
    v2->_endSelectionGrabber = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v8 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v2->_endHandle = v8;
    -[CALayer setBounds:](v8, "setBounds:", 0.0, 0.0, v2->_handleWidth, v2->_handleHeight);
    -[CALayer setDelegate:](v2->_endHandle, "setDelegate:", v2);
    if (v5)
    {
      v9 = v12;
      -[CALayer setContentsScale:](v2->_startHandle, "setContentsScale:", v12);
      -[CALayer setContentsScale:](v2->_endHandle, "setContentsScale:", v9);
    }
    v10 = (CALayer *)objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v2->_endBar = v10;
    -[CALayer setBackgroundColor:](v10, "setBackgroundColor:", v2->_grabberColor);
    -[CALayer addSublayer:](v2->_endSelectionGrabber, "addSublayer:", v2->_endBar);
    -[CALayer addSublayer:](v2->_endSelectionGrabber, "addSublayer:", v2->_endHandle);
    CGImageRelease(v4);
    v2->_fixedSelectionGrabber = 0;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_grabberColor);
  -[UIPDFTextRangeWidget remove](self, "remove");
  v3.receiver = self;
  v3.super_class = (Class)UIPDFTextRangeWidget;
  -[UIPDFTextRangeWidget dealloc](&v3, sel_dealloc);
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

- (void)layoutStartSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7
{
  double width;
  double height;
  double v12;
  unint64_t v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CALayer *startSelectionGrabber;
  double MidX;
  double v38;
  double x;
  double y;
  CATransform3D v41;
  CATransform3D v42;
  _OWORD v43[3];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  width = a7.width;
  height = a3.size.height;
  v12 = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  v14 = -[UIPDFPage rotation](-[UIPDFPageView page](self->_pageView, "page", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5, a6, a7.width, a7.height), "rotation");
  v15 = *(_OWORD *)&a4->c;
  v43[0] = *(_OWORD *)&a4->a;
  v43[1] = v15;
  v43[2] = *(_OWORD *)&a4->tx;
  CPRotationDegreesFromTransform((double *)v43);
  v17 = v16;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, v12, height);
  -[CALayer convertRect:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v18, v19, v20, v21);
  if (v14 == 180 || v14 == 0)
    v27 = CGRectGetHeight(*(CGRect *)&v22);
  else
    v27 = CGRectGetWidth(*(CGRect *)&v22);
  v28 = v27;
  v29 = v17 - (double)v14;
  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a4->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a4->a, x), vmulq_n_f64(*(float64x2_t *)&a4->c, y))));
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), v30, v31);
  v33 = v32;
  v35 = v34;
  -[CALayer setAnchorPoint:](self->_startSelectionGrabber, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer setBounds:](self->_startSelectionGrabber, "setBounds:", 0.0, 0.0, a5, v28 + a6);
  -[CALayer setPosition:](self->_startSelectionGrabber, "setPosition:", v33, v35);
  CATransform3DMakeRotation(&v42, v29 * -0.0174532925, 0.0, 0.0, 1.0);
  startSelectionGrabber = self->_startSelectionGrabber;
  v41 = v42;
  -[CALayer setTransform:](startSelectionGrabber, "setTransform:", &v41);
  -[CALayer bounds](self->_startSelectionGrabber, "bounds");
  MidX = CGRectGetMidX(v44);
  -[CALayer bounds](self->_startSelectionGrabber, "bounds");
  -[CALayer setPosition:](self->_startHandle, "setPosition:", MidX, a6 * 0.5 + CGRectGetMinY(v45));
  -[CALayer setBounds:](self->_startBar, "setBounds:", 0.0, 0.0, width + width, v28);
  -[CALayer setAnchorPoint:](self->_startBar, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer bounds](self->_startSelectionGrabber, "bounds");
  v38 = CGRectGetMidX(v46);
  -[CALayer bounds](self->_startSelectionGrabber, "bounds");
  -[CALayer setPosition:](self->_startBar, "setPosition:", v38, CGRectGetMaxY(v47));
  -[CALayer setNeedsDisplay](self->_startHandle, "setNeedsDisplay");
}

- (void)layoutEndSelectionGrabber:(CGRect)a3 transform:(CGAffineTransform *)a4 width:(double)a5 extraHeight:(double)a6 unitSize:(CGSize)a7
{
  double width;
  double height;
  double v12;
  unint64_t v14;
  __int128 v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CALayer *endSelectionGrabber;
  double MidX;
  double v38;
  double x;
  double y;
  CATransform3D v41;
  CATransform3D v42;
  _OWORD v43[3];
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  width = a7.width;
  height = a3.size.height;
  v12 = a3.size.width;
  x = a3.origin.x;
  y = a3.origin.y;
  v14 = -[UIPDFPage rotation](-[UIPDFPageView page](self->_pageView, "page", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5, a6, a7.width, a7.height), "rotation");
  v15 = *(_OWORD *)&a4->c;
  v43[0] = *(_OWORD *)&a4->a;
  v43[1] = v15;
  v43[2] = *(_OWORD *)&a4->tx;
  CPRotationDegreesFromTransform((double *)v43);
  v17 = v16;
  -[UIPDFPageView convertRectFromPDFPageSpace:](self->_pageView, "convertRectFromPDFPageSpace:", x, y, v12, height);
  -[CALayer convertRect:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertRect:fromLayer:", -[UIView layer](self->_pageView, "layer"), v18, v19, v20, v21);
  if (v14 == 180 || v14 == 0)
    v27 = CGRectGetHeight(*(CGRect *)&v22);
  else
    v27 = CGRectGetWidth(*(CGRect *)&v22);
  v28 = v27;
  v29 = v17 - (double)v14;
  -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", vaddq_f64(*(float64x2_t *)&a4->tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&a4->a, x), vmulq_n_f64(*(float64x2_t *)&a4->c, y))));
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), v30, v31);
  v33 = v32;
  v35 = v34;
  -[CALayer setAnchorPoint:](self->_endSelectionGrabber, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer setBounds:](self->_endSelectionGrabber, "setBounds:", 0.0, 0.0, a5, v28 + a6);
  -[CALayer setPosition:](self->_endSelectionGrabber, "setPosition:", v33, v35);
  CATransform3DMakeRotation(&v42, v29 * -0.0174532925, 0.0, 0.0, 1.0);
  endSelectionGrabber = self->_endSelectionGrabber;
  v41 = v42;
  -[CALayer setTransform:](endSelectionGrabber, "setTransform:", &v41);
  -[CALayer bounds](self->_endSelectionGrabber, "bounds");
  MidX = CGRectGetMidX(v44);
  -[CALayer bounds](self->_endSelectionGrabber, "bounds");
  -[CALayer setPosition:](self->_endHandle, "setPosition:", MidX, a6 * 0.5 + CGRectGetMaxY(v45));
  -[CALayer setBounds:](self->_endBar, "setBounds:", 0.0, 0.0, width + width, v28);
  -[CALayer setAnchorPoint:](self->_endBar, "setAnchorPoint:", 0.5, 1.0);
  -[CALayer bounds](self->_endSelectionGrabber, "bounds");
  v38 = CGRectGetMidX(v46);
  -[CALayer bounds](self->_endSelectionGrabber, "bounds");
  -[CALayer setPosition:](self->_endBar, "setPosition:", v38, CGRectGetMaxY(v47));
  -[CALayer setNeedsDisplay](self->_endHandle, "setNeedsDisplay");
}

- (void)layoutWidget
{
  double v3;
  double v4;
  UIPDFSelection *v5;
  CALayer *v6;
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
  CATransform3D v21;
  CATransform3D v22;
  _OWORD v23[3];
  _OWORD v24[2];
  CATransform3D v25;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v3) = 1.0;
  -[CALayer setOpacity:](self->_startSelectionGrabber, "setOpacity:", v3);
  LODWORD(v4) = 1.0;
  -[CALayer setOpacity:](self->_endSelectionGrabber, "setOpacity:", v4);
  v5 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
  if (-[UIPDFSelection numberOfRectangles](v5, "numberOfRectangles"))
  {
    v6 = -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer");
    -[CALayer convertRect:fromLayer:](v6, "convertRect:fromLayer:", 0, 0.0, 0.0, 1.0, 1.0);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (-[UIView window](self->_pageView, "window"))
    {
      -[CALayer convertRect:toLayer:](v6, "convertRect:toLayer:", -[UIView layer](self->_pageView, "layer"), v8, v10, v12, v14);
      -[UIWindow convertRect:toWindow:](-[UIView window](self->_pageView, "window"), "convertRect:toWindow:", 0, v15, v16, v17, v18);
      v12 = v19;
      v14 = v20;
    }
    memset(&v25, 0, sizeof(v25));
    CATransform3DMakeScale(&v25, v12, v14, 1.0);
    memset(v24, 0, sizeof(v24));
    v22 = v25;
    memset(v23, 0, sizeof(v23));
    -[CALayer setTransform:](self->_startHandle, "setTransform:", &v22);
    v21 = v25;
    -[CALayer setTransform:](self->_endHandle, "setTransform:", &v21);
    -[UIPDFSelection getBounds:transform:index:](v5, "getBounds:transform:index:", v24, v23, self->_startRectangle);
    *(double *)v24 = self->_startX;
    -[UIPDFTextRangeWidget layoutStartSelectionGrabber:transform:width:extraHeight:unitSize:](self, "layoutStartSelectionGrabber:transform:width:extraHeight:unitSize:", v23);
    -[UIPDFSelection getBounds:transform:index:](v5, "getBounds:transform:index:", v24, v23, self->_endRectangle);
    *(double *)v24 = self->_endX;
    -[UIPDFTextRangeWidget layoutEndSelectionGrabber:transform:width:extraHeight:unitSize:](self, "layoutEndSelectionGrabber:transform:width:extraHeight:unitSize:", v23);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

- (void)setSelectedGrabber:(unint64_t)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 24;
  self->_fixedSelectionGrabber = *(CALayer **)((char *)&self->super.isa + v3);
}

- (void)setSelection:(id)a3
{
  uint64_t NumberOfRectsAndTransforms;
  uint64_t v6;
  uint64_t v7;
  int64_t startIndex;
  uint64_t RangeForRectIndex;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  int64_t endIndex;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  CALayer *v18;

  if (a3)
  {
    if (objc_msgSend(a3, "CGSelection"))
    {
      self->_startIndex = objc_msgSend(a3, "startIndex");
      self->_endIndex = objc_msgSend(a3, "endIndex");
      if (CGPDFSelectionGetNumberOfRectsAndTransforms())
      {
        NumberOfRectsAndTransforms = CGPDFSelectionGetNumberOfRectsAndTransforms();
        v6 = NumberOfRectsAndTransforms;
        if (NumberOfRectsAndTransforms < 1)
        {
          v11 = 0;
          if (NumberOfRectsAndTransforms)
            v12 = 0;
          else
            v12 = -1;
        }
        else
        {
          v7 = 0;
          startIndex = self->_startIndex;
          while (1)
          {
            RangeForRectIndex = CGPDFSelectionGetRangeForRectIndex();
            if (RangeForRectIndex <= startIndex && startIndex <= RangeForRectIndex + v10)
              break;
            if (v6 == ++v7)
            {
              v7 = v6;
              break;
            }
          }
          v11 = 0;
          v12 = v7 - (v7 == v6);
          endIndex = self->_endIndex;
          while (1)
          {
            v14 = CGPDFSelectionGetRangeForRectIndex();
            if (v14 <= endIndex && endIndex <= v14 + v15)
              break;
            if (v6 == ++v11)
            {
              v11 = v6;
              break;
            }
          }
        }
        CGPDFSelectionGetStartCursorXPosition();
        self->_startX = v16;
        CGPDFSelectionGetEndCursorXPosition();
        self->_endX = v17;
        self->_startRectangle = v12;
        self->_endRectangle = v11 - (v11 == v6);
        -[UIPDFTextRangeWidget layoutWidget](self, "layoutWidget");
        v18 = -[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer");
        -[CALayer addSublayer:](v18, "addSublayer:", self->_startSelectionGrabber);
        -[CALayer addSublayer:](v18, "addSublayer:", self->_endSelectionGrabber);
      }
    }
  }
}

- (void)remove
{
  -[CALayer removeFromSuperlayer](self->_startSelectionGrabber, "removeFromSuperlayer");
  self->_startSelectionGrabber = 0;
  -[CALayer removeFromSuperlayer](self->_endSelectionGrabber, "removeFromSuperlayer");
  self->_endSelectionGrabber = 0;
}

- (CGPoint)selectedPointFor:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = a3.x + self->_offsetX;
  v4 = a3.y + self->_offsetY;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)hitTest:(CGPoint)a3 fixedPoint:(CGPoint *)a4 preceeds:(BOOL *)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  BOOL v24;
  _BOOL4 v25;
  UIPDFSelection *v26;
  CGRect v27;
  double MinX;
  CGRect v29;
  double v30;
  double v31;
  double MidY;
  CGRect v33;
  double MaxX;
  CGRect v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGRect v51;
  CGRect v52;

  y = a3.y;
  x = a3.x;
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", -[UIView layer](self->_pageView, "layer"), a3.x, a3.y);
  v11 = v10;
  v13 = v12;
  *a4 = *(CGPoint *)MEMORY[0x1E0C9D538];
  *a5 = 0;
  -[CALayer position](self->_startHandle, "position");
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", self->_startSelectionGrabber, v14, v15);
  *(float *)&v16 = (v16 - v11) * (v16 - v11) + (v17 - v13) * (v17 - v13);
  v18 = sqrtf(*(float *)&v16);
  -[CALayer position](self->_endHandle, "position");
  -[CALayer convertPoint:fromLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:fromLayer:", self->_endSelectionGrabber, v19, v20);
  *(float *)&v21 = (v21 - v11) * (v21 - v11) + (v22 - v13) * (v22 - v13);
  v23 = sqrtf(*(float *)&v21);
  v24 = v23 > 20.0 && v18 > 20.0;
  if (!v24)
  {
    v25 = v23 > 20.0 && v18 <= 20.0;
    if (v18 <= 20.0 && !v25)
      v25 = v18 - v23 < 0.0;
    v26 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
    -[UIPDFSelection numberOfRectangles](v26, "numberOfRectangles");
    memset(&v52, 0, sizeof(v52));
    memset(&v51, 0, sizeof(v51));
    memset(&v50, 0, sizeof(v50));
    memset(&v49, 0, sizeof(v49));
    -[UIPDFSelection getBounds:transform:index:](v26, "getBounds:transform:index:", &v52, &v50, self->_startRectangle);
    -[UIPDFSelection getBounds:transform:index:](v26, "getBounds:transform:index:", &v51, &v49, self->_endRectangle);
    if (v25)
    {
      v27 = v52;
      if (self->_startLeft)
        MinX = CGRectGetMinX(v27);
      else
        MinX = CGRectGetMaxX(v27);
      v31 = MinX;
      MidY = CGRectGetMidY(v52);
      v33 = v51;
      if (self->_endRight)
        MaxX = CGRectGetMaxX(v33);
      else
        MaxX = CGRectGetMinX(v33);
      v37 = MaxX;
      v38 = CGRectGetMidY(v51);
      a4->x = v37;
      a4->y = v38;
      v48 = v50;
      if (!CGAffineTransformIsIdentity(&v48))
      {
        v39 = v31 * v50.b;
        v31 = v50.tx + v31 * v50.a + MidY * v50.c;
        MidY = v50.ty + v39 + MidY * v50.d;
        v40 = v50.ty + v37 * v50.b + v38 * v50.d;
        a4->x = v50.tx + v37 * v50.a + v38 * v50.c;
        a4->y = v40;
      }
      self->_fixedSelectionGrabber = self->_endSelectionGrabber;
      *a5 = 1;
    }
    else
    {
      v29 = v51;
      if (self->_endRight)
        v30 = CGRectGetMaxX(v29);
      else
        v30 = CGRectGetMinX(v29);
      v31 = v30;
      MidY = CGRectGetMidY(v51);
      v35 = v52;
      if (self->_startLeft)
        v36 = CGRectGetMinX(v35);
      else
        v36 = CGRectGetMaxX(v35);
      v41 = v36;
      v42 = CGRectGetMidY(v52);
      a4->x = v41;
      a4->y = v42;
      v48 = v49;
      if (!CGAffineTransformIsIdentity(&v48))
      {
        v43 = v31 * v49.b;
        v31 = v49.tx + v31 * v49.a + MidY * v49.c;
        MidY = v49.ty + v43 + MidY * v49.d;
        v44 = v49.ty + v41 * v49.b + v42 * v49.d;
        a4->x = v49.tx + v41 * v49.a + v42 * v49.c;
        a4->y = v44;
      }
      *a5 = 0;
      self->_fixedSelectionGrabber = self->_startSelectionGrabber;
    }
    self->_initialSelectionPointOnPage.x = v31;
    self->_initialSelectionPointOnPage.y = MidY;
    -[UIPDFPageView convertPointFromPDFPageSpace:](self->_pageView, "convertPointFromPDFPageSpace:", v31, MidY);
    self->_offsetX = v45 - x;
    self->_offsetY = v46 - y;
  }
  return !v24;
}

- (CGPoint)viewOffset
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
  double v12;
  CGPoint result;
  CGRect v14;

  v3 = *MEMORY[0x1E0C9D538];
  if (self->_fixedSelectionGrabber == self->_endSelectionGrabber)
  {
    -[CALayer bounds](self->_startSelectionGrabber, "bounds");
    v4 = (CGRectGetHeight(v14) - self->_handleHeight) * 0.5;
  }
  else
  {
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  -[CALayer convertPoint:toLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:toLayer:", -[UIView layer](self->_pageView, "layer"), 0.0, 0.0);
  v6 = v5;
  v8 = v7;
  -[CALayer convertPoint:toLayer:](-[UIPDFPageView effectsLayer](self->_pageView, "effectsLayer"), "convertPoint:toLayer:", -[UIView layer](self->_pageView, "layer"), v3, v4);
  v10 = v9 - v6;
  v12 = v11 - v8;
  result.y = v12;
  result.x = v10;
  return result;
}

- (CGRect)selectionRectangle
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)currentSelectionPointOnPage
{
  UIPDFSelection *v3;
  CGRect v4;
  double MaxX;
  float64x2_t v6;
  CGRect v7;
  double MinX;
  CGRect *v9;
  BOOL IsIdentity;
  double v11;
  CGFloat MidY;
  double v13;
  CGAffineTransform v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  CGRect v18;
  CGRect v19;
  CGPoint result;

  v3 = -[UIPDFPage selection](-[UIPDFPageView page](self->_pageView, "page"), "selection");
  if (-[UIPDFSelection numberOfRectangles](v3, "numberOfRectangles"))
  {
    memset(&v19, 0, sizeof(v19));
    memset(&v18, 0, sizeof(v18));
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    -[UIPDFSelection getBounds:transform:index:](v3, "getBounds:transform:index:", &v19, &v15, self->_startRectangle);
    -[UIPDFSelection getBounds:transform:index:](v3, "getBounds:transform:index:", &v18, &v15, self->_endRectangle);
    if (self->_fixedSelectionGrabber == self->_endSelectionGrabber)
    {
      v7 = v19;
      if (self->_startLeft)
        MinX = CGRectGetMinX(v7);
      else
        MinX = CGRectGetMaxX(v7);
      v13 = MinX;
      v9 = &v19;
    }
    else
    {
      v4 = v18;
      if (self->_endRight)
        MaxX = CGRectGetMaxX(v4);
      else
        MaxX = CGRectGetMinX(v4);
      v13 = MaxX;
      v9 = &v18;
    }
    MidY = CGRectGetMidY(*v9);
    *(float64x2_t *)&v14.a = v15;
    *(float64x2_t *)&v14.c = v16;
    *(float64x2_t *)&v14.tx = v17;
    IsIdentity = CGAffineTransformIsIdentity(&v14);
    v6.f64[0] = v13;
    v6.f64[1] = MidY;
    if (!IsIdentity)
      v6 = vaddq_f64(v17, vaddq_f64(vmulq_n_f64(v15, v13), vmulq_laneq_f64(v16, v6, 1)));
  }
  else
  {
    v6 = *(float64x2_t *)MEMORY[0x1E0C9D538];
  }
  v11 = v6.f64[1];
  result.x = v6.f64[0];
  result.y = v11;
  return result;
}

- (void)hide
{
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v3) = 0;
  -[CALayer setOpacity:](self->_startSelectionGrabber, "setOpacity:", v3);
  LODWORD(v4) = 0;
  -[CALayer setOpacity:](self->_endSelectionGrabber, "setOpacity:", v4);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (NSString)description
{
  void *v3;
  unint64_t startIndex;
  unint64_t endIndex;
  NSString *v6;
  CGPoint v8;
  CGPoint v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  startIndex = self->_startIndex;
  endIndex = self->_endIndex;
  -[CALayer position](self->_startSelectionGrabber, "position");
  v6 = NSStringFromCGPoint(v8);
  -[CALayer position](self->_endSelectionGrabber, "position");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("TextRangeWidget %lu - %lu, %@ %@"), startIndex, endIndex, v6, NSStringFromCGPoint(v9));
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
