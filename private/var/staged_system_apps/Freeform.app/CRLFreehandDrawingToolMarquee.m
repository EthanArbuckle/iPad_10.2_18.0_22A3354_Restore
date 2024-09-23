@implementation CRLFreehandDrawingToolMarquee

- (CRLFreehandDrawingToolMarquee)initWithInteractiveCanvasController:(id)a3
{
  CRLFreehandDrawingToolMarquee *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *hitTestingQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLFreehandDrawingToolMarquee;
  v3 = -[CRLFreehandDrawingTool initWithInteractiveCanvasController:](&v9, "initWithInteractiveCanvasController:", a3);
  if (v3)
  {
    v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_create("com.apple.freeform.freehand-drawing.marquee-select-hit-testing", v5);
    hitTestingQueue = v3->_hitTestingQueue;
    v3->_hitTestingQueue = (OS_dispatch_queue *)v6;

    v3->_initialUnscaledPoint = (CGPoint)xmmword_100EEC438;
    v3->_shouldEnableHandwritingIntelligence = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1);

  }
  return v3;
}

+ (BOOL)wasLastMarqueeClockwise
{
  return byte_101415AA0;
}

- (void)performActionWithInputPoint:(id)a3 isInitialPoint:(BOOL)a4 isFinalPoint:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  int *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *hitTestingQueue;
  CRLFreehandDrawingPathCreator *v38;
  CRLFreehandDrawingPathCreator *pathCreator;
  CRLFreehandDrawingPathCreator *v40;
  double v41;
  CRLFreehandDrawingWindingCalculator *v42;
  CRLFreehandDrawingWindingCalculator *windingCalculator;
  double v44;
  CRLFreehandDrawingPathCreator *v45;
  double v46;
  void *v47;
  _QWORD block[6];
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v55.receiver = self;
  v55.super_class = (Class)CRLFreehandDrawingToolMarquee;
  -[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:](&v55, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v8, v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v8, "unscaledPoint");
  v12 = v10;
  v13 = v11;
  v14 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
  if (v6)
  {
    self->_initialUnscaledPoint.x = v10;
    self->_initialUnscaledPoint.y = v11;
    objc_msgSend(v8, "time");
    self->_initialTouchTime = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    objc_msgSend(v8, "unscaledPoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentForFreehandDrawingLayoutsAtPoint:"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "children"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_allSelectableItemsToInteractWithFromLayouts:](self, "p_allSelectableItemsToInteractWithFromLayouts:", v18));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "freehandDrawingToolkit"));
    v22 = objc_msgSend(v21, "isLassoAbleToSelectMixedType");

    if ((v22 & 1) != 0)
    {
      objc_msgSend(v8, "unscaledPoint");
      v23 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:](self, "p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:"));
    }
    else
    {
      v23 = objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
    }
    v26 = (void *)v23;
    v14 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v9, "viewScale");
      v28 = v27;
      objc_msgSend(v9, "visibleUnscaledRect");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      atomic_store(0, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
      hitTestingQueue = self->_hitTestingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1004595C4;
      block[3] = &unk_10125F5E8;
      block[4] = self;
      block[5] = v19;
      v49 = v26;
      v50 = v28;
      v51 = v30;
      v52 = v32;
      v53 = v34;
      v54 = v36;
      dispatch_async(hitTestingQueue, block);

    }
    v38 = objc_alloc_init(CRLFreehandDrawingPathCreator);
    pathCreator = self->_pathCreator;
    self->_pathCreator = v38;

    v40 = self->_pathCreator;
    objc_msgSend(v9, "viewScale");
    -[CRLFreehandDrawingPathCreator beginDrawingWithViewScale:inputType:](v40, "beginDrawingWithViewScale:inputType:", objc_msgSend(v8, "inputType"), v41);
    objc_msgSend(v9, "addDecorator:", self);
    self->_didProvideDecoratorRenderable = 0;
    v42 = objc_alloc_init(CRLFreehandDrawingWindingCalculator);
    windingCalculator = self->_windingCalculator;
    self->_windingCalculator = v42;

    -[CRLFreehandDrawingWindingCalculator addPoint:](self->_windingCalculator, "addPoint:", v12, v13);
  }
  else if ((objc_msgSend(v8, "isPredicted") & 1) == 0)
  {
    if (!self->_movedFarEnoughNotToBeTap)
    {
      v24 = sub_10006108C(self->_initialUnscaledPoint.x, self->_initialUnscaledPoint.y, v12, v13);
      objc_msgSend(v9, "viewScale");
      if (v24 * v25 > 45.0)
        self->_movedFarEnoughNotToBeTap = 1;
    }
    -[CRLFreehandDrawingWindingCalculator addPoint:](self->_windingCalculator, "addPoint:", v12, v13);
  }
  if ((objc_msgSend(v8, "isPredicted") & 1) == 0)
  {
    objc_msgSend(v8, "time");
    self->_mostRecentTouchTime = v44;
  }
  if (v6 || (objc_msgSend(v8, "wasAddedByTouchesEnded") & 1) == 0)
  {
    v45 = self->_pathCreator;
    objc_msgSend(v8, "time");
    -[CRLFreehandDrawingPathCreator drawToPoint:atTime:predicted:](v45, "drawToPoint:atTime:predicted:", objc_msgSend(v8, "isPredicted"), v12, v13, v46);
  }
  objc_msgSend(v9, "invalidateLayersForDecorator:", self);
  if (*((_BYTE *)&self->super.super.isa + v14[499])
    && (objc_msgSend(v9, "i_currentlySuppressingLayerUpdates") & 1) == 0)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v9, "i_beginSuppressingLayerUpdatesExceptForReps:", v47);

  }
}

