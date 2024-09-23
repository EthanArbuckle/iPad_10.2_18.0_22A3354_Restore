@implementation CRLFreehandDrawingTracker

- (CRLFreehandDrawingTracker)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLFreehandDrawingTracker *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *pendingInputPointsToSendToTool;
  uint64_t v11;
  NSMutableArray *pendingEstimationUpdatePointsToSendToTool;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CRLFreehandDrawingTracker;
  v5 = -[CRLFreehandDrawingTracker init](&v20, "init");
  if (v5)
  {
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261700);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E39C08();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261720);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker initWithInteractiveCanvasController:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 51, 0, "invalid nil value for '%{public}s'", "icc");

    }
    objc_storeWeak((id *)&v5->_icc, v4);
    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingInputPointsToSendToTool = v5->_pendingInputPointsToSendToTool;
    v5->_pendingInputPointsToSendToTool = (NSMutableArray *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingEstimationUpdatePointsToSendToTool = v5->_pendingEstimationUpdatePointsToSendToTool;
    v5->_pendingEstimationUpdatePointsToSendToTool = (NSMutableArray *)v11;

    WeakRetained = objc_loadWeakRetained((id *)&v5->_icc);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTool"));

    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261740);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E39B7C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261760);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker initWithInteractiveCanvasController:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 57, 0, "invalid nil value for '%{public}s'", "currentDrawingTool");

    }
    v5->_operationShouldBeDynamic = +[CRLFreehandDrawingTracker p_operationShouldBeDynamicUsingToolType:](CRLFreehandDrawingTracker, "p_operationShouldBeDynamicUsingToolType:", objc_msgSend(v15, "type"));

  }
  return v5;
}

+ (BOOL)p_operationShouldBeDynamicUsingToolType:(unint64_t)a3
{
  return a3 < 8;
}

- (void)addPoint:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_hasFinishBeenCalled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261780);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39C94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012617A0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker addPoint:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 88, 0, "Trying to add more points after calling finishWithSuccess.");

  }
  else
  {
    -[NSMutableArray addObject:](self->_pendingInputPointsToSendToTool, "addObject:", a3);
  }
}

- (void)estimatedPropertiesUpdatedOnInputPoint:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_hasFinishBeenCalled)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012617C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39D14();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012617E0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker estimatedPropertiesUpdatedOnInputPoint:]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 96, 0, "Trying to update properties on more points after calling finishWithSuccess.");

  }
  else
  {
    -[NSMutableArray addObject:](self->_pendingEstimationUpdatePointsToSendToTool, "addObject:", a3);
  }
}

- (void)finishWithSuccess:(BOOL)a3
{
  self->_hasFinishBeenCalled = 1;
  self->_wasSuccessful = a3;
  if (!-[NSMutableArray count](self->_pendingInputPointsToSendToTool, "count"))
  {
    if (self->_lastInputPointSentToTool)
      -[NSMutableArray addObject:](self->_pendingInputPointsToSendToTool, "addObject:");
  }
}

- (BOOL)shouldAllowScroll
{
  return 1;
}

- (BOOL)disallowCanvasGrowingWhileTracking
{
  return 1;
}

- (BOOL)allowPopoverToRemainOpenDuringDynamicOperation
{
  return 1;
}

- (void)willBeginDynamicOperationForReps:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded](self, "p_setTrackingToolIfNeeded", a3);
  if (!self->_trackingTool)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261800);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39D94();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261820);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker willBeginDynamicOperationForReps:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 135, 0, "invalid nil value for '%{public}s'", "_trackingTool");

  }
}

