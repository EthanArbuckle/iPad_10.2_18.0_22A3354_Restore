@implementation CRLFreehandDrawingToolkit

- (CRLFreehandDrawingToolkit)initWithDelegate:(id)a3 uiState:(id)a4
{
  id v6;
  CRLFreehandDrawingToolkitUIState *v7;
  CRLFreehandDrawingToolkit *v8;
  CRLFreehandDrawingToolkit *v9;
  uint64_t v10;
  NSHashTable *observers;
  void *v12;
  void *v13;
  void *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *animationSerialQueue;
  NSMutableSet *v17;
  NSMutableSet *objectUUIDsToAnimate;
  NSMutableDictionary *v19;
  NSMutableDictionary *animationCompletionHandlers;
  uint64_t v21;
  CRLColor *defaultOutlineColor;
  objc_super v24;

  v6 = a3;
  v7 = (CRLFreehandDrawingToolkitUIState *)a4;
  v24.receiver = self;
  v24.super_class = (Class)CRLFreehandDrawingToolkit;
  v8 = -[CRLFreehandDrawingToolkit init](&v24, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 5));
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    if (!v7)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D6E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1A434();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124D708);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit initWithDelegate:uiState:]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 64, 0, "Expected to get a toolkit UI state from the document!");

      v7 = objc_alloc_init(CRLFreehandDrawingToolkitUIState);
    }
    objc_storeStrong((id *)&v9->_toolkitUIState, v7);
    v15 = dispatch_queue_create("com.apple.freeform.freehand-drawing.canvas-animation", 0);
    animationSerialQueue = v9->_animationSerialQueue;
    v9->_animationSerialQueue = (OS_dispatch_queue *)v15;

    v17 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    objectUUIDsToAnimate = v9->_objectUUIDsToAnimate;
    v9->_objectUUIDsToAnimate = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    animationCompletionHandlers = v9->_animationCompletionHandlers;
    v9->_animationCompletionHandlers = v19;

    v21 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithHexString:](CRLColor, "colorWithHexString:", CFSTR("#636366")));
    defaultOutlineColor = v9->_defaultOutlineColor;
    v9->_defaultOutlineColor = (CRLColor *)v21;

  }
  return v9;
}

- (void)addToolkitObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D728);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A534();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D748);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit addToolkitObserver:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 78, 0, "This operation must only be performed on the main thread.");

  }
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D768);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A4B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D788);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit addToolkitObserver:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 79, 0, "Should not add a freehand drawing toolkit observer that's already added.");

  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)removeToolkitObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D7A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A634();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D7C8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit removeToolkitObserver:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 85, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D7E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A5B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D808);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit removeToolkitObserver:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 86, 0, "Should not remove a freehand drawing toolkit observer that has not been added.");

  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (CRLFreehandDrawingTool)currentTool
{
  CRLFreehandDrawingTool *cachedCurrentTool;
  CRLFreehandDrawingToolkitUIState *toolkitUIState;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  CRLFreehandDrawingTool *v9;
  CRLFreehandDrawingTool *v10;

  cachedCurrentTool = self->_cachedCurrentTool;
  if (!cachedCurrentTool)
  {
    toolkitUIState = self->_toolkitUIState;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForFreehandDrawingTools"));
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
    v9 = (CRLFreehandDrawingTool *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState currentToolForInteractiveCanvasController:pencilKitCanvasViewController:](toolkitUIState, "currentToolForInteractiveCanvasController:pencilKitCanvasViewController:", v6, v8));
    v10 = self->_cachedCurrentTool;
    self->_cachedCurrentTool = v9;

    cachedCurrentTool = self->_cachedCurrentTool;
  }
  return cachedCurrentTool;
}

