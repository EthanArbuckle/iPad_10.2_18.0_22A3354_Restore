@implementation CRLiOSRepNudgeGestureRecognizer

- (CRLiOSRepNudgeGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSRepNudgeGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  NSMutableSet *allTouchesDown;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  v5 = -[CRLiOSRepNudgeGestureRecognizer initWithTarget:action:](&v12, "initWithTarget:action:", 0, 0);
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233C88);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF406C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101233CA8);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 69, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    allTouchesDown = v5->_allTouchesDown;
    v5->_allTouchesDown = v9;

  }
  return v5;
}

- (void)reset
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  UITouch *anchorTouch;
  UITouch *swipeTouch;
  CRLCanvasRepDragTracker *dragTracker;
  CGPoint v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  -[CRLiOSRepNudgeGestureRecognizer reset](&v10, "reset");
  if (qword_10147E360 != -1)
    dispatch_once(&qword_10147E360, &stru_101233CC8);
  v3 = off_1013D8E20;
  if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
    sub_100DF4104(v3, v4, v5);
  self->_didNudge = 0;
  anchorTouch = self->_anchorTouch;
  self->_anchorTouch = 0;

  swipeTouch = self->_swipeTouch;
  self->_swipeTouch = 0;

  dragTracker = self->_dragTracker;
  self->_dragTracker = 0;

  -[NSMutableSet removeAllObjects](self->_allTouchesDown, "removeAllObjects");
  self->_numSwipeTouches = 0;
  v9 = CGPointZero;
  self->_anchorTouchStartLocationInWindow = CGPointZero;
  self->_swipeTouchStartLocationInCanvas = v9;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[CRLiOSRepNudgeGestureRecognizer state](self, "state") != (id)a3)
  {
    if (qword_10147E360 != -1)
      dispatch_once(&qword_10147E360, &stru_101233CE8);
    v5 = off_1013D8E20;
    if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
      sub_100DF4138(v5, a3);
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  -[CRLiOSRepNudgeGestureRecognizer setState:](&v6, "setState:", a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char **v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UITouch **p_anchorTouch;
  void *v17;
  void *v18;
  void *v19;
  UITouch *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  UITouch *swipeTouch;
  double v31;
  UITouch *v32;
  void *v33;
  CGFloat v34;
  CGFloat v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unsigned int v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  id v52;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  id v56;
  void *v57;
  double v58;
  double v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  unsigned __int8 v65;
  NSObject *v66;
  NSObject *v67;
  UITouch *v68;
  void *v69;
  CGFloat v70;
  CGFloat v71;
  char *v72;
  id v73;
  NSObject *log;
  id v75;
  void *v76;
  void *v77;
  uint8_t v78;
  _BYTE v79[15];
  uint8_t v80;
  _BYTE v81[15];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  objc_super v86;
  uint8_t v87[4];
  uint64_t v88;
  uint8_t buf[4];
  unsigned int v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  int v96;
  _BYTE v97[128];

  v6 = a3;
  v86.receiver = self;
  v86.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  -[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:](&v86, "touchesBegan:withEvent:", v6, a4);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "layerHost"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asiOSCVC"));

  if (-[CRLiOSRepNudgeGestureRecognizer state](self, "state") || !objc_msgSend(v77, "currentlyScrolling"))
  {
    v11 = &selRef_swipable;
    if (!-[NSMutableSet count](self->_allTouchesDown, "count"))
    {
      if (self->_anchorTouch)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233D28);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF442C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233D48);
        v12 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 113, 0, "anchor touch not null when first touch comes down");

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "tmCoordinator"));
      objc_msgSend(v15, "registerTrackerManipulator:", self);

    }
    if (-[NSMutableSet count](self->_allTouchesDown, "count") == (id)1)
    {
      p_anchorTouch = &self->_anchorTouch;
      if (!self->_anchorTouch)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233D68);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF4394();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101233D88);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 119, 0, "invalid nil value for '%{public}s'", "_anchorTouch");

      }
      v20 = (UITouch *)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_allTouchesDown, "anyObject"));
      if (v20 != *p_anchorTouch)
      {
        if (qword_10147E360 != -1)
          dispatch_once(&qword_10147E360, &stru_101233DA8);
        v21 = off_1013D8E20;
        if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
          sub_100DF4360(v21, v22, v23);
        v24 = self->_numSwipeTouches - 1;
        self->_numSwipeTouches = v24;
        if (v24)
        {
          v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          v26 = v6;
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233DC8);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DF42B8((uint64_t)&self->_numSwipeTouches, v25);
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233DE8);
          v27 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 124, 0, "non-zero (%lu) swipe touches when there should be zero", self->_numSwipeTouches);

          v6 = v26;
          v11 = &selRef_swipable;
        }
        swipeTouch = self->_swipeTouch;
        self->_swipeTouch = 0;

        objc_storeStrong((id *)p_anchorTouch, v20);
        -[UITouch timestamp](*p_anchorTouch, "timestamp");
        self->_anchorTouchStartTimestamp = v31;
        v32 = *p_anchorTouch;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](v32, "window"));
        -[UITouch locationInView:](v32, "locationInView:", v33);
        self->_anchorTouchStartLocationInWindow.x = v34;
        self->_anchorTouchStartLocationInWindow.y = v35;

      }
    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v73 = v6;
    v36 = v6;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
    if (!v37)
    {
LABEL_95:

      -[NSMutableSet unionSet:](self->_allTouchesDown, "unionSet:", v36);
      v6 = v73;
      goto LABEL_96;
    }
    v38 = v37;
    v39 = *(_QWORD *)v83;
    v75 = v36;
