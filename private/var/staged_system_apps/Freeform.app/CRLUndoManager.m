@implementation CRLUndoManager

- (CRLUndoManager)initWithCommandController:(id)a3
{
  id v4;
  CRLUndoManager *v5;
  CRLUndoManager *v6;
  uint64_t v7;
  NSHashTable *delegates;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLUndoManager;
  v5 = -[CRLUndoManager init](&v19, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_commandController, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerDidOpenUndoGroup](NSNotification, "CRLCommandControllerDidOpenUndoGroup"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerDidOpenUndoGroup:", v10, v4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillCloseUndoGroup](NSNotification, "CRLCommandControllerWillCloseUndoGroup"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerWillCloseUndoGroup:", v11, v4);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerDidCloseUndoGroup](NSNotification, "CRLCommandControllerDidCloseUndoGroup"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerDidCloseUndoGroup:", v12, v4);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerHistoryStateDidChange](NSNotification, "CRLCommandControllerHistoryStateDidChange"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerHistoryStateChanged:", v13, v4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillUndo](NSNotification, "CRLCommandControllerWillUndo"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerWillUndo:", v14, v4);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerDidUndo](NSNotification, "CRLCommandControllerDidUndo"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerDidUndo:", v15, v4);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillRedo](NSNotification, "CRLCommandControllerWillRedo"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerWillRedo:", v16, v4);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerDidRedo](NSNotification, "CRLCommandControllerDidRedo"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, "p_commandControllerDidRedo:", v17, v4);

    v6->_canUndo = objc_msgSend(v4, "canUndo");
    v6->_canRedo = objc_msgSend(v4, "canRedo");

  }
  return v6;
}

- (CRLUndoManager)initWithCommandController:(id)a3 delegate:(id)a4
{
  id v6;
  CRLUndoManager *v7;
  CRLUndoManager *v8;

  v6 = a4;
  v7 = -[CRLUndoManager initWithCommandController:](self, "initWithCommandController:", a3);
  v8 = v7;
  if (v7)
    -[CRLUndoManager addDelegate:](v7, "addDelegate:", v6);

  return v8;
}

- (void)beginUndoGrouping
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258178);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B41C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258198);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager beginUndoGrouping]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 54, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: beginUndoGrouping");

}

- (void)endUndoGrouping
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012581B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B49C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012581D8);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager endUndoGrouping]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 58, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: endUndoGrouping");

}

- (int64_t)groupingLevel
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v3 = objc_msgSend(WeakRetained, "groupingLevel");

  return (int64_t)v3;
}

- (void)disableUndoRegistration
{
  ++self->_disableCount;
}

- (void)enableUndoRegistration
{
  int64_t disableCount;
  void *v4;
  void *v5;
  void *v6;

  disableCount = self->_disableCount;
  if (disableCount > 0)
    goto LABEL_11;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012581F8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B51C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258218);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager enableUndoRegistration]"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 74, 0, "Disable count underflow");

  disableCount = self->_disableCount;
  if (disableCount >= 1)
LABEL_11:
    self->_disableCount = disableCount - 1;
}

- (BOOL)isUndoRegistrationEnabled
{
  return self->_disableCount == 0;
}

- (BOOL)groupsByEvent
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258238);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B59C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258258);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager groupsByEvent]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 87, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: groupsByEvent");

  return 0;
}

- (void)setGroupsByEvent:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258278);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B61C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258298);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setGroupsByEvent:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 92, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: setGroupsByEvent:");

}

- (void)setLevelsOfUndo:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012582B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B69C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012582D8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setLevelsOfUndo:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 96, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: setLevelsOfUndo:");

}

- (unint64_t)levelsOfUndo
{
  return 0;
}

- (unint64_t)undoCount
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v3 = objc_msgSend(WeakRetained, "undoCount");

  return (unint64_t)v3;
}

- (unint64_t)redoCount
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v3 = objc_msgSend(WeakRetained, "redoCount");

  return (unint64_t)v3;
}

- (void)setRunLoopModes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012582F8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B71C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258318);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setRunLoopModes:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 112, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: setRunLoopModes:");

}

- (id)runLoopModes
{
  return &__NSArray0__struct;
}

- (void)undoNestedGroup
{
  _TtC8Freeform20CRLCommandController **p_commandController;
  id WeakRetained;
  unsigned int v4;
  id v5;

  p_commandController = &self->_commandController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v4 = objc_msgSend(WeakRetained, "canUndo");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_commandController);
    objc_msgSend(v5, "undo");

  }
}

