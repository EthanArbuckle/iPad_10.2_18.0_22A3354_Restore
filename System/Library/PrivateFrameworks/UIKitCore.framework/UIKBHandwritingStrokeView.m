@implementation UIKBHandwritingStrokeView

- (void)dealloc
{
  CGContext *bitmapContext;
  objc_super v4;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    CFRelease(bitmapContext);
    self->_bitmapContext = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UIKBHandwritingStrokeView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (BOOL)_wantsDeepDrawing
{
  return 0;
}

- (CGRect)handwritingPointToRect:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v6 = fmax(v5 * 1.10000002, 1.20000005);
  v7 = v6 + -0.200000003;
  v8 = v6 < 2.5999999;
  v9 = 2.3999999;
  if (v8)
    v9 = v7;
  v10 = v3 - v9;
  v11 = v4 - v9;
  v12 = v9 + v9;
  v13 = v12;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)createBitmapIfNeeded
{
  CGContext *bitmapContext;
  size_t Height;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGImage *Image;
  CGContext *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double scaleFactor;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGSize v24;
  CGColorSpace *DeviceGray;
  CGContext *v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  bitmapContext = self->_bitmapContext;
  if (bitmapContext)
  {
    Height = CGBitmapContextGetHeight(bitmapContext);
    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "scale");
    v7 = v6;
    -[UIView bounds](self, "bounds");
    v8 = (double)Height;
    v10 = v7 * v9;

    if (v10 - (double)Height < 1.0)
      return;
    v12 = self->_bitmapContext;
    if (v12)
    {
      Image = CGBitmapContextCreateImage(v12);
      CFRelease(self->_bitmapContext);
      self->_bitmapContext = 0;
    }
    else
    {
      Image = 0;
    }
  }
  else
  {
    Image = 0;
    v8 = 0.0;
  }
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  self->_scaleFactor = v14;

  -[UIView bounds](self, "bounds");
  v16 = v15;
  v18 = v17;
  scaleFactor = self->_scaleFactor;
  v21 = scaleFactor * v20;
  v23 = scaleFactor * v22;
  v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_aggregateInvalidRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_aggregateInvalidRect.size = v24;
  DeviceGray = CGColorSpaceCreateDeviceGray();
  self->_bitmapContext = CGBitmapContextCreate(0, (unint64_t)v21, (unint64_t)v23, 8uLL, 0, DeviceGray, 1u);
  CFRelease(DeviceGray);
  v26 = self->_bitmapContext;
  v27.origin.x = v16;
  v27.origin.y = v18;
  v27.size.width = v21;
  v27.size.height = v23;
  v28 = CGRectOffset(v27, -v16, -v18);
  CGContextClearRect(v26, v28);
  if (Image)
  {
    v29.origin.x = v16;
    v29.origin.y = v18;
    v29.size.width = v21;
    v29.size.height = v8;
    CGContextDrawImage(self->_bitmapContext, v29, Image);
    CFRelease(Image);
  }
  -[UIKBHandwritingStrokeView updateInkColor](self, "updateInkColor");
}

- (void)updateInkColor
{
  CGContext *bitmapContext;
  id v3;

  bitmapContext = self->_bitmapContext;
  -[UIKBHandwritingStrokeView keyView](self, "keyView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  CGContextSetFillColorWithColor(bitmapContext, (CGColorRef)objc_msgSend(v3, "inkColor"));

}

- (CGRect)convertRectToBitmapCoordinates:(CGRect)a3
{
  double scaleFactor;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  scaleFactor = self->_scaleFactor;
  v4 = a3.origin.x * scaleFactor;
  v5 = a3.origin.y * scaleFactor;
  v6 = a3.size.width * scaleFactor;
  v7 = a3.size.height * scaleFactor;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertRectToViewCoordinates:(CGRect)a3
{
  double scaleFactor;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  scaleFactor = self->_scaleFactor;
  v4 = a3.origin.x / scaleFactor;
  v5 = a3.origin.y / scaleFactor;
  v6 = a3.size.width / scaleFactor;
  v7 = a3.size.height / scaleFactor;
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)addHandwritingPoint:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGContext *bitmapContext;
  CGRect v19;
  CGRect v20;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  -[UIKBHandwritingStrokeView createBitmapIfNeeded](self, "createBitmapIfNeeded", a3);
  -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v8, v7, v6);
  -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  bitmapContext = self->_bitmapContext;
  -[UIKBHandwritingStrokeView convertRectToBitmapCoordinates:](self, "convertRectToBitmapCoordinates:");
  CGContextFillEllipseInRect(bitmapContext, v19);
  v20.origin.x = v11;
  v20.origin.y = v13;
  v20.size.width = v15;
  v20.size.height = v17;
  self->_aggregateInvalidRect = CGRectUnion(self->_aggregateInvalidRect, v20);
}

