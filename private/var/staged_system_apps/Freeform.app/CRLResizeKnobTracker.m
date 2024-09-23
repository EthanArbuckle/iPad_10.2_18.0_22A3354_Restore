@implementation CRLResizeKnobTracker

- (CRLResizeKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  CRLResizeKnobTracker *v8;
  CRLResizeKnobTracker *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGSize size;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CRLResizeKnobTracker;
  v8 = -[CRLCanvasKnobTracker initWithRep:knob:](&v36, "initWithRep:knob:", v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->mSnapEnabled = 1;
    -[CRLResizeKnobTracker p_repTransformInRootForTransforming](v8, "p_repTransformInRootForTransforming");
    *(_OWORD *)&v9->mOriginalTransformInRoot.c = v34;
    *(_OWORD *)&v9->mOriginalTransformInRoot.tx = v35;
    *(_OWORD *)&v9->mOriginalTransformInRoot.a = v33;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
    objc_msgSend(v10, "boundsForStandardKnobs");
    v9->mLastNewBounds.origin.x = v11;
    v9->mLastNewBounds.origin.y = v12;
    v9->mLastNewBounds.size.width = v13;
    v9->mLastNewBounds.size.height = v14;
    size = v9->mLastNewBounds.size;
    v9->mBaseBounds.origin = v9->mLastNewBounds.origin;
    v9->mBaseBounds.size = size;

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "infoForTransforming"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "interactiveCanvasController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layoutForInfo:", v17));

      objc_msgSend(v20, "minimumSizeForResizingKnob:", v7);
      -[CRLResizeKnobTracker setMinimumSize:](v9, "setMinimumSize:");

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v9, "rep"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layout"));

    *(_QWORD *)&v24 = objc_opt_class(CRLCanvasLayout, v23).n128_u64[0];
    v26 = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parent", v24));
    v28 = sub_100221D0C(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    if (v29)
    {
      objc_msgSend(v29, "maximumFrameSizeForChild:", v22);
    }
    else
    {
      v30 = INFINITY;
      v31 = INFINITY;
    }
    -[CRLResizeKnobTracker setMaximumSize:](v9, "setMaximumSize:", v30, v31);
    -[CRLResizeKnobTracker setCanMoveKnobAcrossOpposite:](v9, "setCanMoveKnobAcrossOpposite:", objc_msgSend(v6, "canFlipDuringResize"));
    -[CRLResizeKnobTracker setSnapToGuides:](v9, "setSnapToGuides:", 1);
    v9->mAdjustedMagnetsForHorizontalFlip = 0;
    v9->mAdjustedMagnetsForVerticalFlip = 0;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLResizeKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
  -[CRLCanvasRenderable setDelegate:](self->mGuideRenderable, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLResizeKnobTracker;
  -[CRLCanvasKnobTracker dealloc](&v3, "dealloc");
}

- (CGRect)currentBoundsForStandardKnobs
{
  CGRect *p_mLastNewBounds;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  p_mLastNewBounds = &self->mLastNewBounds;
  x = self->mLastNewBounds.origin.x;
  y = self->mLastNewBounds.origin.y;
  width = self->mLastNewBounds.size.width;
  height = self->mLastNewBounds.size.height;
  if (-[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter"))
    x = self->mBaseBounds.origin.x + self->mBaseBounds.size.width * 0.5 - p_mLastNewBounds->size.width * 0.5;
  if (-[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter"))
    y = self->mBaseBounds.origin.y + self->mBaseBounds.size.height * 0.5 - p_mLastNewBounds->size.height * 0.5;
  v8 = x;
  v9 = y;
  v10 = width;
  v11 = height;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGAffineTransform)transformInRootForStandardKnobs
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[5].b;
  return self;
}

- (CGSize)currentSizeForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CGSize size;
  int8x16_t v11;
  int8x16_t v12;
  float64_t v18;
  float64x2_t v19;
  double v20;
  float64_t v21;
  double v22;
  double v23;
  double v24;
  float64x2_t v25;
  float64x2_t v26;
  CGSize result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoForTransforming"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));

  if (objc_msgSend(v7, "widthValid") && (objc_msgSend(v7, "heightValid") & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));

    if (v9 == v4)
    {
      v26.f64[0] = fabs(self->mLastNewBounds.size.width);
      v20 = fabs(self->mLastNewBounds.size.height);
    }
    else
    {
      size = self->mBaseBounds.size;
      v11 = (int8x16_t)vceqzq_f64((float64x2_t)size);
      v12 = (int8x16_t)vdivq_f64(vabsq_f64((float64x2_t)self->mLastNewBounds.size), (float64x2_t)size);
      __asm { FMOV            V1.2D, #1.0 }
      v25 = (float64x2_t)vbslq_s8(v11, _Q1, v12);
      objc_msgSend(v4, "initialBoundsForStandardKnobs");
      v19.f64[1] = v18;
      v26 = vabsq_f64(vmulq_f64(v25, v19));
      v20 = v26.f64[1];
    }
  }
  else
  {
    objc_msgSend(v4, "boundsForStandardKnobs");
    v26.f64[0] = v21;
    v20 = v22;
  }

  v23 = v26.f64[0];
  v24 = v20;
  result.height = v24;
  result.width = v23;
  return result;
}

- (BOOL)hasHorizontalFlip
{
  return self->mLastNewBounds.size.width < 0.0;
}

- (BOOL)hasVerticalFlip
{
  return self->mLastNewBounds.size.height < 0.0;
}

- (BOOL)allowHUDToDisplay
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLResizeKnobTracker;
  return -[CRLCanvasKnobTracker allowHUDToDisplay](&v3, "allowHUDToDisplay");
}

- (BOOL)shouldHideOtherKnobs
{
  objc_super v4;

  if (-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLResizeKnobTracker;
  return -[CRLCanvasKnobTracker shouldHideOtherKnobs](&v4, "shouldHideOtherKnobs");
}

- (id)repsToTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "additionalRepsToResize"));

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "unionSet:", v6);

  return v4;
}

- (CGAffineTransform)resizeTransform
{
  return -[CRLResizeKnobTracker p_resizeTransformHandlingFlipping:](self, "p_resizeTransformHandlingFlipping:", 1);
}

- (CGAffineTransform)resizeTransformWithoutUnflipping
{
  return -[CRLResizeKnobTracker p_resizeTransformHandlingFlipping:](self, "p_resizeTransformHandlingFlipping:", 0);
}

- (CGAffineTransform)p_resizeTransformHandlingFlipping:(SEL)a3
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  double v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
  double width;
  double v15;
  double v16;
  double height;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  CGAffineTransform *result;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v37;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v9 = objc_msgSend(v7, "adjustedKnobForComputingResizeGeometry:", objc_msgSend(v8, "tag"));

  if (-[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter"))
    v9 = (id)(3 * (((unint64_t)v9 - 1) / 3) + 2);
  if (-[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter"))
    v9 = (id)((((unint64_t)v9 - 1) % 3) | 4);
  v10 = dbl_100EF0518[((unint64_t)v9 - 1) % 3];
  v11 = dbl_100EF0518[((unint64_t)v9 - 1) / 3];
  v12 = -[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip");
  v13 = -[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip");
  width = self->mBaseBounds.size.width;
  v15 = 1.0;
  v16 = 1.0;
  if (width != 0.0)
    v16 = self->mLastNewBounds.size.width / width;
  height = self->mBaseBounds.size.height;
  if (height != 0.0)
    v15 = self->mLastNewBounds.size.height / height;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransformMakeTranslation(&t1, -v10, -v11);
  CGAffineTransformMakeScale(&t2, v16, v15);
  CGAffineTransformConcat(&v37, &t1, &t2);
  CGAffineTransformMakeTranslation(&v34, v10, v11);
  CGAffineTransformConcat(retstr, &v37, &v34);
  if (v4)
  {
    if (v12)
    {
      v32 = *(CGAffineTransform *)byte_100EF04B8;
      v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v31.c = v18;
      *(_OWORD *)&v31.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v33, &v32, &v31);
      v19 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v19;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v33.tx;
    }
    if (v13)
    {
      v32 = *(CGAffineTransform *)byte_100EF04E8;
      v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v31.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v31.c = v20;
      *(_OWORD *)&v31.tx = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v33, &v32, &v31);
      v21 = *(_OWORD *)&v33.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v33.a;
      *(_OWORD *)&retstr->c = v21;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v33.tx;
    }
  }
  memset(&v33, 0, sizeof(v33));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layout"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "originalPureGeometry"));
  v25 = v24;
  if (v24)
    objc_msgSend(v24, "fullTransform");
  else
    memset(&v33, 0, sizeof(v33));

  v32 = v33;
  CGAffineTransformInvert(&v29, &v32);
  v26 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v32.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformConcat(&v30, &v29, &v32);
  v31 = v33;
  result = CGAffineTransformConcat(&v32, &v30, &v31);
  v28 = *(_OWORD *)&v32.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v32.a;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v32.tx;
  return result;
}

- (CGAffineTransform)flippedIfNecessaryTransformForLayout:(SEL)a3
{
  return -[CRLResizeKnobTracker p_transformForLayout:flippedIfNecessary:](self, "p_transformForLayout:flippedIfNecessary:", a4, 1);
}

- (CGAffineTransform)transformForLayout:(SEL)a3
{
  return -[CRLResizeKnobTracker p_transformForLayout:flippedIfNecessary:](self, "p_transformForLayout:flippedIfNecessary:", a4, 0);
}

- (CGAffineTransform)p_transformForLayout:(SEL)a3 flippedIfNecessary:(id)a4
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  __int128 v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  CGAffineTransform *result;
  CGAffineTransform v41;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v44;
  CGAffineTransform v45;

  v5 = a5;
  v8 = a4;
  if (objc_msgSend(v8, "wantsParentResizeTransform"))
  {
    *(_QWORD *)&v10 = objc_opt_class(CRLCanvasLayout, v9).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent", v10));
    v14 = sub_100221D0C(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15)
    {
      -[CRLResizeKnobTracker p_transformForLayout:flippedIfNecessary:](self, "p_transformForLayout:flippedIfNecessary:", v15, v5);

      goto LABEL_28;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261AA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A190();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261AC0);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_transformForLayout:flippedIfNecessary:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 310, 0, "invalid nil value for '%{public}s'", "possibleParentLayout");

  }
  memset(&v45, 0, sizeof(v45));
  if (v5)
    -[CRLResizeKnobTracker resizeTransformWithoutUnflipping](self, "resizeTransformWithoutUnflipping");
  else
    -[CRLResizeKnobTracker resizeTransform](self, "resizeTransform");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "layout"));

  if (v20 == v8)
  {
    v39 = *(_OWORD *)&v45.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v45.a;
    *(_OWORD *)&retstr->c = v39;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v45.tx;
  }
  else
  {
    v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v44.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v44.c = v22;
    *(_OWORD *)&v44.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_QWORD *)&v23 = objc_opt_class(CRLCanvasLayout, v21).n128_u64[0];
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parent", v23));
    v27 = sub_100221D0C(v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    if (v28 && objc_msgSend(v28, "isBeingManipulated"))
    {
      do
      {
        if (!objc_msgSend(v28, "isBeingManipulated"))
          break;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "originalPureGeometry"));
        v30 = v29;
        if (v29)
          objc_msgSend(v29, "transform");
        else
          memset(&t2, 0, sizeof(t2));
        t1 = v44;
        CGAffineTransformConcat(&v44, &t1, &t2);

        *(_QWORD *)&v32 = objc_opt_class(CRLCanvasLayout, v31).n128_u64[0];
        v34 = v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "parent", v32));
        v36 = sub_100221D0C(v34, v35);
        v37 = objc_claimAutoreleasedReturnValue(v36);

        v28 = (void *)v37;
      }
      while (v37);
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
      t1 = v45;
      v41 = v44;
      sub_100079650(&t1, &v41, retstr);
      retstr->tx = 0.0;
      retstr->ty = 0.0;
    }
    else
    {
      v38 = *(_OWORD *)&v45.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v45.a;
      *(_OWORD *)&retstr->c = v38;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v45.tx;
    }

  }
