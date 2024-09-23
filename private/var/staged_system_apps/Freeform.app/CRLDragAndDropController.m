@implementation CRLDragAndDropController

- (CRLDragAndDropController)initWithDelegate:(id)a3 interactiveCanvasController:(id)a4
{
  id v6;
  id v7;
  CRLDragAndDropController *v8;
  CRLDragAndDropController *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *infosToBeInsertedAccessQueue;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLDragAndDropController;
  v8 = -[CRLDragAndDropController init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeWeak((id *)&v9->_interactiveCanvasController, v7);
    v10 = dispatch_queue_create("com.apple.freeform.CRLDragInfosReadyAccess", 0);
    infosToBeInsertedAccessQueue = v9->_infosToBeInsertedAccessQueue;
    v9->_infosToBeInsertedAccessQueue = (OS_dispatch_queue *)v10;

    v9->_targetZOrderForDropOperation = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (CRLDragAndDropController)init
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101251370);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLDragAndDropController init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
    v17 = 1024;
    v18 = 109;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101251390);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 109, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLDragAndDropController init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  if (self->_dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012513B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1FFD0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012513D0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 114, 0, "Did not clean up properly at end of drag operation!");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editingCoordinator"));
    objc_msgSend(v7, "resumeCollaborationWithReason:", CFSTR("CRLCanvasDragAndDrop"));

  }
  v8.receiver = self;
  v8.super_class = (Class)CRLDragAndDropController;
  -[CRLDragAndDropController dealloc](&v8, "dealloc");
}

- (id)p_alertPresenter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));

  return v3;
}

- (id)p_modalOperationPresenter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));

  return v3;
}

- (id)p_errorPresenter
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));

  return v3;
}

- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3
{
  return 0;
}

- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5
{
  return 0;
}

- (BOOL)shouldCleanupAfterSuccessfulDragOperation
{
  return self->_targetZOrderForDropOperation != 0x7FFFFFFFFFFFFFFFLL
      || self->_infoToTargetForIndirectDropOperation != 0;
}

- (unint64_t)draggingEntered:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t dragState;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  NSObject *infosToBeInsertedAccessQueue;
  void *v20;
  unsigned int v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *i;
  id v33;
  void *v34;
  unint64_t lastReturnedDragOperation;
  void *v36;
  NSObject *v37;
  unint64_t v38;
  unint64_t v39;
  NSObject *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[5];
  id v47;
  _BYTE *v48;
  _QWORD *v49;
  _QWORD v50[5];
  id v51;
  _QWORD block[5];
  uint8_t v53[128];
  _BYTE buf[24];
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012513F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E200D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251410);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingEntered:atScaledPoint:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 160, 0, "This operation must only be performed on the main thread.");

  }
  dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251430);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20050();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251450);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingEntered:atScaledPoint:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 170, 0, "Called dragging entered when we were already in state entered!");
  }
  else
  {
    if (dragState)
      goto LABEL_24;
    self->_dragState = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvas"));
    objc_msgSend(v13, "i_registerCanvasLayoutObserver:", self);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editingCoordinator"));
    objc_msgSend(v15, "suspendCollaborationWithReason:", CFSTR("CRLCanvasDragAndDrop"));
  }

LABEL_24:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v18 = objc_msgSend(v17, "shouldAllowDragOperationForDragInfo:", v7);

  if ((v18 & 1) != 0)
  {
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100319370;
    block[3] = &unk_10122D110;
    block[4] = self;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
    v21 = objc_msgSend(v20, "shouldAllowDynamicInsertForDragInfo:", v7);

    if (v21)
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v55 = sub_100319384;
      v56 = sub_100319394;
      v57 = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = sub_100319384;
      v50[4] = sub_100319394;
      v51 = 0;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10031939C;
      v46[3] = &unk_10122C5C8;
      v46[4] = self;
      v47 = v7;
      v48 = buf;
      v49 = v50;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v46);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(buf, 8);

    }
    self->_lastReturnedDragOperation = -[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:](self, "p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:", v7, x, y);
    self->_lastProvidedDragPoint.x = x;
    self->_lastProvidedDragPoint.y = y;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inProcessDraggingSources"));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
    if (v23)
    {
      v30 = v23;
      v31 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v31)
            objc_enumerationMutation(v22);
          v33 = sub_100221DDC(*(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), 1, v24, v25, v26, v27, v28, v29, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
          if (v34)
          {
            lastReturnedDragOperation = self->_lastReturnedDragOperation;
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
            objc_msgSend(v34, "draggingEnteredWithOperation:targetInteractiveCanvasController:", lastReturnedDragOperation, v36);

          }
        }
        v30 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      }
      while (v30);
    }

    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_101251538);
    v37 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      v38 = self->_lastReturnedDragOperation;
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "-draggingEntered. Operation %lu with drag info %@", buf, 0x16u);
    }
    v39 = self->_lastReturnedDragOperation;
  }
  else
  {
    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_101251470);
    v40 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Preventing drag operation with -shouldAllowDragOperationForDragInfo: %@", buf, 0xCu);
    }
    v39 = 0;
  }

  return v39;
}

