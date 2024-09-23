@implementation CRLDragToInsertController

- (CRLDragToInsertController)initWithBoardItems:(id)a3 canvasEditor:(id)a4 atPoint:(CGPoint)a5 withPostInsertionBlock:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLDragToInsertController *v20;
  CRLDragToInsertController *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  uint64_t v29;
  id v30;
  id mPostInsertionBlock;
  NSArray *v32;
  NSArray *boardItemsToInsert;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  CRLCanvasRepDragTracker *v38;
  CRLCanvasRepDragTracker *repDragTracker;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *j;
  void *v48;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void (**v56)(_QWORD);
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  _BYTE v67[128];
  _BYTE v68[128];

  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  v13 = (void (**)(_QWORD))a6;
  if (v12)
  {
    if (v11)
      goto LABEL_22;
    goto LABEL_13;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259CB8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E2E5D0();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101259CD8);
  v14 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 47, 0, "Invalid parameter not satisfying: %{public}s", "canvasEditor != nil");

  if (!v11)
  {
LABEL_13:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259CF8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E53C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259D18);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 48, 0, "Invalid parameter not satisfying: %{public}s", "boardItemsToInsert != nil");

  }
LABEL_22:
  v66.receiver = self;
  v66.super_class = (Class)CRLDragToInsertController;
  v20 = -[CRLDragToInsertController init](&v66, "init");
  v21 = v20;
  if (v20)
  {
    v56 = v13;
    v57 = v11;
    objc_storeStrong((id *)&v20->_canvasEditor, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactiveCanvasController"));
    objc_msgSend(v22, "setIsDraggingToInsertBoardItems:", 1);
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editorController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "currentEditors"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v63;
      while (2)
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(_QWORD *)v63 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v28, "canRemainDuringDragInsert") & 1) != 0
            && (objc_msgSend(v28, "canRemainDuringDragInsert") & 1) == 0)
          {
            objc_msgSend(v55, "setSelectionPathToPopEditor:", v28);
            goto LABEL_34;
          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        if (v25)
          continue;
        break;
      }
    }
LABEL_34:

    objc_msgSend(v22, "setTemporaryAdditionalBoardItemsToDisplay:", v57);
    v29 = objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", 1, 0, 1, 1, 0x7FFFFFFFFFFFFFFFLL, x, y));
    v21->_lastPoint.x = x;
    v21->_lastPoint.y = y;
    v53 = (void *)v29;
    objc_msgSend(v12, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v57);
    if (v13)
    {
      v30 = objc_msgSend(v13, "copy");
      mPostInsertionBlock = v21->mPostInsertionBlock;
      v21->mPostInsertionBlock = v30;

      v13[2](v13);
    }
    objc_msgSend(v22, "layoutIfNeededIncludingLayerTreeIfYouKnowWhatYouAreDoing");
    v32 = (NSArray *)objc_msgSend(v57, "copy");
    boardItemsToInsert = v21->_boardItemsToInsert;
    v21->_boardItemsToInsert = v32;

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "lastObject"));
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "repForInfo:"));
    if (!v34)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259D38);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2E4A8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101259D58);
      v35 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController initWithBoardItems:canvasEditor:atPoint:withPostInsertionBlock:]"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 93, 0, "invalid nil value for '%{public}s'", "repToDrag");

    }
    v54 = v12;
    v51 = (void *)v34;
    v38 = -[CRLCanvasRepDragTracker initWithRep:]([CRLCanvasRepDragTracker alloc], "initWithRep:", v34);
    repDragTracker = v21->_repDragTracker;
    v21->_repDragTracker = v38;

    -[CRLCanvasRepDragTracker preventOpeningCommandGroupWhenCommittingChangesForReps](v21->_repDragTracker, "preventOpeningCommandGroupWhenCommittingChangesForReps");
    -[CRLCanvasRepDragTracker setIsDragInsertDrivenTracking:](v21->_repDragTracker, "setIsDragInsertDrivenTracking:", 1);
    -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](v21, "p_updateTrackerPointsAtPoint:", x, y);
    v21->_isFinishedDragging = 0;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tmCoordinator"));
    objc_msgSend(v40, "registerTrackerManipulator:", v21);
    objc_msgSend(v40, "takeControlWithTrackerManipulator:", v21);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dynamicOperationController"));
    objc_msgSend(v41, "beginOperation");
    v42 = objc_alloc_init((Class)NSMutableSet);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v43 = v57;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v45; j = (char *)j + 1)
        {
          if (*(_QWORD *)v59 != v46)
            objc_enumerationMutation(v43);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j)));
          v49 = v48;
          if (v48)
          {
            objc_msgSend(v48, "beginDragInsertFromPalette:", v21);
            objc_msgSend(v42, "addObject:", v49);
          }

        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      }
      while (v45);
    }

    objc_msgSend(v41, "startTransformingReps:", v42);
    -[CRLCanvasRepDragTracker beginShowingDragUIForInitialDragPoint:](v21->_repDragTracker, "beginShowingDragUIForInitialDragPoint:", x, y);
    objc_msgSend(v41, "handleTrackerManipulator:", v21);

    v13 = v56;
    v11 = v57;
    v12 = v54;
  }

  return v21;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->_autoscroll)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259D78);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2E664();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101259D98);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 131, 0, "must finish dragging before deallocating drag to insert controller");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLDragToInsertController;
  -[CRLDragToInsertController dealloc](&v6, "dealloc");
}