LABEL_50:
    v40 = 0;
    while (1)
    {
      if (*(_QWORD *)v83 != v39)
        objc_enumerationMutation(v36);
      v41 = *(id *)(*((_QWORD *)&v82 + 1) + 8 * v40);
      v42 = (id *)((char *)&self->super.super.isa + *((int *)v11 + 811));
      if (v41 == *v42)
        goto LABEL_93;
      if (*v42)
        break;
      if (objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * v40), "tapCount") == (id)1)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hitRepWithTouch:", v41));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "repForDragging"));

        if (!v45)
          goto LABEL_74;
        if (self->_swipeTouch)
        {
          v46 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233E08);
          v47 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v90 = v46;
            v91 = 2082;
            v92 = "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]";
            v93 = 2082;
            v94 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m";
            v95 = 1024;
            v96 = 143;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d swipe touch not null when setting anchor touch", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101233E28);
          v48 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            log = v48;
            v72 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v90 = v46;
            v91 = 2114;
            v92 = v72;
            _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesBegan:withEvent:]"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 143, 0, "swipe touch not null when setting anchor touch");

          v11 = &selRef_swipable;
        }
        objc_storeStrong(v42, v41);
        objc_msgSend(*v42, "timestamp");
        self->_anchorTouchStartTimestamp = v51;
        v52 = *v42;
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v42, "window"));
        objc_msgSend(v52, "locationInView:", v53);
        self->_anchorTouchStartLocationInWindow.x = v54;
        self->_anchorTouchStartLocationInWindow.y = v55;

        v56 = *v42;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "canvasView"));
        objc_msgSend(v56, "locationInView:", v57);
        objc_msgSend(v77, "convertBoundsToUnscaledPoint:");
        v60 = objc_msgSend(v45, "dragTypeAtCanvasPoint:forTouchType:", objc_msgSend(*v42, "type"), v58, v59);

        v36 = v75;
        if (!v60)
LABEL_74:
          -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
        goto LABEL_92;
      }
      -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
