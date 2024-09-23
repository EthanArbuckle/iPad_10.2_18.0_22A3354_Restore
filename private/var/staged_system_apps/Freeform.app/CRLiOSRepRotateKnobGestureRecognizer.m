@implementation CRLiOSRepRotateKnobGestureRecognizer

- (CRLiOSRepRotateKnobGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSRepRotateKnobGestureRecognizer *v5;
  CRLiOSRepRotateKnobGestureRecognizer *v6;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  v5 = -[CRLiOSRepRotateKnobGestureRecognizer initWithTarget:action:](&v9, "initWithTarget:action:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v8.receiver = v6;
    v8.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
    -[CRLiOSRepRotateKnobGestureRecognizer setAllowedTouchTypes:](&v8, "setAllowedTouchTypes:", &off_1012CAD68);
  }

  return v6;
}

- (void)reset
{
  CGPoint v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  -[CRLiOSRepRotateKnobGestureRecognizer reset](&v4, "reset");
  -[CRLiOSRepRotateKnobGestureRecognizer setTracker:](self, "setTracker:", 0);
  -[CRLiOSRepRotateKnobGestureRecognizer setRep:](self, "setRep:", 0);
  -[CRLiOSRepRotateKnobGestureRecognizer setKnob:](self, "setKnob:", 0);
  self->_rotatingAroundOppositeKnob = 0;
  self->_lastAngleInRadians = 0.0;
  v3 = CGPointZero;
  self->_unscaledRotationCenter = CGPointZero;
  self->_knobToTouchUnscaledOffset = v3;
  self->_repCenterInNaturalSpace = v3;
  self->_oppositeKnobPositionInNaturalSpace = (CGPoint)xmmword_100EEC438;
}

