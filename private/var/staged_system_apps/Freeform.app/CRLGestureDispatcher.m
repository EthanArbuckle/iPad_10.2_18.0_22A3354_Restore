@implementation CRLGestureDispatcher

- (CRLGestureDispatcher)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLGestureDispatcher *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableSet *firedGestures;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLGestureDispatcher;
  v5 = -[CRLGestureDispatcher init](&v12, "init");
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FF68);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1DCF4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124FF88);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 161, 0, "invalid nil value for '%{public}s'", "icc");

    }
    -[CRLGestureDispatcher setInteractiveCanvasController:](v5, "setInteractiveCanvasController:", v4);
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    firedGestures = v5->_firedGestures;
    v5->_firedGestures = (NSMutableSet *)v9;

  }
  return v5;
}

- (void)teardown
{
  -[NSMutableSet removeAllObjects](self->_firedGestures, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_targetsInFlight, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_gesturesInFlight, "removeAllObjects");
}

- (void)handleGesture:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *targetsInFlight;
  NSMutableArray *v7;
  NSMutableArray *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cachedGestureTarget"));
  if (v5)
  {
    targetsInFlight = self->_targetsInFlight;
    if (!targetsInFlight)
    {
      v7 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
      v8 = self->_targetsInFlight;
      self->_targetsInFlight = v7;

      targetsInFlight = self->_targetsInFlight;
    }
    if ((-[NSMutableArray containsObject:](targetsInFlight, "containsObject:", v5) & 1) == 0)
    {
      objc_msgSend(v5, "gestureSequenceWillBegin");
      -[NSMutableArray insertObject:atIndex:](self->_targetsInFlight, "insertObject:atIndex:", v5, 0);
      if (-[NSMutableArray count](self->_targetsInFlight, "count") == (id)1)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
        objc_msgSend(v10, "suspendCollaborationWithReason:", CFSTR("CRLTextGesturesInFlight"));

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher firedGestures](self, "firedGestures"));
    objc_msgSend(v11, "addObject:", v4);

    self->_runningTargetHandleGesture = 1;
    objc_msgSend(v5, "handleGesture:", v4);
    self->_runningTargetHandleGesture = 0;
    if (objc_msgSend(v4, "isDone"))
      objc_msgSend(v4, "setTargetRep:", 0);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FFA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DDA0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FFC8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher handleGesture:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 184, 0, "gestureTarget should not be nil, shouldReceiveTouch should have failed this gesture");

  }
}

- (void)handleGesture:(id)a3 withTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if (!self->_runningTargetHandleGesture)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124FFE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1DE24();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101250008);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGestureDispatcher handleGesture:withTarget:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLGestureDispatcher.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 221, 0, "handleGesture:withTarget: can only be called from a target's handleGesture: method");

  }
  objc_msgSend(v6, "setCachedGestureTarget:", v7);
  -[CRLGestureDispatcher handleGesture:](self, "handleGesture:", v6);

}

- (void)allowSimultaneousRecognitionByRecognizers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id *v8;
  id v9;
  NSMutableArray *simultaneitySets;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v4));
  v13 = (id *)&v15;
  v6 = v14;
  if (v6)
  {
    v7 = v6;
    do
    {
      objc_msgSend(v5, "addObject:", v7);
      v8 = v13++;
      v9 = *v8;

      v7 = v9;
    }
    while (v9);
  }
  simultaneitySets = self->_simultaneitySets;
  if (!simultaneitySets)
  {
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v12 = self->_simultaneitySets;
    self->_simultaneitySets = v11;

    simultaneitySets = self->_simultaneitySets;
  }
  -[NSMutableArray addObject:](simultaneitySets, "addObject:", v5);

}

- (void)allowSimultaneousRecognitionByRecognizerSet:(id)a3
{
  id v4;
  NSMutableArray *simultaneitySets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;

  v4 = a3;
  simultaneitySets = self->_simultaneitySets;
  v9 = v4;
  if (!simultaneitySets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_simultaneitySets;
    self->_simultaneitySets = v6;

    v4 = v9;
    simultaneitySets = self->_simultaneitySets;
  }
  v8 = objc_msgSend(v4, "copy");
  -[NSMutableArray addObject:](simultaneitySets, "addObject:", v8);

}

