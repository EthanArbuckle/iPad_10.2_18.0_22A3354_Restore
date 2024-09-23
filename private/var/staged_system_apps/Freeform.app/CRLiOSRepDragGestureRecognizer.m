@implementation CRLiOSRepDragGestureRecognizer

- (CRLiOSRepDragGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSRepDragGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *mOriginalPointsInWindow;
  NSMapTable *v11;
  NSMapTable *mOriginalTimestamps;
  NSMutableSet *v13;
  NSMutableSet *mTouchesDownOnReps;
  NSMutableSet *v15;
  NSMutableSet *mTouchesDownOnCanvas;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  v5 = -[CRLiOSRepDragGestureRecognizer initWithTarget:action:](&v18, "initWithTarget:action:", 0, 0);
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248CA8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E132B4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101248CC8);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 108, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->mICC, v4);
    v9 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    mOriginalPointsInWindow = v5->mOriginalPointsInWindow;
    v5->mOriginalPointsInWindow = v9;

    v11 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    mOriginalTimestamps = v5->mOriginalTimestamps;
    v5->mOriginalTimestamps = v11;

    v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mTouchesDownOnReps = v5->mTouchesDownOnReps;
    v5->mTouchesDownOnReps = v13;

    v15 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mTouchesDownOnCanvas = v5->mTouchesDownOnCanvas;
    v5->mTouchesDownOnCanvas = v15;

    v5->mDragState = 0;
  }

  return v5;
}

- (CRLiOSRepDragGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v4;
  unsigned int v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  unsigned int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;

  v4 = a3;
  v5 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101248CE8);
  v6 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v15 = v5;
    v16 = 2082;
    v17 = "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]";
    v18 = 2082;
    v19 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m";
    v20 = 1024;
    v21 = 122;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101248D08);
  v7 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v8 = v7;
    v9 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v15 = v5;
    v16 = 2114;
    v17 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 122, 0, "Do not call method");

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSRepDragGestureRecognizer initWithTarget:action:]"));
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v12, 0));

  objc_exception_throw(v13);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLiOSRepDragGestureRecognizer p_cancelDelayedStartTracking](self, "p_cancelDelayedStartTracking");
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer dealloc](&v3, "dealloc");
}

- (void)reset
{
  void *v3;
  NSTimer *mConstrainingTimer;
  NSTimer *v5;
  void *v6;
  void *v7;
  CRLiOSRepDragGestureRecognizer *v8;
  void *v9;
  CRLCanvasRepDragTracker *mTracker;
  void *v11;
  void *v12;
  CRLCanvasRepDragTracker *v13;
  CRLCanvasAutoscroll *mAutoscroll;
  UITouch *mTouch;
  CRLCanvasRep *mRep;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  if (qword_10147E5B0 != -1)
    dispatch_once(&qword_10147E5B0, &stru_101248D28);
  v3 = off_1013DAFA8;
  if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
    sub_100E133E0(v3);
  v21.receiver = self;
  v21.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer reset](&v21, "reset");
  -[CRLiOSRepDragGestureRecognizer p_cancelDelayedStartTracking](self, "p_cancelDelayedStartTracking");
  mConstrainingTimer = self->mConstrainingTimer;
  if (mConstrainingTimer)
  {
    -[NSTimer invalidate](mConstrainingTimer, "invalidate");
    v5 = self->mConstrainingTimer;
    self->mConstrainingTimer = 0;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tmCoordinator"));
  v8 = (CRLiOSRepDragGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controllingTM"));

  if (v8 == self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tmCoordinator"));
    objc_msgSend(v9, "relinquishTrackerManipulatorControl:", self);

  }
  mTracker = self->mTracker;
  if (mTracker)
  {
    -[CRLCanvasRepDragTracker endPossibleRepDragGesture](mTracker, "endPossibleRepDragGesture");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
    -[CRLiOSRepDragGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v11, "handleGestureRecognizer:");

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tmCoordinator"));
    objc_msgSend(v12, "unregisterTrackerManipulator:", self);

    v13 = self->mTracker;
    self->mTracker = 0;

  }
  mAutoscroll = self->mAutoscroll;
  if (mAutoscroll)
    -[CRLCanvasAutoscroll invalidate](mAutoscroll, "invalidate");
  mTouch = self->mTouch;
  self->mTouch = 0;

  mRep = self->mRep;
  self->mRep = 0;

  self->mPassedDragThreshold = 0;
  self->mDragDelayElapsed = 0;
  self->mTouchDelta = CGPointZero;
  self->mEndedWithNudgeInControl = 0;
  self->mPossibleContentionWithSystemDrag = 0;
  self->mDragState = 0;
  if (self->mShouldCloseCommandGroupWhenOperationCompletes)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248D48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E13360();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248D68);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer reset]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 170, 0, "Should close group before resetting");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));
    objc_msgSend(v20, "closeGroup");

    self->mShouldCloseCommandGroupWhenOperationCompletes = 0;
  }
  -[NSMutableSet removeAllObjects](self->mTouchesDownOnReps, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->mTouchesDownOnCanvas, "removeAllObjects");
  self->mShouldConstrainDueToAdditionalTouches = 0;

}

