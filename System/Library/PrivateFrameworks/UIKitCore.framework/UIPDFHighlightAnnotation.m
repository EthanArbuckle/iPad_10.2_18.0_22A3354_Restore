@implementation UIPDFHighlightAnnotation

- (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (int)annotationType
{
  return 2;
}

- (void)drawLayerUpright:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  CGColor *color;
  CGColor *CopyWithAlpha;
  uint64_t i;
  UIPDFAnnotationController *annotationController;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  CGImage *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGRect v24;

  color = self->super.super._color;
  CopyWithAlpha = CGColorCreateCopyWithAlpha(color, 0.25);
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, color);
  memset(&v24, 0, sizeof(v24));
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  if (a6)
  {
    for (i = 0; a6 != i; ++i)
    {
      objc_msgSend(a5, "getBounds:transform:index:", &v24, &v21, i);
      annotationController = self->super.super._annotationController;
      if (a3)
      {
        -[UIPDFAnnotationController convertRect:toSurfaceLayer:](annotationController, "convertRect:toSurfaceLayer:", a3, *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size);
        v24.origin.x = v15;
        v24.origin.y = v16;
        v24.size.width = v17;
        v24.size.height = v18;
      }
      else
      {
        v19 = -[UIPDFAnnotationController newHighlightMaskImageFor:](annotationController, "newHighlightMaskImageFor:", *(_OWORD *)&v24.origin, *(_OWORD *)&v24.size, v21, v22, v23);
        if (v19)
        {
          v20 = (CGImage *)v19;
          CGContextSaveGState(a4);
          CGContextClipToMask(a4, v24, v20);
          CGContextFillRect(a4, v24);
          CGContextRestoreGState(a4);
          CGImageRelease(v20);
          continue;
        }
      }
      CGContextSetFillColorWithColor(a4, CopyWithAlpha);
      CGContextFillRect(a4, v24);
    }
  }
  CGContextRestoreGState(a4);
  CGColorRelease(CopyWithAlpha);
}

