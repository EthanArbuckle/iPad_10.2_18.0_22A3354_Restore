@implementation CRLFreehandDrawingPKSelectionManager

- (CRLFreehandDrawingPKSelectionManager)initWithDelegate:(id)a3
{
  id v4;
  CRLFreehandDrawingPKSelectionManager *v5;
  CRLFreehandDrawingPKSelectionManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSTimer *drawingIndexingTimer;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  PKDrawing *v17;
  PKDrawing *drawing;
  PKDrawing *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CRLFreehandDrawingPKSelectionManager;
  v5 = -[CRLFreehandDrawingPKSelectionManager init](&v36, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_delegate, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasControllerForPKSelectionManager:", v6));

    v9 = objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v6, "p_indexHandwrittenTextsFromDrawing", 0, 1, 25.0));
    drawingIndexingTimer = v6->_drawingIndexingTimer;
    v6->_drawingIndexingTimer = (NSTimer *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pkDrawingProvider"));
    objc_storeWeak((id *)&v6->_drawingProvider, v11);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    if (!WeakRetained)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E2B8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE9FDC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E2D8);
      v13 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager initWithDelegate:]"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 91, 0, "invalid nil value for '%{public}s'", "_drawingProvider");

    }
    v16 = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    objc_msgSend(v16, "addConsolidatedPKDrawingObserver:", v6);

    v17 = (PKDrawing *)objc_alloc_init((Class)PKDrawing);
    drawing = v6->_drawing;
    v6->_drawing = v17;

    v19 = v6->_drawing;
    v20 = objc_loadWeakRetained((id *)&v6->_drawingProvider);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "pkStrokesContainingUnlockedDrawingsForEntireCanvas"));
    v22 = -[PKDrawing undoableAddNewStrokes:](v19, "undoableAddNewStrokes:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v6, "p_editorControllerSelectionPathDidChanged:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "addObserver:selector:name:object:", v6, "p_canvasWillZoom:", CFSTR("CRLCanvasWillZoomNotification"), v8);

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v6, "p_canvasDidZoom:", CFSTR("CRLCanvasDidZoomNotification"), v8);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v6, "p_canvasDidScroll:", CFSTR("CRLCanvasDidScrollNotification"), v8);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager p_windowScene](v6, "p_windowScene"));
    if (v28)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneWillEnterForeground](NSNotification, "CRLiOSSceneWillEnterForeground"));
      objc_msgSend(v29, "addObserver:selector:name:object:", v6, "p_willEnterForeground:", v30, v28);

      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidEnterBackground](NSNotification, "CRLiOSSceneDidEnterBackground"));
      objc_msgSend(v31, "addObserver:selector:name:object:", v6, "p_didEnterBackground:", v32, v28);

      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v33, "addObserver:selector:name:object:", v6, "p_sceneDidActivate:", UISceneDidActivateNotification, v28);

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v34, "addObserver:selector:name:object:", v6, "p_sceneWillDeactivate:", UISceneWillDeactivateNotification, v28);

    }
  }

  return v6;
}

- (void)teardown
{
  void *v2;
  void *v3;
  void *v4;
  PKSmartSelectionController *smartSelectionController;
  PKDrawing *drawing;
  CRLFreehandDrawingsAttachment *drawingsAttachment;
  CRLFreehandDrawingSelectionDecorator *selectionDecorator;
  NSTimer *drawingIndexingTimer;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E338);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA104();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E358);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager teardown]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 160, 0, "attempting to call teardown on an instance of CRLFreehandDrawingPKSelectionManager that has already been torn down.");
  }
  else
  {
    self->_isTornDown = 1;
    smartSelectionController = self->_smartSelectionController;
    self->_smartSelectionController = 0;

    drawing = self->_drawing;
    self->_drawing = 0;

    -[CRLFreehandDrawingsAttachment teardown](self->_drawingsAttachment, "teardown");
    drawingsAttachment = self->_drawingsAttachment;
    self->_drawingsAttachment = 0;

    -[CRLFreehandDrawingSelectionDecorator tearDown](self->_selectionDecorator, "tearDown");
    selectionDecorator = self->_selectionDecorator;
    self->_selectionDecorator = 0;

    objc_storeWeak((id *)&self->_drawingProvider, 0);
    objc_storeWeak((id *)&self->_translationViewController, 0);
    -[NSTimer invalidate](self->_drawingIndexingTimer, "invalidate");
    drawingIndexingTimer = self->_drawingIndexingTimer;
    self->_drawingIndexingTimer = 0;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pkDrawingProvider"));
    if (!v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E2F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEA070();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E318);
      v12 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager teardown]"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 148, 0, "invalid nil value for '%{public}s'", "drawingProvider");

    }
    objc_msgSend(v4, "removeConsolidatedPKDrawingObserver:", self);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
    objc_msgSend(v15, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("CRLCanvasWillZoomNotification"), v3);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "removeObserver:name:object:", self, CFSTR("CRLCanvasDidZoomNotification"), v3);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "removeObserver:name:object:", self, CFSTR("CRLCanvasDidScrollNotification"), v3);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneWillEnterForeground](NSNotification, "CRLiOSSceneWillEnterForeground"));
    objc_msgSend(v20, "removeObserver:name:object:", self, v21, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLiOSSceneDidEnterBackground](NSNotification, "CRLiOSSceneDidEnterBackground"));
    objc_msgSend(v22, "removeObserver:name:object:", self, v23, 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "removeObserver:name:object:", self, UISceneDidActivateNotification, 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v25, "removeObserver:name:object:", self, UISceneWillDeactivateNotification, 0);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_isTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E378);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA184();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E398);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 165, 0, "teardown not called for CRLFreehandDrawingPKSelectionManager.");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingPKSelectionManager;
  -[CRLFreehandDrawingPKSelectionManager dealloc](&v6, "dealloc");
}

