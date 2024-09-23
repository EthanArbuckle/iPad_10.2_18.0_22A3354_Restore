@implementation CRLShapeLineSegmentKnobTracker

- (CRLShapeLineSegmentKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v41;

  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  v9 = -[CRLCanvasKnobTracker initWithRep:knob:](&v41, "initWithRep:knob:", v6, v7);
  if (v9)
  {
    objc_opt_class(CRLShapeRep, v8);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AB18);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E160C4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AB38);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 54, 0, "wrong rep class for line segment knob tracker");

    }
    if (objc_msgSend(v7, "tag") != (id)11 && objc_msgSend(v7, "tag") != (id)10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AB58);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E16044();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AB78);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 55, 0, "wrong knob for line segment knob tracker");

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
    v18 = objc_msgSend(v17, "pathIsLineSegment");

    if ((v18 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124AB98);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E15FC4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124ABB8);
      v19 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker initWithRep:knob:]"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 56, 0, "shape is not a line segment, but using line segment knob tracker");

    }
    v9[80] = 1;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "shapeRep"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "shapeLayout"));

    v24 = v9 + 128;
    if (objc_msgSend(v7, "tag") == (id)11)
    {
      objc_msgSend(v23, "unclippedHeadPoint");
      *v24 = v25;
      *((_QWORD *)v9 + 17) = v26;
      *((_OWORD *)v9 + 6) = *(_OWORD *)v24;
      objc_msgSend(v23, "unclippedTailPoint");
    }
    else
    {
      objc_msgSend(v23, "unclippedTailPoint");
      *v24 = v29;
      *((_QWORD *)v9 + 17) = v30;
      *((_OWORD *)v9 + 6) = *(_OWORD *)v24;
      objc_msgSend(v23, "unclippedHeadPoint");
    }
    *((_QWORD *)v9 + 14) = v27;
    *((_QWORD *)v9 + 15) = v28;
    objc_msgSend(v23, "unclippedTailPoint");
    v32 = v31;
    v34 = v33;
    objc_msgSend(v23, "unclippedHeadPoint");
    *((double *)v9 + 18) = sub_100061A8C(v32, v34, v35, v36, 0.5);
    *((_QWORD *)v9 + 19) = v37;
    objc_msgSend(v23, "pathBounds");
    *((_QWORD *)v9 + 20) = v38;
    *((_QWORD *)v9 + 21) = v39;

  }
  return (CRLShapeLineSegmentKnobTracker *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLShapeLineSegmentKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
  v3.receiver = self;
  v3.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  -[CRLCanvasKnobTracker dealloc](&v3, "dealloc");
}

- (id)currentGeometry
{
  void *v3;
  void *v4;
  unsigned int v5;
  int *v6;
  double *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CRLCanvasInfoGeometry *v14;
  CGAffineTransform v16;
  _OWORD v17[3];
  CGAffineTransform v18;
  CGAffineTransform v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker shapeRep](self, "shapeRep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shapeLayout"));

  v5 = -[CRLShapeLineSegmentKnobTracker resizeFromCenter](self, "resizeFromCenter");
  v6 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalFixedPoint;
  if (v5)
    v6 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalMiddlePoint;
  v7 = (double *)((char *)self + *v6);
  v8 = *v7;
  v9 = v7[1];
  memset(&v19, 0, sizeof(v19));
  sub_10007979C(0, (uint64_t)&v19, v8, v9, self->mOriginalKnobCenter.x, self->mOriginalKnobCenter.y, v8, v9, self->mNewKnobCenter.x, self->mNewKnobCenter.y);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalPureGeometry"));
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "transform");
  else
    memset(v17, 0, sizeof(v17));
  v16 = v19;
  sub_1000795C0(&v16, v17, &v18);
  v19 = v18;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalPureGeometry"));
  v18 = v19;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometryByTransformingBy:", &v18));
  v14 = -[CRLCanvasInfoGeometry initWithLayoutGeometry:]([CRLCanvasInfoGeometry alloc], "initWithLayoutGeometry:", v13);

  return v14;
}

