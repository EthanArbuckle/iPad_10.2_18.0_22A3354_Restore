@implementation CRLConnectionLineKnobTracker

- (CRLConnectionLineKnobTracker)initWithRep:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  CRLConnectionLineKnobTracker *v8;
  CRLConnectionLineKnobTracker *v9;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  uint64_t v11;
  double v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD *p_x;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  uint64_t v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)CRLConnectionLineKnobTracker;
  v8 = -[CRLCanvasKnobTracker initWithRep:knob:](&v35, "initWithRep:knob:", v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->mSnapEnabled = 1;
    mSnappedMagnet = v8->mSnappedMagnet;
    v8->mSnappedMagnet = 0;

    v9->mKnobTag = 0;
    v9->mKnobMoved = 1;
    v9->mShouldSnapToMagnets = 1;
    *(_QWORD *)&v12 = objc_opt_class(CRLConnectionLineAbstractLayout, v11).n128_u64[0];
    v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout", v12));
    v16 = sub_1002223BC(v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    p_x = (_QWORD *)&v9->mOriginalKnobCenterNaturalSpace.x;
    if (objc_msgSend(v7, "tag") == (id)11)
    {
      objc_msgSend(v17, "unclippedHeadPoint");
      *p_x = v19;
      v9->mOriginalKnobCenterNaturalSpace.y = v20;
      v9->mNewKnobCenterNaturalSpace = *(CGPoint *)p_x;
      objc_msgSend(v17, "unclippedTailPoint");
    }
    else
    {
      objc_msgSend(v17, "unclippedTailPoint");
      *p_x = v23;
      v9->mOriginalKnobCenterNaturalSpace.y = v24;
      v9->mNewKnobCenterNaturalSpace = *(CGPoint *)p_x;
      objc_msgSend(v17, "unclippedHeadPoint");
    }
    v9->mOriginalFixedPointNaturalSpace.x = v21;
    v9->mOriginalFixedPointNaturalSpace.y = v22;
    objc_msgSend(v17, "unclippedTailPoint");
    v26 = v25;
    v28 = v27;
    objc_msgSend(v17, "unclippedHeadPoint");
    v9->mOriginalMiddlePointNaturalSpace.x = sub_100061A8C(v26, v28, v29, v30, 0.5);
    v9->mOriginalMiddlePointNaturalSpace.y = v31;
    objc_msgSend(v17, "pathBounds");
    v9->mOriginalPathToBoundsOrigin.x = v32;
    v9->mOriginalPathToBoundsOrigin.y = v33;

  }
  return v9;
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

- (void)beginMovingKnob
{
  uint64_t v3;
  double v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  CRLCanvasLayout *v11;
  CRLCanvasLayout *mOriginalConnectedFrom;
  CRLCanvasLayout *v13;
  CRLCanvasLayout *mOriginalConnectedTo;
  void *v15;
  uint64_t v16;
  double v17;
  objc_class *v18;
  objc_class *v19;
  void *v20;
  id v21;
  CRLConnectionLineAbstractLayout *v22;
  CRLConnectionLineAbstractLayout *mResizingLayout;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  CGFloat v28;
  CGFloat v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  CRLCommandSelectionBehavior *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)CRLConnectionLineKnobTracker;
  -[CRLCanvasKnobTracker beginMovingKnob](&v43, "beginMovingKnob");
  *(_QWORD *)&v4 = objc_opt_class(CRLConnectionLineAbstractLayout, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
  v9 = sub_1002223BC(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedFrom"));
  mOriginalConnectedFrom = self->mOriginalConnectedFrom;
  self->mOriginalConnectedFrom = v11;

  v13 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedTo"));
  mOriginalConnectedTo = self->mOriginalConnectedTo;
  self->mOriginalConnectedTo = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  *(_QWORD *)&v17 = objc_opt_class(CRLConnectionLineAbstractLayout, v16).n128_u64[0];
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicMoveSmartShapeKnobDidBegin", v17));
  v21 = sub_1002223BC(v19, v20);
  v22 = (CRLConnectionLineAbstractLayout *)objc_claimAutoreleasedReturnValue(v21);
  mResizingLayout = self->mResizingLayout;
  self->mResizingLayout = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  self->mKnobsVisible = objc_msgSend(v24, "shouldCreateKnobs");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  if (objc_msgSend(v25, "tag") == (id)11 && self->mOriginalConnectedTo)
  {
    self->mInitialSnap = 1;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v27 = objc_msgSend(v26, "tag") == (id)10 && self->mOriginalConnectedFrom != 0;
    self->mInitialSnap = v27;

  }
  -[CRLCanvasKnobTracker currentPosition](self, "currentPosition");
  self->mInitialPosition.x = v28;
  self->mInitialPosition.y = v29;
  if (v10)
  {
    objc_msgSend(v10, "transformInRoot");
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v40 = 0u;
  }
  *(_OWORD *)&self->mOriginalTransformInRoot.a = v40;
  *(_OWORD *)&self->mOriginalTransformInRoot.c = v41;
  *(_OWORD *)&self->mOriginalTransformInRoot.tx = v42;
  self->mKnobTag = 0;
  self->mKnobMoved = 0;
  self->mKnobPosition = (CGPoint)xmmword_100EEC438;
  self->mKnobPositionAtStart = (CGPoint)xmmword_100EEC438;
  objc_msgSend(v10, "setDrawClippedHeadPortion:", 0, v40, v41, v42);
  objc_msgSend(v10, "setDrawClippedTailPortion:", 0);
  objc_msgSend(v10, "setControlKnobPositionChangedFromRouting:", 0);
  if (self->mIsEnqueueingCommandsInRealTime)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "interactiveCanvasController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "commandController"));

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "interactiveCanvasController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "editorController"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "selectionPath"));

    v37 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v36, v36);
    objc_msgSend(v32, "openGroupWithSelectionBehavior:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Move"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v32, "setCurrentGroupActionString:", v39);

    objc_msgSend(v32, "enableRealTimeSyncProgressiveEnqueuingInCurrentGroup");
  }

}

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  void *v4;
  unint64_t mKnobTag;
  CGPoint *p_mKnobPosition;
  CGPoint *p_mKnobPositionAtStart;
  double v8;
  double y;
  _BOOL4 v10;
  double v11;
  double v12;
  __int128 v13;
  int mKnobsVisible;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  double v21;
  double x;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v20 = *(__int128 *)&a3.y;
  x = a3.x;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  self->mKnobTag = (unint64_t)objc_msgSend(v4, "tag");

  mKnobTag = self->mKnobTag;
  if (mKnobTag - 10 >= 2)
  {
    if (mKnobTag == 12)
      -[CRLConnectionLineKnobTracker p_setUserAdjustedShapeControlKnob:](self, "p_setUserAdjustedShapeControlKnob:", 1);
  }
  else
  {
    p_mKnobPosition = &self->mKnobPosition;
    self->mKnobPosition.x = x;
    *(_QWORD *)&self->mKnobPosition.y = v20;
    p_mKnobPositionAtStart = &self->mKnobPositionAtStart;
    v8 = self->mKnobPositionAtStart.x;
    y = self->mKnobPositionAtStart.y;
    v10 = sub_100061890(v8, y);
    v12 = *(double *)&v20;
    v11 = x;
    if (v10)
    {
      *p_mKnobPositionAtStart = *p_mKnobPosition;
      v8 = p_mKnobPositionAtStart->x;
      y = self->mKnobPositionAtStart.y;
      v11 = p_mKnobPosition->x;
      v12 = self->mKnobPosition.y;
    }
    if (sub_10006108C(v8, y, v11, v12) > 10.0)
    {
      self->mKnobMoved = 1;
      -[CRLConnectionLineKnobTracker p_setUserAdjustedShapeControlKnob:](self, "p_setUserAdjustedShapeControlKnob:", 0);
    }
    -[CRLConnectionLineKnobTracker p_retrieveMagnetsForLayoutsNearKnob](self, "p_retrieveMagnetsForLayoutsNearKnob");
    -[CRLConnectionLineKnobTracker p_snapToNearestMagnetFromKnob](self, "p_snapToNearestMagnetFromKnob");
    if (!self->mSnappedMagnet)
      -[CRLConnectionLineKnobTracker p_createFloatingOrEdgeMagnetAtKnob](self, "p_createFloatingOrEdgeMagnetAtKnob");
    -[CRLConnectionLineKnobTracker p_updateConnection](self, "p_updateConnection");
    -[CRLConnectionLineKnobTracker p_updateLayout](self, "p_updateLayout");
    -[CRLConnectionLineKnobTracker p_updateMagnetRenderables](self, "p_updateMagnetRenderables");
    x = p_mKnobPosition->x;
    *(CGFloat *)&v13 = self->mKnobPosition.y;
    v20 = v13;
  }
  mKnobsVisible = self->mKnobsVisible;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v20));
  v16 = objc_msgSend(v15, "shouldCreateKnobs");

  if (mKnobsVisible != v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    self->mKnobsVisible = objc_msgSend(v17, "shouldCreateKnobs");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    objc_msgSend(v18, "invalidateKnobs");

  }
  v19 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
  *(_OWORD *)&v23.a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
  *(_OWORD *)&v23.c = v19;
  *(_OWORD *)&v23.tx = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
  CGAffineTransformInvert(&v24, &v23);
  -[CRLConnectionLineKnobTracker moveKnobToRepPosition:](self, "moveKnobToRepPosition:", vaddq_f64(*(float64x2_t *)&v24.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v24.c, v21), *(float64x2_t *)&v24.a, x)));
}