- (void)prioritizeRecognizer:(id)a3 overRecognizer:(id)a4
{
  id v6;
  CRLNoCopyDictionary *priorityMap;
  CRLNoCopyDictionary *v8;
  CRLNoCopyDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  priorityMap = self->_priorityMap;
  if (!priorityMap)
  {
    v8 = objc_alloc_init(CRLNoCopyDictionary);
    v9 = self->_priorityMap;
    self->_priorityMap = v8;

    priorityMap = self->_priorityMap;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNoCopyDictionary objectForKey:](priorityMap, "objectForKey:", v6));
  if (v10)
  {
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "setByAddingObject:", v13));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
  }
  -[CRLNoCopyDictionary setObject:forUncopiedKey:](self->_priorityMap, "setObject:forUncopiedKey:", v12, v6);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id WeakRetained;
  unsigned __int8 v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  CRLNoCopyDictionary *priorityMap;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *i;
  void *v37;
  id v38;
  void *v39;
  _BOOL4 v40;
  id v41;
  BOOL v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v6 = objc_msgSend(WeakRetained, "currentlyScrolling");

  if ((v6 & 1) != 0
    || (v7 = objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher p_getGestureTarget:](self, "p_getGestureTarget:", v4))) == 0)
  {
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));

    if (v9 == CFSTR("CRLWPUndefinedGestureKind"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asUIKitHost"));

      v20 = sub_100221DDC(v13, 1, v14, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if (v21)
      {
        v22 = v21;
        v10 = objc_msgSend(v21, "gestureRecognizerShouldBegin:", v4);

        v8 = 0;
        if (!v10)
          goto LABEL_33;
        goto LABEL_8;
      }

    }
    v8 = 0;
    LOBYTE(v10) = 0;
    goto LABEL_33;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "setCachedGestureTarget:", v7);
LABEL_8:
  priorityMap = self->_priorityMap;
  if (priorityMap)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLNoCopyDictionary objectForKey:](priorityMap, "objectForKey:", v4));
    v25 = v24;
    if (v24)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v26 = v24;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v27)
      {
        v34 = v27;
        v44 = v25;
        v35 = *(_QWORD *)v46;
        while (2)
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(_QWORD *)v46 != v35)
              objc_enumerationMutation(v26);
            v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
            v38 = sub_100221DDC(v4, 1, v28, v29, v30, v31, v32, v33, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
            v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
            v40 = objc_msgSend(v37, "state") == (id)5 && objc_msgSend(v39, "inputType") == (id)2;
            v41 = objc_msgSend(v37, "state");

            if (v41)
              v42 = !v40;
            else
              v42 = 0;
            if (v42)
            {
              LOBYTE(v10) = 0;
              goto LABEL_28;
            }
          }
          v34 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v34)
            continue;
          break;
        }
        LOBYTE(v10) = 1;
LABEL_28:
        v25 = v44;
      }
      else
      {
        LOBYTE(v10) = 1;
      }

    }
    else
    {
      LOBYTE(v10) = 1;
    }

  }
  else
  {
    LOBYTE(v10) = 1;
  }
LABEL_33:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  id WeakRetained;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  __CFString *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  __CFString *v37;
  id v38;
  unsigned int v39;
  id v40;
  void *v41;
  void *v42;
  NSMutableArray *gesturesInFlight;
  NSMutableArray *v44;
  NSMutableArray *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  const __CFString *v51;
  id v52;

  v6 = a3;
  v7 = a4;
  v14 = sub_100221DDC(v6, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v15, "setInputType:", sub_10033831C((_BOOL8)objc_msgSend(v7, "type")));
  v16 = objc_msgSend(v15, "inputType") != (id)2;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "textInputResponder"));
  objc_msgSend(v18, "setIgnorePencilInputSource:", v16);

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "asUIKitHost"));

  v22 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvasView"));
  objc_msgSend(v7, "locationInView:", v23);
  v25 = v24;
  v27 = v26;

  if ((objc_msgSend(v21, "shouldIgnoreTextGesture:atPoint:", v15, v25, v27) & 1) != 0)
  {
    v28 = 0;
    goto LABEL_19;
  }
  v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestureKind"));
  if (v29 == CFSTR("CRLWPUndefinedGestureKind"))
    goto LABEL_9;
  v36 = v29;
  v37 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "gestureKind"));
  if (v37 != CFSTR("CRLWPImmediateSingleTap"))
  {

    goto LABEL_7;
  }
  v38 = objc_msgSend(v15, "inputType");

  if (!v38)
  {
LABEL_9:
    v40 = sub_100221DDC(v21, 1, v30, v31, v32, v33, v34, v35, (uint64_t)&OBJC_PROTOCOL___UIGestureRecognizerDelegate);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = v41;
    if (v41)
      v39 = objc_msgSend(v41, "gestureRecognizer:shouldReceiveTouch:", v6, v7);
    else
      v39 = 0;

LABEL_13:
    v28 = v39 != 0;
    if (!v39)
      goto LABEL_19;
    goto LABEL_14;
  }