- (void)setState:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  CRLiOSRepDragGestureRecognizer *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  if (-[CRLiOSRepDragGestureRecognizer state](self, "state") != (id)a3)
  {
    if (qword_10147E5B0 != -1)
      dispatch_once(&qword_10147E5B0, &stru_101248D88);
    v5 = off_1013DAFA8;
    if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
      sub_100E134E0(a3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tmCoordinator"));

    if (a3 == 3)
    {
      v8 = (CRLiOSRepDragGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controllingTM"));

      if (v8 != self)
      {
        if ((objc_msgSend(v7, "takeControlWithTrackerManipulator:", self) & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101248DA8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E13460();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101248DC8);
          v9 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer setState:]"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 186, 0, "drag failed to take control!");

        }
        self->mEndedWithNudgeInControl = 1;
      }
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer setState:](&v12, "setState:", a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  NSMapTable *mOriginalPointsInWindow;
  void *v18;
  void *v19;
  NSMapTable *mOriginalTimestamps;
  void *v21;
  id v22;
  __int128 v23;
  CRLiOSRepDragGestureRecognizer *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  UITouch *mTouch;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  NSTimer *mConstrainingTimer;
  id *p_mTouch;
  void *v41;
  CRLCanvasRep *v42;
  void *v43;
  id v44;
  void *v45;
  double *p_x;
  id v47;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  _BOOL8 v51;
  id v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  _BOOL8 v59;
  id v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  uint64_t v64;
  NSTimer *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  CRLCanvasRep *mRep;
  void *v70;
  CRLCanvasRep *v71;
  CRLCanvasRep *v72;
  void *v73;
  id v74;
  CRLCanvasRep *v75;
  CRLCanvasRep *v76;
  void *v77;
  uint64_t v78;
  double v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  unsigned __int8 v87;
  unsigned int v88;
  NSObject *v89;
  unsigned int v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  int64_t mDragType;
  NSObject *v96;
  void *v97;
  id v98;
  __int128 v99;
  void *v100;
  id v101;
  CRLCanvasRep *v102;
  id v103;
  void *v104;
  uint64_t v105;
  void *v106;
  id obj;
  id obja;
  CRLiOSRepDragGestureRecognizer *v109;
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  objc_super v119;
  uint8_t buf[4];
  _BYTE v121[14];
  __int16 v122;
  const char *v123;
  __int16 v124;
  int v125;
  _BYTE v126[128];
  _BYTE v127[128];

  v6 = a3;
  v119.receiver = self;
  v119.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer touchesBegan:withEvent:](&v119, "touchesBegan:withEvent:", v6, a4);
  if (qword_10147E5B0 != -1)
    dispatch_once(&qword_10147E5B0, &stru_101248DE8);
  v7 = off_1013DAFA8;
  if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
    sub_100E13604(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asUIKitHost"));

  if (!-[CRLiOSRepDragGestureRecognizer state](self, "state") && objc_msgSend(v8, "currentlyScrolling"))
  {
    if (qword_10147E5B0 != -1)
      dispatch_once(&qword_10147E5B0, &stru_101248E08);
    if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
      sub_100E13580();
    -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 5);
    goto LABEL_106;
  }
  v106 = v10;
  v104 = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tmCoordinator"));
  v109 = self;
  objc_msgSend(v11, "registerTrackerManipulator:", self);

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v101 = v6;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        mOriginalPointsInWindow = v109->mOriginalPointsInWindow;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
        objc_msgSend(v16, "locationInView:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        -[NSMapTable setObject:forKey:](mOriginalPointsInWindow, "setObject:forKey:", v19, v16);

        mOriginalTimestamps = v109->mOriginalTimestamps;
        objc_msgSend(v16, "timestamp");
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMapTable setObject:forKey:](mOriginalTimestamps, "setObject:forKey:", v21, v16);

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v127, 16);
    }
    while (v13);
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  obja = obj;
  v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
  v24 = v109;
  v8 = v104;
  v10 = v106;
  if (v22)
  {
    v25 = v22;
    v26 = *(_QWORD *)v112;
    *(_QWORD *)&v23 = 67109378;
    v99 = v23;
    v105 = *(_QWORD *)v112;
    do
    {
      v27 = 0;
      v103 = v25;
      do
      {
        if (*(_QWORD *)v112 != v26)
          objc_enumerationMutation(obja);
        v28 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)v27);
        if (-[CRLiOSRepDragGestureRecognizer state](v24, "state", v99))
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRepWithTouch:", v28));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "repForDragging"));

          if (!v30
            || (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "multiSelectGestureRecognizer")),
                v32 = objc_msgSend(v31, "state"),
                v31,
                v33 = v32 == (id)5,
                v10 = v106,
                v33))
          {
            -[NSMutableSet addObject:](v24->mTouchesDownOnCanvas, "addObject:", v28);
            if (!v24->mConstrainingTimer)
            {
              if (-[NSMutableSet count](v24->mTouchesDownOnReps, "count") == (id)1)
              {
                mTouch = v109->mTouch;
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
                -[UITouch locationInView:](mTouch, "locationInView:", v35);
                objc_msgSend(v8, "convertBoundsToUnscaledPoint:");
                v109->mOnlyTouchDownLocation.x = v36;
                v109->mOnlyTouchDownLocation.y = v37;
                v24 = v109;

                v109->mPassedDragThreshold = 0;
              }
              v38 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v24, "p_beginConstraining", 0, 0, 0.2));
              mConstrainingTimer = v24->mConstrainingTimer;
              v24->mConstrainingTimer = (NSTimer *)v38;

            }
          }
          else
          {
            -[NSMutableSet addObject:](v24->mTouchesDownOnReps, "addObject:", v28);
          }

        }
        else
        {
          p_mTouch = (id *)&v24->mTouch;
          if (v24->mTouch)
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hitRepWithTouch:", v28));
            v42 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "repForDragging"));

            if (v42)
            {
              if (v24->mRep == v42)
              {
                -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);

                goto LABEL_91;
              }
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "multiSelectGestureRecognizer"));
              v44 = objc_msgSend(v43, "state");

              if (v44 == (id)5)
              {
                -[NSMutableSet addObject:](v24->mTouchesDownOnCanvas, "addObject:", v28);
                v10 = v106;
                if (!v24->mConstrainingTimer)
                {
LABEL_44:
                  if (-[NSMutableSet count](v24->mTouchesDownOnReps, "count") == (id)1)
                  {
                    v60 = *p_mTouch;
                    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
                    objc_msgSend(v60, "locationInView:", v61);
                    objc_msgSend(v8, "convertBoundsToUnscaledPoint:");
                    v109->mOnlyTouchDownLocation.x = v62;
                    v109->mOnlyTouchDownLocation.y = v63;
                    v24 = v109;

                    v109->mPassedDragThreshold = 0;
                  }
                  v64 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v24, "p_beginConstraining", 0, 0, 0.2));
                  v65 = v24->mConstrainingTimer;
                  v24->mConstrainingTimer = (NSTimer *)v64;

                }
              }
              else
              {
                -[NSMutableSet addObject:](v24->mTouchesDownOnReps, "addObject:", v28);
                v24->mPassedDragThreshold = 0;
                v10 = v106;
              }
            }
            else
            {
              -[NSMutableSet addObject:](v24->mTouchesDownOnCanvas, "addObject:", v28);
              if (!v24->mConstrainingTimer)
                goto LABEL_44;
            }

LABEL_50:
            v26 = v105;
            goto LABEL_51;
          }
          objc_storeStrong((id *)&v24->mTouch, v28);
          v45 = v8;
          p_x = &v24->mOnlyTouchDownLocation.x;
          v47 = *p_mTouch;
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "canvasView"));
          objc_msgSend(v47, "locationInView:", v48);
          objc_msgSend(v45, "convertBoundsToUnscaledPoint:");
          v24->mOnlyTouchDownLocation.x = v49;
          v24->mOnlyTouchDownLocation.y = v50;

          v51 = sub_10033831C((_BOOL8)objc_msgSend(*p_mTouch, "type"));
          if (objc_msgSend(*p_mTouch, "tapCount") != (id)1)
          {
            -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);
            v8 = v45;
            goto LABEL_50;
          }
          v52 = *p_mTouch;
          v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "canvasView"));
          objc_msgSend(v52, "locationInView:", v53);
          objc_msgSend(v45, "convertBoundsToUnscaledPoint:");
          v55 = v54;
          v57 = v56;

          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "freehandDrawingToolkit"));
          LOBYTE(v53) = objc_msgSend(v58, "currentToolAllowsDragForTouchType:atUnscaledPoint:", objc_msgSend(*p_mTouch, "type"), v55, v57);

          if ((v53 & 1) == 0)
          {
            if (qword_10147E5B0 != -1)
              dispatch_once(&qword_10147E5B0, &stru_101248E28);
            v6 = v101;
            v8 = v104;
            v10 = v106;
            if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
              sub_100E135D8();
            -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);
            goto LABEL_105;
          }
          v59 = objc_msgSend(*p_mTouch, "type") == (id)2 || objc_msgSend(*p_mTouch, "type") == (id)3;
          v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "hitRep:withPrecision:", v59, *p_x, v24->mOnlyTouchDownLocation.y));
          v67 = (void *)v66;
          if (v59 && !v66)
            v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "hitRep:withPrecision:", 0, *p_x, v24->mOnlyTouchDownLocation.y));
          v68 = objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "repForDragging"));
          mRep = v24->mRep;
          v24->mRep = (CRLCanvasRep *)v68;

          v70 = v67;
          v71 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "repForSelecting"));
          v72 = v24->mRep;

          if (v71 != v72)
          {
            if (qword_10147E5B0 != -1)
              dispatch_once(&qword_10147E5B0, &stru_101248E48);
            v6 = v101;
            v8 = v104;
            v10 = v106;
            if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
              sub_100E135AC();
            -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);