- (void)setCurrentToolSelection:(unint64_t)a3
{
  unint64_t v5;
  CRLFreehandDrawingTool *cachedCurrentTool;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = -[CRLFreehandDrawingToolkitUIState currentToolType](self->_toolkitUIState, "currentToolType");
  if (a3 == 8 || v5 != a3)
  {
    cachedCurrentTool = self->_cachedCurrentTool;
    self->_cachedCurrentTool = 0;

    self->_askedDelegateForSmartAnnotationTool = 0;
    -[CRLFreehandDrawingToolkitUIState setCurrentToolType:](self->_toolkitUIState, "setCurrentToolType:", a3);
    v7 = -[NSHashTable copy](self->_observers, "copy");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "toolkitDidUpdateCurrentToolSelection", (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)resetToMostRecentRestorableToolType
{
  void *v3;

  v3 = -[CRLFreehandDrawingToolkitUIState mostRecentRestorableToolType](self->_toolkitUIState, "mostRecentRestorableToolType");
  if (v3 != (void *)-[CRLFreehandDrawingToolkitUIState currentToolType](self->_toolkitUIState, "currentToolType"))
    -[CRLFreehandDrawingToolkit setCurrentToolSelection:](self, "setCurrentToolSelection:", -[CRLFreehandDrawingToolkitUIState mostRecentRestorableToolType](self->_toolkitUIState, "mostRecentRestorableToolType"));
}

- (CRLColor)colorForCurrentTool
{
  CRLFreehandDrawingToolkitUIState *toolkitUIState;
  void *v3;
  void *v4;

  toolkitUIState = self->_toolkitUIState;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkitUIState colorForToolType:](toolkitUIState, "colorForToolType:", objc_msgSend(v3, "type")));

  return (CRLColor *)v4;
}

- (void)setColorForCurrentTool:(id)a3
{
  CRLFreehandDrawingTool *cachedCurrentTool;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  -[CRLFreehandDrawingToolkitUIState setCurrentToolColor:](self->_toolkitUIState, "setCurrentToolColor:", a3);
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pencilKitCanvasView"));
  objc_msgSend(v8, "updatePencilKitToolIfAppropriateFor:", v7);

}

- (double)opacityForCurrentTool
{
  CRLFreehandDrawingToolkitUIState *toolkitUIState;
  void *v3;
  double v4;
  double v5;

  toolkitUIState = self->_toolkitUIState;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  -[CRLFreehandDrawingToolkitUIState opacityForToolType:](toolkitUIState, "opacityForToolType:", objc_msgSend(v3, "type"));
  v5 = v4;

  return v5;
}

- (void)setOpacityForCurrentTool:(double)a3
{
  CRLFreehandDrawingTool *cachedCurrentTool;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  -[CRLFreehandDrawingToolkitUIState setCurrentToolOpacity:](self->_toolkitUIState, "setCurrentToolOpacity:", a3);
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pencilKitCanvasView"));
  objc_msgSend(v8, "updatePencilKitToolIfAppropriateFor:", v7);

}

- (double)widthForCurrentTool
{
  CRLFreehandDrawingToolkitUIState *toolkitUIState;
  void *v3;
  double v4;
  double v5;

  toolkitUIState = self->_toolkitUIState;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  -[CRLFreehandDrawingToolkitUIState strokeWidthForToolType:](toolkitUIState, "strokeWidthForToolType:", objc_msgSend(v3, "type"));
  v5 = v4;

  return v5;
}

- (void)setWidthForCurrentTool:(double)a3
{
  CRLFreehandDrawingTool *cachedCurrentTool;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  -[CRLFreehandDrawingToolkitUIState setCurrentToolWidth:](self->_toolkitUIState, "setCurrentToolWidth:", a3);
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pencilKitCanvasView"));
  objc_msgSend(v5, "updatePencilKitToolIfAppropriateFor:", v8);

  -[CRLFreehandDrawingToolkit p_notifyObserversOfWidthChange](self, "p_notifyObserversOfWidthChange");
}

- (void)containedToolDidSetWidth:(id)a3
{
  if (self->_cachedCurrentTool == a3)
    -[CRLFreehandDrawingToolkit p_notifyObserversOfWidthChange](self, "p_notifyObserversOfWidthChange");
}