- (void)setAllowedTouchTypes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123FD20);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E05264();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123FD40);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer setAllowedTouchTypes:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 78, 0, "Should not be trying to customize the touch types for this gesture!");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  uint64_t v36;
  CRLCanvasKnob *v37;
  void *v38;
  void *v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  CRLCanvasRepRotateTracker *v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  CGFloat v62;
  double v63;
  void *v64;
  double v65;
  CRLCanvasKnob *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  objc_super v72;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FD60);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E05364();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FD80);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesBegan:withEvent:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 83, 0, "Only expect a single touch in this logic.");

  }
  if (-[CRLiOSRepRotateKnobGestureRecognizer state](self, "state"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FDA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E052E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FDC0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesBegan:withEvent:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 84, 0, "Only expect a touch to begin when we are possible.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tmCoordinator"));
  if ((-[CRLiOSRepRotateKnobGestureRecognizer state](self, "state")
     || !objc_msgSend(WeakRetained, "currentlyScrolling"))
    && (v72.receiver = self,
        v72.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer,
        -[CRLiOSRepRotateKnobGestureRecognizer touchesBegan:withEvent:](&v72, "touchesBegan:withEvent:", v6, v7),
        (-[CRLiOSRepRotateKnobGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) != 0))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
    objc_msgSend(v17, "locationInView:", v18);
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
    v20 = v19;
    v22 = v21;

    v71 = 0;
    v23 = objc_msgSend(WeakRetained, "hitKnobAtPoint:inputType:returningRep:", sub_10033831C((_BOOL8)objc_msgSend(v17, "type")), &v71, v20, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = v71;
    if (v24
      && (sub_100260884((char)objc_msgSend(v24, "tag")) & 0x3DE) != 0
      && (v70 = v25,
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layout")),
          v27 = objc_msgSend(v26, "supportsRotation"),
          v26,
          v25 = v70,
          v27))
    {
      v67 = v17;
      -[CRLiOSRepRotateKnobGestureRecognizer setRep:](self, "setRep:", v70);
      -[CRLiOSRepRotateKnobGestureRecognizer setKnob:](self, "setKnob:", v24);
      -[CRLiOSRepRotateKnobGestureRecognizer setState:](self, "setState:", 1);
      objc_msgSend(v70, "centerForRotation");
      self->_repCenterInNaturalSpace.x = v28;
      self->_repCenterInNaturalSpace.y = v29;
      v30 = sub_100260A54(-[CRLiOSRepRotateKnobGestureRecognizer p_standardKnobTagBeingDragged](self, "p_standardKnobTagBeingDragged"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
      v32 = v30;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "knobForTag:", v30));

      v69 = v33;
      if (v33)
      {
        objc_msgSend(v33, "position");
        self->_oppositeKnobPositionInNaturalSpace.x = v34;
        self->_oppositeKnobPositionInNaturalSpace.y = v35;
      }
      else if ((unint64_t)(v32 - 1) <= 8)
      {
        v36 = v32;
        v37 = [CRLCanvasKnob alloc];
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
        v66 = -[CRLCanvasKnob initWithType:position:radius:tag:onRep:](v37, "initWithType:position:radius:tag:onRep:", 0, v36, v38, CGPointZero.x, CGPointZero.y, 15.0);

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
        objc_msgSend(v40, "trackingBoundsForStandardKnobs");
        objc_msgSend(v39, "positionOfStandardKnob:forBounds:", v66);
        self->_oppositeKnobPositionInNaturalSpace.x = v41;
        self->_oppositeKnobPositionInNaturalSpace.y = v42;

      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "interactiveCanvasController", v66));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "customRotateTrackerForCurrentSelection"));
      -[CRLiOSRepRotateKnobGestureRecognizer setTracker:](self, "setTracker:", v44);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
      v17 = v67;
      if (!v45)
      {
        v47 = -[CRLCanvasRepRotateTracker initWithRep:]([CRLCanvasRepRotateTracker alloc], "initWithRep:", v70);
        -[CRLiOSRepRotateKnobGestureRecognizer setTracker:](self, "setTracker:", v47);

      }
      *(_QWORD *)&v48 = objc_opt_class(CRLCanvasRepRotateTracker, v46).n128_u64[0];
      v50 = v49;
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker", v48));
      v52 = sub_100221D0C(v50, v51);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

      if (v53)
      {
        objc_msgSend(v53, "setShouldRespectScaledHUDPosition:", 1);
        objc_msgSend(v53, "setShouldShowGuides:", 0);
      }
      v68 = v53;
      -[CRLiOSRepRotateKnobGestureRecognizer addTarget:action:](self, "addTarget:action:", v15, "handleGestureRecognizer:");
      objc_msgSend(v16, "registerTrackerManipulator:", self);
      v25 = v70;
      if (objc_msgSend(v16, "takeControlWithTrackerManipulator:", self))
      {
        if (objc_msgSend(v15, "isInPossibleDynamicOperation"))
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentlyTransformingReps"));
          objc_msgSend(v15, "stopTransformingReps:", v54);

        }
        objc_msgSend(v15, "beginOperation");
        v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "repsBeingRotated"));
        objc_msgSend(v15, "startTransformingReps:", v56);

        v25 = v70;
      }
      objc_msgSend(v24, "position");
      objc_msgSend(v25, "convertNaturalPointToUnscaledCanvas:");
      self->_knobToTouchUnscaledOffset.x = sub_1000603B8(v57, v58, v20);
      self->_knobToTouchUnscaledOffset.y = v59;
      self->_rotatingAroundOppositeKnob = -[CRLiOSRepRotateKnobGestureRecognizer p_shouldRotateAroundOppositeKnob](self, "p_shouldRotateAroundOppositeKnob");
      -[CRLiOSRepRotateKnobGestureRecognizer p_rotationCenterInUnscaledSpace](self, "p_rotationCenterInUnscaledSpace");
      v61 = v60;
      v63 = v62;
      self->_unscaledRotationCenter.x = v60;
      self->_unscaledRotationCenter.y = v62;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
      objc_msgSend(v64, "setUnscaledCenterForRotation:", v61, v63);

      -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", v20, v22);
      self->_lastAngleInRadians = v65;
      -[CRLiOSRepRotateKnobGestureRecognizer p_updateTrackerStateAtUnscaledPoint:](self, "p_updateTrackerStateAtUnscaledPoint:", v20, v22);

    }
    else
    {
      -[CRLiOSRepRotateKnobGestureRecognizer setState:](self, "setState:", 5);
    }

  }
  else
  {
    -[CRLiOSRepRotateKnobGestureRecognizer setState:](self, "setState:", 5);
  }

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  v6 = a3;
  -[CRLiOSRepRotateKnobGestureRecognizer touchesMoved:withEvent:](&v14, "touchesMoved:withEvent:", v6, a4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject", v14.receiver, v14.super_class));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v8, "locationInView:", v9);
  objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
  v11 = v10;
  v13 = v12;

  -[CRLiOSRepRotateKnobGestureRecognizer p_updateTrackerStateAtUnscaledPoint:](self, "p_updateTrackerStateAtUnscaledPoint:", v11, v13);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  -[CRLiOSRepRotateKnobGestureRecognizer touchesEnded:withEvent:](&v9, "touchesEnded:withEvent:", a3, a4);
  if (-[CRLiOSRepRotateKnobGestureRecognizer state](self, "state"))
  {
    v5 = 3;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FDE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E053E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123FE00);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepRotateKnobGestureRecognizer touchesEnded:withEvent:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepRotateKnobGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 184, 0, "Should have made a decision before touchesEnded");

    v5 = 5;
  }
  -[CRLiOSRepRotateKnobGestureRecognizer setState:](self, "setState:", v5);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  unint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSRepRotateKnobGestureRecognizer;
  -[CRLiOSRepRotateKnobGestureRecognizer touchesCancelled:withEvent:](&v6, "touchesCancelled:withEvent:", a3, a4);
  v5 = (unint64_t)-[CRLiOSRepRotateKnobGestureRecognizer state](self, "state");
  if (v5 <= 5)
    -[CRLiOSRepRotateKnobGestureRecognizer setState:](self, "setState:", qword_100EED7C8[v5]);
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasRepRotateTracking)tracker
{
  return self->_tracker;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSRepRotateKnobGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  id WeakRetained;
  CRLCanvasRepRotateTracking *tracker;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));

  if (self->_tracker)
  {
    -[CRLiOSRepRotateKnobGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v5, "handleGestureRecognizer:");
    tracker = self->_tracker;
    self->_tracker = 0;

  }
}