- (void)p_retrieveMagnetsForLayoutsNearKnob
{
  void *v2;
  NSMutableSet *v4;
  NSMutableSet *mMagnets;
  CRLCanvasLayout **p_mLayoutUnderKnob;
  CRLCanvasLayout *mLayoutUnderKnob;
  CGPoint *p_mKnobPosition;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v23;
  void *v24;
  unsigned int v25;
  unint64_t mKnobTag;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  CRLCanvasLayout *v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  uint64_t v37;
  CGPoint v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  mMagnets = self->mMagnets;
  self->mMagnets = v4;

  p_mLayoutUnderKnob = &self->mLayoutUnderKnob;
  mLayoutUnderKnob = self->mLayoutUnderKnob;
  self->mLayoutUnderKnob = 0;

  v37 = 0;
  p_mKnobPosition = &self->mKnobPosition;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v37, self->mKnobPosition.x + -50.0, self->mKnobPosition.y + -50.0, 100.0, 100.0));
  if (v9)
  {
    -[CRLConnectionLineKnobTracker p_retrieveMagnetPositionsForLayout:](self, "p_retrieveMagnetPositionsForLayout:", v9);
    objc_msgSend(v9, "boundsForStandardKnobs");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
    v2 = v18;
    if (v18)
      objc_msgSend(v18, "transform");
    else
      memset(&v36, 0, sizeof(v36));
    v39.origin.x = v11;
    v39.origin.y = v13;
    v39.size.width = v15;
    v39.size.height = v17;
    v40 = CGRectApplyAffineTransform(v39, &v36);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;

    v38.x = p_mKnobPosition->x;
    v38.y = self->mKnobPosition.y;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (CGRectContainsPoint(v41, v38))
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "convexHullPath"));
      if (!v2)
        goto LABEL_11;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
      v24 = v23;
      if (v23)
        objc_msgSend(v23, "transform");
      else
        memset(&v34, 0, sizeof(v34));
      CGAffineTransformInvert(&v35, &v34);
      v25 = objc_msgSend(v2, "containsPoint:", vaddq_f64(*(float64x2_t *)&v35.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v35.c, self->mKnobPosition.y), *(float64x2_t *)&v35.a, p_mKnobPosition->x)));

      if (v25)
LABEL_11:
        objc_storeStrong((id *)&self->mLayoutUnderKnob, v9);

    }
  }
  if (!*p_mLayoutUnderKnob && !self->mKnobMoved)
  {
    mKnobTag = self->mKnobTag;
    if (mKnobTag == 10)
    {
      v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "connectedFrom"));
      if (v27)
      {

LABEL_24:
        v30 = self->mKnobTag;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx));
        v2 = v31;
        if (v30 == 10)
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedFrom"));
        else
          v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "connectedTo"));
        v33 = *p_mLayoutUnderKnob;
        *p_mLayoutUnderKnob = (CRLCanvasLayout *)v32;

        goto LABEL_28;
      }
      if (self->mKnobTag != 11)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    else if (mKnobTag != 11)
    {
      goto LABEL_29;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "connectedTo"));

    if (mKnobTag == 10)
    if (v29)
      goto LABEL_24;
  }
LABEL_29:
  -[CRLConnectionLineKnobTracker p_updateRoutingProperties](self, "p_updateRoutingProperties", *(_OWORD *)&v34.a, *(_OWORD *)&v34.c, *(_OWORD *)&v34.tx);

}

- (void)p_updateRoutingProperties
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
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
  void *v20;
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
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  double v37[3];
  uint64_t v38;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v38 = 0;
  objc_msgSend(v9, "headPoint");
  v11 = v10;
  v13 = v12;
  if (v9)
  {
    objc_msgSend(v9, "transform");
    v14 = *((double *)&v35 + 1);
    v15 = *(double *)&v35;
    v16 = *((double *)&v36 + 1);
    v17 = *(double *)&v36;
    v18 = v37[1];
    v19 = v37[0];
  }
  else
  {
    v36 = 0u;
    *(_OWORD *)v37 = 0u;
    v35 = 0u;
    v18 = 0.0;
    v16 = 0.0;
    v14 = 0.0;
    v19 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v38, v19 + v13 * v17 + v15 * v11 + -50.0, v18 + v13 * v16 + v14 * v11 + -50.0, 100.0, 100.0));
  objc_msgSend(v9, "setHeadNearestLayoutForRouting:", v20);

  objc_msgSend(v9, "setHeadNearestMagnetTypeForRouting:", v38);
  objc_msgSend(v9, "tailPoint");
  v22 = v21;
  v24 = v23;
  if (v9)
  {
    objc_msgSend(v9, "transform");
    v25 = *((double *)&v32 + 1);
    v26 = *(double *)&v32;
    v27 = *((double *)&v33 + 1);
    v28 = *(double *)&v33;
    v29 = *((double *)&v34 + 1);
    v30 = *(double *)&v34;
  }
  else
  {
    v33 = 0u;
    v34 = 0u;
    v32 = 0u;
    v29 = 0.0;
    v27 = 0.0;
    v25 = 0.0;
    v30 = 0.0;
    v28 = 0.0;
    v26 = 0.0;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker p_findLayoutWithNearestMagnetInRect:nearestMagnet:](self, "p_findLayoutWithNearestMagnetInRect:nearestMagnet:", &v38, v30 + v24 * v28 + v26 * v22 + -50.0, v29 + v24 * v27 + v25 * v22 + -50.0, 100.0, 100.0, v32, v33, v34, v35, v36, *(_OWORD *)v37));
  objc_msgSend(v9, "setTailNearestLayoutForRouting:", v31);

  objc_msgSend(v9, "setTailNearestMagnetTypeForRouting:", v38);
}

- (id)p_findLayoutWithNearestMagnetInRect:(CGRect)a3 nearestMagnet:(unint64_t *)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CRLCanvasLayout *v17;
  CRLCanvasLayout *mLayoutUnderKnob;
  CRLCanvasLayout *v19;
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  void *i;
  void *v25;
  unint64_t j;
  double v27;
  double v28;
  double v29;
  double v30;
  CRLCanvasLayout *v31;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  _BYTE v40[128];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvas"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutsInRect:", x, y, width, height));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100398F68;
  v39[3] = &unk_1012318E8;
  v39[4] = self;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hitRep:passingTest:", v39, self->mKnobPosition.x, self->mKnobPosition.y));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repForSelecting"));
    v17 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layout"));
    mLayoutUnderKnob = self->mLayoutUnderKnob;
    self->mLayoutUnderKnob = v17;

    v19 = self->mLayoutUnderKnob;
  }
  else if (self->mLayoutUnderKnob)
  {
    v19 = 0;
  }
  else
  {
    v33 = v13;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v13;
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v20)
    {
      v21 = v20;
      v19 = 0;
      v22 = *(_QWORD *)v36;
      v23 = 1.79769313e308;
      do
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v22)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          if (-[CRLConnectionLineKnobTracker p_isValidConnectionDestination:](self, "p_isValidConnectionDestination:", v25))
          {
            for (j = 2; j != 6; ++j)
            {
              objc_msgSend(v25, "getCardinalPositionWithParentTransformFromType:", j);
              v29 = sub_10006108C(self->mKnobPosition.x, self->mKnobPosition.y, v27, v28);
              if (v29 < v23)
              {
                v30 = v29;
                v31 = v25;

                *a4 = j;
                v19 = v31;
                v23 = v30;
              }
            }
          }
        }
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v21);
    }
    else
    {
      v19 = 0;
    }

    v15 = 0;
    v13 = v33;
  }

  return v19;
}