- (void)p_notifyObserversOfWidthChange
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v2 = -[NSHashTable copy](self->_observers, "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "toolkitDidUpdateCurrentToolWidth", (_QWORD)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setRulerToolShowing:(BOOL)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  if (self->_isRulerToolShowing != a3)
  {
    self->_isRulerToolShowing = a3;
    v3 = -[NSHashTable copy](self->_observers, "copy");
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "toolkitDidUpdateRulerVisibility", (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (PKCanvasView)pkCanvasView
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pencilKitCanvasView"));

  return (PKCanvasView *)v4;
}

- (void)keepPencilShadowVisible
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pencilKitCanvasView"));
  objc_msgSend(v3, "_keepPencilShadowVisible");

}

- (void)updatePencilShadowWithInputPoint:(id *)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[8];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pencilKitCanvasView"));
  v7 = *(_OWORD *)&a3->var9;
  v11[4] = *(_OWORD *)&a3->var7;
  v11[5] = v7;
  v8 = *(_OWORD *)&a3->var13;
  v11[6] = *(_OWORD *)&a3->var11;
  v11[7] = v8;
  v9 = *(_OWORD *)&a3->var1;
  v11[0] = a3->var0;
  v11[1] = v9;
  v10 = *(_OWORD *)&a3->var5;
  v11[2] = *(_OWORD *)&a3->var3;
  v11[3] = v10;
  objc_msgSend(v6, "_updatePencilShadowViewWithInputPoint:", v11);

}

- (void)updatePencilShadowToScribbleMode
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init((Class)PKHandwritingTool);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pencilKitCanvasView"));
  objc_msgSend(v5, "setTool:", v6);

}

- (void)beginDrawingModeIfNeededForTouchType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  CRLFreehandDrawingToolkitDelegate **p_delegate;
  id WeakRetained;
  id v10;

  if (!-[CRLFreehandDrawingToolkit canBeginFreehandDrawingMode](self, "canBeginFreehandDrawingMode"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A6B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D848);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit beginDrawingModeIfNeededForTouchType:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 215, 0, "Should only try to begin drawing mode when it's allowed.");

  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "beginDrawingModeIfNeeded");

  if (a3)
  {
    if (a3 == 1)
    {
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "toolkitDidDrawWithIndirectTouch");
    }
    else
    {
      if (a3 != 2)
        return;
      v10 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v10, "toolkitDidDrawWithPencil");
    }
  }
  else
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "toolkitDidDrawWithFinger");
  }

}

- (void)endDrawingModeIfNeeded
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "endDrawingModeIfNeeded");

}

- (void)beginDrawingTransformModeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;

  if (!-[CRLFreehandDrawingToolkit isInDrawingMode](self, "isInDrawingMode"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D868);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A734();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D888);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingToolkit beginDrawingTransformModeIfNeeded]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingToolkit.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 232, 0, "Transform mode can only begin when drawing mode is already active.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "beginDrawingTransformModeIfNeeded");

}

- (BOOL)canBeginFreehandDrawingMode
{
  CRLFreehandDrawingToolkitDelegate **p_delegate;
  id WeakRetained;
  void *v4;
  unsigned __int8 v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForFreehandDrawingTools"));
  if ((objc_msgSend(v4, "documentIsSharedReadOnly") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    v5 = objc_msgSend(v6, "canBeginFreehandDrawingMode");

  }
  return v5;
}

- (BOOL)isInDrawingMode
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "isInDrawingMode");

  return v3;
}

- (BOOL)isLassoSelectionForMixedTypeEnabledInDrawingMode
{
  unsigned int v3;
  void *v4;
  id v5;

  v3 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  v5 = objc_msgSend(v4, "type");

  if (v3 && -[CRLFreehandDrawingToolkit isInDrawingMode](self, "isInDrawingMode") && v5 == (id)9)
    return -[CRLFreehandDrawingToolkit isLassoAbleToSelectMixedType](self, "isLassoAbleToSelectMixedType");
  else
    return 0;
}

- (BOOL)isLassoAbleToSelectMixedType
{
  void *v3;
  BOOL v4;

  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit toolkitUIState](self, "toolkitUIState"));
  v4 = objc_msgSend(v3, "currentLassoType") == 0;

  return v4;
}

- (BOOL)wantsToSuppressKnobsOnTransformReps
{
  id WeakRetained;
  unsigned __int8 v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v3 = objc_msgSend(WeakRetained, "wantsToSuppressKnobsOnTransformReps");

  return v3;
}

- (unint64_t)freehandDrawingBehaviorForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  id WeakRetained;
  void *v12;
  id v13;
  char *v14;
  void *v15;
  id v16;
  uint64_t v17;

  y = a4.y;
  x = a4.x;
  v8 = -[CRLFreehandDrawingToolkit isInDrawingMode](self, "isInDrawingMode");
  v9 = v8;
  if (a3 != 2 && !v8)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForFreehandDrawingTools"));

  if ((objc_msgSend(v12, "documentIsSharedReadOnly") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    v14 = (char *)objc_msgSend(v13, "freehandDrawingBehaviorAtUnscaledPoint:", x, y);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
    v16 = objc_msgSend(v15, "type");

    if (v16 == (id)8 && (unint64_t)(v14 - 1) < 2)
    {
      v10 = 3;
    }
    else
    {
      v17 = 2;
      if (v9)
        v17 = 3;
      if (v14 == (char *)2 && v16 == (id)9)
        v10 = v17;
      else
        v10 = (unint64_t)v14;
    }
  }

  return v10;
}

- (BOOL)currentToolAllowsDragForTouchType:(int64_t)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  unsigned __int8 v9;

  y = a4.y;
  x = a4.x;
  if (!-[CRLFreehandDrawingToolkit isInDrawingMode](self, "isInDrawingMode"))
    return 1;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  v9 = objc_msgSend(v8, "wantsDragForTouchType:atUnscaledPoint:", a3, x, y);

  return v9;
}

- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4
{
  -[CRLFreehandDrawingToolkit enqueueAnimationForObjectUUID:animation:completion:](self, "enqueueAnimationForObjectUUID:animation:completion:", a3, a4, 0);
}

- (void)enqueueAnimationForObjectUUID:(id)a3 animation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *animationSerialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  CRLFreehandDrawingToolkit *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  animationSerialQueue = self->_animationSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CC918;
  block[3] = &unk_101234DC8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(animationSerialQueue, block);

}

- (BOOL)wantsToAnimateForObjectUUID:(id)a3 animation:(id)a4
{
  id v6;
  id v7;
  NSObject *animationSerialQueue;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  animationSerialQueue = self->_animationSerialQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002CCA80;
  v12[3] = &unk_101234D08;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v15 = &v16;
  v9 = v7;
  v10 = v6;
  dispatch_sync(animationSerialQueue, v12);
  LOBYTE(animationSerialQueue) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)animationSerialQueue;
}

- (id)animationCompletionHandlerForObjectUUID:(id)a3 animation:(id)a4
{
  id v6;
  id v7;
  NSObject *animationSerialQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  CRLFreehandDrawingToolkit *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  id (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1002CCCF0;
  v22 = sub_1002CCD18;
  v23 = 0;
  animationSerialQueue = self->_animationSerialQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002CCD20;
  v13[3] = &unk_101239528;
  v14 = v6;
  v15 = v7;
  v16 = self;
  v17 = &v18;
  v9 = v7;
  v10 = v6;
  dispatch_sync(animationSerialQueue, v13);
  v11 = objc_retainBlock((id)v19[5]);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)setUpdatedToolkitUIStateFromArchive:(id)a3
{
  id v5;
  CRLFreehandDrawingTool *cachedCurrentTool;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_toolkitUIState, a3);
  v5 = a3;
  cachedCurrentTool = self->_cachedCurrentTool;
  self->_cachedCurrentTool = 0;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingToolkit currentTool](self, "currentTool"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pencilKitCanvasView"));
  objc_msgSend(v10, "updatePencilKitToolIfAppropriateFor:", v9);

}