- (BOOL)finalizeAndResetWithSuccess:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  CRLFreehandDrawingWindingCalculator *windingCalculator;
  CRLFreehandDrawingToolMarqueeInput *v7;
  void *v8;
  CRLFreehandDrawingPathCreator *pathCreator;
  NSObject *hitTestingQueue;
  id v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  _QWORD block[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRLFreehandDrawingToolMarquee;
  v4 = -[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](&v21, "finalizeAndResetWithSuccess:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  if (objc_msgSend(v5, "i_currentlySuppressingLayerUpdates"))
    objc_msgSend(v5, "i_endSuppressingLayerUpdates");
  if (v4)
    byte_101415AA0 = -[CRLFreehandDrawingWindingCalculator isWindingClockwise](self->_windingCalculator, "isWindingClockwise");
  windingCalculator = self->_windingCalculator;
  self->_windingCalculator = 0;

  -[CRLFreehandDrawingPathCreator endDrawing](self->_pathCreator, "endDrawing");
  if (v4)
  {
    if (self->_movedFarEnoughNotToBeTap || self->_mostRecentTouchTime - self->_initialTouchTime > 0.75)
    {
      v7 = -[CRLFreehandDrawingPathCreator copyOfEntirePath](self->_pathCreator, "copyOfEntirePath");
      -[CRLFreehandDrawingToolMarquee p_handleMarqueeCircleSelectionWithMarqueePath:](self, "p_handleMarqueeCircleSelectionWithMarqueePath:", v7);
    }
    else
    {
      atomic_store(1u, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
      v12 = -[CRLFreehandDrawingPathCreator copyOfEntirePath](self->_pathCreator, "copyOfEntirePath");
      objc_msgSend(v12, "bounds");
      v17 = sub_100061400(v13, v14, v15, v16);
      v19 = v18;

      v7 = -[CRLFreehandDrawingToolMarqueeInput initWithUnscaledTapPoint:inputType:]([CRLFreehandDrawingToolMarqueeInput alloc], "initWithUnscaledTapPoint:inputType:", -[CRLFreehandDrawingTool currentInputType](self, "currentInputType"), v17, v19);
      if (self->_shouldEnableHandwritingIntelligence)
      {
        if (self->_isHandlingDoubleTapGesture)
          self->_isHandlingDoubleTapGesture = 0;
        else
          -[CRLFreehandDrawingToolMarquee performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "handleMarqueeTapWithInput:", v7, 0.3);
      }
      else
      {
        -[CRLFreehandDrawingToolMarquee handleMarqueeTapWithInput:](self, "handleMarqueeTapWithInput:", v7);
      }
    }

  }
  else
  {
    atomic_store(1u, (unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v8, "removeDecorator:", self);

  self->_didProvideDecoratorRenderable = 0;
  self->_mostRecentTouchTime = 0.0;
  self->_initialTouchTime = 0.0;
  self->_movedFarEnoughNotToBeTap = 0;
  self->_initialUnscaledPoint = (CGPoint)xmmword_100EEC438;
  pathCreator = self->_pathCreator;
  self->_pathCreator = 0;

  hitTestingQueue = self->_hitTestingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100459878;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(hitTestingQueue, block);

  return v4;
}

- (unint64_t)type
{
  return 9;
}

- (void)updatePencilKitToolIfAppropriateFor:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)PKLassoTool);
  objc_msgSend(v3, "setTool:", v4);

}

+ (id)dottedMarqueeRenderableOfColor:(id)a3 offsetDashes:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  double v8;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasShapeRenderable renderable](CRLCanvasShapeRenderable, "renderable"));
  objc_msgSend(v6, "setLineWidth:", 4.0);
  objc_msgSend(v6, "setLineDashPattern:", &off_1012CB938);
  objc_msgSend(v6, "setLineJoin:", kCALineJoinRound);
  objc_msgSend(v6, "setLineCap:", kCALineCapRound);
  objc_msgSend(v6, "setFillColor:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "colorWithAlphaComponent:", 0.5));

  objc_msgSend(v6, "setStrokeColor:", objc_msgSend(v7, "CGColor"));
  v8 = 0.0;
  if (v4)
    v8 = 5.5;
  objc_msgSend(v6, "setLineDashPhase:", v8);
  return v6;
}

+ (id)dottedMarqueeRenderableAnimationWithOffsetDashes:(BOOL)a3 clockwise:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("lineDashPhase")));
  v7 = 5.5;
  if (!v5)
    v7 = 0.0;
  if (v4)
    v8 = v7 + 11.0;
  else
    v8 = v7;
  if (v4)
    v9 = v7;
  else
    v9 = v7 + 11.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  objc_msgSend(v6, "setFromValue:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  objc_msgSend(v6, "setToValue:", v11);

  objc_msgSend(v6, "setDuration:", 1.0);
  LODWORD(v12) = 2139095040;
  objc_msgSend(v6, "setRepeatCount:", v12);
  return v6;
}

