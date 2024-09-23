@implementation CRLiOSDragAndDropController

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *ignoringUserInteractionWrapper;
  objc_super v7;

  if (self->_itemPromiseState != 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FDA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DED134();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FDC0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 38, 0, "Did not properly clean up drag and drop!");

  }
  ignoringUserInteractionWrapper = self->_ignoringUserInteractionWrapper;
  if (ignoringUserInteractionWrapper)
    -[CRLiOSWindowIgnoreUserInteractionSafeWrapper endIgnoringUserInteractionSafely](ignoringUserInteractionWrapper, "endIgnoringUserInteractionSafely");
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSDragAndDropController;
  -[CRLDragAndDropController dealloc](&v7, "dealloc");
}

- (id)nativeProvidersForDynamicDragInsertionWithDragInfo:(id)a3
{
  return 0;
}

- (BOOL)canCreateBoardItemsFromDragInfo:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "itemSource"));
  v4 = objc_msgSend(v3, "canProduceBoardItems");

  return v4;
}

- (BOOL)shouldCleanupAfterSuccessfulDragOperation
{
  objc_super v3;

  if (self->_itemPromiseState == 2)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDragAndDropController;
  return -[CRLDragAndDropController shouldCleanupAfterSuccessfulDragOperation](&v3, "shouldCleanupAfterSuccessfulDragOperation");
}

- (BOOL)insertBoardItemsForDragInfo:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  void *v11;
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
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  id v50;
  CGFloat v51;
  CGFloat v52;
  _QWORD v53[6];
  id v54;
  CGFloat v55;
  CGFloat v56;
  _QWORD v57[5];
  id v58;
  CGFloat v59;
  CGFloat v60;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "itemSource"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "followCoordinator"));
  objc_msgSend(v13, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asiOSCVC"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "delegate"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "currentDocumentMode"));

  if (objc_msgSend(v18, "wantsToEndForDragAndDropInteractions"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "boardViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "documentModeController"));
    objc_msgSend(v20, "resetToDefaultModeAnimated:", 1);

  }
  if (objc_msgSend(v10, "hasNativeBoardItems"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editingCoordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "boardItemFactory"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100057BF0;
    v57[3] = &unk_10122FE30;
    v57[4] = self;
    v59 = x;
    v60 = y;
    v58 = v9;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:", v23, v57));

    if (!v24)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122FE50);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DED1B4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10122FE70);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 94, 0, "invalid nil value for '%{public}s'", "progress");

    }
  }
  else
  {
    v47 = v9;
    v28 = objc_msgSend(v10, "hasNativeTextStorages");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "editingCoordinator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "boardItemFactory"));
    if (v28)
    {

      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "canvasEditor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "pasteboardController"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "delegate"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sourceContextForPasteboardController:", v34));

      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472;
      v53[2] = sub_100057E74;
      v53[3] = &unk_10122FE98;
      v55 = x;
      v56 = y;
      v53[4] = v31;
      v53[5] = self;
      v54 = v47;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadTextStorageUsingBoardItemFactory:forTargetContext:targetStorage:loadHandler:", v31, v36, 0, v53));
      if (!v37)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        v46 = v36;
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122FEB8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DED248();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122FED8);
        v38 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v39, v40, 123, 0, "invalid nil value for '%{public}s'", "progress");

        v36 = v46;
      }

    }
    else
    {
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_1000580C8;
      v49[3] = &unk_10122FF28;
      v49[4] = self;
      v51 = x;
      v52 = y;
      v50 = v47;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "loadProvidersForImportedBoardItemsUsingBoardItemFactory:WithLoadHandler:", v31, v49));

      if (!v41)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122FF48);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DED2DC();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10122FF68);
        v42 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController insertBoardItemsForDragInfo:atPoint:onRep:]"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v43, v44, 155, 0, "invalid nil value for '%{public}s'", "progress");

      }
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100058350;
      v48[3] = &unk_10122D110;
      v48[4] = self;
      objc_msgSend(v10, "setCancellationHandler:", v48);

    }
    v9 = v47;
  }
  -[CRLiOSDragAndDropController p_transitionToItemPromiseState:](self, "p_transitionToItemPromiseState:", 1);

  return 1;
}

