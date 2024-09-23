@implementation TSDShapeLayout

- (TSDShapeLayout)initWithInfo:(id)a3
{
  TSDShapeLayout *v3;
  TSDShapeLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDShapeLayout;
  v3 = -[TSDLayout initWithInfo:](&v6, sel_initWithInfo_, a3);
  v4 = v3;
  if (v3)
  {
    if (-[TSDShapeLayout shapeInfo](v3, "shapeInfo"))
    {
      *(_WORD *)&v4->mShapeInvalidFlags |= 0x3FFu;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeLayout;
  -[TSDDrawableLayout dealloc](&v3, sel_dealloc);
}

- (id)layoutGeometryFromInfo
{
  objc_super v3;

  if (self->mResizeInfoGeometry)
    return -[TSDLayoutGeometry initWithInfoGeometry:]([TSDLayoutGeometry alloc], "initWithInfoGeometry:", self->mResizeInfoGeometry);
  v3.receiver = self;
  v3.super_class = (Class)TSDShapeLayout;
  return -[TSDLayout layoutGeometryFromInfo](&v3, sel_layoutGeometryFromInfo);
}

- (id)computeLayoutGeometry
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  TSDLayoutGeometry *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  TSDPathSource *v19;
  TSDPathSource *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  unsigned int v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  BOOL v40;
  double v41;
  double v43;
  float v44;
  float v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  TSDLayoutGeometry *v53;
  CGAffineTransform v55;
  CGAffineTransform v56;

  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    objc_msgSend(v3, "maximumFrameSizeForChild:", self);
    v5 = v4;
    v7 = v6;
  }
  else
  {
    v5 = 1.79769313e308;
    v7 = 1.79769313e308;
  }
  v8 = -[TSDShapeLayout pathSource](self, "pathSource");
  v9 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  v10 = objc_msgSend(v9, "layoutGeometryForLayout:", self);
  if (v10)
  {
    v11 = (TSDLayoutGeometry *)v10;
    v12 = (void *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
    objc_msgSend(v12, "naturalSize");
    v14 = v13;
    v16 = v15;
    -[TSDLayoutGeometry size](v11, "size");
    if (v14 != v18 || v16 != v17)
    {

      self->mProvidedPathSource = 0;
      v19 = (TSDPathSource *)objc_msgSend(v12, "copy");
      self->mProvidedPathSource = v19;
      -[TSDLayoutGeometry size](v11, "size");
      -[TSDPathSource scaleToNaturalSize:](v19, "scaleToNaturalSize:");
      -[TSDShapeLayout invalidatePath](self, "invalidatePath");
      -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
    }
  }
  else
  {
    if (v5 < 1.79769313e308 || v7 < 1.79769313e308)
    {
      v20 = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
      v21 = -[TSDShapeLayout stroke](self, "stroke");
      objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "center");
      v23 = v22;
      v25 = v24;
      objc_msgSend(-[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry"), "position");
      v27 = v26;
      memset(&v56, 0, sizeof(v56));
      v28 = -[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry");
      if (v28)
      {
        v29 = v28;
        v30 = TSDSubtractPoints(v23, v25, v27);
        objc_msgSend(v29, "transformBasedOnPoint:centeredAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v30, v31);
      }
      else
      {
        memset(&v56, 0, sizeof(v56));
      }
      v32 = 0;
      while (1)
      {
        v33 = -[TSDPathSource bezierPath](v20, "bezierPath");
        v55 = v56;
        if (!CGAffineTransformIsIdentity(&v55))
        {
          v55 = v56;
          objc_msgSend(v33, "transformUsingAffineTransform:", &v55);
        }
        TSDPathBoundsIncludingStroke((CGPathRef)objc_msgSend(v33, "CGPath"), v21);
        v35 = v34;
        v37 = v36;
        v38 = TSDSubtractSizes(v34, v36, v5);
        if (!v32 && v38 <= 0.0 && v39 <= 0.0)
          break;
        if (!v32)
          goto LABEL_29;
        v40 = v38 > 0.0 || v38 <= -1.0;
        if (!v40 && v39 <= 0.0 || v38 <= 0.0 && v39 <= 0.0 && v39 > -1.0)
          goto LABEL_43;
        if (v32 <= 3)
        {
LABEL_29:
          v41 = v5 / v35;
          if (v7 / v37 >= 1.0 || v41 <= 1.0)
            v43 = v5 / v35;
          else
            v43 = v7 / v37;
          if (v5 / v35 < 1.0 && v7 / v37 > 1.0)
            v43 = v5 / v35;
          else
            v41 = v7 / v37;
          v44 = v43;
          v45 = v41;
          v46 = fminf(v44, v45);
          -[TSDPathSource naturalSize](v20, "naturalSize");
          -[TSDPathSource setNaturalSize:](v20, "setNaturalSize:", TSDMultiplySizeScalar(v47, v48, v46));
        }
        if (++v32 == 5)
          goto LABEL_43;
      }

    }
    v20 = 0;
LABEL_43:

    self->mShrunkenPathSource = v20;
    if (-[TSDShapeLayout pathSource](self, "pathSource") != v8)
    {
      -[TSDShapeLayout invalidatePath](self, "invalidatePath");
      -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
    }
    -[TSDShapeLayout pathBounds](self, "pathBounds");
    v50 = v49;
    v52 = v51;
    memset(&v56, 0, sizeof(v56));
    -[TSDShapeLayout computeLayoutTransform](self, "computeLayoutTransform");
    v53 = [TSDLayoutGeometry alloc];
    v55 = v56;
    v11 = -[TSDLayoutGeometry initWithSize:transform:](v53, "initWithSize:transform:", &v55, v50, v52);
    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      return (id)objc_msgSend(v9, "adjustLayoutGeometry:forLayout:", v11, self);
  }
  return v11;
}

- (CGAffineTransform)computeLayoutTransform
{
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGAffineTransform v9;
  CGAffineTransform v10;

  memset(&v10, 0, sizeof(v10));
  v5 = -[TSDShapeLayout layoutInfoGeometry](self, "layoutInfoGeometry");
  if (v5)
    objc_msgSend(v5, "transform");
  else
    memset(&v10, 0, sizeof(v10));
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  v9 = v10;
  return CGAffineTransformTranslate(retstr, &v9, v6, v7);
}

- (void)setGeometry:(id)a3
{
  TSDLayoutGeometry *v5;
  TSDLayoutGeometry *v6;
  uint64_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  __int128 v15;
  float64x2_t v16;
  objc_super v17;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;

  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x20) == 0)
  {
    v5 = -[TSDAbstractLayout geometry](self, "geometry");
    if (!v5)
    {
LABEL_5:
      *(_WORD *)&self->mShapeInvalidFlags |= 0x20u;
      goto LABEL_10;
    }
    v6 = v5;
    if (!-[TSDLayoutGeometry isEqual:](v5, "isEqual:", a3))
    {
      if (-[TSDLayoutGeometry differsInMoreThanTranslationFrom:](v6, "differsInMoreThanTranslationFrom:", a3))
        goto LABEL_5;
      if (a3)
      {
        objc_msgSend(a3, "transform");
        v8 = v21;
        v9 = v22;
        v10 = v23;
      }
      else
      {
        v10 = 0uLL;
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
        v8 = 0uLL;
        v9 = 0uLL;
      }
      v11 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v15 = *MEMORY[0x24BDBEFB0];
      v16 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v11), v8, *MEMORY[0x24BDBEFB0]));
      -[TSDLayoutGeometry transform](v6, "transform", *(_QWORD *)&v11, v7);
      v12 = TSDSubtractPoints(v16.f64[0], v16.f64[1], vaddq_f64(v20, vmlaq_n_f64(vmulq_n_f64(v19, v14), v18, *(double *)&v15)).f64[0]);
      self->mCachedAlignmentFrame.origin.x = TSDAddPoints(self->mCachedAlignmentFrame.origin.x, self->mCachedAlignmentFrame.origin.y, v12);
      self->mCachedAlignmentFrame.origin.y = v13;
    }
  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)TSDShapeLayout;
  -[TSDDrawableLayout setGeometry:](&v17, sel_setGeometry_, a3);
}