- (NSArray)decoratorOverlayRenderables
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasShapeRenderable *v7;
  CRLCanvasShapeRenderable *blackMarqueeRenderable;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  CRLCanvasShapeRenderable *v14;
  CRLCanvasShapeRenderable *whiteMarqueeRenderable;
  CRLCanvasShapeRenderable *v16;
  void *v17;
  _QWORD v19[2];

  if (!self->_blackMarqueeRenderable || !self->_whiteMarqueeRenderable)
  {
    *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor blackColor](CRLColor, "blackColor", v3));
    v7 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dottedMarqueeRenderableOfColor:offsetDashes:", v6, 0));
    blackMarqueeRenderable = self->_blackMarqueeRenderable;
    self->_blackMarqueeRenderable = v7;

    *(_QWORD *)&v10 = objc_opt_class(self, v9).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor", v10));
    v14 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dottedMarqueeRenderableOfColor:offsetDashes:", v13, 1));
    whiteMarqueeRenderable = self->_whiteMarqueeRenderable;
    self->_whiteMarqueeRenderable = v14;

  }
  if (self->_pathCreator && self->_blackMarqueeRenderable && self->_whiteMarqueeRenderable)
  {
    -[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:](self, "p_updateDottedMarqueeDecoratorRenderable:");
    -[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:](self, "p_updateDottedMarqueeDecoratorRenderable:", self->_whiteMarqueeRenderable);
    v16 = self->_whiteMarqueeRenderable;
    v19[0] = self->_blackMarqueeRenderable;
    v19[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  }
  else
  {
    v17 = &__NSArray0__struct;
  }
  self->_didProvideDecoratorRenderable = 1;
  return (NSArray *)v17;
}

- (void)doWorkBeforeCanvasLayout
{
  void *v3;
  CRLCanvasShapeRenderable *whiteMarqueeRenderable;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLFreehandDrawingToolMarquee;
  -[CRLFreehandDrawingTool doWorkBeforeCanvasLayout](&v5, "doWorkBeforeCanvasLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  if (objc_msgSend(v3, "i_currentlySuppressingLayerUpdates")
    && self->_pathCreator
    && self->_blackMarqueeRenderable)
  {
    whiteMarqueeRenderable = self->_whiteMarqueeRenderable;

    if (whiteMarqueeRenderable)
    {
      -[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:](self, "p_updateDottedMarqueeDecoratorRenderable:", self->_blackMarqueeRenderable);
      -[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:](self, "p_updateDottedMarqueeDecoratorRenderable:", self->_whiteMarqueeRenderable);
    }
  }
  else
  {

  }
}

- (void)p_updateDottedMarqueeDecoratorRenderable:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  id v13;
  id v14;
  CGAffineTransform v15;

  v4 = a3;
  if (!self->_pathCreator)
  {
    v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F608);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E36624(v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F628);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolMarquee p_updateDottedMarqueeDecoratorRenderable:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 368, 0, "invalid nil value for '%{public}s'", "_pathCreator");

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v10, "viewScale");
  v12 = v11;

  v13 = -[CRLFreehandDrawingPathCreator copyOfEntirePath](self->_pathCreator, "copyOfEntirePath");
  CGAffineTransformMakeScale(&v15, v12, v12);
  objc_msgSend(v13, "transformUsingAffineTransform:", &v15);
  v14 = objc_retainAutorelease(v13);
  objc_msgSend(v4, "setPath:", objc_msgSend(v14, "CGPath"));

}