LABEL_93:
      if (v38 == (id)++v40)
      {
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v97, 16);
        if (!v38)
          goto LABEL_95;
        goto LABEL_50;
      }
    }
    if (self->_swipeTouch)
    {
      if (qword_10147E360 != -1)
        dispatch_once(&qword_10147E360, &stru_101233E88);
      v43 = off_1013D8E20;
      if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
        sub_100DF4268(v87, (uint64_t)self, &v88, v43);
      ++self->_numSwipeTouches;
      goto LABEL_93;
    }
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hitRepWithTouch:", *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v40)));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "repForDragging"));

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "hitRepWithTouch:", *v42));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "repForDragging"));

    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "dynamicOperationController"));
    if (!objc_msgSend(v64, "isInOperation") && v45 && v45 == v63)
    {
      v65 = objc_msgSend(v45, "demandsExclusiveSelection");

      if ((v65 & 1) == 0)
      {
        v11 = &selRef_swipable;
        if (qword_10147E360 != -1)
          dispatch_once(&qword_10147E360, &stru_101233E68);
        v36 = v75;
        v66 = off_1013D8E20;
        if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
          sub_100DF4234(&v78, v79, v66);
        -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
LABEL_91:

LABEL_92:
        goto LABEL_93;
      }
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_swipeTouch, v41);
    if (qword_10147E360 != -1)
      dispatch_once(&qword_10147E360, &stru_101233E48);
    v67 = off_1013D8E20;
    if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
      sub_100DF4200(&v80, v81, v67);
    self->_numSwipeTouches = 1;
    v68 = self->_swipeTouch;
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "canvasView"));
    -[UITouch locationInView:](v68, "locationInView:", v69);
    objc_msgSend(v77, "convertBoundsToUnscaledPoint:");
    self->_swipeTouchStartLocationInCanvas.x = v70;
    self->_swipeTouchStartLocationInCanvas.y = v71;

    v11 = &selRef_swipable;
    v36 = v75;
    goto LABEL_91;
  }
  if (qword_10147E360 != -1)
    dispatch_once(&qword_10147E360, &stru_101233D08);
  v8 = off_1013D8E20;
  if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
    sub_100DF41CC(v8, v9, v10);
  -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