- ($654C69F1690BA7F04119B5E31B4E39CB)inputPointFromHoverGesture:(SEL)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CRLFreehandDrawingToolkitDelegate **p_delegate;
  id v10;
  id WeakRetained;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  $654C69F1690BA7F04119B5E31B4E39CB *result;
  id v23;

  v5 = PKInputPointZero[5];
  *(_OWORD *)&retstr->var7 = PKInputPointZero[4];
  *(_OWORD *)&retstr->var9 = v5;
  v6 = PKInputPointZero[7];
  *(_OWORD *)&retstr->var11 = PKInputPointZero[6];
  *(_OWORD *)&retstr->var13 = v6;
  v7 = PKInputPointZero[1];
  retstr->var0 = ($B819F82C29202E081AA078F1B52C391D)PKInputPointZero[0];
  *(_OWORD *)&retstr->var1 = v7;
  v8 = PKInputPointZero[3];
  *(_OWORD *)&retstr->var3 = PKInputPointZero[2];
  *(_OWORD *)&retstr->var5 = v8;
  p_delegate = &self->_delegate;
  v10 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pencilKitCanvasView"));

  objc_msgSend(v10, "locationInView:", v23);
  retstr->var0.var0.x = v13;
  retstr->var0.var0.y = v14;
  objc_msgSend(v10, "zOffset");
  v16 = v15;
  +[PKHoverSettings maxHoverHeight](PKHoverSettings, "maxHoverHeight");
  retstr->var6 = v16 * v17;
  retstr->var7 = CACurrentMediaTime();
  objc_msgSend(v10, "altitudeAngle");
  retstr->var3 = sub_1003C65EC(1.57079633 - v18, 0.0, 1.57079633);
  objc_msgSend(v10, "azimuthAngleInView:", v23);
  v20 = v19;

  sub_100062084(v20 + -3.14159265);
  retstr->var2 = v21;
  retstr->var1 = 1.0;

  return result;
}

- ($654C69F1690BA7F04119B5E31B4E39CB)inputPointInPKCanvasViewFromUnscaledSpace:(SEL)a3
{
  CRLFreehandDrawingToolkitDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  $654C69F1690BA7F04119B5E31B4E39CB *result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForFreehandDrawingTools"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "unscaledCoordinateSpace"));
  v11 = objc_loadWeakRetained((id *)p_delegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pencilKitCanvasViewControllerForFreehandDrawingTools"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pencilKitCanvasView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "coordinateSpace"));
  objc_msgSend(v10, "convertPoint:toCoordinateSpace:", v14, a4->var0.var0.x, a4->var0.var0.y);
  v16 = v15;
  v18 = v17;

  a4->var0.var0.x = v16;
  a4->var0.var0.y = v18;
  v20 = *(_OWORD *)&a4->var9;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&a4->var7;
  *(_OWORD *)&retstr->var9 = v20;
  v21 = *(_OWORD *)&a4->var13;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&a4->var11;
  *(_OWORD *)&retstr->var13 = v21;
  v22 = *(_OWORD *)&a4->var5;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&retstr->var5 = v22;
  v23 = *(_OWORD *)&a4->var1;
  retstr->var0 = a4->var0;
  *(_OWORD *)&retstr->var1 = v23;
  return result;
}

- (void)p_tearDownRunloopObserver
{
  NSObject *animationSerialQueue;
  _QWORD block[5];

  animationSerialQueue = self->_animationSerialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002CD0BC;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_sync(animationSerialQueue, block);
}

- (CRLFreehandDrawingToolkitUIState)toolkitUIState
{
  return self->_toolkitUIState;
}

- (CRLColor)defaultOutlineColor
{
  return self->_defaultOutlineColor;
}

- (BOOL)isRulerToolShowing
{
  return self->_isRulerToolShowing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultOutlineColor, 0);
  objc_storeStrong((id *)&self->_toolkitUIState, 0);
  objc_storeStrong((id *)&self->_animationCompletionHandlers, 0);
  objc_storeStrong((id *)&self->_objectUUIDsToAnimate, 0);
  objc_storeStrong((id *)&self->_animationSerialQueue, 0);
  objc_storeStrong((id *)&self->_cachedCurrentTool, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)supportsPencilHoverPreview
{
  CRLFreehandDrawingToolkit *v2;
  int v3;

  v2 = self;
  v3 = sub_100A2B318();

  return v3 != 8;
}

- (BOOL)isObjectEraser
{
  CRLFreehandDrawingToolkit *v2;
  int v3;

  v2 = self;
  v3 = sub_100A2B318();

  return v3 == 5;
}

@end