- (void)p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfos:(id)a3 marqueeSelectionIneligibleInfos:(id)a4 viewScale:(double)a5 visibleUnscaledRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  double v15;
  CRLBezierHitTester *v16;
  CRLBezierHitTester *hitTester;
  NSMapTable *v18;
  NSMapTable *selectionEligiblePathToInfoDictionary;
  NSHashTable *v20;
  NSHashTable *selectionIneligiblePaths;
  unsigned __int8 v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  char **v37;
  uint64_t v38;
  void *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unsigned __int8 v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  unsigned int v67;
  NSObject *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  char *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  id obj;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  _BYTE v85[48];
  _BYTE v86[48];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[48];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t buf[4];
  unsigned int v101;
  __int16 v102;
  const char *v103;
  __int16 v104;
  const char *v105;
  __int16 v106;
  int v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v15 = ceil(10.0 / fmin(a5, 1.0));
  v16 = -[CRLBezierHitTester initWithBucketSize:]([CRLBezierHitTester alloc], "initWithBucketSize:", v15);
  hitTester = self->_hitTester;
  self->_hitTester = v16;

  -[CRLBezierHitTester setAllowsLargeCrawlingDistances:](self->_hitTester, "setAllowsLargeCrawlingDistances:", 1);
  v18 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 16);
  selectionEligiblePathToInfoDictionary = self->_selectionEligiblePathToInfoDictionary;
  self->_selectionEligiblePathToInfoDictionary = v18;

  v20 = (NSHashTable *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0));
  selectionIneligiblePaths = self->_selectionIneligiblePaths;
  self->_selectionIneligiblePaths = v20;

  v22 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
  if ((v22 & 1) == 0)
  {
    v77 = v14;
    v78 = v13;
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v23 = v14;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v97;
LABEL_4:
      v27 = 0;
      while (1)
      {
        if (*(_QWORD *)v97 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * v27);
        v29 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
        if ((v29 & 1) != 0)
          break;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "layoutForInfo:", v28));

        if (v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "i_wrapPath"));
          v33 = objc_msgSend(v32, "copy");

          objc_msgSend(v31, "transformInRoot");
          objc_msgSend(v33, "transformUsingAffineTransform:", v95);
          -[CRLBezierHitTester addPath:filled:](self->_hitTester, "addPath:filled:", v33, objc_msgSend(v33, "containsClosePathElement"));
          -[NSHashTable addObject:](self->_selectionIneligiblePaths, "addObject:", v33);

        }
        if (v25 == (id)++v27)
        {
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v96, v110, 16);
          if (v25)
            goto LABEL_4;
          break;
        }
      }
    }

    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    obj = v78;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
    if (v34)
    {
      v36 = v34;
      v37 = &off_1013C1000;
      v83 = *(_QWORD *)v92;
LABEL_14:
      v38 = 0;
      v79 = v36;
      while (1)
      {
        if (*(_QWORD *)v92 != v83)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v38);
        v40 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
        if ((v40 & 1) != 0)
          goto LABEL_49;
        objc_opt_class(v37 + 287, v35);
        if ((objc_opt_isKindOfClass(v39, v41) & 1) != 0)
          break;
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "layoutForInfo:", v39));
        v73 = v74;
        if (v74)
        {
          v75 = v74;
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "i_wrapPath"));
          v46 = objc_msgSend(v76, "copy");

          v73 = v75;
          objc_msgSend(v75, "transformInRoot");
          objc_msgSend(v46, "transformUsingAffineTransform:", v85);
          if ((objc_msgSend(v46, "isEmpty") & 1) == 0)
          {
            objc_msgSend(v46, "bounds");
            v114.origin.x = x;
            v114.origin.y = y;
            v114.size.width = width;
            v114.size.height = height;
            if (CGRectIntersectsRect(v112, v114))
            {
              -[CRLBezierHitTester addPath:filled:crawlingDistance:](self->_hitTester, "addPath:filled:crawlingDistance:", v46, 1, v15);
              -[NSMapTable setObject:forKey:](self->_selectionEligiblePathToInfoDictionary, "setObject:forKey:", v39, v46);
            }
          }
LABEL_46:

        }
        if ((id)++v38 == v36)
        {
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v109, 16);
          if (v36)
            goto LABEL_14;
          goto LABEL_49;
        }
      }
      v82 = v38;
      objc_opt_class(v37 + 287, v42);
      v44 = sub_100221D0C(v43, v39);
      v81 = (void *)objc_claimAutoreleasedReturnValue(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "childInfos"));
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v46 = v45;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
      if (v47)
      {
        v49 = v47;
        v50 = *(_QWORD *)v88;
LABEL_21:
        v51 = 0;
        while (1)
        {
          if (*(_QWORD *)v88 != v50)
            objc_enumerationMutation(v46);
          v52 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v51);
          v53 = atomic_load((unsigned __int8 *)&self->_cancelledBackgroundHitTesting);
          if ((v53 & 1) != 0)
            break;
          objc_opt_class(_TtC8Freeform12CRLShapeItem, v48);
          v55 = sub_100221D0C(v54, v52);
          v57 = (void *)objc_claimAutoreleasedReturnValue(v55);
          if (v57)
          {
            *(_QWORD *)&v58 = objc_opt_class(CRLShapeLayout, v56).n128_u64[0];
            v60 = v59;
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "layoutForInfo:", v57, v58));
            v62 = sub_100221D0C(v60, v61);
            v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

            if (v63)
            {
              v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "pathSource"));
              v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "bezierPath"));
              v66 = objc_msgSend(v65, "copy");

              objc_msgSend(v63, "transformInRoot");
              objc_msgSend(v66, "transformUsingAffineTransform:", v86);
              objc_msgSend(v66, "bounds");
              v113.origin.x = x;
              v113.origin.y = y;
              v113.size.width = width;
              v113.size.height = height;
              if (CGRectIntersectsRect(v111, v113))
              {
                -[CRLBezierHitTester addPath:filled:crawlingDistance:](self->_hitTester, "addPath:filled:crawlingDistance:", v66, objc_msgSend(v66, "containsClosePathElement"), v15);
                -[NSMapTable setObject:forKey:](self->_selectionEligiblePathToInfoDictionary, "setObject:forKey:", v57, v66);
              }
            }
            else
            {
              v67 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125F648);
              v68 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                v101 = v67;
                v102 = 2082;
                v103 = "-[CRLFreehandDrawingToolMarquee p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInf"
                       "os:marqueeSelectionIneligibleInfos:viewScale:visibleUnscaledRect:]";
                v104 = 2082;
                v105 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m";
                v106 = 1024;
                v107 = 439;
                _os_log_error_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d There should be a currentShapeLayout here.", buf, 0x22u);
              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_10125F668);
              v69 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v71 = v69;
                v72 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                v101 = v67;
                v102 = 2114;
                v103 = v72;
                _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v66 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolMarquee p_prepareForHitTestingInBackgroundWithMarqueeSelectionEligibleInfos:marqueeSelectionIneligibleInfos:viewScale:visibleUnscaledRect:]", v77));
              v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolMarquee.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v66, v70, 439, 0, "There should be a currentShapeLayout here.");

            }
          }

          if (v49 == (id)++v51)
          {
            v49 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v87, v108, 16);
            if (v49)
              goto LABEL_21;
            break;
          }
        }
      }

      v36 = v79;
      v37 = &off_1013C1000;
      v73 = v81;
      v38 = v82;
      goto LABEL_46;
    }
