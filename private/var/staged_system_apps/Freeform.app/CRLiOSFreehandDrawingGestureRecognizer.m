@implementation CRLiOSFreehandDrawingGestureRecognizer

- (CRLiOSFreehandDrawingGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSFreehandDrawingGestureRecognizer *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  v5 = -[CRLiOSFreehandDrawingGestureRecognizer initWithTarget:action:](&v14, "initWithTarget:action:", 0, 0);
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124EFE8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1C774();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124F008);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 94, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->_icc, v4);
    v5->_startingScaledPoint = (CGPoint)xmmword_100EEC438;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)&v5->_icc);
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "p_canvasWillScrollOrZoom:", CFSTR("CRLCanvasWillScrollNotification"), WeakRetained);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v12 = objc_loadWeakRetained((id *)&v5->_icc);
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, "p_canvasWillScrollOrZoom:", CFSTR("CRLCanvasWillZoomNotification"), v12);

  }
  return v5;
}

- (void)setState:(int64_t)a3
{
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  if (-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") != (id)a3)
  {
    if (qword_10147E5B8 != -1)
      dispatch_once(&qword_10147E5B8, &stru_10124F028);
    v5 = off_1013DB4F0;
    if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
      sub_100E1C820(v5, a3);
  }
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  -[CRLiOSFreehandDrawingGestureRecognizer setState:](&v10, "setState:", a3);
  if (a3 == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enclosingScrollView"));
    objc_msgSend(v9, "setScrollEnabled:", 0);

    self->_didDisableScrolling = 1;
  }
}

- (BOOL)p_selectTargetFreehandInfoForDrawing:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "locked") & 1) == 0)
  {
    p_icc = &self->_icc;
    WeakRetained = objc_loadWeakRetained((id *)p_icc);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasEditor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfo:", v5));

    v11 = objc_loadWeakRetained((id *)p_icc);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    objc_msgSend(v12, "setSelectionPath:", v10);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id WeakRetained;
  unsigned int v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  UITouch **p_trackingTouch;
  void *v20;
  id v21;
  unsigned int v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL8 v31;
  id v32;
  id v33;
  unsigned int v34;
  void *v35;
  int v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  double v51;
  CRLFreehandDrawingTracker *v52;
  id v53;
  CRLFreehandDrawingTracker *v54;
  CRLFreehandDrawingTracker *tracker;
  double v56;
  _QWORD *v57;
  NSTimer *v58;
  NSTimer *beginDelayTimer;
  NSObject *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  id *location;
  char v71;
  char v72[15];
  char v73;
  char v74[15];
  _QWORD v75[5];
  char v76;
  char v77;
  char v78[7];
  _QWORD v79[5];
  char v80;
  char v81[15];
  char v82;
  char v83[15];
  char v84;
  char v85[15];
  char v86;
  char v87[15];
  char v88;
  char v89[15];
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  objc_super v94;
  uint8_t buf[4];
  id v96;
  __int16 v97;
  id v98;
  __int16 v99;
  unsigned int v100;
  _BYTE v101[128];

  v6 = a3;
  v94.receiver = self;
  v94.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  v65 = a4;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesBegan:withEvent:](&v94, "touchesBegan:withEvent:", v6);
  if (!-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v8 = objc_msgSend(WeakRetained, "currentlyScrolling");

    if (v8)
    {
      if (qword_10147E5B8 != -1)
        dispatch_once(&qword_10147E5B8, &stru_10124F048);
      if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
        sub_100E1C8B0();
      -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
      goto LABEL_114;
    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v10 = objc_msgSend(v9, "type");

  if (v10 == (id)3)
  {
    v11 = (unint64_t)-[CRLiOSFreehandDrawingGestureRecognizer modifierFlags](self, "modifierFlags") & 0x40000;
    if (v11 | (unint64_t)-[CRLiOSFreehandDrawingGestureRecognizer buttonMask](self, "buttonMask") & 2)
    {
      -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
      if (qword_10147E5B8 != -1)
        dispatch_once(&qword_10147E5B8, &stru_10124F068);
      if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
        sub_100E1CA70();
      goto LABEL_114;
    }
  }
  location = (id *)&self->_icc;
  v12 = objc_loadWeakRetained((id *)&self->_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "freehandDrawingToolkit"));

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v64 = v6;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
  if (!v15)
    goto LABEL_100;
  v16 = v15;
  v17 = *(_QWORD *)v91;
  v69 = v13;
  v66 = *(_QWORD *)v91;
  v67 = v14;
  while (2)
  {
    v18 = 0;
    v68 = v16;
    do
    {
      if (*(_QWORD *)v91 != v17)
        objc_enumerationMutation(v14);
      p_trackingTouch = &self->_trackingTouch;
      if (self->_trackingTouch)
      {
        if (qword_10147E5B8 != -1)
          dispatch_once(&qword_10147E5B8, &stru_10124F210);
        if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
          sub_100E1CA44(&v71, v72);
        if (!-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state"))
        {
          -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
          goto LABEL_100;
        }
        goto LABEL_95;
      }
      v20 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)v18);
      v21 = objc_loadWeakRetained(location);
      v22 = objc_msgSend(v21, "isInDynamicOperation");

      if (v22)
      {
        if (qword_10147E5B8 != -1)
          dispatch_once(&qword_10147E5B8, &stru_10124F088);
        v6 = v64;
        if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
          sub_100E1C8E0();
        -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 5);
        goto LABEL_112;
      }
      -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", v20);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v31 = sub_10033831C((_BOOL8)objc_msgSend(v20, "type"));
      v32 = objc_msgSend(v13, "freehandDrawingBehaviorForTouchType:atUnscaledPoint:", objc_msgSend(v20, "type"), v28, v30);
      v33 = v32;
      if (v32 == (id)2)
      {
        if (objc_msgSend(v13, "isInDrawingMode"))
        {
          v34 = -[CRLiOSFreehandDrawingGestureRecognizer p_selectTargetFreehandInfoForDrawing:](self, "p_selectTargetFreehandInfoForDrawing:", 0);
          goto LABEL_29;
        }
      }
      else if (v32 == (id)3)
      {
        v34 = 1;
        goto LABEL_29;
      }
      v34 = 0;
LABEL_29:
      if (qword_10147E5B8 != -1)
        dispatch_once(&qword_10147E5B8, &stru_10124F0A8);
      v35 = off_1013DB4F0;
      if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
      {
        v60 = v35;
        v61 = objc_msgSend(v20, "type");
        *(_DWORD *)buf = 134218496;
        v96 = v61;
        v97 = 2048;
        v98 = v33;
        v99 = 1024;
        v100 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "first touch began of type %zi with drawing behavior %zi. allowedToBegin? %i", buf, 0x1Cu);

        if (!v34)
          goto LABEL_39;
      }
      else if (!v34)
      {
        goto LABEL_39;
      }
      if (!objc_msgSend(v13, "isInDrawingMode")
        || !objc_msgSend(v13, "currentToolAllowsDragForTouchType:atUnscaledPoint:", objc_msgSend(v20, "type"), v28, v30))
      {
        v36 = 1;
        goto LABEL_41;
      }
      if (qword_10147E5B8 != -1)
        dispatch_once(&qword_10147E5B8, &stru_10124F0C8);
      if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
        sub_100E1CA18(&v88, v89);