- (CGRect)alignmentFrame
{
  CGRect *p_mCachedAlignmentFrame;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  double x;
  double y;
  double width;
  double height;
  uint64_t v12;
  CGRect result;

  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x20) != 0)
  {
    p_mCachedAlignmentFrame = &self->mCachedAlignmentFrame;
    -[TSDAbstractLayout transform](self, "transform");
    -[TSDShapeLayout shapeFrameWithTransform:](self, "shapeFrameWithTransform:", &v12);
    p_mCachedAlignmentFrame->origin.x = v4;
    p_mCachedAlignmentFrame->origin.y = v5;
    p_mCachedAlignmentFrame->size.width = v6;
    p_mCachedAlignmentFrame->size.height = v7;
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x20u;
  }
  x = self->mCachedAlignmentFrame.origin.x;
  y = self->mCachedAlignmentFrame.origin.y;
  width = self->mCachedAlignmentFrame.size.width;
  height = self->mCachedAlignmentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)alignmentFrameInRoot
{
  double v3;
  double v4;
  double v5;
  double v6;
  _OWORD v7[3];
  CGRect result;

  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    if (self)
      -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
    else
      memset(v7, 0, sizeof(v7));
    -[TSDShapeLayout shapeFrameWithTransform:](self, "shapeFrameWithTransform:", v7);
  }
  else
  {
    -[TSDShapeLayout alignmentFrame](self, "alignmentFrame");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)processChangedProperty:(int)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDShapeLayout;
  -[TSDDrawableLayout processChangedProperty:](&v5, sel_processChangedProperty_);
  switch(a3)
  {
    case 517:
      -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
      -[TSDShapeLayout p_invalidateHead](self, "p_invalidateHead");
      goto LABEL_5;
    case 522:
      -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
      -[TSDShapeLayout p_invalidateHead](self, "p_invalidateHead");
      goto LABEL_7;
    case 523:
      -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
LABEL_5:
      -[TSDShapeLayout p_invalidateTail](self, "p_invalidateTail");
      goto LABEL_7;
    case 526:
      -[TSDShapeLayout invalidatePath](self, "invalidatePath");
LABEL_7:
      -[TSDShapeLayout invalidateFrame](self, "invalidateFrame");
      break;
    default:
      return;
  }
}

- (CGRect)boundsForStandardKnobs
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGRect v14;

  objc_msgSend(-[TSDShapeLayout pathSource](self, "pathSource"), "naturalSize");
  v3 = TSDRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  v11 = -v10;
  v13 = -v12;
  v14.origin.x = v3;
  v14.origin.y = v5;
  v14.size.width = v7;
  v14.size.height = v9;
  return CGRectOffset(v14, v11, v13);
}

- (id)stroke
{
  if (self->mDynamicStroke)
    return self->mDynamicStroke;
  else
    return (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke");
}

- (void)dynamicStrokeWidthChangeDidBegin
{
  void *v3;
  uint64_t v4;

  if (self->mDynamicStroke)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout dynamicStrokeWidthChangeDidBegin]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 357, CFSTR("expected nil value for '%s'"), "mDynamicStroke");
  }
  self->mDynamicStroke = (TSDMutableStroke *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "stroke"), "mutableCopy");
}

- (void)dynamicStrokeWidthUpdateToValue:(double)a3
{
  TSDMutableStroke *mDynamicStroke;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  TSDMutableStroke *v9;

  mDynamicStroke = self->mDynamicStroke;
  if (!mDynamicStroke)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout dynamicStrokeWidthUpdateToValue:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 363, CFSTR("invalid nil value for '%s'"), "mDynamicStroke");
    mDynamicStroke = self->mDynamicStroke;
  }
  v8 = -[TSDStroke isFrame](mDynamicStroke, "isFrame");
  v9 = self->mDynamicStroke;
  if (v8)
    -[TSDMutableStroke setAssetScale:](v9, "setAssetScale:", a3);
  else
    -[TSDMutableStroke setWidth:](v9, "setWidth:", a3);
  -[TSDShapeLayout processChangedProperty:](self, "processChangedProperty:", 517);
  objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController"), "repForLayout:", self), "processChangedProperty:", 517);
}

- (void)dynamicStrokeWidthChangeDidEnd
{

  self->mDynamicStroke = 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return self->mDynamicStroke != 0;
}

- (id)shapeInfo
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return (id)TSUDynamicCast();
}