- (void)beginMovingKnob
{
  void *v3;
  CRLShapeLayout *v4;
  CRLShapeLayout *mResizingLayout;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v6, "beginMovingKnob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker shapeRep](self, "shapeRep"));
  v4 = (CRLShapeLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicMoveLineSegmentDidBegin"));
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v4;

  -[CRLShapeLineSegmentKnobTracker performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_showHUDAndGuidesAfterDelay:", 0, 0.5);
}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  double y;
  double x;
  float64x2_t v9;
  CGAffineTransform v10;
  CGAffineTransform v11;

  y = a3.y;
  x = a3.x;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layout"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "originalTransformInRoot");
  else
    memset(&v10, 0, sizeof(v10));
  CGAffineTransformInvert(&v11, &v10);
  v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));

  -[CRLShapeLineSegmentKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:", *(_OWORD *)&v9);
}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  CGPoint *p_mNewKnobCenter;
  CGFloat v13;
  void *v14;
  unsigned int v15;
  int *v16;
  double *v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
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
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  void *v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  unsigned int v58;
  unsigned int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  unsigned int v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  void *v82;
  void *v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  uint64_t v88;
  CGFloat v89;
  void *v90;
  double v91;
  double v92;
  float64x2_t v93;
  double v94;
  CGAffineTransform v95;
  CGAffineTransform v96;
  CGAffineTransform v97;
  CGAffineTransform v98;
  float64x2_t v99;
  float64x2_t v100;
  float64x2_t v101;
  _OWORD v102[4];
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker shapeRep](self, "shapeRep"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "guideController"));

  if (-[CRLShapeLineSegmentKnobTracker snapEnabled](self, "snapEnabled"))
    v9 = !-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");
  else
    v9 = 0;
  if (-[CRLShapeLineSegmentKnobTracker snapAngles](self, "snapAngles"))
    v10 = !-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");
  else
    v10 = 0;
  v11 = v10;
  if (v9)
  {
    if (self->mBeganAlignmentOperation)
    {
      v11 = 1;
    }
    else
    {
      v11 = 1;
      if (objc_msgSend(v6, "wantsGuidesWhileResizing"))
      {
        objc_msgSend(v8, "beginAlignmentOperationForRep:", v6);
        self->mBeganAlignmentOperation = 1;
      }
    }
  }
  p_mNewKnobCenter = &self->mNewKnobCenter;
  self->mNewKnobCenter.x = sub_1000603D0(x, y, self->mOriginalPathBoundsOrigin.x);
  self->mNewKnobCenter.y = v13;
  -[CRLShapeLineSegmentKnobTracker p_enforceMinimumLength](self, "p_enforceMinimumLength");
  if (!v11)
  {
    v21 = -1;
    goto LABEL_30;
  }
  v14 = v8;
  v87 = p_mNewKnobCenter->x;
  v89 = self->mNewKnobCenter.y;
  v15 = -[CRLShapeLineSegmentKnobTracker resizeFromCenter](self, "resizeFromCenter");
  v16 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalFixedPoint;
  if (v15)
    v16 = &OBJC_IVAR___CRLShapeLineSegmentKnobTracker_mOriginalMiddlePoint;
  v17 = (double *)((char *)self + *v16);
  v92 = *v17;
  v18 = sub_10006108C(p_mNewKnobCenter->x, self->mNewKnobCenter.y, *v17, v17[1]);
  v19 = 0;
  v20 = 3.40282347e38;
  v21 = -1;
  do
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "originalPureGeometry"));
    v24 = v23;
    if (v23)
      objc_msgSend(v23, "transform");
    else
      memset(v102, 0, 48);
    v25 = sub_1000791B0(v102);
    v26 = sub_100061F64((double)v19 * 0.785398163 + v25 / -180.0 * 3.14159265);
    v28 = sub_1000603DC(v26, v27, v18);
    v30 = v29;

    v31 = sub_1000603D0(v28, v30, v92);
    v33 = v32;
    v34 = sub_10006108C(v31, v32, p_mNewKnobCenter->x, self->mNewKnobCenter.y);
    if ((v10 & 1) != 0)
    {
      if (v34 >= v20)
        goto LABEL_22;
LABEL_21:
      v87 = v31;
      v89 = v33;
      v20 = v34;
      v21 = v19;
      goto LABEL_22;
    }
    if (v34 < (double)7 * 1.5 && v34 < v20)
      goto LABEL_21;