LABEL_49:

    v14 = v77;
    v13 = v78;
  }

}

- (void)cancelCommitSelectionForHandlingMarqueeTapForSmartSelection
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  self->_isHandlingDoubleTapGesture = 1;
}

- (void)p_handleMarqueeCircleSelectionWithMarqueePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *hitTestingQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD block[5];
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_10045AB38;
  v37 = sub_10045AB48;
  v38 = 0;
  hitTestingQueue = self->_hitTestingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10045AB50;
  block[3] = &unk_101259830;
  v32 = &v33;
  block[4] = self;
  v24 = v4;
  v30 = v24;
  v8 = v6;
  v31 = v8;
  dispatch_sync(hitTestingQueue, block);
  if (!objc_msgSend(v8, "count")
    && objc_msgSend((id)v34[5], "count")
    && objc_msgSend((id)v34[5], "isEqualToHashTable:", self->_selectionIneligiblePaths))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable crl_allObjects](self->_selectionEligiblePathToInfoDictionary, "crl_allObjects"));
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          objc_opt_class(NSObject, v14);
          v20 = sub_100221D0C(v19, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
          v22 = sub_1000664C4(v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          if (v23)
            objc_msgSend(v8, "addObject:", v23);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v39, 16);
      }
      while (v15);
    }

  }
  if (self->_shouldEnableHandwritingIntelligence && objc_msgSend(v8, "count"))
    -[CRLFreehandDrawingToolMarquee p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:](self, "p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfos:", v8));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  objc_msgSend(v11, "setSelectionPath:", v10);

  v12 = -[CRLFreehandDrawingTool currentInputType](self, "currentInputType");
  if (objc_msgSend(v8, "count") && v12)
    -[CRLFreehandDrawingToolMarquee p_presentEditMenuForLassoSelection](self, "p_presentEditMenuForLassoSelection");

  _Block_object_dispose(&v33, 8);
}

- (void)handleMarqueeTapWithInput:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  unsigned __int8 v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  unsigned __int8 v81;
  void *v82;
  void *v83;
  void *v84;
  unsigned int v85;
  void *v86;
  unint64_t v87;
  void *v88;
  unsigned int v89;
  void *v90;
  void *v91;
  id v92;

  v92 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v92, "unscaledTapPoint");
  v6 = v5;
  v8 = v7;
  v87 = (unint64_t)objc_msgSend(v92, "inputType");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v85 = objc_msgSend(v9, "isLassoAbleToSelectMixedType");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

  *(_QWORD *)&v13 = objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate", v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentDocumentMode"));
  v18 = sub_100221D0C(v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v90 = v19;
  v89 = objc_msgSend(v19, "currentlyDisplayingLassoSelectionMenu");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hitRep:withPrecision:", (v87 & 0xFFFFFFFFFFFFFFFDLL) == 0, v6, v8));
  if (!v20 && (v87 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "hitRep:withPrecision:", 0, v6, v8));
  v86 = v11;
  if (!v20)
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));
    goto LABEL_8;
  }
  v21 = -[CRLFreehandDrawingToolMarquee p_unlockedAncestorOfRepIsAlreadySelected:](self, "p_unlockedAncestorOfRepIsAlreadySelected:", v20);
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));
  if (!v21)
  {
LABEL_8:
    v26 = 0;
    v22 = 0;
    goto LABEL_9;
  }
  v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForSelecting"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectionPathWithInfos:", 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  objc_msgSend(v25, "setSelectionPath:", v24);

  -[CRLFreehandDrawingToolMarquee p_hideEditMenuForLassoSelection](self, "p_hideEditMenuForLassoSelection");
  v26 = 1;
LABEL_9:
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForSelecting"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  v88 = (void *)v22;
  if (v27)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layout"));
    v31 = objc_msgSend(v29, "isLayoutSelectable:", v30);

    if (v31)
    {
      *(_QWORD *)&v33 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v32).n128_u64[0];
      v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "info", v33));
      v37 = sub_100221D0C(v35, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "containingGroup"));
      if (!v40)
      {
        objc_opt_class(_TtC8Freeform12CRLGroupItem, v39);
        v42 = sub_100221D0C(v41, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v42);
      }
      if ((v85 & 1) == 0)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layout"));
        if (!objc_msgSend(v57, "isInGroup"))
          goto LABEL_35;
        v60 = objc_msgSend(v40, "isFreehandDrawing");

        if (!v60)
          goto LABEL_36;
      }
      v43 = sub_1000665A8(v40);
      if ((objc_msgSend(v27, "isSelected") & 1) != 0 || (v43 & 1) != 0)
      {

        v61 = v86;
        objc_msgSend(v86, "setLastTapPoint:", v6, v8);
        v62 = v87;
        goto LABEL_41;
      }
      if (v85)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layout"));
        if (objc_msgSend(v44, "isInGroup") && v40)
        {
          v45 = objc_msgSend(v40, "isFreehandDrawing");

          if ((v45 & 1) == 0)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "parentInfo"));
            objc_opt_class(NSObject, v47);
            v54 = sub_10022209C(v46, v48, 1, v49, v50, v51, v52, v53, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
            v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
            v56 = sub_1000664C4(v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue(v56);

            v58 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v57));
            v28 = (void *)v58;