- (id)pathSource
{
  TSDPathSource *mResizePathSource;

  mResizePathSource = self->mResizePathSource;
  if (mResizePathSource)
    return mResizePathSource;
  mResizePathSource = self->mShrunkenPathSource;
  if (mResizePathSource)
    return mResizePathSource;
  mResizePathSource = self->mProvidedPathSource;
  if (mResizePathSource)
    return mResizePathSource;
  else
    return (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
}

- (id)editablePathSource
{
  TSDPathSource *v3;
  TSDPathSource *v4;
  uint64_t v5;
  void *v6;

  v3 = -[TSDShapeLayout pathSource](self, "pathSource");
  v4 = (TSDPathSource *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  objc_opt_class();
  v5 = TSUDynamicCast();
  if (v5)
  {
    v6 = (void *)v5;

    self->mCachedEditableBezierPathSource = 0;
    self->mCachedPathSource = 0;
  }
  else
  {
    if (v4 != self->mCachedPathSource)
    {

      self->mCachedEditableBezierPathSource = 0;
      self->mCachedEditableBezierPathSource = +[TSDEditableBezierPathSource editableBezierPathSourceWithPathSource:](TSDEditableBezierPathSource, "editableBezierPathSourceWithPathSource:", v3);
      self->mCachedPathSource = v3;
    }
    return self->mCachedEditableBezierPathSource;
  }
  return v6;
}

- (id)smartPathSource
{
  -[TSDShapeLayout pathSource](self, "pathSource");
  return (id)TSUProtocolCast();
}

- (id)layoutInfoGeometry
{
  if (self->mResizeInfoGeometry)
    return self->mResizeInfoGeometry;
  else
    return (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
}

- (CGPoint)headPoint
{
  double x;
  double y;
  CGPoint result;

  -[TSDShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  x = self->mHeadPoint.x;
  y = self->mHeadPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)tailPoint
{
  double x;
  double y;
  CGPoint result;

  -[TSDShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  x = self->mTailPoint.x;
  y = self->mTailPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)headLineEndPoint
{
  double x;
  double y;
  CGPoint result;

  -[TSDShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  x = self->mHeadLineEndPoint.x;
  y = self->mHeadLineEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  double x;
  double y;
  CGPoint result;

  -[TSDShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  x = self->mTailLineEndPoint.x;
  y = self->mTailLineEndPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)headLineEndAngle
{
  -[TSDShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  return self->mHeadLineEndAngle;
}

- (double)tailLineEndAngle
{
  -[TSDShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  return self->mTailLineEndAngle;
}

- (BOOL)isTailEndOnLeft
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  float64x2_t v17;
  float64x2_t v18;
  float64x2_t v19;
  double v20;
  double v21;
  double v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  float64x2_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  -[TSDShapeLayout tailLineEndPoint](self, "tailLineEndPoint");
  v4 = v3;
  v6 = v5;
  v7 = -[TSDAbstractLayout geometryInRoot](self, "geometryInRoot");
  if (v7)
  {
    objc_msgSend(v7, "transform");
    v9 = v29;
    v8 = v28;
    v11 = v31;
    v10 = v30;
    v12 = v33;
    v13 = v32;
  }
  else
  {
    v12 = 0.0;
    v11 = 0.0;
    v9 = 0.0;
    v13 = 0.0;
    v10 = 0.0;
    v8 = 0.0;
  }
  -[TSDShapeLayout headLineEndPoint](self, "headLineEndPoint");
  v23 = v15;
  v24 = v14;
  v16 = -[TSDAbstractLayout geometryInRoot](self, "geometryInRoot");
  if (v16)
  {
    objc_msgSend(v16, "transform");
    v17 = v25;
    v18 = v26;
    v19 = v27;
  }
  else
  {
    v19 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
  }
  v20 = TSDSubtractPoints(v13 + v6 * v10 + v8 * v4, v12 + v6 * v11 + v9 * v4, vaddq_f64(v19, vmlaq_n_f64(vmulq_n_f64(v18, v23), v17, v24)).f64[0]);
  if (fabs(v20) < 1.0)
    v20 = v21;
  return v20 < 0.0;
}

- (double)lineEndScale
{
  double result;

  objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "width");
  if (result > 1.0)
    return (result + -1.0) * 0.6 + 1.0;
  return result;
}

- (id)clippedPathForLineEnds
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x200) != 0)
  {
    self->mCachedClippedPath = (TSDBezierPath *)-[TSDShapeLayout p_createClippedPath](self, "p_createClippedPath");
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x200u;
  }
  return self->mCachedClippedPath;
}

- (CGRect)shapeFrameWithTransform:(CGAffineTransform *)a3
{
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  __int128 v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;
  CGRect v44;

  -[TSDShapeLayout pathBounds](self, "pathBounds");
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v35.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v35.c = v7;
  *(_OWORD *)&v35.tx = *(_OWORD *)&a3->tx;
  CGAffineTransformTranslate(&v36, &v35, -v5, -v6);
  v8 = *(_OWORD *)&v36.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v36.a;
  *(_OWORD *)&a3->c = v8;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v36.tx;
  if (objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "isFrame"))
    -[TSDShapeLayout pathBounds](self, "pathBounds");
  else
    objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "boundsForPath:", -[TSDShapeLayout clippedPathForLineEnds](self, "clippedPathForLineEnds"));
  v13 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v36.c = v13;
  *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
  v37 = CGRectApplyAffineTransform(*(CGRect *)&v9, &v36);
  x = v37.origin.x;
  y = v37.origin.y;
  width = v37.size.width;
  height = v37.size.height;
  if (-[TSDShapeLayout pathIsOpen](self, "pathIsOpen"))
  {
    v18 = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = v18;
    *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
    -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 1, &v36);
    v43.origin.x = v19;
    v43.origin.y = v20;
    v43.size.width = v21;
    v43.size.height = v22;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectUnion(v38, v43);
    v23 = v39.origin.x;
    v24 = v39.origin.y;
    v25 = v39.size.width;
    v26 = v39.size.height;
    *(_OWORD *)&v39.origin.y = *(_OWORD *)&a3->c;
    *(_OWORD *)&v36.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&v36.c = *(_OWORD *)&v39.origin.y;
    *(_OWORD *)&v36.tx = *(_OWORD *)&a3->tx;
    -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 0, &v36);
    v44.origin.x = v27;
    v44.origin.y = v28;
    v44.size.width = v29;
    v44.size.height = v30;
    v40.origin.x = v23;
    v40.origin.y = v24;
    v40.size.width = v25;
    v40.size.height = v26;
    v41 = CGRectUnion(v40, v44);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
  }
  v31 = x;
  v32 = y;
  v33 = width;
  v34 = height;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (BOOL)isInvisible
{
  return 0;
}

- (BOOL)shouldBeDisplayedInShowMode
{
  char HasNaNComponents;
  unsigned int v4;
  objc_super v6;

  -[TSDStyledLayout frameForCulling](self, "frameForCulling");
  HasNaNComponents = TSDRectHasNaNComponents();
  v6.receiver = self;
  v6.super_class = (Class)TSDShapeLayout;
  v4 = -[TSDLayout shouldBeDisplayedInShowMode](&v6, sel_shouldBeDisplayedInShowMode);
  if (v4)
    LOBYTE(v4) = (-[TSDShapeLayout isInvisibleAutosizingShape](self, "isInvisibleAutosizingShape") | HasNaNComponents) ^ 1;
  return v4;
}

- (BOOL)isInvisibleAutosizingShape
{
  int v3;
  char v4;

  v3 = objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "widthValid");
  v4 = objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "heightValid");
  if (v3 && (v4 & 1) != 0)
    return 0;
  else
    return objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "shouldShowInstructionalText") ^ 1;
}