- (void)dragToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->_repDragTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1, sub_1000603B8(a3.x, a3.y, self->_lastPoint.x));
  -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](self, "p_updateTrackerPointsAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dynamicOperationController"));
  objc_msgSend(v7, "handleTrackerManipulator:", self);

  self->_lastPoint.x = x;
  self->_lastPoint.y = y;
}

- (void)p_updateTrackerPointsAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  objc_msgSend(v10, "convertUnscaledToBoundsPoint:", x, y);
  v7 = v6;
  v9 = v8;
  -[CRLCanvasRepDragTracker setLogicalDragPoint:](self->_repDragTracker, "setLogicalDragPoint:");
  -[CRLCanvasRepDragTracker setActualDragPoint:](self->_repDragTracker, "setActualDragPoint:", v7, v9);
  -[CRLCanvasRepDragTracker setShouldSnapToGuides:](self->_repDragTracker, "setShouldSnapToGuides:", 1);

}

- (void)cancelDragToInsert
{
  void *v3;
  id v4;

  -[CRLDragToInsertController p_finishDragging](self, "p_finishDragging");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  objc_msgSend(v3, "setTemporaryAdditionalBoardItemsToDisplay:", 0);

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self->_canvasEditor, "interactiveCanvasController"));
  objc_msgSend(v4, "setIsDraggingToInsertBoardItems:", 0);

}

- (void)commitDragToInsert
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  NSObject *v26;
  char *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void (**mPostInsertionBlock)(void);
  void *v40;
  CRLDragToInsertController *v41;
  NSArray *obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  unsigned int v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  const char *v61;
  _BYTE v62[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  v4 = objc_alloc_init((Class)NSMutableArray);
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v41 = self;
  obj = self->_boardItemsToInsert;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v48;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v48 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutForInfo:", v9));
        v11 = v10;
        if (v10)
        {
          if ((objc_msgSend(v10, "isInGroup") & 1) != 0)
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pureGeometry"));
          else
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pureGeometryInRoot"));
          v18 = (void *)v12;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "computeInfoGeometryFromPureLayoutGeometry:", v12));

          v17 = objc_msgSend(v16, "mutableCopy");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
          objc_msgSend(v17, "setWidthValid:", objc_msgSend(v19, "widthValid"));

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
          objc_msgSend(v17, "setHeightValid:", objc_msgSend(v20, "heightValid"));

          objc_msgSend(v9, "autosizePositionOffsetForGeometry:dynamicallyDraggedLayout:", v17, v11);
          v22 = v21;
          objc_msgSend(v17, "position");
          objc_msgSend(v17, "setPosition:", sub_1000603D0(v23, v24, v22));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v9, v17));
          objc_msgSend(v4, "addObject:", v25);

        }
        else
        {
          v13 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101259DB8);
          v14 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v53 = v13;
            v54 = 2082;
            v55 = "-[CRLDragToInsertController commitDragToInsert]";
            v56 = 2082;
            v57 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m";
            v58 = 1024;
            v59 = 175;
            v60 = 2082;
            v61 = "layout";
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101259DD8);
          v15 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v26 = v15;
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v53 = v13;
            v54 = 2114;
            v55 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLDragToInsertController commitDragToInsert]"));
          v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLDragToInsertController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 175, 0, "invalid nil value for '%{public}s'", "layout");
        }

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
    }
    while (v6);
  }

  -[CRLDragToInsertController cancelDragToInsert](v41, "cancelDragToInsert");
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "commandController"));
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v29 = v4;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(_QWORD *)v44 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "second"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "first"));
        objc_msgSend(v36, "setGeometry:", v35);

      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v31);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 1, 0, 0x7FFFFFFFFFFFFFFFLL, CGPointZero.x, CGPointZero.y));
  if (objc_msgSend(v37, "shouldEndEditing"))
    objc_msgSend(v3, "endEditing");
  objc_msgSend(v28, "openGroup");
  -[CRLCanvasEditor insertBoardItems:withInsertionContext:postProcessBlock:](v41->_canvasEditor, "insertBoardItems:withInsertionContext:postProcessBlock:", v41->_boardItemsToInsert, v37, 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](v41->_canvasEditor, "interactiveCanvasController"));
  objc_msgSend(v38, "setIsDraggingToInsertBoardItems:", 1);

  mPostInsertionBlock = (void (**)(void))v41->mPostInsertionBlock;
  if (mPostInsertionBlock)
    mPostInsertionBlock[2]();
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](v41->_canvasEditor, "interactiveCanvasController"));
  objc_msgSend(v40, "setIsDraggingToInsertBoardItems:", 0);

  objc_msgSend(v28, "closeGroup");
}