LABEL_7:
  if (!-[CRLGestureDispatcher p_allowTextGestureTouch:](self, "p_allowTextGestureTouch:", v7))
  {
    v39 = objc_msgSend(v21, "allowTouchOutsideCanvasViewAtPoint:forGesture:", v6, v25, v27);
    goto LABEL_13;
  }
LABEL_14:
  gesturesInFlight = self->_gesturesInFlight;
  if (gesturesInFlight)
  {
    if (-[NSMutableArray indexOfObjectIdenticalTo:](gesturesInFlight, "indexOfObjectIdenticalTo:", v6) == (id)0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray addObject:](self->_gesturesInFlight, "addObject:", v6);
    v28 = 1;
  }
  else
  {
    v44 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v6, 0);
    v45 = self->_gesturesInFlight;
    self->_gesturesInFlight = v44;

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher firedGestures](self, "firedGestures"));
    objc_msgSend(v46, "removeAllObjects");

    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v51 = CFSTR("CRLTextGesturesICC");
    v48 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v52 = v48;
    v28 = 1;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
    objc_msgSend(v47, "postNotificationName:object:userInfo:", CFSTR("CRLTextGesturesWillBeginNotification"), self, v49);

  }
LABEL_19:

  return v28;
}

- (BOOL)p_allowTextGestureTouch:(id)a3
{
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id v4;
  id WeakRetained;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  p_interactiveCanvasController = &self->_interactiveCanvasController;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v4, "locationInView:", v6);
  v8 = v7;
  v10 = v9;

  v11 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asUIKitHost"));

  if ((objc_msgSend(v13, "touchHitsCanvasViewAtPoint:", v8, v10) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v15 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerHost"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asiOSCVC"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    if ((objc_opt_respondsToSelector(v18, "currentDocumentMode") & 1) != 0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentDocumentMode"));
      v14 = objc_msgSend(v19, "shouldAllowTextGesturesInRestrictedGestureMode");

    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *simultaneitySets;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v6 = a3;
  v7 = a4;
  simultaneitySets = self->_simultaneitySets;
  if (simultaneitySets)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = simultaneitySets;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v13, "containsObject:", v6, (_QWORD)v15)
            && (objc_msgSend(v13, "containsObject:", v7) & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_14;
          }
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return (char)v10;
}

- (id)p_getGestureTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  unsigned int v26;
  id v27;
  id v28;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "textInputEditor"));

  v14 = sub_100221DDC(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLGestureTarget);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v22 = sub_100221DDC(v5, 1, v16, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLGestureTarget);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (v15 && (v24 = objc_msgSend(v15, "canHandleGesture:", v4), v25 = v15, (v24 & 1) != 0)
    || v23 && (v26 = objc_msgSend(v23, "canHandleGesture:", v4), v25 = v23, v26))
  {
    v27 = v25;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  return v28;
}