- (CGPoint)centerForConnecting
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;
  CGPoint result;

  v11.receiver = self;
  v11.super_class = (Class)TSDShapeLayout;
  -[TSDLayout centerForConnecting](&v11, sel_centerForConnecting);
  v4 = v3;
  v6 = v5;
  if (-[TSDShapeLayout isInvisibleAutosizingShape](self, "isInvisibleAutosizingShape"))
  {
    objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "center");
    v4 = v7;
    v6 = v8;
  }
  v9 = v4;
  v10 = v6;
  result.y = v10;
  result.x = v9;
  return result;
}

- (CGRect)aliasedAlignmentFrameForScale:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  id v51;
  id v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect result;
  CGRect v62;
  CGRect v63;

  v51 = 0;
  v52 = 0;
  v49 = 0.0;
  v50 = 0.0;
  v47 = 0.0;
  v48 = 0.0;
  -[TSDShapeLayout aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:](self, "aliasPathForScale:adjustedStroke:adjustedPath:startDelta:endDelta:", &v52, &v51, &v49, &v47, a3);
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  v5 = v4;
  v7 = v6;
  memset(&v46, 0, sizeof(v46));
  if (self)
    -[TSDAbstractLayout transform](self, "transform");
  v44 = v46;
  CGAffineTransformTranslate(&v45, &v44, -v5, -v7);
  v46 = v45;
  v8 = v52;
  if (objc_msgSend(v52, "isFrame"))
  {
    objc_msgSend(v51, "bounds");
    objc_msgSend(v8, "coverageRect:");
    v45 = v46;
    v54 = CGRectApplyAffineTransform(v53, &v45);
    x = v54.origin.x;
    y = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
  }
  else
  {
    v13 = (void *)objc_msgSend(v51, "copy");
    v45 = v46;
    objc_msgSend(v13, "transformUsingAffineTransform:", &v45);
    objc_msgSend(v8, "boundsForPath:", v13);
    x = v14;
    y = v15;
    width = v16;
    height = v17;

  }
  if (-[TSDShapeLayout pathIsOpen](self, "pathIsOpen"))
  {
    v45 = v46;
    -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 1, &v45);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    CGAffineTransformMakeTranslation(&v43, v49, v50);
    v55.origin.x = v19;
    v55.origin.y = v21;
    v55.size.width = v23;
    v55.size.height = v25;
    v62 = CGRectApplyAffineTransform(v55, &v43);
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    v57 = CGRectUnion(v56, v62);
    v26 = v57.origin.x;
    v27 = v57.origin.y;
    v28 = v57.size.width;
    v29 = v57.size.height;
    v45 = v46;
    -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 0, &v45);
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;
    CGAffineTransformMakeTranslation(&v42, v47, v48);
    v58.origin.x = v31;
    v58.origin.y = v33;
    v58.size.width = v35;
    v58.size.height = v37;
    v63 = CGRectApplyAffineTransform(v58, &v42);
    v59.origin.x = v26;
    v59.origin.y = v27;
    v59.size.width = v28;
    v59.size.height = v29;
    v60 = CGRectUnion(v59, v63);
    x = v60.origin.x;
    y = v60.origin.y;
    width = v60.size.width;
    height = v60.size.height;
  }
  v38 = x;
  v39 = y;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)aliasPathForScale:(double)a3 adjustedStroke:(id *)a4 adjustedPath:(id *)a5 startDelta:(CGPoint *)a6 endDelta:(CGPoint *)a7
{
  -[TSDShapeLayout aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:](self, "aliasPathForScale:originalStroke:adjustedStroke:adjustedPath:startDelta:endDelta:", -[TSDShapeLayout stroke](self, "stroke"), a4, a5, a6, a7, a3);
}

- (void)aliasPathForScale:(double)a3 originalStroke:(id)a4 adjustedStroke:(id *)a5 adjustedPath:(id *)a6 startDelta:(CGPoint *)a7 endDelta:(CGPoint *)a8
{
  id v15;
  id v16;
  void *v17;
  CGPoint v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  id v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  void *v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  CGPoint v37;
  __int128 v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v15 = -[TSDShapeLayout shapeInfo](self, "shapeInfo");
  if (-[TSDShapeLayout pathIsOpen](self, "pathIsOpen")
    && (objc_msgSend(v15, "headLineEnd") || objc_msgSend(v15, "tailLineEnd")))
  {
    v16 = -[TSDShapeLayout clippedPathForLineEnds](self, "clippedPathForLineEnds");
  }
  else
  {
    v16 = -[TSDShapeLayout path](self, "path");
  }
  v17 = v16;
  memset(&v42, 0, sizeof(v42));
  if (self)
    -[TSDAbstractLayout transformInRoot](self, "transformInRoot");
  *a5 = a4;
  *a6 = (id)objc_msgSend(v17, "copy");
  v18 = (CGPoint)*MEMORY[0x24BDBEFB0];
  *a7 = *(CGPoint *)MEMORY[0x24BDBEFB0];
  v37 = v18;
  *a8 = v18;
  if (v17)
  {
    v43 = v42;
    if (TSDIsTransformAxisAligned(&v43.a))
    {
      -[TSDShapeLayout pathBounds](self, "pathBounds");
      v20 = v19;
      v22 = v21;
      if (!objc_msgSend(a4, "shouldRender") || objc_msgSend(a4, "shouldAntialiasDefeat"))
      {
        v23 = (id)objc_msgSend(a4, "mutableCopy", v37);
        v24 = 0.0;
        if (objc_msgSend(v23, "shouldRender") && (objc_msgSend(v23, "isFrame") & 1) == 0)
        {
          objc_msgSend(a4, "width");
          v24 = 1.0;
          if (v25 * a3 > 1.0)
          {
            TSURound();
            v24 = v26;
            objc_msgSend(v23, "setWidth:", v26 / a3);
          }
          objc_msgSend(a4, "width");
          objc_msgSend(v23, "setActualWidth:");
        }
        v27 = (id)objc_msgSend(v17, "copy");
        objc_msgSend(v17, "elementAtIndex:associatedPoints:", 0, &v43);
        *a7 = *(CGPoint *)&v43.a;
        objc_msgSend(v17, "currentPoint");
        a8->x = v28;
        a8->y = v29;
        v40 = v42;
        CGAffineTransformTranslate(&v41, &v40, -v20, -v22);
        v42 = v41;
        objc_msgSend(v27, "transformUsingAffineTransform:", &v41);
        *(float *)&v30 = a3;
        *(float *)&v31 = v24;
        v32 = (void *)objc_msgSend(v27, "aliasedPathWithViewScale:effectiveStrokeWidth:", v30, v31);
        v41 = v42;
        CGAffineTransformInvert(&v39, &v41);
        objc_msgSend(v32, "transformUsingAffineTransform:", &v39);
        *(_OWORD *)&v41.a = v38;
        objc_msgSend(v32, "elementAtIndex:associatedPoints:", 0, &v41);
        a7->x = TSDSubtractPoints(v41.a, v41.b, a7->x);
        a7->y = v33;
        objc_msgSend(v32, "currentPoint");
        a8->x = TSDSubtractPoints(v34, v35, a8->x);
        a8->y = v36;
        *a5 = v23;
        *a6 = v32;
      }
    }
  }
}