- (id)strokeUUIDsToDrawingItems
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeUUIDsToDrawingItems"));

  return v3;
}

- (id)strokeUUIDsToDrawingShapeItems
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeUUIDsToDrawingShapeItems"));

  return v3;
}

- (id)strokeUUIDsToStrokes
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeUUIDsToStrokes"));

  return v3;
}

- (CRLFreehandDrawingSelectionDecorator)selectionDecorator
{
  CRLFreehandDrawingSelectionDecorator *selectionDecorator;
  id WeakRetained;
  void *v5;
  CRLFreehandDrawingSelectionDecorator *v6;
  CRLFreehandDrawingSelectionDecorator *v7;

  selectionDecorator = self->_selectionDecorator;
  if (!selectionDecorator)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v6 = -[CRLFreehandDrawingSelectionDecorator initWithInteractiveCanvasController:]([CRLFreehandDrawingSelectionDecorator alloc], "initWithInteractiveCanvasController:", v5);
    v7 = self->_selectionDecorator;
    self->_selectionDecorator = v6;

    selectionDecorator = self->_selectionDecorator;
  }
  return selectionDecorator;
}

- (BOOL)hasSmartSelectedDrawingShapeItems
{
  return -[NSMutableArray count](self->_smartSelectedDrawingShapeItems, "count") != 0;
}

- (BOOL)shouldSuppressToolPickerVisibilityDidChangeUpdate
{
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  UIViewController **p_translationViewController;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v3 = objc_opt_class(_TtC8Freeform35CRLiOSPencilKitCanvasViewController, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = sub_100221D0C(v3, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  p_translationViewController = &self->_translationViewController;
  v8 = objc_loadWeakRetained((id *)&self->_translationViewController);
  if (v8)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "presentedViewController"));
    v10 = objc_loadWeakRetained((id *)p_translationViewController);
    v11 = v9 == v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updatePKStrokesFromAllFreehandDrawingItemsOnCanvas
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[CRLFreehandDrawingPKSelectionManager p_setDrawingsAttachmentToSmartSelectionController](self, "p_setDrawingsAttachmentToSmartSelectionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKSmartSelectionController recognitionController](self->_smartSelectionController, "recognitionController"));
  objc_msgSend(v3, "tagAsActive");

  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10122E3B8);
  v4 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting recognition controller as active.", v5, 2u);
  }
}

- (id)freehandDrawingItemsFromCacheForPKQueryItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id obj;
  id v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];

  v4 = a3;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v27;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "strokes"));
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1)
                                                                                 + 8 * (_QWORD)v12), "_strokeUUID"));
              v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager strokeUUIDsToDrawingItems](self, "strokeUUIDsToDrawingItems"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));
              objc_msgSend(v7, "crl_addNonNilObject:", v15);

              v12 = (char *)v12 + 1;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

        if (objc_msgSend(v7, "count"))
        {
          v16 = objc_msgSend(v7, "copy");
          objc_msgSend(v19, "addObject:", v16);

        }
        v5 = (char *)v5 + 1;
      }
      while (v5 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v21);
  }

  return v19;
}

