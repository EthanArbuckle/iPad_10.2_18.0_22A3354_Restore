@implementation CRLBoardItemEditor

- (CRLBoardItemEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLBoardItemEditor *v5;
  CRLBoardItemEditor *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLBoardItemEditor;
  v5 = -[CRLBoardItemEditor init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);

  return v6;
}

- (void)setBoardItems:(id)a3
{
  NSMutableDictionary *cachedSortedBoardItemsByClassName;
  id v6;

  objc_storeStrong((id *)&self->_boardItems, a3);
  v6 = a3;
  cachedSortedBoardItemsByClassName = self->_cachedSortedBoardItemsByClassName;
  self->_cachedSortedBoardItemsByClassName = 0;

}

- (id)boardItemsOfClass:(Class)a3
{
  NSSet *boardItems;
  void *v4;
  _QWORD v6[5];

  boardItems = self->_boardItems;
  if (boardItems)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1003E7CBC;
    v6[3] = &unk_10125A318;
    v6[4] = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet objectsPassingTest:](boardItems, "objectsPassingTest:", v6));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set", a3));
  }
  return v4;
}

- (id)sortedBoardItemsOfClass:(Class)a3
{
  NSMutableDictionary *v5;
  NSMutableDictionary *cachedSortedBoardItemsByClassName;
  NSString *v7;
  void *v8;
  void *v9;

  if (!self->_cachedSortedBoardItemsByClassName)
  {
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cachedSortedBoardItemsByClassName = self->_cachedSortedBoardItemsByClassName;
    self->_cachedSortedBoardItemsByClassName = v5;

  }
  v7 = NSStringFromClass(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedSortedBoardItemsByClassName, "objectForKeyedSubscript:", v8));
  if (!v9)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor p_sortedBoardItemsOfClass:](self, "p_sortedBoardItemsOfClass:", a3));
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedSortedBoardItemsByClassName, "setObject:forKeyedSubscript:", v9, v8);
  }

  return v9;
}

- (id)p_sortedBoardItemsOfClass:(Class)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItemsOfClass:](self, "boardItemsOfClass:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sortedArrayUsingComparator:", &stru_10125A358));

  return v5;
}

- (_TtC8Freeform12CRLBoardItem)anyBoardItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_self(_TtC8Freeform12CRLBoardItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  return (_TtC8Freeform12CRLBoardItem *)v6;
}

- (BOOL)currentSelectionContainsInfo:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (BOOL)isSingleBoardItemSelected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "count") == (id)1;

  return v3;
}

- (NSSet)layouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutsForInfos:", v5));

  return (NSSet *)v6;
}

- (int64_t)canPerformAction:(SEL)a3
{
  return 0;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  int64_t v23;
  unsigned int v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v6 = a4;
  if ("flipHorizontally:" != a3 && "flipVertically:" != a3)
  {
    if ("toggleAspectRatioLock:" == a3)
    {
      v25 = -[CRLBoardItemEditor p_canToggleAspectRatioLock](self, "p_canToggleAspectRatioLock");
    }
    else if ("showPreview:" == a3)
    {
      v25 = -[CRLBoardItemEditor canShowPreview](self, "canShowPreview");
    }
    else
    {
      if ("editAccessibilityDescription:" != a3 && "setAccessibilityDescription:" != a3)
      {
        if ("openItemURL:" == a3)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
          if (+[CRLURLEditor canOpenItemURLFor:](_TtC8Freeform12CRLURLEditor, "canOpenItemURLFor:", v27))
            v23 = 1;
          else
            v23 = -1;

        }
        else
        {
          v23 = 0;
        }
        goto LABEL_32;
      }
      v25 = -[CRLBoardItemEditor p_canEditAccessibilityDescription](self, "p_canEditAccessibilityDescription");
    }
    if (v25)
      v23 = 1;
    else
      v23 = -1;
    goto LABEL_32;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v13 = v11;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v15);
          *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v12).n128_u64[0];
          v19 = v18;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info", v17));
          v21 = sub_100221D0C(v19, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          if (objc_msgSend(v16, "supportsFlipping") && !objc_msgSend(v22, "locked"))
          {

            v23 = 1;
            goto LABEL_32;
          }

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  v23 = -1;
LABEL_32:

  return v23;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  return +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "showPreview:", 0);
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asiOSCVC"));

  objc_msgSend(v5, "setContextMenuMightBeDisplayed:", 0);
}

