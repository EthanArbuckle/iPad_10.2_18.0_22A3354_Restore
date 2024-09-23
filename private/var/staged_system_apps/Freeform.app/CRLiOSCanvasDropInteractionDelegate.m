@implementation CRLiOSCanvasDropInteractionDelegate

- (CRLiOSCanvasDropInteractionDelegate)initWithICC:(id)a3
{
  id v4;
  CRLiOSCanvasDropInteractionDelegate *v5;
  CRLiOSCanvasDropInteractionDelegate *v6;
  void *v7;
  id WeakRetained;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasDropInteractionDelegate;
  v5 = -[CRLiOSCanvasDropInteractionDelegate init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    WeakRetained = objc_loadWeakRetained((id *)&v6->_icc);
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "p_canvasDidScroll:", CFSTR("CRLCanvasUpdateScrollNotification"), WeakRetained);

  }
  return v6;
}

- (CRLiOSCanvasDropInteractionDelegate)init
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
    dispatch_once(&qword_10147E370, &stru_10123F570);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLiOSCanvasDropInteractionDelegate init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m";
    v17 = 1024;
    v18 = 40;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10123F590);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 40, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSCanvasDropInteractionDelegate init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (void)p_canvasDidScroll:(id)a3
{
  -[CRLDragAndDropController targetScrollViewDidScroll](self->_dndController, "targetScrollViewDidScroll", a3);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v5;
  id WeakRetained;
  unsigned __int8 v7;
  uint64_t v8;
  unsigned __int8 v9;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = a4;
  if (self->_dndController
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_icc),
        v7 = objc_msgSend(WeakRetained, "editingDisabled"),
        WeakRetained,
        (v7 & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    *(_QWORD *)&v11 = objc_opt_class(CRLColor, v8).n128_u64[0];
    if ((objc_msgSend(v5, "canLoadObjectsOfClass:", v12, v11) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", v5));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "itemSource"));
      if ((objc_msgSend(v14, "hasImportableText") & 1) != 0
        || (objc_msgSend(v14, "hasImportableRichText") & 1) != 0)
      {
        v9 = 1;
      }
      else
      {
        v9 = 1;
        if ((objc_msgSend(v14, "hasImportableBoardItemsDetectingImportableURLsInText:", 1) & 1) == 0)
          v9 = objc_msgSend(v14, "hasNativeTypes");
      }

    }
  }

  return v9;
}

- (id)p_dragInfoForSession:(id)a3
{
  id v4;
  id v5;
  CRLDragAndDropInfo *v6;
  CRLDragAndDropInfo *cachedDragInfo;
  CRLDragAndDropInfo *v8;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](self->_cachedDragInfo, "platformDraggingInfo"));

  if (v5 != v4)
  {
    v6 = -[CRLDragAndDropInfo initWithPlatformDraggingInfo:]([CRLDragAndDropInfo alloc], "initWithPlatformDraggingInfo:", v4);
    cachedDragInfo = self->_cachedDragInfo;
    self->_cachedDragInfo = v6;

  }
  v8 = self->_cachedDragInfo;

  return v8;
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CRLDragAndDropController *v19;
  CRLDragAndDropController *dndController;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;

  v6 = a3;
  v7 = a4;
  if (self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F5B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0443C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F5D0);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidEnter:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 81, 0, "expected nil value for '%{public}s'", "_dndController");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asiOSCVC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));

  if ((objc_opt_respondsToSelector(v14, "dragDidEnter") & 1) != 0)
    objc_msgSend(v14, "dragDidEnter");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", v7));
  if (!self->_dndController)
  {
    v16 = objc_loadWeakRetained((id *)&self->_icc);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "layerHost"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "asiOSCVC"));
    v19 = (CRLDragAndDropController *)objc_msgSend(v18, "newDragAndDropController");
    dndController = self->_dndController;
    self->_dndController = v19;

  }
  v21 = objc_loadWeakRetained((id *)&self->_icc);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasView"));
  objc_msgSend(v7, "locationInView:", v22);
  v24 = v23;
  v26 = v25;

  -[CRLDragAndDropController draggingEntered:atScaledPoint:](self->_dndController, "draggingEntered:atScaledPoint:", v15, v24, v26);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v5 = a4;
  if (!self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F5F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E044D0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F610);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidUpdate:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 97, 0, "invalid nil value for '%{public}s'", "_dndController");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", v5));
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v5, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  v16 = objc_msgSend(objc_alloc((Class)UIDropProposal), "initWithDropOperation:", sub_100030420(-[CRLDragAndDropController draggingUpdated:atScaledPoint:](self->_dndController, "draggingUpdated:atScaledPoint:", v9, v13, v15)));
  return v16;
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLDragAndDropController *dndController;

  v5 = a4;
  if (!self->_dndController)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F630);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E04564();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F650);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDropInteractionDelegate dropInteraction:sessionDidExit:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDropInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 105, 0, "invalid nil value for '%{public}s'", "_dndController");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", v5));
  -[CRLDragAndDropController draggingExited:](self->_dndController, "draggingExited:", v9);
  dndController = self->_dndController;
  self->_dndController = 0;

}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  CRLDragAndDropInfo *cachedDragInfo;
  id v6;
  id WeakRetained;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CRLDragAndDropController *dndController;
  id v14;

  cachedDragInfo = self->_cachedDragInfo;
  self->_cachedDragInfo = 0;
  v6 = a4;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", v6));
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v6, "locationInView:", v8);
  v10 = v9;
  v12 = v11;

  self->_lastScaledPoint.x = v10;
  self->_lastScaledPoint.y = v12;
  if (!-[CRLDragAndDropController performDragOperation:atScaledPoint:](self->_dndController, "performDragOperation:atScaledPoint:", v14, v10, v12))
  {
    dndController = self->_dndController;
    self->_dndController = 0;

  }
}