- (id)makeFreehandDrawingItemsSearchTargetForCurrentlyCachedDrawing
{
  CRLPKDrawingProvider **p_drawingProvider;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  CRLiOSFreehandDrawingItemsSearchTarget *v13;

  p_drawingProvider = &self->_drawingProvider;
  WeakRetained = objc_loadWeakRetained((id *)&self->_drawingProvider);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "strokeUUIDsToDrawingItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "interactiveCanvasControllerForPKSelectionManager:", self));

    v9 = objc_alloc_init((Class)PKDrawing);
    v10 = objc_loadWeakRetained((id *)p_drawingProvider);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pkStrokesContainingUnlockedDrawingsForEntireCanvas"));
    v12 = objc_msgSend(v9, "undoableAddNewStrokes:", v11);

    v13 = -[CRLiOSFreehandDrawingItemsSearchTarget initWithDrawing:interactiveCanvasController:]([CRLiOSFreehandDrawingItemsSearchTarget alloc], "initWithDrawing:interactiveCanvasController:", v9, v8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)handleSingleTapInputAtUnscaledPoint:(CGPoint)a3
{
  -[PKSmartSelectionController handleTapInputAtPoint:](self->_smartSelectionController, "handleTapInputAtPoint:", a3.x, a3.y);
}

- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3
{
  -[PKSmartSelectionController handleDoubleTapInputAtPoint:](self->_smartSelectionController, "handleDoubleTapInputAtPoint:", a3.x, a3.y);
}

- (void)handleDoubleTapInputAtUnscaledPoint:(CGPoint)a3 inSelectionView:(id)a4
{
  -[PKSmartSelectionController handleDoubleTapInputAtPoint:inSelectionView:](self->_smartSelectionController, "handleDoubleTapInputAtPoint:inSelectionView:", a4, a3.x, a3.y);
}

- (void)clearSmartSelectionIfNecessary
{
  -[PKSmartSelectionController clearSelectionIfNecessaryWithCompletion:](self->_smartSelectionController, "clearSelectionIfNecessaryWithCompletion:", &stru_10122E3D8);
}

- (BOOL)doesCurrentSmartSelectedDrawingShapeItemsContainDrawingShapeItem:(id)a3
{
  return -[NSMutableArray containsObject:](self->_smartSelectedDrawingShapeItems, "containsObject:", a3);
}

- (void)removeSelectedShapeItemFromSmartSelectionBookkeeping:(id)a3
{
  -[NSMutableArray removeObject:](self->_smartSelectedDrawingShapeItems, "removeObject:", a3);
}

- (void)setCurrentSelectedDrawingItemsAsSmartSelected
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10);
        v12 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager strokeUUIDsToDrawingShapeItems](self, "strokeUUIDsToDrawingShapeItems"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allValues"));
          v17 = objc_msgSend(v16, "containsObject:", v14);

          if (v17)
            -[NSMutableArray addObject:](self->_smartSelectedDrawingShapeItems, "addObject:", v14);
        }

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (void)installSmartSelectionViewForCurrentSelection
{
  -[PKSmartSelectionController installSelectionViewForCurrentSelection](self->_smartSelectionController, "installSelectionViewForCurrentSelection");
  self->_selectionViewIsDisplaying = 1;
}

- (void)straighten:(id)a3
{
  CRLFreehandDrawingPKSelectionManagerDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v11;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *strokeStraighteningIgnoreInteractionWrapper;
  void *v13;
  PKSmartSelectionController *smartSelectionController;
  _QWORD v15[6];

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crl_windowWrapper"));
  v11 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)objc_msgSend(v10, "newWrapperBeginningIgnoringUserInteractionSafely");
  strokeStraighteningIgnoreInteractionWrapper = self->_strokeStraighteningIgnoreInteractionWrapper;
  self->_strokeStraighteningIgnoreInteractionWrapper = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editingCoordinator"));
  objc_msgSend(v13, "suspendCollaborationWithReason:", CFSTR("CRLFreehandDrawingAsyncStraightenStrokes"));

  smartSelectionController = self->_smartSelectionController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100033D3C;
  v15[3] = &unk_10122E400;
  v15[4] = self;
  v15[5] = v7;
  -[PKSmartSelectionController straighten:completion:](smartSelectionController, "straighten:completion:", v5, v15);

}

- (void)copyAsText:(id)a3
{
  -[PKSmartSelectionController copyAsText:](self->_smartSelectionController, "copyAsText:", self);
}

