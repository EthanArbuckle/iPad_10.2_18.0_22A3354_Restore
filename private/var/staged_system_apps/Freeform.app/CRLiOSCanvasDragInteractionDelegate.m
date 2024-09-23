@implementation CRLiOSCanvasDragInteractionDelegate

- (CRLiOSCanvasDragInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSCanvasDragInteractionDelegate *v5;
  CRLiOSCanvasDragInteractionDelegate *v6;
  NSMapTable *v7;
  NSMapTable *dragItemsToCanvasDragItems;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSCanvasDragInteractionDelegate;
  v5 = -[CRLiOSCanvasDragInteractionDelegate init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_icc, v4);
    v7 = (NSMapTable *)objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    dragItemsToCanvasDragItems = v6->_dragItemsToCanvasDragItems;
    v6->_dragItemsToCanvasDragItems = v7;

    v6->_allowRepsToPreventDragOnPhone = 1;
  }

  return v6;
}

- (CRLiOSCanvasDragInteractionDelegate)init
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
    dispatch_once(&qword_10147E370, &stru_10122F588);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLiOSCanvasDragInteractionDelegate init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m";
    v17 = 1024;
    v18 = 39;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10122F5A8);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 39, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLiOSCanvasDragInteractionDelegate init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v6;
  id v7;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  void *v23;
  NSMapTable *dragItemsToCanvasDragItems;
  void *v25;
  void *v26;
  void *v27;
  CRLiOSCanvasDraggingContext *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v35;
  id v36;

  v6 = a3;
  v7 = a4;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  objc_msgSend(v7, "locationInView:", v10);
  v12 = v11;
  v14 = v13;

  v15 = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(v15, "convertBoundsToUnscaledPoint:", v12, v14);
  v17 = v16;
  v19 = v18;

  v20 = objc_loadWeakRetained((id *)&self->_icc);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "hitRep:", v17, v19));

  objc_msgSend(v6, "_liftDelay");
  if (v22 == 0.7 || (objc_msgSend(v6, "_liftDelay"), objc_msgSend(v21, "supportsAlternateLiftDelay:")))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasDragInteractionDelegate p_dragItemsAtPoint:](self, "p_dragItemsAtPoint:", v17, v19));
    dragItemsToCanvasDragItems = self->_dragItemsToCanvasDragItems;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](dragItemsToCanvasDragItems, "objectForKey:", v25));

    if (objc_msgSend(v23, "count"))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sourceObject"));
      if (v27)
      {
        objc_msgSend(v7, "setLocalContext:", v27);
      }
      else
      {
        v28 = -[CRLiOSCanvasDraggingContext initWithSourceObject:]([CRLiOSCanvasDraggingContext alloc], "initWithSourceObject:", 0);
        v36 = objc_loadWeakRetained((id *)p_icc);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layerHost"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "asiOSCVC"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "modelContainerForLocalDragContext"));
        -[CRLiOSCanvasDraggingContext setModelContainer:](v28, "setModelContainer:", v30);

        objc_msgSend(v7, "setLocalContext:", v28);
      }
      v31 = objc_loadWeakRetained((id *)p_icc);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layerHost"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "asiOSCVC"));
      objc_msgSend(v33, "dragSessionWillBegin");

    }
  }
  else
  {
    v23 = &__NSArray0__struct;
  }

  return v23;
}

- (id)p_dragItemsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  y = a3.y;
  x = a3.x;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitRep:", x, y));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = objc_loadWeakRetained((id *)p_icc);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asiOSCVC"));
  v13 = objc_msgSend(v12, "allowsSystemDragSession");

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repForDragging"));
    objc_msgSend(v14, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v29 = v14;
    if (v14
      && (objc_msgSend(v14, "shouldOverrideParentForBeginningDragAtPoint:", v14) & 1) == 0
      && (v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentRep"))) != 0)
    {
      v16 = (void *)v15;
      while (1)
      {
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dragItemsForBeginningDragOfChildRep:", v14));
        if (v17)
          break;
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "parentRep"));

        v16 = (void *)v18;
        if (!v18)
          goto LABEL_8;
      }
      v19 = (void *)v17;

    }
    else
    {
LABEL_8:
      objc_msgSend(v8, "convertNaturalPointFromUnscaledCanvas:", x, y, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dragItemsForBeginningDragAtPoint:"));
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          if (-[CRLiOSCanvasDragInteractionDelegate allowsMoveOperations](self, "allowsMoveOperations"))
            objc_msgSend(v25, "setAllowsMoveOperation:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "itemProvider"));
          v27 = objc_msgSend(objc_alloc((Class)UIDragItem), "initWithItemProvider:", v26);
          objc_msgSend(v9, "addObject:", v27);
          -[NSMapTable setObject:forKey:](self->_dragItemsToCanvasDragItems, "setObject:forKey:", v25, v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v22);
    }

  }
  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  NSMapTable *dragItemsToCanvasDragItems;
  id v6;
  void *v7;
  uint64_t (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;

  dragItemsToCanvasDragItems = self->_dragItemsToCanvasDragItems;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](dragItemsToCanvasDragItems, "objectForKey:", v6));
  v8 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "previewGeneratingBlock"));
  v9 = ((uint64_t (**)(_QWORD, id))v8)[2](v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_dragItemsToCanvasDragItems, "objectForKey:", v6));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F5C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC4E4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F5E8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate dragInteraction:prefersFullSizePreviewsForSession:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 131, 0, "invalid nil value for '%{public}s'", "canvasDragItem");

  }
  v11 = objc_msgSend(v7, "prefersFullSizePreviews");

  return v11;
}

- (BOOL)dragInteraction:(id)a3 sessionAllowsMoveOperation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_dragItemsToCanvasDragItems, "objectForKey:", v6));
  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F608);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEC580();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122F628);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasDragInteractionDelegate dragInteraction:sessionAllowsMoveOperation:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSCanvasDragInteractionDelegate.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 138, 0, "invalid nil value for '%{public}s'", "canvasDragItem");

  }
  v11 = objc_msgSend(v7, "allowsMoveOperation");

  return v11;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "items", a3, 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[NSMapTable removeObjectForKey:](self->_dragItemsToCanvasDragItems, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)allowRepsToPreventDragOnPhone
{
  return self->_allowRepsToPreventDragOnPhone;
}

- (void)setAllowRepsToPreventDragOnPhone:(BOOL)a3
{
  self->_allowRepsToPreventDragOnPhone = a3;
}

- (BOOL)allowsMoveOperations
{
  return self->_allowsMoveOperations;
}

- (void)setAllowsMoveOperations:(BOOL)a3
{
  self->_allowsMoveOperations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragItemsToCanvasDragItems, 0);
  objc_destroyWeak((id *)&self->_icc);
}

@end