LABEL_105:
            goto LABEL_106;
          }
          v110 = 0;
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "hitKnobAtPoint:inputType:returningRep:", v51, &v110, *p_x, v24->mOnlyTouchDownLocation.y));
          v74 = v110;
          v75 = v24->mRep;
          if (!v75 || v73)
          {
            -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);
            v8 = v104;
            v26 = v105;
            v85 = v70;
            v25 = v103;
          }
          else
          {
            -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](v75, "convertNaturalPointFromUnscaledCanvas:", *p_x, v24->mOnlyTouchDownLocation.y);
            v102 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep hitRepChrome:passingTest:](v75, "hitRepChrome:passingTest:", 0));
            v24->mHitRepChrome = v24->mRep == v102;
            -[NSMutableSet addObject:](v24->mTouchesDownOnReps, "addObject:", v28);
            v24->mDragType = -[CRLCanvasRep dragTypeAtCanvasPoint:forTouchType:](v24->mRep, "dragTypeAtCanvasPoint:forTouchType:", objc_msgSend(*p_mTouch, "type"), *p_x, v24->mOnlyTouchDownLocation.y);
            v76 = v24->mRep;
            v8 = v104;
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "canvasView"));
            objc_msgSend(v28, "locationInView:", v77);
            objc_msgSend(v104, "convertBoundsToUnscaledPoint:");
            v24->mHUDAndGuidesType = -[CRLCanvasRep dragHUDAndGuidesTypeAtCanvasPoint:](v76, "dragHUDAndGuidesTypeAtCanvasPoint:");

            v24->mDragState = 1;
            *(_QWORD *)&v79 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v78).n128_u64[0];
            v81 = v80;
            v82 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](v24->mRep, "info", v79));
            v83 = sub_100221D0C(v81, v82);
            v84 = (void *)objc_claimAutoreleasedReturnValue(v83);

            v85 = v70;
            v25 = v103;
            if (objc_msgSend(v84, "allowedToBeDragAndDropped"))
            {
              v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "canvasEditor"));
              if ((objc_msgSend(v86, "canvasEditorCanCopyWithSender:", 0) & 1) != 0)
              {
                v87 = +[UIDevice crl_phoneDevice](UIDevice, "crl_phoneDevice");

                if ((v87 & 1) == 0)
                  v24->mPossibleContentionWithSystemDrag = 1;
              }
              else
              {

              }
            }
            if (!v24->mHUDAndGuidesType && v24->mDragType)
            {
              v88 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101248E68);
              v89 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v121 = v88;
                *(_WORD *)&v121[4] = 2082;
                *(_QWORD *)&v121[6] = "-[CRLiOSRepDragGestureRecognizer touchesBegan:withEvent:]";
                v122 = 2082;
                v123 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m";
                v124 = 1024;
                v125 = 281;
                _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d attempted to not show HUD and guides during a drag", buf, 0x22u);
              }
              v90 = v88;
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101248E88);
              v100 = v84;
              v91 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
              {
                v96 = v91;
                v97 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = v99;
                *(_DWORD *)v121 = v90;
                *(_WORD *)&v121[4] = 2114;
                *(_QWORD *)&v121[6] = v97;
                _os_log_error_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer touchesBegan:withEvent:]"));
              v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v92, v93, 281, 0, "attempted to not show HUD and guides during a drag");

              v84 = v100;
            }
            if (qword_10147E5B0 != -1)
              dispatch_once(&qword_10147E5B0, &stru_101248EA8);
            v94 = off_1013DAFA8;
            if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
            {
              mDragType = v24->mDragType;
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v121 = mDragType;
              _os_log_debug_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEBUG, "drag type %li", buf, 0xCu);
            }
            v26 = v105;
            switch(v24->mDragType)
            {
              case 0:
                -[CRLiOSRepDragGestureRecognizer setState:](v24, "setState:", 5);
                break;
              case 1:
              case 2:
              case 3:
                -[CRLiOSRepDragGestureRecognizer p_createDelayCallback](v24, "p_createDelayCallback");
                break;
              default:
                break;
            }
            if (v24->mHUDAndGuidesType == 1)
              -[CRLiOSRepDragGestureRecognizer p_beginTracking](v24, "p_beginTracking");

          }
          v10 = v106;
        }
LABEL_51:
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      v98 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v111, v126, 16);
      v25 = v98;
    }
    while (v98);
  }