LABEL_39:
      v36 = 0;
LABEL_41:
      if (objc_msgSend(v20, "type") == (id)2)
      {
        v37 = 1;
      }
      else
      {
        v38 = objc_loadWeakRetained(location);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "layerHost"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "asiOSCVC"));

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "pencilMediator"));
        v42 = v41;
        v37 = v41
           && (objc_msgSend(v41, "prefersPencilOnlyDrawing") & 1) == 0
           && objc_msgSend(v20, "type") != (id)2;

      }
      if ((v36 & v37) == 1)
      {
        v43 = objc_loadWeakRetained(location);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "hitKnobAtPoint:inputType:returningRep:", v31, 0, v28, v30));

        v45 = objc_msgSend(v44, "worksWithStylus");
        if (objc_msgSend(v69, "isLassoSelectionForMixedTypeEnabledInDrawingMode"))
        {
          objc_opt_class(CRLMovieKnob, v46);
          v48 = sub_100221D0C(v47, v44);
          v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
          if (v49)
            v45 = 1;

        }
        if (!v44 || !v45)
        {

LABEL_67:
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[CRLiOSKeyboardMonitor sharedKeyboardMonitor](CRLiOSKeyboardMonitor, "sharedKeyboardMonitor"));
          objc_msgSend(v50, "onScreenHeight");
          if (v51 > 10.0 && objc_msgSend(v50, "isLocalKeyboard"))
          {
            v13 = v69;
            if (qword_10147E5B8 != -1)
              dispatch_once(&qword_10147E5B8, &stru_10124F108);
            if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
              sub_100E1C968(&v84, v85);
            -[CRLiOSFreehandDrawingGestureRecognizer p_beginDrawingModeWithoutDrawingWithTouch:](self, "p_beginDrawingModeWithoutDrawingWithTouch:", v20);
            -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 3);
            v16 = v68;
          }
          else
          {
            objc_storeStrong((id *)p_trackingTouch, v20);
            self->_startingScaledPoint.x = v24;
            self->_startingScaledPoint.y = v26;
            v13 = v69;
            if (!self->_tracker)
            {
              v52 = [CRLFreehandDrawingTracker alloc];
              v53 = objc_loadWeakRetained(location);
              v54 = -[CRLFreehandDrawingTracker initWithInteractiveCanvasController:](v52, "initWithInteractiveCanvasController:", v53);
              tracker = self->_tracker;
              self->_tracker = v54;

            }
            -[CRLiOSFreehandDrawingGestureRecognizer p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:](self, "p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:", *p_trackingTouch, v65, 0);
            v16 = v68;
            if ((id)-[UITouch type](*p_trackingTouch, "type") == (id)2)
            {
              if (!-[CRLiOSFreehandDrawingGestureRecognizer p_tapShouldAvoidDrawing](self, "p_tapShouldAvoidDrawing"))
              {
                if (qword_10147E5B8 != -1)
                  dispatch_once(&qword_10147E5B8, &stru_10124F128);
                if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
                  sub_100E1C9C0(&v82, v83);
                -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 1);
                -[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing](self, "p_beginDynamicDrawing");
                goto LABEL_94;
              }
              if (qword_10147E5B8 != -1)
                dispatch_once(&qword_10147E5B8, &stru_10124F148);
              if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
                sub_100E1C994(&v80, v81);
              -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 1);
              v79[0] = _NSConcreteStackBlock;
              v79[1] = 3221225472;
              v79[2] = sub_1002ECE2C;
              v79[3] = &unk_101234D78;
              v79[4] = self;
              v56 = 0.25;
              v57 = v79;
            }
            else
            {
              if (qword_10147E5B8 != -1)
                dispatch_once(&qword_10147E5B8, &stru_10124F188);
              if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
                sub_100E1C9EC(&v77, v78);
              -[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing](self, "p_beginDynamicDrawing");
              v75[0] = _NSConcreteStackBlock;
              v75[1] = 3221225472;
              v75[2] = sub_1002ECF3C;
              v75[3] = &unk_10124F1D0;
              v75[4] = self;
              v76 = 1;
              v56 = 0.25;
              v57 = v75;
            }
            v58 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v57, v56));
            beginDelayTimer = self->_beginDelayTimer;
            self->_beginDelayTimer = v58;

          }