- (CRLEditorController)editorController
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));

  return (CRLEditorController *)v3;
}

- (void)setEditorController:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));

    if (v6 != v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A378);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2E9B8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125A398);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor setEditorController:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 164, 0, "Unexpected editor controller!");

    }
  }

}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v6 = a3;
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v7);
  v9 = sub_100221D0C(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasEditor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasEditorHelper"));
    v15 = -[CRLBoardItemEditor isMemberOfClass:](self, "isMemberOfClass:", objc_msgSend(v14, "editorClassForInfos:", v11));

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  *(_QWORD *)&v8 = objc_opt_class(CRLBoardItemEditor, v7).n128_u64[0];
  if (-[CRLBoardItemEditor isMemberOfClass:](self, "isMemberOfClass:", v9, v8))
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A3B8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EA3C((uint64_t)v6, v10, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A3D8);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor nextEditorForSelection:withNewEditorStack:selectionPath:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 192, 0, "There is a more specific selection on top of a plain board item editor! %@", v6);

  }
  return 0;
}

- (id)selectionWillChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5 inSelectionPath:(id)a6 withNewEditors:(id)a7
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;

  v7 = a4;
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v8);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A3F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EAEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A418);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 198, 0, "Board item editor expects a board item selection!");

  }
  return 0;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
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
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  unsigned int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  CRLBoardItemEditor *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  unsigned int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  int v51;
  _BYTE v52[128];

  v6 = a4;
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v7);
  v39 = v6;
  v9 = sub_100221D0C(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A438);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2EB70();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125A458);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 204, 0, "invalid nil value for '%{public}s'", "boardItemSelection");

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asiOSCVC"));

  v36 = v16;
  objc_msgSend(v16, "setContextMenuMightBeDisplayed:", 0);
  v38 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editingCoordinator"));

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v37 = v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mainBoard"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "id"));
        v27 = objc_msgSend(v25, "containsObject:", v26);

        if ((v27 & 1) == 0)
        {
          v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A478);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v45 = v28;
            v46 = 2082;
            v47 = "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]";
            v48 = 2082;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m";
            v50 = 1024;
            v51 = 226;
            _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Selecting an object that isn't in the document!", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125A498);
          v30 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v33 = v30;
            v34 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v45 = v28;
            v46 = 2114;
            v47 = v34;
            _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:]"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBoardItemEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 226, 0, "Selecting an object that isn't in the document!");

        }
        v23 = (char *)v23 + 1;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v21);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "boardItems"));
  -[CRLBoardItemEditor setBoardItems:](v38, "setBoardItems:", v35);

}

- (NSSet)selectedLayoutsSupportingRotation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectsPassingTest:", &stru_10125A4D8));

  return (NSSet *)v3;
}

- (BOOL)p_canToggleAspectRatioLock
{
  void *v2;
  BOOL v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(v2, "count") != 0;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "canAspectRatioLockBeChangedByUser", (_QWORD)v10))
        {
          v3 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)anyLayoutHasUnlockedAspectRatio
{
  id v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "resizeMayChangeAspectRatio", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)toggleAspectRatioLock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v9);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  v12 = v10;
  if (!v11)
    goto LABEL_12;
  v13 = v11;
  v14 = 0;
  v15 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v15)
        objc_enumerationMutation(v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i), "commandForSettingAspectRatioLocked:", -[CRLBoardItemEditor anyLayoutHasUnlockedAspectRatio](self, "anyLayoutHasUnlockedAspectRatio", (_QWORD)v19)));
      if (v17)
      {
        objc_msgSend(v5, "enqueueCommand:", v17);
        v14 = 1;
      }

    }
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  }
  while (v13);

  if ((v14 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Constrain Proportions Setting"), 0, 0));
    objc_msgSend(v5, "setCurrentGroupActionString:", v18);

LABEL_12:
  }
  objc_msgSend(v5, "closeGroup", (_QWORD)v19);

}

- (void)willResignCurrentEditor
{
  void *v2;
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layerHost"));
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  objc_msgSend(v26, "setContextMenuMightBeDisplayed:", 0);
  LODWORD(v3) = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0);
  *(_QWORD *)&v5 = objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "delegate", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentDocumentMode"));
  v10 = sub_100221D0C(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if ((_DWORD)v3 && v11)
    objc_msgSend(v11, "hideEditMenuForLassoSelection");
  *(_QWORD *)&v13 = objc_opt_class(UINavigationController, v12).n128_u64[0];
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "presentedViewController", v13));
  v17 = sub_100221D0C(v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    *(_QWORD *)&v20 = objc_opt_class(_TtC8Freeform48CRLiOSEditAccessibilityDescriptionViewController, v19).n128_u64[0];
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topViewController", v20));
    v24 = sub_100221D0C(v22, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

    if (v25)
      objc_msgSend(v25, "setIsCancelled:", 1);

  }
}