- (void)p_retrieveMagnetPositionsForLayout:(id)a3
{
  id v4;
  NSMutableSet *mMagnets;
  CRLConnectionLineMagnetInfo *v6;
  CRLConnectionLineMagnetInfo *v7;
  uint64_t i;
  double v9;
  double v10;
  double v11;
  double v12;
  NSMutableSet *v13;
  CRLConnectionLineMagnetInfo *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v4 = a3;
  mMagnets = self->mMagnets;
  v6 = [CRLConnectionLineMagnetInfo alloc];
  objc_msgSend(v4, "getCardinalPositionWithParentTransformFromType:", 1);
  v7 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v6, "initWithType:position:layout:connected:", 1, v4, 0);
  -[NSMutableSet addObject:](mMagnets, "addObject:", v7);

  for (i = 2; i != 6; ++i)
  {
    objc_msgSend(v4, "getCardinalPositionWithParentTransformFromType:", i);
    v10 = v9;
    v12 = v11;
    if (-[CRLConnectionLineKnobTracker p_shouldIncludeCardinalMagnet:forLayout:](self, "p_shouldIncludeCardinalMagnet:forLayout:", i, v4))
    {
      v13 = self->mMagnets;
      v14 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:]([CRLConnectionLineMagnetInfo alloc], "initWithType:position:layout:connected:", i, v4, 0, v10, v12);
      -[NSMutableSet addObject:](v13, "addObject:", v14);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedLayouts"));

  if (v15)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedLayouts", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layout"));

          if (v21 != v23)
            -[CRLConnectionLineKnobTracker p_updateMagnetPositionsForConnectionLineLayout:withinLayout:](self, "p_updateMagnetPositionsForConnectionLineLayout:withinLayout:", v21, v4);
          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v18);
    }

  }
}

- (BOOL)p_shouldIncludeCardinalMagnet:(unint64_t)a3 forLayout:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  unint64_t i;
  double v12;
  double v13;

  v5 = a4;
  objc_msgSend(v5, "getCardinalPositionWithParentTransformFromType:", a3);
  v7 = v6;
  v9 = v8;
  v10 = 0;
  for (i = 1; i != 6; ++i)
  {
    if (a3 != i)
    {
      objc_msgSend(v5, "getCardinalPositionWithParentTransformFromType:", i);
      if (sub_10006108C(v7, v9, v12, v13) < 10.0)
        break;
    }
    v10 = i > 4;
  }

  return v10;
}

- (void)p_updateMagnetPositionsForConnectionLineLayout:(id)a3 withinLayout:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CRLConnectionLineMagnetInfo *v14;
  id v15;
  void *v16;
  CRLConnectionLineMagnetInfo *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CRLConnectionLineMagnetInfo *v25;
  id v26;
  void *v27;
  CRLConnectionLineMagnetInfo *v28;
  id v29;

  v29 = a3;
  v6 = a4;
  if (objc_msgSend(v29, "headMagnetType"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedTo"));

    if (v7)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedTo"));

      if (v8 == v6)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedTo"));
        objc_msgSend(v29, "headMagnetCanvasPosition");
        -[CRLConnectionLineKnobTracker p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:](self, "p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:", v9);
        v11 = v10;
        v13 = v12;

        v14 = [CRLConnectionLineMagnetInfo alloc];
        v15 = objc_msgSend(v29, "headMagnetType");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedTo"));
        v17 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v14, "initWithType:position:layout:connected:", v15, v16, 1, v11, v13);

        -[NSMutableSet addObject:](self->mMagnets, "addObject:", v17);
      }
    }
  }
  if (objc_msgSend(v29, "tailMagnetType"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedFrom"));

    if (v18)
    {
      v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedFrom"));

      if (v19 == v6)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedFrom"));
        objc_msgSend(v29, "tailMagnetCanvasPosition");
        -[CRLConnectionLineKnobTracker p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:](self, "p_getMagnetPositionAdjustedToParentForLayout:withOriginalMagnetPosition:", v20);
        v22 = v21;
        v24 = v23;

        v25 = [CRLConnectionLineMagnetInfo alloc];
        v26 = objc_msgSend(v29, "tailMagnetType");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "connectedFrom"));
        v28 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v25, "initWithType:position:layout:connected:", v26, v27, 1, v22, v24);

        -[NSMutableSet addObject:](self->mMagnets, "addObject:", v28);
      }
    }
  }

}

- (CGPoint)p_getMagnetPositionAdjustedToParentForLayout:(id)a3 withOriginalMagnetPosition:(CGPoint)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  float64x2_t v11;
  __int128 v12;
  CGPoint v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  CGPoint result;

  v12 = *(__int128 *)&a4.y;
  v13 = a4;
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parent", v12, v13));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometryInRoot"));
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "transform");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }

  }
  else
  {
    v14 = *(float64x2_t *)&CGAffineTransformIdentity.a;
    v15 = *(float64x2_t *)&CGAffineTransformIdentity.c;
    v16 = *(float64x2_t *)&CGAffineTransformIdentity.tx;
  }

  v11 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v12), v14, v13.x));
  v10 = v11.f64[1];
  v9 = v11.f64[0];
  result.y = v10;
  result.x = v9;
  return result;
}

- (void)p_snapToNearestMagnetFromKnob
{
  double v3;
  double v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v20;
  id v21;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  CGPoint *p_mKnobPosition;
  CGFloat v24;
  CGFloat v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  -[CRLConnectionLineKnobTracker p_getMagnetSnappingDistance](self, "p_getMagnetSnappingDistance");
  v4 = v3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = self->mMagnets;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v27;
    v10 = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout", (_QWORD)v26));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layout"));

        if (v13 != v15)
        {
          objc_msgSend(v12, "position");
          v18 = sub_10006108C(self->mKnobPosition.x, self->mKnobPosition.y, v16, v17);
          if (v18 < v4 && v18 < v10)
          {
            v20 = v18;
            v21 = v12;

            v10 = v20;
            v8 = v21;
          }
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  objc_storeStrong((id *)&self->mSnappedMagnet, v8);
  -[CRLConnectionLineKnobTracker p_snapToCenterIfLayoutHasConnectionWithoutMagnet](self, "p_snapToCenterIfLayoutHasConnectionWithoutMagnet");
  mSnappedMagnet = self->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    p_mKnobPosition = &self->mKnobPosition;
    -[CRLConnectionLineMagnetInfo position](mSnappedMagnet, "position");
    p_mKnobPosition->x = v24;
    p_mKnobPosition->y = v25;
  }

}