LABEL_28:

  return result;
}

- (id)currentGeometryForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v43;
  _BYTE v44[48];
  CGAffineTransform v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "computeInfoGeometryDuringResize"));
  v6 = v5;
  if (!v5)
  {
    memset(&v45, 0, sizeof(v45));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
    -[CRLResizeKnobTracker resizeTransform](self, "resizeTransform");
    if (v9)
      objc_msgSend(v9, "layoutTransformInInfoSpace:", v44);
    else
      memset(&v45, 0, sizeof(v45));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));

    if (v11 == v4)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v43 = v45;
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "resizedGeometryForTransform:", &v43));
LABEL_21:
      v7 = (id)v34;
      goto LABEL_22;
    }
    v13 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v43.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v43.c = v13;
    *(_OWORD *)&v43.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    *(_QWORD *)&v14 = objc_opt_class(CRLCanvasLayout, v12).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent", v14));
    v18 = sub_100221D0C(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (!v19 || !objc_msgSend(v19, "isBeingManipulated"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interactiveCanvasController"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "repForLayout:", v4));

      -[CRLResizeKnobTracker transformForLayout:](self, "transformForLayout:", v4);
      v45 = t1;
      v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "resizedGeometryForTransform:", &t1));

LABEL_22:
      goto LABEL_23;
    }
    do
    {
      if (!objc_msgSend(v19, "isBeingManipulated"))
        break;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originalPureGeometry"));
      v21 = v20;
      if (v20)
        objc_msgSend(v20, "transform");
      else
        memset(&t2, 0, sizeof(t2));
      t1 = v43;
      CGAffineTransformConcat(&v43, &t1, &t2);

      *(_QWORD *)&v23 = objc_opt_class(CRLCanvasLayout, v22).n128_u64[0];
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parent", v23));
      v27 = sub_100221D0C(v25, v26);
      v28 = objc_claimAutoreleasedReturnValue(v27);

      v19 = (void *)v28;
    }
    while (v28);
    memset(&t1, 0, sizeof(t1));
    v40 = v45;
    v39 = v43;
    sub_100079650(&v40, &v39, &t1);
    t1.tx = 0.0;
    t1.ty = 0.0;
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoGeometryBeforeDynamicOperation"));
    if (v29)
    {
      v30 = (void *)v29;
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "geometry"));

      if (!v30)
      {
        memset(&v37, 0, sizeof(v37));
        goto LABEL_20;
      }
    }
    objc_msgSend(v30, "fullTransform");

LABEL_20:
    v40 = t1;
    CGAffineTransformConcat(&v38, &v37, &v40);
    v34 = objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", &v38));
    goto LABEL_21;
  }
  v7 = v5;
LABEL_23:

  return v7;
}

- (id)resizingLayoutForRep:(id)a3
{
  return self->mResizingLayout;
}

- (BOOL)canCenterResize
{
  return 1;
}

- (NSArray)decoratorOverlayRenderables
{
  void *v2;
  CRLCanvasRenderable *mGuideRenderable;

  if (self->mGuideRenderable)
  {
    mGuideRenderable = self->mGuideRenderable;
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &mGuideRenderable, 1));
  }
  else
  {
    v2 = &__NSArray0__struct;
  }
  return (NSArray *)v2;
}

- (void)applyNewBoundsToRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCanvasCommandSelectionBehavior *v20;
  void *v21;
  CRLCanvasCommandSelectionBehavior *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "finalInfoGeometryForResize"));

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker currentGeometryForLayout:](self, "currentGeometryForLayout:", v10));

  }
  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infoForTransforming"));
  v12 = (void *)v11;
  v13 = self->mIsEnqueueingCommandsInRealTime || v11 == 0;
  if (!v13
    && -[CRLCanvasKnobTracker didDrag](self, "didDrag")
    && (objc_msgSend(v12, "conformsToProtocol:", &OBJC_PROTOCOL___CRLResizingAwareInfo) & 1) == 0)
  {
    v14 = objc_msgSend(v4, "newCommandToApplyGeometry:toInfo:", v9, v12);
    if (!v14)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261AE0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3A224();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261B00);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker applyNewBoundsToRep:]"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 439, 0, "invalid nil value for '%{public}s'", "cmd");

      v14 = 0;
    }
    v22 = [CRLCanvasCommandSelectionBehavior alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionPath"));
    v20 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:selectionPath:selectionFlags:](v22, "initWithCanvasEditor:type:selectionPath:selectionFlags:", v21, 2, v19, 4);

    objc_msgSend(v7, "enqueueCommand:withSelectionBehavior:", v14, v20);
  }
  objc_msgSend(v4, "dynamicResizeDidEndWithTracker:", self);
  objc_msgSend(v4, "invalidateKnobs");

}

- (void)applyNewBoundsToPrimaryRep
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  if (-[CRLCanvasKnobTracker didDrag](self, "didDrag")
    && !-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
  {
    objc_msgSend(v5, "openGroup");
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = -[CRLCanvasKnobTracker didDrag](self, "didDrag");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionStringForResize"));
    objc_msgSend(v5, "setCurrentGroupActionString:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    -[CRLResizeKnobTracker applyNewBoundsToRep:](self, "applyNewBoundsToRep:", v11);
  }
  else
  {
    objc_msgSend(v8, "dynamicResizeDidEndWithTracker:", self);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v11, "invalidateKnobs");
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandsForAdjustingMagnetsFromClineLayouts"));

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(v5, "enqueueCommand:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v17);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", 0));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "layout"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "connectedLayouts"));

  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v27, "setHeadHasHorizontalFlip:", 0);
        objc_msgSend(v27, "setHeadHasVerticalFlip:", 0);
        objc_msgSend(v27, "setTailHasHorizontalFlip:", 0);
        objc_msgSend(v27, "setTailHasVerticalFlip:", 0);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v24);
  }

  self->mAdjustedMagnetsForHorizontalFlip = 0;
  self->mAdjustedMagnetsForVerticalFlip = 0;
  if (v6)
    objc_msgSend(v5, "closeGroup");
  if (self->mIsEnqueueingCommandsInRealTime)
    objc_msgSend(v5, "closeGroup");

}

- (NSString)hudLabelText
{
  return (NSString *)-[CRLResizeKnobTracker p_getHudLabelTextForAccessibility:](self, "p_getHudLabelTextForAccessibility:", 0);
}

- (NSString)crlaxHudLabelText
{
  return (NSString *)-[CRLResizeKnobTracker p_getHudLabelTextForAccessibility:](self, "p_getHudLabelTextForAccessibility:", 1);
}

- (id)p_getHudLabelTextForAccessibility:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  -[CRLResizeKnobTracker currentSizeForLayout:](self, "currentSizeForLayout:", v6);
  v8 = v7;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unitStringForNumber:", v8));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactiveCanvasController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "unitStringForNumber:", v10));
  if (!objc_msgSend(v13, "isEqualToString:", v16))
  {

LABEL_6:
    goto LABEL_7;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  objc_opt_class(CRLShapeRep, v18);
  isKindOfClass = objc_opt_isKindOfClass(v17, v19);

  if ((isKindOfClass & 1) != 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "shapeInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "pathSource"));

    if (objc_msgSend(v11, "isRectangular"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v23;
      v25 = CFSTR("Square: %@");
LABEL_11:
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v25, 0, 0));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "interactiveCanvasController"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "unitStringForNumber:", v8));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v31));

      goto LABEL_8;
    }
    if (objc_msgSend(v11, "isCircular"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = v23;
      v25 = CFSTR("Circle: %@");
      goto LABEL_11;
    }
    goto LABEL_6;
  }
LABEL_7:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "unitStringForSize:forAccessibility:", v3, v8, v10));
LABEL_8:

  return v26;
}

- (BOOL)shouldHideSelectionHighlight
{
  return !-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");
}

- (BOOL)isMinimumSizeFixed
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc", a3));
  if ((objc_msgSend(v6, "shouldSupportedDynamicOperationsEnqueueCommandsInRealTime") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v5 = objc_msgSend(v4, "allowsSupportedDynamicOperationsToBeRealTime");

    if (v5)
      self->mIsEnqueueingCommandsInRealTime = 1;
  }
  else
  {

  }
}

- (void)changeDynamicLayoutsForReps:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  -[CRLCanvasKnobTracker i_resetCurrentPositionToKnobPositionIfAppropriate](self, "i_resetCurrentPositionToKnobPositionIfAppropriate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = objc_msgSend(v5, "isBeingResized");

  if ((v6 & 1) == 0)
    -[CRLResizeKnobTracker p_beginDynamicResize](self, "p_beginDynamicResize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));

  if (self->mIsEnqueueingCommandsInRealTime)
    objc_msgSend(v8, "openGroup");
  if (-[CRLCanvasKnobTracker didDrag](self, "didDrag"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v9, "dynamicallyResizingWithTracker:", self);

  }
  v10.receiver = self;
  v10.super_class = (Class)CRLResizeKnobTracker;
  -[CRLCanvasKnobTracker changeDynamicLayoutsForReps:](&v10, "changeDynamicLayoutsForReps:", v4);
  if (self->mIsEnqueueingCommandsInRealTime)
    objc_msgSend(v8, "closeGroup");

}

- (BOOL)traceIfDesiredForBeginOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101261B20);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "begin resize knob operation", v4, 2u);
  }
  return 1;
}

- (BOOL)traceIfDesiredForEndOperation
{
  NSObject *v2;
  uint8_t v4[16];

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_101261B40);
  v2 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "end resize knob operation", v4, 2u);
  }
  return 1;
}