- (void)drawLayerRotated:(id)a3 inContext:(CGContext *)a4 selection:(id)a5 rectangles:(unint64_t)a6
{
  CGColor *color;
  uint64_t v12;
  CGPath *Mutable;
  float64x2_t v14;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  CGFloat v19;
  CGFloat v20;
  float64x2_t v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float64_t v33;
  double v34;
  float64x2_t v35;
  float64x2_t v36;
  double v37;
  double MaxX;
  float64x2_t v39;
  double v40;
  double MinX;
  double v42;
  float64x2_t v43;
  double v44;
  float64x2_t v45;
  float64x2_t v46;
  float64x2_t v47;
  CGRect v48;

  color = self->super.super._color;
  CGContextSaveGState(a4);
  CGContextSetFillColorWithColor(a4, color);
  memset(&v48, 0, sizeof(v48));
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  if (a6)
  {
    v12 = 0;
    do
    {
      objc_msgSend(a5, "getBounds:transform:index:", &v48, &v45, v12, *(_OWORD *)&v35);
      Mutable = CGPathCreateMutable();
      CGContextSaveGState(a4);
      MinX = CGRectGetMinX(v48);
      v36 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, MinX), vmulq_n_f64(v46, CGRectGetMinY(v48))));
      v42 = CGRectGetMinX(v48);
      v43 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, v42), vmulq_n_f64(v46, CGRectGetMaxY(v48))));
      MaxX = CGRectGetMaxX(v48);
      v39 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, MaxX), vmulq_n_f64(v46, CGRectGetMaxY(v48))));
      v14.f64[0] = CGRectGetMaxX(v48);
      v35 = v14;
      y = v48.origin.y;
      v14.f64[0] = v48.origin.x;
      height = v48.size.height;
      width = v48.size.width;
      MinY = CGRectGetMinY(*(CGRect *)v14.f64);
      v20 = v39.f64[0];
      v19 = v43.f64[0];
      v21 = vaddq_f64(v47, vaddq_f64(vmulq_n_f64(v45, v35.f64[0]), vmulq_n_f64(v46, MinY)));
      v22 = v36.f64[0];
      v23 = v21.f64[1];
      v24 = v39.f64[1];
      v25 = v43.f64[1];
      v26 = v36.f64[1];
      if (a3)
      {
        v35 = v21;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3);
        v37 = v27;
        v26 = v28;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3, *(_OWORD *)&v43);
        v44 = v29;
        v25 = v30;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3, *(_OWORD *)&v39);
        v40 = v31;
        v24 = v32;
        -[UIPDFAnnotationController convertPoint:toSurfaceLayer:](self->super.super._annotationController, "convertPoint:toSurfaceLayer:", a3, v35.f64[0], v23);
        v20 = v40;
        v19 = v44;
        v21.f64[0] = v33;
        v22 = v37;
        v23 = v34;
      }
      CPSetCGPathPoints4(Mutable, v22, v26, v19, v25, v20, v24, v21.f64[0], v23);
      CGPathCloseSubpath(Mutable);
      CGContextAddPath(a4, Mutable);
      CGContextFillPath(a4);
      CGContextRestoreGState(a4);
      CGPathRelease(Mutable);
      ++v12;
    }
    while (a6 != v12);
  }
  CGContextRestoreGState(a4);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  UIPDFSelection *v7;
  UIPDFSelection *v8;
  uint64_t v9;
  uint64_t v10;
  CGAffineTransform v11[2];

  if (-[UIPDFAnnotationController tracking](self->super.super._annotationController, "tracking"))
  {
    v7 = -[UIPDFAnnotation selection](self, "selection");
    if (v7)
    {
      v8 = v7;
      v9 = -[UIPDFSelection numberOfRectangles](v7, "numberOfRectangles");
      if (v9)
      {
        v10 = v9;
        memset(&v11[1], 0, sizeof(CGAffineTransform));
        -[UIPDFSelection transform](v8, "transform");
        v11[0] = v11[1];
        if (CGAffineTransformIsIdentity(v11))
          -[UIPDFHighlightAnnotation drawLayerUpright:inContext:selection:rectangles:](self, "drawLayerUpright:inContext:selection:rectangles:", a3, a4, v8, v10);
        else
          -[UIPDFHighlightAnnotation drawLayerRotated:inContext:selection:rectangles:](self, "drawLayerRotated:inContext:selection:rectangles:", a3, a4, v8, v10);
      }
    }
  }
}

- (void)drawInContext:(CGContext *)a3
{
  UIPDFAnnotationController *annotationController;
  UIPDFSelection *v6;
  id v7;
  UIPDFSelection *v8;
  UIPDFSelection *v9;
  uint64_t v10;
  uint64_t v11;
  CGAffineTransform v12[2];

  annotationController = self->super.super._annotationController;
  if (!annotationController || !-[UIPDFAnnotationController tracking](annotationController, "tracking"))
  {
    v6 = -[UIPDFAnnotation selection](self, "selection");
    if (!v6)
    {
      v7 = -[UIPDFAnnotation archive](self, "archive");
      if (!v7)
        return;
      v8 = -[UIPDFSelection initWithPage:fromArchive:]([UIPDFSelection alloc], "initWithPage:fromArchive:", -[UIPDFAnnotation page](self, "page"), v7);
      if (!v8)
        return;
      v9 = v8;
      -[UIPDFAnnotation setSelection:](self, "setSelection:", v8);

    }
    v10 = -[UIPDFSelection numberOfRectangles](v6, "numberOfRectangles");
    if (v10)
    {
      v11 = v10;
      memset(&v12[1], 0, sizeof(CGAffineTransform));
      if (v6)
        -[UIPDFSelection transform](v6, "transform");
      v12[0] = v12[1];
      if (CGAffineTransformIsIdentity(v12))
        -[UIPDFHighlightAnnotation drawLayerUpright:inContext:selection:rectangles:](self, "drawLayerUpright:inContext:selection:rectangles:", 0, a3, v6, v11);
      else
        -[UIPDFHighlightAnnotation drawLayerRotated:inContext:selection:rectangles:](self, "drawLayerRotated:inContext:selection:rectangles:", 0, a3, v6, v11);
    }
  }
}

- (BOOL)recognizeGestures
{
  return 1;
}

@end