- (void)translate:(id)a3
{
  -[PKSmartSelectionController translate:](self->_smartSelectionController, "translate:", self);
}

- (BOOL)canTranslate
{
  return -[PKSmartSelectionController canTranslate](self->_smartSelectionController, "canTranslate");
}

- (void)dynamicOperationDidBeginWithRealTimeCommands:(BOOL)a3
{
  if (a3)
    self->_isInDynamicOperationWithRealTimeCommands = 1;
  -[CRLFreehandDrawingPKSelectionManager p_removeCurrentSelectionView](self, "p_removeCurrentSelectionView");
}

- (void)dynamicOperationDidEnd
{
  if (self->_isInDynamicOperationWithRealTimeCommands)
  {
    self->_isInDynamicOperationWithRealTimeCommands = 0;
    -[PKSmartSelectionController installSelectionViewForCurrentSelection](self->_smartSelectionController, "installSelectionViewForCurrentSelection");
  }
}

- (void)replacingCurrentlySmartSelectedItems:(id)a3 withNewItemsToSmartSelect:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v6 = a4;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "allObjects"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v35;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v12);
      v14 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v9);
      v15 = sub_100221D0C(v14, v13);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!v16)
        break;
      v17 = (void *)v16;
      v18 = -[NSMutableArray containsObject:](self->_smartSelectedDrawingShapeItems, "containsObject:", v16);

      if (!v18)
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v19 = v6;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v20)
    {
      v22 = v20;
      v23 = *(_QWORD *)v31;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v19);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v24);
          v26 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v21);
          v27 = sub_100221D0C(v26, v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
          if (v28)
            objc_msgSend(v7, "addObject:", v28, (_QWORD)v30);

          v24 = (char *)v24 + 1;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v22);
    }

    v29 = objc_msgSend(v7, "count");
    if (v29 == objc_msgSend(v19, "count"))
    {
      objc_storeStrong((id *)&self->_smartSelectedDrawingShapeItems, v7);
      self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
    }
  }

}

- (void)beginSuppressingSmartSelection
{
  void *v2;
  void *v3;
  void *v4;

  if (self->_isSmartSelectionSuppressed)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E420);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA204();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E440);
    v2 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager beginSuppressingSmartSelection]"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 404, 0, "Should not begin suppressing smart selection when it is already suppressed.");

  }
  else
  {
    self->_isSmartSelectionSuppressed = 1;
    -[CRLFreehandDrawingPKSelectionManager p_removeCurrentSelectionView](self, "p_removeCurrentSelectionView");
  }
}

- (void)endSuppressingSmartSelection
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (self->_isSmartSelectionSuppressed)
  {
    self->_isSmartSelectionSuppressed = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosForCurrentSelectionPath"));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v7);
          v13 = sub_100221D0C(v12, v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          if (!v14
            || (-[NSMutableArray containsObject:](self->_smartSelectedDrawingShapeItems, "containsObject:", v14, (_QWORD)v16) & 1) == 0)
          {

            goto LABEL_23;
          }

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v8)
          continue;
        break;
      }
    }

    if (-[NSArray count](self->_selectedStrokes, "count"))
      -[CRLFreehandDrawingPKSelectionManager installSmartSelectionViewForCurrentSelection](self, "installSmartSelectionViewForCurrentSelection");
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E460);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA284();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E480);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager endSuppressingSmartSelection]"));
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 416, 0, "Should not end suppressing smart selection when it is not suppressed.");
  }
LABEL_23:

}