LABEL_91:

  v6 = v101;
  if (v24->mTracker && v24->mTouch && -[CRLiOSRepDragGestureRecognizer state](v24, "state") != (id)5)
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](v24, "p_setTrackerPoints");
LABEL_106:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  float v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  NSTimer *mConstrainingTimer;
  NSTimer *v26;
  int64_t mDragType;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  UITouchType v33;
  BOOL v36;
  double v37;
  float v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  UITouch *mTouch;
  void *v51;
  double v52;
  double v53;
  void *v54;
  NSMapTable *mOriginalPointsInWindow;
  UITouch *v56;
  NSObject *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  UITouch *v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  UITouchType v68;
  BOOL v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  CGFloat v85;
  float v86;
  _BOOL4 mPassedDragThreshold;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  objc_super v92;
  uint8_t v93[128];
  uint8_t buf[4];
  _BOOL4 v95;
  __int16 v96;
  double v97;
  __int16 v98;
  double v99;

  v6 = a3;
  v92.receiver = self;
  v92.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer touchesMoved:withEvent:](&v92, "touchesMoved:withEvent:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  if ((objc_msgSend(v6, "containsObject:", self->mTouch) & 1) != 0)
  {
    v8 = (char *)-[CRLiOSRepDragGestureRecognizer state](self, "state");
    if ((unint64_t)(v8 - 1) >= 2)
    {
      if (!v8)
      {
        mDragType = self->mDragType;
        -[UITouch timestamp](self->mTouch, "timestamp");
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mOriginalTimestamps, "objectForKey:", self->mTouch));
        objc_msgSend(v30, "doubleValue");
        v32 = v29 - v31;
        v33 = -[UITouch type](self->mTouch, "type");
        v36 = v32 < 0.02 && v33 == UITouchTypeDirect || v33 == UITouchTypeIndirectPointer;
        if (mDragType == 3 && v36)
        {
          v37 = 0.05;
        }
        else
        {
          v38 = v32;
          v37 = (fminf(fmaxf(v38, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 14.0;
        }

        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKeyedSubscript:](self->mOriginalTimestamps, "objectForKeyedSubscript:", self->mTouch));
        -[UITouch timestamp](self->mTouch, "timestamp");
        v41 = v40;
        objc_msgSend(v39, "doubleValue");
        v43 = v41 - v42;
        if (!self->mPossibleContentionWithSystemDrag || (v43 < 3.0 ? (v44 = v43 <= 0.7) : (v44 = 1), v44))
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mOriginalPointsInWindow, "objectForKey:", self->mTouch));
          objc_msgSend(v45, "CGPointValue");
          v47 = v46;
          v49 = v48;
          mTouch = self->mTouch;
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](mTouch, "window"));
          -[UITouch locationInView:](mTouch, "locationInView:", v51);
          self->mPassedDragThreshold = sub_10006108C(v47, v49, v52, v53) >= v37;

          if (qword_10147E5B0 != -1)
            dispatch_once(&qword_10147E5B0, &stru_101248EC8);
          v54 = off_1013DAFA8;
          if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
          {
            mPassedDragThreshold = self->mPassedDragThreshold;
            mOriginalPointsInWindow = self->mOriginalPointsInWindow;
            v56 = self->mTouch;
            v57 = v54;
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](mOriginalPointsInWindow, "objectForKey:", v56));
            objc_msgSend(v58, "CGPointValue");
            v60 = v59;
            v62 = v61;
            v63 = self->mTouch;
            v64 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](v63, "window"));
            -[UITouch locationInView:](v63, "locationInView:", v64);
            v67 = sub_10006108C(v60, v62, v65, v66);
            v68 = -[UITouch type](self->mTouch, "type");
            v71 = v43 < 0.02 && v68 == UITouchTypeDirect || v68 == UITouchTypeIndirectPointer;
            if (mDragType == 3 && v71)
            {
              v72 = 0.05;
            }
            else
            {
              v86 = v43;
              v72 = (fminf(fmaxf(v86, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 14.0;
            }
            *(_DWORD *)buf = 67109632;
            v95 = mPassedDragThreshold;
            v96 = 2048;
            v97 = v67;
            v98 = 2048;
            v99 = v72;
            _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "passed drag threshold: %i (%f >= %f?)", buf, 0x1Cu);

          }
        }
        else
        {
          if (qword_10147E5B0 != -1)
            dispatch_once(&qword_10147E5B0, &stru_101248EE8);
          if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
            sub_100E13674();
        }

        if (-[CRLiOSRepDragGestureRecognizer p_canBeginDrag](self, "p_canBeginDrag"))
        {
          if (!self->mDragDelayElapsed)
            -[CRLiOSRepDragGestureRecognizer p_cancelDelayedStartTracking](self, "p_cancelDelayedStartTracking");
          -[CRLiOSRepDragGestureRecognizer p_beginGesture](self, "p_beginGesture");
        }
      }
    }
    else if (-[NSMutableSet count](self->mTouchesDownOnReps, "count") == (id)1)
    {
      if (self->mPassedDragThreshold)
        goto LABEL_74;
      -[CRLiOSRepDragGestureRecognizer currentPosition](self, "currentPosition");
      v11 = sub_10006108C(self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y, v9, v10);
      -[UITouch timestamp](self->mTouch, "timestamp");
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mOriginalTimestamps, "objectForKey:", self->mTouch));
      objc_msgSend(v14, "doubleValue");
      v16 = v13 - v15;
      -[UITouch type](self->mTouch, "type");
      v17 = v16;
      self->mPassedDragThreshold = v11 >= 14.0 * (fminf(fmaxf(v17, 0.0), 2.0) * 1.25 * 0.5 + 0.25);

      if (self->mPassedDragThreshold)
      {
LABEL_74:
        if (-[CRLCanvasRepDragTracker didBeginDrag](self->mTracker, "didBeginDrag"))
        {
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicOperationController"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentlyTransformingReps"));

          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v89;
            do
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v89 != v22)
                  objc_enumerationMutation(v19);
                objc_msgSend(*(id *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i), "fadeKnobsOut");
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
            }
            while (v21);
          }

          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tmCoordinator"));
          objc_msgSend(v24, "takeControlWithTrackerManipulator:", self);

          mConstrainingTimer = self->mConstrainingTimer;
          if (mConstrainingTimer)
          {
            -[NSTimer invalidate](mConstrainingTimer, "invalidate");
            v26 = self->mConstrainingTimer;
            self->mConstrainingTimer = 0;

            -[CRLiOSRepDragGestureRecognizer p_beginConstraining](self, "p_beginConstraining");
          }
        }
      }
      -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 2);
      -[CRLiOSRepDragGestureRecognizer currentPosition](self, "currentPosition");
      +[CRLCanvasAutoscroll startAutoscroll:unscaledPoint:](CRLCanvasAutoscroll, "startAutoscroll:unscaledPoint:", self);
    }
    else
    {
      self->mPassedDragThreshold = 0;
    }
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
    if (self->mTracker && self->mPassedDragThreshold)
    {
      -[UITouch locationInView:](self->mTouch, "locationInView:", v73);
      v75 = v74;
      v77 = v76;
      -[UITouch previousLocationInView:](self->mTouch, "previousLocationInView:", v73);
      objc_msgSend(v7, "convertBoundsToUnscaledPoint:", sub_1000603B8(v75, v77, v78));
      -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
    }
    else
    {
      -[UITouch locationInView:](self->mTouch, "locationInView:", v73);
      v80 = v79;
      v82 = v81;
      -[UITouch previousLocationInView:](self->mTouch, "previousLocationInView:", v73);
      v84 = sub_1000603B8(v80, v82, v83);
      self->mTouchDelta.x = sub_1000603D0(self->mTouchDelta.x, self->mTouchDelta.y, v84);
      self->mTouchDelta.y = v85;
    }

  }
  if (self->mTracker)
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](self, "p_setTrackerPoints");

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  NSTimer *mConstrainingTimer;
  NSTimer *v17;
  id v18;
  NSMutableSet *mTouchesDownOnReps;
  UITouch *v20;
  UITouch *mTouch;
  UITouch *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  float v46;
  CRLiOSRepDragGestureRecognizer *v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *k;
  uint64_t v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  objc_super v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];

  v6 = a3;
  v7 = a4;
  if (qword_10147E5B0 != -1)
    dispatch_once(&qword_10147E5B0, &stru_101248F08);
  v8 = off_1013DAFA8;
  if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
    sub_100E13720(v8);
  v70.receiver = self;
  v70.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer touchesEnded:withEvent:](&v70, "touchesEnded:withEvent:", v6, v7, v7);
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->mTouchesDownOnReps, "containsObject:", v15))
        {
          -[NSMutableSet removeObject:](self->mTouchesDownOnReps, "removeObject:", v15);
          v12 = 1;
        }
        else if (-[NSMutableSet containsObject:](self->mTouchesDownOnCanvas, "containsObject:", v15))
        {
          -[NSMutableSet removeObject:](self->mTouchesDownOnCanvas, "removeObject:", v15);
          if (!-[NSMutableSet count](self->mTouchesDownOnCanvas, "count"))
          {
            self->mShouldConstrainDueToAdditionalTouches = 0;
            mConstrainingTimer = self->mConstrainingTimer;
            if (mConstrainingTimer)
            {
              -[NSTimer invalidate](mConstrainingTimer, "invalidate");
              v17 = self->mConstrainingTimer;
              self->mConstrainingTimer = 0;

            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v18 = -[NSMutableSet count](self->mTouchesDownOnReps, "count");
  mTouchesDownOnReps = self->mTouchesDownOnReps;
  if (v18 == (id)1 && (v12 & 1) != 0)
  {
    v20 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](mTouchesDownOnReps, "anyObject"));
    mTouch = self->mTouch;
    self->mTouch = v20;

    v22 = self->mTouch;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "canvasView"));
    -[UITouch locationInView:](v22, "locationInView:", v23);
    objc_msgSend(v57, "convertBoundsToUnscaledPoint:");
    self->mOnlyTouchDownLocation.x = v24;
    self->mOnlyTouchDownLocation.y = v25;

    self->mPassedDragThreshold = 0;
    v26 = v56;
  }
  else
  {
    v26 = v56;
    if (!-[NSMutableSet count](mTouchesDownOnReps, "count"))
    {
      v27 = (char *)-[CRLiOSRepDragGestureRecognizer state](self, "state");
      if ((unint64_t)(v27 - 1) >= 2)
      {
        if (!v27)
        {
          if (!self->mPassedDragThreshold)
          {
            -[CRLiOSRepDragGestureRecognizer currentPosition](self, "currentPosition");
            v40 = sub_10006108C(self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y, v38, v39);
            -[UITouch timestamp](self->mTouch, "timestamp");
            v42 = v41;
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->mOriginalTimestamps, "objectForKey:", self->mTouch));
            objc_msgSend(v43, "doubleValue");
            v45 = v42 - v44;
            -[UITouch type](self->mTouch, "type");
            v46 = v45;
            self->mPassedDragThreshold = v40 >= 14.0 * (fminf(fmaxf(v46, 0.0), 2.0) * 1.25 * 0.5 + 0.25) * 3.0;

          }
          if (-[CRLiOSRepDragGestureRecognizer p_canBeginDrag](self, "p_canBeginDrag"))
          {
            -[CRLiOSRepDragGestureRecognizer p_beginGesture](self, "p_beginGesture");
            v47 = self;
            v48 = 3;
          }
          else
          {
            v47 = self;
            v48 = 5;
          }
          -[CRLiOSRepDragGestureRecognizer setState:](v47, "setState:", v48);
        }
      }
      else
      {
        -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 3);
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "dynamicOperationController"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentlyTransformingReps"));

        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v63;
          do
          {
            for (j = 0; j != v31; j = (char *)j + 1)
            {
              if (*(_QWORD *)v63 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v34, "fadeKnobsIn");
              objc_msgSend(v34, "setShowKnobsDuringManipulation:", 0);
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          }
          while (v31);
        }

        if ((v12 & 1) != 0 && self->mPassedDragThreshold)
        {
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "canvasEditor"));
          v36 = objc_opt_respondsToSelector(v35, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

          if ((v36 & 1) != 0)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "canvasEditor"));
            objc_msgSend(v37, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

          }
        }
      }
      if (qword_10147E5B0 != -1)
        dispatch_once(&qword_10147E5B0, &stru_101248F28);
      v49 = off_1013DAFA8;
      if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
        sub_100E136A0(v49);
    }
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v50 = v9;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v52; k = (char *)k + 1)
      {
        if (*(_QWORD *)v59 != v53)
          objc_enumerationMutation(v50);
        v55 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)k);
        -[NSMapTable removeObjectForKey:](self->mOriginalPointsInWindow, "removeObjectForKey:", v55);
        -[NSMapTable removeObjectForKey:](self->mOriginalTimestamps, "removeObjectForKey:", v55);
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v52);
  }

  if (self->mTracker)
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](self, "p_setTrackerPoints");

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  char *v13;
  CRLiOSRepDragGestureRecognizer *v14;
  uint64_t v15;
  NSTimer *mConstrainingTimer;
  void *v17;
  CRLCanvasRepDragTracker *mTracker;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)CRLiOSRepDragGestureRecognizer;
  -[CRLiOSRepDragGestureRecognizer touchesCancelled:withEvent:](&v35, "touchesCancelled:withEvent:", v6, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        if (-[NSMutableSet containsObject:](self->mTouchesDownOnReps, "containsObject:", v12))
        {
          -[NSMutableSet removeObject:](self->mTouchesDownOnReps, "removeObject:", v12);
          if (-[NSMutableSet count](self->mTouchesDownOnReps, "count"))
            continue;
          v13 = (char *)-[CRLiOSRepDragGestureRecognizer state](self, "state");
          if ((unint64_t)(v13 - 1) < 2)
          {
            v14 = self;
            v15 = 4;
LABEL_18:
            -[CRLiOSRepDragGestureRecognizer setState:](v14, "setState:", v15);
            continue;
          }
          if (v13)
          {
            v14 = self;
            v15 = 5;
            goto LABEL_18;
          }
          -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 5);
          mTracker = self->mTracker;
          if (mTracker)
          {
            -[CRLCanvasRepDragTracker endPossibleRepDragGesture](mTracker, "endPossibleRepDragGesture");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "dynamicOperationController"));
            -[CRLiOSRepDragGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v19, "handleGestureRecognizer:");

            v17 = self->mTracker;
          }
          else
          {
            v17 = 0;
          }
          self->mTracker = 0;
          goto LABEL_21;
        }
        if (-[NSMutableSet containsObject:](self->mTouchesDownOnCanvas, "containsObject:", v12))
        {
          -[NSMutableSet removeObject:](self->mTouchesDownOnCanvas, "removeObject:", v12);
          if (!-[NSMutableSet count](self->mTouchesDownOnCanvas, "count"))
          {
            self->mShouldConstrainDueToAdditionalTouches = 0;
            mConstrainingTimer = self->mConstrainingTimer;
            if (mConstrainingTimer)
            {
              -[NSTimer invalidate](mConstrainingTimer, "invalidate");
              v17 = self->mConstrainingTimer;
              self->mConstrainingTimer = 0;
LABEL_21:

              continue;
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v9);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v7;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        -[NSMapTable removeObjectForKey:](self->mOriginalPointsInWindow, "removeObjectForKey:", v25);
        -[NSMapTable removeObjectForKey:](self->mOriginalTimestamps, "removeObjectForKey:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v22);
  }

}

- (CGPoint)currentPosition
{
  void *v3;
  UITouch *mTouch;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  mTouch = self->mTouch;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
  -[UITouch locationInView:](mTouch, "locationInView:", v5);
  objc_msgSend(v3, "convertBoundsToUnscaledPoint:");
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)canDrag
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!self->mPassedDragThreshold || -[NSMutableSet count](self->mTouchesDownOnReps, "count") != (id)1)
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentlyTransformingReps"));
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