- (void)beginMovingKnob
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  CRLCanvasHUDController *v19;
  CRLCanvasHUDController *mSecondHUDController;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  float64x2_t v52;
  double v53;
  float64x2_t v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD block[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v68.receiver = self;
  v68.super_class = (Class)CRLResizeKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v68, "beginMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));
  objc_msgSend((id)v5, "hideEditMenu");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  LOBYTE(v5) = objc_msgSend(v6, "isBeingResized");

  if ((v5 & 1) == 0)
    -[CRLResizeKnobTracker p_beginDynamicResize](self, "p_beginDynamicResize");
  if (!-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionModelTranslator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", v9));

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v65 != v14)
            objc_enumerationMutation(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i)));
          if (v16)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));

            if (v16 != v17)
              objc_msgSend(v16, "fadeKnobsOut");
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v13);
    }

    -[CRLResizeKnobTracker p_updateGuideRenderable](self, "p_updateGuideRenderable");
    -[CRLResizeKnobTracker p_updateHUD](self, "p_updateHUD");
    objc_msgSend(v3, "addDecorator:", self);
    self->mNeedsHUD = 1;
    v18 = dispatch_time(0, (uint64_t)(0.5 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004967C4;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, block);

  }
  v19 = objc_alloc_init(CRLCanvasHUDController);
  mSecondHUDController = self->mSecondHUDController;
  self->mSecondHUDController = v19;

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layout"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "connectedLayouts"));

  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v60 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v28, "headMagnetType") == (id)6)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedTo"));

          if (v29)
          {
            objc_msgSend(v28, "headMagnetCanvasPosition");
            v49 = v31;
            v51 = v30;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedTo"));
            v33 = v32;
            if (v32)
              objc_msgSend(v32, "transformInRoot");
            else
              memset(&v57, 0, sizeof(v57));
            CGAffineTransformInvert(&v58, &v57);
            v52 = vaddq_f64(*(float64x2_t *)&v58.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v58.c, v49), *(float64x2_t *)&v58.a, v51));

            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedTo"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "geometry"));
            objc_msgSend(v35, "size");
            v36 = sub_10005FDDC();
            objc_msgSend(v28, "overrideHeadMagnetNormalizedPosition:", sub_1000626B8(v52.f64[0], v52.f64[1], v36, v37, v38));

            objc_msgSend(v28, "setMagnetsAdjusted:", 1);
          }
        }
        if (objc_msgSend(v28, "tailMagnetType") == (id)6)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedFrom"));

          if (v39)
          {
            objc_msgSend(v28, "tailMagnetCanvasPosition");
            v50 = v41;
            v53 = v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedFrom"));
            v43 = v42;
            if (v42)
              objc_msgSend(v42, "transformInRoot");
            else
              memset(&v55, 0, sizeof(v55));
            CGAffineTransformInvert(&v56, &v55);
            v54 = vaddq_f64(*(float64x2_t *)&v56.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v56.c, v50), *(float64x2_t *)&v56.a, v53));

            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedFrom"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "geometry"));
            objc_msgSend(v45, "size");
            v46 = sub_10005FDDC();
            objc_msgSend(v28, "overrideTailMagnetNormalizedPosition:", sub_1000626B8(v54.f64[0], v54.f64[1], v46, v47, v48));

            objc_msgSend(v28, "setMagnetsAdjusted:", 1);
          }
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v25);
  }

}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CRLResizeKnobTracker convertKnobPositionFromUnscaledCanvas:](self, "convertKnobPositionFromUnscaledCanvas:", a3.x, a3.y);
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  objc_msgSend(v8, "offset");
  v10 = sub_1000603B8(v5, v7, v9);
  v12 = v11;

  -[CRLResizeKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:", v10, v12);
}

- (CGPoint)convertKnobPositionToUnscaledCanvas:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLResizeKnobTracker transformInRootForStandardKnobs](self, "transformInRootForStandardKnobs");
  v3 = vaddq_f64(v9, vmlaq_n_f64(vmulq_n_f64(v8, y), v7, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)convertKnobPositionFromUnscaledCanvas:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  double y;
  double x;
  CGAffineTransform v7;
  CGAffineTransform v8;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CRLResizeKnobTracker transformInRootForStandardKnobs](self, "transformInRootForStandardKnobs");
  CGAffineTransformInvert(&v8, &v7);
  v3 = vaddq_f64(*(float64x2_t *)&v8.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v8.c, y), *(float64x2_t *)&v8.a, x));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  unsigned int v14;
  _BOOL8 mSnapToGuides;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double width;
  double height;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL4 v32;
  _BOOL4 v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _BOOL8 v38;
  _BOOL8 v39;
  double v40;
  double v41;
  _BOOL4 v42;
  BOOL v43;
  unsigned __int8 v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  CKRecordID v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  Swift::String v64;

  if (self->mResizingLayout)
  {
    y = a3.y;
    x = a3.x;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    if (objc_msgSend(v6, "wantsGuidesWhileResizing") && !self->mBeganAlignmentOperation)
    {
      v44 = -[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");

      if ((v44 & 1) == 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "interactiveCanvasController"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "guideController"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        objc_msgSend(v47, "beginAlignmentOperationForRep:", v48);

        self->mBeganAlignmentOperation = 1;
      }
    }
    else
    {

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
    v9 = objc_msgSend(v8, "shouldFlipMagnetsDuringResize");

    if (v9)
      -[CRLResizeKnobTracker p_flipMagnetNormalizedPositionsIfNeeded](self, "p_flipMagnetNormalizedPositionsIfNeeded");
    -[CRLResizeKnobTracker p_simpleResizedRectByMovingKnobTo:](self, "p_simpleResizedRectByMovingKnobTo:", x, y);
    self->mLastNewBounds.origin.x = v10;
    self->mLastNewBounds.origin.y = v11;
    self->mLastNewBounds.size.width = v12;
    self->mLastNewBounds.size.height = v13;
    if (-[CRLResizeKnobTracker p_isMatchingSize](self, "p_isMatchingSize"))
    {
      v14 = -[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip");
      mSnapToGuides = -[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
      objc_msgSend(v16, "boundsForStandardKnobs");
      v18 = v17;
      v20 = v19;

      width = self->mBaseBounds.size.width;
      height = self->mBaseBounds.size.height;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      v24 = objc_msgSend(v23, "tag");

      if (sub_100260F28((char)v24))
      {
        if (-[CRLResizeKnobTracker currentlyPreservingAspectRatio](self, "currentlyPreservingAspectRatio"))
        {
          v25 = width / height;
          v26 = sub_100062B34(1, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height, width, height);
          v28 = v18 / (width / height) - v27;
          v29 = sqrt(v25 * v25 * (v28 * v28) + v28 * v28);
          v30 = -(v26 - v20 * v25) * -(v26 - v20 * v25);
          v31 = sqrt(v30 / (v25 * v25) + v30);
          v32 = v29 >= v31;
          v33 = v29 < v31;
          v34 = v27 + v28;
          v35 = v26 - (v26 - v20 * (width / height));
          if (v29 < v31)
            v36 = v18;
          else
            v36 = v35;
          if (v29 < v31)
            v37 = v34;
          else
            v37 = v20;
        }
        else
        {
          v32 = 1;
          v36 = v18;
          v37 = v20;
          v33 = 1;
        }
        v49 = sub_10005FDF0(v18, v20, v36, v37);
        v39 = v49 | v32;
        v38 = v49 | v33;
      }
      else
      {
        if (v24 == (id)8)
          v40 = width;
        else
          v40 = v18;
        if (v24 == (id)8)
          v41 = v20;
        else
          v41 = height;
        v42 = v24 != (id)8;
        v43 = v24 == (id)2;
        v39 = v24 == (id)2 || v24 == (id)8;
        v38 = !v43 && v42;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob", v40, v41));
      v51.super.isa = (Class)objc_msgSend(v50, "tag");
      sub_100496D84(v51, v64, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      self->mLastNewBounds.origin.x = v52;
      self->mLastNewBounds.origin.y = v53;
      self->mLastNewBounds.size.width = v54;
      self->mLastNewBounds.size.height = v55;

      if (v14)
        self->mLastNewBounds.size.width = -self->mLastNewBounds.size.width;
      if (mSnapToGuides)
      {
        mSnapToGuides = 0;
        self->mLastNewBounds.size.height = -self->mLastNewBounds.size.height;
      }
    }
    else
    {
      v38 = 0;
      v39 = 0;
      mSnapToGuides = self->mSnapToGuides;
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v63 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "interactiveCanvasController"));

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "guideController"));
    objc_msgSend(v57, "hideSizingGuides");

    -[CRLResizeKnobTracker constrainBetweenMaxAndMinSize](self, "constrainBetweenMaxAndMinSize");
    if (!-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    {
      -[CRLResizeKnobTracker constrainAndSnapByMovingKnobTo:snappingToGuides:](self, "constrainAndSnapByMovingKnobTo:snappingToGuides:", mSnapToGuides, x, y);
      -[CRLResizeKnobTracker constrainBetweenMaxAndMinSize](self, "constrainBetweenMaxAndMinSize");
    }
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v58, "invalidateKnobPositions");

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v59, "dynamicallyResizingWithTracker:", self);

    if (!-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    {
      -[CRLResizeKnobTracker p_validateLayout](self, "p_validateLayout");
      if (v38 || v39)
      {
        v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "guideController"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        objc_msgSend(v60, "showSizingGuideUIForRep:matchingWidth:matchingHeight:", v61, v38, v39);

        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "guideController"));
        objc_msgSend(v62, "showSizingGuideUIForRep:matchingWidth:matchingHeight:", self->mRepToMatch, v38, v39);

      }
      -[CRLResizeKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
      -[CRLResizeKnobTracker p_updateHUD](self, "p_updateHUD");
      -[CRLResizeKnobTracker p_updateGuideRenderable](self, "p_updateGuideRenderable");
    }

  }
}

- (void)endMovingKnob
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLCanvasLayout *mResizingLayout;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (self->mResizingLayout)
  {
    -[CRLResizeKnobTracker applyNewBoundsToPrimaryRep](self, "applyNewBoundsToPrimaryRep");
    if (!-[CRLResizeKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v7));

      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13)));
            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));

              if (v14 != v15)
                objc_msgSend(v14, "fadeKnobsIn");
            }

            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v11);
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guideController"));
      objc_msgSend(v16, "endAlignmentOperation");

      -[CRLResizeKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
      -[CRLResizeKnobTracker p_hideHUD](self, "p_hideHUD");
      -[CRLResizeKnobTracker p_hideGuideRenderable](self, "p_hideGuideRenderable");

    }
    mResizingLayout = self->mResizingLayout;
    self->mResizingLayout = 0;

    v18.receiver = self;
    v18.super_class = (Class)CRLResizeKnobTracker;
    -[CRLCanvasKnobTracker endMovingKnob](&v18, "endMovingKnob");
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("icc"), a4));
  objc_msgSend(v5, "removeDecorator:", self);

}