- (void)p_setDrawingsAttachmentToSmartSelectionController
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKSmartSelectionController *v10;
  PKSmartSelectionController *smartSelectionController;
  id v12;
  void *v13;
  CRLFreehandDrawingsAttachment *drawingsAttachment;
  CRLFreehandDrawingsAttachment *v15;
  CRLFreehandDrawingsAttachment *v16;
  void *v17;
  PKSmartSelectionController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (!self->_smartSelectionController)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "pencilKitCanvasViewForPKSelectionManager:", self));

    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasControllerForPKSelectionManager:", self));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "asiOSCVC"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "doubleTapGestureRecognizer"));
    v10 = (PKSmartSelectionController *)objc_msgSend(objc_alloc((Class)PKSmartSelectionController), "initWithDelegate:canvasView:drawing:gestureRecognizer:", self, v4, self->_drawing, v9);
    smartSelectionController = self->_smartSelectionController;
    self->_smartSelectionController = v10;

  }
  v12 = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactiveCanvasControllerForPKSelectionManager:", self));

  -[CRLFreehandDrawingsAttachment teardown](self->_drawingsAttachment, "teardown");
  drawingsAttachment = self->_drawingsAttachment;
  self->_drawingsAttachment = 0;

  if (self->_drawing)
  {
    v15 = -[CRLFreehandDrawingsAttachment initWithDelegate:drawing:]([CRLFreehandDrawingsAttachment alloc], "initWithDelegate:drawing:", self, self->_drawing);
    v16 = self->_drawingsAttachment;
    self->_drawingsAttachment = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingsAttachment drawing](self->_drawingsAttachment, "drawing"));
    if (v17)
    {
      -[PKSmartSelectionController setExternalAttachment:](self->_smartSelectionController, "setExternalAttachment:", self->_drawingsAttachment);
      v18 = self->_smartSelectionController;
      objc_msgSend(v13, "visibleUnscaledRect");
      -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](v18, "invalidateCacheForBounds:inDrawing:", self->_drawing);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v19, "postNotificationName:object:", CFSTR("CRLActiveBoardDidOpenToCacheAllDrawingIndexedContents"), self);

      -[CRLFreehandDrawingPKSelectionManager p_indexHandwrittenTextsFromDrawing](self, "p_indexHandwrittenTextsFromDrawing");
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E4A0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DEA304();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122E4C0);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager p_setDrawingsAttachmentToSmartSelectionController]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 461, 0, "Drawing attachment has no drawing.");

    }
  }

}

- (void)p_recursivelyAddFreehandDrawingItemsFromGroup:(id)a3 drawingItems:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a4;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childItems", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v9);
        v15 = sub_100221D0C(v14, v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v18 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v17);
        v19 = sub_100221D0C(v18, v13);
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v21 = (void *)v20;
        if (v16)
        {
          objc_msgSend(v6, "addObject:", v16);
        }
        else if (v20)
        {
          -[CRLFreehandDrawingPKSelectionManager p_recursivelyAddFreehandDrawingItemsFromGroup:drawingItems:](self, "p_recursivelyAddFreehandDrawingItemsFromGroup:drawingItems:", v20, v6);
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

- (void)p_editorControllerSelectionPathDidChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  CRLFreehandDrawingPKSelectionManager *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  if (self->_ignoreNextPKSmartSelectionDidUpdateCall)
  {
    self->_ignoreNextPKSmartSelectionDidUpdateCall = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", a3));
    v31 = self;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
    v7 = objc_msgSend(v6, "isInDrawingMode");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));

    v30 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infosForSelectionPath:", v9));

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v13)
    {
      v15 = v13;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          if (v7)
          {
            v19 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v14);
            v20 = sub_100221D0C(v19, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            objc_msgSend(v4, "crl_addNonNilObject:", v21);
          }
          else
          {
            v22 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14);
            v23 = sub_100221D0C(v22, v18);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v23);
            v25 = objc_opt_class(NSArray, v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "childItems"));
            v27 = sub_100221D0C(v25, v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

            objc_msgSend(v4, "crl_addObjectsFromNonNilArray:", v28);
          }

        }
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v15);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
    -[CRLFreehandDrawingPKSelectionManager p_selectStrokesInDrawingShapeItems:](v31, "p_selectStrokesInDrawingShapeItems:", v29);

  }
}

- (void)p_canvasWillZoom:(id)a3
{
  uint64_t v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v4 = objc_opt_class(_TtC8Freeform35CRLiOSPencilKitCanvasViewController, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = sub_100221D0C(v4, WeakRetained);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionView"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionView"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000351A8;
    v10[3] = &unk_10122D110;
    v10[4] = v7;
    +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v9, 0, v10, 0, 0.25);

  }
}

- (void)p_canvasDidZoom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;
  void *v10;
  PKSmartSelectionController *smartSelectionController;
  id v12;

  -[CRLFreehandDrawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged](self->_drawingsAttachment, "updateVisibleUnscaledBoundsAfterDrawingChanged", a3);
  v5 = objc_opt_class(_TtC8Freeform35CRLiOSPencilKitCanvasViewController, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = sub_100221D0C(v5, WeakRetained);
  v12 = (id)objc_claimAutoreleasedReturnValue(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "smartSelectionView"));
  if (v8)
  {
    objc_msgSend(v12, "removeSmartSelectionViewIfNecessary");
    -[PKSmartSelectionController installSelectionViewForCurrentSelection](self->_smartSelectionController, "installSelectionViewForCurrentSelection");
  }
  v9 = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasControllerForPKSelectionManager:", self));

  smartSelectionController = self->_smartSelectionController;
  objc_msgSend(v10, "visibleUnscaledRect");
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);

}