- (unint64_t)draggingUpdated:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *infosToBeInsertedAccessQueue;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *i;
  id v25;
  void *v26;
  void *v27;
  int canvasDidLayoutSinceLastUpdate;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  unint64_t lastReturnedDragOperation;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *j;
  id v43;
  void *v44;
  unint64_t v45;
  void *v46;
  NSObject *v47;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint8_t v63[128];
  uint8_t buf[4];
  unint64_t v65;
  __int16 v66;
  unint64_t v67;
  _BYTE v68[128];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v9 = objc_msgSend(v8, "shouldAllowDragOperationForDragInfo:", v7);

  if (v9)
  {
    if (!self->_dragState)
    {
      v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251558);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E201F8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101251578);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E20150(v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingUpdated:atScaledPoint:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 318, 0, "draggingUpdated called without draggingEntered called first!");

      -[CRLDragAndDropController draggingEntered:atScaledPoint:](self, "draggingEntered:atScaledPoint:", v7, x, y);
    }
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10031A388;
    block[3] = &unk_10122C5F0;
    block[4] = self;
    block[5] = &v59;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inProcessDraggingSources"));
    v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v55;
      while (2)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v23)
            objc_enumerationMutation(v15);
          v25 = sub_100221DDC(*(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i), 1, v16, v17, v18, v19, v20, v21, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          v27 = v26;
          if (v26 && (objc_msgSend(v26, "draggingWantsForcedUpdate") & 1) != 0)
          {

            canvasDidLayoutSinceLastUpdate = 1;
            goto LABEL_24;
          }

        }
        v22 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
        if (v22)
          continue;
        break;
      }
    }

    canvasDidLayoutSinceLastUpdate = self->_canvasDidLayoutSinceLastUpdate;
LABEL_24:
    self->_canvasDidLayoutSinceLastUpdate = 0;
    if (self->_lastProvidedDragPoint.x != x
      || self->_lastProvidedDragPoint.y != y
      || ((*((_BYTE *)v60 + 24) == 0) & ~canvasDidLayoutSinceLastUpdate) == 0)
    {
      v30 = -[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:](self, "p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:", v7, x, y);
      if (v30 != self->_lastReturnedDragOperation)
      {
        if (qword_10147E5E8 != -1)
          dispatch_once(&qword_10147E5E8, &stru_101251598);
        v31 = off_1013DB850;
        if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
        {
          lastReturnedDragOperation = self->_lastReturnedDragOperation;
          *(_DWORD *)buf = 134218240;
          v65 = lastReturnedDragOperation;
          v66 = 2048;
          v67 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "-draggingUpdated. Operation changed from %lu to %lu", buf, 0x16u);
        }
        self->_lastReturnedDragOperation = v30;
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inProcessDraggingSources"));
        v40 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
        if (v40)
        {
          v41 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v40; j = (char *)j + 1)
            {
              if (*(_QWORD *)v51 != v41)
                objc_enumerationMutation(v33);
              v43 = sub_100221DDC(*(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j), 1, v34, v35, v36, v37, v38, v39, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
              v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
              if (v44)
              {
                v45 = self->_lastReturnedDragOperation;
                v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
                objc_msgSend(v44, "draggingUpdatedWithOperation:targetInteractiveCanvasController:", v45, v46);

              }
            }
            v40 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
          }
          while (v40);
        }

      }
      self->_lastProvidedDragPoint.x = x;
      self->_lastProvidedDragPoint.y = y;
      v47 = self->_infosToBeInsertedAccessQueue;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10031A3C8;
      v49[3] = &unk_10122D110;
      v49[4] = self;
      dispatch_sync(v47, v49);
    }
    v29 = self->_lastReturnedDragOperation;
    _Block_object_dispose(&v59, 8);
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (void)draggingExited:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[8];
  _BYTE v27[128];

  v4 = a3;
  if (qword_10147E5E8 != -1)
    dispatch_once(&qword_10147E5E8, &stru_1012515B8);
  v5 = off_1013DB850;
  if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "-draggingExited.", buf, 2u);
  }
  if (self->_dragState)
  {
    -[CRLDragAndDropController cleanupEndOfDragOperation](self, "cleanupEndOfDragOperation");
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "inProcessDraggingSources"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v14 = v7;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v6);
          v17 = sub_100221DDC(*(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLDragOperationCallback);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = v18;
          if (v18)
            objc_msgSend(v18, "draggingExited");

        }
        v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012515D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20278();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012515F8);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController draggingExited:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v21, 387, 0, "draggingExited called without draggingEntered called first!");

  }
}

- (BOOL)prepareForDragOperation:(id)a3
{
  return 1;
}