LABEL_22:
    ++v19;
  }
  while (v19 != 8);
  p_mNewKnobCenter->x = v87;
  self->mNewKnobCenter.y = v89;
  v8 = v14;
LABEL_30:
  objc_msgSend(v6, "dynamicallyMovingLineSegmentWithTracker:", self);
  -[CRLShapeLineSegmentKnobTracker p_validateLayout](self, "p_validateLayout");
  if (v9 && self->mBeganAlignmentOperation)
  {
    -[CRLShapeLayout alignmentFrame](self->mResizingLayout, "alignmentFrame");
    v37 = v36;
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "originalPureGeometry"));
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "transform");
      v47 = v99;
      v48 = v100;
      v49 = v101;
    }
    else
    {
      v49 = 0uLL;
      v100 = 0u;
      v101 = 0u;
      v99 = 0u;
      v47 = 0uLL;
      v48 = 0uLL;
    }
    v93 = vaddq_f64(v49, vmlaq_n_f64(vmulq_n_f64(v48, self->mNewKnobCenter.y), v47, p_mNewKnobCenter->x));

    v103.origin.x = v37;
    v103.origin.y = v39;
    v103.size.width = v41;
    v103.size.height = v43;
    v50 = vabdd_f64(v93.f64[0], CGRectGetMinX(v103));
    v104.origin.x = v37;
    v104.origin.y = v39;
    v104.size.width = v41;
    v104.size.height = v43;
    v51 = vabdd_f64(v93.f64[0], CGRectGetMaxX(v104));
    v105.origin.x = v37;
    v105.origin.y = v39;
    v105.size.width = v41;
    v105.size.height = v43;
    v52 = vabdd_f64(v93.f64[1], CGRectGetMinY(v105));
    v106.origin.x = v37;
    v106.origin.y = v39;
    v106.size.width = v41;
    v106.size.height = v43;
    v53 = vabdd_f64(v93.f64[1], CGRectGetMaxY(v106));
    v54 = 7;
    if (v52 < v53)
      v54 = 1;
    v55 = 9;
    if (v52 < v53)
      v55 = 3;
    if (v50 >= v51)
      v56 = v55;
    else
      v56 = v54;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v58 = objc_msgSend(v57, "wantsGuidesWhileResizing");

    if (v58)
    {
      v88 = v56;
      v90 = v8;
      v59 = -[CRLShapeLineSegmentKnobTracker resizeFromCenter](self, "resizeFromCenter");
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "interactiveCanvasController"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "canvasBackground"));

      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "alignmentProvider"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "interactiveCanvasController"));
      v66 = objc_msgSend(v65, "isCanvasBackgroundAlignmentSnappingEnabled");

      if (v66 && v63)
      {
        objc_msgSend(v63, "alignmentPointForPoint:", *(_OWORD *)&v93);
        v85 = v68;
        v86 = v67;
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
        v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "originalPureGeometry"));
        v71 = v70;
        if (v70)
          objc_msgSend(v70, "transform");
        else
          memset(&v97, 0, sizeof(v97));
        CGAffineTransformInvert(&v98, &v97);
        *(float64x2_t *)p_mNewKnobCenter = vaddq_f64(*(float64x2_t *)&v98.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v98.c, v85), *(float64x2_t *)&v98.a, v86));

        -[CRLShapeLineSegmentKnobTracker p_enforceMinimumLength](self, "p_enforceMinimumLength");
        objc_msgSend(v6, "dynamicallyMovingLineSegmentWithTracker:", self);
        v72 = CGPointZero.x;
        v73 = CGPointZero.y;
        v56 = v88;
        v8 = v90;
      }
      else
      {
        v56 = v88;
        v8 = v90;
        objc_msgSend(v90, "snapRectToGuides:forKnobTag:snapSize:", v88, v59 ^ 1, v37, v39, v41, v43);
        v72 = v74;
        v73 = v75;
      }

    }
    else
    {
      v72 = CGPointZero.x;
      v73 = CGPointZero.y;
    }
    switch(v21)
    {
      case 0:
      case 4:
        v73 = 0.0;
        break;
      case 1:
      case 5:
        if (fabs(v72) <= fabs(v73))
          v72 = v73;
        v73 = v72;
        break;
      case 2:
      case 6:
        v72 = 0.0;
        break;
      case 3:
      case 7:
        if (fabs(v72) <= fabs(v73))
          v72 = -v73;
        else
          v73 = -v72;
        break;
      default:
        break;
    }
    if (v72 != CGPointZero.x || v73 != CGPointZero.y)
    {
      v76 = sub_1000603D0(v93.f64[0], v93.f64[1], v72);
      v91 = v77;
      v94 = v76;
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "originalPureGeometry"));
      v80 = v79;
      if (v79)
        objc_msgSend(v79, "transform");
      else
        memset(&v95, 0, sizeof(v95));
      CGAffineTransformInvert(&v96, &v95);
      *(float64x2_t *)p_mNewKnobCenter = vaddq_f64(*(float64x2_t *)&v96.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v96.c, v91), *(float64x2_t *)&v96.a, v94));

      -[CRLShapeLineSegmentKnobTracker p_enforceMinimumLength](self, "p_enforceMinimumLength");
      switch(v56)
      {
        case 1:
          v37 = sub_1000603D0(v37, v39, v72);
          v39 = v81;
          v41 = v41 - v72;
          v43 = v43 - v73;
          break;
        case 3:
          v39 = v39 + v73;
          v43 = v43 - v73;
          v41 = v41 + v72;
          break;
        case 7:
          v37 = v37 + v72;
          v41 = v41 - v72;
          goto LABEL_82;
        case 9:
          v41 = v41 + v72;
LABEL_82:
          v43 = v43 + v73;
          break;
        default:
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124ABD8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E16144();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124ABF8);
          v82 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeLineSegmentKnobTracker moveKnobToRepPosition:]"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLShapeLineSegmentKnobTracker.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v83, v84, 263, 0, "wrong knob type for line segment resize");

          break;
      }
      objc_msgSend(v6, "dynamicallyMovingLineSegmentWithTracker:", self);
      -[CRLShapeLineSegmentKnobTracker p_validateLayout](self, "p_validateLayout");
    }
    -[CRLShapeLineSegmentKnobTracker p_enforceMinimumLength](self, "p_enforceMinimumLength");
    if (-[CRLShapeLineSegmentKnobTracker shouldDisplayGuides](self, "shouldDisplayGuides"))
      objc_msgSend(v8, "showGuidesAlignedWithRect:forKnobTag:shouldRenderX:shouldRenderY:shouldRenderSizeGuides:", v56, 1, 1, -[CRLShapeLineSegmentKnobTracker resizeFromCenter](self, "resizeFromCenter") ^ 1, v37, v39, v41, v43);
    else
      objc_msgSend(v8, "hideAlignmentGuides");
  }
  else
  {
    objc_msgSend(v8, "hideAlignmentGuides");
    objc_msgSend(v8, "hideSizingGuides");
  }
  objc_msgSend(v6, "invalidateKnobPositions");
  -[CRLShapeLineSegmentKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
  -[CRLShapeLineSegmentKnobTracker p_updateHUD](self, "p_updateHUD");

}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)didChangeGeometry
{
  return 1;
}