- (void)p_canvasDidScroll:(id)a3
{
  id WeakRetained;
  PKSmartSelectionController *smartSelectionController;
  id v6;

  -[CRLFreehandDrawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged](self->_drawingsAttachment, "updateVisibleUnscaledBoundsAfterDrawingChanged", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  smartSelectionController = self->_smartSelectionController;
  objc_msgSend(v6, "visibleUnscaledRect");
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);

}

- (void)p_selectStrokesInDrawingShapeItems:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CRLFreehandDrawingPKSelectionManager p_removeCurrentSelectionView](self, "p_removeCurrentSelectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager p_cachedStrokesForDrawingShapeItems:](self, "p_cachedStrokesForDrawingShapeItems:", v5));
  if (objc_msgSend(v4, "count") || objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v4, "count"))
      -[PKSmartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:](self->_smartSelectionController, "selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:", v4, self->_drawing);
  }
  else
  {
    -[PKSmartSelectionController clearSelectionIfNecessaryWithCompletion:](self->_smartSelectionController, "clearSelectionIfNecessaryWithCompletion:", &stru_10122E4E0);
  }
  objc_storeStrong((id *)&self->_selectedStrokes, v4);
  if (self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated)
    self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 0;
  else
    -[NSMutableArray removeAllObjects](self->_smartSelectedDrawingShapeItems, "removeAllObjects");

}

- (id)p_cachedStrokesForDrawingShapeItems:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pkDrawingProvider"));
  if (v7)
  {
    v21 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "drawingShapeItemUUIDToStrokeUUIDBidirectionalMap"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "id"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));

          if (v17)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager strokeUUIDsToStrokes](self, "strokeUUIDsToStrokes"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v17));

            objc_msgSend(v8, "crl_addNonNilObject:", v19);
          }

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    v6 = v21;
    v4 = v22;
  }
  else
  {
    v8 = &__NSArray0__struct;
  }

  return v8;
}

- (id)p_cachedDrawingShapeItemsForStrokes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager strokeUUIDsToDrawingShapeItems](self, "strokeUUIDsToDrawingShapeItems", (_QWORD)v17));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_strokeUUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v13));

        if (v14)
          objc_msgSend(v5, "addObject:", v14);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allObjects"));
  return v15;
}

- (void)p_removeCurrentSelectionView
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "installSmartSelectionView:forPKSelectionManager:", 0, self);

  self->_selectionViewIsDisplaying = 0;
}

- (void)p_indexHandwrittenTextsFromDrawing
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD v11[6];
  id v12;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainBoard"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boardIdentifierStringRepresentation"));
  v8 = -[PKDrawing copy](self->_drawing, "copy");
  objc_initWeak(&location, self);
  global_queue = dispatch_get_global_queue(21, 0);
  v10 = objc_claimAutoreleasedReturnValue(global_queue);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100035890;
  v11[3] = &unk_10122E530;
  objc_copyWeak(&v12, &location);
  v11[4] = v8;
  v11[5] = v7;
  dispatch_async(v10, v11);
  objc_destroyWeak(&v12);

  objc_destroyWeak(&location);
}

- (void)p_willEnterForeground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10122E550);
  v5 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting recognition controller as active.", v7, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKSmartSelectionController recognitionController](self->_smartSelectionController, "recognitionController"));
  objc_msgSend(v6, "tagAsActive");

}

- (void)p_didEnterBackground:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (qword_10147E368 != -1)
    dispatch_once(&qword_10147E368, &stru_10122E570);
  v5 = off_1013D9068;
  if (os_log_type_enabled((os_log_t)off_1013D9068, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting recognition controller as idle.", v7, 2u);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKSmartSelectionController recognitionController](self->_smartSelectionController, "recognitionController"));
  objc_msgSend(v6, "tagAsIdle");

}

- (void)p_sceneDidActivate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (-[NSMutableArray count](self->_smartSelectedDrawingShapeItems, "count", a3))
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager p_cachedStrokesForDrawingShapeItems:](self, "p_cachedStrokesForDrawingShapeItems:", self->_smartSelectedDrawingShapeItems));
    -[PKSmartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:](self->_smartSelectionController, "selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:", v10, self->_drawing);
    -[CRLFreehandDrawingPKSelectionManager installSmartSelectionViewForCurrentSelection](self, "installSmartSelectionViewForCurrentSelection");
    self->_ignoreNextPKSmartSelectionDidUpdateCall = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDocumentMode"));

    objc_msgSend(v9, "pencilKitDidSmartSelectStrokesInDrawingShapeItems:", self->_smartSelectedDrawingShapeItems);
  }
}

