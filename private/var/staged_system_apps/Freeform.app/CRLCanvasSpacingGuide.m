@implementation CRLCanvasSpacingGuide

- (id)initForEdge:(int)a3 ofGeneratingObjectRect:(CGRect)a4 andParentSpacing:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  id WeakRetained;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  id v38;
  _BOOL8 v39;
  CRLCanvasSpacingGuide *v40;
  id v41;
  id v42;
  objc_super v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v12 = 0.0;
  if (a3 > 5)
  {
    v21 = 0;
    v22 = 0;
    v23 = 0.0;
    goto LABEL_31;
  }
  if (((1 << a3) & 5) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry standardAxesGeometry](CRLSwappableAxesGeometry, "standardAxesGeometry"));
  }
  else
  {
    if (((1 << a3) & 0x12) != 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D4A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E335D4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125D4C8);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasSpacingGuide.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 45, 0, "if you are creating a center spacing guide, use CRLCanvasCenterAlignmentGuide");

      goto LABEL_16;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry swappedAxesGeometry](CRLSwappableAxesGeometry, "swappedAxesGeometry"));
  }
  v17 = v16;
  objc_storeWeak((id *)&self->mVerticalGeom, v16);

LABEL_16:
  if (((1 << a3) & 9) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    objc_msgSend(WeakRetained, "rectMinX:", x, y, width, height);
    v26 = v25;
    objc_msgSend(v11, "exactOffset");
    v12 = v26 - v27;

    v19 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    objc_msgSend(v19, "rectMaxX:", x, y, width, height);
    v29 = v28;
    objc_msgSend(v11, "exactOffset");
    v21 = 0;
    v23 = v29 + v30;
    v22 = 1;
  }
  else if (((1 << a3) & 0x12) != 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D4E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E33550();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125D508);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v18);
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasSpacingGuide initForEdge:ofGeneratingObjectRect:andParentSpacing:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasSpacingGuide.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 69, 0, "if you are creating a center spacing guide, use CRLCanvasCenterAlignmentGuide");

    v21 = 0;
    v22 = 0;
    v23 = 0.0;
  }
  else
  {
    v31 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    objc_msgSend(v31, "rectMaxX:", x, y, width, height);
    v33 = v32;
    objc_msgSend(v11, "exactOffset");
    v12 = v33 + v34;

    v19 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    objc_msgSend(v19, "rectMinX:", x, y, width, height);
    v36 = v35;
    objc_msgSend(v11, "exactOffset");
    v22 = 0;
    v23 = v36 - v37;
    v21 = 1;
  }