- (BOOL)shouldHideOtherKnobs
{
  objc_super v4;

  if (-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  return -[CRLCanvasKnobTracker shouldHideOtherKnobs](&v4, "shouldHideOtherKnobs");
}

- (void)endMovingKnob
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v12;
  uint64_t v13;
  objc_class *v14;
  id v15;
  void *v16;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v17;
  void *v18;
  void *v19;
  CRLCanvasCommandSelectionBehavior *v20;
  void *v21;
  CRLCanvasCommandSelectionBehavior *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker shapeRep](self, "shapeRep"));
  v4 = -[CRLShapeLineSegmentKnobTracker didChangeGeometry](self, "didChangeGeometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
  v8 = objc_msgSend(v7, "groupingLevel");
  if (v8)
  {
    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v20 = [CRLCanvasCommandSelectionBehavior alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
  v22 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v20, "initWithCanvasEditor:", v21);

  objc_msgSend(v7, "openGroupWithSelectionBehavior:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Resize"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v7, "setCurrentGroupActionString:", v24);

  if (v4)
  {
LABEL_3:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker currentGeometry](self, "currentGeometry"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infoForTransforming"));

    v12 = [_TtC8Freeform25CRLCommandSetInfoGeometry alloc];
    objc_opt_class(_TtC8Freeform12CRLBoardItem, v13);
    v15 = sub_1002223BC(v14, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:](v12, "initWithBoardItem:geometry:", v16, v9);

    objc_msgSend(v7, "enqueueCommand:", v17);
  }
LABEL_4:
  objc_msgSend(v3, "dynamicMoveLineSegmentDidEndWithTracker:", self);
  if (!v8)
    objc_msgSend(v7, "closeGroup");
  if (self->mBeganAlignmentOperation)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "guideController"));
    objc_msgSend(v19, "endAlignmentOperation");

  }
  -[CRLShapeLineSegmentKnobTracker p_cancelDelayedHUDAndGuides](self, "p_cancelDelayedHUDAndGuides");
  -[CRLShapeLineSegmentKnobTracker p_hideHUD](self, "p_hideHUD");
  v25.receiver = self;
  v25.super_class = (Class)CRLShapeLineSegmentKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v25, "endMovingKnob");

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