- (void)p_beginDynamicResize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CRLCanvasLayout *v14;
  CRLCanvasLayout *mResizingLayout;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261B60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A3C0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261B80);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 963, 0, "invalid nil value for '%{public}s'", "rep");

  }
  if (objc_msgSend(v3, "isBeingResized"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261BA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A2B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261BC0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"));
    v10 = "Rep should not already be being resized when calling -p_beginDynamicResize";
    v11 = v8;
    v12 = v9;
    v13 = 965;
LABEL_33:
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, v13, 0, v10);

    goto LABEL_34;
  }
  v14 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicResizeDidBegin"));
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v14;

  if (!self->mResizingLayout)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261BE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3A33C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261C00);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLResizeKnobTracker p_beginDynamicResize]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLResizeKnobTracker.m"));
    v10 = "Unable to get resizing layout for beginning dynamic drag.";
    v11 = v8;
    v12 = v9;
    v13 = 971;
    goto LABEL_33;
  }
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandController"));

    objc_msgSend(v8, "openGroup");
    objc_msgSend(v8, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");
LABEL_34:

  }
}

- (CGAffineTransform)p_repTransformInRootForTransforming
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform *result;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryForTransforming"));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layout"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));

  if (v11)
  {
    do
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      v14 = v13;
      if (v13)
      {
        v15 = *(_OWORD *)&retstr->c;
        v18[0] = *(_OWORD *)&retstr->a;
        v18[1] = v15;
        v18[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v13, "transformByConcatenatingTransformTo:", v18);
      }
      else
      {
        v20 = 0u;
        v21 = 0u;
        v19 = 0u;
      }
      v16 = v20;
      *(_OWORD *)&retstr->a = v19;
      *(_OWORD *)&retstr->c = v16;
      *(_OWORD *)&retstr->tx = v21;

      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parent"));
      v11 = (void *)v17;
    }
    while (v17);
  }
  return result;
}

- (CGRect)p_simpleResizedRectByMovingKnobTo:(CGPoint)a3
{
  double y;
  CGRect *p_mBaseBounds;
  double MinY;
  void *v7;
  objc_class *v8;
  unint64_t v9;
  unint64_t v10;
  double v11;
  Swift::String v12;
  CKRecordID v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  y = a3.y;
  p_mBaseBounds = &self->mBaseBounds;
  CGRectGetMinX(self->mBaseBounds);
  CGRectGetMaxX(*p_mBaseBounds);
  MinY = CGRectGetMinY(*p_mBaseBounds);
  CGRectGetMaxY(*p_mBaseBounds);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v8 = (objc_class *)objc_msgSend(v7, "tag");

  v9 = ((unint64_t)v8 - 1) / 3;
  v10 = ((unint64_t)v8 - 1) % 3;
  if (v9)
    v11 = MinY;
  else
    v11 = y;
  if (-[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter", v11)
    && (v10 == 2 || !v10))
  {
    CGRectGetMidX(*p_mBaseBounds);
  }
  if (-[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter") && (v9 == 2 || !v9))
    CGRectGetMidY(*p_mBaseBounds);
  v13.super.isa = v8;
  sub_100496D84(v13, v12, p_mBaseBounds->origin.x, p_mBaseBounds->origin.y, p_mBaseBounds->size.width, p_mBaseBounds->size.height);
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)constrainAndSnapByMovingKnobTo:(CGPoint)a3 snappingToGuides:(BOOL)a4
{
  _BOOL4 v4;
  CGRect *p_mLastNewBounds;
  double height;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  _BOOL4 v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int8x16_t v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  double v27;
  double v28;
  double v29;
  float v30;
  float v31;
  float v32;
  float v33;
  double v35;
  double v36;
  double v37;
  double v38;
  int8x16_t v39;
  double v40;
  int8x16_t v41;
  int8x16_t v42;
  Swift::String v43;
  CKRecordID v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  void *v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  Swift::String v62;
  double x;
  double y;
  double v65;
  CRLCanvasLayout *mResizingLayout;
  CGFloat v67;
  double v68;
  double v69;
  void *v70;
  id v71;
  CRLCanvasLayout *v72;
  double v73;
  double v74;
  CGRect *p_mBaseBounds;
  uint64_t v76;
  _BOOL8 v77;
  _BOOL8 v78;
  uint64_t v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  uint64_t v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  BOOL v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  unsigned int v101;
  unsigned int v102;
  uint64_t v103;
  CRLCanvasLayout *v104;
  double v105;
  _BOOL4 v106;
  double v107;
  float v108;
  double v109;
  float v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  char v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  Swift::String v127;
  int8x16_t v128;
  int8x16_t v129;
  double v130;
  CKRecordID v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  void *v136;
  void *v137;
  unsigned int v138;
  void *v139;
  CKRecordID v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  uint64_t v145;
  void *v146;
  double v147;
  double v148;
  uint64_t v149;
  double v150;
  double width;
  double v152;
  objc_class *v153;
  objc_class *v154;
  double v155;
  unsigned int v156;
  double rect;
  void *v158;
  void *v159;
  int v160;
  double v161;
  CGPoint v162;
  CGAffineTransform v163;
  CGAffineTransform v164;
  CGAffineTransform v165;
  _OWORD v166[3];
  CGAffineTransform v167;
  CGAffineTransform v168;
  CGAffineTransform v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  self->mSnappedToAspectRatio = 0;
  if (self->mSnapEnabled)
  {
    v4 = a4;
    p_mLastNewBounds = &self->mLastNewBounds;
    a3.x = self->mLastNewBounds.size.width;
    height = self->mLastNewBounds.size.height;
    v162 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v9 = (objc_class *)objc_msgSend(v8, "tag");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "guideController"));

    v13 = -[CRLResizeKnobTracker currentlyPreservingAspectRatio](self, "currentlyPreservingAspectRatio");
    v14 = sub_100260F28((char)v9);
    v160 = v14;
    if ((v13 & 1) == 0 && !v14)
    {
      if (!v4)
      {
LABEL_31:
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v61 = objc_msgSend(v60, "wantsGuidesWhileResizing");

        if (v61)
          objc_msgSend(v12, "hideAlignmentGuides");
LABEL_133:
        v140.super.isa = v9;
        sub_100496D84(v140, v62, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
        p_mLastNewBounds->origin.x = v141;
        p_mLastNewBounds->origin.y = v142;
        p_mLastNewBounds->size.width = v143;
        p_mLastNewBounds->size.height = v144;

        return;
      }
LABEL_28:
      if (!-[CRLCanvasAbstractLayout shouldSnapWhileResizing](self->mResizingLayout, "shouldSnapWhileResizing"))
        goto LABEL_31;
      v156 = v13;
      v44.super.isa = v9;
      sub_100496D84(v44, v43, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      p_mLastNewBounds->origin.x = v45;
      p_mLastNewBounds->origin.y = v46;
      p_mLastNewBounds->size.width = v47;
      p_mLastNewBounds->size.height = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v49, "dynamicallyResizingWithTracker:", self);

      -[CRLResizeKnobTracker p_validateLayout](self, "p_validateLayout");
      -[CRLCanvasAbstractLayout alignmentFrame](self->mResizingLayout, "alignmentFrame");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasAbstractLayout parent](self->mResizingLayout, "parent"));
      v59 = v58;
      if (v58)
        objc_msgSend(v58, "transformInRoot");
      else
        memset(&v169, 0, sizeof(v169));
      v170.origin.x = v51;
      v170.origin.y = v53;
      v170.size.width = v55;
      v170.size.height = v57;
      v171 = CGRectApplyAffineTransform(v170, &v169);
      x = v171.origin.x;
      y = v171.origin.y;
      width = v171.size.width;
      v65 = v171.size.height;

      memset(&v168, 0, sizeof(v168));
      mResizingLayout = self->mResizingLayout;
      if (mResizingLayout)
        -[CRLCanvasLayout originalTransformForProvidingGuides](mResizingLayout, "originalTransformForProvidingGuides");
      v172 = *p_mLastNewBounds;
      v167 = v168;
      v173 = CGRectApplyAffineTransform(v172, &v167);
      v67 = v173.origin.x;
      v68 = v173.origin.y;
      v69 = v173.size.width;
      v148 = v173.size.height;
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      v71 = objc_msgSend(v70, "tag");

      v72 = self->mResizingLayout;
      if (v72)
        -[CRLCanvasAbstractLayout transform](v72, "transform");
      else
        memset(v166, 0, sizeof(v166));
      v73 = sub_1000791B0(v166);
      sub_1000618C4(v73);
      v154 = v9;
      v159 = v12;
      if (v74 == 90.0 || fabs(v74 + -90.0) < 0.00999999978)
      {
        p_mBaseBounds = &self->mBaseBounds;
        v76 = sub_100260A78((uint64_t)v71);
      }
      else if (v74 == 180.0 || fabs(v74 + -180.0) < 0.00999999978)
      {
        p_mBaseBounds = &self->mBaseBounds;
        v76 = sub_100260A54((uint64_t)v71);
      }
      else
      {
        if (v74 != 270.0 && fabs(v74 + -270.0) >= 0.00999999978)
        {
          v149 = (uint64_t)v71;
          p_mBaseBounds = &self->mBaseBounds;
          goto LABEL_50;
        }
        p_mBaseBounds = &self->mBaseBounds;
        v76 = sub_100260890((uint64_t)v71);
      }
      v149 = v76;
LABEL_50:
      v77 = -[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip");
      v78 = -[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip");
      *(_QWORD *)&v80 = objc_opt_class(CRLFreehandDrawingRep, v79).n128_u64[0];
      v82 = v81;
      v83 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v80));
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "parentRep"));
      v85 = sub_100221D0C(v82, v84);
      v86 = objc_claimAutoreleasedReturnValue(v85);

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      LODWORD(v83) = objc_msgSend(v87, "wantsGuidesWhileResizing");

      v155 = y;
      rect = v68;
      v147 = v65;
      v88 = CGPointZero.y;
      if ((_DWORD)v83)
      {
        LOBYTE(v145) = v86 == 0;
        objc_msgSend(v159, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:hasHorizontalFlip:hasVerticalFlip:snapWithGuides:", v149, 1, 1, 0, v77, v78, x, y, width, v65, CGPointZero.x, v88, CGPointZero.x, v88, v145);
        v90 = v89;
        v92 = v91;
      }
      else
      {
        v90 = CGPointZero.x;
        v92 = v88;
      }
      v93 = v92 == v88 && v90 == CGPointZero.x;
      v94 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "interactiveCanvasController"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "canvasBackground"));

      v97 = v96;
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "alignmentProvider"));
      v146 = (void *)v86;
      if (v98)
      {
        v99 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "interactiveCanvasController"));
        v101 = objc_msgSend(v100, "isCanvasBackgroundAlignmentSnappingEnabled");

      }
      else
      {
        v101 = 0;
      }
      v102 = v156;
      if (v93)
      {
        v12 = v159;
        v103 = v149;
        goto LABEL_100;
      }
      v104 = self->mResizingLayout;
      if (v104)
        -[CRLCanvasLayout originalTransformForProvidingGuides](v104, "originalTransformForProvidingGuides");
      else
        memset(&v165, 0, sizeof(v165));
      v12 = v159;
      v103 = v149;
      v174 = CGRectApplyAffineTransform(*p_mBaseBounds, &v165);
      v105 = v174.size.width / v174.size.height;
      if (!v160)
      {
        if ((v156 & 1) != 0 || self->mSnappedToAspectRatio)
        {
          if (v90 == 0.0 || (v149 | 2) != 6)
          {
            v109 = -v92;
            if (v149 != 2)
              v109 = v92;
            v110 = v109;
            v90 = v105 * v110 - (v69 + v105 * v110 - (v148 + v110) * v105);
          }
          else
          {
            v107 = -v90;
            if (v149 != 4)
              v107 = v90;
            v108 = v107;
            v92 = v108 / v105 + (v69 + v108) / v105 - (v148 + v108 / v105);
          }
        }
LABEL_100:
        if (fabs(v90) <= (double)7)
        {
          if (fabs(v92) <= (double)7)
            v117 = 1;
          else
            v117 = v101;
          if ((v117 & 1) != 0)
            goto LABEL_108;
        }
        else if ((v101 & 1) != 0)
        {
          goto LABEL_108;
        }
        v90 = CGPointZero.x;
        v92 = v88;
LABEL_108:
        v167 = v168;
        CGAffineTransformInvert(&v164, &v167);
        v175.origin.x = v67;
        v175.origin.y = v68;
        v175.size.width = v69;
        v175.size.height = v148;
        v176 = CGRectApplyAffineTransform(v175, &v164);
        v118 = v176.size.height;
        v161 = v176.size.width;
        v119 = v67;
        if (0xAAAAAAAAAAAAAAABLL * (v103 - 1) <= 0x5555555555555555)
        {
          v120 = x + v90;
          v152 = width - v90;
          v119 = v119 + v90;
          v121 = v69 - v90;
        }
        else
        {
          v120 = x;
          v152 = width + v90;
          v121 = v69 + v90;
        }
        v9 = v154;
        if ((unint64_t)(v103 - 1) > 2)
        {
          v150 = v147 + v92;
          v122 = v148 + v92;
        }
        else
        {
          v155 = v155 + v92;
          v150 = v147 - v92;
          rect = v68 + v92;
          v122 = v148 - v92;
        }
        if ((v103 & 0xFFFFFFFFFFFFFFFDLL) == 4)
        {
          v123 = v92 * 0.5;
          v124 = v155 - v92 * 0.5;
          v125 = rect - v123;
          v126 = v119;
        }
        else
        {
          if (v103 == 8 || v103 == 2)
          {
            v120 = v120 - v90 * 0.5;
            v126 = v119 - v90 * 0.5;
            v124 = v155;
          }
          else
          {
            v124 = v155;
            v126 = v119;
          }
          v125 = rect;
        }
        v167 = v168;
        CGAffineTransformInvert(&v163, &v167);
        v177.origin.x = v126;
        v177.origin.y = v125;
        v177.size.width = v121;
        v177.size.height = v122;
        v178 = CGRectApplyAffineTransform(v177, &v163);
        *(float *)&v178.origin.x = v178.size.width;
        *(float *)&v178.size.width = v162.x;
        v128.i64[0] = 0x8000000080000000;
        v128.i64[1] = 0x8000000080000000;
        *(double *)v129.i64 = fabs(*(float *)vbslq_s8(v128, (int8x16_t)v178.origin, (int8x16_t)v178.size).i32);
        if (*(double *)v129.i64 >= 1.0)
        {
          *(float *)&v178.size.height = v178.size.height;
          *(float *)v129.i32 = height;
          v130 = *(float *)vbslq_s8(v128, *(int8x16_t *)&v178.size.height, v129).i32;
          if (fabs(v130) >= 1.0)
          {
            v131.super.isa = v154;
            sub_100496D84(v131, v127, p_mBaseBounds->origin.x, p_mBaseBounds->origin.y, p_mBaseBounds->size.width, p_mBaseBounds->size.height);
            p_mLastNewBounds->origin.x = v132;
            p_mLastNewBounds->origin.y = v133;
            p_mLastNewBounds->size.width = v134;
            p_mLastNewBounds->size.height = v135;
            v136 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
            objc_msgSend(v136, "dynamicallyResizingWithTracker:", self);

            -[CRLResizeKnobTracker p_validateLayout](self, "p_validateLayout");
            v137 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
            v138 = objc_msgSend(v137, "wantsGuidesWhileResizing");

            if (v138)
              objc_msgSend(v12, "showGuidesAlignedWithRect:forKnobTag:", v103, v120, v124, v152, v150);
            height = v130;
            v102 = v156;
          }
        }
        if (v118 == 0.0 || height == 0.0 || v161 == 0.0 || ((v102 ^ 1) & 1) != 0)
          v139 = v146;
        else
          v139 = v146;

        goto LABEL_133;
      }
      if ((v156 & 1) == 0 && !self->mSnappedToAspectRatio)
        goto LABEL_100;
      if (v90 == 0.0)
      {
        v106 = 0;
      }
      else
      {
        if (v92 == 0.0)
        {
          v106 = 1;
          goto LABEL_83;
        }
        v106 = fabs(v90) < fabs(v92);
      }
      if ((v106 | v101) != 1)
      {
        v106 = 0;
        v114 = v92;
LABEL_90:
        if (v149 == 7)
        {
          v115 = -(v92 * v105) - (v69 - -(v92 * v105) - (v148 + v92) * v105);
        }
        else
        {
          v115 = v92 * v105 - (v69 + v92 * v105 - (v148 + v92) * v105);
          v116 = -(v92 * v105) - -(v69 - v92 * v105 - (v148 - v92) * v105);
          if (v149 == 3)
            v115 = v116;
        }
LABEL_95:
        if (v101)
          v106 = fabs(v90) + fabs(v114) <= fabs(v92) + fabs(v115);
        if (v106)
          v92 = v114;
        else
          v90 = v115;
        goto LABEL_100;
      }