LABEL_31:
  v38 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  v39 = sub_10046DAAC((int)objc_msgSend(v38, "horizontalOrientation"));
  v44.receiver = self;
  v44.super_class = (Class)CRLCanvasSpacingGuide;
  v40 = -[CRLCanvasAlignmentGuide initWithType:offset:](&v44, "initWithType:offset:", v39, v12);

  if (v40)
  {
    -[CRLCanvasAlignmentGuide setSnapsToMax:](v40, "setSnapsToMax:", v22);
    -[CRLCanvasAlignmentGuide setSnapsToMid:](v40, "setSnapsToMid:", 0);
    -[CRLCanvasAlignmentGuide setSnapsToMin:](v40, "setSnapsToMin:", v21);
    -[CRLCanvasAlignmentGuide setInfinite:](v40, "setInfinite:", 0);
    v41 = objc_loadWeakRetained((id *)&v40->mVerticalGeom);
    objc_msgSend(v41, "rectMinY:", x, y, width, height);
    -[CRLCanvasAlignmentGuide setStart:](v40, "setStart:");

    v42 = objc_loadWeakRetained((id *)&v40->mVerticalGeom);
    objc_msgSend(v42, "rectMaxY:", x, y, width, height);
    -[CRLCanvasAlignmentGuide setEnd:](v40, "setEnd:");

    v40->mGeneratingObjectRect.origin.x = x;
    v40->mGeneratingObjectRect.origin.y = y;
    v40->mGeneratingObjectRect.size.width = width;
    v40->mGeneratingObjectRect.size.height = height;
    v40->mOppositeOffset = v23;
    -[CRLCanvasSpacingGuide setParentSpacing:](v40, "setParentSpacing:", v11);
  }

  return v40;
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  CRLSwappableAxesGeometry **p_mVerticalGeom;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  unsigned int v22;
  id v23;
  double v24;
  double v25;
  id v26;
  unsigned int v27;
  double v29;
  objc_super v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = *(_QWORD *)&a3;
  p_mVerticalGeom = &self->mVerticalGeom;
  WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  objc_msgSend(WeakRetained, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = objc_loadWeakRetained((id *)p_mVerticalGeom);
  v22 = objc_msgSend(v21, "rect:horizontallyOverlapsRect:", self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, x, y, width, height);

  if (!v22)
    return 0;
  v29 = height;
  v23 = objc_loadWeakRetained((id *)p_mVerticalGeom);
  objc_msgSend(v23, "rectHeight:", v14, v16, v18, v20);
  v25 = v24;

  if (v25 <= 1.0)
    return 0;
  if (sub_100060F38(v14, v16, v18, v20, self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height))
  {
    return 0;
  }
  if (sub_100060F38(v14, v16, v18, v20, x, y, width, v29))
    return 0;
  v26 = objc_loadWeakRetained((id *)&self->mParentSpacing);
  v27 = objc_msgSend(v26, "containsNonIntersectingSpacingRectsWithRect:forEdge:", v9, v14, v16, v18, v20);

  if (!v27)
    return 0;
  v31.receiver = self;
  v31.super_class = (Class)CRLCanvasSpacingGuide;
  return -[CRLCanvasAlignmentGuide canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](&v31, "canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", v9, x, y, width, v29, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double mOppositeOffset;
  CRLSwappableAxesGeometry **p_mVerticalGeom;
  id WeakRetained;
  double v11;
  double v12;
  id v13;
  double v14;
  BOOL v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  mOppositeOffset = self->mOppositeOffset;
  p_mVerticalGeom = &self->mVerticalGeom;
  WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  objc_msgSend(WeakRetained, "rectMinX:", x, y, width, height);
  if (mOppositeOffset <= v11)
  {
    v15 = 0;
  }
  else
  {
    v12 = self->mOppositeOffset;
    v13 = objc_loadWeakRetained((id *)p_mVerticalGeom);
    objc_msgSend(v13, "rectMaxX:", x, y, width, height);
    v15 = v12 < v14;

  }
  return sub_100060F38(self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, x, y, width, height)&& v15;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSpacingGuide parentSpacing](self, "parentSpacing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentSpacing"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

- (id)renderableWithICC:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CRLCanvasRenderable *mRenderable;
  CRLCanvasRenderable *v15;
  CRLCanvasRenderable *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCanvasSpacingGuideUILayer *v20;
  id v21;
  CRLCanvasSpacingGuideUILayer *v22;
  CRLCanvasSpacingGuideUILayer *mSpacingUILayer;
  CRLCanvasRenderable *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CRLCanvasRenderable *v29;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->mVerticalGeom);
  objc_msgSend(WeakRetained, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mGeneratingObjectRect.origin.x, self->mGeneratingObjectRect.origin.y, self->mGeneratingObjectRect.size.width, self->mGeneratingObjectRect.size.height, self->super.super.mSnappingObjectFrame.origin.x, self->super.super.mSnappingObjectFrame.origin.y, self->super.super.mSnappingObjectFrame.size.width, self->super.super.mSnappingObjectFrame.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  mRenderable = self->super.mRenderable;
  if (!mRenderable)
  {
    v15 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    v16 = self->super.mRenderable;
    self->super.mRenderable = v15;

    -[CRLCanvasRenderable setEdgeAntialiasingMask:](self->super.mRenderable, "setEdgeAntialiasingMask:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.0));
    -[CRLCanvasRenderable setBackgroundColor:](self->super.mRenderable, "setBackgroundColor:", objc_msgSend(v17, "CGColor"));

    -[CRLCanvasRenderable setPosition:](self->super.mRenderable, "setPosition:", CGPointZero.x, CGPointZero.y);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSpacingGuide parentSpacing](self, "parentSpacing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "spacingRectsRenderableForGuideRect:withICC:", v4, v7, v9, v11, v13));

    if (v19)
      -[CRLCanvasRenderable addSubrenderable:](self->super.mRenderable, "addSubrenderable:", v19);
    v20 = [CRLCanvasSpacingGuideUILayer alloc];
    v21 = objc_loadWeakRetained((id *)&self->mVerticalGeom);
    v22 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:](v20, "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", objc_msgSend(v21, "horizontalOrientation"), v4, 1, v7, v9, v11, v13);
    mSpacingUILayer = self->mSpacingUILayer;
    self->mSpacingUILayer = v22;

    v24 = self->super.mRenderable;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->mSpacingUILayer));
    -[CRLCanvasRenderable addSubrenderable:](v24, "addSubrenderable:", v25);

    self->super.super.mLocationInvalidated = 1;
    mRenderable = self->super.mRenderable;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSpacingGuide parentSpacing](self, "parentSpacing"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "spacingRectsRenderableForGuideRect:withICC:", v4, v7, v9, v11, v13));
  -[CRLCanvasRenderable addSubrenderable:](mRenderable, "addSubrenderable:", v27);

  if (self->super.super.mLocationInvalidated)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSpacingGuide parentSpacing](self, "parentSpacing"));
    objc_msgSend(v28, "updateSpacingUIWithICC:", v4);

    -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v7, v9, v11, v13);
    self->super.super.mLocationInvalidated = 0;
  }
  v29 = self->super.mRenderable;

  return v29;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString *v13;
  void *v14;
  void *v15;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[CRLCanvasAlignmentGuide guideType](self, "guideType"))
    v6 = CFSTR("vertical");
  else
    v6 = CFSTR("horizontal");
  if (-[CRLCanvasAlignmentGuide snapsToMin](self, "snapsToMin"))
    v7 = CFSTR("min");
  else
    v7 = CFSTR("max");
  -[CRLCanvasAbstractGuide offset](self, "offset");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasSpacingGuide parentSpacing](self, "parentSpacing"));
  objc_msgSend(v10, "exactOffset");
  v12 = v11;
  v13 = NSStringFromCGRect(self->mGeneratingObjectRect);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p: %@ %@ spacing guide with offset %f parentOffset %f from SpacingRect: %@>"), v5, self, v6, v7, v9, v12, v14));

  return v15;
}

- (CRLCanvasSpacing)parentSpacing
{
  return (CRLCanvasSpacing *)objc_loadWeakRetained((id *)&self->mParentSpacing);
}

- (void)setParentSpacing:(id)a3
{
  objc_storeWeak((id *)&self->mParentSpacing, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->mVerticalGeom);
  objc_storeStrong((id *)&self->mSpacingUILayer, 0);
  objc_destroyWeak((id *)&self->mParentSpacing);
}

@end