- (void)cancelBecauseOfRotation
{
  void *v3;
  id v4;

  if (self->mTracker || -[NSMutableSet count](self->mTouchesDownOnReps, "count"))
  {
    -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 5);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tmCoordinator"));
    objc_msgSend(v3, "takeControlWithTrackerManipulator:", self);

  }
}

- (void)didRelinquishControl
{
  NSTimer *mConstrainingTimer;
  NSTimer *v4;
  UITouch *mTouch;
  UITouch *v6;
  UITouch *v7;
  UITouch *v8;
  UITouch *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  id v13;

  mConstrainingTimer = self->mConstrainingTimer;
  if (mConstrainingTimer)
  {
    -[NSTimer invalidate](mConstrainingTimer, "invalidate");
    v4 = self->mConstrainingTimer;
    self->mConstrainingTimer = 0;

  }
  if (-[NSMutableSet count](self->mTouchesDownOnReps, "count") == (id)1)
  {
    mTouch = self->mTouch;
    v6 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->mTouchesDownOnReps, "anyObject"));

    if (mTouch != v6)
    {
      v7 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->mTouchesDownOnReps, "anyObject"));
      v8 = self->mTouch;
      self->mTouch = v7;

    }
    v13 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
    v9 = self->mTouch;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasView"));
    -[UITouch locationInView:](v9, "locationInView:", v10);
    objc_msgSend(v13, "convertBoundsToUnscaledPoint:");
    self->mOnlyTouchDownLocation.x = v11;
    self->mOnlyTouchDownLocation.y = v12;

    self->mPassedDragThreshold = 0;
  }
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;
  _BOOL4 mHitRepChrome;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asUIKitHost"));

  if (!v4)
    goto LABEL_13;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "multiSelectGestureRecognizer"));
  if (objc_msgSend(v8, "state") == (id)2)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knobDragGestureRecognizer"));

    if (v9 == v4)
      goto LABEL_15;
  }
  else
  {

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knobDragGestureRecognizer"));
  if (v10 == v4)
  {
    mHitRepChrome = self->mHitRepChrome;

    if (mHitRepChrome)
    {
LABEL_15:
      v13 = 0;
      goto LABEL_18;
    }
  }
  else
  {

  }
  if (-[CRLiOSRepDragGestureRecognizer state](self, "state") == (id)3)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nudgeGestureRecognizer"));

    if (v11 == v4)
      goto LABEL_15;
  }
  if (-[CRLiOSRepDragGestureRecognizer state](self, "state") == (id)2)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nudgeGestureRecognizer"));
    if (v12 == v4)
    {
      v13 = !self->mShouldConstrainDueToAdditionalTouches;
      v12 = v4;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
LABEL_13:
    v13 = 1;
  }