- (BOOL)gestureActionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  __CFString *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher p_getGestureTarget:](self, "p_getGestureTarget:", v4));
  if (v5)
  {
    objc_msgSend(v4, "setCachedGestureTarget:", v5);
    v6 = 1;
  }
  else
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "gestureKind"));

    if (v7 == CFSTR("CRLWPUndefinedGestureKind"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asUIKitHost"));
      v17 = sub_100221DDC(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      if ((objc_opt_respondsToSelector(v18, "gestureActionShouldBegin:") & 1) != 0)
        v6 = objc_msgSend(v18, "gestureActionShouldBegin:", v4);
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)gestureRemovedFromView:(id)a3
{
  uint64_t v4;
  NSMutableArray *gesturesInFlight;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  gesturesInFlight = self->_gesturesInFlight;
  if (gesturesInFlight)
  {
    objc_opt_class(UIGestureRecognizer, v4);
    v7 = sub_100221D0C(v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = -[NSMutableArray indexOfObjectIdenticalTo:](gesturesInFlight, "indexOfObjectIdenticalTo:", v8);

    if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
      -[CRLGestureDispatcher p_gestureNoLongerInFlight:](self, "p_gestureNoLongerInFlight:", v10);
  }

}

- (void)p_gestureNoLongerInFlight:(id)a3
{
  id v4;
  NSMutableArray *gesturesInFlight;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id WeakRetained;
  void *v26;
  void *v27;
  void *v28;
  NSMutableArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _BYTE v40[128];
  _BYTE v41[128];

  v4 = a3;
  gesturesInFlight = self->_gesturesInFlight;
  objc_opt_class(UIGestureRecognizer, v6);
  v8 = sub_100221D0C(v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[NSMutableArray removeObjectIdenticalTo:](gesturesInFlight, "removeObjectIdenticalTo:", v9);

  if (!-[NSMutableArray count](self->_gesturesInFlight, "count"))
  {
    if (-[NSMutableArray count](self->_targetsInFlight, "count"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher interactiveCanvasController](self, "interactiveCanvasController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editingCoordinator"));
      objc_msgSend(v11, "resumeCollaborationWithReason:", CFSTR("CRLTextGesturesInFlight"));

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = self->_targetsInFlight;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v35;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v35 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v16), "gestureSequenceDidEnd");
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        }
        while (v14);
      }

      -[NSMutableArray removeAllObjects](self->_targetsInFlight, "removeAllObjects");
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher firedGestures](self, "firedGestures", 0));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v31;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v31 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v22), "gestureKind"));
          objc_msgSend(v17, "addObject:", v23);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      }
      while (v20);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v38[0] = CFSTR("CRLTextGesturesICC");
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v39[0] = WeakRetained;
    v39[1] = v17;
    v38[1] = CFSTR("CRLTextGesturesDidEndNotificationFiredGestureKindsKey");
    v38[2] = CFSTR("CRLTextGesturesDidEndNotificationFiredGesturesKey");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher firedGestures](self, "firedGestures"));
    v38[3] = CFSTR("CRLTextGesturesTerminated");
    v39[2] = v26;
    v39[3] = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 4));
    objc_msgSend(v24, "postNotificationName:object:userInfo:", CFSTR("CRLTextGesturesDidEndNotification"), self, v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGestureDispatcher firedGestures](self, "firedGestures"));
    objc_msgSend(v28, "removeAllObjects");

    v29 = self->_gesturesInFlight;
    self->_gesturesInFlight = 0;

  }
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveCanvasController, a3);
}

- (CRLNoCopyDictionary)priorityMap
{
  return self->_priorityMap;
}

- (void)setPriorityMap:(id)a3
{
  objc_storeStrong((id *)&self->_priorityMap, a3);
}

- (BOOL)runningTargetHandleGesture
{
  return self->_runningTargetHandleGesture;
}

- (void)setRunningTargetHandleGesture:(BOOL)a3
{
  self->_runningTargetHandleGesture = a3;
}

- (NSMutableSet)firedGestures
{
  return self->_firedGestures;
}

- (void)setFiredGestures:(id)a3
{
  objc_storeStrong((id *)&self->_firedGestures, a3);
}

- (NSMutableArray)simultaneitySets
{
  return self->_simultaneitySets;
}

- (void)setSimultaneitySets:(id)a3
{
  objc_storeStrong((id *)&self->_simultaneitySets, a3);
}

- (NSMutableArray)gesturesInFlight
{
  return self->_gesturesInFlight;
}

- (void)setGesturesInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_gesturesInFlight, a3);
}

- (NSMutableArray)targetsInFlight
{
  return self->_targetsInFlight;
}

- (void)setTargetsInFlight:(id)a3
{
  objc_storeStrong((id *)&self->_targetsInFlight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetsInFlight, 0);
  objc_storeStrong((id *)&self->_gesturesInFlight, 0);
  objc_storeStrong((id *)&self->_simultaneitySets, 0);
  objc_storeStrong((id *)&self->_firedGestures, 0);
  objc_storeStrong((id *)&self->_priorityMap, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
