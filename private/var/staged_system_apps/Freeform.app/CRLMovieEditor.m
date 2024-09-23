@implementation CRLMovieEditor

+ (id)keyPathsForValuesAffectingPlayableBoardItems
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("boardItems"));
}

- (_TtC8Freeform12CRLMovieItem)anyMovieItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_self(_TtC8Freeform12CRLMovieItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return (_TtC8Freeform12CRLMovieItem *)v6;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int64_t v7;
  objc_super v9;

  v6 = a4;
  if (sel_isEqual(a3, "saveDefaultInsertionPreset:"))
  {
    if (-[CRLMovieEditor p_canSaveDefaultMoviePreset](self, "p_canSaveDefaultMoviePreset"))
      v7 = 1;
    else
      v7 = -1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLMovieEditor;
    v7 = -[CRLMediaEditor canPerformEditorAction:withSender:](&v9, "canPerformEditorAction:withSender:", a3, v6);
  }

  return v7;
}

- (void)setMovieVolume:(double)a3
{
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  void *v9;
  CRLCanvasCommandSelectionBehavior *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  float v15;
  void *v16;
  uint64_t v17;
  _TtC8Freeform24CRLCommandSetMovieVolume *v18;
  double v19;
  _TtC8Freeform24CRLCommandSetMovieVolume *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  v10 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v7, "initWithCanvasEditor:", v9);

  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v10);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    v15 = a3;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16);
        v18 = [_TtC8Freeform24CRLCommandSetMovieVolume alloc];
        *(float *)&v19 = v15;
        v20 = -[CRLCommandSetMovieVolume initWithMovieItem:volume:](v18, "initWithMovieItem:volume:", v17, v19);
        objc_msgSend(v6, "enqueueCommand:", v20);

        v16 = (char *)v16 + 1;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "closeGroup");
}

- (void)setPropertyValue:(id)a3 forMovieProperty:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  CRLCanvasCommandSelectionBehavior *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v6 = a3;
  if (a4 == 43 || a4 == 40)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B4B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2FFDC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B4D8);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor setPropertyValue:forMovieProperty:]"));
    v9 = (CRLCanvasCommandSelectionBehavior *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 105, 0, "We need to set the poster time and the poster image together. The poster image is a board item asset so it is async so we'll have to wait until we have both, then use CRLCommandSetMoviePosterTime.");
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));

    v11 = [CRLCanvasCommandSelectionBehavior alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasEditor"));
    v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v11, "initWithCanvasEditor:", v13);

    objc_msgSend(v8, "openGroupWithSelectionBehavior:", v9);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCommandSetMovieValue movieSetValueCommandWithMovie:property:boxedValue:](_TtC8Freeform23CRLCommandSetMovieValue, "movieSetValueCommandWithMovie:property:boxedValue:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), a4, v6));
          objc_msgSend(v8, "enqueueCommand:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    objc_msgSend(v8, "closeGroup");
  }

}

- (void)willBeginChangingTimePropertyForMovieItem:(id)a3 withLocalizedMessage:(id)a4 cancelHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  CRLModalOperationToken *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[5];

  v7 = a4;
  v8 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B4F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E300FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B518);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor willBeginChangingTimePropertyForMovieItem:withLocalizedMessage:cancelHandler:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 125, 0, "This operation must only be performed on the main thread.");

  }
  v12 = *(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1);
  if (!v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B538);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3005C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B558);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor willBeginChangingTimePropertyForMovieItem:withLocalizedMessage:cancelHandler:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 130, 0, "expected nil value for '%{public}s'", "_modalOperationToken");

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layerHost"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1004024C8;
    v25[3] = &unk_10122D110;
    v25[4] = self;
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "beginModalOperationWithLocalizedMessage:progress:cancelHandler:", v7, 0, v25));
    v19 = *(void **)((char *)&self->_timePropertyUpdatingCount + 1);
    *(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1) = v18;

    v12 = *(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1);
  }
  *(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1) = v12 + 1;
  if (v8)
  {
    v20 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
    if (!v20)
    {
      v21 = (CRLModalOperationToken *)objc_alloc_init((Class)NSMutableArray);
      v22 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
      *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1) = v21;

      v20 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
    }
    v23 = objc_msgSend(v8, "copy");
    v24 = objc_retainBlock(v23);
    objc_msgSend(v20, "addObject:", v24);

  }
}