LABEL_96:

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  UITouch *anchorTouch;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  UITouch *swipeTouch;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  v6 = a3;
  -[CRLiOSRepNudgeGestureRecognizer touchesMoved:withEvent:](&v20, "touchesMoved:withEvent:", v6, a4);
  LODWORD(a4) = objc_msgSend(v6, "containsObject:", self->_anchorTouch, v20.receiver, v20.super_class);

  if ((_DWORD)a4)
  {
    if (self->_swipeTouch)
    {
      anchorTouch = self->_anchorTouch;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UITouch window](anchorTouch, "window"));
      -[UITouch locationInView:](anchorTouch, "locationInView:", v8);
      v11 = sub_10006108C(self->_anchorTouchStartLocationInWindow.x, self->_anchorTouchStartLocationInWindow.y, v9, v10);
      -[UITouch timestamp](self->_anchorTouch, "timestamp");
      v14 = sub_1002642F0(0, v13, v12 - self->_anchorTouchStartTimestamp);

      if (v11 >= v14)
      {
        swipeTouch = self->_swipeTouch;
        self->_swipeTouch = 0;

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerHost"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asiOSCVC"));

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repDragGestureRecognizer"));
        if (objc_msgSend(v19, "state") == (id)5)
          -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);

      }
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  UITouch *swipeTouch;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t numSwipeTouches;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  UITouch *anchorTouch;
  void *v48;
  UITouch *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  UITouch *v59;
  UITouch *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  uint8_t buf[4];
  unint64_t v69;
  _BYTE v70[128];

  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  -[CRLiOSRepNudgeGestureRecognizer touchesEnded:withEvent:](&v67, "touchesEnded:withEvent:", v6, a4);
  if (qword_10147E360 != -1)
    dispatch_once(&qword_10147E360, &stru_101233EA8);
  v7 = off_1013D8E20;
  if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
    sub_100DF45D0((uint64_t)self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dynamicOperationController"));
  if ((objc_msgSend(v6, "containsObject:", self->_anchorTouch) & 1) == 0)
  {
    swipeTouch = self->_swipeTouch;
    if (swipeTouch)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
      -[UITouch locationInView:](swipeTouch, "locationInView:", v12);
      objc_msgSend(v9, "convertBoundsToUnscaledPoint:");
      v14 = v13;
      v16 = v15;

      if (sub_10006108C(self->_swipeTouchStartLocationInCanvas.x, self->_swipeTouchStartLocationInCanvas.y, v14, v16) >= 14.0)
      {
        if (self->_didNudge)
          goto LABEL_12;
        self->_didNudge = 1;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "repDragGestureRecognizer"));
        if ((objc_msgSend(v17, "i_beginGestureExternally") & 1) == 0)
        {
          -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
          self->_didNudge = 0;
        }

        if (self->_didNudge)
        {
LABEL_12:
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tmCoordinator"));
          v19 = objc_msgSend(v18, "takeControlWithTrackerManipulator:", self);

          if (v19)
          {
            if (-[CRLiOSRepNudgeGestureRecognizer state](self, "state"))
            {
              -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 2);
            }
            else
            {
              -[CRLiOSRepNudgeGestureRecognizer addTarget:action:](self, "addTarget:action:", v62, "handleGestureRecognizer:");
              -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 1);
              if ((objc_msgSend(v62, "isInOperation") & 1) == 0)
              {
                +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101233EC8);
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DF4550();
                if (qword_10147E370 != -1)
                  dispatch_once(&qword_10147E370, &stru_101233EE8);
                v20 = off_1013D9070;
                if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
                  sub_100DE7468(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSRepNudgeGestureRecognizer touchesEnded:withEvent:]"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSRepNudgeGestureRecognizer.m"));
                +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 238, 0, "not in dynamic operation for nudge");

              }
            }
            numSwipeTouches = self->_numSwipeTouches;
            if (numSwipeTouches <= 1)
              v24 = 1;
            else
              v24 = 10 * numSwipeTouches - 10;
            v25 = sub_1000603B8(v14, v16, self->_swipeTouchStartLocationInCanvas.x);
            v26 = fabs(v25);
            v28 = fabs(v27);
            v29 = -v24;
            if (v27 <= 0.0)
              v30 = -v24;
            else
              v30 = v24;
            if (v25 > 0.0)
              v29 = v24;
            if (v26 > v28)
              v31 = (double)v29;
            else
              v31 = 0.0;
            if (v26 > v28)
              v32 = 0.0;
            else
              v32 = (double)v30;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "currentlyTransformingReps"));
            -[CRLiOSRepNudgeGestureRecognizer p_affectedRepsRect:](self, "p_affectedRepsRect:", v33);
            v35 = v34;

            v36 = v35 - (double)(int)v35;
            if (v36 > 0.5)
              v36 = v36 + -1.0;
            if (v31 == 0.0)
              v37 = 0.0;
            else
              v37 = v36;
            v38 = sub_1000603B8(v31, v32, v37);
            v40 = v39;
            v42 = objc_opt_class(CRLCanvasRepDragTracker, v41);
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer tracker](self, "tracker"));
            v44 = sub_100221D0C(v42, v43);
            v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

            objc_msgSend(v45, "addUnscaledDragDelta:roundDeltaToViewScale:", 0, v38, v40);
            if (qword_10147E360 != -1)
              dispatch_once(&qword_10147E360, &stru_101233F08);
            v46 = off_1013D8E20;
            if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
              sub_100DF44AC(v46, v38, v40);
            anchorTouch = self->_anchorTouch;
            v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
            -[UITouch locationInView:](anchorTouch, "locationInView:", v48);
            objc_msgSend(v45, "setLogicalDragPoint:");

            objc_msgSend(v45, "setShouldSnapToGuides:", 0);
            objc_msgSend(v45, "setShouldShowGuides:", 1);

          }
        }
      }
      v49 = self->_swipeTouch;
      self->_swipeTouch = 0;

    }
  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v50 = v6;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v64;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v64 != v53)
          objc_enumerationMutation(v50);
        if (*(UITouch **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v54) != self->_anchorTouch)
        {
          --self->_numSwipeTouches;
          if (qword_10147E360 != -1)
            dispatch_once(&qword_10147E360, &stru_101233F28);
          v55 = off_1013D8E20;
          if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
          {
            v56 = self->_numSwipeTouches;
            *(_DWORD *)buf = 134217984;
            v69 = v56;
            _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "removing swipe touch (%lu)", buf, 0xCu);
          }
        }
        v54 = (char *)v54 + 1;
      }
      while (v52 != v54);
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
    }
    while (v52);
  }

  -[NSMutableSet minusSet:](self->_allTouchesDown, "minusSet:", v50);
  if (!-[NSMutableSet count](self->_allTouchesDown, "count"))
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tmCoordinator"));
    objc_msgSend(v57, "unregisterTrackerManipulator:", self);

    if (self->_didNudge)
      v58 = 3;
    else
      v58 = 5;
    -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", v58);
    v59 = self->_anchorTouch;
    self->_anchorTouch = 0;

    v60 = self->_swipeTouch;
    self->_swipeTouch = 0;

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  UITouch *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  UITouch *anchorTouch;
  UITouch *swipeTouch;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
  -[CRLiOSRepNudgeGestureRecognizer touchesEnded:withEvent:](&v22, "touchesEnded:withEvent:", v6, a4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(UITouch **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (v12 == self->_anchorTouch)
        {
          self->_anchorTouch = 0;

        }
        else
        {
          --self->_numSwipeTouches;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v9);
  }

  -[NSMutableSet minusSet:](self->_allTouchesDown, "minusSet:", v7, (_QWORD)v18);
  if (!-[NSMutableSet count](self->_allTouchesDown, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tmCoordinator"));
    objc_msgSend(v14, "unregisterTrackerManipulator:", self);

    if (self->_didNudge)
      v15 = 4;
    else
      v15 = 5;
    -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", v15);
    anchorTouch = self->_anchorTouch;
    self->_anchorTouch = 0;

    swipeTouch = self->_swipeTouch;
    self->_swipeTouch = 0;

  }
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
  v6 = objc_opt_class(UIPanGestureRecognizer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) == 0)
    goto LABEL_3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
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
    v13.super_class = (Class)CRLiOSRepNudgeGestureRecognizer;
    v11 = -[CRLiOSRepNudgeGestureRecognizer canBePreventedByGestureRecognizer:](&v13, "canBePreventedByGestureRecognizer:", v4);
  }

  return v11;
}