- (void)p_snapToCenterIfLayoutHasConnectionWithoutMagnet
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t mKnobTag;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  CRLConnectionLineMagnetInfo *v14;
  CRLConnectionLineMagnetInfo *v15;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  id v17;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = sub_100221D0C(v5, v7);
  v17 = (id)objc_claimAutoreleasedReturnValue(v8);

  mKnobTag = self->mKnobTag;
  if (mKnobTag != 11)
  {
LABEL_4:
    if (mKnobTag != 10)
      goto LABEL_14;
    if (objc_msgSend(v17, "tailMagnetType"))
      goto LABEL_14;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedFrom"));

    if (!v10)
      goto LABEL_14;
    goto LABEL_10;
  }
  if (objc_msgSend(v17, "headMagnetType")
    || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedTo"))) == 0)
  {
    mKnobTag = self->mKnobTag;
    goto LABEL_4;
  }

LABEL_10:
  if (self->mKnobTag == 11)
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedTo"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "connectedFrom"));
  v13 = (void *)v12;
  v14 = [CRLConnectionLineMagnetInfo alloc];
  objc_msgSend(v13, "getCardinalPositionWithParentTransformFromType:", 1);
  v15 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v14, "initWithType:position:layout:connected:", 1, v13, 1);
  mSnappedMagnet = self->mSnappedMagnet;
  self->mSnappedMagnet = v15;

LABEL_14:
}

- (double)p_getMagnetSnappingDistance
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  if (!self->mShouldSnapToMagnets)
    return 0.0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));
  objc_msgSend(v3, "viewScale");
  v5 = 10.0 / v4 * 2.5;

  return v5;
}

+ (double)crlaxConnectionLineMagnetSnapRadiusForCanvasViewScale:(double)a3
{
  return 10.0 / a3 * 2.5;
}

- (void)p_createFloatingOrEdgeMagnetAtKnob
{
  double v3;
  CRLCanvasLayout *mLayoutUnderKnob;
  double v5;
  CGPoint *p_mKnobPosition;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CRLConnectionLineMagnetInfo *v12;
  CRLCanvasLayout *v13;
  CRLConnectionLineMagnetInfo *v14;
  CRLConnectionLineMagnetInfo *v15;
  CRLConnectionLineMagnetInfo *v16;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;

  -[CRLConnectionLineKnobTracker p_getMagnetSnappingDistance](self, "p_getMagnetSnappingDistance");
  mLayoutUnderKnob = self->mLayoutUnderKnob;
  if (mLayoutUnderKnob)
  {
    v5 = v3;
    p_mKnobPosition = &self->mKnobPosition;
    -[CRLCanvasLayout nearestEdgePointOnWrapPathFromPoint:](mLayoutUnderKnob, "nearestEdgePointOnWrapPathFromPoint:", self->mKnobPosition.x, self->mKnobPosition.y);
    v8 = v7;
    v10 = v9;
    v11 = sub_10006108C(self->mKnobPosition.x, self->mKnobPosition.y, v7, v9);
    v12 = [CRLConnectionLineMagnetInfo alloc];
    v13 = self->mLayoutUnderKnob;
    if (v11 >= v5)
    {
      v16 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v12, "initWithType:position:layout:connected:", 7, v13, 1, p_mKnobPosition->x, self->mKnobPosition.y);
      mSnappedMagnet = self->mSnappedMagnet;
      self->mSnappedMagnet = v16;

    }
    else
    {
      v14 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v12, "initWithType:position:layout:connected:", 6, v13, 1, v8, v10);
      v15 = self->mSnappedMagnet;
      self->mSnappedMagnet = v14;

      p_mKnobPosition->x = v8;
      self->mKnobPosition.y = v10;
    }
  }
}

- (void)p_updateConnection
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  CRLCanvasRep *mConnectedRepForHighlighting;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  CRLCanvasRep *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  CRLConnectionLineMagnet *v48;
  unint64_t v49;
  CRLConnectionLineMagnet *v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v61;
  void *v62;
  void *v63;
  id v64;
  BOOL v65;
  void *v66;
  CRLConnectionLineMagnet *v67;
  unint64_t v68;
  CRLConnectionLineMagnet *v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  _QWORD v80[4];
  id v81;
  CRLConnectionLineKnobTracker *v82;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));

  if (!self->mSnappedMagnet)
  {
    if (!self->mKnobMoved)
      goto LABEL_27;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    if (objc_msgSend(v7, "tag") == (id)11)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));

      if (v8)
      {
        objc_msgSend(v4, "setConnectedTo:", 0);
        objc_msgSend(v4, "setHeadMagnetType:", 0);
LABEL_25:
        mConnectedRepForHighlighting = self->mConnectedRepForHighlighting;
        self->mConnectedRepForHighlighting = 0;
        goto LABEL_26;
      }
    }
    else
    {

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    if (objc_msgSend(v19, "tag") == (id)10)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));

      if (v20)
      {
        objc_msgSend(v4, "setConnectedFrom:", 0);
        objc_msgSend(v4, "setTailMagnetType:", 0);
      }
    }
    else
    {

    }
    goto LABEL_25;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  if (objc_msgSend(v5, "tag") == (id)11)
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
  else
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
  mConnectedRepForHighlighting = (CRLCanvasRep *)v6;

  if (mConnectedRepForHighlighting)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForLayout:", mConnectedRepForHighlighting));
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong((id *)&self->mConnectedRepForHighlighting, v10);
  if (mConnectedRepForHighlighting)
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v12 = objc_msgSend(v11, "tag");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineMagnetInfo layout](self->mSnappedMagnet, "layout"));
  if (v12 == (id)11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));

    if (v13 != v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineMagnetInfo layout](self->mSnappedMagnet, "layout"));
      objc_msgSend(v4, "setConnectedTo:", v15);
LABEL_19:

      mConnectedRepForHighlighting = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](mConnectedRepForHighlighting, "interactiveCanvasController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dynamicOperationController"));
      objc_msgSend(v18, "invalidateGuides");

    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));

    if (v13 != v16)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineMagnetInfo layout](self->mSnappedMagnet, "layout"));
      objc_msgSend(v4, "setConnectedFrom:", v15);
      goto LABEL_19;
    }
  }
LABEL_26:

LABEL_27:
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v22 = objc_msgSend(v21, "tag");

  if (v22 == (id)11)
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom"));
  else
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo"));
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker icc](self, "icc"));
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10039A134;
  v80[3] = &unk_1012485C0;
  v26 = v24;
  v81 = v26;
  v82 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "hitRep:passingTest:", v80, self->mKnobPosition.x, self->mKnobPosition.y));
  v28 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "repForSelecting"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "interactiveCanvasController"));

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "freehandDrawingToolkit"));
  *(_QWORD *)&v33 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v32).n128_u64[0];
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v28, "info", v33));
  v37 = sub_100221D0C(v35, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

  if (v38 && objc_msgSend(v31, "isLassoSelectionForMixedTypeEnabledInDrawingMode"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v28, "info"));
    v40 = sub_1000664C4(v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "repForInfo:", v41));
    v28 = (CRLCanvasRep *)v42;
  }
  if ((!v28 || self->mConnectedRepForHighlighting != v28) && self->mIsEnqueueingCommandsInRealTime)
  {
    v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectionLineInfo"));
    v77 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "commandController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v45 = objc_msgSend(v44, "tag");

    v78 = v26;
    v79 = (void *)v43;
    if (v45 == (id)10)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
      v47 = objc_msgSend(v46, "copy");

      v48 = [CRLConnectionLineMagnet alloc];
      v49 = -[CRLConnectionLineKnobTracker p_getSnappedMagnetType](self, "p_getSnappedMagnetType");
      -[CRLConnectionLineKnobTracker p_getSnappedMagnetNormalizedPosition](self, "p_getSnappedMagnetNormalizedPosition");
      v50 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v48, "initWithType:normalizedPosition:", v49);
      objc_msgSend(v47, "setTailMagnet:", v50);

      *(_QWORD *)&v52 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v51).n128_u64[0];
      v54 = v53;
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedFrom", v52));
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "info"));
      v57 = sub_100221D0C(v54, v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v57);

      v59 = v79;
      v60 = v47;
      v61 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v79, v58, 0, v47);
      v62 = (void *)v77;
    }
    else
    {
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
      v64 = objc_msgSend(v63, "tag");

      v65 = v64 == (id)11;
      v59 = v79;
      v62 = (void *)v77;
      if (!v65)
        goto LABEL_42;
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pathSource"));
      v60 = objc_msgSend(v66, "copy");

      v67 = [CRLConnectionLineMagnet alloc];
      v68 = -[CRLConnectionLineKnobTracker p_getSnappedMagnetType](self, "p_getSnappedMagnetType");
      -[CRLConnectionLineKnobTracker p_getSnappedMagnetNormalizedPosition](self, "p_getSnappedMagnetNormalizedPosition");
      v69 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v67, "initWithType:normalizedPosition:", v68);
      objc_msgSend(v60, "setHeadMagnet:", v69);

      *(_QWORD *)&v71 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v70).n128_u64[0];
      v73 = v72;
      v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "connectedTo", v71));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "info"));
      v76 = sub_100221D0C(v73, v75);
      v58 = (void *)objc_claimAutoreleasedReturnValue(v76);

      v59 = v79;
      v61 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v79, v58, 1, v60);
    }
    objc_msgSend(v62, "enqueueCommand:", v61);

