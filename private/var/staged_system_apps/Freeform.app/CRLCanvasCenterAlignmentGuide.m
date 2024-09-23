@implementation CRLCanvasCenterAlignmentGuide

- (id)initBetweenRect:(CGRect)a3 andRect:(CGRect)a4 withGuideType:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLSwappableAxesGeometry *v14;
  CRLSwappableAxesGeometry *mVerticalGeom;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _BOOL8 v24;
  CRLCanvasCenterAlignmentGuide *v25;
  id *p_isa;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;
  objc_super v35;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  if (a5 == 1)
    v14 = (CRLSwappableAxesGeometry *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry standardAxesGeometry](CRLSwappableAxesGeometry, "standardAxesGeometry"));
  else
    v14 = (CRLSwappableAxesGeometry *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry swappedAxesGeometry](CRLSwappableAxesGeometry, "swappedAxesGeometry"));
  mVerticalGeom = self->mVerticalGeom;
  self->mVerticalGeom = v14;

  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](self->mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", v12, v11, v10, v9, x, y, width, height);
  v30 = width;
  v31 = height;
  v17 = v16;
  v19 = v18;
  v28 = x;
  v29 = y;
  v21 = v20;
  v23 = v22;
  v24 = sub_10046DAAC(-[CRLSwappableAxesGeometry verticalOrientation](self->mVerticalGeom, "verticalOrientation"));
  -[CRLSwappableAxesGeometry rectMidX:](self->mVerticalGeom, "rectMidX:", v17, v19, v21, v23);
  v35.receiver = self;
  v35.super_class = (Class)CRLCanvasCenterAlignmentGuide;
  v25 = -[CRLCanvasAlignmentGuide initWithType:offset:](&v35, "initWithType:offset:", v24);
  p_isa = (id *)&v25->super.super.super.isa;
  if (v25)
  {
    v25->mLeftGeneratingObjectRect.origin.x = v12;
    v25->mLeftGeneratingObjectRect.origin.y = v11;
    v25->mLeftGeneratingObjectRect.size.width = v10;
    v25->mLeftGeneratingObjectRect.size.height = v9;
    v25->mRightGeneratingObjectRect.origin.x = v28;
    v25->mRightGeneratingObjectRect.origin.y = v29;
    v25->mRightGeneratingObjectRect.size.width = v30;
    v25->mRightGeneratingObjectRect.size.height = v31;
    v34.receiver = v25;
    v34.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    -[CRLCanvasAlignmentGuide setInfinite:](&v34, "setInfinite:", 0);
    objc_msgSend(p_isa[28], "rectMinY:", v17, v19, v21, v23);
    v33.receiver = p_isa;
    v33.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    -[CRLCanvasAlignmentGuide setStart:](&v33, "setStart:");
    objc_msgSend(p_isa[28], "rectMaxY:", v17, v19, v21, v23);
    v32.receiver = p_isa;
    v32.super_class = (Class)CRLCanvasCenterAlignmentGuide;
    -[CRLCanvasAlignmentGuide setEnd:](&v32, "setEnd:");
    objc_msgSend(p_isa, "setSnapsToMin:", 0);
    objc_msgSend(p_isa, "setSnapsToMax:", 0);
    objc_msgSend(p_isa, "setSnapsToMid:", 1);
  }
  return p_isa;
}

- (int64_t)compare:(id)a3
{
  id v4;
  signed int v5;
  signed int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[CRLCanvasCenterAlignmentGuide integerOffset](self, "integerOffset");
  v6 = objc_msgSend(v4, "integerOffset");

  if (v6 <= v5)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

- (double)exactOffset
{
  CRLSwappableAxesGeometry *mVerticalGeom;
  CGRect *p_mRightGeneratingObjectRect;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  mVerticalGeom = self->mVerticalGeom;
  p_mRightGeneratingObjectRect = &self->mRightGeneratingObjectRect;
  -[CRLCanvasAbstractGuide snappingObjectFrame](self, "snappingObjectFrame");
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", p_mRightGeneratingObjectRect->origin.x, p_mRightGeneratingObjectRect->origin.y, p_mRightGeneratingObjectRect->size.width, p_mRightGeneratingObjectRect->size.height, v4, v5, v6, v7);
  -[CRLSwappableAxesGeometry rectWidth:](mVerticalGeom, "rectWidth:");
  return result;
}

- (int)integerOffset
{
  double v2;

  -[CRLCanvasCenterAlignmentGuide exactOffset](self, "exactOffset");
  return (int)sub_1003C65A0(v2);
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v10;
  CRLSwappableAxesGeometry *mVerticalGeom;
  double v12;
  double v13;
  double v14;
  objc_super v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CRLCanvasCenterAlignmentGuide;
  v10 = -[CRLCanvasAlignmentGuide canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:](&v16, "canBeSnappedToByEdge:ofFrame:inVisibleUnscaledRect:", *(_QWORD *)&a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v10)
  {
    -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](self->mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    v18 = CGRectIntersection(v17, v19);
    if (CGRectIsNull(v18))
    {
      LOBYTE(v10) = 0;
    }
    else
    {
      mVerticalGeom = self->mVerticalGeom;
      -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height);
      -[CRLSwappableAxesGeometry rectWidth:](mVerticalGeom, "rectWidth:");
      v13 = v12;
      -[CRLSwappableAxesGeometry rectWidth:](self->mVerticalGeom, "rectWidth:", x, y, width, height);
      LOBYTE(v10) = v13 > v14 + 1.0;
    }
  }
  return v10;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = sub_100060F38(self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v8)
    LOBYTE(v8) = sub_100060F38(self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height, x, y, width, height);
  return v8;
}