- (void)didEndChangingTimePropertyForMovieItem:(id)a3 withCommand:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  NSMutableArray *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;
  __CFRunLoop *Main;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *i;
  uint64_t v46;
  id v47;
  _QWORD v48[5];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];

  v7 = a4;
  v8 = a5;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B578);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3029C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B598);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 152, 0, "This operation must only be performed on the main thread.");

  }
  if (*(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1))
    goto LABEL_21;
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B5B8);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E3021C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10125B5D8);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 154, 0, "didEndChangingTimePropertyForMovieItem called without matching willBeginChangingTimePropertyForMovieItem");

  if (*(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1))
  {
LABEL_21:
    v15 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
    if (v7)
    {
      v16 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
      if (!v16)
      {
        v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v18 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
        *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1) = v17;

        v16 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
      }
      objc_msgSend(v16, "addObject:", v7);
    }
    if (v8)
    {
      v19 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      if (!v19)
      {
        v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v21 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
        *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1) = v20;

        v19 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      }
      objc_msgSend(v19, "addObject:", v8);
    }
    v22 = *(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1) - 1;
    *(_QWORD *)(&self->super.super.mIsChangingStrokeWidth + 1) = v22;
    if (!v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1))
        goto LABEL_40;
      LODWORD(v46) = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B5F8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E3017C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B618);
      v24 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor didEndChangingTimePropertyForMovieItem:withCommand:error:]"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 176, 0, "invalid nil value for '%{public}s'", "_modalOperationToken", v46);

      if (*(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1))
      {
LABEL_40:
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "layerHost"));
        objc_msgSend(v27, "endModalOperationWithToken:", *(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1));

        v28 = *(void **)((char *)&self->_timePropertyUpdatingCount + 1);
        *(unint64_t *)((char *)&self->_timePropertyUpdatingCount + 1) = 0;

      }
      if (!BYTE1(self->_timePropertyUpdatingErrors))
      {
        v36 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
        if (v36)
        {
          v37 = objc_msgSend(v36, "count");
          if (v37)
          {
            v38 = v37;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commandController"));
            v40 = v39;
            v47 = v38;
            if (v38 != (id)1)
              objc_msgSend(v39, "openGroup");
            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            v41 = *(id *)((char *)&self->_timePropertyUpdatingCancelHandlers + 1);
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v43; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v51 != v44)
                    objc_enumerationMutation(v41);
                  objc_msgSend(v40, "enqueueCommand:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i));
                }
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
              }
              while (v43);
            }

            if (v47 != (id)1)
              objc_msgSend(v40, "closeGroup");

            v15 = &OBJC_IVAR___CRLShapeLayout_mClippedPathRotatedTransform;
          }
        }
      }
      v29 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      if (v29 && objc_msgSend(v29, "count"))
      {
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100402D78;
        v48[3] = &unk_10122D3D8;
        v48[4] = self;
        v49 = v23;
        v30 = v48;
        Main = CFRunLoopGetMain();
        CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v30);
        CFRunLoopWakeUp(Main);

      }
      v32 = *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1);
      *(CRLModalOperationToken **)((char *)&self->_modalOperationToken + 1) = 0;

      v33 = v15[283];
      v34 = *(Class *)((char *)&self->super.super.super.super.isa + v33);
      *(Class *)((char *)&self->super.super.super.super.isa + v33) = 0;

      v35 = *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1);
      *(NSMutableArray **)((char *)&self->_timePropertyUpdatingCommands + 1) = 0;

      BYTE1(self->_timePropertyUpdatingErrors) = 0;
    }
  }

}

- (BOOL)p_canSaveDefaultMoviePreset
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLMovieItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (objc_msgSend(v10, "count") == (id)1)
    v11 = objc_msgSend(v9, "isAudioOnly") ^ 1;
  else
    LOBYTE(v11) = 0;

  return v11;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _TtC8Freeform40CRLCommandSetDefaultMovieInsertionPreset *v17;
  void *v18;
  void *v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", a3));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B638);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E3031C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B658);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLMovieEditor saveDefaultInsertionPreset:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLMovieEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 227, 0, "Only should save default style with a single object selected!");

  }
  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLMovieItem, v6).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
  v15 = sub_1002223BC(v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    v17 = -[CRLCommandSetDefaultMovieInsertionPreset initWithMovieItem:]([_TtC8Freeform40CRLCommandSetDefaultMovieInsertionPreset alloc], "initWithMovieItem:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandController"));
    objc_msgSend(v19, "enqueueCommand:", v17);

  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CRLMovieEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v29, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v9 = objc_msgSend(v8, "count");

  if ((unint64_t)v9 <= 1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieEditor anyMovieItem](self, "anyMovieItem"));
    v11 = objc_msgSend(v10, "isAudioOnly");

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = v12;
    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Modify Audio"), 0, 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("speaker.wave.2")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v14, v15, 2, 256));

      objc_msgSend(v16, "setTag:", 9);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("Replace this audio file");
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Modify Movie"), 0, 0));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("film")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v20, v21, 2, 512));

      objc_msgSend(v16, "setTag:", 10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = v17;
      v19 = CFSTR("Replace this video or reset to original size");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v19, 0, 0));
    objc_msgSend(v16, "setToolTip:", v22);

    objc_msgSend(v7, "insertObject:atIndex:", v16, objc_msgSend(v7, "count"));
    if (-[CRLBoardItemEditor canShowPreview](self, "canShowPreview"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("Preview"), 0, 0));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("eye")));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:](CRLQuickInspectorElement, "elementWithName:image:type:action:", v24, v25, 2, "showPreview:"));

      objc_msgSend(v26, "setTag:", 19);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMovieEditor anyMovieItem](self, "anyMovieItem"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "previewTooltip"));
      objc_msgSend(v26, "setToolTip:", v28);

      objc_msgSend(v7, "addObject:", v26);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCommands + 1), 0);
  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCancelHandlers + 1), 0);
  objc_storeStrong((id *)((char *)&self->_modalOperationToken + 1), 0);
  objc_storeStrong((id *)((char *)&self->_timePropertyUpdatingCount + 1), 0);
}

@end