LABEL_42:
    v26 = v78;
  }

}

- (unint64_t)p_getSnappedMagnetType
{
  unint64_t result;

  result = (unint64_t)self->mSnappedMagnet;
  if (result)
    return (unint64_t)objc_msgSend((id)result, "magnetType");
  return result;
}

- (CGPoint)p_getSnappedMagnetNormalizedPosition
{
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  float64x2_t v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGPoint result;

  mSnappedMagnet = self->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    -[CRLConnectionLineMagnetInfo position](mSnappedMagnet, "position");
    v18 = v5;
    v19 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineMagnetInfo layout](self->mSnappedMagnet, "layout"));
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "pureTransformInRoot");
    else
      memset(&v21, 0, sizeof(v21));
    CGAffineTransformInvert(&v22, &v21);
    v20 = vaddq_f64(*(float64x2_t *)&v22.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v22.c, v18), *(float64x2_t *)&v22.a, v19));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineMagnetInfo layout](self->mSnappedMagnet, "layout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pureGeometry"));
    objc_msgSend(v11, "size");
    v12 = sub_10005FDDC();
    v9 = sub_1000626B8(v20.f64[0], v20.f64[1], v12, v13, v14);
    v8 = v15;

  }
  else
  {
    v8 = 0.5;
    v9 = 0.5;
  }
  v16 = v9;
  v17 = v8;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)p_updateMagnetRenderables
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  CRLConnectionLineKnobTracker *v24;
  id v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v24 = self;
  v25 = objc_alloc_init((Class)NSMutableArray);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = self->mMagnets;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "connected", v24);
        objc_msgSend(v9, "position");
        if (v10)
        {
          v29[0] = v11;
          v29[1] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v29, "{CGPoint=dd}"));
          v14 = v3;
        }
        else
        {
          v28[0] = v11;
          v28[1] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v28, "{CGPoint=dd}"));
          v14 = v25;
        }
        objc_msgSend(v14, "addObject:", v13);

      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v6);
  }

  v15 = objc_alloc_init((Class)NSMutableArray);
  mSnappedMagnet = v24->mSnappedMagnet;
  if (mSnappedMagnet)
  {
    -[CRLConnectionLineMagnetInfo position](mSnappedMagnet, "position");
    v27[0] = v17;
    v27[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v27, "{CGPoint=dd}"));
    objc_msgSend(v15, "addObject:", v19);

    -[CRLConnectionLineMagnetInfo position](v24->mSnappedMagnet, "position");
    v26[0] = v20;
    v26[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v26, "{CGPoint=dd}"));
    objc_msgSend(v3, "addObject:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](v24, "rep", v24));
  objc_msgSend(v23, "updateMagnetRenderables:withEmptyMagnets:withHighlightedMagnets:includeClippedPortions:", v3, v25, v15, 1);

}

- (void)p_updateLayout
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t mKnobTag;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  _BOOL8 v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  _BOOL8 v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  _BOOL8 v29;
  float v30;
  void *v31;
  void *v32;
  double v33;
  id v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout"));
  v34 = v3;
  if (!self->mSnappedMagnet)
  {
    objc_msgSend(v3, "setDrawClippedHeadPortion:", 0);
    objc_msgSend(v34, "setDrawClippedTailPortion:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "renderable"));
    LODWORD(v7) = 1.0;
    objc_msgSend(v6, "setOpacity:", v7);

    goto LABEL_54;
  }
  v4 = -[CRLConnectionLineKnobTracker p_connectedToCenter](self, "p_connectedToCenter");
  if (self->mKnobMoved || (v4 & 1) == 0)
  {
    -[CRLConnectionLineMagnetInfo position](self->mSnappedMagnet, "position");
    v9 = v8;
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "connectedTo"));
    if (v12)
    {
      mKnobTag = self->mKnobTag;

      if (mKnobTag == 11)
      {
        objc_msgSend(v34, "setHeadMagnetPosition:", v9, v11);
        objc_msgSend(v34, "setHeadMagnetType:", -[CRLConnectionLineMagnetInfo magnetType](self->mSnappedMagnet, "magnetType"));
      }
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "connectedFrom"));
    if (v14)
    {
      v15 = self->mKnobTag;

      if (v15 == 10)
      {
        objc_msgSend(v34, "setTailMagnetPosition:", v9, v11);
        objc_msgSend(v34, "setTailMagnetType:", -[CRLConnectionLineMagnetInfo magnetType](self->mSnappedMagnet, "magnetType"));
      }
    }
  }
  else
  {
    -[CRLConnectionLineKnobTracker p_keepSnappedMagnetOnCenter](self, "p_keepSnappedMagnetOnCenter");
  }
  if (self->mKnobTag != 11)
    goto LABEL_18;
  if ((id)-[CRLConnectionLineMagnetInfo magnetType](self->mSnappedMagnet, "magnetType") != (id)1)
  {
    if (self->mKnobTag == 11)
    {
      v16 = 0;
      goto LABEL_17;
    }
LABEL_18:
    v18 = objc_msgSend(v34, "headMagnetType") == (id)1;
    v17 = v34;
    v16 = v18;
    goto LABEL_21;
  }
  v16 = 1;
LABEL_17:
  v17 = v34;
LABEL_21:
  objc_msgSend(v17, "setClipHead:", v16);
  if (self->mKnobTag != 10)
    goto LABEL_26;
  if ((id)-[CRLConnectionLineMagnetInfo magnetType](self->mSnappedMagnet, "magnetType") == (id)1)
  {
    v19 = 1;
    goto LABEL_27;
  }
  if (self->mKnobTag == 10)
    v19 = 0;
  else
LABEL_26:
    v19 = objc_msgSend(v34, "tailMagnetType") == (id)1;
LABEL_27:
  objc_msgSend(v34, "setClipTail:", v19);
  if (objc_msgSend(v34, "clipHead") && self->mKnobTag == 11)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pureGeometry"));
    objc_msgSend(v20, "size");
    if (v21 == 0.0 || fabs(v21) < 0.00999999978)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pureGeometry"));
      objc_msgSend(v22, "size");
      v24 = fabs(v23) >= 0.00999999978 && v23 != 0.0;
      objc_msgSend(v34, "setDrawClippedHeadPortion:", v24);

    }
    else
    {
      objc_msgSend(v34, "setDrawClippedHeadPortion:", 1);
    }

  }
  else
  {
    objc_msgSend(v34, "setDrawClippedHeadPortion:", 0);
  }
  if (objc_msgSend(v34, "clipTail") && self->mKnobTag == 10)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pureGeometry"));
    objc_msgSend(v25, "size");
    if (v26 == 0.0 || fabs(v26) < 0.00999999978)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "pureGeometry"));
      objc_msgSend(v27, "size");
      v29 = fabs(v28) >= 0.00999999978 && v28 != 0.0;
      objc_msgSend(v34, "setDrawClippedTailPortion:", v29);

    }
    else
    {
      objc_msgSend(v34, "setDrawClippedTailPortion:", 1);
    }

  }
  else
  {
    objc_msgSend(v34, "setDrawClippedTailPortion:", 0);
  }
  v30 = 0.0;
  if ((objc_msgSend(v34, "drawClippedHeadPortion") & 1) == 0)
  {
    if (objc_msgSend(v34, "drawClippedTailPortion"))
      v30 = 0.0;
    else
      v30 = 1.0;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "renderable"));
  *(float *)&v33 = v30;
  objc_msgSend(v32, "setOpacity:", v33);

  objc_msgSend(v34, "setMagnetsAdjusted:", 1);