- (BOOL)performDragOperation:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  int v26;
  void *v27;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (qword_10147E5E8 != -1)
    dispatch_once(&qword_10147E5E8, &stru_101251618);
  v8 = off_1013DB850;
  if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v26) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "-performDragOperation.", (uint8_t *)&v26, 2u);
  }
  if (!self->_dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20378();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251658);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performDragOperation:atScaledPoint:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 418, 0, "draggingUpdated called without draggingEntered called first!");

    -[CRLDragAndDropController draggingEntered:atScaledPoint:](self, "draggingEntered:atScaledPoint:", v7, x, y);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v13 = objc_msgSend(v12, "shouldAllowDragOperationForDragInfo:", v7);

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v14, "convertBoundsToUnscaledPoint:", x, y);
    v16 = v15;
    v18 = v17;
    objc_msgSend(v7, "setShouldHidePromisedFileTypes:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController p_dragDestinationForDragInfo:atUnscaledPoint:](self, "p_dragDestinationForDragInfo:atUnscaledPoint:", v7, v16, v18));
    objc_msgSend(v7, "setShouldHidePromisedFileTypes:", 0);
    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_1012516B8);
    v20 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      v26 = 138412290;
      v27 = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "drag destination: %@", (uint8_t *)&v26, 0xCu);
    }
    v21 = -[CRLDragAndDropController p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:](self, "p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:", v7, v19, v16, v18);

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251678);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E202F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251698);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performDragOperation:atScaledPoint:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 428, 0, "OS shouldn't tell us to perform drag operation when -shouldAllowDragOperationForDragInfo returns NO");

    -[CRLDragAndDropController cleanupEndOfDragOperation](self, "cleanupEndOfDragOperation");
    v21 = 0;
  }

  return v21;
}

- (void)concludeDragOperation:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CRLDragAndDropController *v7;
  __int16 v8;
  id v9;

  v4 = a3;
  if (qword_10147E5E8 != -1)
    dispatch_once(&qword_10147E5E8, &stru_1012516D8);
  v5 = off_1013DB850;
  if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218242;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%p concludeDragOperation with drag info %@", (uint8_t *)&v6, 0x16u);
  }
  -[CRLDragAndDropController cleanupEndOfDragOperation](self, "cleanupEndOfDragOperation");

}

- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 onInfo:(id)a4
{
  id v6;
  id v7;
  unint64_t dragState;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  float64x2_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v34;
  void *v35;
  BOOL v36;
  float64x2_t v38;

  v6 = a3;
  v7 = a4;
  dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012516F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20478();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251718);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:onInfo:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 462, 0, "Called performIndirectDragOperationWithDragInfo when we were already in a drag!");

  }
  else if (!dragState)
  {
    self->_dragState = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
    objc_msgSend(v10, "suspendCollaborationWithReason:", CFSTR("CRLCanvasDragAndDrop"));

  }
  objc_storeStrong((id *)&self->_infoToTargetForIndirectDropOperation, a4);
  self->_isIndirectDropOperation = 1;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v15 = objc_msgSend(v14, "canInsertBoardItemsFromDragOperationForDragInfo:", v6);

  if ((v15 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251738);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E203F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251758);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:onInfo:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 468, 0, "Indirect drops should never reject the resulting insert");

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v19, "visibleUnscaledRect");
  v24.f64[0] = sub_100061400(v20, v21, v22, v23);
  v38 = v24;
  v26 = v25;

  if (v7)
  {
    objc_opt_class(_TtC8Freeform12CRLBoardItem, v27);
    if ((objc_opt_isKindOfClass(v7, v28) & 1) != 0)
    {
      objc_msgSend(v7, "fullTransformInRoot");
      __asm { FMOV            V3.2D, #0.5 }
      v38 = vaddq_f64((float64x2_t)0, vmlaq_f64(vmulq_f64((float64x2_t)0, _Q3), _Q3, (float64x2_t)0));
      v26 = v38.f64[1];
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController", *(_OWORD *)&v38));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "repForInfo:", v7));

  }
  else
  {
    v35 = 0;
  }
  v36 = -[CRLDragAndDropController p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:](self, "p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:", v6, v35, v38.f64[0], v26, *(_OWORD *)&v38);

  return v36;
}

- (BOOL)performIndirectDragOperationWithDragInfo:(id)a3 inContainer:(id)a4 targetZOrder:(unint64_t)a5
{
  id v8;
  id v9;
  unint64_t dragState;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  void *v20;
  id WeakRetained;
  uint64_t v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;

  v8 = a3;
  v9 = a4;
  dragState = self->_dragState;
  if (dragState == 1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251778);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20578();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251798);
    v13 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:inContainer:targetZOrder:]"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 493, 0, "Called performIndirectDragOperationWithDragInfo when we were already in a drag!");

  }
  else if (!dragState)
  {
    self->_dragState = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
    objc_msgSend(v12, "suspendCollaborationWithReason:", CFSTR("CRLCanvasDragAndDrop"));

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v17 = objc_msgSend(v16, "canInsertBoardItemsFromDragOperationForDragInfo:", v8);

  if ((v17 & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012517B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E204F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012517D8);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController performIndirectDragOperationWithDragInfo:inContainer:targetZOrder:]"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 497, 0, "Indirect drops should never reject the resulting insert");

  }
  self->_isIndirectDropOperation = 1;
  self->_targetZOrderForDropOperation = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(WeakRetained, "visibleUnscaledRect");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  if (v9)
  {
    objc_opt_class(_TtC8Freeform12CRLGroupItem, v22);
    if ((objc_opt_isKindOfClass(v9, v31) & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "selectionPathForNothingSelectedInsideGroup:", v9));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
      objc_msgSend(v34, "setSelectionPath:", v33);

      objc_msgSend(WeakRetained, "layoutIfNeeded");
    }
  }
  v35 = -[CRLDragAndDropController p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:](self, "p_performDragOperationWithDragInfo:onDragDestination:atUnscaledPoint:", v8, 0, sub_100061400(v24, v26, v28, v30));

  return v35;
}