LABEL_94:

          v17 = v66;
          v14 = v67;
          goto LABEL_95;
        }
        if (qword_10147E5B8 != -1)
          dispatch_once(&qword_10147E5B8, &stru_10124F0E8);
        if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
          sub_100E1C93C(&v86, v87);

      }
      else if (v36)
      {
        goto LABEL_67;
      }
      v17 = v66;
      v14 = v67;
      if (qword_10147E5B8 != -1)
        dispatch_once(&qword_10147E5B8, &stru_10124F1F0);
      v16 = v68;
      v13 = v69;
      if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
        sub_100E1C910(&v73, v74);
      -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 5);
LABEL_95:
      v18 = (char *)v18 + 1;
    }
    while (v16 != v18);
    v62 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
    v16 = v62;
    if (v62)
      continue;
    break;
  }
LABEL_100:

  v6 = v64;
  if (!-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") && self->_didBeginDynamicDrawing)
  {
    v14 = objc_loadWeakRetained(location);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dynamicOperationController"));
    objc_msgSend(v63, "handleTrackerManipulator:", self);

LABEL_112:
  }

LABEL_114:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  void *v14;
  _BOOL4 v15;
  _BOOL4 v17;
  id v18;
  id v20;
  void *v21;
  CRLiOSFreehandDrawingGestureRecognizer *v22;
  NSObject *v23;
  id v24;
  void *v25;
  double v26;
  objc_super v27;
  uint8_t buf[4];
  double v29;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesMoved:withEvent:](&v27, "touchesMoved:withEvent:", v6, v7);
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && !-[CRLiOSFreehandDrawingGestureRecognizer p_isStateDone](self, "p_isStateDone"))
  {
    -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", self->_trackingTouch);
    v9 = v8;
    v11 = v10;
    v12 = sub_10006108C(v8, v10, self->_startingScaledPoint.x, self->_startingScaledPoint.y);
    if ((id)-[UITouch type](self->_trackingTouch, "type") == (id)2)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
      objc_msgSend(v14, "keepPencilShadowVisible");

    }
    -[CRLiOSFreehandDrawingGestureRecognizer p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:](self, "p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:", self->_trackingTouch, v7, 0);
    v15 = 0;
    if ((id)-[UITouch type](self->_trackingTouch, "type") == (id)2)
      v15 = (-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") == (id)1
          || -[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") == (id)2)
         && v12 > 20.0
         && !self->_didBeginDynamicDrawing;
    if ((id)-[UITouch type](self->_trackingTouch, "type") == (id)2)
    {
      v17 = 0;
    }
    else
    {
      v18 = -[CRLiOSFreehandDrawingGestureRecognizer state](self, "state");
      v17 = v12 > 163.0 && v18 == 0;
    }
    if (v15 || v17)
    {
      -[CRLiOSFreehandDrawingGestureRecognizer p_clearTimerIfNeeded](self, "p_clearTimerIfNeeded");
      v20 = objc_loadWeakRetained((id *)&self->_icc);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tmCoordinator"));
      v22 = (CRLiOSFreehandDrawingGestureRecognizer *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "controllingTM"));

      if (!v22 || v22 == self)
      {
        if (qword_10147E5B8 != -1)
          dispatch_once(&qword_10147E5B8, &stru_10124F230);
        v23 = off_1013DB4F0;
        if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
        {
          v26 = sub_10006108C(self->_startingScaledPoint.x, self->_startingScaledPoint.y, v9, v11);
          *(_DWORD *)buf = 134217984;
          v29 = v26;
          _os_log_debug_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "beginning due to enough movement (%f)", buf, 0xCu);
        }
        if (!-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state"))
          -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 1);
        if (!self->_didBeginDynamicDrawing)
          -[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing](self, "p_beginDynamicDrawing");
      }
      else
      {
        -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
      }

    }
    if (!-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") && self->_didBeginDynamicDrawing)
    {
      v24 = objc_loadWeakRetained((id *)&self->_icc);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dynamicOperationController"));
      objc_msgSend(v25, "handleTrackerManipulator:", self);

    }
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesEnded:withEvent:](&v8, "touchesEnded:withEvent:", v6, v7);
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && !-[CRLiOSFreehandDrawingGestureRecognizer p_isStateDone](self, "p_isStateDone"))
  {
    -[CRLiOSFreehandDrawingGestureRecognizer p_endSuccessfullyWithEvent:](self, "p_endSuccessfullyWithEvent:", v7);
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesCancelled:withEvent:](&v7, "touchesCancelled:withEvent:", v6, a4);
  if (self->_trackingTouch
    && objc_msgSend(v6, "containsObject:")
    && !-[CRLiOSFreehandDrawingGestureRecognizer p_isStateDone](self, "p_isStateDone"))
  {
    -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
  }

}