- (void)p_sceneWillDeactivate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[NSMutableArray count](self->_smartSelectedDrawingShapeItems, "count", a3))
  {
    self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentDocumentMode"));

    objc_msgSend(v8, "pencilKitDidSmartSelectStrokesInDrawingShapeItems:", &__NSArray0__struct);
  }
}

- (id)p_windowScene
{
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = objc_opt_class(_TtC8Freeform35CRLiOSPencilKitCanvasViewController, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = sub_100221D0C(v3, WeakRetained);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "window"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "windowScene"));

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E590);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA384();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E5B0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager p_windowScene]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 669, 0, "invalid nil value for '%{public}s'", "windowScene");

  }
  return v9;
}

- (void)pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PKDrawing *drawing;
  void *v9;
  id v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  NSArray *v29;
  NSArray *selectedStrokes;
  PKSmartSelectionController *smartSelectionController;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E5D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEA418();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122E5F0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingPKSelectionManager pkStrokesContainingUnlockedDrawingsForEntireCanvasDidChange:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingPKSelectionManager.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 677, 0, "This operation must only be performed on the main thread.");

  }
  drawing = self->_drawing;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[PKDrawing _setAllStrokes:](drawing, "_setAllStrokes:", v9);

  -[PKDrawing invalidateVisibleStrokes](self->_drawing, "invalidateVisibleStrokes");
  v37 = v4;
  v10 = -[PKDrawing undoableAddNewStrokes:](self->_drawing, "undoableAddNewStrokes:", v4);
  -[CRLFreehandDrawingsAttachment updateVisibleUnscaledBoundsAfterDrawingChanged](self->_drawingsAttachment, "updateVisibleUnscaledBoundsAfterDrawingChanged");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editorController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionPath"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionModelTranslator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "infosForSelectionPath:", v15));

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
        v25 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v20);
        v26 = sub_100221D0C(v25, v24);
        v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
        if (v27)
          objc_msgSend(v13, "addObject:", v27);

      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v21);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
  v29 = (NSArray *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager p_cachedStrokesForDrawingShapeItems:](self, "p_cachedStrokesForDrawingShapeItems:", v28));
  selectedStrokes = self->_selectedStrokes;
  self->_selectedStrokes = v29;

  smartSelectionController = self->_smartSelectionController;
  objc_msgSend(v12, "visibleUnscaledRect");
  -[PKSmartSelectionController invalidateCacheForBounds:inDrawing:](smartSelectionController, "invalidateCacheForBounds:inDrawing:", self->_drawing);
  -[PKSmartSelectionController selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:](self->_smartSelectionController, "selectStrokesWithoutDidSelectStrokesUpdate:inDrawing:", self->_selectedStrokes, self->_drawing);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v34; j = (char *)j + 1)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v32);
        if (!-[NSMutableArray containsObject:](self->_smartSelectedDrawingShapeItems, "containsObject:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)j)))
        {

          goto LABEL_32;
        }
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v34)
        continue;
      break;
    }
  }

  if (!self->_isSmartSelectionSuppressed && !self->_isInDynamicOperationWithRealTimeCommands)
    -[PKSmartSelectionController installSelectionViewForCurrentSelection](self->_smartSelectionController, "installSelectionViewForCurrentSelection");
LABEL_32:

}

- (void)installSelectionView:(id)a3 fromView:(id)a4
{
  id v5;
  id WeakRetained;
  id v7;

  v5 = a3;
  if (!self->_ignoreNextPKSmartSelectionDidUpdateCall || self->_selectionViewIsDisplaying)
  {
    v7 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "installSmartSelectionView:forPKSelectionManager:", v7, self);

    v5 = v7;
    self->_selectionViewIsDisplaying = 1;
  }

}