- (TSDFill)fill
{
  if (self->mDynamicFill)
    return self->mDynamicFill;
  else
    return (TSDFill *)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "fill");
}

- (BOOL)canBeIntersected
{
  return !-[TSDShapeLayout pathIsLineSegment](self, "pathIsLineSegment");
}

- (BOOL)canResetTextAndObjectHandles
{
  return !-[TSDShapeLayout pathIsLineSegment](self, "pathIsLineSegment");
}

- (void)invalidateFrame
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDShapeLayout;
  -[TSDLayout invalidateFrame](&v3, sel_invalidateFrame);
  *(_WORD *)&self->mShapeInvalidFlags |= 0x20u;
}

- (void)invalidatePath
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x19u;

  self->mCachedPath = 0;
  -[TSDShapeLayout invalidatePathBounds](self, "invalidatePathBounds");
  -[TSDShapeLayout p_invalidateHead](self, "p_invalidateHead");
  -[TSDShapeLayout p_invalidateTail](self, "p_invalidateTail");
  -[TSDShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)invalidatePathBounds
{
  CGPoint v2;
  CGSize v3;

  *(_WORD *)&self->mShapeInvalidFlags |= 0x26u;
  v2 = (CGPoint)*MEMORY[0x24BDBF090];
  v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->mCachedPathBounds.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->mCachedPathBounds.size = v3;
  self->mCachedPathBoundsWithoutStroke.origin = v2;
  self->mCachedPathBoundsWithoutStroke.size = v3;
  -[TSDDrawableLayout invalidateExteriorWrap](self, "invalidateExteriorWrap");
}

- (BOOL)supportsResize
{
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(-[TSDShapeLayout path](self, "path"), "bounds");
  v4 = v3;
  v6 = v5;
  if (-[TSDShapeLayout pathIsLineSegment](self, "pathIsLineSegment"))
    return 0;
  if (v6 >= 0.00000001)
    return v4 >= 0.00000001;
  return 0;
}

- (void)beginDynamicOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  TSDInfo *v8;
  objc_super v9[3];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSDShapeLayout;
  -[TSDLayout beginDynamicOperation](&v10, sel_beginDynamicOperation);
  if (self->mResizePathSource)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout beginDynamicOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 784, CFSTR("expected nil value for '%s'"), "mResizePathSource");
  }
  if (self->mResizeInfoGeometry)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout beginDynamicOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 785, CFSTR("expected nil value for '%s'"), "mResizeInfoGeometry");
  }
  self->mResizePathSource = (TSDPathSource *)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "copy");
  if (-[TSDLayout isInTopLevelContainerForEditing](self, "isInTopLevelContainerForEditing")
    || objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "widthValid")
    && (objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "heightValid") & 1) != 0)
  {
    v7 = (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  }
  else
  {
    v8 = -[TSDLayout info](self, "info");
    if (v8)
      -[TSDInfo computeFullTransform](v8, "computeFullTransform");
    else
      memset(v9, 0, sizeof(v9));
    v7 = +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", v9);
  }
  self->mInitialInfoGeometry = (TSDInfoGeometry *)v7;
  self->mResizeInfoGeometry = (TSDInfoGeometry *)objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "copy");
}

- (void)endDynamicOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  -[TSDShapeLayout invalidatePath](self, "invalidatePath");
  -[TSDShapeLayout invalidateFrame](self, "invalidateFrame");
  if (!self->mResizeInfoGeometry)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout endDynamicOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 807, CFSTR("invalid nil value for '%s'"), "mResizeInfoGeometry");
  }
  if (!self->mInitialInfoGeometry)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDShapeLayout endDynamicOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDShapeLayout.m"), 808, CFSTR("invalid nil value for '%s'"), "mInitialInfoGeometry");
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDShapeLayout;
  -[TSDLayout endDynamicOperation](&v7, sel_endDynamicOperation);

  self->mResizePathSource = 0;
  self->mResizeInfoGeometry = 0;

  self->mInitialInfoGeometry = 0;
}

- (CGSize)minimumSize
{
  int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource"), "bezierPath"), "isLineSegment");
  v3 = 1.0;
  v4 = 0.0;
  if (!v2)
    v4 = 1.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)initialInfoGeometry
{
  return self->mInitialInfoGeometry;
}

- (BOOL)supportsRotation
{
  return 1;
}

- (BOOL)isBeingManipulated
{
  objc_super v4;

  if (-[TSDShapeLayout isStrokeBeingManipulated](self, "isStrokeBeingManipulated"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSDShapeLayout;
  return -[TSDLayout isBeingManipulated](&v4, sel_isBeingManipulated);
}

- (id)strokeHeadLineEnd
{
  id result;

  result = (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "headLineEnd");
  if (result)
    return (id)objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "strokeLineEnd:", objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "headLineEnd"));
  return result;
}

- (id)strokeTailLineEnd
{
  id result;

  result = (id)objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "tailLineEnd");
  if (result)
    return (id)objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "strokeLineEnd:", objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "tailLineEnd"));
  return result;
}