- (void)touchesEstimatedPropertiesUpdated:(id)a3
{
  id v4;
  double v5;
  double v6;
  CRLFreehandDrawingToolInputPoint *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSFreehandDrawingGestureRecognizer;
  -[CRLiOSFreehandDrawingGestureRecognizer touchesEstimatedPropertiesUpdated:](&v8, "touchesEstimatedPropertiesUpdated:", v4);
  if (self->_trackingTouch
    && objc_msgSend(v4, "containsObject:")
    && !-[CRLiOSFreehandDrawingGestureRecognizer p_isStateDone](self, "p_isStateDone"))
  {
    -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", self->_trackingTouch);
    v7 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:activeInputProperties:isPredicted:wasAddedByTouchesEnded:", self->_trackingTouch, self->_lastActiveInputProperties, 0, 0, v5, v6);
    -[CRLFreehandDrawingTracker estimatedPropertiesUpdatedOnInputPoint:](self->_tracker, "estimatedPropertiesUpdatedOnInputPoint:", v7);

  }
}

- (void)reset
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  CRLFreehandDrawingTracker *tracker;
  UITouch *trackingTouch;

  if (qword_10147E5B8 != -1)
    dispatch_once(&qword_10147E5B8, &stru_10124F250);
  if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
    sub_100E1CB24();
  -[CRLiOSFreehandDrawingGestureRecognizer p_clearTimerIfNeeded](self, "p_clearTimerIfNeeded");
  if (self->_didDisableScrolling)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enclosingScrollView"));
    objc_msgSend(v6, "setScrollEnabled:", 1);

    self->_didDisableScrolling = 0;
  }
  tracker = self->_tracker;
  self->_tracker = 0;

  trackingTouch = self->_trackingTouch;
  self->_trackingTouch = 0;

  self->_lastActiveInputProperties = 0;
  self->_startingScaledPoint = (CGPoint)xmmword_100EEC438;
  self->_didBeginDynamicDrawing = 0;
}