LABEL_83:
      v111 = -v90 / v105;
      v112 = v111 + (v69 - v90) / v105 - (v148 + v111);
      v113 = (v69 + v90) / v105;
      v114 = v111 + v113 - (v148 - v111);
      if (v149 != 3)
        v114 = v90 / v105 + v113 - (v148 + v90 / v105);
      if (v149 == 7)
        v114 = v112;
      v115 = v90;
      if ((!v106 | v101) != 1)
        goto LABEL_95;
      goto LABEL_90;
    }
    v158 = v12;
    v15 = fabs(v162.x);
    v16 = fabs(height);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasBackground"));

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "alignmentProvider"));
    v22 = (void *)v20;
    if (v13)
    {
      *(double *)v21.i64 = sub_100062B34(v160, v15, v16, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
      v15 = *(double *)v21.i64;
      v16 = v23;
LABEL_25:
      self->mSnappedToAspectRatio = 1;
      goto LABEL_26;
    }
    if ((v160 & v4) != 1)
    {
LABEL_26:
      v39 = (int8x16_t)v162;
LABEL_27:
      *(float *)v21.i32 = v15;
      *(float *)v39.i32 = *(double *)v39.i64;
      v41.i64[0] = 0x8000000080000000;
      v41.i64[1] = 0x8000000080000000;
      v42 = vbslq_s8(v41, v21, v39);
      *(double *)v42.i64 = *(float *)v42.i32;
      *(_QWORD *)&v162.x = v42.i64[0];
      *(float *)v42.i32 = v16;
      *(float *)v39.i32 = height;
      height = *(float *)vbslq_s8(v41, v42, v39).i32;

      v12 = v158;
      if (!v4)
        goto LABEL_31;
      goto LABEL_28;
    }
    if (!v20
      || (v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep")),
          v153 = v9,
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "interactiveCanvasController")),
          v26 = objc_msgSend(v25, "isCanvasBackgroundAlignmentSnappingEnabled"),
          v25,
          v9 = v153,
          v24,
          (v26 & 1) == 0))
    {
      v27 = self->mBaseBounds.size.height;
      v28 = 1.0;
      if (v27 > 0.001)
        v28 = self->mBaseBounds.size.width / v27;
      if (v16 <= 0.001)
        v29 = 1.0;
      else
        v29 = v15 / v16;
      v30 = v28;
      v31 = logf(v30);
      v32 = v29;
      *(float *)v21.i32 = logf(v32);
      v33 = vabds_f32(v31, *(float *)v21.i32);
      *(float *)v21.i32 = fabsf(*(float *)v21.i32);
      if (v33 < 0.1 && v33 < *(float *)v21.i32)
      {
        v35 = self->mBaseBounds.size.width;
        v37 = v15;
        v38 = v16;
        v36 = v27;
        goto LABEL_24;
      }
      if (*(float *)v21.i32 < 0.1)
      {
        v35 = 1.0;
        v36 = 1.0;
        v37 = v15;
        v38 = v16;
LABEL_24:
        *(double *)v21.i64 = sub_100062B34(1, v37, v38, v35, v36);
        v15 = *(double *)v21.i64;
        v16 = v40;
        v13 = 0;
        goto LABEL_25;
      }
    }
    v39 = (int8x16_t)v162;
    v13 = 0;
    goto LABEL_27;
  }
}