- (id)renderableWithICC:(id)a3
{
  id v4;
  CRLSwappableAxesGeometry *mVerticalGeom;
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
  CRLSwappableAxesGeometry *v18;
  double v19;
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
  CRLCanvasRenderable *v31;
  CRLCanvasRenderable *mRenderable;
  void *v33;
  CRLCanvasSpacingGuideUILayer *v34;
  CRLCanvasSpacingGuideUILayer *mLeftSpacingUILayer;
  CRLCanvasRenderable *v36;
  void *v37;
  CRLCanvasSpacingGuideUILayer *v38;
  CRLCanvasSpacingGuideUILayer *mRightSpacingUILayer;
  CRLCanvasRenderable *v40;
  void *v41;
  CRLCanvasRenderable *v42;

  v4 = a3;
  mVerticalGeom = self->mVerticalGeom;
  -[CRLCanvasAbstractGuide snappingObjectFrame](self, "snappingObjectFrame");
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](mVerticalGeom, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mLeftGeneratingObjectRect.origin.x, self->mLeftGeneratingObjectRect.origin.y, self->mLeftGeneratingObjectRect.size.width, self->mLeftGeneratingObjectRect.size.height, v6, v7, v8, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = self->mVerticalGeom;
  -[CRLCanvasAbstractGuide snappingObjectFrame](self, "snappingObjectFrame");
  -[CRLSwappableAxesGeometry makeHorizontalSpacingRectBetweenRect:andRect:](v18, "makeHorizontalSpacingRectBetweenRect:andRect:", self->mRightGeneratingObjectRect.origin.x, self->mRightGeneratingObjectRect.origin.y, self->mRightGeneratingObjectRect.size.width, self->mRightGeneratingObjectRect.size.height, v19, v20, v21, v22);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (self->super.mRenderable)
  {
    if (!self->super.super.mLocationInvalidated)
      goto LABEL_6;
  }
  else
  {
    v31 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    mRenderable = self->super.mRenderable;
    self->super.mRenderable = v31;

    -[CRLCanvasRenderable setEdgeAntialiasingMask:](self->super.mRenderable, "setEdgeAntialiasingMask:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.0));
    -[CRLCanvasRenderable setBackgroundColor:](self->super.mRenderable, "setBackgroundColor:", objc_msgSend(v33, "CGColor"));

    v34 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", -[CRLSwappableAxesGeometry horizontalOrientation](self->mVerticalGeom, "horizontalOrientation"), v4, 1, v11, v13, v15, v17);
    mLeftSpacingUILayer = self->mLeftSpacingUILayer;
    self->mLeftSpacingUILayer = v34;

    v36 = self->super.mRenderable;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->mLeftSpacingUILayer));
    -[CRLCanvasRenderable addSubrenderable:](v36, "addSubrenderable:", v37);

    v38 = -[CRLCanvasSpacingGuideUILayer initWithSpacingRect:ofOrientation:icc:useVisibleRect:]([CRLCanvasSpacingGuideUILayer alloc], "initWithSpacingRect:ofOrientation:icc:useVisibleRect:", -[CRLSwappableAxesGeometry horizontalOrientation](self->mVerticalGeom, "horizontalOrientation"), v4, 1, v24, v26, v28, v30);
    mRightSpacingUILayer = self->mRightSpacingUILayer;
    self->mRightSpacingUILayer = v38;

    v40 = self->super.mRenderable;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->mRightSpacingUILayer));
    -[CRLCanvasRenderable addSubrenderable:](v40, "addSubrenderable:", v41);

    self->super.super.mLocationInvalidated = 1;
  }
  -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mLeftSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v11, v13, v15, v17);
  -[CRLCanvasSpacingGuideUILayer setFrameFromSpacingRect:icc:](self->mRightSpacingUILayer, "setFrameFromSpacingRect:icc:", v4, v24, v26, v28, v30);
  self->super.super.mLocationInvalidated = 0;
LABEL_6:
  v42 = self->super.mRenderable;

  return v42;
}

- (id)description
{
  Class v3;
  NSString *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (-[CRLCanvasAlignmentGuide guideType](self, "guideType"))
    v6 = CFSTR("vertical");
  else
    v6 = CFSTR("horizontal");
  -[CRLCanvasAbstractGuide offset](self, "offset");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %p %@ center spacing guide at %p with offset %f"), v5, self, v6, self, v7));

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mVerticalGeom, 0);
  objc_storeStrong((id *)&self->mRightSpacingUILayer, 0);
  objc_storeStrong((id *)&self->mLeftSpacingUILayer, 0);
}

@end