- (unint64_t)inputType
{
  unint64_t result;

  result = (unint64_t)self->_trackingTouch;
  if (result)
  {
    if (objc_msgSend((id)result, "type") == (id)2)
      return 2;
    else
      return 1;
  }
  return result;
}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return 1;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_tracker;
}

- (void)operationDidEnd
{
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
  -[CRLiOSFreehandDrawingGestureRecognizer removeTarget:action:](self, "removeTarget:action:", v3, "handleGestureRecognizer:");

}

- (BOOL)p_isStateDone
{
  return (char *)-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") - 3 < (char *)3;
}

- (void)p_endWithSuccess
{
  -[CRLiOSFreehandDrawingGestureRecognizer p_endSuccessfullyWithEvent:](self, "p_endSuccessfullyWithEvent:", 0);
}

- (void)p_endSuccessfullyWithEvent:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  if (qword_10147E5B8 != -1)
    dispatch_once(&qword_10147E5B8, &stru_10124F270);
  if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
    sub_100E1CBB4();
  if ((id)-[UITouch type](self->_trackingTouch, "type") != (id)2
    && !-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state")
    && !-[CRLiOSFreehandDrawingGestureRecognizer p_tapShouldAvoidDrawing](self, "p_tapShouldAvoidDrawing"))
  {
    if (qword_10147E5B8 != -1)
      dispatch_once(&qword_10147E5B8, &stru_10124F290);
    if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
      sub_100E1CB84();
    -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 1);
    if (!self->_didBeginDynamicDrawing)
      -[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing](self, "p_beginDynamicDrawing");
  }
  if ((id)-[UITouch type](self->_trackingTouch, "type") == (id)2
    && (-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") == (id)1
     || -[CRLiOSFreehandDrawingGestureRecognizer state](self, "state") == (id)2)
    && !self->_didBeginDynamicDrawing)
  {
    if (qword_10147E5B8 != -1)
      dispatch_once(&qword_10147E5B8, &stru_10124F2B0);
    if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
      sub_100E1CB54();
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
    v7 = objc_msgSend(v6, "isInDrawingMode");

    if ((v7 & 1) == 0)
      -[CRLiOSFreehandDrawingGestureRecognizer p_beginDrawingModeWithoutDrawingWithTouch:](self, "p_beginDrawingModeWithoutDrawingWithTouch:", self->_trackingTouch);
  }
  if (v4)
    -[CRLiOSFreehandDrawingGestureRecognizer p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:](self, "p_addCoalescedAndPredictedTouchesToTrackerForTouch:fromEvent:fromTouchesEnded:", self->_trackingTouch, v4, 1);
  -[CRLiOSFreehandDrawingGestureRecognizer p_clearTimerIfNeeded](self, "p_clearTimerIfNeeded");
  -[CRLFreehandDrawingTracker finishWithSuccess:](self->_tracker, "finishWithSuccess:", 1);
  -[CRLiOSFreehandDrawingGestureRecognizer p_hideEditMenuIfNeeded](self, "p_hideEditMenuIfNeeded");
  -[CRLiOSFreehandDrawingGestureRecognizer p_closeCVCDelegatePresentedViewControllerIfNeeded](self, "p_closeCVCDelegatePresentedViewControllerIfNeeded");
  -[CRLiOSFreehandDrawingGestureRecognizer setState:](self, "setState:", 3);

}