- (BOOL)canShowPreview
{
  return -[CRLBoardItemEditor hasSinglePreviewableInfo](self, "hasSinglePreviewableInfo");
}

- (void)openItemURL:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform10CRLURLItem, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "anyObject"));
  v9 = sub_100221D0C(v6, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue(v9);

  v10 = v11;
  if (v11)
  {
    +[CRLURLEditor openItemURLFor:](_TtC8Freeform12CRLURLEditor, "openItemURLFor:", v11);
    v10 = v11;
  }

}

- (BOOL)p_canEditAccessibilityDescription
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "count") == (id)1;

  return v3;
}

- (void)editAccessibilityDescription:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_time_t v10;
  _QWORD v11[5];
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));

  objc_opt_class(_TtC8Freeform10CRLURLItem, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0
    || (objc_opt_class(_TtC8Freeform11CRLFileItem, v8), (objc_opt_isKindOfClass(v5, v9) & 1) != 0))
  {
    v10 = dispatch_time(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1003E966C;
    v11[3] = &unk_10122D3D8;
    v11[4] = self;
    v12 = v5;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);

  }
  else
  {
    -[CRLBoardItemEditor launchEditAccessibilityDescriptionWithBoardItem:](self, "launchEditAccessibilityDescriptionWithBoardItem:", v5);
  }

}

- (void)setAccessibilityDescription:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  _TtC8Freeform37CRLCommandSetAccessibilityDescription *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v5 = objc_msgSend(v4, "count");

  v6 = v18;
  if (v5 == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor anyBoardItem](self, "anyBoardItem"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));

    if (v7)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "board"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "id"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getBoardItemForUUID:", v11));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessibilityDescription"));
        v14 = objc_msgSend(v18, "isEqualToString:", v13);

        if ((v14 & 1) == 0)
        {
          objc_msgSend(v9, "openGroup");
          v15 = -[CRLCommandSetAccessibilityDescription initWithBoardItem:accessibilityDescription:]([_TtC8Freeform37CRLCommandSetAccessibilityDescription alloc], "initWithBoardItem:accessibilityDescription:", v7, v18);
          objc_msgSend(v9, "enqueueCommand:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Add Accessibility Description"), 0, 0));
          objc_msgSend(v9, "setCurrentGroupActionString:", v17);

          objc_msgSend(v9, "closeGroup");
        }
      }
    }

    v6 = v18;
  }

}

- (void)flipHorizontally:(id)a3
{
  -[CRLBoardItemEditor p_flipInOrientation:](self, "p_flipInOrientation:", 0);
}

- (void)flipVertically:(id)a3
{
  -[CRLBoardItemEditor p_flipInOrientation:](self, "p_flipInOrientation:", 1);
}

- (void)p_flipInOrientation:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  objc_msgSend(v6, "openGroup");
  if ((_DWORD)v3 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Flip Vertically");
    goto LABEL_5;
  }
  if (!(_DWORD)v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    v9 = CFSTR("Flip Horizontally");
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, 0, CFSTR("UndoStrings")));

    goto LABEL_7;
  }
  v10 = 0;
LABEL_7:
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layoutForInfo:", v16));

        if (objc_msgSend(v18, "supportsFlipping"))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandToFlipWithOrientation:", v3));
          objc_msgSend(v6, "enqueueCommand:", v19);

        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "closeGroup");
}

- (id)makeSelectionSpecificMenuElements
{
  return +[NSMutableArray array](NSMutableArray, "array");
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  id obj;
  uint64_t v21;
  id v22;
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

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxValueForKey:", CFSTR("children")));
        if (objc_msgSend(v11, "count"))
        {
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v12 = v11;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (!v13)
            goto LABEL_22;
          v14 = *(_QWORD *)v24;
          while (1)
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(_QWORD *)v24 != v14)
                objc_enumerationMutation(v12);
              v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)j);
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
              if (objc_msgSend(v17, "length"))
              {
                v18 = objc_msgSend(v16, "state") == (id)1;

                if (!v18)
                  continue;
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
                objc_msgSend(v7, "addObject:", v17);
              }

            }
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            if (!v13)
            {
LABEL_22:

              goto LABEL_23;
            }
          }
        }
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
        if (!objc_msgSend(v12, "length"))
          goto LABEL_22;
        v19 = objc_msgSend(v10, "state") == (id)1;

        if (v19)
        {
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
          objc_msgSend(v7, "addObject:", v12);
          goto LABEL_22;
        }