- (unint64_t)numberOfControlKnobs
{
  -[TSDShapeLayout pathSource](self, "pathSource");
  objc_opt_class();
  return objc_msgSend((id)TSUClassAndProtocolCast(), "numberOfControlKnobs");
}

- (void)setControlKnobPosition:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  -[TSDShapeLayout pathSource](self, "pathSource");
  objc_opt_class();
  objc_msgSend((id)TSUClassAndProtocolCast(), "setControlKnobPosition:toPoint:", a3, x, y);
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  double v4;
  double v5;
  CGPoint result;

  -[TSDShapeLayout pathSource](self, "pathSource");
  objc_opt_class();
  objc_msgSend((id)TSUClassAndProtocolCast(), "getControlKnobPosition:", a3);
  result.y = v5;
  result.x = v4;
  return result;
}

- (id)i_computeWrapPath
{
  TSDFill *v3;
  uint64_t v4;

  v3 = -[TSDShapeLayout fill](self, "fill");
  if (v3)
    v4 = -[TSDFill isClear](v3, "isClear") ^ 1;
  else
    v4 = 0;
  return -[TSDShapeLayout i_computeWrapPathClosed:](self, "i_computeWrapPathClosed:", v4);
}

- (id)i_computeWrapPathClosed:(BOOL)a3
{
  id v5;
  id v6;
  TSDBezierPath *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v14;
  uint64_t v15;
  CGAffineTransform v16;

  v5 = -[TSDShapeLayout stroke](self, "stroke");
  if (!v5 || (v6 = v5, !objc_msgSend(v5, "shouldRender")))
  {
    v7 = +[TSDBezierPath outsideEdgeOfBezierPath:](TSDBezierPath, "outsideEdgeOfBezierPath:", -[TSDShapeLayout path](self, "path"));
    goto LABEL_6;
  }
  objc_opt_class();
  if (TSUDynamicCast())
  {
    -[TSDShapeLayout pathBounds](self, "pathBounds");
    v7 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  v14 = (id)objc_msgSend(-[TSDShapeLayout path](self, "path"), "copy");
  objc_msgSend(v14, "takeAttributesFromStroke:", v6);
  if (a3 || objc_msgSend(v14, "isEffectivelyClosed"))
    v15 = objc_msgSend(v14, "uniteWithBezierPath:", objc_msgSend(v14, "outlineStroke"));
  else
    v15 = objc_msgSend(v14, "outlineStroke");
  v8 = (void *)v15;
  if (-[TSDShapeLayout pathIsOpen](self, "pathIsOpen"))
  {
    v7 = -[TSDShapeLayout p_unitePath:withLineEndForHead:stroke:](self, "p_unitePath:withLineEndForHead:stroke:", -[TSDShapeLayout p_unitePath:withLineEndForHead:stroke:](self, "p_unitePath:withLineEndForHead:stroke:", v8, 1, v6), 0, v6);
    goto LABEL_6;
  }
LABEL_7:
  -[TSDShapeLayout pathBounds](self, "pathBounds");
  v10 = v9;
  v12 = v11;
  if (!TSDNearlyEqualPoints(*MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v9, v11))
  {
    CGAffineTransformMakeTranslation(&v16, -v10, -v12);
    objc_msgSend(v8, "transformUsingAffineTransform:", &v16);
  }
  return v8;
}

- (id)p_cachedPath
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 1) != 0)
  {
    self->mCachedPath = (TSDBezierPath *)(id)objc_msgSend(-[TSDShapeLayout pathSource](self, "pathSource"), "bezierPath");
    *(_WORD *)&self->mShapeInvalidFlags &= ~1u;
  }
  return self->mCachedPath;
}

- (CGRect)p_cachedPathBounds
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;
  CGRect v39;

  if ((*(_WORD *)&self->mShapeInvalidFlags & 2) != 0)
  {
    objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "boundsForPath:", -[TSDShapeLayout path](self, "path"));
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    if (-[TSDShapeLayout pathIsOpen](self, "pathIsOpen")
      && objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "supportsWidth"))
    {
      v29 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v30 = *MEMORY[0x24BDBD8B8];
      v28 = v30;
      v31 = v29;
      v32 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v27 = v32;
      -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 1, &v30);
      v38.origin.x = v11;
      v38.origin.y = v12;
      v38.size.width = v13;
      v38.size.height = v14;
      v33.origin.x = v4;
      v33.origin.y = v6;
      v33.size.width = v8;
      v33.size.height = v10;
      v34 = CGRectUnion(v33, v38);
      x = v34.origin.x;
      y = v34.origin.y;
      width = v34.size.width;
      height = v34.size.height;
      v30 = v28;
      v31 = v29;
      v32 = v27;
      -[TSDShapeLayout p_boundsOfLineEndForHead:transform:](self, "p_boundsOfLineEndForHead:transform:", 0, &v30);
      v39.origin.x = v19;
      v39.origin.y = v20;
      v39.size.width = v21;
      v39.size.height = v22;
      v35.origin.x = x;
      v35.origin.y = y;
      v35.size.width = width;
      v35.size.height = height;
      v36 = CGRectUnion(v35, v39);
      v4 = v36.origin.x;
      v6 = v36.origin.y;
      v8 = v36.size.width;
      v10 = v36.size.height;
    }
    self->mCachedPathBounds.origin.x = v4;
    self->mCachedPathBounds.origin.y = v6;
    self->mCachedPathBounds.size.width = v8;
    self->mCachedPathBounds.size.height = v10;
    *(_WORD *)&self->mShapeInvalidFlags &= ~2u;
  }
  v23 = self->mCachedPathBounds.origin.x;
  v24 = self->mCachedPathBounds.origin.y;
  v25 = self->mCachedPathBounds.size.width;
  v26 = self->mCachedPathBounds.size.height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)p_cachedPathBoundsWithoutStroke
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_WORD *)&self->mShapeInvalidFlags & 4) != 0)
  {
    objc_msgSend(-[TSDShapeLayout path](self, "path"), "bounds");
    self->mCachedPathBoundsWithoutStroke.origin.x = v3;
    self->mCachedPathBoundsWithoutStroke.origin.y = v4;
    self->mCachedPathBoundsWithoutStroke.size.width = v5;
    self->mCachedPathBoundsWithoutStroke.size.height = v6;
    *(_WORD *)&self->mShapeInvalidFlags &= ~4u;
  }
  x = self->mCachedPathBoundsWithoutStroke.origin.x;
  y = self->mCachedPathBoundsWithoutStroke.origin.y;
  width = self->mCachedPathBoundsWithoutStroke.size.width;
  height = self->mCachedPathBoundsWithoutStroke.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)p_cachedPathIsOpen
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 8) != 0)
  {
    self->mCachedPathIsOpen = objc_msgSend(-[TSDShapeLayout path](self, "path"), "isOpen");
    *(_WORD *)&self->mShapeInvalidFlags &= ~8u;
  }
  return self->mCachedPathIsOpen;
}