- (BOOL)isUndoing
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258338);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B79C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258358);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager isUndoing]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 128, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected.");

  return 0;
}

- (BOOL)isRedoing
{
  void *v2;
  void *v3;
  void *v4;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258378);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B81C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258398);
  v2 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager isRedoing]"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 133, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected.");

  return 0;
}

- (void)removeAllActionsWithTarget:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012583B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B89C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012583D8);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager removeAllActionsWithTarget:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 145, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: removeAllActionsWithTarget:");

}

- (void)registerUndoWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  void *v5;
  void *v6;
  void *v7;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3, a4, a5);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012583F8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B91C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258418);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager registerUndoWithTarget:selector:object:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 149, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: registerUndoWithTarget");

}

- (id)prepareWithInvocationTarget:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258438);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2B99C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258458);
  v5 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager prepareWithInvocationTarget:]"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 153, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: prepareWithInvocationTarget");

  v11.receiver = self;
  v11.super_class = (Class)CRLUndoManager;
  v8 = -[CRLUndoManager prepareWithInvocationTarget:](&v11, "prepareWithInvocationTarget:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)undoActionName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "undoActionString"));

  return v3;
}

- (id)redoActionName
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "redoActionString"));

  return v3;
}

- (void)setActionName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258478);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2BA1C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101258498);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLUndoManager setActionName:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLUndoManager.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 168, 0, "CRLUndoManager: undo manager has been overridden. This call is unexpected: setActionName:");

}

- (BOOL)canUndo
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[CRLUndoManager canUndoDisregardingDelegates](self, "canUndoDisregardingDelegates"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_delegates, "allObjects", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "canUndo"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (BOOL)canRedo
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (!-[CRLUndoManager canRedoDisregardingDelegates](self, "canRedoDisregardingDelegates"))
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_delegates, "allObjects", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "canRedo"))
        {
          v8 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_13:

  return v8;
}

- (void)addDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_delegates, "addObject:", a3);
}

- (void)removeDelegate:(id)a3
{
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", a3);
}

- (BOOL)canUndoDisregardingDelegates
{
  return self->_canUndo;
}

- (BOOL)canRedoDisregardingDelegates
{
  return self->_canRedo;
}

- (void)undo
{
  _TtC8Freeform20CRLCommandController **p_commandController;
  id WeakRetained;
  unsigned int v4;
  id v5;

  p_commandController = &self->_commandController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v4 = objc_msgSend(WeakRetained, "canUndo");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_commandController);
    objc_msgSend(v5, "undo");

  }
}

- (void)redo
{
  _TtC8Freeform20CRLCommandController **p_commandController;
  id WeakRetained;
  unsigned int v4;
  id v5;

  p_commandController = &self->_commandController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  v4 = objc_msgSend(WeakRetained, "canRedo");

  if (v4)
  {
    v5 = objc_loadWeakRetained((id *)p_commandController);
    objc_msgSend(v5, "redo");

  }
}

- (void)p_commandControllerDidOpenUndoGroup:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerDidOpenUndoGroupNotification, self);

}

- (void)p_commandControllerWillCloseUndoGroup:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerWillCloseUndoGroupNotification, self);

}

- (void)p_commandControllerDidCloseUndoGroup:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerDidCloseUndoGroupNotification, self);

}

- (void)p_commandControllerHistoryStateChanged:(id)a3
{
  -[CRLUndoManager p_updateCanUndoAndRedo](self, "p_updateCanUndoAndRedo", a3);
}

- (void)p_updateCanUndoAndRedo
{
  _TtC8Freeform20CRLCommandController **p_commandController;
  id WeakRetained;
  id v5;

  p_commandController = &self->_commandController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_commandController);
  self->_canUndo = objc_msgSend(WeakRetained, "canUndo");

  v5 = objc_loadWeakRetained((id *)p_commandController);
  self->_canRedo = objc_msgSend(v5, "canRedo");

}

- (void)p_commandControllerWillUndo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerWillUndoChangeNotification, self);

}

- (void)p_commandControllerDidUndo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerDidUndoChangeNotification, self);

}

- (void)p_commandControllerWillRedo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerWillRedoChangeNotification, self);

}

- (void)p_commandControllerDidRedo:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "postNotificationName:object:", NSUndoManagerDidRedoChangeNotification, self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_destroyWeak((id *)&self->_commandController);
}

@end