LABEL_18:

  return v13;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->mTracker;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSRepDragGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  CRLCanvasRepDragTracker *mTracker;
  void *v4;
  void *v5;
  CRLCanvasRepDragTracker *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  mTracker = self->mTracker;
  if (mTracker)
  {
    -[CRLCanvasRepDragTracker endPossibleRepDragGesture](mTracker, "endPossibleRepDragGesture");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController"));
    -[CRLiOSRepDragGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v5, "handleGestureRecognizer:");

    v6 = self->mTracker;
    self->mTracker = 0;

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentlyTransformingReps"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v13, "fadeKnobsIn");
          objc_msgSend(v13, "setShowKnobsDuringManipulation:", 0);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    if (self->mShouldCloseCommandGroupWhenOperationCompletes)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
      objc_msgSend(v14, "closeGroup");

      self->mShouldCloseCommandGroupWhenOperationCompletes = 0;
    }

  }
}

- (BOOL)allowUndoRedoOperations
{
  return -[CRLiOSRepDragGestureRecognizer state](self, "state") == (id)3;
}

- (CRLInteractiveCanvasController)icc
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->mICC);
}

- (void)updateAfterAutoscroll:(id)a3
{
  if (self->mTouch)
  {
    objc_msgSend(a3, "lastAutoscrollDelta");
    -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](self, "p_setTrackerPoints");
    -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 2);
  }
}

- (BOOL)p_canBeginDrag
{
  void *v3;
  unsigned __int8 v4;
  _BOOL4 v5;
  int64_t mDragType;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v4 = objc_msgSend(v3, "isInDynamicOperation");

  if ((v4 & 1) != 0)
    goto LABEL_2;
  v5 = -[CRLiOSRepDragGestureRecognizer p_currentlyTransformingRepsAreDraggable](self, "p_currentlyTransformingRepsAreDraggable");
  if (!v5)
    return v5;
  mDragType = self->mDragType;
  if ((unint64_t)(mDragType - 3) < 2)
  {
    v7 = 40;
    goto LABEL_11;
  }
  if (mDragType == 2)
  {
    if (self->mPassedDragThreshold)
    {
LABEL_13:
      LOBYTE(v5) = 1;
      return v5;
    }
    v7 = 41;
LABEL_11:
    LOBYTE(v5) = *((_BYTE *)&self->super.super.isa + v7) != 0;
    return v5;
  }
  if (mDragType == 1 && self->mPassedDragThreshold && self->mDragDelayElapsed)
    goto LABEL_13;
LABEL_2:
  LOBYTE(v5) = 0;
  return v5;
}

- (BOOL)p_currentlyTransformingRepsAreDraggable
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v5 = objc_msgSend(v4, "isInPossibleDynamicOperation");

  if (!v5)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath"));
    v8 = objc_msgSend(v17, "count") != 0;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath", 0));
    v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (!v18)
      goto LABEL_24;
    v19 = v18;
    v20 = *(_QWORD *)v26;
LABEL_14:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v20)
        objc_enumerationMutation(v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v25 + 1)
                                                                                                + 8 * v21)));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "repForDragging"));

      if (v22 != v23)
        break;
      if (v19 == (id)++v21)
      {
        v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v19)
          goto LABEL_14;
        goto LABEL_24;
      }
    }