- (BOOL)p_shouldInsertDraggedBoardItems:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "canInsertBoardItemsFromDragOperationForDragInfo:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
  if (!v7)
    return self->_isIndirectDropOperation;
  return v6;
}

- (BOOL)p_performDragOperationWithDragInfo:(id)a3 onDragDestination:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, int);
  void *v20;
  id v21;
  id v22;
  CRLDragAndDropController *v23;
  uint64_t *v24;
  CGFloat v25;
  CGFloat v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  y = a5.y;
  x = a5.x;
  v9 = a3;
  v10 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
  v17 = _NSConcreteStackBlock;
  v18 = 3221225472;
  v19 = sub_10031B888;
  v20 = &unk_101251880;
  v13 = v10;
  v21 = v13;
  v14 = v9;
  v25 = x;
  v26 = y;
  v22 = v14;
  v23 = self;
  v24 = &v27;
  objc_msgSend(v12, "canPerformUserActionUsingBlock:", &v17);

  if (!*((_BYTE *)v28 + 24)
    || -[CRLDragAndDropController shouldCleanupAfterSuccessfulDragOperation](self, "shouldCleanupAfterSuccessfulDragOperation", v17, v18, v19, v20, v21))
  {
    -[CRLDragAndDropController cleanupEndOfDragOperation](self, "cleanupEndOfDragOperation", v17, v18, v19, v20);
  }
  v15 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v15;
}

- (void)cleanupEndOfDragOperation
{
  unint64_t dragState;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLDragToInsertController *dragToInsertController;
  CRLCanvasElementInfo *infoToTargetForIndirectDropOperation;
  NSObject *infosToBeInsertedAccessQueue;
  _QWORD block[5];

  dragState = self->_dragState;
  if (dragState == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvas"));
    objc_msgSend(v8, "i_unregisterCanvasLayoutObserver:", self);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
    objc_msgSend(v10, "resumeCollaborationWithReason:", CFSTR("CRLCanvasDragAndDrop"));

  }
  else if (!dragState)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012518A0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2068C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012518C0);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController cleanupEndOfDragOperation]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 672, 0, "Unexpectedly being asked to cleanup DnD when in state Idle");

  }
  self->_dragState = 0;
  -[CRLDragToInsertController cancelDragToInsert](self->_dragToInsertController, "cancelDragToInsert");
  dragToInsertController = self->_dragToInsertController;
  self->_dragToInsertController = 0;

  infoToTargetForIndirectDropOperation = self->_infoToTargetForIndirectDropOperation;
  self->_infoToTargetForIndirectDropOperation = 0;

  self->_targetZOrderForDropOperation = 0x7FFFFFFFFFFFFFFFLL;
  infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10031C148;
  block[3] = &unk_10122D110;
  block[4] = self;
  dispatch_async(infosToBeInsertedAccessQueue, block);
  -[CRLDragAndDropController p_hideDragAndDropHighlightOnRep](self, "p_hideDragAndDropHighlightOnRep");
  -[CRLDragAndDropController p_hideDragAndDropHighlightOnCanvasEditor](self, "p_hideDragAndDropHighlightOnCanvasEditor");
}

+ (unint64_t)p_dragOperationForSupportedDragOperations:(unint64_t)a3
{
  if ((a3 & 1) != 0)
    return 1;
  else
    return a3 & 2;
}

- (id)p_dragDestinationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[5];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10031C364;
  v21[3] = &unk_1012318E8;
  v21[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitRep:passingTest:", v21, x, y));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
    v11 = objc_msgSend(v10, "canEditRepWithDragOperation:", v9);

    if (v11 && objc_msgSend(v9, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y))
    {
      v12 = v9;
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForSelecting"));
      v14 = (void *)v13;
      v12 = 0;
      if ((void *)v13 != v9 && v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
        v16 = objc_msgSend(v15, "canEditRepWithDragOperation:", v14);

        if (v16 && objc_msgSend(v14, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y))
          v12 = v14;
        else
          v12 = 0;
      }

    }
  }
  else
  {
    v12 = 0;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  v18 = v17;
  if (!v12)
  {
    if (objc_msgSend(v17, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y))
      v12 = v18;
    else
      v12 = 0;
  }
  v19 = v12;

  return v19;
}

