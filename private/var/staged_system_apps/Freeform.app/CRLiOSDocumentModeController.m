@implementation CRLiOSDocumentModeController

- (CRLiOSDocumentModeController)initWithDelegate:(id)a3
{
  id v4;
  CRLiOSDocumentModeController *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CRLiOSDocumentMode *mode;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSHashTable *observers;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRLiOSDocumentModeController;
  v5 = -[CRLiOSDocumentModeController init](&v17, "init");
  if (v5)
  {
    if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125BA80);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3084C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125BAA0);
      v6 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController initWithDelegate:]"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 35, 0, "This operation must only be performed on the main thread.");

    }
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "defaultDocumentMode"));
    mode = v5->_mode;
    v5->_mode = (CRLiOSDocumentMode *)v9;

    if (!v5->_mode)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125BAC0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E307A0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125BAE0);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController initWithDelegate:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 37, 0, "invalid nil value for '%{public}s'", "_mode");

    }
    v14 = objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 5));
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v14;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)p_editorControllerSelectionPathDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  objc_class *v7;
  objc_class *v8;
  void *v9;
  id v10;
  id v11;
  unsigned __int8 v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(CRLEditorController, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object", v6));

  v10 = sub_1002223BC(v8, v9);
  v18 = (id)objc_claimAutoreleasedReturnValue(v10);

  if (!self->_currentlyChangingMode)
  {
    if (!-[CRLiOSDocumentMode isValidForEditorController:](self->_mode, "isValidForEditorController:", v18)
      || (v11 = objc_loadWeakRetained((id *)&self->_delegate),
          v12 = objc_msgSend(v11, "isValidMode:forEditorController:", self->_mode, v18),
          v11,
          (v12 & 1) == 0))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "modeForEditorController:", v18));
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        v17 = objc_loadWeakRetained((id *)&self->_delegate);
        v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "defaultDocumentMode"));

      }
      -[CRLiOSDocumentModeController p_setMode:animated:forced:](self, "p_setMode:animated:forced:", v16, 1, 1);

    }
  }

}

- (void)addModeObserver:(id)a3
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
      dispatch_once(&qword_10147E370, &stru_10125BB00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3094C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BB20);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController addModeObserver:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 54, 0, "This operation must only be performed on the main thread.");

  }
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BB40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E308CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BB60);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController addModeObserver:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 55, 0, "Trying to add a document mode observer that's already added");

  }
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)removeModeObserver:(id)a3
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
      dispatch_once(&qword_10147E370, &stru_10125BB80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30A4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BBA0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController removeModeObserver:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 61, 0, "This operation must only be performed on the main thread.");

  }
  if (!-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BBC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E309CC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BBE0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController removeModeObserver:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 62, 0, "Trying to remove a document mode observer that has not been added");

  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

}

- (void)setMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BC00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30ACC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BC20);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController setMode:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 68, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLiOSDocumentModeController setMode:animated:](self, "setMode:animated:", v4, 1);

}

- (void)setMode:(id)a3 animated:(BOOL)a4
{
  -[CRLiOSDocumentModeController p_setMode:animated:forced:](self, "p_setMode:animated:forced:", a3, a4, 0);
}