- (void)addTrapezoidFromFirstPoint:(id *)a3 secondPoint:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;
  double v20;
  double v21;
  float64x2_t v22;
  float64_t v23;
  double v24;
  double v25;
  double v26;
  float v27;
  double v28;
  double v29;
  float64x2_t v30;
  float v31;
  float32x2_t v32;
  float32x2_t v33;
  float32x2_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x2_t v37;
  double v38;
  double v39;
  double v40;
  float32x2_t v41;
  float32x2_t v42;
  CGPath *Mutable;
  double x;
  double y;
  double width;
  double height;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  float32x2_t v56;
  float32x2_t v57;
  float64_t v58;
  float32x2_t v59;
  float64_t v60;
  float32x2_t v61;
  CGRect BoundingBox;
  CGRect v63;
  CGRect v64;

  if (v4 != v7 || v5 != v8)
  {
    v11 = v9;
    v12 = v8;
    v13 = v7;
    v14 = v6;
    v15 = v5;
    v16 = v4;
    -[UIKBHandwritingStrokeView createBitmapIfNeeded](self, "createBitmapIfNeeded", a3, a4);
    -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v16, v15, v14);
    v58 = v19;
    v60 = v18;
    v21 = v20;
    -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:", v13, v12, v11);
    v25 = fmax(v21 * 1.10000002, 1.20000005);
    v26 = v25 + -0.200000003;
    if (v25 >= 2.5999999)
      v26 = 2.3999999;
    v27 = v26;
    v28 = fmax(v24 * 1.10000002, 1.20000005);
    if (v28 >= 2.5999999)
      v29 = 2.3999999;
    else
      v29 = v28 + -0.200000003;
    v30.f64[0] = v60;
    v30.f64[1] = v58;
    v31 = v29;
    *(float32x2_t *)&v30.f64[0] = vcvt_f32_f64(v30);
    v22.f64[1] = v23;
    v32 = vcvt_f32_f64(v22);
    v33 = vsub_f32(v32, *(float32x2_t *)&v30.f64[0]);
    v34 = vmul_f32(v33, v33);
    v34.i32[0] = vadd_f32(v34, (float32x2_t)vdup_lane_s32((int32x2_t)v34, 1)).u32[0];
    v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
    v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
    v37 = vmul_n_f32(v33, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
    v38 = v37.f32[0];
    v39 = v37.f32[0] * 6.123234e-17;
    v40 = v37.f32[1];
    *(float *)&v39 = v39 - v40;
    *(float *)&v40 = v38 - v40 * 6.123234e-17;
    HIDWORD(v39) = LODWORD(v40);
    *(float *)&v40 = self->_scaleFactor;
    v41 = vmul_n_f32(*(float32x2_t *)&v39, v27 + 0.2);
    v42 = vmul_n_f32(*(float32x2_t *)&v39, v31 + 0.2);
    v56 = vmul_n_f32(vadd_f32(v41, *(float32x2_t *)&v30.f64[0]), *(float *)&v40);
    v57 = vmul_n_f32(vadd_f32(v42, v32), *(float *)&v40);
    v59 = vmul_n_f32(vsub_f32(v32, v42), *(float *)&v40);
    v61 = vmul_n_f32(vsub_f32(*(float32x2_t *)&v30.f64[0], v41), *(float *)&v40);
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, v56.f32[0], v56.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v57.f32[0], v57.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v59.f32[0], v59.f32[1]);
    CGPathAddLineToPoint(Mutable, 0, v61.f32[0], v61.f32[1]);
    CGPathCloseSubpath(Mutable);
    BoundingBox = CGPathGetBoundingBox(Mutable);
    x = BoundingBox.origin.x;
    y = BoundingBox.origin.y;
    width = BoundingBox.size.width;
    height = BoundingBox.size.height;
    CGContextAddPath(self->_bitmapContext, Mutable);
    CGPathRelease(Mutable);
    CGContextFillPath(self->_bitmapContext);
    v48 = self->_aggregateInvalidRect.origin.x;
    v49 = self->_aggregateInvalidRect.origin.y;
    v50 = self->_aggregateInvalidRect.size.width;
    v51 = self->_aggregateInvalidRect.size.height;
    -[UIKBHandwritingStrokeView convertRectToViewCoordinates:](self, "convertRectToViewCoordinates:", x, y, width, height);
    v64.origin.x = v52;
    v64.origin.y = v53;
    v64.size.width = v54;
    v64.size.height = v55;
    v63.origin.x = v48;
    v63.origin.y = v49;
    v63.size.width = v50;
    v63.size.height = v51;
    self->_aggregateInvalidRect = CGRectUnion(v63, v64);
  }
}