LABEL_54:

}

- (void)p_keepSnappedMagnetOnCenter
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  CRLConnectionLineMagnetInfo *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  void *v30;
  CRLConnectionLineMagnetInfo *v31;
  CRLConnectionLineMagnetInfo *mSnappedMagnet;
  CGFloat v33;
  CGFloat v34;
  id v35;

  v35 = (id)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout"));
  *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "info", v4));
  v8 = sub_100221D0C(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionLinePathSource"));
  if (!self->mKnobMoved)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedTo"));
    if (v11 && self->mKnobTag == 11 && (v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headMagnet"))) != 0)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "headMagnet"));
      v15 = objc_msgSend(v14, "magnetType");

      if (v15 == (id)1)
      {
        v16 = [CRLConnectionLineMagnetInfo alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedTo"));
        objc_msgSend(v17, "getCardinalPositionWithParentTransformFromType:", 1);
        v19 = v18;
        v21 = v20;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedTo"));
LABEL_14:
        v30 = (void *)v22;
        v31 = -[CRLConnectionLineMagnetInfo initWithType:position:layout:connected:](v16, "initWithType:position:layout:connected:", 1, v22, 1, v19, v21);
        mSnappedMagnet = self->mSnappedMagnet;
        self->mSnappedMagnet = v31;

        -[CRLConnectionLineMagnetInfo position](self->mSnappedMagnet, "position");
        self->mKnobPosition.x = v33;
        self->mKnobPosition.y = v34;
        goto LABEL_16;
      }
    }
    else
    {

    }
    if (!self->mKnobMoved)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedFrom"));
      if (!v23
        || self->mKnobTag != 10
        || (v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tailMagnet"))) == 0)
      {

        goto LABEL_16;
      }
      v25 = (void *)v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tailMagnet"));
      v27 = objc_msgSend(v26, "magnetType");

      if (v27 == (id)1)
      {
        v16 = [CRLConnectionLineMagnetInfo alloc];
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedFrom"));
        objc_msgSend(v17, "getCardinalPositionWithParentTransformFromType:", 1);
        v19 = v28;
        v21 = v29;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "connectedFrom"));
        goto LABEL_14;
      }
    }
  }
LABEL_16:

}

- (BOOL)p_connectedToCenter
{
  void *v2;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t mKnobTag;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;

  *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info"));
  v9 = sub_100221D0C(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectionLinePathSource"));
  v12 = v11;
  mKnobTag = self->mKnobTag;
  if (mKnobTag != 11)
  {
    v14 = 0;
    v15 = 0;
    if (mKnobTag != 10)
      goto LABEL_16;
    goto LABEL_8;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "headMagnet"));
  v14 = v8 != 0;
  if (v8)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headMagnet"));
    if (objc_msgSend(v2, "magnetType") == (id)1)
    {
      v15 = 1;
LABEL_14:

      goto LABEL_15;
    }
  }
  if (self->mKnobTag == 10)
  {
LABEL_8:
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tailMagnet"));
    if (v16)
    {
      v17 = (void *)v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tailMagnet"));
      v15 = objc_msgSend(v18, "magnetType") == (id)1;

      if (!v14)
        goto LABEL_11;
    }
    else
    {
      v15 = 0;
      if (!v14)
      {
LABEL_11:
        if (mKnobTag != 11)
          goto LABEL_16;
        goto LABEL_15;
      }
    }

    goto LABEL_11;
  }
  v15 = 0;
  if (v8)
    goto LABEL_14;
LABEL_15:

LABEL_16:
  return v15;
}

- (void)p_setUserAdjustedShapeControlKnob:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout"));
  v10 = sub_100221D0C(v7, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue(v10);

  if (objc_msgSend(v11, "connectionType") == (id)2)
    objc_msgSend(v11, "setUserDidSetControlPoint:", v3);

}

- (void)moveKnobToRepPosition:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  void *v11;
  CGPoint *p_mNewKnobCenterNaturalSpace;
  CGFloat v13;
  unsigned int v14;
  int *v15;
  double *v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
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
  CGFloat v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  double v44;
  objc_class *v45;
  objc_class *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  char v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __int128 v58;
  double c;
  double tx;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v72;
  double v73;
  double v74;
  double v75;
  char v76;
  double v77;
  double v78;
  double width;
  double height;
  double v81;
  double v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  unsigned int v89;
  unsigned int v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  __int128 v99;
  float64x2_t v100;
  double v101;
  int v102;
  NSObject *v103;
  void *v104;
  void *v105;
  void *v106;
  CGPoint *p_mOriginalPathToBoundsOrigin;
  double a;
  double v109;
  float64x2_t v110;
  double v111;
  void *v112;
  double v113;
  double v114;
  void *v115;
  float64x2_t v116;
  double v117;
  CGAffineTransform v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  _OWORD v121[4];
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  if (-[CRLConnectionLineKnobTracker snapEnabled](self, "snapEnabled"))
    v7 = !-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");
  else
    v7 = 0;
  if (-[CRLConnectionLineKnobTracker snapAngles](self, "snapAngles"))
    v8 = !-[CRLCanvasKnobTracker isInspectorDrivenTracking](self, "isInspectorDrivenTracking");
  else
    v8 = 0;
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 4))
    v9 = (v7 | v8) == 0;
  else
    v9 = 1;
  if (v9 || -[NSMutableSet count](self->mMagnets, "count"))
  {
    objc_msgSend(v6, "dynamicallyMovedSmartShapeKnobTo:withTracker:", self, x, y);
    goto LABEL_13;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "guideController"));

  if (v7 && !self->mBeganAlignmentOperation && objc_msgSend(v6, "wantsGuidesWhileResizing"))
  {
    objc_msgSend(v11, "beginAlignmentOperationForRep:", v6);
    self->mBeganAlignmentOperation = 1;
  }
  p_mNewKnobCenterNaturalSpace = &self->mNewKnobCenterNaturalSpace;
  p_mOriginalPathToBoundsOrigin = &self->mOriginalPathToBoundsOrigin;
  v109 = sub_1000603D0(x, y, self->mOriginalPathToBoundsOrigin.x);
  self->mNewKnobCenterNaturalSpace.x = v109;
  self->mNewKnobCenterNaturalSpace.y = v13;
  v111 = v13;
  v14 = -[CRLConnectionLineKnobTracker resizeFromCenter](self, "resizeFromCenter");
  v15 = &OBJC_IVAR___CRLConnectionLineKnobTracker_mOriginalFixedPointNaturalSpace;
  if (v14)
    v15 = &OBJC_IVAR___CRLConnectionLineKnobTracker_mOriginalMiddlePointNaturalSpace;
  v16 = (double *)((char *)self + *v15);
  v114 = *v16;
  v17 = sub_10006108C(p_mNewKnobCenterNaturalSpace->x, self->mNewKnobCenterNaturalSpace.y, *v16, v16[1]);
  v18 = 0;
  v19 = 3.40282347e38;
  v20 = -1;
  do
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout", p_mOriginalPathToBoundsOrigin));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "originalGeometry"));
    v23 = v22;
    if (v22)
      objc_msgSend(v22, "transform");
    else
      memset(v121, 0, 48);
    v24 = sub_1000791B0(v121);
    v25 = sub_100061F64((double)v18 * 0.785398163 + v24 / -180.0 * 3.14159265);
    v27 = sub_1000603DC(v25, v26, v17);
    v29 = v28;

    v30 = sub_1000603D0(v27, v29, v114);
    v32 = v31;
    v33 = sub_10006108C(v30, v31, p_mNewKnobCenterNaturalSpace->x, self->mNewKnobCenterNaturalSpace.y);
    if ((v8 & 1) != 0)
    {
      if (v33 >= v19)
        goto LABEL_27;
LABEL_26:
      v111 = v32;
      v109 = v30;
      v19 = v33;
      v20 = v18;
      goto LABEL_27;
    }
    if (v33 < (double)7 * 1.5 && v33 < v19)
      goto LABEL_26;