- (void)p_changeDynamicLayouts
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;

  -[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded](self, "p_setTrackingToolIfNeeded");
  if (!self->_trackingTool)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261840);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E39E20();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101261860);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_changeDynamicLayouts]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 146, 0, "invalid nil value for '%{public}s'", "_trackingTool");

  }
  if (!self->_hasBegunDrawing)
  {
    self->_hasBegunDrawing = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pkDrawingProvider"));
    objc_msgSend(v7, "activeDrawingDidBegin");

    v8 = objc_loadWeakRetained((id *)&self->_icc);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editingCoordinator"));
    objc_msgSend(v9, "suspendCollaborationWithReason:", CFSTR("CRLFreehandDrawingTracker"));

  }
  -[CRLFreehandDrawingTracker p_sendPendingInputPointsToToolAndClearQueue](self, "p_sendPendingInputPointsToToolAndClearQueue");
  -[CRLFreehandDrawingTracker p_sendPendingEstimationUpdatePointsToToolAndClearQueue](self, "p_sendPendingEstimationUpdatePointsToToolAndClearQueue");
}

- (void)p_sendPendingInputPointsToToolAndClearQueue
{
  char *v3;
  __int128 v4;
  char *v5;
  char *v6;
  char *v7;
  CRLFreehandDrawingToolInputPoint *v8;
  CRLFreehandDrawingToolInputPoint *v9;
  unsigned int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL8 v16;
  CRLFreehandDrawingToolInputPoint *lastInputPointSentToTool;
  NSObject *v18;
  char *v19;
  __int128 v20;
  uint8_t buf[4];
  unsigned int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;

  v3 = (char *)-[NSMutableArray count](self->_pendingInputPointsToSendToTool, "count");
  if (v3)
  {
    v5 = v3;
    v6 = 0;
    v7 = v3 - 1;
    *(_QWORD *)&v4 = 67109378;
    v20 = v4;
    do
    {
      v8 = (CRLFreehandDrawingToolInputPoint *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_pendingInputPointsToSendToTool, "objectAtIndexedSubscript:", v6, v20));
      v9 = v8;
      if (!self->_hasSentInitialPointToTool && -[CRLFreehandDrawingToolInputPoint isPredicted](v8, "isPredicted"))
      {
        v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101261880);
        v11 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109890;
          v22 = v10;
          v23 = 2082;
          v24 = "-[CRLFreehandDrawingTracker p_sendPendingInputPointsToToolAndClearQueue]";
          v25 = 2082;
          v26 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m";
          v27 = 1024;
          v28 = 175;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d The first point sent should not be predicted.", buf, 0x22u);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012618A0);
        v12 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v18 = v12;
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = v20;
          v22 = v10;
          v23 = 2114;
          v24 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_sendPendingInputPointsToToolAndClearQueue]"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 175, 0, "The first point sent should not be predicted.");

      }
      v16 = v7 == v6 && self->_hasFinishBeenCalled;
      -[CRLFreehandDrawingTool performActionWithInputPoint:isInitialPoint:isFinalPoint:](self->_trackingTool, "performActionWithInputPoint:isInitialPoint:isFinalPoint:", v9, !self->_hasSentInitialPointToTool, v16);
      self->_hasSentInitialPointToTool = 1;
      lastInputPointSentToTool = self->_lastInputPointSentToTool;
      self->_lastInputPointSentToTool = v9;

      ++v6;
    }
    while (v5 != v6);
  }
  -[NSMutableArray removeAllObjects](self->_pendingInputPointsToSendToTool, "removeAllObjects");
}

- (void)p_sendPendingEstimationUpdatePointsToToolAndClearQueue
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (!self->_hasFinishBeenCalled)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_pendingEstimationUpdatePointsToSendToTool;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[CRLFreehandDrawingTool estimatedPropertiesUpdatedOnInputPoint:](self->_trackingTool, "estimatedPropertiesUpdatedOnInputPoint:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), (_QWORD)v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
  -[NSMutableArray removeAllObjects](self->_pendingEstimationUpdatePointsToSendToTool, "removeAllObjects", (_QWORD)v8);
}