- (void)dropInteraction:(id)a3 concludeDrop:(id)a4
{
  CRLDragAndDropController *dndController;
  id v6;

  if (self->_dndController)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", a4));
    -[CRLDragAndDropController concludeDragOperation:](self->_dndController, "concludeDragOperation:", v6);
    dndController = self->_dndController;
    self->_dndController = 0;

  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
  CRLDragAndDropController *dndController;
  id v6;

  if (self->_dndController)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDropInteractionDelegate p_dragInfoForSession:](self, "p_dragInfoForSession:", a4));
    -[CRLDragAndDropController draggingExited:](self->_dndController, "draggingExited:", v6);
    dndController = self->_dndController;
    self->_dndController = 0;

  }
}

- (id)dropInteraction:(id)a3 previewForDroppingItem:(id)a4 withDefault:(id)a5
{
  id v7;
  id v8;
  CRLDragAndDropInfo *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v7 = a4;
  v8 = a5;
  v9 = self->_cachedDragInfo;
  if ((id)-[CRLDragAndDropInfo numberOfDraggingItems](v9, "numberOfDraggingItems") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropInfo platformDraggingInfo](v9, "platformDraggingInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    if (v12 == v7)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "target"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "container"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "target"));
      objc_msgSend(v15, "center");
      v17 = v16;
      v19 = v18;
      p_icc = &self->_icc;
      WeakRetained = objc_loadWeakRetained((id *)p_icc);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
      objc_msgSend(v14, "convertPoint:toView:", v22, v17, v19);
      v24 = v23;
      v26 = v25;

      v27 = objc_loadWeakRetained((id *)p_icc);
      objc_msgSend(v27, "convertBoundsToUnscaledPoint:", v24, v26);
      -[CRLDragAndDropInfo setTargetPreviewCenter:](v9, "setTargetPreviewCenter:");

    }
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDragInfo, 0);
  objc_storeStrong((id *)&self->_dndController, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