- (void)installTranslationViewController:(id)a3
{
  UIViewController **p_translationViewController;
  id v5;
  CRLFreehandDrawingPKSelectionManagerDelegate **p_delegate;
  id WeakRetained;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  if (a3)
  {
    p_translationViewController = &self->_translationViewController;
    v5 = a3;
    objc_storeWeak((id *)p_translationViewController, v5);
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v40 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "layerHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));

    v11 = objc_opt_class(_TtC8Freeform35CRLiOSPencilKitCanvasViewController, v10);
    v12 = objc_loadWeakRetained((id *)p_delegate);
    v13 = sub_100221D0C(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "editorController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPath"));

    objc_msgSend(v9, "targetRectForEditMenu:", v16);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "coordinateSpace"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "canvasView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "coordinateSpace"));
    objc_msgSend(v26, "convertRect:fromCoordinateSpace:", v28, v18, v20, v22, v24);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;

    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popoverPresentationController"));
    objc_msgSend(v37, "setSourceRect:", v30, v32, v34, v36);

    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "popoverPresentationController"));
    objc_msgSend(v39, "setSourceView:", v38);

    objc_msgSend(v14, "presentViewController:animated:completion:", v5, 1, 0);
  }
}

- (id)interactiveCanvasController
{
  id WeakRetained;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  return v4;
}

- (id)smartSelectionControllerForAttachment:(id)a3
{
  return self->_smartSelectionController;
}

- (void)pencilKitDidSmartSelectPreviouslySelectedStrokes:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *smartSelectedDrawingShapeItems;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        if (!-[NSArray containsObject:](self->_selectedStrokes, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v8), (_QWORD)v18))
        {
          v13 = v4;
          goto LABEL_11;
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager p_cachedDrawingShapeItemsForStrokes:](self, "p_cachedDrawingShapeItemsForStrokes:", v4));
  v10 = (NSMutableArray *)objc_msgSend(v9, "mutableCopy");
  smartSelectedDrawingShapeItems = self->_smartSelectedDrawingShapeItems;
  self->_smartSelectedDrawingShapeItems = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layerHost"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "asiOSCVC"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "delegate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentDocumentMode"));

  self->_keepSmartSelectedDrawingShapeItemAfterSelectionPathUpdated = 1;
  objc_msgSend(v17, "pencilKitDidSmartSelectStrokesInDrawingShapeItems:", self->_smartSelectedDrawingShapeItems);
  objc_msgSend(v13, "invalidateAllLayers");
  -[PKSmartSelectionController installSelectionViewForCurrentSelection](self->_smartSelectionController, "installSelectionViewForCurrentSelection");

LABEL_11:
}

- (void)didSelectStrokes:(id)a3 selectionType:(int64_t)a4 inAttachment:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *smartSelectedDrawingShapeItems;
  NSArray *v20;
  NSArray *selectedStrokes;
  id WeakRetained;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a3;
  if (self->_ignoreNextPKSmartSelectionDidUpdateCall)
  {
    self->_ignoreNextPKSmartSelectionDidUpdateCall = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingPKSelectionManager strokeUUIDsToDrawingShapeItems](self, "strokeUUIDsToDrawingShapeItems", (_QWORD)v28));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_strokeUUID"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v15));

          if (v16)
            objc_msgSend(v7, "addObject:", v16);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v10);
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
    v18 = (NSMutableArray *)objc_msgSend(v17, "mutableCopy");
    smartSelectedDrawingShapeItems = self->_smartSelectedDrawingShapeItems;
    self->_smartSelectedDrawingShapeItems = v18;

    v20 = (NSArray *)objc_msgSend(v8, "copy");
    selectedStrokes = self->_selectedStrokes;
    self->_selectedStrokes = v20;

    self->_ignoreNextPKSmartSelectionDidUpdateCall = 1;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasControllerForPKSelectionManager:", self));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerHost"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "asiOSCVC"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "delegate"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "currentDocumentMode"));

    objc_msgSend(v27, "pencilKitDidSmartSelectStrokesInDrawingShapeItems:", self->_smartSelectedDrawingShapeItems);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingIndexingTimer, 0);
  objc_destroyWeak((id *)&self->_translationViewController);
  objc_storeStrong((id *)&self->_strokeStraighteningIgnoreInteractionWrapper, 0);
  objc_storeStrong((id *)&self->_selectedStrokes, 0);
  objc_storeStrong((id *)&self->_smartSelectedDrawingShapeItems, 0);
  objc_storeStrong((id *)&self->_selectionDecorator, 0);
  objc_storeStrong((id *)&self->_drawingsAttachment, 0);
  objc_storeStrong((id *)&self->_smartSelectionController, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_destroyWeak((id *)&self->_drawingProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
