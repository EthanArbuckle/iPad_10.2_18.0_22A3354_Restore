@implementation CRLCanvasAlignmentGuide

- (CRLCanvasAlignmentGuide)init
{
  CRLCanvasAlignmentGuide *v2;
  CRLCanvasAlignmentGuide *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLCanvasAlignmentGuide;
  v2 = -[CRLCanvasAbstractGuide init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[CRLCanvasAlignmentGuide setSnapsToMid:](v2, "setSnapsToMid:", 1);
    -[CRLCanvasAlignmentGuide setSnapsToMin:](v3, "setSnapsToMin:", 1);
    -[CRLCanvasAlignmentGuide setSnapsToMax:](v3, "setSnapsToMax:", 1);
  }
  return v3;
}

- (CRLCanvasAlignmentGuide)initWithGeneratingObjectUnscaledRect:(CGRect)a3 edge:(int)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLCanvasAlignmentGuide *v9;
  CRLCanvasAlignmentGuide *v10;
  double MaxX;
  double MinX;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[CRLCanvasAlignmentGuide init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->mGeneratingObjectUnscaledRect.origin.x = x;
    v9->mGeneratingObjectUnscaledRect.origin.y = y;
    v9->mGeneratingObjectUnscaledRect.size.width = width;
    v9->mGeneratingObjectUnscaledRect.size.height = height;
    if (a4 > 2)
    {
      -[CRLCanvasAlignmentGuide setGuideType:](v9, "setGuideType:", 0);
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      -[CRLCanvasAlignmentGuide setStart:](v10, "setStart:", CGRectGetMinX(v16));
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      MaxX = CGRectGetMaxX(v17);
    }
    else
    {
      -[CRLCanvasAlignmentGuide setGuideType:](v9, "setGuideType:", 1);
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      -[CRLCanvasAlignmentGuide setStart:](v10, "setStart:", CGRectGetMinY(v14));
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MaxX = CGRectGetMaxY(v15);
    }
    -[CRLCanvasAlignmentGuide setEnd:](v10, "setEnd:", MaxX);
    switch(a4)
    {
      case 0:
        v18.origin.x = x;
        v18.origin.y = y;
        v18.size.width = width;
        v18.size.height = height;
        MinX = CGRectGetMinX(v18);
        goto LABEL_12;
      case 1:
        v19.origin.x = x;
        v19.origin.y = y;
        v19.size.width = width;
        v19.size.height = height;
        MinX = CGRectGetMidX(v19);
        goto LABEL_12;
      case 2:
        v20.origin.x = x;
        v20.origin.y = y;
        v20.size.width = width;
        v20.size.height = height;
        MinX = CGRectGetMaxX(v20);
        goto LABEL_12;
      case 3:
        v21.origin.x = x;
        v21.origin.y = y;
        v21.size.width = width;
        v21.size.height = height;
        MinX = CGRectGetMinY(v21);
        goto LABEL_12;
      case 4:
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        MinX = CGRectGetMidY(v22);
        goto LABEL_12;
      case 5:
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        MinX = CGRectGetMaxY(v23);
LABEL_12:
        -[CRLCanvasAlignmentGuide setOffset:](v10, "setOffset:", MinX);
        break;
      default:
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("+[CRLCanvasAlignmentGuide dynamicGuideForRect: edge:] given invalid edge argument."));
        break;
    }
  }
  return v10;
}

- (CRLCanvasAlignmentGuide)initWithType:(int64_t)a3 offset:(double)a4
{
  CRLCanvasAlignmentGuide *v6;
  CRLCanvasAlignmentGuide *v7;
  CGSize size;

  v6 = -[CRLCanvasAlignmentGuide init](self, "init");
  v7 = v6;
  if (v6)
  {
    size = CGRectNull.size;
    v6->mGeneratingObjectUnscaledRect.origin = CGRectNull.origin;
    v6->mGeneratingObjectUnscaledRect.size = size;
    -[CRLCanvasAlignmentGuide setGuideType:](v6, "setGuideType:", a3);
    -[CRLCanvasAlignmentGuide setOffset:](v7, "setOffset:", a4);
    -[CRLCanvasAlignmentGuide setInfinite:](v7, "setInfinite:", 1);
  }
  return v7;
}