- (void)constrainBetweenMaxAndMinSize
{
  CGRect *p_mLastNewBounds;
  double height;
  double width;
  void *v6;
  CKRecordID v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CKRecordID v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  Swift::String v18;
  Swift::String v19;

  p_mLastNewBounds = &self->mLastNewBounds;
  width = self->mMinimumSize.width;
  height = self->mMinimumSize.height;
  if (-[CRLResizeKnobTracker currentlyPreservingAspectRatio](self, "currentlyPreservingAspectRatio"))
    sub_100062BCC(width, height, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v7.super.isa = (Class)objc_msgSend(v6, "tag");
  sub_100496D84(v7, v18, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  p_mLastNewBounds->origin.x = v8;
  p_mLastNewBounds->origin.y = v9;
  p_mLastNewBounds->size.width = v10;
  p_mLastNewBounds->size.height = v11;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v12.super.isa = (Class)objc_msgSend(v17, "tag");
  sub_100496D84(v12, v19, self->mBaseBounds.origin.x, self->mBaseBounds.origin.y, self->mBaseBounds.size.width, self->mBaseBounds.size.height);
  p_mLastNewBounds->origin.x = v13;
  p_mLastNewBounds->origin.y = v14;
  p_mLastNewBounds->size.width = v15;
  p_mLastNewBounds->size.height = v16;

}

- (void)p_validateLayout
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutController"));
  objc_msgSend(v3, "validateLayoutWithDependencies:", v4);

}

- (void)p_updateGuideRenderable
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CRLCanvasRenderable *mGuideRenderable;
  CRLCanvasRenderable *v15;
  CRLCanvasRenderable *v16;
  BOOL v17;
  double v18;
  uint64_t *v19;
  _QWORD *v20;
  CGContext *v21;
  CGColorSpace *v22;
  double v23;
  int v24;
  CGContext *v25;
  CGColorSpace *v26;
  double v27;
  int v28;
  double v29;
  CGImageRef Image;
  uint64_t *v31;
  CGImageRef *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  uint64_t v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double x;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double width;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  float v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  long double v107;
  double v108;
  CRLCanvasRenderable *v109;
  double v110;
  double v111;
  CGAffineTransform v112;
  CGAffineTransform v113;
  CGAffineTransform v114;
  CGAffineTransform v115;
  CGAffineTransform v116;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform components;
  CGRect v122;
  CGRect v123;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v4 = sub_100260F28((char)objc_msgSend(v3, "tag"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvas"));
    objc_msgSend(v7, "contentsScale");
    v9 = v8;

    if (!self->mBeganAlignmentOperation)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guideController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v10, "beginAlignmentOperationForRep:", v11);

      self->mBeganAlignmentOperation = 1;
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    if (self->mSnappedToAspectRatio)
    {
      v12 = v9 * 10.0;
      v13 = v9 * 3.0;
      mGuideRenderable = self->mGuideRenderable;
      if (!mGuideRenderable)
      {
        v15 = (CRLCanvasRenderable *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        v16 = self->mGuideRenderable;
        self->mGuideRenderable = v15;

        -[CRLCanvasRenderable setZPosition:](self->mGuideRenderable, "setZPosition:", -1.0);
        -[CRLCanvasRenderable setDelegate:](self->mGuideRenderable, "setDelegate:", self);
        -[CRLCanvasRenderable setContentsScale:](self->mGuideRenderable, "setContentsScale:", v9);
        objc_msgSend(v6, "invalidateLayersForDecorator:", self);
        if (qword_10147E640)
          v17 = 1;
        else
          v17 = v9 == 1.0;
        v18 = (double)(unint64_t)(v12 * 20.0);
        v19 = &qword_10147E630;
        v20 = &unk_10147E638;
        if (!v17 || !qword_10147E630)
        {
          v21 = sub_10040FA64(3, (double)(unint64_t)v13, v18);
          *(_OWORD *)&components.a = xmmword_100EF04A0;
          components.c = 0.125490196;
          v22 = (CGColorSpace *)sub_100011A10();
          CGContextSetFillColorSpace(v21, v22);
          v23 = 0.0;
          v24 = 20;
          do
          {
            components.d = v23 / -20.0 + 1.0;
            CGContextSetFillColor(v21, &components.a);
            v122.origin.x = 0.0;
            v122.origin.y = 0.0;
            v122.size.width = v9 * 3.0;
            v122.size.height = v9 * 3.0;
            CGContextAddEllipseInRect(v21, v122);
            CGContextFillPath(v21);
            CGContextTranslateCTM(v21, 0.0, v9 * 10.0);
            v23 = v23 + 1.0;
            --v24;
          }
          while (v24);
          v25 = sub_10040FA64(3, (double)(unint64_t)v13, 2560.0);
          components.d = 1.0;
          v26 = (CGColorSpace *)sub_100011A10();
          CGContextSetFillColorSpace(v25, v26);
          CGContextSetFillColor(v25, &components.a);
          v27 = 2560.0 / v12 + 2560.0 / v12;
          if (v27 > 0.0)
          {
            v28 = 1;
            do
            {
              v123.origin.x = 0.0;
              v123.origin.y = 0.0;
              v123.size.width = v9 * 3.0;
              v123.size.height = v9 * 3.0;
              CGContextAddEllipseInRect(v25, v123);
              CGContextFillPath(v25);
              CGContextTranslateCTM(v25, 0.0, v9 * 10.0);
              v29 = (double)v28++;
            }
            while (v27 > v29);
          }
          Image = CGBitmapContextCreateImage(v21);
          if (v9 == 1.0)
            v31 = &qword_10147E630;
          else
            v31 = &qword_10147E640;
          if (v9 == 1.0)
            v32 = (CGImageRef *)&unk_10147E638;
          else
            v32 = (CGImageRef *)&unk_10147E648;
          *v31 = (uint64_t)Image;
          *v32 = CGBitmapContextCreateImage(v25);
          v19 = &qword_10147E630;
          CGContextRelease(v21);
          v20 = &unk_10147E638;
          CGContextRelease(v25);
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        v34 = v33;
        if (v9 != 1.0)
        {
          v19 = &qword_10147E640;
          v20 = &unk_10147E648;
        }
        objc_msgSend(v33, "setContents:", *v19);
        v35 = (double)(unint64_t)v13 / v9;
        v36 = v18 / v9;
        objc_msgSend(v34, "setBounds:", 0.0, 0.0, v35, v18 / v9);
        v37 = v13 * -0.5 / v18 + 1.0;
        objc_msgSend(v34, "setAnchorPoint:", 0.5, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        objc_msgSend(v38, "setContents:", *v20);
        objc_msgSend(v38, "setAnchorPoint:", 0.5, 0.0);
        objc_msgSend(v38, "setBounds:", 0.0, v13 * -0.5 / 2560.0, v35, 2560.0 / v9);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasScrollRenderable renderable](CRLCanvasScrollRenderable, "renderable"));
        objc_msgSend(v39, "setAnchorPoint:", 0.5, 0.0);
        objc_msgSend(v39, "addSubrenderable:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
        objc_msgSend(v40, "setContents:", *v19);
        objc_msgSend(v40, "setBounds:", 0.0, 0.0, v35, v36);
        CGAffineTransformMakeRotation(&v120, 3.14159265);
        v119 = v120;
        objc_msgSend(v40, "setAffineTransform:", &v119);
        objc_msgSend(v40, "setAnchorPoint:", 0.5, v37);
        objc_msgSend(v34, "setContentsScale:", v9);
        objc_msgSend(v39, "setContentsScale:", v9);
        objc_msgSend(v40, "setContentsScale:", v9);
        -[CRLCanvasRenderable addSubrenderable:](self->mGuideRenderable, "addSubrenderable:", v34);
        -[CRLCanvasRenderable addSubrenderable:](self->mGuideRenderable, "addSubrenderable:", v39);
        -[CRLCanvasRenderable addSubrenderable:](self->mGuideRenderable, "addSubrenderable:", v40);

        mGuideRenderable = self->mGuideRenderable;
      }
      v111 = v9 * 10.0;
      -[CRLCanvasRenderable setHidden:](mGuideRenderable, "setHidden:", 0, v9 * 3.0);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      v42 = sub_100260E54((uint64_t)objc_msgSend(v41, "tag"), self->mLastNewBounds.origin.x, self->mLastNewBounds.origin.y, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height);
      v44 = v43;

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      v46 = sub_100260A54((uint64_t)objc_msgSend(v45, "tag"));
      v47 = sub_100260E54(v46, self->mLastNewBounds.origin.x, self->mLastNewBounds.origin.y, self->mLastNewBounds.size.width, self->mLastNewBounds.size.height);
      v49 = v48;

      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v50, "boundsForResizeGuideUI");
      v52 = v51;

      x = self->mLastNewBounds.origin.x;
      v54 = sub_1000603B8(v42, v44, x);
      v56 = v55;
      v57 = sub_1000603B8(v47, v49, x);
      v59 = v58;
      v60 = sub_1000603D0(v54, v56, v52);
      v62 = v61;
      v63 = sub_1000603D0(v57, v59, v52);
      v65 = v64;
      if (-[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip"))
      {
        width = self->mLastNewBounds.size.width;
        v60 = sub_1000603B8(v60, v62, width);
        v62 = v67;
        v63 = sub_1000603B8(v63, v65, width);
        v65 = v68;
      }
      if (-[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip"))
      {
        v60 = sub_1000603B8(v60, v62, 0.0);
        v62 = v69;
        v63 = sub_1000603B8(v63, v65, 0.0);
        v65 = v70;
      }
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "layout"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "geometryForTransforming"));

      memset(&components, 0, sizeof(components));
      if (v73)
        objc_msgSend(v73, "transform");
      else
        memset(&t1, 0, sizeof(t1));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "layout"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "geometry"));
      v77 = v76;
      if (v76)
        objc_msgSend(v76, "transform");
      else
        memset(&v116, 0, sizeof(v116));
      CGAffineTransformInvert(&t2, &v116);
      CGAffineTransformConcat(&components, &t1, &t2);

      v78 = components.tx + v62 * components.c + components.a * v60;
      v79 = components.ty + v62 * components.d + components.b * v60;
      v80 = components.tx + v65 * components.c + components.a * v63;
      v81 = components.ty + v65 * components.d + components.b * v63;
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v82, "convertNaturalPointToUnscaledCanvas:", v78, v79);
      objc_msgSend(v6, "convertUnscaledToBoundsPoint:");
      v84 = v83;
      v86 = v85;

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      objc_msgSend(v87, "convertNaturalPointToUnscaledCanvas:", v80, v81);
      objc_msgSend(v6, "convertUnscaledToBoundsPoint:");
      v89 = v88;
      v91 = v90;

      v92 = sub_10006108C(v89, v91, v84, v86);
      v93 = v92 / v111;
      v94 = vcvtps_u32_f32(v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable subrenderables](self->mGuideRenderable, "subrenderables"));
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "objectAtIndexedSubscript:", 0));

      v97 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable subrenderables](self->mGuideRenderable, "subrenderables"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "objectAtIndexedSubscript:", 1));

      v99 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRenderable subrenderables](self->mGuideRenderable, "subrenderables"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "lastObject"));

      v101 = v111 * (double)v94;
      objc_msgSend(v98, "setBounds:", v110 * -0.5, 0.0, v110, v101);
      if (-[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter")
        && -[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter"))
      {
        v102 = v92 * 0.5;
        v103 = (float)(v94 >> 1);
        objc_msgSend(v96, "setPosition:", 0.0, v102 - v103 * v111);
        objc_msgSend(v98, "setPosition:", 0.0, v102 - v103 * v111);
        v101 = v102 + v103 * v111;
      }
      else
      {
        objc_msgSend(v96, "setPosition:", 0.0, 0.0);
        objc_msgSend(v98, "setPosition:", 0.0, 0.0);
      }
      objc_msgSend(v100, "setPosition:", 0.0, v101);
      -[CRLCanvasRenderable position](self->mGuideRenderable, "position");
      if (v105 != v89 || v104 != v91)
        -[CRLCanvasRenderable setPosition:](self->mGuideRenderable, "setPosition:", v89, v91);
      v106 = sub_1000603B8(v84, v86, v89);
      v108 = sub_1000618B4(v106, v107);
      memset(&v115, 0, sizeof(v115));
      CGAffineTransformMakeRotation(&v115, v108 + -1.57079633);
      v109 = self->mGuideRenderable;
      if (v109)
        -[CRLCanvasRenderable affineTransform](v109, "affineTransform");
      else
        memset(&v114, 0, sizeof(v114));
      v113 = v115;
      if (!CGAffineTransformEqualToTransform(&v113, &v114))
      {
        v112 = v115;
        -[CRLCanvasRenderable setAffineTransform:](self->mGuideRenderable, "setAffineTransform:", &v112);
      }
      +[CATransaction commit](CATransaction, "commit");

    }
    else
    {
      -[CRLCanvasRenderable setHidden:](self->mGuideRenderable, "setHidden:", 1);
      +[CATransaction commit](CATransaction, "commit");
    }

  }
}