- (void)p_cancelOrFailAndCleanUpChanges
{
  char *v3;
  CRLiOSFreehandDrawingGestureRecognizer *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  CRLFreehandDrawingTracker *tracker;
  id WeakRetained;
  void *v11;

  if (qword_10147E5B8 != -1)
    dispatch_once(&qword_10147E5B8, &stru_10124F2D0);
  if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
    sub_100E1CC64();
  v3 = (char *)-[CRLiOSFreehandDrawingGestureRecognizer state](self, "state");
  if ((unint64_t)(v3 - 3) < 3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F2F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1CBE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F310);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 617, 0, "Cannot cancel/fail a GR that has already ended.");

  }
  else
  {
    if ((unint64_t)(v3 - 1) >= 2)
    {
      if (v3)
        goto LABEL_20;
      v4 = self;
      v5 = 5;
    }
    else
    {
      v4 = self;
      v5 = 4;
    }
    -[CRLiOSFreehandDrawingGestureRecognizer setState:](v4, "setState:", v5);
  }
LABEL_20:
  -[CRLiOSFreehandDrawingGestureRecognizer p_clearTimerIfNeeded](self, "p_clearTimerIfNeeded");
  tracker = self->_tracker;
  if (tracker)
    -[CRLFreehandDrawingTracker finishWithSuccess:](tracker, "finishWithSuccess:", 0);
  if (self->_didBeginDynamicDrawing)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
    objc_msgSend(v11, "handleTrackerManipulator:", self);

  }
}

