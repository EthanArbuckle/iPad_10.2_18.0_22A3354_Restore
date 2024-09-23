@implementation CRLRotorSearchController

- (CRLRotorSearchController)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  CRLRotorSearchController *v15;
  objc_super v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v12 = sub_100221DDC(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLFindReplaceDelegate);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
  v17.receiver = self;
  v17.super_class = (Class)CRLRotorSearchController;
  v15 = -[CRLModelSearchController initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:](&v17, "initWithEditingCoordinator:delegate:modelSearchesRunSynchronously:", v14, v13, 1);

  if (v15)
  {
    -[CRLRotorSearchController setInteractiveCanvasController:](v15, "setInteractiveCanvasController:", v4);
    -[CRLModelSearchController invalidateSearchResults](v15, "invalidateSearchResults");
  }

  return v15;
}

+ (void)recursiveSearchWithSearchTarget:(id)a3 inFlowMode:(BOOL)a4 withHitBlock:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if ((objc_opt_respondsToSelector(a1, "searchTargetSearchSelectors") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "searchTargetSearchSelectors"));
    if (v10)
    {
      v11 = v10;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v28;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v28 != v14)
              objc_enumerationMutation(v11);
            v16 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v15), "pointerValue");
            if (v16)
            {
              v17 = v16;
              if ((objc_opt_respondsToSelector(v8, v16) & 1) != 0)
                ((void (*)(id, id, id))objc_msgSend(v8, "methodForSelector:", v17))(v8, v17, v9);
            }
            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v13);
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "childTargetsForSearchTarget:", v8));
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v24;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(a1, "recursiveSearchWithSearchTarget:inFlowMode:withHitBlock:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v22), v6, v9);
            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        }
        while (v20);
      }

    }
  }

}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveCanvasController, a3);
  -[CRLRotorSearchController _addObservers](self, "_addObservers");
}

+ (id)childTargetsForSearchTarget:(id)a3
{
  return objc_msgSend(a3, "childSearchTargets");
}

+ (id)searchTargetSearchSelectors
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012604B0);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(a1, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "+[CRLRotorSearchController searchTargetSearchSelectors]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLRotorSearchController.m";
    v31 = 1024;
    v32 = 63;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012604D0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLRotorSearchController searchTargetSearchSelectors]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Canvas/Accessibility/iOS/CRLRotorSearchController.m"));
  objc_opt_class(a1, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 63, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(a1, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "+[CRLRotorSearchController searchTargetSearchSelectors]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (BOOL)shouldChangeSelectionPath
{
  return 1;
}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  objc_opt_class(self, v8);
  v10 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10046D2D8;
  v12[3] = &unk_1012528D0;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v10, "recursiveSearchWithSearchTarget:inFlowMode:withHitBlock:", v7, 0, v12);

}

- (void)locateSearchReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLRotorSearchController interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10046D394;
  v8[3] = &unk_101238288;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v6, v8);

}

- (id)searchReferenceAfterReference:(id)a3 inRotorDirection:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "searchReferencePoint");
    if (v9 == CGPointZero.x && v8 == CGPointZero.y)
      -[CRLRotorSearchController locateSearchReference:](self, "locateSearchReference:", v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController searchReferenceAfterReference:inDirection:](self, "searchReferenceAfterReference:inDirection:", v7, a4 == 0));

  return v11;
}

- (void)_addObservers
{
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "changeNotifier"));
  v6 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "board"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootContainer"));
  objc_msgSend(v5, "addObserver:forChangeSource:", self, v8);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerHistoryStateDidChange](NSNotification, "CRLCommandControllerHistoryStateDidChange"));
  v10 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_commandHistoryChanged:", v9, v11);

}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