- (void)p_hideGuideRenderable
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  if (-[CRLCanvasRenderable isHidden](self->mGuideRenderable, "isHidden"))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasController"));
    objc_msgSend(v3, "removeDecorator:", self);

  }
  else
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v11, "setDuration:", 0.400000006);
    LODWORD(v4) = 1.0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v4));
    objc_msgSend(v11, "setFromValue:", v5);

    LODWORD(v6) = 0;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
    objc_msgSend(v11, "setToValue:", v7);

    objc_msgSend(v11, "setDelegate:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
    objc_msgSend(v11, "setValue:forKey:", v9, CFSTR("icc"));

    -[CRLCanvasRenderable addAnimation:forKey:](self->mGuideRenderable, "addAnimation:forKey:", v11, CFSTR("fade out"));
    LODWORD(v10) = 0;
    -[CRLCanvasRenderable setOpacity:](self->mGuideRenderable, "setOpacity:", v10);
  }

}

- (void)p_updateHUD
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  CRLCanvasHUDController *mSecondHUDController;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  CRLCanvasHUDController *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  *(_QWORD *)&v3 = objc_opt_class(NSNumber, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("CRLShowSizeAndPositionWhileMovingUserDefault")));
  v8 = sub_100221D0C(v5, v7);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v41 || (v9 = objc_msgSend(v41, "BOOLValue"), v10 = v41, v9))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactiveCanvasController"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker hudLabelText](self, "hudLabelText"));
    objc_msgSend(v13, "setLabelText:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layerHost"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasView"));

    -[CRLCanvasKnobTracker currentPosition](self, "currentPosition");
    objc_msgSend(v12, "convertUnscaledToBoundsPoint:");
    v18 = v17;
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
    objc_msgSend(v21, "frame");
    v23 = (v22 + v22) / 5.0;

    objc_msgSend(v13, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:", self, v16, 0, v18, v20, v23, -75.0);
    if (!-[CRLResizeKnobTracker suppressSecondaryHUD](self, "suppressSecondaryHUD"))
    {
      if (-[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter")
        && -[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter"))
      {
        mSecondHUDController = self->mSecondHUDController;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v26 = v25;
        v27 = CFSTR("Center Resize");
LABEL_9:
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", v27, 0, 0));
        -[CRLCanvasHUDController setLabelText:](mSecondHUDController, "setLabelText:", v28);

        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasHUDController view](self->mSecondHUDController, "view"));
        objc_msgSend(v29, "frame");
        v31 = (v30 + v30) / 5.0;

        v32 = self->mSecondHUDController;
        -[CRLResizeKnobTracker secondaryHUDPoint](self, "secondaryHUDPoint");
        v35 = sub_1000630C4(v33, v34);
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layerHost"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "canvasView"));
        -[CRLCanvasHUDController showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:](v32, "showHUDForKey:forTouchPoint:inCanvasView:withNudge:size:", self, v40, 0, v35, v37, v31, -75.0);

LABEL_11:
        v10 = v41;
        goto LABEL_12;
      }
      if (-[CRLResizeKnobTracker p_isMatchingSize](self, "p_isMatchingSize"))
      {
        mSecondHUDController = self->mSecondHUDController;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v26 = v25;
        v27 = CFSTR("Match Size");
        goto LABEL_9;
      }
    }
    -[CRLCanvasHUDController hideHUDForKey:](self->mSecondHUDController, "hideHUDForKey:", self);
    goto LABEL_11;
  }
LABEL_12:

}

- (void)p_hideHUD
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
  objc_msgSend(v3, "hideHUDForKey:", self);

  -[CRLCanvasHUDController hideHUDForKey:](self->mSecondHUDController, "hideHUDForKey:", self);
}

- (void)p_cancelDelayedHUDAndGuides
{
  self->mNeedsHUD = 0;
}

- (void)p_showHUDAndGuides
{
  -[CRLResizeKnobTracker p_updateHUD](self, "p_updateHUD");
  -[CRLResizeKnobTracker p_updateGuideRenderable](self, "p_updateGuideRenderable");
}

- (BOOL)p_isMatchingSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reliedOnLayouts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
  v10 = objc_msgSend(v7, "containsObject:", v9);

  if ((v10 & 1) != 0)
  {
    LOBYTE(v11) = 0;
  }
  else
  {
LABEL_4:
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      if (v13 == v14 || -[CRLResizeKnobTracker p_isResizingWidthFromCenter](self, "p_isResizingWidthFromCenter"))
        LOBYTE(v11) = 0;
      else
        v11 = !-[CRLResizeKnobTracker p_isResizingHeightFromCenter](self, "p_isResizingHeightFromCenter");

    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  return v11;
}

- (BOOL)p_isResizingWidthFromCenter
{
  _BOOL4 v3;

  v3 = -[CRLResizeKnobTracker canCenterResize](self, "canCenterResize");
  if (v3)
    LOBYTE(v3) = -[CRLResizeKnobTracker shouldResizeFromCenter](self, "shouldResizeFromCenter");
  return v3;
}

- (BOOL)p_isResizingHeightFromCenter
{
  _BOOL4 v3;

  v3 = -[CRLResizeKnobTracker canCenterResize](self, "canCenterResize");
  if (v3)
    LOBYTE(v3) = -[CRLResizeKnobTracker shouldResizeFromCenter](self, "shouldResizeFromCenter");
  return v3;
}

- (BOOL)currentlyPreservingAspectRatio
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL mPreserveAspectRatio;
  void *v12;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPShapeLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v9 && objc_msgSend(v9, "autosizes"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    mPreserveAspectRatio = sub_100260F28((char)objc_msgSend(v10, "tag"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
    if (objc_msgSend(v12, "resizeMayChangeAspectRatio"))
      mPreserveAspectRatio = self->mPreserveAspectRatio;
    else
      mPreserveAspectRatio = 1;

  }
  return mPreserveAspectRatio;
}

- (void)resizeRepForInspectors:(id)a3 value:(double)a4 changingWidth:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  CRLResizeKnobTracker *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double x;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  CGRect v61;

  v5 = a5;
  v8 = a3;
  v9 = self;
  -[CRLResizeKnobTracker i_lastNewBounds](v9, "i_lastNewBounds");
  v12 = v10;
  v13 = v11;
  if (vabdd_f64(0.0, v11) < 0.00999999978 || v11 == 0.0)
    v15 = 0.0;
  else
    v15 = v10 / v11;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout", v10 / v11));
  v17 = objc_msgSend(v16, "resizeMayChangeAspectRatio");
  if (v15 == 0.0)
    v18 = 1;
  else
    v18 = v17;
  if (v5)
  {
    if (!v18)
      v13 = a4 / v15;
  }
  else
  {
    v13 = a4;
    if (v18)
      a4 = v12;
    else
      a4 = v15 * a4;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
  v20 = sub_100260884((char)objc_msgSend(v19, "tag")) & 0x92;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
  v22 = sub_100260884((char)objc_msgSend(v21, "tag")) & 0xE;

  v23 = 0.0;
  v24 = 0.0;
  if (v20)
  {
    -[CRLResizeKnobTracker i_baseBounds](v9, "i_baseBounds");
    v24 = v25 - a4;
  }
  if (v22)
  {
    -[CRLResizeKnobTracker i_baseBounds](v9, "i_baseBounds");
    v23 = v26 - v13;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
  v28 = sub_100260E54((uint64_t)objc_msgSend(v27, "tag"), v24, v23, a4, v13);
  v53 = v29;
  v54 = v28;

  v52 = v13;
  if (v8)
  {
    objc_msgSend(v8, "knobPositionTransformForInspectorResize");
    v30 = v55;
    v31 = v57;
    v32 = v59;
    v33 = -[CRLResizeKnobTracker shouldResizeFromCenter](v9, "shouldResizeFromCenter", v58, v56, v60);
  }
  else
  {
    v32 = 0.0;
    v31 = 0.0;
    v30 = 0.0;
    v33 = -[CRLResizeKnobTracker shouldResizeFromCenter](v9, "shouldResizeFromCenter", 0, 0, 0);
  }
  v34 = v33;
  v35 = -[CRLResizeKnobTracker shouldResizeFromCenter](v9, "shouldResizeFromCenter");
  -[CRLResizeKnobTracker i_baseBounds](v9, "i_baseBounds");
  v40 = v36;
  v41 = v37;
  v42 = v38;
  v43 = v39;
  if (v34)
  {
    v44 = CGRectGetMidX(*(CGRect *)&v36) + a4 * 0.5;
    if (!v35)
    {
LABEL_26:
      v45 = v51 + v53 * v49 + v50 * v54;
      goto LABEL_29;
    }
  }
  else
  {
    v44 = v32 + v53 * v31 + v30 * v54;
    if (!v35)
      goto LABEL_26;
  }
  v61.origin.x = v40;
  v61.origin.y = v41;
  v61.size.width = v42;
  v61.size.height = v43;
  v45 = CGRectGetMidY(v61) + v52 * 0.5;
LABEL_29:
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](v9, "knob"));
  if (objc_msgSend(v46, "offsetValid"))
  {
    objc_msgSend(v46, "offset");
    x = v47;
  }
  else
  {
    x = CGPointZero.x;
  }
  -[CRLResizeKnobTracker convertKnobPositionToUnscaledCanvas:](v9, "convertKnobPositionToUnscaledCanvas:", sub_1000603D0(v44, v45, x));
  -[CRLCanvasKnobTracker setCurrentPosition:](v9, "setCurrentPosition:");

}