- (void)p_enforceMinimumLength
{
  double x;
  double y;
  CGPoint *p_mNewKnobCenter;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;

  x = self->mOriginalFixedPoint.x;
  y = self->mOriginalFixedPoint.y;
  p_mNewKnobCenter = &self->mNewKnobCenter;
  v5 = self->mNewKnobCenter.x;
  v6 = self->mNewKnobCenter.y;
  v7 = sub_10006108C(x, y, v5, v6);
  v8 = 1.0;
  if (v7 < 1.0)
  {
    v9 = 0.0;
    if (v7 >= 0.00999999978)
    {
      v10 = sub_1000603B8(v5, v6, x);
      v8 = sub_100060398(v10, v11);
    }
    v12 = sub_1000603DC(v8, v9, 1.0);
    p_mNewKnobCenter->x = sub_1000603D0(x, y, v12);
    p_mNewKnobCenter->y = v13;
  }
}

- (id)p_HUDLabelText
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker currentGeometry](self, "currentGeometry"));
  v4 = sub_10006108C(self->mOriginalFixedPoint.x, self->mOriginalFixedPoint.y, self->mNewKnobCenter.x, self->mNewKnobCenter.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
  objc_msgSend(v3, "angle");
  v8 = objc_msgSend(v6, "unitStringForAngle:andLength:", sub_1003C65A0(v7), v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)p_updateHUD
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeLineSegmentKnobTracker p_HUDLabelText](self, "p_HUDLabelText"));
    objc_msgSend(v4, "setLabelText:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
    -[CRLCanvasKnobTracker currentPosition](self, "currentPosition");
    objc_msgSend(v7, "convertUnscaledToBoundsPoint:");
    objc_msgSend(v4, "showHUDForKey:forTouchPoint:inCanvasView:withUpwardsNudge:", self, v6);

  }
}

- (void)p_hideHUD
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasHUDController sharedHUDController](CRLCanvasHUDController, "sharedHUDController"));
  objc_msgSend(v3, "hideHUDForKey:", self);

}

- (void)p_cancelDelayedHUDAndGuides
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_showHUDAndGuidesAfterDelay:", 0);
}

- (BOOL)snapEnabled
{
  return self->mSnapEnabled;
}

- (void)setSnapEnabled:(BOOL)a3
{
  self->mSnapEnabled = a3;
}

- (BOOL)snapAngles
{
  return self->mSnapAngles;
}

- (void)setSnapAngles:(BOOL)a3
{
  self->mSnapAngles = a3;
}

- (BOOL)resizeFromCenter
{
  return self->mResizeFromCenter;
}

- (void)setResizeFromCenter:(BOOL)a3
{
  self->mResizeFromCenter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mResizingLayout, 0);
}

@end