LABEL_27:
    ++v18;
  }
  while (v18 != 8);
  p_mNewKnobCenterNaturalSpace->x = sub_1000603B8(v109, v111, p_mOriginalPathToBoundsOrigin->x);
  self->mNewKnobCenterNaturalSpace.y = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "interactiveCanvasController"));
  v38 = objc_msgSend(v37, "isCanvasBackgroundAlignmentSnappingEnabled");

  if (v38)
  {
    v115 = v11;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "interactiveCanvasController"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvasBackground"));

    v112 = v41;
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "alignmentProvider"));
    *(_QWORD *)&v44 = objc_opt_class(CRLConnectionLineAbstractLayout, v43).n128_u64[0];
    v46 = v45;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout", v44));
    v48 = sub_1002223BC(v46, v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue(v48);

    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "connectedPathSource"));
    v51 = objc_msgSend(v50, "type");

    if (!v42 || (self->mKnobTag & 0xFFFFFFFFFFFFFFFELL) != 0xA && v51 != (id)1)
    {
      v52 = 0;
      v11 = v115;
      v53 = v112;
      goto LABEL_49;
    }
    v110 = vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mNewKnobCenterNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, p_mNewKnobCenterNaturalSpace->x));
    objc_msgSend(v42, "alignmentPointForPoint:");
    v55 = v54;
    v57 = v56;
    v58 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
    *(_OWORD *)&v119.a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
    *(_OWORD *)&v119.c = v58;
    *(_OWORD *)&v119.tx = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
    CGAffineTransformInvert(&v120, &v119);
    a = v120.a;
    c = v120.c;
    tx = v120.tx;
    v61 = v120.ty + v57 * v120.d + v120.b * v55;
    v62 = sub_1000603B8(v110.f64[0], v110.f64[1], vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mOriginalFixedPointNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, self->mOriginalFixedPointNaturalSpace.x)).f64[0]);
    v64 = v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "interactiveCanvasController"));
    objc_msgSend(v66, "viewScale");
    objc_msgSend(v42, "snapDistanceForViewScale:");
    v68 = v67;

    v69 = fabs(v62);
    v70 = fabs(v64);
    if (v69 < v70 && v69 <= v68)
    {
      v72 = self->mOriginalFixedPointNaturalSpace.x;
      v73 = p_mOriginalPathToBoundsOrigin->x;
      v74 = v61;
      goto LABEL_47;
    }
    v72 = tx + v57 * c + a * v55;
    if (v70 <= v68)
    {
      v74 = self->mOriginalFixedPointNaturalSpace.y;
      v73 = p_mOriginalPathToBoundsOrigin->x;
LABEL_47:
      v72 = sub_1000603B8(v72, v74, v73);
      v61 = v75;
    }
    v11 = v115;
    v53 = v41;
    p_mNewKnobCenterNaturalSpace->x = v72;
    self->mNewKnobCenterNaturalSpace.y = v61;
    v52 = 1;
LABEL_49:

  }
  else
  {
    v52 = 0;
  }
  objc_msgSend(v6, "dynamicallyMovedSmartShapeKnobTo:withTracker:", self, p_mNewKnobCenterNaturalSpace->x, self->mNewKnobCenterNaturalSpace.y);
  -[CRLConnectionLineKnobTracker p_validateLayout](self, "p_validateLayout");
  if (v7)
  {
    v76 = self->mBeganAlignmentOperation ? v52 : 1;
    if ((v76 & 1) == 0)
    {
      -[CRLShapeLayout alignmentFrame](self->mResizingLayout, "alignmentFrame");
      v77 = v122.origin.x;
      v78 = v122.origin.y;
      width = v122.size.width;
      height = v122.size.height;
      v116 = vaddq_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&self->mOriginalTransformInRoot.c, self->mNewKnobCenterNaturalSpace.y), *(float64x2_t *)&self->mOriginalTransformInRoot.a, p_mNewKnobCenterNaturalSpace->x));
      v81 = vabdd_f64(v116.f64[0], CGRectGetMinX(v122));
      v123.origin.x = v77;
      v123.origin.y = v78;
      v123.size.width = width;
      v123.size.height = height;
      v82 = vabdd_f64(v116.f64[0], CGRectGetMaxX(v123));
      v124.origin.x = v77;
      v124.origin.y = v78;
      v124.size.width = width;
      v124.size.height = height;
      v83 = vabdd_f64(v116.f64[1], CGRectGetMinY(v124));
      v125.origin.x = v77;
      v125.origin.y = v78;
      v125.size.width = width;
      v125.size.height = height;
      v84 = vabdd_f64(v116.f64[1], CGRectGetMaxY(v125));
      v85 = 7;
      if (v83 < v84)
        v85 = 1;
      v86 = 9;
      if (v83 < v84)
        v86 = 3;
      if (v81 >= v82)
        v87 = v86;
      else
        v87 = v85;
      v88 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
      v89 = objc_msgSend(v88, "wantsGuidesWhileResizing");

      if (v89)
      {
        v90 = -[CRLConnectionLineKnobTracker resizeFromCenter](self, "resizeFromCenter");
        v92 = CGPointZero.x;
        v91 = CGPointZero.y;
        objc_msgSend(v11, "snapRectToGuides:forKnobTag:snapSize:snapWithBackgroundAlignmentProvider:isLine:startPoint:endPoint:", v87, v90 ^ 1, 0, 0, v77, v78, width, height, CGPointZero.x, v91, CGPointZero.x, v91);
        v94 = v93;
        v96 = v95;
      }
      else
      {
        v92 = CGPointZero.x;
        v91 = CGPointZero.y;
        v94 = CGPointZero.x;
        v96 = v91;
      }
      switch(v20)
      {
        case 0:
        case 4:
          v96 = 0.0;
          break;
        case 1:
        case 5:
          if (fabs(v94) <= fabs(v96))
            v94 = v96;
          v96 = v94;
          break;
        case 2:
        case 6:
          v94 = 0.0;
          break;
        case 3:
        case 7:
          if (fabs(v94) <= fabs(v96))
            v94 = -v96;
          else
            v96 = -v94;
          break;
        default:
          break;
      }
      if (v94 != v92 || v96 != v91)
      {
        v97 = sub_1000603D0(v116.f64[0], v116.f64[1], v94);
        v113 = v98;
        v117 = v97;
        v99 = *(_OWORD *)&self->mOriginalTransformInRoot.c;
        *(_OWORD *)&v119.a = *(_OWORD *)&self->mOriginalTransformInRoot.a;
        *(_OWORD *)&v119.c = v99;
        *(_OWORD *)&v119.tx = *(_OWORD *)&self->mOriginalTransformInRoot.tx;
        CGAffineTransformInvert(&v118, &v119);
        v100 = vaddq_f64(*(float64x2_t *)&v118.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v118.c, v113), *(float64x2_t *)&v118.a, v117));
        *p_mNewKnobCenterNaturalSpace = (CGPoint)v100;
        if (((1 << v87) & 0x28A) != 0)
        {
          v101 = v100.f64[1];
        }
        else
        {
          v102 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012576A0);
          v103 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E2A340(v102, v103);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012576C0);
          v104 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE81F0(v104, v102);
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineKnobTracker moveKnobToRepPosition:]"));
          v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLConnectionLineKnobTracker.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v105, v106, 783, 0, "wrong knob type for line segment resize");

          v100.f64[0] = p_mNewKnobCenterNaturalSpace->x;
          v101 = self->mNewKnobCenterNaturalSpace.y;
        }
        objc_msgSend(v6, "dynamicallyMovedSmartShapeKnobTo:withTracker:", self, v100.f64[0], v101);
        -[CRLConnectionLineKnobTracker p_validateLayout](self, "p_validateLayout");
      }
    }
  }
  objc_msgSend(v6, "invalidateKnobPositions");

LABEL_13:
}

- (BOOL)didChangeGeometry
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  BOOL v27;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedFrom", v11));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
  v16 = sub_100221D0C(v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v18).n128_u64[0];
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectedTo", v19));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "info"));
  v24 = sub_100221D0C(v21, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (v17)
    v26 = v25 == 0;
  else
    v26 = 1;
  v27 = v26;

  return v27;
}