- (void)p_finishDragging
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  self->_isFinishedDragging = 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_boardItemsToInsert;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8), (_QWORD)v12));
        v10 = v9;
        if (v9)
          objc_msgSend(v9, "endDragInsertFromPalette:", self);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dynamicOperationController"));
  objc_msgSend(v11, "handleTrackerManipulator:", self);

}

- (BOOL)allowTrackerManipulatorToTakeControl:(id)a3
{
  return a3 == 0;
}

- (CRLCanvasLayoutManipulatingTracker)tracker
{
  return (CRLCanvasLayoutManipulatingTracker *)self->_repDragTracker;
}

- (BOOL)readyToEndOperation
{
  return self->_isFinishedDragging;
}

- (void)operationDidEnd
{
  CRLCanvasAutoscroll *autoscroll;

  -[CRLCanvasRepDragTracker endPossibleRepDragGesture](self->_repDragTracker, "endPossibleRepDragGesture");
  autoscroll = self->_autoscroll;
  if (autoscroll)
    -[CRLCanvasAutoscroll invalidate](autoscroll, "invalidate");
}

- (CRLInteractiveCanvasController)icc
{
  return -[CRLCanvasEditor interactiveCanvasController](self->_canvasEditor, "interactiveCanvasController");
}

- (CGPoint)autoscrollPoint
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)updateAfterAutoscroll:(id)a3
{
  double v4;
  double v5;
  CGFloat v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "lastAutoscrollDelta");
  v5 = v4;
  -[CRLCanvasRepDragTracker addUnscaledDragDelta:roundDeltaToViewScale:](self->_repDragTracker, "addUnscaledDragDelta:roundDeltaToViewScale:", 1);
  self->_lastPoint.x = sub_1000603D0(self->_lastPoint.x, self->_lastPoint.y, v5);
  self->_lastPoint.y = v6;
  -[CRLDragToInsertController p_updateTrackerPointsAtPoint:](self, "p_updateTrackerPointsAtPoint:");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLDragToInsertController icc](self, "icc"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dynamicOperationController"));
  objc_msgSend(v7, "handleTrackerManipulator:", self);

}

- (CRLCanvasAutoscroll)autoscroll
{
  return self->_autoscroll;
}

- (void)setAutoscroll:(id)a3
{
  objc_storeStrong((id *)&self->_autoscroll, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoscroll, 0);
  objc_storeStrong(&self->mPostInsertionBlock, 0);
  objc_storeStrong((id *)&self->_boardItemsToInsert, 0);
  objc_storeStrong((id *)&self->_canvasEditor, 0);
  objc_storeStrong((id *)&self->_repDragTracker, 0);
}

@end