- (BOOL)p_tapShouldAvoidDrawing
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asUIKitHost"));

  if ((objc_msgSend(v5, "contextMenuMightBeDisplayed") & 1) != 0
    || (objc_msgSend(v5, "documentChromeHasPresentedViewController") & 1) != 0)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_icc);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));
    v6 = objc_msgSend(v8, "isInDrawingMode") ^ 1;

  }
  return v6;
}

- (void)p_beginDynamicDrawing
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v5;
  unsigned int v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;

  if (qword_10147E5B8 != -1)
    dispatch_once(&qword_10147E5B8, &stru_10124F330);
  if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
    sub_100E1CD14();
  self->_didBeginDynamicDrawing = 1;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dynamicOperationController"));
  v6 = objc_msgSend(v5, "isInPossibleDynamicOperation");

  if (v6)
  {
    v7 = objc_loadWeakRetained((id *)&self->_icc);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dynamicOperationController"));
    objc_msgSend(v8, "endOperation");

  }
  v9 = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dynamicOperationController"));
  v11 = objc_msgSend(v10, "isInOperation");

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_icc);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dynamicOperationController"));
    objc_msgSend(v13, "cancelOperation");

  }
  v14 = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(v14, "endEditing");

  -[CRLiOSFreehandDrawingGestureRecognizer p_hideEditMenuIfNeeded](self, "p_hideEditMenuIfNeeded");
  v15 = objc_loadWeakRetained((id *)&self->_icc);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dynamicOperationController"));
  -[CRLiOSFreehandDrawingGestureRecognizer addTarget:action:](self, "addTarget:action:", v16, "handleGestureRecognizer:");

  v17 = objc_loadWeakRetained((id *)&self->_icc);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tmCoordinator"));
  objc_msgSend(v18, "registerTrackerManipulator:", self);

  v19 = objc_loadWeakRetained((id *)&self->_icc);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "tmCoordinator"));
  v21 = objc_msgSend(v20, "takeControlWithTrackerManipulator:", self);

  if ((v21 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F350);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1CC94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124F370);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSFreehandDrawingGestureRecognizer p_beginDynamicDrawing]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLiOSFreehandDrawingGestureRecognizer.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 676, 0, "Freehand drawing GR did not successfully take control");

  }
  v25 = objc_loadWeakRetained((id *)p_icc);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "dynamicOperationController"));
  objc_msgSend(v26, "beginOperation");

}

- (void)p_beginDrawingModeWithoutDrawingWithTouch:(id)a3
{
  id v4;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  id v32;

  v4 = a3;
  if (qword_10147E5B8 != -1)
    dispatch_once(&qword_10147E5B8, &stru_10124F390);
  if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
    sub_100E1CD44();
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));

  -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", v4);
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v7, "freehandDrawingBehaviorForTouchType:atUnscaledPoint:", objc_msgSend(v4, "type"), v8, v10);
  objc_msgSend(v7, "beginDrawingModeIfNeededForTouchType:", objc_msgSend(v4, "type"));
  if (v12 == (id)2)
  {
    v13 = objc_loadWeakRetained((id *)p_icc);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "hitRep:", v9, v11));

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "info"));
    if (v15)
    {
      v17 = (void *)v15;
      while (1)
      {
        objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v16);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
          break;
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentInfo"));

        v17 = (void *)v19;
        if (!v19)
          goto LABEL_12;
      }
      v20 = objc_loadWeakRetained((id *)p_icc);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasEditor"));
      objc_opt_class(NSObject, v22);
      v29 = sub_1002220C8(v17, v23, 1, v24, v25, v26, v27, v28, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPathWithInfo:", v30));

      v32 = objc_loadWeakRetained((id *)p_icc);
      objc_msgSend(v32, "setSelectionPath:withSelectionFlags:", v31, 0);

    }