- (void)p_updateTrackerStateAtUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  float64x2_t v36;
  float64x2_t v37;
  float64x2_t v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  id WeakRetained;
  __int128 v49;
  __int128 v50;
  float64x2_t v51;
  float64x2_t v52;
  float64x2_t v53;
  float64x2_t v54;

  y = a3.y;
  x = a3.x;
  if (((unint64_t)-[CRLiOSRepRotateKnobGestureRecognizer modifierFlags](self, "modifierFlags") & 0x20000) != 0)
    v6 = 22.5;
  else
    v6 = 0.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
  objc_msgSend(v7, "setSnapThreshold:", v6);

  -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", x, y);
  v9 = v8;
  v10 = v8 - self->_lastAngleInRadians;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
  objc_msgSend(v11, "addRotateDelta:", v10);

  self->_lastAngleInRadians = v9;
  v12 = -[CRLiOSRepRotateKnobGestureRecognizer p_shouldRotateAroundOppositeKnob](self, "p_shouldRotateAroundOppositeKnob");
  if (self->_rotatingAroundOppositeKnob != v12)
  {
    self->_rotatingAroundOppositeKnob = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
    objc_msgSend(v14, "currentTotalAngleOfRotationInRadians");
    v16 = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
    objc_msgSend(v17, "addRotateDelta:", -v16);

    -[CRLiOSRepRotateKnobGestureRecognizer p_rotationCenterInUnscaledSpace](self, "p_rotationCenterInUnscaledSpace");
    v19 = v18;
    v21 = v20;
    self->_unscaledRotationCenter.x = v18;
    self->_unscaledRotationCenter.y = v20;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
    objc_msgSend(v22, "setUnscaledCenterForRotation:", v19, v21);

    -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", x, y);
    v24 = v23;
    v25 = -[CRLiOSRepRotateKnobGestureRecognizer p_standardKnobTagBeingDragged](self, "p_standardKnobTagBeingDragged");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
    objc_msgSend(v26, "boundsForStandardKnobs");
    *(double *)&v31 = sub_100260E54(v25, v27, v28, v29, v30);
    v49 = v32;
    v50 = v31;

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layout"));
    v35 = v34;
    if (v34)
    {
      objc_msgSend(v34, "originalTransformInRoot", v49, v50);
      v36 = v52;
      v37 = v53;
      v38 = v54;
    }
    else
    {
      v38 = 0uLL;
      v36 = 0uLL;
      v37 = 0uLL;
    }
    v51 = vaddq_f64(v38, vmlaq_n_f64(vmulq_n_f64(v37, *(double *)&v49), v36, *(double *)&v50));

    -[CRLiOSRepRotateKnobGestureRecognizer p_angleInRadiansForPoint:](self, "p_angleInRadiansForPoint:", *(_OWORD *)&v51);
    v40 = v24 - v39;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker"));
    objc_msgSend(v41, "addRotateDelta:", v40);

    self->_lastAngleInRadians = v24;
  }
  *(_QWORD *)&v42 = objc_opt_class(CRLCanvasRepRotateTracker, v13).n128_u64[0];
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer tracker](self, "tracker", v42));
  v46 = sub_100221D0C(v44, v45);
  v47 = (void *)objc_claimAutoreleasedReturnValue(v46);

  if (v47)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    objc_msgSend(WeakRetained, "convertUnscaledToBoundsPoint:", x, y);
    objc_msgSend(v47, "setScaledHUDPosition:");

  }
}