LABEL_21:
    v8 = 0;
    goto LABEL_24;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentlyTransformingReps"));
  v8 = objc_msgSend(v7, "count") != 0;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentlyTransformingReps"));

  if (!objc_msgSend(v10, "containsObject:", self->mRep))
    goto LABEL_21;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v10;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "repForDragging"));

        if (v15 != v16)
        {
          v8 = 0;
          goto LABEL_23;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_23:

LABEL_24:
  return v8;
}

- (void)p_createDelayCallback
{
  uint64_t *v2;

  if (((self->mDragType - 2) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v2 = &qword_100EF02A8;
  else
    v2 = &qword_100EF02D0;
  -[CRLiOSRepDragGestureRecognizer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_delayElapsed", 0, *(double *)v2);
}

- (void)p_delayElapsed
{
  if (-[CRLiOSRepDragGestureRecognizer state](self, "state") != (id)5)
  {
    if (qword_10147E5B0 != -1)
      dispatch_once(&qword_10147E5B0, &stru_101248F48);
    if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
      sub_100E137BC();
    self->mDragDelayElapsed = 1;
    if (self->mPassedDragThreshold && self->mDragType == 1)
    {
      if (qword_10147E5B0 != -1)
        dispatch_once(&qword_10147E5B0, &stru_101248F68);
      if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
        sub_100E13790();
      -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 5);
    }
    else if (-[CRLiOSRepDragGestureRecognizer p_canBeginDrag](self, "p_canBeginDrag"))
    {
      -[CRLiOSRepDragGestureRecognizer p_beginGesture](self, "p_beginGesture");
    }
    else if (self->mHUDAndGuidesType == 2)
    {
      -[CRLiOSRepDragGestureRecognizer p_beginTracking](self, "p_beginTracking");
    }
  }
}

- (void)p_cancelDelayedStartTracking
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_delayElapsed", 0);
}

- (void)p_beginGesture
{
  CRLCanvasRep *v3;
  CRLCanvasRep *mRep;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  CRLCanvasRepDragTracker *mTracker;
  CGPoint *p_mTouchDelta;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  if (qword_10147E5B0 != -1)
    dispatch_once(&qword_10147E5B0, &stru_101248F88);
  if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
    sub_100E137E8();
  if (!self->mTracker)
    -[CRLiOSRepDragGestureRecognizer p_beginTracking](self, "p_beginTracking");
  if ((-[CRLiOSRepDragGestureRecognizer modifierFlags](self, "modifierFlags") & 0x80000) != 0
    && -[CRLCanvasRepDragTracker insertInfosAndUpdateDragForDuplicatingDragIfAppropriate](self->mTracker, "insertInfosAndUpdateDragForDuplicatingDragIfAppropriate"))
  {
    self->mShouldCloseCommandGroupWhenOperationCompletes = 1;
    v3 = (CRLCanvasRep *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepDragTracker rep](self->mTracker, "rep"));
    mRep = self->mRep;
    self->mRep = v3;

  }
  -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 1);
  self->mDragState = 2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dynamicOperationController"));
  if ((objc_msgSend(v6, "isInOperation") & 1) == 0)
    objc_msgSend(v6, "beginOperation");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentlyTransformingReps", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "setShowKnobsDuringManipulation:", 1);
        objc_msgSend(v12, "turnKnobsOn");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  mTracker = self->mTracker;
  p_mTouchDelta = &self->mTouchDelta;
  objc_msgSend(v5, "convertBoundsToUnscaledPoint:", p_mTouchDelta->x, p_mTouchDelta->y);
  -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](mTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
  *p_mTouchDelta = CGPointZero;

}

- (void)p_beginTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CRLCanvasRepDragTracker *v8;
  CRLCanvasRepDragTracker *mTracker;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  CRLCanvasRepDragTracker *v22;
  CRLCanvasRepDragTracker *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  if (qword_10147E5B0 != -1)
    dispatch_once(&qword_10147E5B0, &stru_101248FA8);
  if (os_log_type_enabled((os_log_t)off_1013DAFA8, OS_LOG_TYPE_DEBUG))
    sub_100E13814();
  if (!self->mTracker)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asUIKitHost"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tmCoordinator"));
    v8 = -[CRLCanvasRepDragTracker initWithRep:]([CRLCanvasRepDragTracker alloc], "initWithRep:", self->mRep);
    mTracker = self->mTracker;
    self->mTracker = v8;

    -[CRLiOSRepDragGestureRecognizer addTarget:action:](self, "addTarget:action:", v6, "handleGestureRecognizer:");
    if (self->mHitRepChrome && (objc_msgSend(v6, "isInOperation") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "controllingTM"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "knobDragGestureRecognizer"));

      v12 = objc_msgSend(v7, "takeControlWithTrackerManipulator:", self);
      if (v10 == v11 && v12)
      {
        objc_msgSend(v7, "relinquishTrackerManipulatorControl:", self);
        objc_msgSend(v7, "unregisterTrackerManipulator:", self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentlyTransformingReps"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](NSSet, "setWithSet:", v13));

        objc_msgSend(v6, "cancelOperation");
        objc_msgSend(v7, "registerTrackerManipulator:", self);
        objc_msgSend(v7, "takeControlWithTrackerManipulator:", self);
        objc_msgSend(v6, "beginPossibleDynamicOperation");
        objc_msgSend(v6, "startTransformingReps:", v14);

      }
    }
    else
    {
      objc_msgSend(v7, "takeControlWithTrackerManipulator:", self);
    }
    if (!self->mTracker)
      goto LABEL_37;
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](self, "p_setTrackerPoints");
    if ((objc_msgSend(v6, "isInOperation") & 1) == 0
      && (objc_msgSend(v6, "isInPossibleDynamicOperation") & 1) == 0)
    {
      v27 = v7;
      v28 = v5;
      objc_msgSend(v6, "beginPossibleDynamicOperation");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath"));
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i)));
            if (v21)
              objc_msgSend(v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v18);
      }

      objc_msgSend(v6, "startTransformingReps:", v15);
      v7 = v27;
      v5 = v28;
    }
    v22 = self->mTracker;
    -[CRLiOSRepDragGestureRecognizer currentPosition](self, "currentPosition");
    -[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:](v22, "beginShowingDragUIForInitialDragPoint:");
    if (!self->mShouldConstrainDueToAdditionalTouches)
    {
      if ((-[CRLiOSRepDragGestureRecognizer modifierFlags](self, "modifierFlags") & 0x20000) == 0)
      {
        -[CRLCanvasRepDragTracker setShouldConstrain:](self->mTracker, "setShouldConstrain:", 0);
        -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", 0.0);
LABEL_33:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasView"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "enclosingScrollView"));

        if (v26)
        {
          if (objc_msgSend(v26, "isScrollEnabled"))
          {
            objc_msgSend(v26, "setScrollEnabled:", 0);
            objc_msgSend(v26, "setScrollEnabled:", 1);
          }
        }

LABEL_37:
        return;
      }
      if (!self->mShouldConstrainDueToAdditionalTouches)
        goto LABEL_31;
    }
    if (-[NSMutableSet count](self->mTouchesDownOnCanvas, "count"))
    {
      -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", (double)(unint64_t)(10 * (_QWORD)-[NSMutableSet count](self->mTouchesDownOnCanvas, "count") - 10));
      v23 = self->mTracker;
      v24 = 0;
    }
    else
    {
LABEL_31:
      -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", 1.0);
      v23 = self->mTracker;
      v24 = 1;
    }
    -[CRLCanvasRepDragTracker setShouldSuppressConstrainingHUD:](v23, "setShouldSuppressConstrainingHUD:", v24);
    goto LABEL_33;
  }
}