- (void)p_flipMagnetNormalizedPositionsIfNeeded
{
  unsigned int v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id obj;
  unsigned int v38;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v3 = -[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip");
  v4 = -[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedLayouts"));
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v42;
    v38 = v3;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v39)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedTo"));

        if (v6 == v9)
        {
          objc_msgSend(v8, "headMagnetNormalizedPosition");
          v11 = v14;
          v13 = v15;
          if ((v3 & 1) == 0)
          {
            if ((v4 & 1) == 0)
              goto LABEL_22;
LABEL_20:
            if ((objc_msgSend(v8, "headHasVerticalFlip") & 1) != 0)
              goto LABEL_22;
LABEL_21:
            v13 = 1.0 - v13;
            -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
            -[CRLResizeKnobTracker p_updateMagnetTypeForMagnet:forClineLayout:](self, "p_updateMagnetTypeForMagnet:forClineLayout:", v6 == v9, v8);
            self->mAdjustedMagnetsForVerticalFlip = 1;
            objc_msgSend(v8, "setMagnetsAdjusted:", 1);
            goto LABEL_22;
          }
          if ((objc_msgSend(v8, "headHasHorizontalFlip") & 1) != 0)
          {
            if ((v4 & 1) == 0)
              goto LABEL_30;
            goto LABEL_20;
          }
        }
        else
        {
          objc_msgSend(v8, "tailMagnetNormalizedPosition");
          v11 = v10;
          v13 = v12;
          if ((v3 & 1) == 0 || (objc_msgSend(v8, "tailHasHorizontalFlip") & 1) != 0)
          {
            if ((v4 & 1) == 0)
              goto LABEL_22;
            goto LABEL_16;
          }
        }
        v11 = 1.0 - v11;
        -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
        -[CRLResizeKnobTracker p_updateMagnetTypeForMagnet:forClineLayout:](self, "p_updateMagnetTypeForMagnet:forClineLayout:", v6 == v9, v8);
        self->mAdjustedMagnetsForHorizontalFlip = 1;
        objc_msgSend(v8, "setMagnetsAdjusted:", 1);
        if ((v4 & 1) == 0)
          goto LABEL_22;
LABEL_16:
        if (v6 == v9)
          goto LABEL_20;
        if ((objc_msgSend(v8, "tailHasVerticalFlip") & 1) == 0)
          goto LABEL_21;
LABEL_22:
        if (self->mAdjustedMagnetsForHorizontalFlip)
          v16 = v3;
        else
          v16 = 1;
        if ((v16 & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLineInfo"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectionLinePathSource"));

          if (v6 == v9)
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "headMagnet"));
          else
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tailMagnet"));
          v20 = v19;
          objc_msgSend(v19, "magnetNormalizedPosition");
          v11 = v21;

          -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v13);
          -[CRLResizeKnobTracker p_revertToOriginalMagnetTypeForMagnet:forClineLayout:](self, "p_revertToOriginalMagnetTypeForMagnet:forClineLayout:", v6 == v9, v8);
          self->mAdjustedMagnetsForHorizontalFlip = 0;

          v3 = v38;
        }
LABEL_30:
        if (self->mAdjustedMagnetsForVerticalFlip)
          v22 = v4;
        else
          v22 = 1;
        if ((v22 & 1) == 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLineInfo"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "connectionLinePathSource"));

          if (v6 == v9)
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "headMagnet"));
          else
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "tailMagnet"));
          v26 = v25;
          objc_msgSend(v25, "magnetNormalizedPosition");
          v28 = v27;

          -[CRLResizeKnobTracker p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:](self, "p_setNormalizedPositionForMagnet:withNewNormalizedPosition:forClineLayout:onLayout:", v6 == v9, v8, v6, v11, v28);
          -[CRLResizeKnobTracker p_revertToOriginalMagnetTypeForMagnet:forClineLayout:](self, "p_revertToOriginalMagnetTypeForMagnet:forClineLayout:", v6 == v9, v8);
          self->mAdjustedMagnetsForVerticalFlip = 0;

          v3 = v38;
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedTo"));
        if (v29 == v6)
          v30 = v3;
        else
          v30 = 0;
        objc_msgSend(v8, "setHeadHasHorizontalFlip:", v30);

        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedTo"));
        if (v31 == v6)
          v32 = v4;
        else
          v32 = 0;
        objc_msgSend(v8, "setHeadHasVerticalFlip:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedFrom"));
        if (v33 == v6)
          v34 = v3;
        else
          v34 = 0;
        objc_msgSend(v8, "setTailHasHorizontalFlip:", v34);

        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectedFrom"));
        if (v35 == v6)
          v36 = v4;
        else
          v36 = 0;
        objc_msgSend(v8, "setTailHasVerticalFlip:", v36);

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v40);
  }

}

- (void)p_setNormalizedPositionForMagnet:(BOOL)a3 withNewNormalizedPosition:(CGPoint)a4 forClineLayout:(id)a5 onLayout:(id)a6
{
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  float64x2_t v17;
  __int128 v18;
  double v19;
  double x;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v23;

  v18 = *(__int128 *)&a4.y;
  x = a4.x;
  v7 = a3;
  v8 = a5;
  v9 = a6;
  memset(&v23, 0, sizeof(v23));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pureGeometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "fullTransform", v18);
  else
    memset(&t1, 0, sizeof(t1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent", (_QWORD)v18));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geometryInRoot"));
    v15 = v14;
    if (v14)
      objc_msgSend(v14, "transform");
    else
      memset(&t2, 0, sizeof(t2));
    CGAffineTransformConcat(&v23, &t1, &t2);

  }
  else
  {
    v16 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&t2.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    CGAffineTransformConcat(&v23, &t1, &t2);
  }

  v17 = vaddq_f64(*(float64x2_t *)&v23.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v23.c, v19), *(float64x2_t *)&v23.a, x));
  if (v7)
    objc_msgSend(v8, "setHeadMagnetPosition:", *(_OWORD *)&v17);
  else
    objc_msgSend(v8, "setTailMagnetPosition:", *(_OWORD *)&v17);

}

- (void)p_updateMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4
{
  _BOOL4 v4;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v4 = a3;
  v17 = a4;
  v6 = -[CRLResizeKnobTracker hasHorizontalFlip](self, "hasHorizontalFlip");
  v7 = -[CRLResizeKnobTracker hasVerticalFlip](self, "hasVerticalFlip");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectionLineInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLinePathSource"));

  if (v4)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "headMagnet"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tailMagnet"));
  v11 = v10;
  v12 = objc_msgSend(v10, "magnetType");

  v13 = v17;
  switch((unint64_t)v12)
  {
    case 2uLL:
      v14 = v7 == 0;
      v15 = 2;
      v16 = 4;
      goto LABEL_10;
    case 3uLL:
      v14 = v6 == 0;
      v15 = 3;
      v16 = 5;
      goto LABEL_10;
    case 4uLL:
      v14 = v7 == 0;
      v15 = 4;
      v16 = 2;
      goto LABEL_10;
    case 5uLL:
      v14 = v6 == 0;
      v15 = 5;
      v16 = 3;
LABEL_10:
      if (v14)
        v12 = (id)v15;
      else
        v12 = (id)v16;
      break;
    default:
      v13 = v17;
      break;
  }
  if (v4)
    objc_msgSend(v13, "setHeadMagnetType:", v12);
  else
    objc_msgSend(v13, "setTailMagnetType:", v12);

}

- (void)p_revertToOriginalMagnetTypeForMagnet:(BOOL)a3 forClineLayout:(id)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "connectionLineInfo"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectionLinePathSource"));

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "headMagnet"));
    objc_msgSend(v5, "setHeadMagnetType:", objc_msgSend(v7, "magnetType"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tailMagnet"));
    objc_msgSend(v5, "setTailMagnetType:", objc_msgSend(v7, "magnetType"));
  }

}

- (BOOL)i_shouldForceDrag
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLResizeKnobTracker repToMatch](self, "repToMatch"));
  v3 = v2 != 0;

  return v3;
}

- (CGRect)i_baseBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mBaseBounds.origin.x;
  y = self->mBaseBounds.origin.y;
  width = self->mBaseBounds.size.width;
  height = self->mBaseBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)i_lastNewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mLastNewBounds.origin.x;
  y = self->mLastNewBounds.origin.y;
  width = self->mLastNewBounds.size.width;
  height = self->mLastNewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isInspectorDrivenTracking
{
  return self->mInspectorDrivenTracking;
}

- (void)setIsInspectorDrivenTracking:(BOOL)a3
{
  self->mInspectorDrivenTracking = a3;
}

- (BOOL)shouldResizeFromCenter
{
  return self->mShouldResizeFromCenter;
}

- (void)setShouldResizeFromCenter:(BOOL)a3
{
  self->mShouldResizeFromCenter = a3;
}

- (BOOL)snapEnabled
{
  return self->mSnapEnabled;
}

- (void)setSnapEnabled:(BOOL)a3
{
  self->mSnapEnabled = a3;
}

- (CGSize)minimumSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMinimumSize.width;
  height = self->mMinimumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinimumSize:(CGSize)a3
{
  self->mMinimumSize = a3;
}

- (CGSize)maximumSize
{
  double width;
  double height;
  CGSize result;

  width = self->mMaximumSize.width;
  height = self->mMaximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaximumSize:(CGSize)a3
{
  self->mMaximumSize = a3;
}

- (BOOL)canMoveKnobAcrossOpposite
{
  return self->mCanMoveKnobAcrossOpposite;
}

- (void)setCanMoveKnobAcrossOpposite:(BOOL)a3
{
  self->mCanMoveKnobAcrossOpposite = a3;
}

- (CRLCanvasRep)repToMatch
{
  return self->mRepToMatch;
}

- (void)setRepToMatch:(id)a3
{
  objc_storeStrong((id *)&self->mRepToMatch, a3);
}

- (CGPoint)secondaryHUDPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mSecondaryHUDPoint.x;
  y = self->mSecondaryHUDPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSecondaryHUDPoint:(CGPoint)a3
{
  self->mSecondaryHUDPoint = a3;
}

- (BOOL)preserveAspectRatio
{
  return self->mPreserveAspectRatio;
}

- (void)setPreserveAspectRatio:(BOOL)a3
{
  self->mPreserveAspectRatio = a3;
}

- (BOOL)snapToGuides
{
  return self->mSnapToGuides;
}

- (void)setSnapToGuides:(BOOL)a3
{
  self->mSnapToGuides = a3;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)suppressSecondaryHUD
{
  return self->mSuppressSecondaryHUD;
}

- (void)setSuppressSecondaryHUD:(BOOL)a3
{
  self->mSuppressSecondaryHUD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSecondHUDController, 0);
  objc_storeStrong((id *)&self->mGuideRenderable, 0);
  objc_storeStrong((id *)&self->mResizingLayout, 0);
  objc_storeStrong((id *)&self->mRepToMatch, 0);
}

@end