LABEL_35:

LABEL_36:
            goto LABEL_37;
          }
        }
        else
        {

        }
      }
      if (v26)
        v63 = objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_infosToSelectFromHitRep:repForSelectingFromHitRep:selectedInfosBeforeTapping:](self, "p_infosToSelectFromHitRep:repForSelectingFromHitRep:selectedInfosBeforeTapping:", v27, v22, v91));
      else
        v63 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v38));
      v57 = v28;
      v28 = (void *)v63;
      goto LABEL_35;
    }
  }
  if (v22)
    v59 = v26;
  else
    v59 = 0;
  if (v59 == 1)
  {
    v38 = v28;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_infosToSelectFromHitRep:repForSelectingFromHitRep:selectedInfosBeforeTapping:](self, "p_infosToSelectFromHitRep:repForSelectingFromHitRep:selectedInfosBeforeTapping:", v27, v22, v91));
LABEL_37:

  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "selectionPathWithInfos:", v28));

  v61 = v86;
  if ((v26 | v89 ^ 1) == 1)
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    objc_msgSend(v66, "setSelectionPath:", v65);

  }
  -[CRLFreehandDrawingToolMarquee p_hideEditMenuForLassoSelection](self, "p_hideEditMenuForLassoSelection");

  objc_msgSend(v86, "setLastTapPoint:", v6, v8);
  v62 = v87;
  if (!v27)
  {
    if (!+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled")|| !v90|| !-[CRLFreehandDrawingToolMarquee handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:](self, "handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:", v92))
    {
      goto LABEL_52;
    }
LABEL_50:
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "selectionPathWithInfos:", 0));

    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    objc_msgSend(v84, "setSelectionPath:", v83);

    -[CRLFreehandDrawingToolMarquee p_hideEditMenuForLassoSelection](self, "p_hideEditMenuForLassoSelection");
    goto LABEL_56;
  }
LABEL_41:
  if ((objc_msgSend(v27, "handledLassoTapAtPoint:withInputType:", v62, v6, v8) & 1) != 0)
    goto LABEL_50;
  objc_opt_class(CRLShapeRep, v67);
  v69 = sub_100221D0C(v68, v27);
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  v71 = v70;
  if (!v70)
    goto LABEL_51;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "parentRep"));

  if (!v72)
    goto LABEL_51;
  *(_QWORD *)&v74 = objc_opt_class(CRLFreehandDrawingRep, v73).n128_u64[0];
  v76 = v75;
  v77 = v61;
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "parentRep", v74));
  v79 = sub_100221D0C(v76, v78);
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

  v61 = v77;
  if (!v80)
  {
LABEL_51:

    goto LABEL_52;
  }
  v81 = objc_msgSend(v80, "handledLassoTapAtPoint:withInputType:", v62, v6, v8);

  if ((v81 & 1) != 0)
    goto LABEL_50;
LABEL_52:
  if (v62)
  {
    if ((v89 & 1) != 0)
      -[CRLFreehandDrawingToolMarquee p_hideEditMenuForLassoSelection](self, "p_hideEditMenuForLassoSelection");
    else
      -[CRLFreehandDrawingToolMarquee p_presentEditMenuForLassoSelection](self, "p_presentEditMenuForLassoSelection");
  }
LABEL_56:

}

- (BOOL)p_unlockedAncestorOfRepIsAlreadySelected:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  BOOL v11;

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "parentRep"));
  if (!v4)
    return 0;
  v5 = (void *)v4;
  while (!objc_msgSend(v5, "isSelected") || objc_msgSend(v5, "isLocked"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infosForCurrentSelectionPath"));
      v9 = objc_msgSend(v8, "containsObject:", v6);

      if (v9)
      {

        break;
      }
    }
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentRep"));

    v5 = (void *)v10;
    if (!v10)
    {
      v11 = 0;
      goto LABEL_12;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (id)p_infosToSelectFromHitRep:(id)a3 repForSelectingFromHitRep:(id)a4 selectedInfosBeforeTapping:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "info"));
    v12 = sub_1000664C4(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v13
      && (objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14),
          (objc_opt_isKindOfClass(v13, v15) & 1) == 0))
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
    }
    else
    {
      *(_QWORD *)&v16 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v14).n128_u64[0];
      v18 = v17;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "info", v16));
      v20 = sub_100221D0C(v18, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

      if (v21)
        v22 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v21));
      else
        v22 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v10 = (id)v22;

    }
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (void)p_deselectSmartSelectedDrawingShapeItemsFromInfosToSelect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionManager"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v22;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14);
        objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v11);
        v17 = sub_100221D0C(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (!v18
          || !objc_msgSend(v8, "doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:", v18, (_QWORD)v21))
        {
          v20 = v9;
          goto LABEL_12;
        }
        objc_msgSend(v8, "removeSelectedShapeItemFromSmartSelectionBookkeeping:", v18);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPathWithInfos:", 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  objc_msgSend(v18, "setSelectionPath:", v20);
LABEL_12:

}