- (void)cleanupEndOfDragOperation
{
  NSObject *v3;
  unint64_t itemPromiseState;
  unint64_t v5;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;

  if (qword_10147E5E8 != -1)
    dispatch_once(&qword_10147E5E8, &stru_10122FF88);
  v3 = off_1013DB850;
  if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
  {
    itemPromiseState = self->_itemPromiseState;
    *(_DWORD *)buf = 134217984;
    v10 = itemPromiseState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "cleanupEndOfDragOperation called. item promise state %zi", buf, 0xCu);
  }
  v5 = self->_itemPromiseState;
  if (v5 <= 3 && v5 != 1)
  {
    if (qword_10147E5E8 != -1)
      dispatch_once(&qword_10147E5E8, &stru_10122FFA8);
    v7 = off_1013DB850;
    if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "actually cleaning up mac DnD infrastructure", buf, 2u);
    }
    -[CRLiOSDragAndDropController p_transitionToItemPromiseState:](self, "p_transitionToItemPromiseState:", 4);
    v8.receiver = self;
    v8.super_class = (Class)CRLiOSDragAndDropController;
    -[CRLDragAndDropController cleanupEndOfDragOperation](&v8, "cleanupEndOfDragOperation");
  }
}

- (void)p_transitionToItemPromiseState:(unint64_t)a3
{
  NSObject *v5;
  unint64_t itemPromiseState;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v11;
  void *v12;
  const char *v13;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v23;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *ignoringUserInteractionWrapper;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CRLiOSWindowIgnoreUserInteractionSafeWrapper *v29;
  int v30;
  unint64_t v31;
  __int16 v32;
  unint64_t v33;

  if (qword_10147E5E8 != -1)
    dispatch_once(&qword_10147E5E8, &stru_10122FFC8);
  v5 = off_1013DB850;
  if (os_log_type_enabled((os_log_t)off_1013DB850, OS_LOG_TYPE_DEFAULT))
  {
    itemPromiseState = self->_itemPromiseState;
    v30 = 134218240;
    v31 = itemPromiseState;
    v32 = 2048;
    v33 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "transitioning item promise state from %zi to %zi", (uint8_t *)&v30, 0x16u);
  }
  if (self->_itemPromiseState == 4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10122FFE8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DED5B0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101230008);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 190, 0, "Should not transition to a new state after we have completed a drag.");

  }
  switch(a3)
  {
    case 0uLL:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230028);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DED3B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101230048);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v10);
      v11 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
      v13 = "Should never transition to state None. That's only for starting!";
      v14 = v11;
      v15 = v12;
      v16 = 193;
      goto LABEL_46;
    case 1uLL:
      if (self->_itemPromiseState)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101230068);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DED4B0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101230088);
        v17 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 199, 0, "Should only begin waiting for promises from state None.");

      }
      v11 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)objc_claimAutoreleasedReturnValue(-[CRLDragAndDropController interactiveCanvasController](self, "interactiveCanvasController"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSWindowIgnoreUserInteractionSafeWrapper layerHost](v11, "layerHost"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "asiOSCVC"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crl_windowWrapper"));
      v23 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)objc_msgSend(v22, "newWrapperBeginningIgnoringUserInteractionSafely");
      ignoringUserInteractionWrapper = self->_ignoringUserInteractionWrapper;
      self->_ignoringUserInteractionWrapper = v23;

      break;
    case 2uLL:
      if (self->_itemPromiseState == 1)
        goto LABEL_60;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012300A8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DED530();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012300C8);
      v25 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v25);
      v11 = (CRLiOSWindowIgnoreUserInteractionSafeWrapper *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
      v13 = "Should only receive promises from state Waiting.";
      v14 = v11;
      v15 = v12;
      v16 = 205;
LABEL_46:
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, v16, 0, v13);

      break;
    case 4uLL:
      if (self->_itemPromiseState == 1)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012300E8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DED430();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101230108);
        v26 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDragAndDropController p_transitionToItemPromiseState:]"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLiOSDragAndDropController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 209, 0, "Should only receive promises from state Waiting.");

      }
      v29 = self->_ignoringUserInteractionWrapper;
      if (!v29)
        goto LABEL_60;
      -[CRLiOSWindowIgnoreUserInteractionSafeWrapper endIgnoringUserInteractionSafely](v29, "endIgnoringUserInteractionSafely");
      v11 = self->_ignoringUserInteractionWrapper;
      self->_ignoringUserInteractionWrapper = 0;
      break;
    default:
      goto LABEL_60;
  }

LABEL_60:
  self->_itemPromiseState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoringUserInteractionWrapper, 0);
}

@end