- (BOOL)i_beginGestureExternally
{
  if (self->mRep
    && -[CRLiOSRepDragGestureRecognizer p_currentlyTransformingRepsAreDraggable](self, "p_currentlyTransformingRepsAreDraggable"))
  {
    self->mTouchDelta = CGPointZero;
    -[CRLiOSRepDragGestureRecognizer p_beginGesture](self, "p_beginGesture");
    -[CRLCanvasRepDragTracker p_didBeginDrag](self->mTracker, "p_didBeginDrag");
    return 1;
  }
  else
  {
    -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 5);
    return 0;
  }
}

- (void)p_beginConstraining
{
  NSTimer *mConstrainingTimer;

  self->mShouldConstrainDueToAdditionalTouches = 1;
  mConstrainingTimer = self->mConstrainingTimer;
  self->mConstrainingTimer = 0;

  if (self->mTracker)
    -[CRLiOSRepDragGestureRecognizer p_setTrackerPoints](self, "p_setTrackerPoints");
  if (-[CRLiOSRepDragGestureRecognizer state](self, "state"))
    -[CRLiOSRepDragGestureRecognizer setState:](self, "setState:", 2);
}

- (void)p_setTrackerPoints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UITouch *mTouch;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  CRLiOSRepDragGestureRecognizer *v14;
  CRLCanvasRepDragTracker *mTracker;
  CRLCanvasRepDragTracker *v16;
  double v17;
  double v18;
  unint64_t v19;
  int v20;
  CRLCanvasRepDragTracker *v21;
  void *v22;
  void *v23;
  CRLCanvasRepDragTracker *v24;
  uint64_t v25;

  if (!self->mTracker)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248FC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E13840();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101248FE8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepDragGestureRecognizer p_setTrackerPoints]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepDragGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1049, 0, "setting tracker points when there is no tracker");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  mTouch = self->mTouch;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
  -[UITouch locationInView:](mTouch, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tmCoordinator"));
  v14 = (CRLiOSRepDragGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "controllingTM"));

  if (v14 == self)
  {
    mTracker = self->mTracker;
    if (self->mPassedDragThreshold)
    {
      v16 = self->mTracker;
      v17 = v10;
      v18 = v12;
    }
    else
    {
      objc_msgSend(v6, "convertUnscaledToBoundsPoint:", self->mOnlyTouchDownLocation.x, self->mOnlyTouchDownLocation.y);
      v16 = mTracker;
    }
    -[CRLCanvasRepDragTracker setLogicalDragPoint:](v16, "setLogicalDragPoint:", v17, v18);
    -[CRLCanvasRepDragTracker setActualDragPoint:](self->mTracker, "setActualDragPoint:", v10, v12);
    if (!self->mEndedWithNudgeInControl)
      -[CRLCanvasRepDragTracker setShouldSnapToGuides:](self->mTracker, "setShouldSnapToGuides:", 1);
  }
  -[CRLCanvasRepDragTracker setShouldSnapToGuides:](self->mTracker, "setShouldSnapToGuides:", ((unint64_t)-[CRLiOSRepDragGestureRecognizer modifierFlags](self, "modifierFlags") & 0x100000) == 0);
  if (self->mShouldConstrainDueToAdditionalTouches)
  {
    -[CRLCanvasRepDragTracker setShouldConstrain:](self->mTracker, "setShouldConstrain:", 1);
  }
  else
  {
    v19 = (unint64_t)-[CRLiOSRepDragGestureRecognizer modifierFlags](self, "modifierFlags");
    v20 = v19;
    -[CRLCanvasRepDragTracker setShouldConstrain:](self->mTracker, "setShouldConstrain:", (v19 >> 17) & 1);
    if ((v20 & 0x20000) == 0)
    {
      -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", 0.0);
      goto LABEL_25;
    }
  }
  if (self->mShouldConstrainDueToAdditionalTouches && -[NSMutableSet count](self->mTouchesDownOnCanvas, "count"))
  {
    -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", (double)(unint64_t)(10 * (_QWORD)-[NSMutableSet count](self->mTouchesDownOnCanvas, "count") - 10));
    v21 = self->mTracker;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->mTouchesDownOnCanvas, "anyObject"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
    objc_msgSend(v22, "locationInView:", v23);
    -[CRLCanvasRepDragTracker setConstrainingPoint:](v21, "setConstrainingPoint:");

    v24 = self->mTracker;
    v25 = 0;
  }
  else
  {
    -[CRLCanvasRepDragTracker setSnapLevel:](self->mTracker, "setSnapLevel:", 1.0);
    v24 = self->mTracker;
    v25 = 1;
  }
  -[CRLCanvasRepDragTracker setShouldSuppressConstrainingHUD:](v24, "setShouldSuppressConstrainingHUD:", v25);
LABEL_25:

}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v4 = a3;
  objc_opt_class(UIPanGestureRecognizer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    goto LABEL_3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepDragGestureRecognizer icc](self, "icc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "enclosingScrollView"));

  if (v7 == v10)
  {
    v11 = 0;
  }
  else
  {
LABEL_3:
    v13.receiver = self;
    v13.super_class = (Class)CRLiOSRepDragGestureRecognizer;
    v11 = -[CRLiOSRepDragGestureRecognizer canBePreventedByGestureRecognizer:](&v13, "canBePreventedByGestureRecognizer:", v4);
  }

  return v11;
}

- (CRLCanvasRepDragTracker)repDragTracker
{
  return self->mTracker;
}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->mAutoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->mAutoscroll, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoscroll, 0);
  objc_storeStrong((id *)&self->mConstrainingTimer, 0);
  objc_storeStrong((id *)&self->mTouchesDownOnCanvas, 0);
  objc_storeStrong((id *)&self->mTouchesDownOnReps, 0);
  objc_storeStrong((id *)&self->mOriginalPointsInWindow, 0);
  objc_storeStrong((id *)&self->mOriginalTimestamps, 0);
  objc_storeStrong((id *)&self->mTracker, 0);
  objc_storeStrong((id *)&self->mRep, 0);
  objc_storeStrong((id *)&self->mTouch, 0);
  objc_destroyWeak((id *)&self->mICC);
}

@end