- (unint64_t)p_dragOperationForDragInsideWithDraggingInfo:(id)a3 atScaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  unint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
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
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  _BOOL4 v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  unint64_t v42;
  NSObject *v43;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unsigned __int8 v50;
  NSObject *infosToBeInsertedAccessQueue;
  uint64_t v52;
  double v53;
  id v54;
  CRLDragToInsertController *dragToInsertController;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  Block_layout *v63;
  uint64_t v64;
  Block_layout *i;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  double v70;
  id v71;
  void *v72;
  unsigned int v73;
  unsigned int v74;
  uint64_t v75;
  CRLDragToInsertController *v76;
  uint64_t v77;
  void *v78;
  Block_layout *v79;
  CRLDragToInsertController *v80;
  CRLDragToInsertController *v81;
  int v82;
  NSObject *v83;
  void *v84;
  void *v85;
  void *v86;
  unint64_t v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD block[7];
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  char v96;
  _BYTE buf[54];
  _BYTE v98[128];
  CGPoint v99;
  CGRect v100;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (unint64_t)objc_msgSend(v7, "dragOperationMask");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v9, "convertBoundsToUnscaledPoint:", x, y);
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "enclosingScrollView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "superview"));
  objc_msgSend(v9, "unobscuredScrollViewFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  objc_msgSend(v16, "convertRect:toView:", v25, v18, v20, v22, v24);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v100.origin.x = v27;
  v100.origin.y = v29;
  v100.size.width = v31;
  v100.size.height = v33;
  v99.x = x;
  v99.y = y;
  v34 = CGRectContainsPoint(v100, v99);
  if (!v7)
  {
    v35 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251908);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20984();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251928);
    v36 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E208DC(v36, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v37, v38, 779, 0, "invalid nil value for '%{public}s'", "dragInfo");

  }
  if (!v34)
  {
    v40 = 0;
LABEL_20:
    -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, 64, v40, v11, v13);
LABEL_21:
    v42 = 0;
    goto LABEL_22;
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController p_dragDestinationForDragInfo:atUnscaledPoint:](self, "p_dragDestinationForDragInfo:atUnscaledPoint:", v7, v11, v13));
  v40 = v39;
  if (!v39)
    goto LABEL_32;
  v41 = objc_msgSend(v39, "dragOperationForDragInfo:atUnscaledPoint:", v7, v11, v13);
  v42 = (unint64_t)v41;
  if (!v41)
  {
    v45 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251968);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2085C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251988);
    v46 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E207B4(v46, v45);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v47, v48, 802, 0, "If we have a drag destination, our drag operation should not be None");