LABEL_23:

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v22);
  }

}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = objc_msgSend(v10, "count");
  if (-[CRLBoardItemEditor p_canEditAccessibilityDescription](self, "p_canEditAccessibilityDescription"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Description"), 0, 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("figure.walk.circle")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:options:action:parent:children:", v7, v8, 1, 0x40000, "editAccessibilityDescription:", 0, 0));

    objc_msgSend(v10, "insertObject:atIndex:", v9, v5);
  }

}

- (void)addContextualMenuItemsToArray:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = objc_msgSend(v4, "documentIsSharedReadOnly");

  if (v5)
  {
    v6 = objc_alloc((Class)UIMenuItem);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Preview"), 0, 0));
    v9 = objc_msgSend(v6, "initWithTitle:action:", v8, "showPreview:");
    objc_msgSend(v10, "addObject:", v9);

  }
}

- (id)aspectRatioLockControlState
{
  void *v2;
  id v3;
  id v4;
  char v5;
  char v6;
  uint64_t v7;
  void *i;
  unsigned __int8 v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v2);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "resizeMayChangeAspectRatio");
        v5 |= v9 ^ 1;
        v6 |= v9;
        if ((v5 & 1) != 0 && (v6 & 1) != 0)
        {

          v10 = 2;
          return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v10));
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }

    if ((v5 & 1) != 0)
    {
      v10 = 1;
      return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v10));
    }
  }
  else
  {

  }
  v10 = 0;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v10));
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (NSSet)boardItems
{
  return self->_boardItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boardItems, 0);
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
  objc_storeStrong((id *)&self->_cachedSortedBoardItemsByClassName, 0);
}

- (void)enterPreviewMode
{
  CRLBoardItemEditor *v2;

  v2 = self;
  sub_10058413C();

}

- (BOOL)hasSinglePreviewableInfo
{
  CRLBoardItemEditor *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1005842AC();

  return v3 & 1;
}

- (BOOL)hasPreviewableInfos
{
  CRLBoardItemEditor *v2;
  NSSet *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  CRLBoardItemEditor *v7;
  char v8;

  v2 = self;
  v3 = -[CRLBoardItemEditor boardItems](v2, "boardItems");
  v4 = type metadata accessor for CRLBoardItem(0);
  v5 = sub_10058528C();
  v6 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v3, v4, v5);

  v7 = v2;
  sub_100584E18(v6, v7);
  LOBYTE(v3) = v8;
  swift_bridgeObjectRelease(v6);

  return v3 & 1;
}

- (void)accessibilityDescriptionEditor:(id)a3 didEndEditingWithReason:(int64_t)a4
{
  CRLBoardItemEditor *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  if (!a4)
  {
    swift_unknownObjectRetain(a3);
    v6 = self;
    v7 = objc_msgSend(a3, "accessibilityDescriptionToSubmit");
    if (!v7)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(0);
      v9 = v8;
      v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v9);
      v7 = v10;
    }
    v11 = v7;
    -[CRLBoardItemEditor setAccessibilityDescription:](v6, "setAccessibilityDescription:");
    swift_unknownObjectRelease(a3);

  }
}

- (void)launchEditAccessibilityDescriptionWithBoardItem:(id)a3
{
  id v5;
  CRLBoardItemEditor *v6;

  v5 = a3;
  v6 = self;
  sub_100584558(a3);

}

- (id)placeholderString:(id)a3
{
  _QWORD *v4;
  CRLBoardItemEditor *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_10058513C(v4);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (BOOL)handleSpacebar
{
  CRLBoardItemEditor *v2;
  unsigned __int8 v3;

  v2 = self;
  if (-[CRLBoardItemEditor canShowPreview](v2, "canShowPreview"))
    -[CRLBoardItemEditor showPreview:](v2, "showPreview:", v2);
  v3 = -[CRLBoardItemEditor canShowPreview](v2, "canShowPreview");

  return v3;
}

@end