- (void)cancelBecauseOfRotation
{
  if (self->_anchorTouch)
    -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 5);
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  void *v3;
  void *v4;
  void *v5;
  CRLCanvasRepDragTracker *dragTracker;
  void *v7;
  CRLCanvasRepDragTracker *v8;
  CRLCanvasRepDragTracker *v9;
  CRLCanvasLayoutManipulatingTracker *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));

  dragTracker = self->_dragTracker;
  if (!dragTracker)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repDragGestureRecognizer"));
    v8 = (CRLCanvasRepDragTracker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repDragTracker"));
    v9 = self->_dragTracker;
    self->_dragTracker = v8;

    dragTracker = self->_dragTracker;
  }
  v10 = dragTracker;

  return v10;
}

- (BOOL)readyToEndOperation
{
  return -[CRLiOSRepNudgeGestureRecognizer state](self, "state") == (id)3;
}

- (void)operationDidEnd
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_10147E360 != -1)
    dispatch_once(&qword_10147E360, &stru_101233F48);
  v3 = off_1013D8E20;
  if (os_log_type_enabled((os_log_t)off_1013D8E20, OS_LOG_TYPE_DEBUG))
    sub_100DF4648(v3, self);
  if (!-[CRLiOSRepNudgeGestureRecognizer state](self, "state")
    || -[CRLiOSRepNudgeGestureRecognizer state](self, "state") == (id)1
    || -[CRLiOSRepNudgeGestureRecognizer state](self, "state") == (id)2)
  {
    -[CRLiOSRepNudgeGestureRecognizer setState:](self, "setState:", 3);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSRepNudgeGestureRecognizer p_ICC](self, "p_ICC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dynamicOperationController"));
  -[CRLiOSRepNudgeGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v5, "handleGestureRecognizer:");

}

- (id)p_ICC
{
  return objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (CGRect)p_affectedRepsRect:(id)a3
{
  id v3;
  double y;
  double x;
  double height;
  double width;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
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
  CGAffineTransform v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  CGRect v38;
  CGRect v39;
  CGRect result;

  v3 = a3;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout", *(_OWORD *)&v32.a, *(_OWORD *)&v32.c, *(_OWORD *)&v32.tx));
        objc_msgSend(v13, "alignmentFrame");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layout"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "parent"));
        v24 = v23;
        if (v23)
          objc_msgSend(v23, "transformInRoot");
        else
          memset(&v32, 0, sizeof(v32));
        v38.origin.x = v15;
        v38.origin.y = v17;
        v38.size.width = v19;
        v38.size.height = v21;
        v39 = CGRectApplyAffineTransform(v38, &v32);
        x = sub_100060C2C(x, y, width, height, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
        y = v25;
        width = v26;
        height = v27;

      }
      v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v9);
  }

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragTracker, 0);
  objc_storeStrong((id *)&self->_allTouchesDown, 0);
  objc_storeStrong((id *)&self->_swipeTouch, 0);
  objc_storeStrong((id *)&self->_anchorTouch, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