- (BOOL)handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  unsigned __int8 v41;
  unint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  objc_msgSend(v4, "unscaledTapPoint");
  v7 = v6;
  v9 = v8;
  v43 = (unint64_t)objc_msgSend(v4, "inputType");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelRepsForHitTesting"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v18 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v13).n128_u64[0];
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "info", v18));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "parentInfo"));
        v23 = sub_100221D0C(v20, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        *(_QWORD *)&v26 = objc_opt_class(CRLFreehandDrawingRep, v25).n128_u64[0];
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForInfo:", v24, v26));
        v30 = sub_100221D0C(v28, v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

        objc_msgSend(v11, "crl_addNonNilObject:", v31);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
    if ((v43 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v33 = 20.0;
    else
      v33 = 2.0;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allObjects"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "hitRep:withPrecision:inTopLevelReps:smallRepOutset:unscaledPointTransformForRep:passingTest:", (v43 & 0xFFFFFFFFFFFFFFFDLL) == 0, v34, 0, 0, v7, v9, v33));

    objc_opt_class(CRLFreehandDrawingRep, v36);
    v38 = sub_100221D0C(v37, v35);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    v40 = v39;
    if (v39)
      v41 = objc_msgSend(v39, "handledLassoTapAtPoint:withInputType:", v43, v7, v9);
    else
      v41 = 0;

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (BOOL)wantsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;

  y = a4.y;
  x = a4.x;
  v7 = (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitRep:withPrecision:", v7, x, y));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForDragging"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingToolkit"));
  v13 = objc_msgSend(v12, "isLassoAbleToSelectMixedType");

  if (!v10 || (v13 & 1) != 0)
  {
    if (!v10)
    {
LABEL_9:
      v26 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    *(_QWORD *)&v15 = objc_opt_class(CRLShapeRep, v14).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForDragging", v15));
    v19 = sub_100221D0C(v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "shapeInfo"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "containingGroup"));
    v23 = objc_msgSend(v22, "isFreehandDrawing");

    if ((v23 & 1) == 0)
      goto LABEL_9;
  }
  if ((objc_msgSend(v10, "isLocked") & 1) != 0 || !objc_msgSend(v10, "isSelected"))
    goto LABEL_9;
  objc_opt_class(CRLFreehandDrawingRep, v24);
  v26 = objc_opt_isKindOfClass(v10, v25) ^ 1;
LABEL_10:

  return v26 & 1;
}

- (id)p_allSelectableItemsToInteractWithFromLayouts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  __objc2_class **v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __objc2_class **p_superclass;
  void *i;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  double v21;
  objc_class *v22;
  objc_class *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *j;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  unsigned int v54;
  id v56;
  unsigned int v57;
  CRLFreehandDrawingToolMarquee *v58;
  uint64_t v59;
  id v60;
  id obj;
  void *v62;
  uint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];

  v4 = a3;
  v58 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isLassoAbleToSelectMixedType");

  v9 = off_101229810;
  v57 = v7;
  if (!v7)
    v9 = off_1012298A8;
  *(_QWORD *)&v10 = objc_opt_class(*v9, v8).n128_u64[0];
  v63 = v11;
  v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v10));
  if (objc_msgSend(v4, "count"))
  {
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    v56 = v4;
    obj = v4;
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    if (!v64)
      goto LABEL_44;
    v13 = *(_QWORD *)v70;
    p_superclass = &OBJC_METACLASS___CRLAXZorderButton.superclass;
    v59 = *(_QWORD *)v70;
    while (1)
    {
      for (i = 0; i != v64; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
        objc_opt_class(p_superclass + 359, v12);
        v18 = sub_100221D0C(v17, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_QWORD *)&v21 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v20).n128_u64[0];
        v23 = v22;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "info", v21));
        v25 = sub_1002223BC(v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

        if (!v19 || (objc_msgSend(v26, "locked") & 1) == 0)
        {
          if ((objc_opt_isKindOfClass(v16, v63) & 1) == 0
            || (*(_QWORD *)&v28 = objc_opt_class(p_superclass + 359, v27).n128_u64[0],
                (objc_msgSend(v16, "isMemberOfClass:", v29, v28) & 1) != 0))
          {
            if (!v19)
              goto LABEL_42;
            v30 = objc_alloc_init((Class)NSMutableArray);
            v31 = objc_alloc_init((Class)NSMutableArray);
            v62 = v26;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allNestedNonGroupChildItemsTreatingFreehandDrawingAsLeafNode"));
            v65 = 0u;
            v66 = 0u;
            v67 = 0u;
            v68 = 0u;
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            if (v33)
            {
              v35 = v33;
              v36 = *(_QWORD *)v66;
              do
              {
                for (j = 0; j != v35; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v66 != v36)
                    objc_enumerationMutation(v32);
                  v38 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
                  objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v34);
                  if ((objc_opt_isKindOfClass(v38, v39) & 1) != 0)
                    v40 = v30;
                  else
                    v40 = v31;
                  objc_msgSend(v40, "addObject:", v38);
                }
                v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
              }
              while (v35);
            }
            v41 = objc_msgSend(v30, "count");
            v42 = objc_msgSend(v31, "count");
            if (!v41 || v42)
            {
              if (!v41 && v42)
              {
                v13 = v59;
                p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLAXZorderButton + 8);
                v26 = v62;
                if (v57)
                  objc_msgSend(v60, "addObject:", v62);
LABEL_40:

LABEL_41:
                goto LABEL_42;
              }
              v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectedLayouts"));
              if (objc_msgSend(v53, "count"))
                v54 = v57;
              else
                v54 = 0;

              if (v54 == 1)
              {
                v26 = v62;
                objc_msgSend(v60, "addObject:", v62);
                v13 = v59;
                p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLAXZorderButton + 8);
                goto LABEL_40;
              }
            }
            objc_msgSend(v60, "addObjectsFromArray:", v30);
            v13 = v59;
            p_superclass = (__objc2_class **)(&OBJC_METACLASS___CRLAXZorderButton + 8);
            v26 = v62;
            goto LABEL_40;
          }
          v43 = v26;
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](v58, "icc"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "canvasEditor"));
          v46 = objc_msgSend(v45, "isLayoutSelectable:", v16);

          v26 = v43;
          if (!v46)
            goto LABEL_42;
          *(_QWORD *)&v48 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v47).n128_u64[0];
          v50 = v49;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info", v48));
          v52 = sub_100221D0C(v50, v51);
          v30 = (id)objc_claimAutoreleasedReturnValue(v52);

          if (v30)
            objc_msgSend(v60, "addObject:", v30);
          v26 = v43;
          goto LABEL_41;
        }