- (BOOL)canBeSnappedToByEdge:(int)a3 ofFrame:(CGRect)a4 inVisibleUnscaledRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  BOOL result;
  unsigned int v12;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (+[CRLCanvasGuideController shouldSnapToOffscreenContent](CRLCanvasGuideController, "shouldSnapToOffscreenContent", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))
  {
    if (a3 > 5)
      return 0;
    return *((_BYTE *)&self->super.super.isa + *(&off_101239938)[a3]) != 0;
  }
  v12 = -[CRLCanvasAlignmentGuide isAssociatedContentVisibleInUnscaledRect:](self, "isAssociatedContentVisibleInUnscaledRect:", x, y, width, height);
  result = 0;
  if (v12 && a3 < 6)
    return *((_BYTE *)&self->super.super.isa + *(&off_101239938)[a3]) != 0;
  return result;
}

- (BOOL)isAssociatedContentVisibleInUnscaledRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.origin.x = CGRectNull.origin.x;
  v12.origin.y = CGRectNull.origin.y;
  v12.size.width = CGRectNull.size.width;
  v12.size.height = CGRectNull.size.height;
  if (CGRectEqualToRect(a3, v12))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012398B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC6C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012398D8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAlignmentGuide isAssociatedContentVisibleInUnscaledRect:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAlignmentGuide.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 105, 0, "isAssociatedContentVisibleInUnscaledRect isn't expecting a null rect ");

  }
  return sub_100060F38(self->mGeneratingObjectUnscaledRect.origin.x, self->mGeneratingObjectUnscaledRect.origin.y, self->mGeneratingObjectUnscaledRect.size.width, self->mGeneratingObjectUnscaledRect.size.height, x, y, width, height);
}