LABEL_12:

  }
}

- (void)p_clearTimerIfNeeded
{
  NSTimer *beginDelayTimer;
  NSTimer *v4;

  beginDelayTimer = self->_beginDelayTimer;
  if (beginDelayTimer)
  {
    -[NSTimer invalidate](beginDelayTimer, "invalidate");
    v4 = self->_beginDelayTimer;
    self->_beginDelayTimer = 0;

  }
}

- (void)p_hideEditMenuIfNeeded
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asUIKitHost"));

  if (objc_msgSend(v4, "contextMenuMightBeDisplayed"))
  {
    objc_msgSend(v4, "hideEditMenu");
    objc_msgSend(v4, "setContextMenuMightBeDisplayed:", 1);
  }

}

- (void)p_closeCVCDelegatePresentedViewControllerIfNeeded
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asUIKitHost"));

  if (objc_msgSend(v4, "documentChromeHasPresentedViewController"))
    objc_msgSend(v4, "dismissDocumentChromePresentedViewController");

}

- (void)p_addCoalescedAndPredictedTouchesToTrackerForTouch:(id)a3 fromEvent:(id)a4 fromTouchesEnded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  double v15;
  double v16;
  CRLFreehandDrawingToolInputPoint *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  uint64_t v23;
  double v24;
  double v25;
  CRLFreehandDrawingToolInputPoint *v26;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = v8;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "coalescedTouchesForTouch:", v8));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", v14);
        v17 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:", v14, v9, 0, v5, v15, v16);
        -[CRLFreehandDrawingTracker addPoint:](self->_tracker, "addPoint:", v17);
        self->_lastActiveInputProperties = -[CRLFreehandDrawingToolInputPoint activeInputProperties](v17, "activeInputProperties");

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v11);
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predictedTouchesForTouch:", v8));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
        -[CRLiOSFreehandDrawingGestureRecognizer p_canvasTouchPointFromTouch:](self, "p_canvasTouchPointFromTouch:", v23);
        v26 = -[CRLFreehandDrawingToolInputPoint initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:]([CRLFreehandDrawingToolInputPoint alloc], "initWithUnscaledPoint:touch:event:isPredicted:wasAddedByTouchesEnded:", v23, v9, 1, v5, v24, v25);
        -[CRLFreehandDrawingTracker addPoint:](self->_tracker, "addPoint:", v26);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v20);
  }

}

- ($D9ACD5A945031E604089763E4FBE0988)p_canvasTouchPointFromTouch:(id)a3
{
  CRLInteractiveCanvasController **p_icc;
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  $D9ACD5A945031E604089763E4FBE0988 result;

  p_icc = &self->_icc;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v4, "preciseLocationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)p_icc);
  objc_msgSend(v11, "convertBoundsToUnscaledPoint:", v8, v10);
  v13 = v12;
  v15 = v14;

  v16 = v8;
  v17 = v10;
  v18 = v13;
  v19 = v15;
  result.var1.y = v19;
  result.var1.x = v18;
  result.var0.y = v17;
  result.var0.x = v16;
  return result;
}

- (void)p_canvasWillScrollOrZoom:(id)a3
{
  id v4;

  v4 = a3;
  if (self->_trackingTouch && !-[CRLiOSFreehandDrawingGestureRecognizer p_isStateDone](self, "p_isStateDone"))
  {
    if (qword_10147E5B8 != -1)
      dispatch_once(&qword_10147E5B8, &stru_10124F3B0);
    if (os_log_type_enabled((os_log_t)off_1013DB4F0, OS_LOG_TYPE_DEBUG))
      sub_100E1CD74();
    -[CRLiOSFreehandDrawingGestureRecognizer p_cancelOrFailAndCleanUpChanges](self, "p_cancelOrFailAndCleanUpChanges");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDelayTimer, 0);
  objc_storeStrong((id *)&self->_trackingTouch, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