LABEL_32:
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
    v50 = objc_msgSend(v49, "canInsertBoardItemsFromDragOperationForDragInfo:", v7);

    if ((v50 & 1) == 0)
    {
      -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, 0, v40, v11, v13);
      goto LABEL_21;
    }
    v93 = 0;
    v94 = &v93;
    v95 = 0x2020000000;
    v96 = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = sub_100319384;
    *(_QWORD *)&buf[32] = sub_100319394;
    *(_QWORD *)&buf[40] = 0;
    infosToBeInsertedAccessQueue = self->_infosToBeInsertedAccessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10031CF80;
    block[3] = &unk_101246FD0;
    block[4] = self;
    block[5] = &v93;
    block[6] = buf;
    dispatch_sync(infosToBeInsertedAccessQueue, block);
    if (*((_BYTE *)v94 + 24) && objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      *(_QWORD *)&v53 = objc_opt_class(self, v52).n128_u64[0];
      v42 = (unint64_t)objc_msgSend(v54, "p_dragOperationForSupportedDragOperations:", v8, v53);
      if (v42)
      {
        dragToInsertController = self->_dragToInsertController;
        if (!dragToInsertController)
        {
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inProcessDraggingSources"));
          v63 = (Block_layout *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
          v87 = v8;
          if (v63)
          {
            v64 = *(_QWORD *)v89;
            while (2)
            {
              for (i = 0; i != v63; i = (Block_layout *)((char *)i + 1))
              {
                if (*(_QWORD *)v89 != v64)
                  objc_enumerationMutation(v56);
                v66 = sub_100221DDC(*(void **)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)i), 1, v57, v58, v59, v60, v61, v62, (uint64_t)&OBJC_PROTOCOL___CRLDynamicDragInsertDragOperationCallback);
                v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
                v68 = v67;
                if (v67)
                {
                  v63 = (Block_layout *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "postInsertBlockForDragAndDropWithBoardItemsToInsert:targetInteractiveCanvasController:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v9));

                  goto LABEL_59;
                }
              }
              v63 = (Block_layout *)objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v88, v98, 16);
              if (v63)
                continue;
              break;
            }
          }
LABEL_59:

          v76 = [CRLDragToInsertController alloc];
          v77 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
          if (v63)
            v79 = v63;
          else
            v79 = &stru_1012519A8;
          v80 = -[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:](v76, "initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:", v77, v78, v79, v11, v13);
          v81 = self->_dragToInsertController;
          self->_dragToInsertController = v80;

          v8 = v87;
          dragToInsertController = self->_dragToInsertController;
        }
        -[CRLDragToInsertController dragToPoint:](dragToInsertController, "dragToPoint:", v11, v13);
      }
    }
    else if (-[CRLDragAndDropController canCreateBoardItemsFromDragInfo:](self, "canCreateBoardItemsFromDragInfo:", v7))
    {
      *(_QWORD *)&v70 = objc_opt_class(self, v69).n128_u64[0];
      v42 = (unint64_t)objc_msgSend(v71, "p_dragOperationForSupportedDragOperations:", v8, v70);
      v72 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
      v73 = objc_msgSend(v72, "shouldAllowDynamicInsertForDragInfo:", v7);
      if (v42 == 1)
        v74 = v73;
      else
        v74 = 0;
      if (v74 == 1)
      {

        if ((v8 & 2) != 0)
          v42 = 2;
        else
          v42 = 1;
      }
      else
      {

      }
      v75 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));

      v40 = (void *)v75;
    }
    else
    {
      v42 = 0;
    }
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v93, 8);
    goto LABEL_65;
  }
  if (v41 == (id)64)
  {
    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_101251948);
    v43 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v40;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "drag destination is disallowing drag: %@", buf, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_65:
  -[CRLDragAndDropController p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:](self, "p_updateHighlightStateForDragInfo:atUnscaledPoint:dragOperation:dragDestination:", v7, v42, v40, v11, v13);
  if (v42 == 64)
    goto LABEL_21;
  if (v42 && (v42 & v8) == 0)
  {
    v82 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012519C8);
    v83 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)&buf[4] = v82;
      *(_WORD *)&buf[8] = 2082;
      *(_QWORD *)&buf[10] = "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]";
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = 871;
      *(_WORD *)&buf[34] = 2048;
      *(_QWORD *)&buf[36] = v42;
      *(_WORD *)&buf[44] = 2048;
      *(_QWORD *)&buf[46] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Drag operation %zi not supported by the sender with mask %zi.", buf, 0x36u);
    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012519E8);
    v84 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2070C(v84, v82);
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_dragOperationForDragInsideWithDraggingInfo:atScaledPoint:]"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v85, v86, 871, 0, "Drag operation %zi not supported by the sender with mask %zi.", v42, v8);

  }
LABEL_22:

  return v42;
}

- (void)targetScrollViewDidScroll
{
  void *v2;
  void *v3;
  id v4;

  if (self->_highlightState == 2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasEditorHelper"));
    objc_msgSend(v3, "updateDragAndDropUIForPoint:dragInfo:", 0, CGPointZero.x, CGPointZero.y);

  }
}

- (void)p_updateHighlightStateForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4 dragOperation:(unint64_t)a5 dragDestination:(id)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  BOOL v16;
  BOOL v17;
  unint64_t v18;
  unint64_t highlightState;
  id v20;
  void *v21;
  void *v22;
  id v23;

  y = a4.y;
  x = a4.x;
  v23 = a3;
  v11 = a6;
  v12 = v11;
  if ((a5 & 0xFFFFFFFFFFFFFFBFLL) == 0)
  {
    v17 = 0;
    v16 = 0;
    v18 = 0;
    v13 = 0;
    goto LABEL_11;
  }
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "repToHighlightForDragInfo:atUnscaledPoint:", v23, x, y));
    if (!v13)
      goto LABEL_7;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController delegate](self, "delegate"));
    v15 = objc_msgSend(v14, "canEditRepWithDragOperation:", v13);

    if ((v15 & 1) != 0)
      goto LABEL_7;

  }
  v13 = 0;
LABEL_7:
  v16 = v13 == 0;
  v17 = v13 != 0;
  if (v13)
    v18 = 1;
  else
    v18 = 2;
LABEL_11:
  highlightState = self->_highlightState;
  if (highlightState == 2)
  {
    v20 = v23;
    if (!v16)
    {
      -[CRLDragAndDropController p_hideDragAndDropHighlightOnCanvasEditor](self, "p_hideDragAndDropHighlightOnCanvasEditor");
      v20 = v23;
      if (v13)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController p_accessibilityDescriptionForDropTarget:](self, "p_accessibilityDescriptionForDropTarget:", v13));
        -[CRLDragAndDropController p_announceAccessibilityDropTarget:](self, "p_announceAccessibilityDropTarget:", v21);
        goto LABEL_18;
      }
    }
  }
  else
  {
    v20 = v23;
    if (highlightState == 1 && !v17)
    {
      -[CRLDragAndDropController p_hideDragAndDropHighlightOnRep](self, "p_hideDragAndDropHighlightOnRep");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Canvas"), 0, 0));
      -[CRLDragAndDropController p_announceAccessibilityDropTarget:](self, "p_announceAccessibilityDropTarget:", v22);

LABEL_18:
      v20 = v23;
    }
  }
  self->_highlightState = v18;
  if (v18 == 2)
  {
    -[CRLDragAndDropController p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:](self, "p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:", v20, x, y);
  }
  else if (v18 == 1)
  {
    -[CRLDragAndDropController p_showDragAndDropHighlightForRep:atUnscaledPoint:draggingInfo:](self, "p_showDragAndDropHighlightForRep:atUnscaledPoint:draggingInfo:", v13, v23, x, y);
  }

}