- (void)clearRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGContext *bitmapContext;
  CGRect v13;
  CGRect ClipBoundingBox;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIKBHandwritingStrokeView createBitmapIfNeeded](self, "createBitmapIfNeeded");
  -[UIView bounds](self, "bounds");
  v19.origin.x = v8;
  v19.origin.y = v9;
  v19.size.width = v10;
  v19.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectEqualToRect(v13, v19))
  {
    ClipBoundingBox = CGContextGetClipBoundingBox(self->_bitmapContext);
    bitmapContext = self->_bitmapContext;
    v15 = CGRectOffset(ClipBoundingBox, -ClipBoundingBox.origin.x, -ClipBoundingBox.origin.y);
    CGContextClearRect(bitmapContext, v15);
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
  else
  {
    -[UIKBHandwritingStrokeView convertRectToBitmapCoordinates:](self, "convertRectToBitmapCoordinates:", x, y, width, height);
    v17 = CGRectIntegral(v16);
    CGContextClearRect(self->_bitmapContext, v17);
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    self->_aggregateInvalidRect = CGRectIntegral(v18);
    -[UIKBHandwritingStrokeView redrawStrokesInRect:](self, "redrawStrokesInRect:", x, y, width, height);
    -[UIKBHandwritingStrokeView displayAggregateInvalidRect](self, "displayAggregateInvalidRect");
  }
}

- ($89C9DF7554150EC42DA90319EED2ADED)viewPointFromDataPoint:(SEL)a3
{
  void *v4;
  $89C9DF7554150EC42DA90319EED2ADED *result;

  -[UIKBHandwritingStrokeView keyView](self, "keyView", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pageOffset");

  return result;
}

- (void)redrawStrokesInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  double v25;
  CGFloat y;
  double v27;
  CGFloat width;
  double v29;
  CGFloat height;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  id obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v47 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[UIKBHandwritingStrokeView keyView](self, "keyView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interpolatedPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v42 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v10 = v9;
        v11 = 0;
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v38;
          do
          {
            v14 = 0;
            v15 = v11;
            do
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v14);
              objc_msgSend(v16, "UIKBHandwritingPointValue");
              v18 = v17;
              v20 = v19;
              v22 = v21;
              -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:");
              -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
              x = v23;
              y = v25;
              width = v27;
              height = v29;
              if (v15)
              {
                objc_msgSend(v15, "UIKBHandwritingPointValue");
                -[UIKBHandwritingStrokeView viewPointFromDataPoint:](self, "viewPointFromDataPoint:");
                -[UIKBHandwritingStrokeView handwritingPointToRect:](self, "handwritingPointToRect:");
                v51.origin.x = v31;
                v51.origin.y = v32;
                v51.size.width = v33;
                v51.size.height = v34;
                v48.origin.x = x;
                v48.origin.y = y;
                v48.size.width = width;
                v48.size.height = height;
                v49 = CGRectUnion(v48, v51);
                v50 = CGRectInset(v49, -0.200000003, -0.200000003);
                x = v50.origin.x;
                y = v50.origin.y;
                width = v50.size.width;
                height = v50.size.height;
              }
              v52.origin.x = x;
              v52.origin.y = y;
              v52.size.width = width;
              v52.size.height = height;
              if (CGRectIntersectsRect(a3, v52))
              {
                if (v15)
                {
                  objc_msgSend(v15, "UIKBHandwritingPointValue");
                  -[UIKBHandwritingStrokeView addTrapezoidFromFirstPoint:secondPoint:](self, "addTrapezoidFromFirstPoint:secondPoint:");
                }
                -[UIKBHandwritingStrokeView addHandwritingPoint:](self, "addHandwritingPoint:", v18, v20, v22);
              }
              v11 = v16;

              ++v14;
              v15 = v11;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          }
          while (v12);
        }

      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v6);
  }

}