LABEL_42:

      }
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
      if (!v64)
      {
LABEL_44:

        v4 = v56;
        break;
      }
    }
  }

  return v60;
}

- (id)p_allSelectionIneligibleItemsWithinMarqueeSelectionAreaInParentContainerAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentForFreehandDrawingLayoutsAtPoint:", x, y));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "children"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:](self, "p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_arrayByTransformingWithBlock:", &stru_10125F6A8));
  return v10;
}

- (id)p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  double v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  CRLFreehandDrawingToolMarquee *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  uint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v6 = v4;
  v40 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v40)
  {
    v8 = *(_QWORD *)v42;
    v39 = *(_QWORD *)v42;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(CRLGroupLayout, v7);
        v12 = sub_100221D0C(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v14).n128_u64[0];
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "info", v15));
        v19 = sub_1002223BC(v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        if (!v13 || (objc_msgSend(v20, "locked") & 1) == 0)
        {
          objc_opt_class(CRLCanvasLayout, v21);
          if ((objc_opt_isKindOfClass(v10, v22) & 1) == 0
            || (*(_QWORD *)&v24 = objc_opt_class(CRLGroupLayout, v23).n128_u64[0],
                (objc_msgSend(v10, "isMemberOfClass:", v25, v24) & 1) != 0)
            || (*(_QWORD *)&v27 = objc_opt_class(CRLFreehandDrawingLayout, v26).n128_u64[0],
                (objc_msgSend(v10, "isMemberOfClass:", v28, v27) & 1) != 0))
          {
            if (v13 && (objc_msgSend(v20, "isFreehandDrawing") & 1) == 0)
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "children"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolMarquee p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:](self, "p_allSelectionIneligibleLayoutsWithinMarqueeSelectionAreaFromLayouts:", v29));
              objc_msgSend(v5, "addObjectsFromArray:", v30);

            }
          }
          else
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
            v32 = v6;
            v33 = self;
            v34 = v5;
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "canvasEditor"));
            v36 = objc_msgSend(v35, "isLayoutSelectable:", v10);

            v5 = v34;
            self = v33;
            v6 = v32;
            v8 = v39;

            if (v36)
              objc_msgSend(v5, "addObject:", v10);
          }
        }

        v9 = (char *)v9 + 1;
      }
      while (v40 != v9);
      v37 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      v40 = v37;
    }
    while (v37);
  }

  return v5;
}

- (void)p_presentEditMenuForLassoSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asiOSCVC"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDocumentMode"));

  objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v6);
  v8 = sub_100221D0C(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "presentEditMenuForLassoSelection");

}

- (void)p_hideEditMenuForLassoSelection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingTool icc](self, "icc"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asiOSCVC"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDocumentMode"));

  objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v6);
  v8 = sub_100221D0C(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "hideEditMenuForLassoSelection");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteMarqueeRenderable, 0);
  objc_storeStrong((id *)&self->_blackMarqueeRenderable, 0);
  objc_storeStrong((id *)&self->_windingCalculator, 0);
  objc_storeStrong((id *)&self->_selectionIneligiblePaths, 0);
  objc_storeStrong((id *)&self->_selectionEligiblePathToInfoDictionary, 0);
  objc_storeStrong((id *)&self->_hitTester, 0);
  objc_storeStrong((id *)&self->_hitTestingQueue, 0);
  objc_storeStrong((id *)&self->_pathCreator, 0);
}

@end