- (void)setStart:(double)a3
{
  if (self->mStart != a3)
  {
    self->mStart = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (void)setEnd:(double)a3
{
  if (self->mEnd != a3)
  {
    self->mEnd = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (void)setOffset:(double)a3
{
  if (self->super.mOffset != a3)
  {
    self->super.mOffset = a3;
    self->super.mLocationInvalidated = 1;
  }
}

- (double)distanceToPoint:(CGPoint)a3
{
  double y;
  double x;
  int64_t v6;
  double v7;
  double v8;

  y = a3.y;
  x = a3.x;
  v6 = -[CRLCanvasAlignmentGuide guideType](self, "guideType");
  -[CRLCanvasAbstractGuide offset](self, "offset");
  if (v6)
    v8 = x;
  else
    v8 = y;
  return vabdd_f64(v7, v8);
}

- (id)renderableWithICC:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  CRLCanvasRenderable *v13;
  CRLCanvasRenderable *mRenderable;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t v20;
  CGRect *p_mSnappingObjectFrame;
  BOOL IsNull;
  double mStart;
  double mEnd;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CRLCanvasRenderable *v32;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v4 = a3;
  objc_msgSend(v4, "viewScale");
  v6 = v5;
  -[CRLCanvasAlignmentGuide start](self, "start");
  v8 = v7;
  -[CRLCanvasAlignmentGuide end](self, "end");
  if (v8 == v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012398F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DFC748();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101239918);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasAlignmentGuide renderableWithICC:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasAlignmentGuide.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 151, 0, "Cannot render a guide where start == end");

  }
  if (self->mRenderable)
  {
    if (!self->super.mLocationInvalidated)
      goto LABEL_30;
  }
  else
  {
    v13 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    mRenderable = self->mRenderable;
    self->mRenderable = v13;

    -[CRLCanvasRenderable setEdgeAntialiasingMask:](self->mRenderable, "setEdgeAntialiasingMask:", 0);
    -[CRLCanvasRenderable setBackgroundColor:](self->mRenderable, "setBackgroundColor:", -[CRLCanvasAbstractGuide guideColor](self, "guideColor"));
    self->super.mLocationInvalidated = 1;
  }
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  if (self->mInfinite)
  {
    objc_msgSend(v4, "visibleScaledRectForCanvasUI");
    if (self->mType == 1)
    {
      self->mStart = v16 / v6;
      v19 = v16 + v18;
    }
    else
    {
      self->mStart = v15 / v6;
      v19 = v15 + v17;
    }
    self->mEnd = v19 / v6;
  }
  v20 = -[CRLCanvasAlignmentGuide guideType](self, "guideType");
  p_mSnappingObjectFrame = &self->super.mSnappingObjectFrame;
  IsNull = CGRectIsNull(self->super.mSnappingObjectFrame);
  mStart = self->mStart;
  if (v20 == 1)
  {
    if (IsNull)
    {
      mEnd = self->mEnd;
    }
    else
    {
      v34.origin.x = p_mSnappingObjectFrame->origin.x;
      v34.origin.y = self->super.mSnappingObjectFrame.origin.y;
      v34.size.width = self->super.mSnappingObjectFrame.size.width;
      v34.size.height = self->super.mSnappingObjectFrame.size.height;
      mStart = fmin(mStart, CGRectGetMinY(v34));
      v35.origin.x = p_mSnappingObjectFrame->origin.x;
      v35.origin.y = self->super.mSnappingObjectFrame.origin.y;
      v35.size.width = self->super.mSnappingObjectFrame.size.width;
      v35.size.height = self->super.mSnappingObjectFrame.size.height;
      mEnd = fmax(self->mEnd, CGRectGetMaxY(v35));
    }
    -[CRLCanvasAbstractGuide offset](self, "offset");
    v27 = sub_1003C65A0(v6 * v26);
    v28 = v6 * mStart;
    v29 = v6 * (mEnd - mStart);
    v30 = 1.0;
  }
  else
  {
    if (IsNull)
    {
      v25 = self->mEnd;
    }
    else
    {
      v36.origin.x = p_mSnappingObjectFrame->origin.x;
      v36.origin.y = self->super.mSnappingObjectFrame.origin.y;
      v36.size.width = self->super.mSnappingObjectFrame.size.width;
      v36.size.height = self->super.mSnappingObjectFrame.size.height;
      mStart = fmin(mStart, CGRectGetMinX(v36));
      v37.origin.x = p_mSnappingObjectFrame->origin.x;
      v37.origin.y = self->super.mSnappingObjectFrame.origin.y;
      v37.size.width = self->super.mSnappingObjectFrame.size.width;
      v37.size.height = self->super.mSnappingObjectFrame.size.height;
      v25 = fmax(self->mEnd, CGRectGetMaxX(v37));
    }
    v27 = v6 * mStart;
    -[CRLCanvasAbstractGuide offset](self, "offset");
    v28 = sub_1003C65A0(v6 * v31);
    v30 = v6 * (v25 - mStart);
    v29 = 1.0;
  }
  -[CRLCanvasRenderable setFrame:](self->mRenderable, "setFrame:", v27, v28, v30, v29);
  self->super.mLocationInvalidated = 0;
  +[CATransaction commit](CATransaction, "commit");
LABEL_30:
  v32 = self->mRenderable;

  return v32;
}

- (CRLCanvasRenderable)renderable
{
  return self->mRenderable;
}

- (void)setRenderable:(id)a3
{
  objc_storeStrong((id *)&self->mRenderable, a3);
}

- (double)start
{
  return self->mStart;
}

- (double)end
{
  return self->mEnd;
}

- (int64_t)guideType
{
  return self->mType;
}

- (void)setGuideType:(int64_t)a3
{
  self->mType = a3;
}

- (BOOL)infinite
{
  return self->mInfinite;
}

- (void)setInfinite:(BOOL)a3
{
  self->mInfinite = a3;
}

- (BOOL)snapsToMin
{
  return self->mSnapsToMin;
}

- (void)setSnapsToMin:(BOOL)a3
{
  self->mSnapsToMin = a3;
}

- (BOOL)snapsToMid
{
  return self->mSnapsToMid;
}

- (void)setSnapsToMid:(BOOL)a3
{
  self->mSnapsToMid = a3;
}

- (BOOL)snapsToMax
{
  return self->mSnapsToMax;
}

- (void)setSnapsToMax:(BOOL)a3
{
  self->mSnapsToMax = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mRenderable, 0);
}

@end