- (void)p_showDragAndDropHighlightForRep:(id)a3 atUnscaledPoint:(CGPoint)a4 draggingInfo:(id)a5
{
  double y;
  double x;
  CRLCanvasRep *v9;
  CRLCanvasRep *repShowingDragAndDropHighlight;
  BOOL v11;
  CRLCanvasRep *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v9 = (CRLCanvasRep *)a3;
  v13 = a5;
  repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  if (repShowingDragAndDropHighlight)
    v11 = repShowingDragAndDropHighlight == v9;
  else
    v11 = 1;
  if (!v11)
    -[CRLCanvasRep hideDragAndDropUI](repShowingDragAndDropHighlight, "hideDragAndDropUI");
  -[CRLCanvasRep updateDragAndDropUIForPoint:dragInfo:](v9, "updateDragAndDropUIForPoint:dragInfo:", v13, x, y);
  v12 = self->_repShowingDragAndDropHighlight;
  self->_repShowingDragAndDropHighlight = v9;

}

- (void)p_hideDragAndDropHighlightOnRep
{
  CRLCanvasRep *repShowingDragAndDropHighlight;

  repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  if (repShowingDragAndDropHighlight)
  {
    -[CRLCanvasRep hideDragAndDropUI](repShowingDragAndDropHighlight, "hideDragAndDropUI");
    repShowingDragAndDropHighlight = self->_repShowingDragAndDropHighlight;
  }
  self->_repShowingDragAndDropHighlight = 0;

}

- (void)p_showDragAndDropHighlightForCanvasEditorWithDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  if (self->_repShowingDragAndDropHighlight)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251A08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20A18();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251A28);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController p_showDragAndDropHighlightForCanvasEditorWithDragInfo:atUnscaledPoint:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 968, 0, "Showing canvas highlight when a rep is highlighted");

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasEditor"));

  objc_msgSend(v12, "updateDragAndDropUIForPoint:dragInfo:", v7, x, y);
}

- (void)p_hideDragAndDropHighlightOnCanvasEditor
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "canvasEditorHelper"));
  objc_msgSend(v3, "hideDragAndDropUI");

}

- (void)p_announceAccessibilityDropTarget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Drop on %@"), 0, 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7));
    CRLAccessibilityPostAnnouncementNotification(self, v6);

  }
}

- (id)p_accessibilityDescriptionForDropTarget:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v5 = objc_msgSend(v4, "needsAccessibilityElements");

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityLabel"));
  else
    v6 = 0;

  return v6;
}

- (BOOL)insertDroppedNativeBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 isCrossAppSource:(BOOL)a6 isCrossDocument:(BOOL)a7
{
  double y;
  double x;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unsigned int v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  char *v29;
  unsigned __int8 v30;
  CRLDragAndDropController *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  unsigned int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  _BYTE v48[128];

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v32 = self;
  v33 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v11, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editingCoordinator"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "boardItemFactory"));
        v22 = objc_msgSend(v19, "newBoardItemWithFactory:bakedSize:", v21, 0);

        if (v22)
        {
          objc_msgSend(v13, "addObject:", v22);
        }
        else
        {
          v23 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101251A48);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v39 = v23;
            v40 = 2082;
            v41 = "-[CRLDragAndDropController insertDroppedNativeBoardItemsFromProviders:atUnscaledPoint:onRep:isCrossApp"
                  "Source:isCrossDocument:]";
            v42 = 2082;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m";
            v44 = 1024;
            v45 = 1012;
            v46 = 2082;
            v47 = "boardItem";
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101251A68);
          v25 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v28 = v25;
            v29 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v39 = v23;
            v40 = 2114;
            v41 = v29;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController insertDroppedNativeBoardItemsFromProviders:atUnscaledPoint:onRep:isCrossAppSource:isCrossDocument:]"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1012, 0, "invalid nil value for '%{public}s'", "boardItem");

        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v48, 16);
    }
    while (v16);
  }

  v30 = -[CRLDragAndDropController insertNativePasteboardBoardItems:atUnscaledPoint:onRep:](v32, "insertNativePasteboardBoardItems:atUnscaledPoint:onRep:", v13, v33, x, y);
  return v30;
}