- (double)p_angleInRadiansForPoint:(CGPoint)a3
{
  double v3;
  long double v4;

  v3 = sub_1000603B8(a3.x, a3.y, self->_unscaledRotationCenter.x);
  return sub_100061F34(v3, v4);
}

- (BOOL)p_shouldRotateAroundOppositeKnob
{
  unsigned int v3;

  v3 = -[CRLiOSRepRotateKnobGestureRecognizer modifierFlags](self, "modifierFlags");
  return !sub_100061890(self->_oppositeKnobPositionInNaturalSpace.x, self->_oppositeKnobPositionInNaturalSpace.y) & (v3 >> 19);
}

- (CGPoint)p_rotationCenterInUnscaledSpace
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  CGPoint result;

  -[CRLiOSRepRotateKnobGestureRecognizer p_rotationCenterInNaturalSpace](self, "p_rotationCenterInNaturalSpace");
  v13 = v4;
  v14 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layout"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "originalTransformInRoot");
    v8 = v16;
    v9 = v17;
    v10 = v18;
  }
  else
  {
    v10 = 0uLL;
    v8 = 0uLL;
    v9 = 0uLL;
  }
  v15 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v9, v13), v8, v14));

  v12 = v15.f64[1];
  v11 = v15.f64[0];
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)p_rotationCenterInParentSpace
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float64x2_t v15;
  float64x2_t v16;
  float64x2_t v17;
  float64x2_t v18;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer rep](self, "rep"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalGeometry"));

  -[CRLiOSRepRotateKnobGestureRecognizer p_rotationCenterInNaturalSpace](self, "p_rotationCenterInNaturalSpace");
  if (v5)
  {
    v13 = v7;
    v14 = v6;
    objc_msgSend(v5, "transform");
    v7 = v13;
    v6 = v14;
    v9 = v16;
    v8 = v17;
    v10 = v18;
  }
  else
  {
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
  }
  v15 = vaddq_f64(v10, vmlaq_n_f64(vmulq_n_f64(v8, v7), v9, v6));

  v12 = v15.f64[1];
  v11 = v15.f64[0];
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)p_rotationCenterInNaturalSpace
{
  int *v2;
  double *v3;
  double v4;
  double v5;
  CGPoint result;

  if (self->_rotatingAroundOppositeKnob)
    v2 = &OBJC_IVAR___CRLiOSRepRotateKnobGestureRecognizer__oppositeKnobPositionInNaturalSpace;
  else
    v2 = &OBJC_IVAR___CRLiOSRepRotateKnobGestureRecognizer__repCenterInNaturalSpace;
  v3 = (double *)((char *)self + *v2);
  v4 = *v3;
  v5 = v3[1];
  result.y = v5;
  result.x = v4;
  return result;
}

- (unint64_t)p_standardKnobTagBeingDragged
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepRotateKnobGestureRecognizer knob](self, "knob"));
  v3 = objc_msgSend(v2, "tag");

  return (unint64_t)v3;
}

- (CRLCanvasKnob)knob
{
  return self->_knob;
}

- (void)setKnob:(id)a3
{
  objc_storeStrong((id *)&self->_knob, a3);
}

- (CRLCanvasRep)rep
{
  return self->_rep;
}

- (void)setRep:(id)a3
{
  objc_storeStrong((id *)&self->_rep, a3);
}

- (void)setTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_rep, 0);
  objc_storeStrong((id *)&self->_knob, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