- (void)endMovingKnob
{
  uint64_t v3;
  double v4;
  objc_class *v5;
  objc_class *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  objc_class *v12;
  objc_class *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCanvasRep *mConnectedRepForHighlighting;
  CRLCanvasCommandSelectionBehavior *v21;
  void *v22;
  CRLCanvasCommandSelectionBehavior *v23;
  void *v24;
  void *v25;
  double v26;
  CRLCanvasLayout *mOriginalConnectedFrom;
  CRLCanvasLayout *v28;
  CRLCanvasLayout *mOriginalConnectedTo;
  CRLCanvasLayout *v30;
  int v31;
  void *v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  double v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  void *v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  CRLConnectionLineMagnet *v67;
  id v68;
  CRLConnectionLineMagnet *v69;
  CRLConnectionLineMagnet *v70;
  id v71;
  CRLConnectionLineMagnet *v72;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v73;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  objc_super v84;

  v84.receiver = self;
  v84.super_class = (Class)CRLConnectionLineKnobTracker;
  -[CRLCanvasKnobTracker endMovingKnob](&v84, "endMovingKnob");
  *(_QWORD *)&v4 = objc_opt_class(CRLConnectionLineRep, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v4));
  v8 = sub_1002223BC(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  *(_QWORD *)&v11 = objc_opt_class(CRLConnectionLineAbstractLayout, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layout", v11));
  v15 = sub_1002223BC(v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "interactiveCanvasController"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandController"));
  mConnectedRepForHighlighting = self->mConnectedRepForHighlighting;
  self->mConnectedRepForHighlighting = 0;

  if (!self->mIsEnqueueingCommandsInRealTime)
  {
    v21 = [CRLCanvasCommandSelectionBehavior alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "canvasEditor"));
    v23 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v21, "initWithCanvasEditor:", v22);

    objc_msgSend(v19, "openGroupWithSelectionBehavior:", v23);
  }
  v81 = v19;
  objc_msgSend(v9, "updateMagnetRenderables:withEmptyMagnets:withHighlightedMagnets:includeClippedPortions:", &__NSArray0__struct, &__NSArray0__struct, &__NSArray0__struct, 0);
  objc_msgSend(v9, "dynamicMoveSmartShapeKnobDidEndWithTracker:", self);
  objc_msgSend(v16, "setControlKnobPositionChangedFromRouting:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker knob](self, "knob"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "renderable"));
  LODWORD(v26) = 1.0;
  objc_msgSend(v25, "setOpacity:", v26);

  mOriginalConnectedFrom = self->mOriginalConnectedFrom;
  v28 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectedFrom"));
  v83 = v9;
  v80 = v18;
  if (mOriginalConnectedFrom != v28)
  {

LABEL_6:
    v31 = 1;
    goto LABEL_7;
  }
  mOriginalConnectedTo = self->mOriginalConnectedTo;
  v30 = (CRLCanvasLayout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectedTo"));

  if (mOriginalConnectedTo != v30)
    goto LABEL_6;
  v75 = 0;
  if (!self->mKnobMoved)
  {
    v64 = v19;
    goto LABEL_11;
  }
  v31 = 0;
LABEL_7:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectionLineInfo"));
  *(_QWORD *)&v34 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v33).n128_u64[0];
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectedFrom", v34));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "info"));
  v39 = sub_100221D0C(v36, v38);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v39);

  *(_QWORD *)&v41 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v40).n128_u64[0];
  v43 = v42;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "connectedTo", v41));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "info"));
  v46 = sub_100221D0C(v43, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

  *(_QWORD *)&v49 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v48).n128_u64[0];
  v51 = v50;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self->mOriginalConnectedFrom, "info", v49));
  v53 = sub_100221D0C(v51, v52);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

  *(_QWORD *)&v56 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v55).n128_u64[0];
  v58 = v57;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasLayout info](self->mOriginalConnectedTo, "info", v56));
  v60 = sub_100221D0C(v58, v59);
  v61 = objc_claimAutoreleasedReturnValue(v60);

  v79 = v31;
  v78 = (void *)v61;
  if ((v31 & 1) != 0)
    v62 = objc_claimAutoreleasedReturnValue(+[CRLConnectionLineItem commandActionStringForConnectingFrom:oldConnectedFrom:newConnectedTo:oldConnectedTo:](_TtC8Freeform21CRLConnectionLineItem, "commandActionStringForConnectingFrom:oldConnectedFrom:newConnectedTo:oldConnectedTo:", v82, v54, v47, v61));
  else
    v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "actionStringForDrag"));
  v63 = (void *)v62;
  v64 = v81;
  objc_msgSend(v81, "setCurrentGroupActionString:", v62);
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pathSource"));
  v66 = objc_msgSend(v65, "copy");

  v67 = [CRLConnectionLineMagnet alloc];
  v68 = objc_msgSend(v16, "headMagnetType");
  objc_msgSend(v16, "headMagnetNormalizedPosition");
  v69 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v67, "initWithType:normalizedPosition:", v68);
  objc_msgSend(v66, "setHeadMagnet:", v69);

  v70 = [CRLConnectionLineMagnet alloc];
  v71 = objc_msgSend(v16, "tailMagnetType");
  objc_msgSend(v16, "tailMagnetNormalizedPosition");
  v72 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:](v70, "initWithType:normalizedPosition:", v71);
  objc_msgSend(v66, "setTailMagnet:", v72);

  v73 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v32, v82, 0, v66);
  v74 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v32, v47, 1, v66);
  objc_msgSend(v81, "enqueueCommand:", v73);
  objc_msgSend(v81, "enqueueCommand:", v74);
  objc_msgSend(v16, "setMagnetsAdjusted:", 0);

  v9 = v83;
  v18 = v80;
  v75 = v79;
LABEL_11:
  objc_msgSend(v64, "closeGroup");
  if (self->mBeganAlignmentOperation)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasController"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "guideController"));
    objc_msgSend(v77, "endAlignmentOperation");

  }
  if (v75)
  {
    objc_msgSend(v16, "setConnectedFrom:", self->mOriginalConnectedFrom);
    objc_msgSend(v16, "setConnectedTo:", self->mOriginalConnectedTo);
    objc_msgSend(v16, "invalidateConnections");
  }

}

- (BOOL)shouldDisplayGuides
{
  return self->mConnectedRepForHighlighting == 0;
}

- (BOOL)shouldHideOtherKnobs
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;

  *(_QWORD *)&v3 = objc_opt_class(CRLConnectionLineRep, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep", v3));
  v7 = sub_1002223BC(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  *(_QWORD *)&v10 = objc_opt_class(CRLConnectionLineAbstractLayout, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layout", v10));
  v14 = sub_1002223BC(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectedPathSource"));
  v17 = objc_msgSend(v16, "type") != (id)1;

  return v17;
}

- (id)connectedRepForHighlighting
{
  return self->mConnectedRepForHighlighting;
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

- (id)connectionLineLayout
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasKnobTracker rep](self, "rep"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layout"));

  return v3;
}

- (BOOL)p_isValidConnectionDestination:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineKnobTracker connectionLineLayout](self, "connectionLineLayout"));
  LOBYTE(self) = objc_msgSend(v5, "isValidConnectionDestination:forLineEnd:", v4, self->mKnobTag);

  return (char)self;
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

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->mIsEnqueueingCommandsInRealTime;
}

- (BOOL)shouldSnapToMagnets
{
  return self->mShouldSnapToMagnets;
}

- (void)setShouldSnapToMagnets:(BOOL)a3
{
  self->mShouldSnapToMagnets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLayoutUnderKnob, 0);
  objc_storeStrong((id *)&self->mSnappedMagnet, 0);
  objc_storeStrong((id *)&self->mMagnets, 0);
  objc_storeStrong((id *)&self->mResizingLayout, 0);
  objc_storeStrong((id *)&self->mConnectedRepForHighlighting, 0);
  objc_storeStrong((id *)&self->mOriginalConnectedTo, 0);
  objc_storeStrong((id *)&self->mOriginalConnectedFrom, 0);
}

@end