- (BOOL)p_cachedPathIsLineSegment
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x10) != 0)
  {
    self->mCachedPathIsLineSegment = objc_msgSend(-[TSDShapeLayout path](self, "path"), "isLineSegment");
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x10u;
  }
  return self->mCachedPathIsLineSegment;
}

- (void)p_invalidateHead
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0xC0u;
  -[TSDShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)p_invalidateTail
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x140u;
  -[TSDShapeLayout p_invalidateClippedPath](self, "p_invalidateClippedPath");
}

- (void)p_invalidateClippedPath
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x200u;

  self->mCachedClippedPath = 0;
}

- (void)p_validateHeadAndTail
{
  __int16 mShapeInvalidFlags;

  mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x40) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags = mShapeInvalidFlags & 0xFFBF;
    objc_msgSend(-[TSDShapeLayout path](self, "path"), "getStartPoint:andEndPoint:", &self->mTailPoint, &self->mHeadPoint);
  }
}

- (void)p_validateHeadLineEnd
{
  __int16 mShapeInvalidFlags;

  -[TSDShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x80) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags = mShapeInvalidFlags & 0xFF7F;
    -[TSDShapeLayout p_computeAngle:point:cutSegment:cutT:forLineEndAtHead:](self, "p_computeAngle:point:cutSegment:cutT:forLineEndAtHead:", &self->mHeadLineEndAngle, &self->mHeadLineEndPoint, &self->mHeadCutSegment, &self->mHeadCutT, 1);
  }
}

- (void)p_validateTailLineEnd
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x100) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x100u;
    -[TSDShapeLayout p_computeAngle:point:cutSegment:cutT:forLineEndAtHead:](self, "p_computeAngle:point:cutSegment:cutT:forLineEndAtHead:", &self->mTailLineEndAngle, &self->mTailLineEndPoint, &self->mTailCutSegment, &self->mTailCutT, 0);
  }
}

- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7
{
  _BOOL8 v7;
  int *v13;
  double *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  double MaxY;
  double v20;
  double v21;
  double v22;
  double v23;
  TSDBezierPath *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double *v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  double v37;
  double v39;
  double v40;
  CGFloat v41;
  uint64_t v42;
  id v43;
  CGRect BoundingBox;

  v7 = a7;
  -[TSDShapeLayout p_validateHeadAndTail](self, "p_validateHeadAndTail");
  v13 = &OBJC_IVAR___TSDShapeLayout_mTailPoint;
  if (v7)
    v13 = &OBJC_IVAR___TSDShapeLayout_mHeadPoint;
  v14 = (double *)((char *)self + *v13);
  v16 = *v14;
  v15 = v14[1];
  if (v7)
    v17 = -[TSDShapeLayout strokeHeadLineEnd](self, "strokeHeadLineEnd");
  else
    v17 = -[TSDShapeLayout strokeTailLineEnd](self, "strokeTailLineEnd");
  v18 = v17;
  if (v17 && (objc_msgSend(v17, "isNone") & 1) == 0)
  {
    BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(v18, "path"));
    MaxY = CGRectGetMaxY(BoundingBox);
    objc_msgSend(v18, "endPoint");
    v21 = MaxY - v20;
    if (!objc_msgSend(v18, "isFilled"))
      v21 = v21 + 0.75;
    -[TSDShapeLayout lineEndScale](self, "lineEndScale");
    v23 = v22 * v21;
    v24 = +[TSDBezierPath bezierPathWithOvalInRect:](TSDBezierPath, "bezierPathWithOvalInRect:", v16 - v23, v15 - v23, v23 + v23, v23 + v23);
    v43 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(-[TSDShapeLayout path](self, "path"), "addIntersectionsWithPath:to:allIntersections:reversed:", v24, v43, 0, v7);
    if (objc_msgSend(v43, "count"))
    {
      objc_msgSend(v43, "sortUsingSelector:", sel_compareSegmentAndT_);
      if (v7)
        v25 = (void *)objc_msgSend(v43, "lastObject");
      else
        v25 = (void *)objc_msgSend(v43, "objectAtIndex:", 0);
      v26 = v25;
      objc_msgSend(v25, "point");
      v29 = v28;
      v31 = v30;
    }
    else
    {
      if (v7)
      {
        v26 = 0;
        v27 = 440;
      }
      else
      {
        v26 = 0;
        v27 = 424;
      }
      v32 = (double *)((char *)self + v27);
      v29 = *v32;
      v31 = v32[1];
    }
    v33 = TSDSubtractPoints(v16, v15, v29);
    *a3 = TSDAngleFromDelta(v33, v34) + -1.57079633;
    v35 = TSDSubtractPoints(v29, v31, v16);
    v37 = *MEMORY[0x24BDBEFB0];
    if (v35 != *MEMORY[0x24BDBEFB0] || v36 != *(double *)(MEMORY[0x24BDBEFB0] + 8))
    {
      v39 = TSDNormalizePoint(v35, v36);
      v37 = TSDMultiplyPointScalar(v39, v40, v23);
    }
    a4->x = TSDAddPoints(v16, v15, v37);
    a4->y = v41;
    if (v26)
    {
      *a5 = objc_msgSend(v26, "segment");
      objc_msgSend(v26, "t");
    }
    else
    {
      *a5 = 0;
      v42 = 0;
    }
    *(_QWORD *)a6 = v42;

  }
  else
  {
    *a3 = 1.57079633;
    a4->x = v16;
    a4->y = v15;
    *a5 = -1;
    *a6 = 0.0;
  }
}