- (void)displayAggregateInvalidRect
{
  CGRect *p_aggregateInvalidRect;
  CGSize v4;
  CGRect v5;

  p_aggregateInvalidRect = &self->_aggregateInvalidRect;
  v5 = CGRectIntegral(self->_aggregateInvalidRect);
  -[UIView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  p_aggregateInvalidRect->origin = (CGPoint)*MEMORY[0x1E0C9D628];
  p_aggregateInvalidRect->size = v4;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  void *v8;
  _QWORD *ContextStack;
  CGContext *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGImage *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  id v43;
  void *v44;
  CGFloat v45;
  void *v46;
  CGContext *bitmapContext;
  CGImage *Image;
  size_t v49;
  size_t v50;
  uint64_t v51;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD info[8];
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;
  CGRect v63;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v62 = *MEMORY[0x1E0C80C00];
  -[UIKBHandwritingStrokeView keyView](self, "keyView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1)
      v10 = 0;
    else
      v10 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    CGContextSaveGState(v10);
    -[UIKBHandwritingStrokeView keyView](self, "keyView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "inkColor");

    if (v12)
    {
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recreateInkMaskIfNeeded");

      -[UIView bounds](self, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (CGImage *)objc_msgSend(v22, "inkMask");
      v63.origin.x = v15;
      v63.origin.y = v17;
      v63.size.width = v19;
      v63.size.height = v21;
      CGContextClipToMask(v10, v63, v23);

    }
    -[UIKBHandwritingStrokeView keyView](self, "keyView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bezierPathFIFO");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pageOffset");
      v28 = x + v27;

      v60 = 0;
      info[0] = v10;
      *(double *)&info[1] = v28;
      *(CGFloat *)&info[2] = y;
      *(CGFloat *)&info[3] = width;
      *(CGFloat *)&info[4] = height;
      info[5] = 0;
      info[6] = 0;
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "inkWidth");
      info[7] = v30;

      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "pageOffset");
      CGContextTranslateCTM(v10, -v32, 0.0);

      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      -[UIKBHandwritingStrokeView keyView](self, "keyView", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "interpolatedPoints");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v56;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v56 != v36)
              objc_enumerationMutation(v34);
            v38 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            LOBYTE(v60) = 0;
            CGPathApply((CGPathRef)objc_msgSend(objc_retainAutorelease(v38), "CGPath"), info, (CGPathApplierFunction)clipHandwritingPath);
          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        }
        while (v35);
      }

      LOBYTE(v60) = 0;
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "currentPath");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40 == 0;

      if (!v41)
      {
        -[UIKBHandwritingStrokeView keyView](self, "keyView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "currentPath");
        v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGPathApply((CGPathRef)objc_msgSend(v43, "CGPath"), info, (CGPathApplierFunction)clipHandwritingPath);

      }
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "inkWidth");
      CGContextSetLineWidth(v10, v45);

      CGContextSetLineCap(v10, kCGLineCapRound);
      CGContextSetLineJoin(v10, kCGLineJoinRound);
      -[UIKBHandwritingStrokeView keyView](self, "keyView");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      CGContextSetStrokeColorWithColor(v10, (CGColorRef)objc_msgSend(v46, "inkColor"));

      CGContextStrokePath(v10);
    }
    else
    {
      bitmapContext = self->_bitmapContext;
      if (bitmapContext)
      {
        Image = CGBitmapContextCreateImage(bitmapContext);
        v49 = CGBitmapContextGetWidth(self->_bitmapContext);
        v50 = CGBitmapContextGetHeight(self->_bitmapContext);
        -[UIView bounds](self, "bounds");
        if (v50 && v49)
          v54 = v53 * (double)v50 / (double)v49;
        CGContextDrawImage(v10, *(CGRect *)&v51, Image);
        CFRelease(Image);
      }
    }
    CGContextRestoreGState(v10);
  }
}

- (UIKBHandwritingView)keyView
{
  return (UIKBHandwritingView *)objc_loadWeakRetained((id *)&self->_keyView);
}

- (void)setKeyView:(id)a3
{
  objc_storeWeak((id *)&self->_keyView, a3);
}

- (CGContext)bitmapContext
{
  return self->_bitmapContext;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (CGRect)aggregateInvalidRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_aggregateInvalidRect.origin.x;
  y = self->_aggregateInvalidRect.origin.y;
  width = self->_aggregateInvalidRect.size.width;
  height = self->_aggregateInvalidRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_keyView);
}

@end