- (void)p_setMode:(id)a3 animated:(BOOL)a4 forced:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *observedEditorControllers;
  NSArray *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  uint64_t v26;
  void *v27;
  CRLiOSDocumentMode *mode;
  CRLiOSDocumentMode *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  CKRecordID v41;
  Swift::String v42;
  _BOOL4 v43;
  _BOOL4 v44;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];

  v5 = a5;
  v6 = a4;
  v46 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BC40);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30BCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BC60);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController p_setMode:animated:forced:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 77, 0, "This operation must only be performed on the main thread.");

  }
  if (self->_currentlyChangingMode)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BC80);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30B4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BCA0);
    v31 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v31);
    sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Should not change mode while we are already changing the mode.", v32, v33, v34, v35, v36, v37, v38, (uint64_t)"-[CRLiOSDocumentModeController p_setMode:animated:forced:]");
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController p_setMode:animated:forced:]"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v40, 81, 1, "Should not change mode while we are already changing the mode.");

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v41, v42);
    abort();
  }
  v43 = v5;
  v44 = v6;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v11 = self->_observedEditorControllers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v17, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v16);

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "editorControllersToObserve"));
  v19 = (NSArray *)objc_msgSend(v18, "copy");
  observedEditorControllers = self->_observedEditorControllers;
  self->_observedEditorControllers = v19;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v21 = self->_observedEditorControllers;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v48;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v27, "addObserver:selector:name:object:", self, "p_editorControllerSelectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v26);

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v23);
  }

  mode = self->_mode;
  v29 = mode;
  v30 = v46;
  if ((objc_msgSend(v30, "isEqual:", v29) & 1) == 0)
  {
    self->_currentlyChangingMode = 1;
    -[CRLiOSDocumentMode modeWillEndForMode:forced:](v29, "modeWillEndForMode:forced:", v30, v43);
    objc_msgSend(v30, "modeWillBeginFromMode:forced:", v29, v43);
    -[CRLiOSDocumentModeController p_notifyAllObserversOfModeChangeTo:from:animated:didChange:](self, "p_notifyAllObserversOfModeChangeTo:from:animated:didChange:", v30, v29, v44, 0);
    objc_storeStrong((id *)&self->_mode, a3);
    objc_storeStrong((id *)&self->_previousMode, mode);
    -[CRLiOSDocumentMode modeDidEndForMode:forced:](v29, "modeDidEndForMode:forced:", v30, v43);
    objc_msgSend(v30, "modeDidBeginFromMode:forced:", v29, v43);
    -[CRLiOSDocumentModeController p_notifyAllObserversOfModeChangeTo:from:animated:didChange:](self, "p_notifyAllObserversOfModeChangeTo:from:animated:didChange:", v30, v29, v44, 1);
    self->_currentlyChangingMode = 0;
  }

}

- (BOOL)setToPreviousModeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  CRLiOSDocumentMode *previousMode;

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BCC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30C4C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BCE0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController setToPreviousModeAnimated:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 120, 0, "This operation must only be performed on the main thread.");

  }
  previousMode = self->_previousMode;
  if (previousMode)
    -[CRLiOSDocumentModeController setMode:animated:](self, "setMode:animated:", self->_previousMode, v3);
  return previousMode != 0;
}

- (void)resetToDefaultModeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;

  v3 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BD00);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E30CCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125BD20);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeController resetToDefaultModeAnimated:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 132, 0, "This operation must only be performed on the main thread.");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "defaultDocumentMode"));
  -[CRLiOSDocumentModeController setMode:animated:](self, "setMode:animated:", v9, v3);

}

- (void)willTeardownEditorController:(id)a3
{
  id v4;
  void *v5;
  NSArray *observedEditorControllers;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  v4 = a3;
  if (-[NSArray containsObject:](self->_observedEditorControllers, "containsObject:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v4);

    observedEditorControllers = self->_observedEditorControllers;
    v10 = v4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue(-[NSArray crl_arrayByRemovingObjectsIdenticalToObjectsInArray:](observedEditorControllers, "crl_arrayByRemovingObjectsIdenticalToObjectsInArray:", v7));
    v9 = self->_observedEditorControllers;
    self->_observedEditorControllers = v8;

  }
}

- (void)p_notifyAllObserversOfModeChangeTo:(id)a3 from:(id)a4 animated:(BOOL)a5 didChange:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = -[NSHashTable copy](self->_observers, "copy");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (v6)
          objc_msgSend(v18, "didSetDocumentToMode:fromMode:animated:", v10, v11, v7);
        else
          objc_msgSend(v18, "willSetDocumentToMode:fromMode:animated:", v10, v11, v7, (_QWORD)v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

- (CRLiOSDocumentMode)mode
{
  return self->_mode;
}

- (CRLiOSDocumentModeControllerDelegate)delegate
{
  return (CRLiOSDocumentModeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observedEditorControllers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_previousMode, 0);
  objc_storeStrong((id *)&self->_mode, 0);
}

@end