- (id)p_createClippedPath
{
  double v3;
  double v4;
  TSDBezierPath *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double x;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int64_t mHeadCutSegment;
  int64_t mTailCutSegment;

  if (!-[TSDShapeLayout pathIsOpen](self, "pathIsOpen"))
    return -[TSDShapeLayout path](self, "path");
  if (!objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "supportsWidth"))
    return -[TSDShapeLayout path](self, "path");
  -[TSDShapeLayout p_validateHeadLineEnd](self, "p_validateHeadLineEnd");
  -[TSDShapeLayout p_validateTailLineEnd](self, "p_validateTailLineEnd");
  if (self->mHeadCutSegment < 0 && self->mTailCutSegment < 0)
    return -[TSDShapeLayout path](self, "path");
  objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "width");
  v4 = v3;
  v5 = objc_alloc_init(TSDBezierPath);
  objc_msgSend(-[TSDShapeLayout stroke](self, "stroke"), "lineEndInsetAdjustment");
  v7 = v6;
  v8 = TSDDeltaFromAngle(self->mTailLineEndAngle + 1.57079633);
  v9 = v4 * v7;
  v11 = TSDMultiplyPointScalar(v8, v10, v9);
  x = self->mTailLineEndPoint.x;
  y = self->mTailLineEndPoint.y;
  v14 = TSDAddPoints(x, y, v11);
  v16 = v15;
  v17 = TSDDeltaFromAngle(self->mHeadLineEndAngle + 1.57079633);
  v19 = TSDMultiplyPointScalar(v17, v18, v9);
  v20 = TSDAddPoints(self->mHeadLineEndPoint.x, self->mHeadLineEndPoint.y, v19);
  v22 = v21;
  mHeadCutSegment = self->mHeadCutSegment;
  mTailCutSegment = self->mTailCutSegment;
  if ((mHeadCutSegment < 0 || mHeadCutSegment >= mTailCutSegment)
    && (mHeadCutSegment != mTailCutSegment || self->mHeadCutT >= self->mTailCutT))
  {
    if (mTailCutSegment < 0)
    {
      -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", x, y);
    }
    else
    {
      -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", v14, v16);
      -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", self->mTailLineEndPoint.x, self->mTailLineEndPoint.y);
    }
    -[TSDBezierPath appendBezierPath:fromSegment:t:toSegment:t:withoutMove:](v5, "appendBezierPath:fromSegment:t:toSegment:t:withoutMove:", -[TSDShapeLayout path](self, "path"), self->mTailCutSegment, self->mHeadCutSegment, 1, self->mTailCutT, self->mHeadCutT);
    if (self->mHeadCutSegment < 0)
      return v5;
  }
  else
  {
    -[TSDBezierPath moveToPoint:](v5, "moveToPoint:", v14, v16);
  }
  -[TSDBezierPath lineToPoint:](v5, "lineToPoint:", v20, v22);
  return v5;
}

- (CGRect)p_boundsOfLineEndForHead:(BOOL)a3 transform:(CGAffineTransform *)a4
{
  _BOOL4 v5;
  double *v7;
  id v8;
  id v9;
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
  id v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  _OWORD v33[3];
  CGRect result;

  v5 = a3;
  v7 = (double *)MEMORY[0x24BDBF070];
  if (a3)
    v8 = -[TSDShapeLayout strokeHeadLineEnd](self, "strokeHeadLineEnd");
  else
    v8 = -[TSDShapeLayout strokeTailLineEnd](self, "strokeTailLineEnd");
  v9 = v8;
  v10 = *v7;
  v11 = v7[1];
  v12 = v7[2];
  v13 = v7[3];
  if (v8 && (objc_msgSend(v8, "isNone") & 1) == 0)
  {
    if (v5)
    {
      -[TSDShapeLayout headLineEndPoint](self, "headLineEndPoint");
      v15 = v14;
      v17 = v16;
      -[TSDShapeLayout headLineEndAngle](self, "headLineEndAngle");
    }
    else
    {
      -[TSDShapeLayout tailLineEndPoint](self, "tailLineEndPoint");
      v15 = v19;
      v17 = v20;
      -[TSDShapeLayout tailLineEndAngle](self, "tailLineEndAngle");
    }
    v21 = v18;
    v22 = -[TSDShapeLayout stroke](self, "stroke");
    -[TSDShapeLayout lineEndScale](self, "lineEndScale");
    v23 = *(_OWORD *)&a4->c;
    v33[0] = *(_OWORD *)&a4->a;
    v33[1] = v23;
    v33[2] = *(_OWORD *)&a4->tx;
    objc_msgSend(v22, "boundsForLineEnd:atPoint:atAngle:withScale:transform:", v9, v33, v15, v17, v21, v24);
    v10 = v25;
    v11 = v26;
    v12 = v27;
    v13 = v28;
  }
  v29 = v10;
  v30 = v11;
  v31 = v12;
  v32 = v13;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (id)p_unitePath:(id)a3 withLineEndForHead:(BOOL)a4 stroke:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v6 = a4;
  if (a4)
    v9 = -[TSDShapeLayout strokeHeadLineEnd](self, "strokeHeadLineEnd");
  else
    v9 = -[TSDShapeLayout strokeTailLineEnd](self, "strokeTailLineEnd");
  v10 = v9;
  if (!v9 || (objc_msgSend(v9, "isNone") & 1) != 0)
    return a3;
  if (v6)
  {
    -[TSDShapeLayout headLineEndPoint](self, "headLineEndPoint");
    v13 = v12;
    v15 = v14;
    -[TSDShapeLayout headLineEndAngle](self, "headLineEndAngle");
  }
  else
  {
    -[TSDShapeLayout tailLineEndPoint](self, "tailLineEndPoint");
    v13 = v17;
    v15 = v18;
    -[TSDShapeLayout tailLineEndAngle](self, "tailLineEndAngle");
  }
  v19 = v16;
  -[TSDShapeLayout lineEndScale](self, "lineEndScale");
  return (id)objc_msgSend(a3, "uniteWithBezierPath:", objc_msgSend(a5, "pathForLineEnd:wrapPath:atPoint:atAngle:withScale:", v10, 1, v13, v15, v19, v20));
}

- (void)p_updateResizeInfoGeometryFromResizePathSource
{
  TSDPathSource *mResizePathSource;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  TSDInfoGeometry *v12;

  mResizePathSource = self->mResizePathSource;
  objc_msgSend(-[TSDPathSource bezierPath](mResizePathSource, "bezierPath"), "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = self->mResizeInfoGeometry;
  self->mResizeInfoGeometry = -[TSDInfoGeometry geometryWithNewBounds:](self->mResizeInfoGeometry, "geometryWithNewBounds:", v5, v7, v9, v11);
  -[TSDPathSource alignToOrigin](mResizePathSource, "alignToOrigin");
}

- (TSDFill)dynamicFill
{
  return self->mDynamicFill;
}

- (void)setDynamicFill:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

@end