- (BOOL)insertNativePasteboardBoardItems:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  CGSize size;
  id v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 v28;
  id v30;
  CGAffineTransform v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  __int128 *p_buf;
  uint8_t v39[128];
  __int128 buf;
  uint64_t v41;
  void *v42;
  CGPoint origin;
  CGSize v44;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v30 = objc_msgSend(v9, "count");
    if ((unint64_t)v30 >= 2)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v41 = 0x4010000000;
      v42 = &unk_1010E66AB;
      size = CGRectNull.size;
      origin = CGRectNull.origin;
      v44 = size;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10031DE54;
      v36[3] = &unk_1012323C0;
      v12 = v9;
      v37 = v12;
      p_buf = &buf;
      +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:useInBlock:](CRLCanvasLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v12, v36);
      v13 = sub_100061400(*(CGFloat *)(*((_QWORD *)&buf + 1) + 32), *(CGFloat *)(*((_QWORD *)&buf + 1) + 40), *(CGFloat *)(*((_QWORD *)&buf + 1) + 48), *(CGFloat *)(*((_QWORD *)&buf + 1) + 56));
      v14 = sub_1000603B8(x, y, v13);
      v16 = v15;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v17 = v12;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "geometry"));
            CGAffineTransformMakeTranslation(&v31, v14, v16);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometryByAppendingTransform:", &v31));
            objc_msgSend(v21, "setGeometry:", v23);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
        }
        while (v18);
      }

      _Block_object_dispose(&buf, 8);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasEditor"));

    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_101251A88);
    v26 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v9;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Inserting native infos %@", (uint8_t *)&buf, 0xCu);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 1, self->_targetZOrderForDropOperation, x, y));
    v28 = objc_msgSend(v25, "insertBoardItemsFromDragAndDrop:atPoint:onRep:insertionContext:alreadyPositionedInputInfos:", v9, v10, v27, (unint64_t)v30 > 1, x, y);

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)insertDroppedImportableBoardItemsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 onRep:(id)a5 completionHandler:(id)a6
{
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  id v13;
  CRLPasteboardMultipleImportableBoardItemProvider *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CRLPasteboardMultipleImportableBoardItemProvider *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  CRLPasteboardMultipleImportableBoardItemProvider *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  CRLPasteboardMultipleImportableBoardItemProvider *v37;
  id v38;
  id v39;
  id v40;
  CGFloat v41;
  CGFloat v42;
  _QWORD v43[4];
  CRLPasteboardMultipleImportableBoardItemProvider *v44;

  y = a4.y;
  x = a4.x;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  v14 = -[CRLPasteboardMultipleImportableBoardItemProvider initWithImportableBoardItemProviders:]([CRLPasteboardMultipleImportableBoardItemProvider alloc], "initWithImportableBoardItemProviders:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController p_alertPresenter](self, "p_alertPresenter"));
  -[CRLPasteboardMultipleImportableBoardItemProvider setAlertPresenter:](v14, "setAlertPresenter:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Inserting…"), 0, 0));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10031E368;
  v43[3] = &unk_10122D110;
  v18 = v14;
  v44 = v18;
  v19 = objc_retainBlock(v43);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController p_modalOperationPresenter](self, "p_modalOperationPresenter"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardMultipleImportableBoardItemProvider progress](v18, "progress"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:", v17, v21, v19));

  v34 = (void *)v17;
  if (!v22)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251AA8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E20A98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101251AC8);
    v23 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragAndDropController insertDroppedImportableBoardItemsFromProviders:atUnscaledPoint:onRep:completionHandler:]"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 1088, 0, "invalid nil value for '%{public}s'", "modalOperationToken");

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "editingCoordinator"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "boardItemFactory"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10031E3D0;
  v35[3] = &unk_101251B10;
  v35[4] = self;
  v36 = v22;
  v37 = v18;
  v38 = v26;
  v41 = x;
  v42 = y;
  v39 = v11;
  v40 = v12;
  v29 = v12;
  v30 = v11;
  v31 = v26;
  v32 = v18;
  v33 = v22;
  -[CRLPasteboardMultipleImportableBoardItemProvider provideBoardItemsWithFactory:completionHandler:](v32, "provideBoardItemsWithFactory:completionHandler:", v28, v35);

}

- (void)canvasDidUpdateReps:(id)a3
{
  self->_canvasDidLayoutSinceLastUpdate = 1;
}

- (CRLDragAndDropControllerDelegate)delegate
{
  return (CRLDragAndDropControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_infosToBeInsertedAccessQueue, 0);
  objc_storeStrong((id *)&self->_dragToInsertController, 0);
  objc_storeStrong((id *)&self->_importableInfosToBeInsertedProvider, 0);
  objc_storeStrong((id *)&self->_infosToBeInserted, 0);
  objc_storeStrong((id *)&self->_infoToTargetForIndirectDropOperation, 0);
  objc_storeStrong((id *)&self->_repShowingDragAndDropHighlight, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