- (void)p_setTrackingToolIfNeeded
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLFreehandDrawingTool *v11;
  void *v12;
  void *v13;
  void *v14;
  CRLFreehandDrawingTool *trackingTool;
  CRLFreehandDrawingTool *v16;

  if (!self->_trackingTool)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012618C0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E39FC4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012618E0);
      v4 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 200, 0, "invalid nil value for '%{public}s'", "icc");

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261900);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E39F38();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261920);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 203, 0, "invalid nil value for '%{public}s'", "toolkit");

    }
    v11 = (CRLFreehandDrawingTool *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentTool"));
    if (!v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261940);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E39EAC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261960);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker p_setTrackingToolIfNeeded]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 206, 0, "invalid nil value for '%{public}s'", "drawingTool");

    }
    trackingTool = self->_trackingTool;
    self->_trackingTool = v11;
    v16 = v11;

    LOBYTE(trackingTool) = -[CRLFreehandDrawingTool shouldCommandsEnqueueInRealTime](self->_trackingTool, "shouldCommandsEnqueueInRealTime");
    self->_isEnqueueingCommandsInRealTime = (char)trackingTool;

  }
}

- (void)commitChangesForReps:(id)a3
{
  id v4;
  NSObject *v5;
  CRLFreehandDrawingTool *trackingTool;
  id WeakRetained;
  void *v8;
  CRLFreehandDrawingTool *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  CRLFreehandDrawingTool *v19;
  CRLFreehandDrawingToolInputPoint *lastInputPointSentToTool;

  v4 = a3;
  if (self->_hasBegunDrawing)
  {
    if (!self->_hasFinishBeenCalled)
    {
      if (qword_10147E368 != -1)
        dispatch_once(&qword_10147E368, &stru_101261980);
      v5 = off_1013D9068;
      if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_ERROR))
        sub_100E3A150(v5);
      -[CRLFreehandDrawingTracker finishWithSuccess:](self, "finishWithSuccess:", 0);
      -[CRLFreehandDrawingTracker p_changeDynamicLayouts](self, "p_changeDynamicLayouts");
    }
    trackingTool = self->_trackingTool;
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
    v9 = (CRLFreehandDrawingTool *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentTool"));

    if (trackingTool != v9)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012619A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3A0D0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012619C0);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker commitChangesForReps:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 228, 0, "_trackingTool shouldn't have changed while we were in the dynamic operation.");

    }
    v13 = -[CRLFreehandDrawingTool finalizeAndResetWithSuccess:](self->_trackingTool, "finalizeAndResetWithSuccess:", self->_wasSuccessful);
    if (!self->_wasSuccessful && v13)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012619E0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3A050();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101261A00);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingTracker commitChangesForReps:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingTracker.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 231, 0, "The tool can add a failure, but not stop a failure from this tracker.");

    }
    -[CRLFreehandDrawingTool clearIsCurrentlyTracking](self->_trackingTool, "clearIsCurrentlyTracking");
    v17 = objc_loadWeakRetained((id *)&self->_icc);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editingCoordinator"));
    objc_msgSend(v18, "resumeCollaborationWithReason:", CFSTR("CRLFreehandDrawingTracker"));

  }
  v19 = self->_trackingTool;
  self->_trackingTool = 0;

  lastInputPointSentToTool = self->_lastInputPointSentToTool;
  self->_lastInputPointSentToTool = 0;

}

- (BOOL)shouldOpenCommandGroupToCommitChangesForReps:(id)a3
{
  return 0;
}

- (BOOL)supportsAlignmentGuides
{
  return 0;
}

- (BOOL)operationShouldBeDynamic
{
  return self->_operationShouldBeDynamic;
}

- (BOOL)isEnqueueingCommandsInRealTime
{
  return self->_isEnqueueingCommandsInRealTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInputPointSentToTool, 0);
  objc_storeStrong((id *)&self->_pendingEstimationUpdatePointsToSendToTool, 0);
  objc_storeStrong((id *)&self->_pendingInputPointsToSendToTool, 0);
  objc_storeStrong((id *)&self->_trackingTool, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
