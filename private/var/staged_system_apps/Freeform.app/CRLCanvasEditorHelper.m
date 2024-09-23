@implementation CRLCanvasEditorHelper

- (CRLCanvasEditorHelper)initWithCanvasEditor:(id)a3
{
  id v4;
  CRLCanvasEditorHelper *v5;
  CRLCanvasEditorHelper *v6;
  CRLKeyboardMovementManipulator *v7;
  id WeakRetained;
  void *v9;
  CRLKeyboardMovementManipulator *v10;
  CRLKeyboardMovementManipulator *mKeyboardManipulator;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRLCanvasEditorHelper;
  v5 = -[CRLCanvasEditorHelper init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mCanvasEditor, v4);
    v6->mTornDown = 0;
    v7 = [CRLKeyboardMovementManipulator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&v6->mCanvasEditor);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "interactiveCanvasController"));
    v10 = -[CRLKeyboardMovementManipulator initWithInteractiveCanvasController:](v7, "initWithInteractiveCanvasController:", v9);
    mKeyboardManipulator = v6->mKeyboardManipulator;
    v6->mKeyboardManipulator = v10;

  }
  return v6;
}

- (CRLCanvasEditor)canvasEditor
{
  return (CRLCanvasEditor *)objc_loadWeakRetained((id *)&self->mCanvasEditor);
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  return (CRLInteractiveCanvasController *)v3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (id)keyboardMovementManipulator
{
  return self->mKeyboardManipulator;
}

- (id)pasteboardController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "pasteboardController"));

  return v3;
}

- (void)teardown
{
  self->mTornDown = 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (!self->mTornDown)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012424F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09028();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242518);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper dealloc]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 162, 0, "Need to call teardown on the editor helper");

  }
  v6.receiver = self;
  v6.super_class = (Class)CRLCanvasEditorHelper;
  -[CRLCanvasEditorHelper dealloc](&v6, "dealloc");
}

- (BOOL)isLayoutSelectable:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isSelectable"))
    goto LABEL_6;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "info", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editingCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainBoard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "id"));
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if ((v16 & 1) == 0)
    {

LABEL_6:
      v21 = 0;
      goto LABEL_7;
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editingCoordinator"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "followCoordinator"));
  v20 = objc_msgSend(v19, "isFollowing");

  v21 = v20 ^ 1;
LABEL_7:

  return v21;
}

+ (Class)selectionClass
{
  return (Class)objc_opt_class(CRLCanvasSelection, a2);
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  objc_class *v14;
  uint64_t v15;
  objc_class *v16;
  double v17;
  uint64_t v18;
  id v19;
  void *v20;
  CRLPathEditor *v21;
  uint64_t v22;
  id v23;
  CRLPathEditor *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v35;

  v6 = a3;
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v7);
  v9 = sub_100221D0C(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12 = v10;
  if (!v10)
  {
    objc_opt_class(CRLPathSelection, v11);
    v23 = sub_100221D0C(v22, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (v13)
    {
      v24 = [CRLPathEditor alloc];
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      v21 = -[CRLBoardItemEditor initWithInteractiveCanvasController:](v24, "initWithInteractiveCanvasController:", v25);

      goto LABEL_28;
    }
    if (v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242538);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E090A8();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242558);
      v33 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper nextEditorForSelection:withNewEditorStack:selectionPath:]"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      v35 = v6;
      v29 = "Can't build an editor from the canvas editor with something that isn't a CRLBoardItemSelection (received %@)";
      v30 = v27;
      v31 = v28;
      v32 = 210;
      goto LABEL_26;
    }
LABEL_27:
    v21 = 0;
    goto LABEL_28;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItems"));
  v14 = -[CRLCanvasEditorHelper editorClassForInfos:](self, "editorClassForInfos:", v13);
  if (!v14)
    goto LABEL_27;
  v16 = v14;
  *(_QWORD *)&v17 = objc_opt_class(CRLBoardItemEditor, v15).n128_u64[0];
  if (!-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", v18, v17))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242578);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09130();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242598);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper nextEditorForSelection:withNewEditorStack:selectionPath:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    v29 = "Unknown editor class";
    v30 = v27;
    v31 = v28;
    v32 = 226;
LABEL_26:
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, v32, 0, v29, v35);

    goto LABEL_27;
  }
  v19 = [v16 alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v21 = (CRLPathEditor *)objc_msgSend(v19, "initWithInteractiveCanvasController:", v20);

  -[CRLBoardItemEditor setBoardItems:](v21, "setBoardItems:", v13);
LABEL_28:

  return v21;
}

- (Class)editorClassForInfos:(id)a3
{
  return -[CRLCanvasEditorHelper p_editorClassForBoardItems:shouldIgnoreLockedState:](self, "p_editorClassForBoardItems:shouldIgnoreLockedState:", a3, 0);
}

- (Class)p_editorClassForBoardItems:(id)a3 shouldIgnoreLockedState:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
    v7 = objc_msgSend(v6, "editorClass");

    if (v7)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v13, "locked", (_QWORD)v25) && !a4)
            {
              objc_opt_class(CRLLockedDrawableEditor, v14);
              v7 = v22;
              goto LABEL_23;
            }
            v15 = objc_msgSend(v13, "editorClass");
            if (!v15)
              goto LABEL_21;
            v16 = v15;
            if ((objc_msgSend(v15, "isSubclassOfClass:", v7) & 1) == 0 && v16 != v7)
            {
              v7 = objc_msgSend(v7, "superclass");
              if ((objc_msgSend(v16, "isSubclassOfClass:", v7) & 1) == 0)
              {
                do
                  v7 = objc_msgSend(v7, "superclass");
                while (!objc_msgSend(v16, "isSubclassOfClass:", v7));
              }
              objc_opt_class(CRLBoardItemEditor, v17);
              if (v19 != v7)
              {
                *(_QWORD *)&v20 = objc_opt_class(CRLBoardItemEditor, v18).n128_u64[0];
                if (!objc_msgSend(v7, "isSubclassOfClass:", v21, v20))
                {
LABEL_21:
                  v7 = 0;
                  goto LABEL_23;
                }
              }
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_23:

    }
  }
  else
  {
    v7 = 0;
  }
  v23 = (objc_class *)v7;

  return v23;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  return +[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "deselectAll:", 0);
}

- (id)selectionPathWithInfo:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:"));
  }
  return v5;
}

- (id)selectionPathWithInfos:(id)a3
{
  id v3;
  id v4;
  __objc2_prot **v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  NSObject *v10;
  __objc2_prot **v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  unsigned int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = &off_1012C6000;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v7);
        if ((objc_msgSend(v8, "conformsToProtocol:", v5[232]) & 1) == 0)
        {
          v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012425B8);
          v10 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v29 = v9;
            v30 = 2082;
            v31 = "-[CRLCanvasEditorHelper selectionPathWithInfos:]";
            v32 = 2082;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m";
            v34 = 1024;
            v35 = 293;
            v36 = 2112;
            v37 = v8;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012425D8);
          v11 = v5;
          v12 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v15 = v12;
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v29 = v9;
            v30 = 2114;
            v31 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathWithInfos:]"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 293, 0, "Cannot make a selection path with an object that is not a <CRLCanvasElementInfo> (%@)", v8);

          v5 = v11;
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    }
    while (v4);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionModelTranslatorForInteractiveCanvasController:", v17));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPathForInfos:", obj));

  return v20;
}

- (id)canvasSelectionPathIncludingInfo:(id)a3
{
  return -[CRLCanvasEditorHelper p_canvasSelectionPathChangingInfo:shouldExclude:](self, "p_canvasSelectionPathChangingInfo:shouldExclude:", a3, 0);
}

- (id)canvasSelectionPathExcludingInfo:(id)a3
{
  return -[CRLCanvasEditorHelper p_canvasSelectionPathChangingInfo:shouldExclude:](self, "p_canvasSelectionPathChangingInfo:shouldExclude:", a3, 1);
}

- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4
{
  return -[CRLCanvasEditorHelper selectionPathByReplacingInfosInSelectionPath:withInfos:preservingMultipleContainers:](self, "selectionPathByReplacingInfosInSelectionPath:withInfos:preservingMultipleContainers:", a3, a4, 0);
}

- (id)selectionPathByReplacingInfosInSelectionPath:(id)a3 withInfos:(id)a4 preservingMultipleContainers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  _TtC8Freeform21CRLBoardItemSelection *v10;
  CRLCanvasSelection *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[CRLCanvasEditorHelper p_editorClassForBoardItems:shouldIgnoreLockedState:](self, "p_editorClassForBoardItems:shouldIgnoreLockedState:", v9, 0))
  {
    v10 = -[CRLBoardItemSelection initWithBoardItems:]([_TtC8Freeform21CRLBoardItemSelection alloc], "initWithBoardItems:", v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_alloc_init(CRLCanvasSelection);
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionModelTranslator"));

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containerToInsertIntoForSelectionPath:", v12));
  v18 = (void *)v16;
  if (v5)
  {
    *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v17).n128_u64[0];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mostSpecificSelectionOfClass:", v20, v19));
    if (v22
      && (objc_opt_class(_TtC8Freeform17CRLGroupSelection, v21),
          (objc_opt_isKindOfClass(v22, v23) & 1) == 0))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathPoppingOffSelection:", v22));

    }
    else
    {
      v24 = v12;
    }
  }
  else
  {
    if (v16
      && (objc_opt_class(_TtC8Freeform12CRLGroupItem, v17), (objc_opt_isKindOfClass(v18, v25) & 1) != 0)
      && (v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects")),
          v27 = -[CRLCanvasEditorHelper canInsertBoardItems:intoGroup:](self, "canInsertBoardItems:intoGroup:", v26, v18), v26, v27))
    {
      v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathForNothingSelectedInsideGroup:", v18));
    }
    else
    {
      v28 = objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", 0));
    }
    v24 = (void *)v28;
    v22 = v12;
  }

  *(_QWORD *)&v30 = objc_opt_class(CRLCanvasSelection, v29).n128_u64[0];
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "mostSpecificSelectionOfClass:", v31, v30));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v32, v11));
  v34 = v33;
  if (v10)
    v35 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "selectionPathWithAppendedSelection:", v10));
  else
    v35 = v33;
  v36 = v35;

  return v36;
}

- (id)selectionPathForInsertingBoardItems:(id)a3 byReplacingInfosInSelectionPath:(id)a4 preservingMultipleContainers:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  void *v33;
  _TtC8Freeform17CRLGroupSelection *v34;
  void *v35;
  _TtC8Freeform21CRLBoardItemSelection *v36;
  void *v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v5 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathByReplacingInfosInSelectionPath:withInfos:preservingMultipleContainers:](self, "selectionPathByReplacingInfosInSelectionPath:withInfos:preservingMultipleContainers:", a4, v8, v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingToolkit"));
  LODWORD(self) = objc_msgSend(v11, "isInDrawingMode");

  if ((_DWORD)self)
  {
    v39 = objc_msgSend(v8, "count");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v16);
          if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
          {
            v23 = v14;
            goto LABEL_35;
          }
          objc_msgSend(v12, "addObject:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "childItems"));
          objc_msgSend(v13, "addObjectsFromArray:", v22);

        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (v39 && objc_msgSend(v13, "count"))
    {
      v23 = v9;
      *(_QWORD *)&v25 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v24).n128_u64[0];
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mostSpecificSelectionOfClass:", v26, v25));
      v28 = v27;
      if (v27)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "boardItems"));
        v30 = objc_msgSend(v29, "isEqual:", v14);

        if ((v30 & 1) == 0)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242638);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E0923C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242658);
          v31 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathForInsertingBoardItems:byReplacingInfosInSelectionPath:preservingMultipleContainers:]"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 392, 0, "the default selection should be pointing at the boardItems we're trying to insert");

        }
        v34 = -[CRLGroupSelection initWithContainerGroups:hasSelectedItemsInNonGroupContainer:]([_TtC8Freeform17CRLGroupSelection alloc], "initWithContainerGroups:hasSelectedItemsInNonGroupContainer:", v12, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectionPathReplacingMostSpecificLocationOfSelection:withSelection:", v28, v34));
        v36 = -[CRLBoardItemSelection initWithBoardItems:]([_TtC8Freeform21CRLBoardItemSelection alloc], "initWithBoardItems:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "selectionPathWithAppendedSelection:", v36));

      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012425F8);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E091B0();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101242618);
        v37 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v37);
        v34 = (_TtC8Freeform17CRLGroupSelection *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper selectionPathForInsertingBoardItems:byReplacingInfosInSelectionPath:preservingMultipleContainers:]"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 390, 0, "invalid nil value for '%{public}s'", "boardItemSelection");
        v9 = v23;
      }

LABEL_35:
    }

  }
  return v9;
}

- (id)p_canvasSelectionPathChangingInfo:(id)a3 shouldExclude:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v31;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infosForSelectionPath:", v9));

  v12 = objc_msgSend(v11, "mutableCopy");
  *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v13).n128_u64[0];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mostSpecificSelectionOfClass:", v15, v14));
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "boardItems"));
    v19 = objc_msgSend(v18, "isEqual:", v11);

    if (v19)
    {
      v20 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));

      v12 = (id)v20;
    }
  }
  if (!v12)
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  if (v4)
    objc_msgSend(v12, "removeObject:", v6);
  else
    objc_msgSend(v12, "addObject:", v6);
  v21 = objc_msgSend(v12, "count");
  if (!v17 || v21)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", v12));
  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "selectionModelTranslator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "containerGroups"));
    v24 = v9;
    v25 = v11;
    v26 = v8;
    v27 = v6;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "selectionPathForNothingSelectedInsideGroup:", v28));

    v6 = v27;
    v8 = v26;
    v11 = v25;
    v9 = v24;

  }
  return v29;
}

- (BOOL)shouldAllowPotentiallyKeyboardBasedActionForSender:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  id v7;
  unsigned int v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  v8 = objc_msgSend(v7, "physicalKeyboardIsSender:", v4, v6);

  if (!v8)
    return 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = objc_msgSend(v9, "shouldAllowKeyCommands");

  return v10;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___CRLiOSPhysicalKeyboardAwareSender))
    v4 = objc_msgSend(v3, "crl_representsPhysicalKeyboard");
  else
    v4 = 1;

  return v4;
}

- (BOOL)canPasteWithItemSource:(id)a3 sender:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;

  v5 = a3;
  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper pasteboardController](self, "pasteboardController"));

    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242678);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E092BC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242698);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper canPasteWithItemSource:sender:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 478, 0, "invalid nil value for '%{public}s'", "self.pasteboardController");

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper pasteboardController](self, "pasteboardController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ingestibleItemSourceForPasteboard:", v11));

  }
  v12 = objc_msgSend(v5, "canProduceBoardItems");

  return v12;
}

- (int64_t)canvasEditorCanPerformDeleteAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;

  v6 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if ((objc_msgSend(v7, "canvasEditorCanDeleteWithSender:", v6) & ("delete:" == a3)) != 0)
      v8 = 1;
    else
      v8 = -1;

  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformCopyAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a4;
  v7 = -1;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v6)&& "copy:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v8, "canvasEditorCanCopyWithSender:", v6))
      v7 = 1;
    else
      v7 = -1;

  }
  return v7;
}

- (int64_t)canvasEditorCanPerformCopyStyleAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  int64_t v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = objc_msgSend(v6, "canvasEditorCanCopyStyleWithSender:", v5);

  if (v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (int64_t)canvasEditorCanPerformCutAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  int64_t v8;

  v5 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v7 = objc_msgSend(v6, "canvasEditorCanCutWithSender:", v5);

    if (v7)
      v8 = 1;
    else
      v8 = -1;
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (int64_t)canvasEditorCanPerformPasteAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;

  v6 = a4;
  v7 = -1;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v6)&& "paste:" == a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v8, "canvasEditorCanPasteWithSender:", v6))
      v7 = 1;
    else
      v7 = -1;

  }
  return v7;
}

- (int64_t)canvasEditorCanPerformPasteAsPlainTextAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v6, "canvasEditorCanPasteAsPlainTextWithSender:", v5))
      v7 = 1;
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformPasteValuesAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v6, "canvasEditorCanPasteValuesWithSender:", v5))
      v7 = 1;
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformPastePreservingFormulasAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v6, "canvasEditorCanPasteWithSender:", v5))
      v7 = 1;
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int64_t)canvasEditorCanPerformDuplicateAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  uint64_t v7;
  double v8;
  id v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  int64_t v15;

  v6 = a4;
  *(_QWORD *)&v8 = objc_opt_class(self, v7).n128_u64[0];
  v10 = objc_msgSend(v9, "physicalKeyboardIsSender:", v6, v8);
  v11 = -[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v6);
  v12 = objc_msgSend(v6, "isEqual:", CFSTR("CRLMiniFormatter"));
  if (v11)
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if ((objc_msgSend(v14, "canvasEditorCanDuplicateWithSender:", v6) & (v10 | v13) & ("duplicate:" == a3)) != 0)
      v15 = 1;
    else
      v15 = -1;

  }
  else
  {
    v15 = -1;
  }

  return v15;
}

- (int64_t)canvasEditorCanPerformSelectAllAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v6, "canvasEditorCanSelectAllWithSender:", v5))
      v7 = 1;
    else
      v7 = -1;

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (BOOL)allowSelectAllForSender:(id)a3 hasNothingVisiblySelected:(BOOL)a4 hasAtLeastOneThingToSelect:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  BOOL v16;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "interactiveCanvasController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asiOSCVC"));
    if (objc_msgSend(v12, "allowedToEnterQuickSelectMode"))
    {
      objc_opt_class(UICommand, v13);
      isKindOfClass = objc_opt_isKindOfClass(v8, v14);
    }
    else
    {
      isKindOfClass = 1;
    }

    if (v6 && (isKindOfClass & 1) != 0)
      v16 = 1;
    else
      v16 = +[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int64_t)canvasEditorCanPerformDeselectAllAction:(SEL)a3 withSender:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  int64_t v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = objc_msgSend(v6, "canvasEditorCanDeselectAllWithSender:", v5);

  if (v7)
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

- (int64_t)canvasEditorCanPerformGroupActionWithSender:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int64_t v19;
  void *i;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  if (-[CRLCanvasEditorHelper shouldAllowPotentiallyKeyboardBasedActionForSender:](self, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v4)&& (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController")), v6 = objc_msgSend(v5, "documentIsSharedReadOnly"), v5, (v6 & 1) == 0)&& (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor")), v8 = objc_msgSend(v7, "canvasEditorCanGroupWithSender:", v4), v7, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItemsForSelectionPath:", v13));

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      v19 = 1;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "containingGroup", (_QWORD)v26));
          v22 = v21;
          if (v21)
          {
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "childInfos"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v23));

            LOBYTE(v23) = objc_msgSend(v24, "isEqualToSet:", v15);
            if ((v23 & 1) != 0)
            {

              v19 = -1;
              goto LABEL_18;
            }
          }

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v17)
          continue;
        break;
      }
    }
    else
    {
      v19 = 1;
    }
LABEL_18:

  }
  else
  {
    v19 = -1;
  }

  return v19;
}

- (int64_t)canvasEditorCanPerformUngroupActionWithSender:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  int64_t v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "documentIsSharedReadOnly");

  if ((v6 & 1) != 0)
  {
    v7 = -1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    if (objc_msgSend(v8, "canvasEditorCanUngroupWithSender:", v4))
      v7 = 1;
    else
      v7 = -1;

  }
  return v7;
}

- (int64_t)canvasEditorCanPerformConnectWithConnectionLineAction:(SEL)a3 withSender:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosToConnect"));
  if (objc_msgSend(v6, "count") == (id)2)
    v7 = 1;
  else
    v7 = -1;

  return v7;
}

- (int64_t)canvasEditorCanPerformAlignAction:(SEL)a3 withSender:(id)a4
{
  void *v5;
  int64_t v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3, a4));
  if ((objc_msgSend(v5, "documentIsSharedReadOnly") & 1) != 0)
  {
    v6 = -1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute"));
    if ((unint64_t)objc_msgSend(v7, "count") > 1)
      v6 = 1;
    else
      v6 = -1;

  }
  return v6;
}

- (int64_t)canvasEditorCanPerformDistributeActionWithSender:(id)a3
{
  void *v4;
  int64_t v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  if ((objc_msgSend(v4, "documentIsSharedReadOnly") & 1) != 0)
  {
    v5 = -1;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute"));
    if ((unint64_t)objc_msgSend(v6, "count") > 2)
      v5 = 1;
    else
      v5 = -1;

  }
  return v5;
}

- (BOOL)canPerformMaskWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v8));

  if (objc_msgSend(v9, "count") == (id)1)
  {
    *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform12CRLImageItem, v10).n128_u64[0];
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject", v11));
    v15 = sub_100221D0C(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    if (v16 && (objc_msgSend(v16, "locked") & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImageProviderPool sharedPool](CRLImageProviderPool, "sharedPool"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageAssetPayload"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "providerForAsset:shouldValidate:", v19, 1));

      v17 = objc_msgSend(v20, "isError") ^ 1;
    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (BOOL)canPerformUnmaskWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v8));

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));
    objc_opt_class(_TtC8Freeform12CRLImageItem, v11);
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && (objc_msgSend(v10, "locked") & 1) == 0)
      v13 = objc_msgSend(v10, "maskCanBeReset");
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)canPerformMaskWithShapeWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v8));

  if (objc_msgSend(v9, "count") == (id)2
    && (objc_msgSend(v4, "hasSelectedInfosInMultipleContainers") & 1) == 0)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = v9;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v12)
    {
      v14 = v12;
      v35 = 0;
      v15 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          objc_opt_class(_TtC8Freeform12CRLBoardItem, v13);
          v19 = sub_100221D0C(v18, v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (v20 && (objc_msgSend(v20, "locked") & 1) == 0)
          {
            objc_opt_class(_TtC8Freeform12CRLImageItem, v22);
            v24 = sub_100221D0C(v23, v17);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            *(_QWORD *)&v27 = objc_opt_class(CRLShapeRep, v26).n128_u64[0];
            v29 = v28;
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForInfo:", v21, v27));
            v31 = sub_100221D0C(v29, v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

            if (v25)
            {
              BYTE4(v35) = 1;
            }
            else if (v32)
            {
              LOBYTE(v35) = objc_msgSend(v32, "canBeUsedForImageMask");
            }

          }
        }
        v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v14);
    }
    else
    {
      v35 = 0;
    }

    v10 = BYTE4(v35) & v35;
    v9 = v34;
  }
  else
  {
    v10 = 0;
  }

  return v10 & 1;
}

- (BOOL)canPerformMaskWithShapeTypeWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v8));

  if (objc_msgSend(v9, "count") == (id)1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v9;
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          objc_opt_class(_TtC8Freeform12CRLImageItem, v11);
          v17 = sub_100221D0C(v16, v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
          v19 = v18;
          if (v18 && (objc_msgSend(v18, "locked", (_QWORD)v21) & 1) == 0)
          {

            LOBYTE(v12) = 1;
            goto LABEL_14;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return (char)v12;
}

- (int64_t)canvasEditorCanPerformLockAction:(SEL)a3 withSender:(id)a4
{
  void *v6;
  unsigned __int8 v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3, a4));
  v7 = objc_msgSend(v6, "documentIsSharedReadOnly");

  if ((v7 & 1) != 0)
    return -1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardItemsForSelectionPath:", v13));

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper drawablesToLockOrUnlockForInfos:](self, "drawablesToLockOrUnlockForInfos:", v14));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v28;
    while (2)
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v20);
        objc_opt_class(_TtC8Freeform12CRLBoardItem, v17);
        v23 = sub_100221D0C(v22, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = v24;
        if (v24
          && ("lock:" == a3) != objc_msgSend(v24, "locked", (_QWORD)v27)
          && objc_msgSend(v25, "isLockable"))
        {

          v8 = 1;
          goto LABEL_15;
        }

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v18)
        continue;
      break;
    }
  }
  v8 = -1;
LABEL_15:

  return v8;
}

- (BOOL)canUngroupWithSelection:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "infosOfClass:", v7, v6, 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        if (-[CRLCanvasEditorHelper canUngroupGroupInfo:](self, "canUngroupGroupInfo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i)))
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)canUngroupGroupInfo:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isFreehandDrawing") & 1) == 0)
    v5 = objc_msgSend(v4, "locked") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)canDivideCompoundShape:(id)a3
{
  return 1;
}

- (id)tooltipForMoveToBack
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move selected objects to the back layer."), 0, 0));

  return v3;
}

- (id)tooltipForMoveToFront
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move selected objects to the front layer."), 0, 0));

  return v3;
}

- (id)tooltipForMoveBackward
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move selected objects backward one layer."), 0, 0));

  return v3;
}

- (id)tooltipForMoveForward
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Move selected objects forward one layer."), 0, 0));

  return v3;
}

- (BOOL)selectionIsEmpty
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosForSelectionPath:", v7));

  LOBYTE(v6) = objc_msgSend(v8, "count") == 0;
  return (char)v6;
}

- (BOOL)selectionContainsJustUnlockedObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unlockedBoardItemsForSelectionPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v10));

  v12 = objc_msgSend(v8, "count");
  v13 = v12 == objc_msgSend(v11, "count") && objc_msgSend(v8, "count") != 0;

  return v13;
}

- (int64_t)canvasEditorCanPerformBringDrawablesForwardActionWithSender:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  int64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_msgSend(v4, "documentIsSharedReadOnly");

  if ((v5 & 1) != 0)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrangeInspectorDelegate"));
  v9 = objc_msgSend(v8, "canBringDrawablesForward");
  if ((-[CRLCanvasEditorHelper selectionContainsJustUnlockedObjects](self, "selectionContainsJustUnlockedObjects") & v9) != 0)
    v6 = 1;
  else
    v6 = -1;

  return v6;
}

- (int64_t)canvasEditorCanPerformSendDrawablesBackwardActionWithSender:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  int64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_msgSend(v4, "documentIsSharedReadOnly");

  if ((v5 & 1) != 0)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrangeInspectorDelegate"));
  v9 = objc_msgSend(v8, "canSendDrawablesBackward");
  if ((-[CRLCanvasEditorHelper selectionContainsJustUnlockedObjects](self, "selectionContainsJustUnlockedObjects") & v9) != 0)
    v6 = 1;
  else
    v6 = -1;

  return v6;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a4;
  if ("cut:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformCutAction:withSender:](self, "canvasEditorCanPerformCutAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("copy:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformCopyAction:withSender:](self, "canvasEditorCanPerformCopyAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("delete:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformDeleteAction:withSender:](self, "canvasEditorCanPerformDeleteAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("paste:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformPasteAction:withSender:](self, "canvasEditorCanPerformPasteAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if (sel_isEqual(a3, "duplicate:"))
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformDuplicateAction:withSender:](self, "canvasEditorCanPerformDuplicateAction:withSender:", a3, v6);
LABEL_63:
    v8 = v7;
    goto LABEL_64;
  }
  if ("pasteAsPlainText:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformPasteAsPlainTextAction:withSender:](self, "canvasEditorCanPerformPasteAsPlainTextAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("pasteValues:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformPasteValuesAction:withSender:](self, "canvasEditorCanPerformPasteValuesAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("selectAll:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformSelectAllAction:withSender:](self, "canvasEditorCanPerformSelectAllAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("deselectAll:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformDeselectAllAction:withSender:](self, "canvasEditorCanPerformDeselectAllAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("group:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformGroupActionWithSender:](self, "canvasEditorCanPerformGroupActionWithSender:", v6);
    goto LABEL_63;
  }
  if ("ungroup:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformUngroupActionWithSender:](self, "canvasEditorCanPerformUngroupActionWithSender:", v6);
    goto LABEL_63;
  }
  v8 = 1;
  if ("zoomIn:" == a3 || "zoomOut:" == a3)
    goto LABEL_64;
  if ("showMiniFormatterToExitDrawingMode:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:](self, "canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:", v6);
    goto LABEL_63;
  }
  if ("selectParent:" == a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelContainerRepForEditing"));
    v8 = v10 != 0;

    goto LABEL_64;
  }
  if ("connectWithConnectionLine:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformConnectWithConnectionLineAction:withSender:](self, "canvasEditorCanPerformConnectWithConnectionLineAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("alignDrawablesByLeftEdge:" == a3
    || "alignDrawablesByRightEdge:" == a3
    || "alignDrawablesByTopEdge:" == a3
    || "alignDrawablesByBottomEdge:" == a3
    || "alignDrawablesByHorizontalCenter:" == a3
    || "alignDrawablesByVerticalCenter:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformAlignAction:withSender:](self, "canvasEditorCanPerformAlignAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("distributeDrawablesHorizontally:" == a3
    || "distributeDrawablesVertically:" == a3
    || "distributeDrawablesEvenly:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformDistributeActionWithSender:](self, "canvasEditorCanPerformDistributeActionWithSender:", v6);
    goto LABEL_63;
  }
  if ("bringToFront:" == a3 || "bringForward:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformBringDrawablesForwardActionWithSender:](self, "canvasEditorCanPerformBringDrawablesForwardActionWithSender:", v6);
    goto LABEL_63;
  }
  if ("sendBackward:" == a3 || "sendToBack:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformSendDrawablesBackwardActionWithSender:](self, "canvasEditorCanPerformSendDrawablesBackwardActionWithSender:", v6);
    goto LABEL_63;
  }
  if ("mask:" == a3)
  {
    v12 = -[CRLCanvasEditorHelper canPerformUnmaskWithSender:](self, "canPerformUnmaskWithSender:", v6);
    goto LABEL_73;
  }
  if ("maskWithShape:" == a3)
  {
    v12 = -[CRLCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", v6);
    goto LABEL_73;
  }
  if ("maskWithSelection:" == a3)
  {
    if (-[CRLCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", v6)
      || -[CRLCanvasEditorHelper canPerformMaskWithSender:](self, "canPerformMaskWithSender:", v6))
    {
      v8 = 1;
    }
    else
    {
      v8 = -1;
    }
    goto LABEL_64;
  }
  if ("maskWithShapeType:" == a3)
  {
    v12 = -[CRLCanvasEditorHelper canPerformMaskWithShapeTypeWithSender:](self, "canPerformMaskWithShapeTypeWithSender:", v6);
    goto LABEL_73;
  }
  if ("lock:" == a3 || "unlock:" == a3)
  {
    v7 = -[CRLCanvasEditorHelper canvasEditorCanPerformLockAction:withSender:](self, "canvasEditorCanPerformLockAction:withSender:", a3, v6);
    goto LABEL_63;
  }
  if ("scrollCanvasPageUp:" == a3
    || "scrollCanvasPageDown:" == a3
    || "scrollCanvasUp:" == a3
    || "scrollCanvasDown:" == a3
    || "scrollCanvasLeft:" == a3
    || "scrollCanvasRight:" == a3)
  {
    v12 = -[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard");
LABEL_73:
    if (v12)
      v8 = 1;
    else
      v8 = -1;
    goto LABEL_64;
  }
  if ("enterQuickSelectMode:" != a3)
  {
    if ("presentAlignmentTools:" != a3)
    {
      v8 = 0;
      goto LABEL_64;
    }
    v12 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 5);
    goto LABEL_73;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "asiOSCVC"));

  if (objc_msgSend(v16, "allowedToEnterQuickSelectMode"))
    v8 = 1;
  else
    v8 = -1;

LABEL_64:
  return v8;
}

- (id)topMostContainerForDeletingContainer:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  Class v25;
  NSString *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentInfo", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  objc_opt_class(_TtC8Freeform12CRLGroupItem, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "childInfos"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v4));
    v17 = objc_msgSend(v15, "isEqualToSet:", v16);

    if (v17)
      v18 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper topMostContainerForDeletingContainer:](self, "topMostContainerForDeletingContainer:", v11));
    else
      v18 = v4;
    v28 = v18;

    if (v28)
      goto LABEL_27;
    goto LABEL_18;
  }
  if (v11)
  {
    v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012426B8);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E093D4(v20, (uint64_t)v11, v19);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012426D8);
    v21 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper topMostContainerForDeletingContainer:]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    objc_opt_class(v11, v24);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 1029, 0, "Starting container had a parent info of an unexpected class %{public}@", v27);

  }
  v28 = v4;
  if (!v28)
  {
LABEL_18:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012426F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09348();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242718);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper topMostContainerForDeletingContainer:]"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 1033, 0, "invalid nil value for '%{public}s'", "result");

  }
LABEL_27:

  return v28;
}

- (id)selectionBehaviorForDeletingBoardItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CRLCommandSelectionBehavior *v22;
  void *v23;
  void *v24;
  void *v25;
  CRLCommandSelectionBehavior *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper infosToDeleteToDeleteInfos:](self, "infosToDeleteToDeleteInfos:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentInfo", (_QWORD)v28));
        objc_opt_class(_TtC8Freeform12CRLGroupItem, v13);
        isKindOfClass = objc_opt_isKindOfClass(v12, v14);

        if ((isKindOfClass & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentInfo"));
          objc_msgSend(v5, "addObject:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  if ((unint64_t)objc_msgSend(v5, "count") < 2 && objc_msgSend(v5, "count") == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionModelTranslatorForInteractiveCanvasController:", v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "anyObject"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPathForNothingSelectedInsideGroup:", v20));

  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", 0, (_QWORD)v28));
  }
  v22 = [CRLCommandSelectionBehavior alloc];
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "editorController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPath"));
  v26 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:](v22, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", v21, v25, 4);

  return v26;
}

- (id)boardItemsToDelete
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectionModelTranslator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "unlockedBoardItemsForSelectionPath:", v5));

  return v6;
}

- (void)perform_delete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper boardItemsToDelete](self, "boardItemsToDelete"));
  -[CRLCanvasEditorHelper perform_deleteBoardItems:](self, "perform_deleteBoardItems:", v3);

}

- (void)perform_deleteBoardItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC8Freeform15CRLCommandGroup *v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v4, 1));
  if (v7)
  {
    if (!v6)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242738);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E094B0();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242758);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper perform_deleteBoardItems:]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1089, 0, "can't delete without a command controller");

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:](CRLConnectionLineAdjustmentHelper, "infosForAdjustingConnectionLinesAfterRemove:", v4));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v12, v4, v13, v14));

    if (objc_msgSend(v15, "count"))
      objc_msgSend(v11, "addObjectsFromArray:", v15);
    objc_msgSend(v11, "addObject:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionBehaviorForDeletingBoardItems:](self, "selectionBehaviorForDeletingBoardItems:", v4));
    v17 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v11);
    objc_msgSend(v6, "enqueueCommand:withSelectionBehavior:", v17, v16);

  }
}

- (void)delete:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v6 = objc_msgSend(v5, "canvasEditorCanDeleteWithSender:", v4);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editingCoordinator"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001CBB00;
    v9[3] = &unk_10122F780;
    v9[4] = self;
    objc_msgSend(v8, "canPerformUserActionUsingBlock:", v9);

  }
}

- (void)p_copy:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  objc_msgSend(v5, "copy:", v4);

}

- (void)cut:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v5 = objc_msgSend(v4, "canvasEditorCanCutWithSender:", v10);

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

    objc_msgSend(v7, "openGroup");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Cut"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v7, "setCurrentGroupActionString:", v9);

    -[CRLCanvasEditorHelper p_copy:](self, "p_copy:", v10);
    -[CRLCanvasEditorHelper perform_delete](self, "perform_delete");
    objc_msgSend(v7, "closeGroup");

  }
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  if (objc_msgSend(v4, "canvasEditorCanPasteWithSender:", v12))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelContainerRepForEditing"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathWithInfos:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
      objc_msgSend(v8, "setSelectionPath:", v7);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
    objc_msgSend(v4, "pasteWithPasteboard:selectionPath:forceMatchStyle:sender:", v9, v11, 0, v12);

  }
}

- (void)pasteAsPlainText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CBEA0;
  v8[3] = &unk_101242780;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "canPerformUserActionUsingBlock:", v8);

}

- (void)pasteValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CBFF0;
  v8[3] = &unk_101242780;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "canPerformUserActionUsingBlock:", v8);

}

- (void)duplicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001CC140;
  v8[3] = &unk_101242780;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "canPerformUserActionUsingBlock:", v8);

}

- (void)deselectAll:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper selectionPathWithInfos:](self, "selectionPathWithInfos:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
  objc_msgSend(v5, "setSelectionPath:", v6);

}

- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  CRLCommandSelectionBehavior *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLCommandSelectionBehavior *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  uint64_t v27;
  void *i;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  _TtC8Freeform19CRLCommandSetLocked *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "infosForCurrentSelectionPath"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper drawablesToLockOrUnlockForInfos:](self, "drawablesToLockOrUnlockForInfos:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editorController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPath"));

  if (v3 || (v13 = objc_msgSend(v9, "count"), v13 != objc_msgSend(v8, "count")))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionPathWithInfos:", v9));

    v12 = (void *)v15;
  }
  v16 = [CRLCommandSelectionBehavior alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editorController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "selectionPath"));
  v20 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:](v16, "initWithForwardSelectionPath:reverseSelectionPath:selectionFlags:", v12, v19, 1024);

  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v20);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  v24 = v21;
  if (!v22)
    goto LABEL_21;
  v25 = v22;
  v38 = v12;
  v26 = 0;
  v27 = *(_QWORD *)v40;
  do
  {
    for (i = 0; i != v25; i = (char *)i + 1)
    {
      if (*(_QWORD *)v40 != v27)
        objc_enumerationMutation(v21);
      v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
      objc_opt_class(_TtC8Freeform12CRLBoardItem, v23);
      v31 = sub_100221D0C(v30, v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v32 && (objc_msgSend(v32, "isLockable") & 1) != 0
        || !v3 && objc_msgSend(v33, "locked"))
      {
        v34 = -[CRLCommandSetLocked initWithBoardItem:locked:]([_TtC8Freeform19CRLCommandSetLocked alloc], "initWithBoardItem:locked:", v33, v3);
        objc_msgSend(v6, "enqueueCommand:", v34);

        v26 = 1;
      }

    }
    v25 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  }
  while (v25);

  v12 = v38;
  if ((v26 & 1) != 0)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v36 = v35;
    if (v3)
      v37 = CFSTR("Lock");
    else
      v37 = CFSTR("Unlock");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "localizedStringForKey:value:table:", v37, 0, CFSTR("UndoStrings")));

    objc_msgSend(v6, "setCurrentGroupActionString:", v24);
LABEL_21:

  }
  objc_msgSend(v6, "closeGroup");

}

- (void)lock:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD *v14;
  _QWORD v15[6];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1001CC80C;
  v15[3] = &unk_10122D3D8;
  v15[4] = v4;
  v15[5] = self;
  v6 = objc_retainBlock(v15);
  if ((objc_opt_respondsToSelector(v5, "interactiveCanvasController:didRequestToLockSelectedCanvasElements:animated:completionQueue:completionHandler:") & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper drawablesToLockOrUnlockForInfos:](self, "drawablesToLockOrUnlockForInfos:", v11));

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001CC838;
    v13[3] = &unk_10122F678;
    v14 = v6;
    objc_msgSend(v5, "interactiveCanvasController:didRequestToLockSelectedCanvasElements:animated:completionQueue:completionHandler:", v4, v12, 1, 0, v13);

  }
  else
  {
    ((void (*)(_QWORD *))v6[2])(v6);
  }

}

- (void)unlock:(id)a3
{
  -[CRLCanvasEditorHelper p_setLockStatusOfSelectedDrawables:](self, "p_setLockStatusOfSelectedDrawables:", 0);
}

- (id)drawablesToLockOrUnlockForInfos:(id)a3
{
  return a3;
}

- (id)p_commandsToPrepareForGroupingBoardItems:(id)a3 infosToAdjustForConnectionLines:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v6, v7, v8, v9));

  return v10;
}

- (id)p_commandsForGroupingBoardItems:(id)a3 outNewGroup:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v38;
  _TtC8Freeform28CRLCommandReparentBoardItems *v39;
  _TtC8Freeform26CRLCommandInsertBoardItems *v41;
  void *v42;
  void *v43;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_claimAutoreleasedReturnValue(+[CRLGroupItem groupGeometryFromChildrenInfos:](_TtC8Freeform12CRLGroupItem, "groupGeometryFromChildrenInfos:", v5));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editingCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItemFactory"));
  v43 = (void *)v7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "makeGroupItemWithGeometry:", v7));

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v12 = v5;
  v13 = (uint64_t)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v51;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v12);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "aspectRatioLocked") & 1) != 0)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v13 = (uint64_t)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  objc_msgSend(v11, "setAspectRatioLocked:", v13);
  *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v16).n128_u64[0];
  v19 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v17));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topLevelContainerInfoForEditing"));
  v22 = sub_100221D0C(v19, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (!v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "board"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "rootContainer"));

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "childInfos"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
  v28 = objc_msgSend(v26, "indexOfObject:", v27);

  if (v28 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "childInfos"));
    v28 = objc_msgSend(v29, "count");

  }
  v42 = v23;
  v41 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItem:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItem:index:", v23, v11, v28);
  objc_msgSend(v6, "addObject:");
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v12;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v47;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v32)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "geometry"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "geometryRelativeToGeometry:", v36));

        v38 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v34, v37);
        objc_msgSend(v6, "addObject:", v38);
        v39 = -[CRLCommandReparentBoardItems initWithDestinationContainer:boardItem:]([_TtC8Freeform28CRLCommandReparentBoardItems alloc], "initWithDestinationContainer:boardItem:", v11, v34);
        objc_msgSend(v6, "addObject:", v39);

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v31);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v11);

  return v6;
}

- (void)group:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  _TtC8Freeform15CRLCommandGroup *v26;
  id v27;
  CRLCanvasCommandSelectionBehavior *v28;
  void *v29;
  void *v30;
  CRLCanvasCommandSelectionBehavior *v31;
  _TtC8Freeform15CRLCommandGroup *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  CRLCanvasEditorHelper *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unlockedBoardItemsForSelectionPath:", v8));

  v10 = objc_alloc_init((Class)NSMutableSet);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v52;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v52 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
        v18 = objc_msgSend(v17, "canGroupBoardItem:", v16);

        if (v18)
          objc_msgSend(v10, "addObject:", v16);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v13);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelZOrderedSiblingsOfInfos:", v10));
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "crl_arrayWithObjectsInSet:", v10));

  objc_msgSend(v42, "openGroup");
  objc_msgSend(v42, "enableProgressiveEnqueuingInCurrentGroup");
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Group"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v42, "setCurrentGroupActionString:", v22);

  v23 = objc_alloc_init((Class)NSMapTable);
  v24 = objc_alloc_init((Class)NSMapTable);
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelZOrderedSiblingsOfInfos:", v10));
  v49 = v24;
  v50 = v23;
  -[CRLCanvasEditorHelper p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:](self, "p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:", v41, v10, &v50, &v49);
  v37 = v50;

  v36 = v49;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:](CRLConnectionLineAdjustmentHelper, "infosForAdjustingConnectionLinesAfterRemove:", v10));
  v39 = (void *)v20;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_commandsToPrepareForGroupingBoardItems:infosToAdjustForConnectionLines:](self, "p_commandsToPrepareForGroupingBoardItems:infosToAdjustForConnectionLines:", v20, v25));

  v26 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  -[CRLCommandGroup addCommands:](v26, "addCommands:", v40);
  objc_msgSend(v42, "enqueueCommand:", v26);
  v48 = 0;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_commandsForGroupingBoardItems:outNewGroup:](self, "p_commandsForGroupingBoardItems:outNewGroup:", v20, &v48));
  v27 = v48;
  v28 = [CRLCanvasCommandSelectionBehavior alloc];
  v38 = v4;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v27));
  v31 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v28, "initWithCanvasEditor:type:constructedInfos:", v29, 3, v30);

  v32 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  -[CRLCommandGroup addCommands:](v32, "addCommands:", v35);
  objc_msgSend(v42, "enqueueCommand:", v32);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1001CD170;
  v43[3] = &unk_1012427A8;
  v44 = v37;
  v45 = self;
  v46 = v42;
  v47 = v36;
  v33 = v36;
  v34 = v37;
  objc_msgSend(v27, "withTemporaryLayoutPerform:", v43);
  objc_msgSend(v42, "closeGroupWithSelectionBehavior:", v31);

}

- (void)p_getMagnetUnscaledPositionsFromInfos:(id)a3 withAffectedInfos:(id)a4 withClineHeadMagnets:(id *)a5 withClineTailMagnets:(id *)a6
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  int v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id *v41;
  uint64_t v43;
  id v44;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];

  v41 = a5;
  v7 = a3;
  v8 = a4;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v48;
    v13 = (char *)&unk_1013BF000;
    v43 = *(_QWORD *)v48;
    do
    {
      v14 = 0;
      v44 = v11;
      do
      {
        if (*(_QWORD *)v48 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v14);
        objc_opt_class(v13 + 3232, v10);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          objc_opt_class(v13 + 3232, v10);
          v18 = sub_100221D0C(v17, v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectionLinePathSource"));
          v21 = objc_msgSend(v8, "containsObject:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mainBoard"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getConnectedToWithBoardItemOwner:", v23));

          v25 = objc_msgSend(v8, "containsObject:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mainBoard"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "getConnectedFromWithBoardItemOwner:", v27));

          v29 = objc_msgSend(v8, "containsObject:", v28);
          v30 = v29;
          if (v21)
          {
            if (v24)
              v31 = v25;
            else
              v31 = 1;
            if (((v31 | v29) & 1) != 0 || !v28)
              goto LABEL_24;
          }
          else if ((v25 & v29 & 1) != 0)
          {
LABEL_24:

            v12 = v43;
            v11 = v44;
            v13 = (_BYTE *)&unk_1013BF000;
            goto LABEL_25;
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "headMagnet", v41));
          if (v32)
            v33 = v25;
          else
            v33 = 0;

          if (v33 == 1)
          {
            v34 = *v41;
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "headMagnet"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_getMagnetUnscaledPositionValueForMagnet:withConnectedItem:](self, "p_getMagnetUnscaledPositionValueForMagnet:withConnectedItem:", v35, v24));
            objc_msgSend(v34, "setObject:forKey:", v36, v19);

          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tailMagnet"));
          if (!v37)
            v30 = 0;

          if (v30 == 1)
          {
            v38 = *a6;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tailMagnet"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_getMagnetUnscaledPositionValueForMagnet:withConnectedItem:](self, "p_getMagnetUnscaledPositionValueForMagnet:withConnectedItem:", v39, v28));
            objc_msgSend(v38, "setObject:forKey:", v40, v19);

          }
          goto LABEL_24;
        }
LABEL_25:
        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v11);
  }

}

- (id)p_getMagnetUnscaledPositionValueForMagnet:(id)a3 withConnectedItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  void *v13;
  float64x2_t v14;
  float64x2_t v15;
  float64x2_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutForInfo:", v6));

  objc_msgSend(v7, "magnetNormalizedPosition");
  v19 = v11;
  v20 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pureGeometry"));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "fullTransform", v19, v20);
    v14 = v22;
    v15 = v23;
    v16 = v24;
  }
  else
  {
    v16 = 0uLL;
    v14 = 0uLL;
    v15 = 0uLL;
  }
  v21 = vaddq_f64(v16, vmlaq_n_f64(vmulq_n_f64(v15, *(double *)&v19), v14, *(double *)&v20));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", *(_OWORD *)&v21));
  return v17;
}

- (id)p_commandForUpdatingMagnetAfterGroupingForCline:(id)a3 withPosition:(id)a4 withGroupLayout:(id)a5 forMagnet:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  CRLConnectionLineMagnet *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v32;
  double v34;
  double v35;
  float64x2_t v36;
  CGAffineTransform v37;
  CGAffineTransform v38;

  v6 = a6;
  v9 = a3;
  v10 = a5;
  objc_msgSend(a4, "CGPointValue");
  v34 = v11;
  v35 = v13;
  if (v10)
    objc_msgSend(v10, "pureTransformInRoot", *(_QWORD *)&v11, v12);
  else
    memset(&v37, 0, sizeof(v37));
  CGAffineTransformInvert(&v38, &v37);
  v36 = vaddq_f64(*(float64x2_t *)&v38.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v38.c, v34), *(float64x2_t *)&v38.a, v35));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pureGeometry"));
  objc_msgSend(v14, "size");
  v15 = sub_10005FDDC();
  v18 = sub_1000626B8(v36.f64[0], v36.f64[1], v15, v16, v17);
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "connectionLinePathSource"));
  v22 = objc_msgSend(v21, "copy");

  v23 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 7, v18, v20);
  if (v6)
  {
    objc_msgSend(v22, "setHeadMagnet:", v23);
    v24 = 1;
  }
  else
  {
    objc_msgSend(v22, "setTailMagnet:", v23);
    v24 = 0;
  }

  *(_QWORD *)&v26 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v25).n128_u64[0];
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info", v26));
  v30 = sub_100221D0C(v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  v32 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v9, v31, v24, v22);
  return v32;
}

- (id)commandsForUngrouping:(id)a3 objectsToSelect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  void *v30;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v31;
  _TtC8Freeform28CRLCommandReparentBoardItems *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id obj;
  void *v58;
  CGAffineTransform t1;
  CGAffineTransform v60;
  CGAffineTransform v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  CGAffineTransform v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform v68;
  CGAffineTransform v69;
  _OWORD v70[3];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  CGAffineTransform v83;
  CGAffineTransform t2;
  _BYTE v85[128];
  void *v86;

  v5 = a3;
  v53 = a4;
  v55 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childItems"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_arrayOfObjectsPassingTest:", &stru_1012427C8));

  if (objc_msgSend(v54, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    objc_msgSend(v53, "addObjectsFromArray:", v54);
    memset(&v83, 0, sizeof(v83));
    if (v5)
      objc_msgSend(v5, "transformInRoot");
    *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v8).n128_u64[0];
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "parentInfo", v9));
    v13 = sub_100221D0C(v11, v12);
    v56 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v76 = 0;
    v77 = &v76;
    v78 = 0x5010000000;
    v79 = &unk_1010E66AB;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = sub_1001CE234;
    v75[3] = &unk_1012374B0;
    v75[4] = &v76;
    objc_msgSend(v55, "withTemporaryLayoutPerform:", v75);
    *(_QWORD *)&v15 = objc_opt_class(_TtC8Freeform16CRLContainerItem, v14).n128_u64[0];
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "parentItem", v15));
    v19 = sub_1002223BC(v17, v18);
    v58 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "childInfos"));
    v21 = objc_msgSend(v20, "indexOfObject:", v55);

    if (v21 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "childInfos"));
      v21 = objc_msgSend(v22, "count");

    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "reverseObjectEnumerator"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v72;
      obj = v23;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v72 != v25)
            objc_enumerationMutation(obj);
          v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "geometry"));
          if (v27
            && objc_msgSend(v27, "wantsCounterRotationWhenNotSupportingParentRotationInRotatedParent")
            && (objc_msgSend(v27, "supportsParentRotation") & 1) == 0)
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "geometry"));
            v34 = v33;
            if (v33)
              objc_msgSend(v33, "transform");
            else
              memset(v70, 0, sizeof(v70));
            v35 = sub_100079210((double *)v70);
            t2 = v83;
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCounterRotateInfo infoGeometryForTransformInRoot:isChildFlipped:](CRLCounterRotateInfo, "infoGeometryForTransformInRoot:isChildFlipped:", &t2, v35));

            memset(&t2, 0, sizeof(t2));
            if (v36)
              objc_msgSend(v36, "transform");
            else
              memset(&v69, 0, sizeof(v69));
            v68 = v83;
            CGAffineTransformConcat(&t2, &v69, &v68);
            memset(&v68, 0, sizeof(v68));
            if (v28)
              objc_msgSend(v28, "fullTransform");
            else
              memset(&v67, 0, sizeof(v67));
            v66 = t2;
            CGAffineTransformConcat(&v68, &v67, &v66);
            v66 = v68;
            if (v56)
            {
              memset(&v65, 0, sizeof(v65));
              objc_msgSend(v56, "transformInRoot");
              v64 = v65;
              v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCounterRotateInfo infoGeometryForTransformInRoot:isChildFlipped:](CRLCounterRotateInfo, "infoGeometryForTransformInRoot:isChildFlipped:", &v64, 0));
              v38 = v37;
              memset(&v64, 0, sizeof(v64));
              if (v37)
                objc_msgSend(v37, "transform");
              else
                memset(&v63, 0, sizeof(v63));
              v62 = v65;
              CGAffineTransformConcat(&v64, &v63, &v62);
              v62 = v64;
              CGAffineTransformInvert(&v61, &v62);
              v62 = v68;
              CGAffineTransformConcat(&v66, &v62, &v61);

            }
            v39 = objc_msgSend(v28, "widthValid");
            v40 = objc_msgSend(v28, "heightValid");
            v65 = v66;
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v65, v39, v40));

          }
          else
          {
            if (v28)
              objc_msgSend(v28, "fullTransform");
            else
              memset(&t1, 0, sizeof(t1));
            v29 = *((_OWORD *)v77 + 3);
            *(_OWORD *)&t2.a = *((_OWORD *)v77 + 2);
            *(_OWORD *)&t2.c = v29;
            *(_OWORD *)&t2.tx = *((_OWORD *)v77 + 4);
            CGAffineTransformConcat(&v60, &t1, &t2);
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:widthValid:heightValid:](CRLCanvasInfoGeometry, "geometryFromFullTransform:widthValid:heightValid:", &v60, objc_msgSend(v28, "widthValid"), objc_msgSend(v28, "heightValid")));
          }
          v31 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v27, v30);
          objc_msgSend(v7, "addObject:", v31);
          v32 = -[CRLCommandReparentBoardItems initWithDestinationContainer:boardItem:index:]([_TtC8Freeform28CRLCommandReparentBoardItems alloc], "initWithDestinationContainer:boardItem:index:", v58, v27, v21);
          objc_msgSend(v7, "addObject:", v32);

          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v23 = obj;
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v85, 16);
        v24 = v41;
      }
      while (v41);
    }

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v55));
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v42, 0));

    if (v43)
    {
      objc_msgSend(v7, "addObject:", v43);
    }
    else
    {
      v46 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012427E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E09530();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242808);
      v47 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100E02830(v48, (uint8_t *)&t2, v46, (os_log_t)v47);
      }

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandsForUngrouping:objectsToSelect:]"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v49, v50, 1557, 0, "invalid nil value for '%{public}s'", "delCommand");

    }
    _Block_object_dispose(&v76, 8);

  }
  else
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v5));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v44, 1));
    v86 = v45;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v86, 1));

  }
  return v7;
}

- (void)ungroup:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _TtC8Freeform15CRLCommandGroup *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *i;
  uint64_t v45;
  id v46;
  CRLCanvasCommandSelectionBehavior *v47;
  void *v48;
  CRLCanvasCommandSelectionBehavior *v49;
  CRLCanvasCommandSelectionBehavior *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  void *j;
  CRLCanvasCommandSelectionBehavior *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  _TtC8Freeform15CRLCommandGroup *v85;
  void *v86;
  void *v87;
  id v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  id v106;
  id v107;
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  if (!v84)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242828);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E095BC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242848);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper ungroup:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 1568, 0, "can't ungroup without a command controller");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItemsForSelectionPath:", v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editorController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionPath"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "unlockedBoardItemsForSelectionPath:", v15));

  v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Ungroup"), 0, CFSTR("UndoStrings")));
  v85 = v18;
  -[CRLCommandGroup setActionString:](v18, "setActionString:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelZOrderedSiblingsOfInfos:", v16));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crl_arrayWithObjectsInSet:", v16));

  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v87 = v22;
  v23 = objc_msgSend(v22, "count");
  if ((uint64_t)v23 - 1 >= 0)
  {
    v25 = (uint64_t)v23;
    do
    {
      --v25;
      *(_QWORD *)&v26 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v24).n128_u64[0];
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectAtIndexedSubscript:", v25, v26));
      v30 = sub_100221D0C(v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      if (-[CRLCanvasEditorHelper canUngroupGroupInfo:](self, "canUngroupGroupInfo:", v31))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandsForUngrouping:objectsToSelect:](self, "commandsForUngrouping:objectsToSelect:", v31, v17));
        objc_msgSend(v86, "addObjectsFromArray:", v32);

        objc_msgSend(v89, "addObject:", v31);
      }

    }
    while (v25 > 0);
  }
  v33 = objc_alloc_init((Class)NSMapTable);
  v34 = objc_alloc_init((Class)NSMapTable);
  v106 = v34;
  v107 = v33;
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelZOrderedSiblingsOfInfos:", v16));
  -[CRLCanvasEditorHelper p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:](self, "p_getMagnetUnscaledPositionsFromInfos:withAffectedInfos:withClineHeadMagnets:withClineTailMagnets:");
  v88 = v107;

  v35 = v106;
  v36 = objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:](CRLConnectionLineAdjustmentHelper, "infosForAdjustingConnectionLinesAfterRemove:", v89));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
  v83 = (void *)v17;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v78 = (void *)v36;
  v39 = objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v36, v89, v37, v38));

  v76 = (void *)v39;
  -[CRLCommandGroup addCommands:](v85, "addCommands:", v39);
  -[CRLCommandGroup addCommands:](v85, "addCommands:", v86);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v40 = v81;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v42; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v43)
          objc_enumerationMutation(v40);
        v45 = *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v89, "containsObject:", v45) & 1) == 0)
          objc_msgSend(v83, "addObject:", v45);
      }
      v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v102, v111, 16);
    }
    while (v42);
  }

  v46 = objc_msgSend(v83, "count");
  v47 = [CRLCanvasCommandSelectionBehavior alloc];
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  if (v46)
    v49 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v47, "initWithCanvasEditor:type:constructedInfos:", v48, 3, v83);
  else
    v49 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v47, "initWithCanvasEditor:type:", v48, 1);
  v50 = v49;
  v77 = v40;
  v80 = (void *)v16;

  objc_msgSend(v84, "openGroupWithSelectionBehavior:", v50);
  objc_msgSend(v84, "enableProgressiveEnqueuingInCurrentGroup");
  v75 = v50;
  objc_msgSend(v84, "enqueueCommand:withSelectionBehavior:", v85, v50);
  v82 = v4;
  objc_msgSend(v4, "layoutIfNeeded");
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "keyEnumerator"));
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v99;
    v55 = &__NSArray0__struct;
    do
    {
      v56 = 0;
      v57 = v55;
      do
      {
        if (*(_QWORD *)v99 != v54)
          objc_enumerationMutation(v51);
        v58 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v56);
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", v58));
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_commandForUpdatingMagnetAfterUngroupingForCline:withPosition:forMagnet:](self, "p_commandForUpdatingMagnetAfterUngroupingForCline:withPosition:forMagnet:", v58, v59, 1));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "arrayByAddingObjectsFromArray:", v60));

        v56 = (char *)v56 + 1;
        v57 = v55;
      }
      while (v53 != v56);
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v98, v110, 16);
    }
    while (v53);
  }
  else
  {
    v55 = &__NSArray0__struct;
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "keyEnumerator"));
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v95;
    do
    {
      v65 = 0;
      v66 = v55;
      do
      {
        if (*(_QWORD *)v95 != v64)
          objc_enumerationMutation(v61);
        v67 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)v65);
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKey:", v67));
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper p_commandForUpdatingMagnetAfterUngroupingForCline:withPosition:forMagnet:](self, "p_commandForUpdatingMagnetAfterUngroupingForCline:withPosition:forMagnet:", v67, v68, 0));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v69));

        v65 = (char *)v65 + 1;
        v66 = v55;
      }
      while (v63 != v65);
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
    }
    while (v63);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v70 = v55;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v91;
    do
    {
      for (j = 0; j != v72; j = (char *)j + 1)
      {
        if (*(_QWORD *)v91 != v73)
          objc_enumerationMutation(v70);
        objc_msgSend(v84, "enqueueCommand:", *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)j));
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
    }
    while (v72);
  }

  objc_msgSend(v84, "closeGroup");
}

- (id)p_commandForUpdatingMagnetAfterUngroupingForCline:(id)a3 withPosition:(id)a4 forMagnet:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  CRLConnectionLineMagnet *v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v49;
  double v51;
  double v52;
  float64x2_t v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  _QWORD v56[4];
  id v57;
  uint64_t v58;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init((Class)NSMutableArray);
  *(_QWORD *)&v12 = objc_opt_class(CRLConnectionLineAbstractLayout, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutForInfo:", v8));
  v17 = sub_100221D0C(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v5)
    v19 = 11;
  else
    v19 = 10;
  objc_msgSend(v9, "CGPointValue");
  v51 = v21;
  v52 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = sub_1001CEF70;
  v56[3] = &unk_101242870;
  v23 = v18;
  v57 = v23;
  v58 = v19;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "hitRep:passingTest:", v56, v52, v51));

  if (v24)
  {
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "repForSelecting"));
    if (v25)
    {
      v26 = (void *)v25;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "repForSelecting"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layout"));

      if (v28)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "repForSelecting"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "layout"));

        if (v30)
          objc_msgSend(v30, "pureTransformInRoot");
        else
          memset(&v54, 0, sizeof(v54));
        CGAffineTransformInvert(&v55, &v54);
        v53 = vaddq_f64(*(float64x2_t *)&v55.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v55.c, v51), *(float64x2_t *)&v55.a, v52));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "pureGeometry"));
        objc_msgSend(v31, "size");
        v32 = sub_10005FDDC();
        v35 = sub_1000626B8(v53.f64[0], v53.f64[1], v32, v33, v34);
        v37 = v36;

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLinePathSource"));
        v39 = objc_msgSend(v38, "copy");

        v40 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 7, v35, v37);
        if (v5)
        {
          objc_msgSend(v39, "setHeadMagnet:", v40);
          v41 = 1;
        }
        else
        {
          objc_msgSend(v39, "setTailMagnet:", v40);
          v41 = 0;
        }

        *(_QWORD *)&v43 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v42).n128_u64[0];
        v45 = v44;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "info", v43));
        v47 = sub_100221D0C(v45, v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

        v49 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v8, v48, v41, v39);
        objc_msgSend(v10, "addObject:", v49);

      }
    }
  }

  return v10;
}

- (BOOL)canGroupBoardItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentInfo", (_QWORD)v19));

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentInfo"));
          v16 = v15;
          if (v10)
          {

            if (v10 != v16)
              goto LABEL_17;
          }
          else
          {
            v10 = v15;
          }
        }
        else
        {
          v9 = 1;
          if (v10)
            goto LABEL_17;
        }
        if (!objc_msgSend(v5, "canGroupBoardItem:", v13))
        {
LABEL_17:
          v17 = 0;
          goto LABEL_19;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v17 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v17 = 1;
  }
LABEL_19:

  return v17 & (v9 ^ 1 | (v10 == 0));
}

- (BOOL)canInsertBoardItems:(id)a3 intoGroup:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  BOOL v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v7 = a4;
  if (-[CRLCanvasEditorHelper canGroupBoardItems:](self, "canGroupBoardItems:", v6))
  {
    v8 = objc_msgSend(v7, "isFreehandDrawing");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          if (v8)
          {
            if ((objc_msgSend(v14, "isAllowedInFreehandDrawings") & 1) == 0)
              goto LABEL_19;
          }
          else if ((objc_msgSend(v14, "supportsParentRotation", (_QWORD)v27) & 1) == 0 && v7)
          {
            while (1)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));
              objc_msgSend(v15, "angle");
              v17 = v16;

              if (v17 != 0.0 && fabs(v17) >= 0.00999999978)
                break;
              *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v18).n128_u64[0];
              v21 = v20;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "parentInfo", v19));
              v23 = sub_100221D0C(v21, v22);
              v24 = objc_claimAutoreleasedReturnValue(v23);

              v7 = (id)v24;
              if (!v24)
                goto LABEL_15;
            }
LABEL_19:
            v25 = 0;
            goto LABEL_21;
          }
LABEL_15:
          ;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v25 = 1;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v25 = 1;
    }
LABEL_21:

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)selectParent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelContainerRepForEditing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathWithInfo:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  objc_msgSend(v8, "setSelectionPath:", v7);

}

- (int64_t)canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  v6 = objc_msgSend(v5, "isLassoAbleToSelectMixedType");

  if (!v6)
    return -1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));
  if (objc_msgSend(v8, "isInDrawingMode"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionModelTranslator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "boardItemsForSelectionPath:", v10));

    if (objc_msgSend(v12, "count"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v31 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v15)
      {
        v17 = v15;
        v18 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(_QWORD *)v33 != v18)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
            *(_QWORD *)&v21 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v16).n128_u64[0];
            if (objc_msgSend(v20, "isMemberOfClass:", v22, v21))
            {
              objc_opt_class(_TtC8Freeform12CRLGroupItem, v23);
              v25 = sub_100221D0C(v24, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "allNestedChildrenItemsExcludingGroups"));
              objc_msgSend(v13, "addObjectsFromArray:", v27);

            }
            else
            {
              objc_msgSend(v13, "addObject:", v20);
            }
          }
          v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v17);
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crl_arrayByTransformingWithBlock:", &stru_1012428B0));
      if (objc_msgSend(v28, "count"))
        v29 = -1;
      else
        v29 = 1;

      v12 = v31;
    }
    else
    {
      v29 = -1;
    }

  }
  else
  {
    v29 = -1;
  }

  return v29;
}

- (void)showMiniFormatterToExitDrawingMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentDocumentMode"));

  objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v7);
  v9 = sub_100221D0C(v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "boardViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentModeController"));
    objc_msgSend(v13, "resetToDefaultModeAnimated:", 1);

  }
}

- (void)mask
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  CRLCanvasCommandSelectionBehavior *v15;
  void *v16;
  void *v17;
  CRLCanvasCommandSelectionBehavior *v18;
  void *v19;
  _TtC8Freeform17CRLCommandSetMask *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform12CRLImageItem, v3).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionModelTranslator", v4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "unlockedBoardItemsForSelectionPath:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "anyObject"));
  v12 = sub_100221D0C(v6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "maskInfo"));
  if (!v14)
  {
    v15 = [CRLCanvasCommandSelectionBehavior alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasEditor"));
    v18 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v15, "initWithCanvasEditor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultMaskInfo"));
    v20 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v13, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "commandController"));
    objc_msgSend(v21, "enqueueCommand:withSelectionBehavior:", v20, v18);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "repForInfo:", v13));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageLayout"));
  if ((objc_msgSend(v23, "isInMaskEditMode") & 1) == 0)
    objc_msgSend(v22, "editMaskWithHUD:", 1);

}

- (void)maskWithShape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *i;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CRLCanvasEditorHelper *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionModelTranslator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "unlockedBoardItemsForSelectionPath:", v6));

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v8)
  {

    v11 = 0;
    goto LABEL_17;
  }
  v10 = v8;
  v28 = self;
  v29 = v3;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v31;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v31 != v13)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
      objc_opt_class(_TtC8Freeform12CRLImageItem, v9);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
      {
        v18 = v12;
        v19 = v11;
        v12 = v15;
      }
      else
      {
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v17);
        v18 = v11;
        v19 = v15;
        if ((objc_opt_isKindOfClass(v15, v20) & 1) == 0)
          continue;
      }
      v21 = v15;

      v11 = v19;
    }
    v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  }
  while (v10);

  if (!v12)
  {
    v3 = v29;
LABEL_17:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012428D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E096C8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012428F0);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShape]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 1836, 0, "invalid nil value for '%{public}s'", "imageInfo");

    v12 = 0;
    if (!v11)
      goto LABEL_26;
    goto LABEL_35;
  }
  v3 = v29;
  if (v11)
  {
    -[CRLCanvasEditorHelper p_maskImage:withShape:shouldOpenGroup:shouldBeginEditing:shouldCenterAroundFaces:](v28, "p_maskImage:withShape:shouldOpenGroup:shouldBeginEditing:shouldCenterAroundFaces:", v12, v11, 1, 1, 0);
    goto LABEL_35;
  }
LABEL_26:
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242910);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0963C();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101242930);
  v25 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShape]"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v27, 1837, 0, "invalid nil value for '%{public}s'", "shapeInfo");

  v11 = 0;
LABEL_35:

}

- (void)maskWithShapeType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unlockedBoardItemsForSelectionPath:", v8));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v21;
LABEL_3:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
      objc_opt_class(_TtC8Freeform12CRLImageItem, v11);
      if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        break;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v17 = v15;

    if (!v17)
      goto LABEL_12;
    -[CRLCanvasEditorHelper maskImage:withShapeType:](self, "maskImage:withShapeType:", v17, a3);
  }
  else
  {
LABEL_9:

LABEL_12:
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242950);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E09754();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242970);
    v18 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v18);
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper maskWithShapeType:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v19, 1857, 0, "invalid nil value for '%{public}s'", "imageInfo");

  }
}

- (void)maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6
{
  -[CRLCanvasEditorHelper p_maskImage:withShape:shouldOpenGroup:shouldBeginEditing:shouldCenterAroundFaces:](self, "p_maskImage:withShape:shouldOpenGroup:shouldBeginEditing:shouldCenterAroundFaces:", a3, a4, a5, a6, 1);
}

- (void)p_maskImage:(id)a3 withShape:(id)a4 shouldOpenGroup:(BOOL)a5 shouldBeginEditing:(BOOL)a6 shouldCenterAroundFaces:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CRLCanvasCommandSelectionBehavior *v15;
  void *v16;
  void *v17;
  CRLCanvasCommandSelectionBehavior *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double x;
  double v47;
  double y;
  void *v49;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  id v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t v68;
  id v69;
  _TtC8Freeform30CRLCommandSetImageItemGeometry *v70;
  void *v71;
  _TtC8Freeform15CRLCommandGroup *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  double v82;
  _TtC8Freeform17CRLCommandSetMask *v83;
  CRLMaskInfo *v84;
  void *v85;
  void *v86;
  _BOOL4 v87;
  _BOOL4 v88;
  void *v89;
  double v90;
  void *v91;
  void *v92;
  float64x2_t v93;
  float64x2_t v94;
  float64x2_t v95;
  _OWORD v96[3];
  id v97[2];

  v7 = a7;
  v88 = a6;
  v8 = a5;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandController"));
  v87 = v8;
  if (v8)
  {
    v15 = [CRLCanvasCommandSelectionBehavior alloc];
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v11));
    v18 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v15, "initWithCanvasEditor:type:constructedInfos:", v16, 3, v17);

    objc_msgSend(v14, "openGroupWithSelectionBehavior:", v18);
  }
  v97[0] = 0;
  -[CRLCanvasEditorHelper willMaskImage:withShapeInfo:additionalData:](self, "willMaskImage:withShapeInfo:additionalData:", v11, v12, v97);
  *(_QWORD *)&v20 = objc_opt_class(CRLShapeLayout, v19).n128_u64[0];
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutForInfo:", v12, v20));
  v24 = sub_100221D0C(v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geometry"));
  v86 = v25;
  if (v25)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pureGeometry"));
    v28 = v27;
    if (v27)
      objc_msgSend(v27, "fullTransform");
    else
      memset(v96, 0, sizeof(v96));
    v29 = objc_claimAutoreleasedReturnValue(+[CRLCanvasInfoGeometry geometryFromFullTransform:](CRLCanvasInfoGeometry, "geometryFromFullTransform:", v96));

    v26 = (void *)v29;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "geometryRelativeToGeometry:", v30));

  v92 = v31;
  if (v7)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageAssetPayload"));
    v33 = v26;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
    objc_msgSend(v34, "size");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v92, "transformedBounds");
    v40 = v39;
    v42 = v41;
    objc_msgSend(v92, "center");
    +[CRLImageFaceAnalyzer maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:](CRLImageFaceAnalyzer, "maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:", v32, v11, v36, v38, v40, v42, v43, v44);
    x = v45;
    y = v47;

    v26 = v33;
    v31 = v92;

  }
  else
  {
    x = CGPointZero.x;
    y = CGPointZero.y;
  }
  v89 = v13;
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSource"));
  v50 = objc_msgSend(v49, "copy");

  v85 = v26;
  objc_msgSend(v26, "size");
  objc_msgSend(v50, "scaleToNaturalSize:");
  v84 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:]([CRLMaskInfo alloc], "initWithImageItem:geometry:pathSource:", v11, v31, v50);
  v83 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v11, v84);
  objc_msgSend(v14, "enqueueCommand:");
  if (v7)
  {
    objc_msgSend(v31, "center");
    if (!sub_10005FE60(x, y, v51, v52))
    {
      objc_msgSend(v31, "center");
      v55 = sub_1000603B8(v53, v54, x);
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geometry"));
      v57 = objc_msgSend(v56, "mutableCopy");

      objc_msgSend(v57, "size");
      v58 = sub_10005FDDC();
      v62 = sub_100061400(v58, v59, v60, v61);
      v64 = sub_1000603D0(v62, v63, v55);
      if (v57)
      {
        v90 = v64;
        v82 = v65;
        objc_msgSend(v57, "transform");
        v65 = v82;
        v64 = v90;
        v67 = v93;
        v66 = v94;
        v68 = v95;
      }
      else
      {
        v68 = 0uLL;
        v67 = 0uLL;
        v66 = 0uLL;
      }
      objc_msgSend(v57, "setCenter:", vaddq_f64(v68, vmlaq_n_f64(vmulq_n_f64(v66, v65), v67, v64)));
      v69 = objc_msgSend(v31, "mutableCopy");
      objc_msgSend(v69, "setCenter:", x, y);
      v70 = -[CRLCommandSetImageItemGeometry initWithImageItem:imageGeometry:maskGeometry:maskPathSource:]([_TtC8Freeform30CRLCommandSetImageItemGeometry alloc], "initWithImageItem:imageGeometry:maskGeometry:maskPathSource:", v11, v57, v69, v50);
      objc_msgSend(v14, "enqueueCommand:", v70);

    }
  }
  v91 = v12;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v12));
  v72 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:](CRLConnectionLineAdjustmentHelper, "infosForAdjustingConnectionLinesAfterRemove:", v71));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v73, v71, v74, v75));
  -[CRLCommandGroup addCommands:](v72, "addCommands:", v76);

  objc_msgSend(v14, "enqueueCommand:", v72);
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v71, 1));
  objc_msgSend(v14, "enqueueCommand:", v77);
  -[CRLCanvasEditorHelper didMaskImage:additionalData:](self, "didMaskImage:additionalData:", v11, v97[0]);
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "localizedStringForKey:value:table:", CFSTR("Mask with Shape"), 0, 0));
  objc_msgSend(v14, "setCurrentGroupActionString:", v79);

  if (v87)
    objc_msgSend(v14, "closeGroup");
  v80 = v92;
  if (v88)
  {
    objc_msgSend(v89, "layoutIfNeeded");
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "repForInfo:", v11));
    objc_msgSend(v81, "editMaskWithHUD:", 1);

    v80 = v92;
  }

}

- (void)maskImage:(id)a3 withShapeType:(int64_t)a4
{
  id v6;
  CRLCanvasInfoGeometry *v7;
  uint64_t v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CRLCanvasCommandSelectionBehavior *v16;
  void *v17;
  CRLCanvasCommandSelectionBehavior *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CRLCanvasInfoGeometry *v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CRLCanvasInfoGeometry *v45;
  void *v46;
  CRLMaskInfo *v47;
  _TtC8Freeform17CRLCommandSetMask *v48;
  CRLCanvasEditorHelper *v49;
  CRLCanvasCommandSelectionBehavior *v50;
  void *v51;
  id v52;

  v6 = a3;
  v7 = -[CRLCanvasInfoGeometry initWithSize:]([CRLCanvasInfoGeometry alloc], "initWithSize:", sub_100479D94(a4));
  -[CRLCanvasInfoGeometry size](v7, "size");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", a4));
  if (a4 == 4)
  {
    objc_opt_class(CRLScalarPathSource, v8);
    v11 = sub_1002223BC(v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
      objc_msgSend(v12, "setIsCurveContinuous:", 1);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandController"));
  v16 = [CRLCanvasCommandSelectionBehavior alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v18 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v16, "initWithCanvasEditor:", v17);

  v50 = v18;
  objc_msgSend(v15, "openGroupWithSelectionBehavior:", v18);
  v52 = 0;
  -[CRLCanvasEditorHelper willMaskImage:withShapeInfo:additionalData:](self, "willMaskImage:withShapeInfo:additionalData:", v6, 0, &v52);
  v51 = v14;
  v49 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "repForInfo:", v6));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "imageLayout"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageAssetPayload"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  objc_msgSend(v22, "size");
  v24 = v23;
  v26 = v25;
  -[CRLCanvasInfoGeometry transformedBounds](v7, "transformedBounds");
  v28 = v27;
  v30 = v29;
  v31 = v7;
  v32 = v9;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageGeometry"));
  objc_msgSend(v33, "size");
  v34 = sub_10005FDDC();
  v38 = sub_100061400(v34, v35, v36, v37);
  +[CRLImageFaceAnalyzer maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:](CRLImageFaceAnalyzer, "maskCenterForFacesInImageData:imageSize:maskSize:defaultCenter:assetOwner:", v21, v6, v24, v26, v28, v30, v38, v39);
  v41 = v40;
  v43 = v42;

  objc_msgSend(v32, "naturalSize");
  v45 = -[CRLCanvasInfoGeometry geometryWithNewBounds:](v31, "geometryWithNewBounds:", sub_10005FD98(v41, v43, v44));
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = -[CRLMaskInfo initWithImageItem:geometry:pathSource:]([CRLMaskInfo alloc], "initWithImageItem:geometry:pathSource:", v6, v46, v32);
  v48 = -[CRLCommandSetMask initWithImageItem:maskInfo:]([_TtC8Freeform17CRLCommandSetMask alloc], "initWithImageItem:maskInfo:", v6, v47);
  objc_msgSend(v15, "enqueueCommand:", v48);
  -[CRLCanvasEditorHelper didMaskImage:additionalData:](v49, "didMaskImage:additionalData:", v6, v52);

  objc_msgSend(v15, "closeGroup");
  if ((objc_msgSend(v20, "isInMaskEditMode") & 1) == 0)
    objc_msgSend(v19, "editMaskWithHUD:", 1);

}

- (id)commandForReplacingImagePlaceholderInSelection:(id)a3 withBoardItems:(id)a4 isCrossDocument:(BOOL)a5 withSender:(id)a6 outSelectionBehavior:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  CRLImageDataHelper *v67;
  void *v68;
  CRLCanvasInfoGeometry *v69;
  CRLCanvasInfoGeometry *v70;
  void *v71;
  CRLImageDataHelper *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;

  v11 = a4;
  v12 = a6;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "selectionModelTranslator"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "boardItemsForSelectionPath:", v13));

  if (objc_msgSend(v11, "count") == (id)1 && objc_msgSend(v16, "count") == (id)1)
  {
    *(_QWORD *)&v18 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v17).n128_u64[0];
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "anyObject", v18));
    v22 = sub_100221D0C(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    if (!v23 || (objc_msgSend(v23, "locked") & 1) != 0)
    {
      v24 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    objc_opt_class(_TtC8Freeform12CRLImageItem, v26);
    v28 = sub_100221D0C(v27, v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v78 = v25;
    if (!v29)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editingCoordinator"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "boardItemFactory"));

      v48 = sub_100221DDC(v25, 1, v42, v43, v44, v45, v46, v47, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleBoardItemProvider);
      v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      if (!v49)
        goto LABEL_23;
      v56 = v49;
      v57 = objc_msgSend(v49, "newBoardItemWithFactory:bakedSize:", v77, 0);
      objc_opt_class(_TtC8Freeform12CRLImageItem, v58);
      v60 = sub_100221D0C(v59, v57);
      v29 = (void *)objc_claimAutoreleasedReturnValue(v60);

      v49 = v56;
      v25 = v78;
      if (v29)
      {

      }
      else
      {
LABEL_23:
        v76 = v49;
        v62 = sub_100221DDC(v25, 1, v50, v51, v52, v53, v54, v55, (uint64_t)&OBJC_PROTOCOL___CRLPasteboardImageDataProvider);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        if (v63)
        {
          v64 = v63;
          v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "imageData"));
          v74 = v64;
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "thumbnailImageData"));
          v75 = (void *)v65;
          if (v65)
          {
            v73 = v66;
            v67 = [CRLImageDataHelper alloc];
            v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "assetOwner"));
            v72 = -[CRLImageDataHelper initWithImageData:assetOwner:](v67, "initWithImageData:assetOwner:", v65, v68);

            v69 = [CRLCanvasInfoGeometry alloc];
            -[CRLImageDataHelper naturalSize](v72, "naturalSize");
            v70 = -[CRLCanvasInfoGeometry initWithSize:](v69, "initWithSize:");
            v71 = v77;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "makeImageItemWithGeometry:imageData:thumbnailData:", v70, v75, v73));

            v25 = v78;
            v66 = v73;
          }
          else
          {
            v29 = 0;
            v71 = v77;
          }

          v63 = v74;
        }
        else
        {
          v29 = 0;
          v71 = v77;
        }

        if (!v29)
        {
          v24 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageAssetPayload"));

    if (v30)
    {
      *(_QWORD *)&v32 = objc_opt_class(CRLCanvasRep, v31).n128_u64[0];
      v34 = v33;
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v32));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "repForInfo:", v23));
      v37 = sub_100221D0C(v34, v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

      if (objc_msgSend(v38, "shouldAllowReplacementFromPaste")
        && (!+[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v12)|| (v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageAssetPayload")), v40 = objc_msgSend(v38, "canPasteDataFromPhysicalKeyboard:", v39), v39, v40)))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "commandForAcceptingPasteWithImageInfo:outSelectionBehavior:", v29, a7));
      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
    v25 = v78;
    goto LABEL_20;
  }
  v24 = 0;
LABEL_22:

  return v24;
}

- (BOOL)canReplaceBoardItem:(id)a3
{
  return 1;
}

- (void)replaceBoardItem:(id)a3 withBoardItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC8Freeform15CRLCommandGroup *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v7));
  v15 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForInsertingBoardItemsIntoTopLevelContainer:below:](self, "commandForInsertingBoardItemsIntoTopLevelContainer:below:", v9, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v8, 0));
  v12 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);

  -[CRLCommandGroup addCommand:](v12, "addCommand:", v10);
  -[CRLCommandGroup addCommand:](v12, "addCommand:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandController"));
  objc_msgSend(v14, "enqueueCommand:", v12);

}

- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4
{
  return -[CRLCanvasEditorHelper commandForInsertingBoardItemsIntoTopLevelContainer:below:withOffset:](self, "commandForInsertingBoardItemsIntoTopLevelContainer:below:withOffset:", a3, a4, 0);
}

- (id)commandForInsertingBoardItemsIntoTopLevelContainer:(id)a3 below:(id)a4 withOffset:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topLevelContainerInfoForEditing"));
  objc_opt_class(NSObject, v12);
  v19 = sub_1002220C8(v11, v13, 1, v14, v15, v16, v17, v18, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:](self, "commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:", v8, v20, v9, a5));
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "editingCoordinator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "mainBoard"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rootContainer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:](self, "commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:", v8, v25, v9, a5));

  }
  return v21;
}

- (id)commandToInsertBoardItems:(id)a3 intoContainer:(id)a4 belowBoardItem:(id)a5 withOffset:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  BOOL v19;
  char *v20;
  _TtC8Freeform26CRLCommandInsertBoardItems *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CKRecordID v36;
  Swift::String v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class(_TtC8Freeform16CRLContainerItem, v12);
  v14 = sub_1002223BC(v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childInfos"));
    v17 = (char *)objc_msgSend(v16, "indexOfObject:", v11);

    if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "childInfos"));
      v17 = (char *)objc_msgSend(v18, "count");

    }
    v19 = (unint64_t)v17 >= a6;
    v20 = &v17[-a6];
    if (!v19)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012429D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0986C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012429F0);
      v26 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v26);
      sub_1001BC7E8((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d Offset for index was too large.", v27, v28, v29, v30, v31, v32, v33, (uint64_t)"-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v34, v35, 2131, 1, "Offset for index was too large.");

      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v36, v37);
      abort();
    }
    v21 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v15, v9, v20);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101242990);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E097E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012429B0);
    v22 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 2125, 0, "invalid nil value for '%{public}s'", "containerItem");

    v21 = 0;
  }

  return v21;
}

- (id)commandForDeletingBoardItemsFromTopLevelContainer:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topLevelContainerInfoForEditing"));

  if (v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v6, v4));
  else
    v9 = 0;

  return v9;
}

- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4
{
  return -[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:canDeleteNewlyCreatedInfos:](self, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:canDeleteNewlyCreatedInfos:", a3, a4, 0);
}

- (id)commandForDeletingInfosPossiblyFromMultipleContainers:(id)a3 shouldRemoveEmptyContainers:(BOOL)a4 canDeleteNewlyCreatedInfos:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_class *v24;
  id v25;
  void *v26;
  _TtC8Freeform15CRLCommandGroup *v27;
  id v28;
  id v29;
  id v30;
  void *j;
  _TtC8Freeform15CRLCommandGroup *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v38;
  _TtC8Freeform26CRLCommandDeleteBoardItems *v39;
  _TtC8Freeform15CRLCommandGroup *v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v45;
  id v46;
  void *v47;
  id obj;
  uint64_t v49;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];

  v5 = a5;
  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    v8 = v7;
    v46 = v7;
    v45 = v5;
    if (v6)
    {
      v9 = objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper infosToDeleteToDeleteInfos:](self, "infosToDeleteToDeleteInfos:", v8));

      v8 = (id)v9;
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v51 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 0);
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&v16 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v11).n128_u64[0];
          v18 = v17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "parentInfo", v16));
          v20 = sub_100221D0C(v18, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (v21)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "objectForKeyedSubscript:", v21));
            if (!v23)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
              objc_msgSend(v51, "setObject:forKey:", v23, v21);
            }
            objc_opt_class(_TtC8Freeform12CRLBoardItem, v22);
            v25 = sub_1002223BC(v24, v15);
            v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            objc_msgSend(v23, "addObject:", v26);

          }
          else
          {
            objc_msgSend(v47, "addObject:", v15);
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v12);
    }

    v27 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
    if (objc_msgSend(v51, "count"))
    {
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v28 = v51;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
      if (v29)
      {
        v30 = v29;
        v49 = *(_QWORD *)v53;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            v32 = v27;
            if (*(_QWORD *)v53 != v49)
              objc_enumerationMutation(v28);
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)j)));
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper infosForAdjustingConnectionLinesAfterRemove:](CRLConnectionLineAdjustmentHelper, "infosForAdjustingConnectionLinesAfterRemove:", v33));
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
            v37 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v34, v33, v35, v36));

            v27 = v32;
            if (objc_msgSend(v37, "count"))
              -[CRLCommandGroup addCommands:](v32, "addCommands:", v37);
            v38 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:]([_TtC8Freeform26CRLCommandDeleteBoardItems alloc], "initWithBoardItemsToDelete:", v33);
            -[CRLCommandGroup addCommand:](v32, "addCommand:", v38);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v30);
      }

    }
    if (objc_msgSend(v47, "count"))
    {
      v39 = -[CRLCommandDeleteBoardItems initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:]([_TtC8Freeform26CRLCommandDeleteBoardItems alloc], "initWithBoardItemsToDelete:canDeleteNewlyCreatedItems:", v47, v45);
      -[CRLCommandGroup addCommand:](v27, "addCommand:", v39);

    }
    if (-[CRLCommandGroup isEmpty](v27, "isEmpty"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      v40 = v27;
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242A10);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E098EC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101242A30);
      v41 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:canDeleteNewlyCreatedInfos:]"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v42, v43, 2206, 0, "Shouldn't vend an empty command group: %@", v40);

      v27 = v40;
    }

    v7 = v46;
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)infosToDeleteToDeleteInfos:(id)a3
{
  void *v3;
  void **p_ivar_lyt;
  id v5;
  uint64_t v6;
  id v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void **v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v38;
  id obj;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v40 = objc_msgSend(a3, "mutableCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
  p_ivar_lyt = &CRLiOSFolderGridViewController.GridSeparator.ivar_lyt;
  while (1)
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = objc_msgSend(v40, "copy");
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (!v5)
      break;
    v7 = v5;
    v8 = 0;
    v9 = *(_QWORD *)v42;
    do
    {
      v10 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v10);
        *(_QWORD *)&v12 = objc_opt_class(p_ivar_lyt + 193, v6).n128_u64[0];
        v14 = v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "parentInfo", v12));
        v16 = sub_100221D0C(v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

        if (v17)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v17));
          if (!v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "childInfos"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v19));

            objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v17);
          }
          if (objc_msgSend(v18, "isSubsetOfSet:", v40))
          {
            v21 = v9;
            v22 = v3;
            v23 = p_ivar_lyt;
            *(_QWORD *)&v24 = objc_opt_class(p_ivar_lyt + 193, v20).n128_u64[0];
            v26 = v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentInfo", v24));
            v28 = sub_100221D0C(v26, v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "childInfos"));
            v31 = objc_msgSend(v30, "count");

            if (v31 == (id)1)
            {
              do
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "parentInfo"));

                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "childInfos"));
                v34 = objc_msgSend(v33, "count");

                v29 = v32;
              }
              while (v34 == (id)1);
            }
            else
            {
              v32 = v29;
            }
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allNestedChildrenItemsIncludingGroups"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v35));
            objc_msgSend(v40, "minusSet:", v36);

            objc_msgSend(v40, "addObject:", v17);
            v8 = 1;
            p_ivar_lyt = v23;
            v3 = v22;
            v9 = v21;
            v7 = v38;
          }

        }
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v7);

    if ((v8 & 1) == 0)
      goto LABEL_22;
  }

LABEL_22:
  return v40;
}

- (id)commandsToSwapConnectionsFromRep:(id)a3 toInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
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
  uint64_t v25;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v26;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v27;
  id v29;
  id obj;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v6 = a3;
  v31 = a4;
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedLayouts"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectedLayouts"));

    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (!v12)
      goto LABEL_15;
    v13 = v12;
    v14 = *(_QWORD *)v33;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v15), "connectionLineInfo"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mainBoard"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getConnectedFromWithBoardItemOwner:", v18));

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mainBoard"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "getConnectedToWithBoardItemOwner:", v21));

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
        if (v19 == v23)
        {
          v25 = 0;
        }
        else
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));

          if (v22 != v24)
            goto LABEL_13;
          v25 = 1;
        }
        v26 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:", v16, v31, v25);
        if (v26)
        {
          v27 = v26;
          objc_msgSend(v29, "addObject:", v26);

        }
LABEL_13:

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (!v13)
      {
LABEL_15:

        break;
      }
    }
  }

  return v29;
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  _BYTE v40[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelContainerInfoForEditing"));
  objc_opt_class(NSObject, v8);
  v15 = sub_1002220C8(v7, v9, 1, v10, v11, v12, v13, v14, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    objc_opt_class(_TtC8Freeform12CRLGroupItem, v17);
    v19 = sub_100221D0C(v18, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if (v20 && -[CRLCanvasEditorHelper canInsertBoardItems:intoGroup:](self, "canInsertBoardItems:intoGroup:", v5, v20))
    {
      memset(&v39, 0, sizeof(v39));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topLevelContainerRepForEditing"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layout"));
      v24 = v23;
      if (v23)
        objc_msgSend(v23, "transformInRoot");
      else
        memset(&v39, 0, sizeof(v39));

      v37 = v39;
      CGAffineTransformInvert(&v38, &v37);
      v39 = v38;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = v5;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "geometry"));
            v38 = v39;
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "geometryByAppendingTransform:", &v38));
            objc_msgSend(v30, "setGeometry:", v32);

          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
        }
        while (v27);
      }

    }
  }

}

- (void)p_fixupGeometryForInsertingBoardItems:(id)a3 intoContainer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  if (a4)
  {
    v7 = a4;
    objc_opt_class(_TtC8Freeform12CRLGroupItem, v8);
    v10 = sub_100221D0C(v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v11 && -[CRLCanvasEditorHelper canInsertBoardItems:intoGroup:](self, "canInsertBoardItems:intoGroup:", v6, v11))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPathWithInfo:", v11));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1001D24AC;
      v15[3] = &unk_101242A58;
      v16 = v11;
      v17 = v6;
      objc_msgSend(v12, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v14, v15);

    }
  }

}

- (void)prepareGeometryForPastingBoardItems:(id)a3 fromPasteboard:(id)a4 intoContainer:(id)a5 useOriginalPositions:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  CRLBoardItemPositioner *v16;
  void *v17;
  double v18;
  double v19;
  CRLBoardItemPositioner *v20;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double v27;
  CRLBoardItemPositioner *v28;
  void *v29;
  id v30;

  v6 = a6;
  v30 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = v12;
  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName"));

    if ((v15 & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      v20 = [CRLBoardItemPositioner alloc];
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
      v16 = -[CRLBoardItemPositioner initWithCanvasEditor:](v20, "initWithCanvasEditor:", v21);

      -[CRLBoardItemPositioner setAvoidCollisions:](v16, "setAvoidCollisions:", 0);
    }
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "infosForCurrentSelectionPath"));
    if (objc_msgSend(v17, "count"))
    {
      -[CRLCanvasEditorHelper p_centerOfBoardItems:](self, "p_centerOfBoardItems:", v17);
    }
    else
    {
      objc_msgSend(v13, "visibleUnscaledRect");
      v18 = sub_100061400(v22, v23, v24, v25);
    }
    v26 = v18;
    v27 = v19;
    v28 = [CRLBoardItemPositioner alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v16 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:](v28, "initWithCanvasEditor:targetCenter:validGeometries:", v29, 1, v26, v27);

    -[CRLBoardItemPositioner setShouldPreserveRelativePositions:](v16, "setShouldPreserveRelativePositions:", 1);
  }
  -[CRLBoardItemPositioner positionBoardItems:](v16, "positionBoardItems:", v11);
  -[CRLCanvasEditorHelper p_fixupGeometryForInsertingBoardItems:intoContainer:](self, "p_fixupGeometryForInsertingBoardItems:intoContainer:", v11, v10);

}

- (CGPoint)p_centerOfBoardItems:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  unsigned int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
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
  __int16 v52;
  const char *v53;
  _BYTE v54[128];
  CGPoint result;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v4 = a3;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v41;
    v37 = height;
    v38 = width;
    v39 = y;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v4);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layoutForInfo:", v13));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pureGeometryInRoot"));
          objc_msgSend(v16, "frame");
          v18 = v17;
          v20 = v19;
          v22 = v21;
          v24 = v23;

          v56.origin.x = x;
          v56.origin.y = y;
          v56.size.width = width;
          v56.size.height = height;
          v59.origin.y = v39;
          v59.origin.x = CGRectZero.origin.x;
          v59.size.height = v37;
          v59.size.width = v38;
          if (CGRectEqualToRect(v56, v59))
          {
            height = v24;
            width = v22;
            y = v20;
            x = v18;
          }
          else
          {
            v57.origin.x = x;
            v57.origin.y = y;
            v57.size.width = width;
            v57.size.height = height;
            v60.origin.x = v18;
            v60.origin.y = v20;
            v60.size.width = v22;
            v60.size.height = v24;
            v58 = CGRectUnion(v57, v60);
            x = v58.origin.x;
            y = v58.origin.y;
            width = v58.size.width;
            height = v58.size.height;
          }
        }
        else
        {
          v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242A78);
          v26 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v45 = v25;
            v46 = 2082;
            v47 = "-[CRLCanvasEditorHelper p_centerOfBoardItems:]";
            v48 = 2082;
            v49 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m";
            v50 = 1024;
            v51 = 2369;
            v52 = 2082;
            v53 = "layout";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101242A98);
          v27 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v30 = v27;
            v31 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v45 = v25;
            v46 = 2114;
            v47 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditorHelper p_centerOfBoardItems:]"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditorHelper.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 2369, 0, "invalid nil value for '%{public}s'", "layout");

        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    }
    while (v10);
  }
  v32 = sub_100061400(x, y, width, height);
  v34 = v33;

  v35 = v32;
  v36 = v34;
  result.y = v36;
  result.x = v35;
  return result;
}

- (id)insertCopiesOfInfos:(id)a3 forDuplicatingDragOnRep:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelZOrderedSiblingsOfInfos:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crl_arrayWithObjectsInSet:", v6));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "boardItemFactory"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "makeDuplicateOfBoardItems:", v12));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext nonInteractiveInsertionContext](CRLInsertionContext, "nonInteractiveInsertionContext"));
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_1001D2E70;
  v24 = sub_1001D2E80;
  v25 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001D2E88;
  v19[3] = &unk_101242AC0;
  v19[4] = v15;
  v19[5] = v16;
  v19[6] = &v20;
  objc_msgSend(v10, "enumerateEditorsOnStackUsingBlock:", v19);
  objc_msgSend((id)v21[5], "insertBoardItems:withInsertionContext:postProcessBlock:", v15, v16, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (void)enterQuickSelectMode:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

  objc_msgSend(v6, "enterQuickSelectMode");
}

- (void)presentAlignmentTools:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

  objc_msgSend(v6, "presentAlignmentTools");
}

- (void)bringToFront:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrangeInspectorDelegate"));
  objc_msgSend(v3, "moveToFrontForArrangeInspector");

}

- (void)bringForward:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrangeInspectorDelegate"));
  objc_msgSend(v3, "moveFrontForArrangeInspector");

}

- (void)sendBackward:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrangeInspectorDelegate"));
  objc_msgSend(v3, "moveBackForArrangeInspector");

}

- (void)sendToBack:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrangeInspectorDelegate"));
  objc_msgSend(v3, "moveToBackForArrangeInspector");

}

- (id)layoutsForAlignAndDistribute
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper editingCoordinator](self, "editingCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainBoard"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionModelTranslator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "unlockedBoardItemsForSelectionPath:", v8));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001D3274;
  v16[3] = &unk_101242AE8;
  v16[4] = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v16));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "filteredSetUsingPredicate:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layoutController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layoutsForInfos:", v11));

  return v14;
}

- (void)alignDrawablesByEdge:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  void *v64;
  void *v65;
  CRLCanvasCommandSelectionBehavior *v66;
  void *v67;
  CRLCanvasEditorHelper *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id v77;
  _BYTE v78[128];
  _BYTE v79[128];

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  -[CRLCommandSelectionBehavior setSelectionFlags:](v9, "setSelectionFlags:", -[CRLCommandSelectionBehavior selectionFlags](v9, "selectionFlags") | 4);
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  v66 = v9;
  switch((int)v3)
  {
    case 0:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Left");
      goto LABEL_9;
    case 1:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Center");
      goto LABEL_9;
    case 2:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Right");
      goto LABEL_9;
    case 3:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Top");
      goto LABEL_9;
    case 4:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Middle");
      goto LABEL_9;
    case 5:
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = v10;
      v12 = CFSTR("Align Bottom");
LABEL_9:
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, 0, CFSTR("UndoStrings")));

      break;
    default:
      v13 = 0;
      break;
  }
  v65 = (void *)v13;
  objc_msgSend(v6, "setCurrentGroupActionString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = objc_msgSend(v14, "hasSelectedInfosInMultipleContainers");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute"));
  v77 = 0;
  -[CRLCanvasEditorHelper willRepositionLayouts:additionalData:](self, "willRepositionLayouts:additionalData:", v16, &v77);
  v67 = v6;
  v68 = self;
  if (objc_msgSend(v16, "count") == (id)1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "anyObject"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentLayoutForProvidingGuides"));
    objc_opt_class(CRLCanvasRootLayout, v19);
    if ((objc_opt_isKindOfClass(v18, v20) & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "interactiveCanvasController"));
      v64 = v17;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvas"));
      objc_msgSend(v23, "unscaledSize");

      v24 = sub_10005FDDC();
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interactiveCanvasController"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "canvas"));
      v34 = objc_msgSend(v33, "isAnchoredAtRight");

      v17 = v64;
      v35 = 0.0;
      if (v34)
        v35 = v28;
      v36 = v24 - v35;
    }
    else
    {
      objc_msgSend(v18, "alignmentFrame");
      v36 = sub_10005FDDC();
      v26 = v41;
      v28 = v42;
      v30 = v43;
    }

  }
  else
  {
    -[CRLCanvasEditorHelper p_boundingBoxForLayouts:inRootSpace:](self, "p_boundingBoxForLayouts:inRootSpace:", v16, v15);
    v36 = v37;
    v26 = v38;
    v28 = v39;
    v30 = v40;
  }
  v44 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v16, "count"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v45 = v16;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v48)
          objc_enumerationMutation(v45);
        v50 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        -[CRLCanvasEditorHelper p_offsetToMoveLayout:edge:toOffset:inRootSpace:](v68, "p_offsetToMoveLayout:edge:toOffset:inRootSpace:", v50, v3, v15, sub_10005FD50(v3, v36, v26, v28, v30));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        objc_msgSend(v44, "setObject:forKey:", v51, v50);

      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
    }
    while (v47);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v52 = v45;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(_QWORD *)v70 != v55)
          objc_enumerationMutation(v52);
        v57 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j);
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectForKeyedSubscript:", v57));
        objc_msgSend(v58, "CGPointValue");
        v60 = v59;
        v62 = v61;

        v63 = objc_msgSend(v57, "newCommandToMoveByOffset:whenDistributingLayoutsByOffsets:", v44, v60, v62);
        if (v63)
          objc_msgSend(v67, "enqueueCommand:", v63);

      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    }
    while (v54);
  }

  -[CRLCanvasEditorHelper didRepositionLayouts:additionalData:](v68, "didRepositionLayouts:additionalData:", v52, &v77);
  objc_msgSend(v67, "closeGroup");

}

- (void)distributeDrawablesByEdge:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  id v46;
  id v47;
  id v48;
  id v49;
  int v50;
  double v51;
  uint64_t v52;
  void *i;
  uint64_t v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  void *j;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  id v67;
  void *v68;
  void *v69;
  CRLCanvasCommandSelectionBehavior *v70;
  void *v71;
  CRLCanvasEditorHelper *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[4];
  int v82;
  char v83;
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v72 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  v70 = v9;
  if ((v3 - 3) < 3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("Distribute Vertically");
    goto LABEL_5;
  }
  if (v3 <= 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("Distribute Horizontally");
LABEL_5:
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, 0, CFSTR("UndoStrings")));

    goto LABEL_6;
  }
  v13 = 0;
LABEL_6:
  objc_msgSend(v6, "setCurrentGroupActionString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](v72, "layoutsForAlignAndDistribute"));
  v84 = 0;
  -[CRLCanvasEditorHelper willRepositionLayouts:additionalData:](v72, "willRepositionLayouts:additionalData:", v14, &v84);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](v72, "interactiveCanvasController"));
  v16 = objc_msgSend(v15, "hasSelectedInfosInMultipleContainers");

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "allObjects"));
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_1001D3E00;
  v81[3] = &unk_101242B08;
  v83 = v16;
  v82 = v3;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", v81));

  v19 = objc_msgSend(v18, "count");
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", 0));
  v21 = v20;
  v71 = v6;
  v69 = (void *)v13;
  if (v16)
  {
    objc_msgSend(v20, "alignmentFrameInRoot");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    objc_msgSend(v30, "alignmentFrameInRoot");
  }
  else
  {
    objc_msgSend(v20, "alignmentFrame");
    v23 = v35;
    v25 = v36;
    v27 = v37;
    v29 = v38;

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastObject"));
    objc_msgSend(v30, "alignmentFrame");
  }
  v39 = v31;
  v40 = v32;
  v41 = v33;
  v42 = v34;

  v43 = sub_10005FD50(v3, v23, v25, v27, v29);
  v44 = v3;
  v45 = sub_10005FD50(v3, v39, v40, v41, v42);
  v68 = v14;
  v46 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(v14, "count"));
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v47 = v18;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
  if (v48)
  {
    v49 = v48;
    v50 = 0;
    v51 = (v45 - v43) / (float)((float)(unint64_t)v19 + -1.0);
    v52 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(_QWORD *)v78 != v52)
          objc_enumerationMutation(v47);
        v54 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
        -[CRLCanvasEditorHelper p_offsetToMoveLayout:edge:toOffset:inRootSpace:](v72, "p_offsetToMoveLayout:edge:toOffset:inRootSpace:", v54, v44, v16, v43 + v51 * (double)(v50 + (int)i));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        objc_msgSend(v46, "setObject:forKey:", v55, v54);

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v77, v86, 16);
      v50 += (int)i;
    }
    while (v49);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v56 = v47;
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v58; j = (char *)j + 1)
      {
        if (*(_QWORD *)v74 != v59)
          objc_enumerationMutation(v56);
        v61 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "objectForKeyedSubscript:", v61));
        objc_msgSend(v62, "CGPointValue");
        v64 = v63;
        v66 = v65;

        v67 = objc_msgSend(v61, "newCommandToMoveByOffset:whenDistributingLayoutsByOffsets:", v46, v64, v66);
        if (v67)
          objc_msgSend(v71, "enqueueCommand:", v67);

      }
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v73, v85, 16);
    }
    while (v58);
  }

  -[CRLCanvasEditorHelper didRepositionLayouts:additionalData:](v72, "didRepositionLayouts:additionalData:", v68, &v84);
  objc_msgSend(v71, "closeGroup");

}

- (void)distributeDrawablesEvenly
{
  void *v3;
  id v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  uint64_t v20;
  void *i;
  void *v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CRLCanvasCommandSelectionBehavior *v42;
  void *v43;
  CRLCanvasCommandSelectionBehavior *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  NSValue *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  double v77;
  CGFloat v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat v91;
  id v92;
  id v93;
  id v94;
  id v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  void *k;
  void *v107;
  void *v108;
  double v109;
  id v110;
  id v111;
  id v112;
  uint64_t v113;
  void *m;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  id v121;
  CRLCanvasEditorHelper *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  CRLCanvasCommandSelectionBehavior *v126;
  void *v127;
  id v128;
  id obj;
  CRLCanvasEditorHelper *v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = objc_msgSend(v3, "hasSelectedInfosInMultipleContainers");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute"));
  v130 = self;
  -[CRLCanvasEditorHelper p_boundingBoxForLayouts:inRootSpace:](self, "p_boundingBoxForLayouts:inRootSpace:", v5, v4);
  v10 = sub_100061400(v6, v7, v8, v9);
  v12 = v11;
  x = CGPointZero.x;
  y = CGPointZero.y;
  v15 = objc_msgSend(v5, "count");
  v144 = 0u;
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v16 = v5;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 1.0 / (double)(unint64_t)v15;
    v20 = *(_QWORD *)v145;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v145 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)i);
        if ((_DWORD)v4)
          objc_msgSend(v22, "alignmentFrameInRoot");
        else
          objc_msgSend(v22, "alignmentFrame");
        v27 = sub_100061400(v23, v24, v25, v26);
        v29 = sub_1000603B8(v27, v28, v10);
        if (v29 >= 0.0)
        {
          if (v29 == 0.0)
            v30 = fabs(v30);
        }
        else
        {
          v29 = sub_1000603DC(v29, v30, -1.0);
        }
        v31 = sub_100060398(v29, v30);
        v33 = sub_1000603DC(v31, v32, v19);
        x = sub_1000603D0(x, y, v33);
        y = v34;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
    }
    while (v18);
  }

  v35 = sub_100060398(x, y);
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](v130, "interactiveCanvasController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "commandController"));

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Distribute Evenly"), 0, CFSTR("UndoStrings")));

  if ((v35 == 0.0 || fabs(v35) < 0.00999999978) && (v37 == 1.0 || fabs(v37 + -1.0) < 0.00999999978))
  {
    objc_msgSend(v39, "openGroup");
    objc_msgSend(v39, "setCurrentGroupActionString:", v41);
    v122 = v130;
    v123 = 4;
LABEL_55:
    -[CRLCanvasEditorHelper distributeDrawablesByEdge:](v122, "distributeDrawablesByEdge:", v123);
    objc_msgSend(v39, "closeGroup");
    goto LABEL_56;
  }
  if ((v35 == 1.0 || fabs(v35 + -1.0) < 0.00999999978) && (v37 == 0.0 || fabs(v37) < 0.00999999978))
  {
    objc_msgSend(v39, "openGroup");
    objc_msgSend(v39, "setCurrentGroupActionString:", v41);
    v122 = v130;
    v123 = 1;
    goto LABEL_55;
  }
  v42 = [CRLCanvasCommandSelectionBehavior alloc];
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](v130, "canvasEditor"));
  v44 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v42, "initWithCanvasEditor:type:", v43, 2);

  v126 = v44;
  objc_msgSend(v39, "openGroupWithSelectionBehavior:", v44);
  v127 = v41;
  objc_msgSend(v39, "setCurrentGroupActionString:", v41);
  v143 = 0;
  -[CRLCanvasEditorHelper willRepositionLayouts:additionalData:](v130, "willRepositionLayouts:additionalData:", v16, &v143);
  v45 = objc_alloc_init((Class)NSMutableSet);
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v128 = v16;
  obj = v16;
  v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v140;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(_QWORD *)v140 != v48)
          objc_enumerationMutation(obj);
        v50 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * (_QWORD)j);
        if ((_DWORD)v4)
          objc_msgSend(v50, "alignmentFrameInRoot");
        else
          objc_msgSend(v50, "alignmentFrame");
        v55 = sub_100061400(v51, v52, v53, v54);
        v57 = sub_1000603B8(v55, v56, v10);
        v59 = sub_1000603C4(v57, v58, v35, v37);
        v60 = sub_1000603DC(v35, v37, v59);
        v61 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", sub_1000603D0(v10, v12, v60));
        v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPair pairWithFirst:second:](CRLPair, "pairWithFirst:second:", v50, v62));

        objc_msgSend(v45, "addObject:", v63);
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v150, 16);
    }
    while (v47);
  }

  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "allObjects"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "sortedArrayUsingComparator:", &stru_101242B48));

  v66 = objc_msgSend(v65, "count");
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectAtIndex:", 0));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "lastObject"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "first"));
  v70 = v69;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v69, "frameInRoot", v68, v67);
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v78 = v77;

    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "first"));
    objc_msgSend(v79, "frameInRoot");
  }
  else
  {
    objc_msgSend(v69, "frame", v68, v67);
    v72 = v84;
    v74 = v85;
    v76 = v86;
    v78 = v87;

    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "first"));
    objc_msgSend(v79, "frame");
  }
  v88 = v80;
  v89 = v81;
  v90 = v82;
  v91 = v83;

  v92 = objc_msgSend(objc_alloc((Class)NSMapTable), "initWithKeyOptions:valueOptions:capacity:", 512, 0, objc_msgSend(obj, "count"));
  v135 = 0u;
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v93 = v65;
  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
  if (v94)
  {
    v95 = v94;
    v96 = sub_100061400(v88, v89, v90, v91);
    v98 = v97;
    v99 = sub_100061400(v72, v74, v76, v78);
    v101 = v100;
    v102 = sub_1000603B8(v96, v98, v99);
    v104 = sub_1000603DC(v102, v103, 1.0 / (double)((unint64_t)v66 - 1));
    v105 = *(_QWORD *)v136;
    do
    {
      for (k = 0; k != v95; k = (char *)k + 1)
      {
        if (*(_QWORD *)v136 != v105)
          objc_enumerationMutation(v93);
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * (_QWORD)k), "first"));
        -[CRLCanvasEditorHelper p_offsetToMoveCenterOfLayout:toPoint:inRootSpace:](v130, "p_offsetToMoveCenterOfLayout:toPoint:inRootSpace:", v107, v4, v99, v101);
        v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:"));
        objc_msgSend(v92, "setObject:forKey:", v108, v107);

        v99 = sub_1000603D0(v99, v101, v104);
        v101 = v109;

      }
      v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v135, v149, 16);
    }
    while (v95);
  }

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v110 = v93;
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v132;
    do
    {
      for (m = 0; m != v112; m = (char *)m + 1)
      {
        if (*(_QWORD *)v132 != v113)
          objc_enumerationMutation(v110);
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * (_QWORD)m), "first"));
        v116 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", v115));
        objc_msgSend(v116, "CGPointValue");
        v118 = v117;
        v120 = v119;

        v121 = objc_msgSend(v115, "newCommandToMoveByOffset:whenDistributingLayoutsByOffsets:", v92, v118, v120);
        if (v121)
          objc_msgSend(v39, "enqueueCommand:", v121);

      }
      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v131, v148, 16);
    }
    while (v112);
  }

  -[CRLCanvasEditorHelper didRepositionLayouts:additionalData:](v130, "didRepositionLayouts:additionalData:", obj, &v143);
  objc_msgSend(v39, "closeGroup");

  v16 = v128;
  v41 = v127;
LABEL_56:

}

- (CGRect)p_boundingBoxForLayouts:(id)a3 inRootSpace:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;
  CGRect v36;

  v4 = a4;
  v5 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v13);
        if (v4)
          objc_msgSend(v14, "alignmentFrameInRoot");
        else
          objc_msgSend(v14, "alignmentFrame");
        v19 = v15;
        v20 = v16;
        v21 = v17;
        v22 = v18;
        v32.origin.x = x;
        v32.origin.y = y;
        v32.size.width = width;
        v32.size.height = height;
        if (CGRectIsNull(v32))
        {
          height = v22;
          width = v21;
          y = v20;
          x = v19;
        }
        else
        {
          v33.origin.x = x;
          v33.origin.y = y;
          v33.size.width = width;
          v33.size.height = height;
          v36.origin.x = v19;
          v36.origin.y = v20;
          v36.size.width = v21;
          v36.size.height = v22;
          v34 = CGRectUnion(v33, v36);
          x = v34.origin.x;
          y = v34.origin.y;
          width = v34.size.width;
          height = v34.size.height;
        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGPoint)p_offsetToMoveCenterOfLayout:(id)a3 toPoint:(CGPoint)a4 inRootSpace:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat tx;
  CGFloat ty;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _OWORD v23[3];
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGPoint result;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  v8 = a3;
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "alignmentFrameInRoot");
  else
    objc_msgSend(v8, "alignmentFrame");
  v14 = sub_100061400(v10, v11, v12, v13);
  v15 = sub_1000603B8(x, y, v14);
  tx = v15;
  ty = v16;
  if (v5)
  {
    memset(&v25, 0, sizeof(v25));
    CGAffineTransformMakeTranslation(&v24, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "parent"));
    v20 = v19;
    if (v19)
      objc_msgSend(v19, "transformInRoot");
    else
      memset(v23, 0, sizeof(v23));
    sub_100079650(&v24, v23, &v25);

    ty = v25.ty;
    tx = v25.tx;
  }

  v21 = tx;
  v22 = ty;
  result.y = v22;
  result.x = v21;
  return result;
}

- (CGPoint)p_offsetToMoveLayout:(id)a3 edge:(int)a4 toOffset:(double)a5 inRootSpace:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat tx;
  CGFloat v19;
  CGFloat ty;
  void *v21;
  void *v22;
  double v23;
  double v24;
  _OWORD v25[3];
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGPoint result;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v9 = a3;
  v10 = v9;
  if (v6)
    objc_msgSend(v9, "alignmentFrameInRoot");
  else
    objc_msgSend(v9, "alignmentFrame");
  v15 = a5 - sub_10005FD50(v8, v11, v12, v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLSwappableAxesGeometry geometryWithXAxisAlongEdge:](CRLSwappableAxesGeometry, "geometryWithXAxisAlongEdge:", v8));
  objc_msgSend(v16, "pointX:", v15, 0.0);
  tx = v17;
  objc_msgSend(v16, "pointY:", v15, 0.0);
  ty = v19;
  if (v6)
  {
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeTranslation(&v26, tx, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parent"));
    v22 = v21;
    if (v21)
      objc_msgSend(v21, "transformInRoot");
    else
      memset(v25, 0, sizeof(v25));
    sub_100079650(&v26, v25, &v27);

    ty = v27.ty;
    tx = v27.tx;
  }

  v23 = tx;
  v24 = ty;
  result.y = v24;
  result.x = v23;
  return result;
}

- (BOOL)p_allowsCanvasScrollingFromKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layerHost"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "asUIKitHost"));

  LOBYTE(v2) = objc_msgSend(v5, "allowsCanvasScrollingFromKeyboard");
  return (char)v2;
}

- (CGPoint)contentOffsetForDocumentNavigationType:(unint64_t)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double Height;
  double v20;
  double Width;
  double v22;
  double v23;
  double v24;
  CGPoint result;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "visibleBoundsRectUsingSizeOfEnclosingScrollView");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "viewScale");
  v14 = v13;
  objc_msgSend(v4, "contentOffset");
  v16 = v15;
  v18 = v17;
  switch(a3)
  {
    case 0uLL:
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      Height = CGRectGetHeight(v26);
      v20 = -0.05;
      goto LABEL_9;
    case 1uLL:
      v27.origin.x = v6;
      v27.origin.y = v8;
      v27.size.width = v10;
      v27.size.height = v12;
      Height = CGRectGetHeight(v27);
      v20 = 0.05;
      goto LABEL_9;
    case 2uLL:
      v28.origin.x = v6;
      v28.origin.y = v8;
      v28.size.width = v10;
      v28.size.height = v12;
      Width = CGRectGetWidth(v28);
      v22 = -0.05;
      goto LABEL_6;
    case 3uLL:
      v29.origin.x = v6;
      v29.origin.y = v8;
      v29.size.width = v10;
      v29.size.height = v12;
      Width = CGRectGetWidth(v29);
      v22 = 0.05;
LABEL_6:
      v16 = v16 + Width * v22 / v14;
      break;
    case 4uLL:
      v30.origin.x = v6;
      v30.origin.y = v8;
      v30.size.width = v10;
      v30.size.height = v12;
      Height = CGRectGetHeight(v30);
      v20 = -0.8;
      goto LABEL_9;
    case 5uLL:
      v31.origin.x = v6;
      v31.origin.y = v8;
      v31.size.width = v10;
      v31.size.height = v12;
      Height = CGRectGetHeight(v31);
      v20 = 0.8;
LABEL_9:
      v18 = v18 + Height * v20 / v14;
      break;
    default:
      break;
  }

  v23 = v16;
  v24 = v18;
  result.y = v24;
  result.x = v23;
  return result;
}

- (void)p_scrollCanvasForScrollType:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLCanvasEditorHelper contentOffsetForDocumentNavigationType:](self, "contentOffsetForDocumentNavigationType:", a3);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v10, "viewScale");
  objc_msgSend(v10, "clampedUnscaledContentOffset:forViewScale:", v6, v8, v9);
  objc_msgSend(v10, "setContentOffset:scrollOptions:", 1);

}

- (void)scrollCanvasUp:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 0);
}

- (void)scrollCanvasDown:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 1);
}

- (void)scrollCanvasLeft:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 2);
}

- (void)scrollCanvasRight:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 3);
}

- (void)scrollCanvasPageDown:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 5);
}

- (void)scrollCanvasPageUp:(id)a3
{
  if (-[CRLCanvasEditorHelper p_allowsCanvasScrollingFromKeyboard](self, "p_allowsCanvasScrollingFromKeyboard", a3))
    -[CRLCanvasEditorHelper p_scrollCanvasForScrollType:](self, "p_scrollCanvasForScrollType:", 4);
}

- (void)zoomIn:(id)a3
{
  void *v3;
  void *v4;
  _TtC8Freeform16CRLiOSZoomHelper *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  v5 = -[CRLiOSZoomHelper initWithInteractiveCanvasController:zoomTrackerDelegate:]([_TtC8Freeform16CRLiOSZoomHelper alloc], "initWithInteractiveCanvasController:zoomTrackerDelegate:", v6, v4);
  -[CRLiOSZoomHelper incrementZoomLevel](v5, "incrementZoomLevel");

}

- (void)zoomOut:(id)a3
{
  void *v3;
  void *v4;
  _TtC8Freeform16CRLiOSZoomHelper *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  v5 = -[CRLiOSZoomHelper initWithInteractiveCanvasController:zoomTrackerDelegate:]([_TtC8Freeform16CRLiOSZoomHelper alloc], "initWithInteractiveCanvasController:zoomTrackerDelegate:", v6, v4);
  -[CRLiOSZoomHelper decrementZoomLevel](v5, "decrementZoomLevel");

}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  id v25;
  void *v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  double v30;
  double v31;
  id v32;

  v32 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = objc_msgSend(v6, "editingDisabled");

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSCVC"));
    objc_msgSend(v10, "hideEditMenu");

    v11 = objc_msgSend(v32, "rawValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextInputModifierKeyMask none](_TtC8Freeform27CRLTextInputModifierKeyMask, "none"));
    v13 = objc_msgSend(v12, "rawValue");

    if (v11 == v13)
    {
      -[CRLCanvasEditorHelper moveSelections:](self, "moveSelections:", a3);
    }
    else
    {
      v14 = objc_msgSend(v32, "rawValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextInputModifierKeyMask shift](_TtC8Freeform27CRLTextInputModifierKeyMask, "shift"));
      v16 = objc_msgSend(v15, "rawValue");

      if (v14 == v16)
      {
        switch(a3)
        {
          case 1uLL:
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v17;
            v19 = -10.0;
            goto LABEL_16;
          case 2uLL:
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v17;
            v19 = 10.0;
LABEL_16:
            v30 = 0.0;
            goto LABEL_17;
          case 3uLL:
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v17;
            v19 = 0.0;
            v30 = -10.0;
            goto LABEL_17;
          case 4uLL:
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v17;
            v19 = 0.0;
            v30 = 10.0;
LABEL_17:
            objc_msgSend(v17, "moveSelectionByDelta:", v19, v30);
            goto LABEL_24;
          default:
            goto LABEL_25;
        }
      }
      v20 = objc_msgSend(v32, "rawValue");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextInputModifierKeyMask option](_TtC8Freeform27CRLTextInputModifierKeyMask, "option"));
      v22 = objc_msgSend(v21, "rawValue");

      if (v20 == v22)
      {
        switch(a3)
        {
          case 1uLL:
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v23;
            v24 = -1.0;
            goto LABEL_22;
          case 2uLL:
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v23;
            v24 = 1.0;
            goto LABEL_22;
          case 3uLL:
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v23;
            v24 = 0.0;
            v31 = -1.0;
            goto LABEL_23;
          case 4uLL:
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
            v18 = v23;
            v24 = 0.0;
            v31 = 1.0;
            goto LABEL_23;
          default:
            break;
        }
      }
      else
      {
        v25 = objc_msgSend(v32, "rawValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextInputModifierKeyMask option](_TtC8Freeform27CRLTextInputModifierKeyMask, "option"));
        v27 = (unint64_t)objc_msgSend(v26, "rawValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextInputModifierKeyMask shift](_TtC8Freeform27CRLTextInputModifierKeyMask, "shift"));
        v29 = (unint64_t)objc_msgSend(v28, "rawValue") | v27;

        if (v25 == (id)v29)
        {
          switch(a3)
          {
            case 1uLL:
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
              v18 = v23;
              v24 = -10.0;
              goto LABEL_22;
            case 2uLL:
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
              v18 = v23;
              v24 = 10.0;
LABEL_22:
              v31 = 0.0;
              goto LABEL_23;
            case 3uLL:
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
              v18 = v23;
              v24 = 0.0;
              v31 = -10.0;
              goto LABEL_23;
            case 4uLL:
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
              v18 = v23;
              v24 = 0.0;
              v31 = 10.0;
LABEL_23:
              objc_msgSend(v23, "duplicateSelectionMovingByDelta:", v24, v31);
LABEL_24:

              break;
            default:
              break;
          }
        }
      }
    }
  }
LABEL_25:

}

- (void)moveSelections:(unint64_t)a3
{
  void *v3;
  double v4;
  double v5;
  id v6;

  switch(a3)
  {
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
      v4 = -1.0;
      goto LABEL_4;
    case 2uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
      v4 = 1.0;
LABEL_4:
      v5 = 0.0;
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
      v4 = 0.0;
      v5 = -1.0;
      goto LABEL_7;
    case 4uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper keyboardMovementManipulator](self, "keyboardMovementManipulator"));
      v4 = 0.0;
      v5 = 1.0;
LABEL_7:
      v6 = v3;
      objc_msgSend(v3, "moveSelectionByDelta:", v4, v5);

      break;
    default:
      return;
  }
}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layerHost"));
  objc_msgSend(v11, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", a3, a4, v6, v10);

}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "hitRep:", x, y));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "repForSelecting"));
  if (v10
    && -[CRLCanvasEditorHelper wantsToHighlightRep:forDragOperationWithDragInfo:atPoint:allowNonPlaceholderReplacement:](self, "wantsToHighlightRep:forDragOperationWithDragInfo:atPoint:allowNonPlaceholderReplacement:", v10, v7, 0, x, y))
  {
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  CRLDragAndDropCanvasHighlightDecorator *v5;
  void *v6;
  CRLDragAndDropCanvasHighlightDecorator *v7;
  CRLDragAndDropCanvasHighlightDecorator *mDragAndDropHighlightDecorator;
  id WeakRetained;
  const CGPath *v10;
  id v11;
  id v12;

  if (!self->mDragAndDropHighlightDecorator)
  {
    v5 = [CRLDragAndDropCanvasHighlightDecorator alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = -[CRLDragAndDropCanvasHighlightDecorator initWithInteractiveCanvasController:](v5, "initWithInteractiveCanvasController:", v6);
    mDragAndDropHighlightDecorator = self->mDragAndDropHighlightDecorator;
    self->mDragAndDropHighlightDecorator = v7;

    WeakRetained = objc_loadWeakRetained((id *)&self->mCanvasEditor);
    v10 = (const CGPath *)objc_msgSend(WeakRetained, "newDragAndDropHighlightPathWithInset:", 1.0);

    -[CRLDragAndDropCanvasHighlightDecorator beginHighlightingWithPath:](self->mDragAndDropHighlightDecorator, "beginHighlightingWithPath:", v10);
    CGPathRelease(v10);
  }
  v11 = objc_loadWeakRetained((id *)&self->mCanvasEditor);
  v12 = objc_msgSend(v11, "newDragAndDropHighlightPathWithInset:", 1.0);

  -[CRLDragAndDropCanvasHighlightDecorator setHighlightPath:](self->mDragAndDropHighlightDecorator, "setHighlightPath:", v12);
  CFRelease(v12);
}

- (void)hideDragAndDropUI
{
  CRLDragAndDropCanvasHighlightDecorator *mDragAndDropHighlightDecorator;

  -[CRLDragAndDropCanvasHighlightDecorator endHighlighting](self->mDragAndDropHighlightDecorator, "endHighlighting");
  mDragAndDropHighlightDecorator = self->mDragAndDropHighlightDecorator;
  self->mDragAndDropHighlightDecorator = 0;

}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  return 0;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  return 1;
}

- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v8 = a3;
  v9 = a4;
  if (v8
    && (objc_msgSend(v8, "isLocked") & 1) == 0
    && (objc_msgSend(v8, "isInDynamicOperation") & 1) == 0
    && objc_msgSend(v9, "numberOfDraggingItems") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "promisedUTIs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "itemSource"));
    if (objc_msgSend(v11, "hasNativeBoardItems")
      && (objc_msgSend(v11, "hasSingleNativeImageBoardItem") & 1) == 0
      && !objc_msgSend(v11, "hasSingleNativeMovieBoardItem"))
    {
      v31 = 0;
LABEL_26:

      goto LABEL_13;
    }
    objc_opt_class(CRLImageRep, v12);
    v14 = sub_100221D0C(v13, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_opt_class(CRLShapeRep, v16);
    v18 = sub_100221D0C(v17, v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_opt_class(CRLMovieRep, v20);
    v22 = sub_100221D0C(v21, v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_opt_class(CRLMediaRep, v24);
    v26 = sub_100221D0C(v25, v8);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!v15)
    {
      if (v19 && objc_msgSend(v19, "canBeUsedForImageMask"))
      {
        v37 = v27;
        v39 = 0;
        v28 = v11;
        v29 = v19;
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedImageFileUTTypes](CRLBoardItemImporter, "supportedImageFileUTTypes"));
        goto LABEL_16;
      }
      if (!v23)
      {
        v30 = 0;
        v31 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    v38 = v27;
    v39 = v15;
    v28 = v11;
    v29 = v19;
    v33 = v10;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBoardItemImporter supportedImageFileUTTypes](CRLBoardItemImporter, "supportedImageFileUTTypes", v38));
    v35 = v23;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLIngestionTypes supportedMovieUTTypes](CRLIngestionTypes, "supportedMovieUTTypes"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v36));

    v23 = v35;
    v10 = v33;
LABEL_16:
    if (v30)
    {
      v19 = v29;
      v11 = v28;
      v27 = v37;
      if (!v37 || a6 || objc_msgSend(v37, "shouldAllowReplacementFromDrop"))
        v31 = objc_msgSend(v10, "crl_conformsToAnyUTType:", v30);
      else
        v31 = 0;
      v15 = v39;
    }
    else
    {
      v31 = 0;
      v19 = v29;
      v11 = v28;
      v27 = v37;
      v15 = v39;
    }
    goto LABEL_25;
  }
  v31 = 0;
LABEL_13:

  return v31;
}

- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _TtC8Freeform17CRLCommandSetMask *v65;
  void *v66;
  _TtC8Freeform17CRLCommandSetMask *v67;
  _TtC8Freeform22CRLCommandReplaceImage *v68;
  void *v69;
  void *v70;
  _TtC8Freeform22CRLCommandReplaceImage *v71;
  void *v72;
  uint64_t v73;
  char v74;
  double v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  CRLCanvasCommandSelectionBehavior *v88;
  void *v89;
  void *v90;
  CRLCanvasCommandSelectionBehavior *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  id v95;
  id v96;
  uint64_t v97;
  void *i;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  CRLCanvasCommandSelectionBehavior *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  CRLCanvasCommandSelectionBehavior *v108;
  id v109;
  id v110;
  id v111;
  uint64_t v112;
  void *j;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  unsigned int v121;
  void *v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v131;
  CRLCanvasCommandSelectionBehavior *v132;
  void *v133;
  void *v134;
  CRLCanvasCommandSelectionBehavior *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  BOOL v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _BYTE v157[128];
  _BYTE v158[128];

  y = a4.y;
  x = a4.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = v14;
  v17 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "commandController"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Insert"), 0, CFSTR("UndoStrings")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v22, "endEditing");

  objc_msgSend(v19, "openGroup");
  objc_msgSend(v19, "enableProgressiveEnqueuingInCurrentGroup");
  v23 = objc_msgSend(v13, "count");
  v24 = 0;
  if (!v16 || v23 != (id)1)
    goto LABEL_51;
  v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info"));
  if (!v25)
  {
    v24 = 0;
    goto LABEL_51;
  }
  v26 = (void *)v25;
  v148 = a7;
  v27 = objc_msgSend(v16, "isLocked");

  if ((v27 & 1) == 0)
  {
    v147 = v21;
    v140 = v17;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
    *(_QWORD *)&v30 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v29).n128_u64[0];
    v32 = v31;
    v142 = v16;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "info", v30));
    v34 = sub_100221D0C(v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    objc_opt_class(_TtC8Freeform12CRLImageItem, v36);
    v38 = sub_100221D0C(v37, v28);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    objc_opt_class(_TtC8Freeform12CRLMovieItem, v40);
    v42 = sub_100221D0C(v41, v28);
    v145 = (void *)objc_claimAutoreleasedReturnValue(v42);
    objc_opt_class(_TtC8Freeform12CRLMediaItem, v43);
    v144 = v28;
    v45 = sub_100221D0C(v44, v28);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v47 = (void *)v39;
    objc_opt_class(_TtC8Freeform12CRLImageItem, v48);
    v50 = sub_100221D0C(v49, v35);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    objc_opt_class(_TtC8Freeform12CRLShapeItem, v52);
    v54 = sub_100221D0C(v53, v35);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    objc_opt_class(_TtC8Freeform12CRLMediaItem, v56);
    v143 = v35;
    v57 = v35;
    v58 = v47;
    v60 = sub_100221D0C(v59, v57);
    v61 = objc_claimAutoreleasedReturnValue(v60);
    v63 = (void *)v61;
    v141 = v46;
    v146 = (void *)v55;
    v139 = (void *)v61;
    if (v47 && v51)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "maskInfo"));

      if (!v64)
      {
        v65 = [_TtC8Freeform17CRLCommandSetMask alloc];
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "defaultMaskInfo"));
        v67 = -[CRLCommandSetMask initWithImageItem:maskInfo:](v65, "initWithImageItem:maskInfo:", v51, v66);

        objc_msgSend(v19, "enqueueCommand:", v67);
      }
      v68 = [_TtC8Freeform22CRLCommandReplaceImage alloc];
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "imageAssetPayload"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "thumbnailAssetPayload"));
      v71 = -[CRLCommandReplaceImage initWithImageItem:imageData:thumbnailData:](v68, "initWithImageItem:imageData:thumbnailData:", v51, v69, v70);

      objc_msgSend(v19, "enqueueCommand:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v73 = objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("Replace with Image"), 0, CFSTR("UndoStrings")));

      v24 = 0;
      v74 = 1;
      v147 = (void *)v73;
      a7 = v148;
      v63 = v139;
      v17 = v140;
LABEL_50:

      v21 = v147;
      v16 = v142;
      if ((v74 & 1) != 0)
        goto LABEL_54;
      goto LABEL_51;
    }
    v138 = v51;
    if (!v46 || !v61 || (objc_msgSend(v145, "isAudioOnly") & 1) != 0)
    {
      v24 = 0;
      v74 = 0;
      a7 = v148;
      v17 = v140;
      if (v58)
      {
        if (!v146)
        {
          v63 = v139;
          goto LABEL_50;
        }
        v136 = v58;
        *(_QWORD *)&v75 = objc_opt_class(CRLShapeRep, v62).n128_u64[0];
        v77 = v76;
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController", v75));
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "repForInfo:", v146));
        v80 = sub_100221D0C(v77, v79);
        v81 = (void *)objc_claimAutoreleasedReturnValue(v80);

        if (v81 && objc_msgSend(v81, "canBeUsedForImageMask"))
        {
          v82 = objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, x, y));
          v133 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "info"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "selectionPathWithInfo:", v83));
          v85 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "editorController"));
          objc_msgSend(v86, "setSelectionPath:", v84);

          v87 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
          v134 = (void *)v82;
          objc_msgSend(v87, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v13, v82);

          v88 = [CRLCanvasCommandSelectionBehavior alloc];
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v144));
          v91 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v88, "initWithCanvasEditor:type:constructedInfos:", v89, 3, v90);

          v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v144));
          v93 = objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandForInsertingBoardItemsIntoTopLevelContainer:below:](self, "commandForInsertingBoardItemsIntoTopLevelContainer:below:", v92, v143));

          v131 = (void *)v93;
          v132 = v91;
          objc_msgSend(v19, "enqueueCommand:withSelectionBehavior:", v93, v91);
          v94 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandsToSwapConnectionsFromRep:toInfo:](self, "commandsToSwapConnectionsFromRep:toInfo:", v81, v136));
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
          if (v95)
          {
            v96 = v95;
            v97 = *(_QWORD *)v150;
            do
            {
              for (i = 0; i != v96; i = (char *)i + 1)
              {
                if (*(_QWORD *)v150 != v97)
                  objc_enumerationMutation(v94);
                objc_msgSend(v19, "enqueueCommand:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)i));
              }
              v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v149, v157, 16);
            }
            while (v96);
          }
          v99 = v81;
          -[CRLCanvasEditorHelper maskImage:withShape:shouldOpenGroup:shouldBeginEditing:](self, "maskImage:withShape:shouldOpenGroup:shouldBeginEditing:", v136, v146, 0, 0);
          v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v101 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("Mask With Shape"), 0, CFSTR("UndoStrings")));

          v58 = v136;
          v24 = v136;

          v74 = 1;
          v147 = (void *)v101;
          a7 = v148;
        }
        else
        {
          v99 = v81;
          v74 = 0;
          v24 = 0;
          a7 = v148;
          v58 = v136;
        }
        v63 = v139;

      }
      goto LABEL_49;
    }
    v137 = v47;
    objc_msgSend(v46, "takePropertiesFromReplacedBoardItem:", v63);
    v17 = v140;
    if (objc_msgSend(v46, "isAnimatedImage")
      && (objc_msgSend(v63, "isAnimatedImage") & 1) == 0)
    {
      objc_msgSend(v46, "setIsLooping:", 1);
    }
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper commandsToSwapConnectionsFromRep:toInfo:](self, "commandsToSwapConnectionsFromRep:toInfo:", v142, v46));
    v103 = [CRLCanvasCommandSelectionBehavior alloc];
    v104 = objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    v105 = v46;
    v106 = (void *)v104;
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v105));
    v108 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v103, "initWithCanvasEditor:type:constructedInfos:", v106, 3, v107);

    v135 = v108;
    objc_msgSend(v19, "openGroupWithSelectionBehavior:", v108);
    -[CRLCanvasEditorHelper replaceBoardItem:withBoardItem:](self, "replaceBoardItem:withBoardItem:", v143, v144);
    objc_msgSend(v19, "closeGroup");
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v109 = v102;
    v110 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v153, v158, 16);
    if (v110)
    {
      v111 = v110;
      v112 = *(_QWORD *)v154;
      do
      {
        for (j = 0; j != v111; j = (char *)j + 1)
        {
          if (*(_QWORD *)v154 != v112)
            objc_enumerationMutation(v109);
          objc_msgSend(v19, "enqueueCommand:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)j));
        }
        v111 = objc_msgSend(v109, "countByEnumeratingWithState:objects:count:", &v153, v158, 16);
      }
      while (v111);
    }

    v58 = v137;
    if (v137)
    {
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "localizedStringForKey:value:table:", CFSTR("Replace with Image"), 0, CFSTR("UndoStrings")));
    }
    else
    {
      objc_opt_class(_TtC8Freeform12CRLMovieItem, v114);
      if ((objc_opt_isKindOfClass(v141, v117) & 1) == 0)
      {
        a7 = v148;
        v63 = v139;
        goto LABEL_48;
      }
      objc_opt_class(_TtC8Freeform12CRLMovieItem, v118);
      v120 = sub_100221D0C(v119, v141);
      v115 = (void *)objc_claimAutoreleasedReturnValue(v120);
      v121 = objc_msgSend(v115, "isAudioOnly");
      v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v123 = v122;
      v58 = 0;
      if (v121)
        v124 = CFSTR("Replace with Audio");
      else
        v124 = CFSTR("Replace with Video");
      v116 = objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "localizedStringForKey:value:table:", v124, 0, CFSTR("UndoStrings")));

      v147 = v123;
    }
    a7 = v148;
    v63 = v139;

    v147 = (void *)v116;
LABEL_48:

    v24 = 0;
    v74 = 1;
LABEL_49:
    v51 = v138;
    goto LABEL_50;
  }
  v24 = 0;
  a7 = v148;
LABEL_51:
  if (!a7)
  {
    v125 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
    objc_msgSend(v125, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v13, v17);

  }
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  objc_msgSend(v126, "insertBoardItems:withInsertionContext:postProcessBlock:", v13, v17, 0);

LABEL_54:
  objc_msgSend(v19, "setCurrentGroupActionString:", v21);
  objc_msgSend(v19, "closeGroup");
  if (v24)
  {
    v127 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v127, "layoutIfNeeded");

    v128 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "repForInfo:", v24));

    objc_msgSend(v129, "editMaskWithHUD:", 1);
  }

  return 1;
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if (-[CRLCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", 0))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Mask with Shape"), 0, 0));

    v6 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v5, "maskWithShape:");
    objc_msgSend(v7, "addObject:", v6);

  }
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLCanvasEditorHelper addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    v24 = *(_QWORD *)v32;
    do
    {
      v12 = 0;
      v25 = v10;
      do
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxValueForKey:", CFSTR("children")));
        if (objc_msgSend(v14, "count"))
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v15 = v14;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (!v16)
            goto LABEL_22;
          v17 = v16;
          v18 = *(_QWORD *)v28;
          while (1)
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
              if (objc_msgSend(v21, "length"))
              {
                v22 = objc_msgSend(v20, "state");

                if (v22 != (id)1)
                  continue;
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "title"));
                objc_msgSend(v7, "addObject:", v21);
              }

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (!v17)
            {
              v11 = v24;
              v10 = v25;
              goto LABEL_22;
            }
          }
        }
        v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
        if (objc_msgSend(v15, "length"))
        {
          v23 = objc_msgSend(v13, "state");

          if (v23 != (id)1)
            goto LABEL_23;
          v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
          objc_msgSend(v7, "addObject:", v15);
        }
LABEL_22:

LABEL_23:
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v10);
  }

}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _UNKNOWN **v42;
  void *v43;
  _UNKNOWN **v44;
  _UNKNOWN **v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  char *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  unsigned int v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  unsigned int v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  char *v126;
  char *v127;
  char *v128;
  void *v129;
  id v131;
  void *v132;
  void *v133;
  char *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[5];
  _QWORD v144[2];

  v131 = a3;
  v128 = (char *)objc_msgSend(v131, "count");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BACK_CONTEXT_MENU"), CFSTR("Back"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.3.stack.3d.bottom.filled")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v5, v6, "sendToBack:", 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Front"), 0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.3.stack.3d.top.filled")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v9, v10, "bringToFront:", 0));

  v144[0] = v7;
  v144[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v144, 2));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLZOrderMenuIdentifier"), 1, v12));

  objc_msgSend(v13, "setPreferredElementSize:", 1);
  objc_msgSend(v131, "insertObject:atIndex:", v13, v128);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Cut"), 0, 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("scissors")));
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v15, v16, "cut:", 0));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Copy"), 0, 0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.doc")));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v18, v19, "copy:", 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Paste"), 0, 0));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("doc.on.clipboard")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v22, v23, "paste:", 0));

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.square.on.square")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v26, v27, "duplicate:", 0));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Lock"), 0, 0));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock")));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v30, v31, "lock:", 0));

  v143[0] = v132;
  v143[1] = v20;
  v143[2] = v24;
  v143[3] = v28;
  v143[4] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v143, 5));
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLCutCopyPasteMenuIdentifier"), 1, v33));

  objc_msgSend(v131, "insertObject:atIndex:", v34, v128 + 1);
  v134 = v128 + 2;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "editorController"));
  *(_QWORD *)&v38 = objc_opt_class(CRLBoardItemEditor, v37).n128_u64[0];
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "mostSpecificCurrentEditorOfClass:", v39, v38));

  v133 = v40;
  if (v40)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "makeSelectionSpecificMenuElements"));
    if (objc_msgSend(v41, "count"))
    {
      v42 = RPTTestRunner_ptr;
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v41));
      objc_msgSend(v131, "insertObject:atIndex:", v43, v134);
      v134 = v128 + 3;

      v44 = RPTTestRunner_ptr;
      v45 = RPTTestRunner_ptr;
    }
    else
    {
      v44 = RPTTestRunner_ptr;
      v45 = RPTTestRunner_ptr;
      v42 = RPTTestRunner_ptr;
    }

  }
  else
  {
    v44 = RPTTestRunner_ptr;
    v45 = RPTTestRunner_ptr;
    v42 = RPTTestRunner_ptr;
  }
  v46 = v45[36];
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("Copy Style"), 0, 0));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[63], "imageNamed:", CFSTR("sf_tb_style_copy")));
  v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "commandWithTitle:image:action:propertyList:", v48, v49, "copyStyle:", 0));

  v50 = v45[36];
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Paste Style"), 0, 0));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[63], "imageNamed:", CFSTR("sf_tb_style_paste")));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "commandWithTitle:image:action:propertyList:", v52, v53, "pasteStyle:", 0));

  v55 = v42[76];
  v142[0] = v129;
  v142[1] = v54;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v142, 2));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v56));

  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("Save as Insert Style"), 0, 0));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v59, 0, "saveDefaultInsertionPreset:", 0));

  v61 = v42[76];
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localizedStringForKey:value:table:", CFSTR("Style"), 0, 0));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44[63], "systemImageNamed:", CFSTR("eyedropper")));
  v141[0] = v57;
  v141[1] = v60;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v141, 2));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "menuWithTitle:image:identifier:options:children:", v63, v64, CFSTR("CRLStyleMenuIdentifier"), 0, v65));

  objc_msgSend(v131, "insertObject:atIndex:", v66, v134);
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled"))
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "localizedStringForKey:value:table:", CFSTR("Add Connection Line"), 0, 0));
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("circle.square.square.diagram")));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v68, v69, "connectWithConnectionLine:", 0));

    v140 = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v140, 1));
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v71));

    objc_msgSend(v131, "addObject:", v72);
  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v129));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("Constrain Proportions"), 0, 0));
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.split.bottomrightquarter")));
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v74, v75, "toggleAspectRatioLock:", 0));

  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "aspectRatioLockControlState"));
  objc_msgSend(v76, "setState:", objc_msgSend(v77, "stateValue"));
  v139 = v76;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v139, 1));
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v78));

  objc_msgSend(v131, "addObject:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("Description"), 0, 0));
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("accessibility")));
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v81, v82, "editAccessibilityDescription:", 0));

  v138 = v83;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v138, 1));
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLDescriptionMenuIdentifier"), 1, v84));

  objc_msgSend(v131, "addObject:", v85);
  if (!v133
    || (v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "boardItems")),
        v87 = objc_msgSend(v86, "count"),
        v86,
        (unint64_t)v87 >= 2))
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("Select Objects…"), 0, 0));
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.dashed")));
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v89, v90, "enterQuickSelectMode:", 0));

    v137 = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v137, 1));
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v92));

    objc_msgSend(v131, "addObject:", v93);
  }
  v94 = v134 + 1;
  if (+[CRLFeatureFlagGroup isStencilsEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isStencilsEnabled"))
  {
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v133, "boardItems"));
    v96 = objc_msgSend(v95, "count");

    if (v96)
    {
      v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "localizedStringForKey:value:table:", CFSTR("Save to Library…"), 0, 0));
      v99 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("books.vertical")));
      v100 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v98, v99, "saveSelectedBoardItemsAsStencil:", 0));

      v136 = v100;
      v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v136, 1));
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v101));

      objc_msgSend(v131, "addObject:", v102);
    }
  }
  v103 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("Delete"), 0, 0));
  v105 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
  v106 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v104, v105, "delete:", 0));

  objc_msgSend(v106, "setAttributes:", 2);
  v135 = v106;
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v135, 1));
  v108 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v107));

  objc_msgSend(v131, "addObject:", v108);
  if (-[CRLCanvasEditorHelper canPerformMaskWithShapeWithSender:](self, "canPerformMaskWithShapeWithSender:", 0))
  {
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "localizedStringForKey:value:table:", CFSTR("Mask with Shape"), 0, 0));
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("dash.square.on.circle")));
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v110, v111, "maskWithShape:", 0));

    objc_msgSend(v131, "insertObject:atIndex:", v112, v94);
    v94 = v134 + 2;

  }
  v113 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "freehandDrawingToolkit"));
  v115 = objc_msgSend(v114, "isInDrawingMode");

  if (v115)
  {
    v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, 0));
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.dashed")));
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v117, v118, "selectAll:", 0));

    objc_msgSend(v131, "insertObject:atIndex:", v119, v94++);
  }
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v121 = +[CRLGenerativePlaygroundHelper iccHasGenerativePlaygroundInputSelection:](_TtC8Freeform29CRLGenerativePlaygroundHelper, "iccHasGenerativePlaygroundInputSelection:", v120);

  if (v121)
  {
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "localizedStringForKey:value:table:", CFSTR("Add to Playground"), 0, 0));
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("apple.image.playground")));
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v123, v124, "presentGenerativePlaygroundForCurrentSelection:", 0));

    v126 = (char *)objc_msgSend(v131, "indexOfObjectPassingTest:", &stru_101242B88);
    if (v126 == (char *)0x7FFFFFFFFFFFFFFFLL)
      v127 = v94;
    else
      v127 = v126 + 1;
    objc_msgSend(v131, "insertObject:atIndex:", v125, v127);

  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  void *v6;
  id v7;
  int64_t v8;
  int64_t v9;
  void *v10;
  __objc2_class_ro **p_info;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  char *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  void *i;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __objc2_class_ro **v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int64_t v60;
  int64_t v61;
  void *v62;
  char *v63;
  void *v64;
  void *v65;
  char *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  char isKindOfClass;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  int64_t v83;
  void *v84;
  char *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];

  v5 = a3;
  v85 = (char *)objc_msgSend(v5, "count");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper layoutsForAlignAndDistribute](self, "layoutsForAlignAndDistribute"));
  v7 = objc_msgSend(v6, "count");

  v8 = -[CRLCanvasEditorHelper canvasEditorCanPerformUngroupActionWithSender:](self, "canvasEditorCanPerformUngroupActionWithSender:", CFSTR("CRLMiniFormatter"));
  v9 = -[CRLCanvasEditorHelper canvasEditorCanPerformGroupActionWithSender:](self, "canvasEditorCanPerformGroupActionWithSender:", CFSTR("CRLMiniFormatter"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "infosForCurrentSelectionPath"));

  p_info = &OBJC_METACLASS___CRLTabsAccessibility.info;
  v86 = v5;
  if ((unint64_t)v7 > 1 || (v9 != 1 ? (v12 = v8 == 1) : (v12 = 1), v12))
  {
    v83 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Align Objects…"), 0, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("rectangle.3.group")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Arrange"), 0, 0));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:crlaxLabel:](CRLQuickInspectorElement, "elementWithName:image:type:options:crlaxLabel:", v14, v15, 2, 0x4000, v17));

    v8 = v83;
    objc_msgSend(v18, "setTag:", 0);
    if ((unint64_t)v7 >= 2 && v9 == 1 && v83 == 1)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      v21 = CFSTR("Align, distribute, group, or ungroup selected objects");
    }
    else
    {
      if ((unint64_t)v7 < 2)
      {
        p_info = &OBJC_METACLASS___CRLTabsAccessibility.info;
        if (v9 == 1)
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Group selected objects"), 0, 0));
          objc_msgSend(v18, "setToolTip:", v37);

          v23 = v85;
          v5 = v86;
        }
        else
        {
          v23 = v85;
          v5 = v86;
          if (v83 == 1)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Ungroup selected objects"), 0, 0));
            objc_msgSend(v18, "setToolTip:", v41);

            v5 = v86;
          }
        }
        goto LABEL_29;
      }
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v24 = v84;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
      if (v25)
      {
        v27 = v25;
        v28 = *(_QWORD *)v88;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v88 != v28)
              objc_enumerationMutation(v24);
            v30 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)i);
            objc_opt_class(_TtC8Freeform12CRLShapeItem, v26);
            if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
            {
              objc_opt_class(_TtC8Freeform19CRLWPStickyNoteItem, v32);
              if ((objc_opt_isKindOfClass(v30, v33) & 1) == 0)
              {
                objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v34);
                if ((objc_opt_isKindOfClass(v30, v35) & 1) == 0)
                  continue;
              }
            }

            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Align, distribute, or group selected objects"), 0, 0));
            objc_msgSend(v18, "setToolTip:", v39);

            v23 = v85;
            v5 = v86;
            p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLTabsAccessibility + 32);
            v8 = v83;
            goto LABEL_29;
          }
          v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
          v8 = v83;
          if (v27)
            continue;
          break;
        }
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v20 = v19;
      v21 = CFSTR("Align, distribute, group, or combine shapes");
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, 0, 0));
    objc_msgSend(v18, "setToolTip:", v22);

    v23 = v85;
    v5 = v86;
    p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLTabsAccessibility + 32);
LABEL_29:
    objc_msgSend(v5, "addObject:", v18);
    v85 = v23 + 1;

  }
  if ((id)-[CRLCanvasEditorHelper canvasEditorCanPerformDuplicateAction:withSender:](self, "canvasEditorCanPerformDuplicateAction:withSender:", "duplicate:", CFSTR("CRLMiniFormatter")) == (id)1)
  {
    v42 = v5;
    v43 = p_info + 151;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("plus.square.on.square")));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "elementWithName:image:type:action:parent:children:", v45, v46, 0, "duplicate:", 0, 0));

    objc_msgSend(v42, "insertObject:atIndex:", v47, v85);
    v48 = v85 + 1;

  }
  else
  {
    v48 = v85;
  }
  if ((id)-[CRLCanvasEditorHelper canvasEditorCanPerformDeleteAction:withSender:](self, "canvasEditorCanPerformDeleteAction:withSender:", "delete:", CFSTR("CRLMiniFormatter")) == (id)1)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Delete"), 0, 0));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("trash")));
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:action:parent:children:", v50, v51, 0, "delete:", 0, 0));

    v53 = (__objc2_class_ro **)(&OBJC_METACLASS___CRLTabsAccessibility + 32);
    objc_msgSend(v52, "setTag:", 23);
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor redColor](CRLColor, "redColor"));
    objc_msgSend(v52, "setTintColor:", v54);

    objc_msgSend(v86, "insertObject:atIndex:", v52, v48++);
  }
  else
  {
    v53 = &OBJC_METACLASS___CRLTabsAccessibility.info;
  }
  v55 = v53 + 151;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedStringForKey:value:table:", CFSTR("Lock"), 0, 0));
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("lock")));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "elementWithName:image:type:action:parent:children:", v57, v58, 1, "lock:", 0, 0));

  v60 = -[CRLCanvasEditorHelper canvasEditorCanPerformLockAction:withSender:](self, "canvasEditorCanPerformLockAction:withSender:", "lock:", 0);
  v61 = -[CRLCanvasEditorHelper canvasEditorCanPerformLockAction:withSender:](self, "canvasEditorCanPerformLockAction:withSender:", "unlock:", 0);
  if (v60 == 1)
  {
    v62 = v86;
    objc_msgSend(v86, "insertObject:atIndex:", v59, v48);
    if (v61 != 1 && v8 != 1)
      goto LABEL_48;
    v63 = v48 + 1;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "localizedStringForKey:value:table:", CFSTR("Lock"), 0, 0));
    v66 = v48;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("lock")));
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:action:parent:children:", v65, v67, 2, "lock:", 0, 0));

    objc_msgSend(v68, "setTag:", 21);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "localizedStringForKey:value:table:", CFSTR("Lock selected objects"), 0, 0));
    objc_msgSend(v68, "setToolTip:", v70);

    v62 = v86;
    objc_msgSend(v86, "insertObject:atIndex:", v68, v63);
    v48 = v66 + 2;

  }
  else
  {
    v62 = v86;
  }
  if (v61 == 1)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("lock.open")));
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:action:parent:children:", v72, v73, 2, "unlock:", 0, 0));

    objc_msgSend(v74, "setTag:", 22);
    if (objc_msgSend(v84, "count") == (id)1)
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "anyObject"));
      objc_opt_class(_TtC8Freeform12CRLGroupItem, v76);
      isKindOfClass = objc_opt_isKindOfClass(v75, v77);

      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v80 = v79;
      if ((isKindOfClass & 1) != 0)
        v81 = CFSTR("Unlock this group");
      else
        v81 = CFSTR("Unlock this object");
    }
    else
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v80 = v79;
      v81 = CFSTR("Unlock selected objects");
    }
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "localizedStringForKey:value:table:", v81, 0, 0));
    v62 = v86;
    objc_msgSend(v74, "setToolTip:", v82);

    objc_msgSend(v86, "insertObject:atIndex:", v74, v48);
  }
LABEL_48:

}

- (void)contextMenuDidHideForContextMenuController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper contextMenuController](self, "contextMenuController"));

  if (v5 == v4)
  {
    -[CRLCanvasEditorHelper setContextMenuController:](self, "setContextMenuController:", 0);
    -[CRLCanvasEditorHelper setCustomPasteMenuDisplayed:](self, "setCustomPasteMenuDisplayed:", 0);
  }
}

- (id)shapeInfoToBeginEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  double v19;
  objc_class *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper canvasEditor](self, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textInputEditor"));
  if (v7 == v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v11));

    if (objc_msgSend(v12, "count") == (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crl_onlyObject"));
      if ((objc_msgSend(v13, "locked") & 1) != 0)
      {
        v8 = 0;
      }
      else
      {
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v14);
        v16 = sub_100221D0C(v15, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v18)
        {
          *(_QWORD *)&v19 = objc_opt_class(CRLShapeRep, v17).n128_u64[0];
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "repForInfo:", v18, v19));
          v23 = sub_1002223BC(v21, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

          v25 = v24;
          if (objc_msgSend(v24, "canBeginEditing"))
            v8 = v18;
          else
            v8 = 0;

        }
        else
        {
          v8 = 0;
        }

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)beginEditingOnKeyInputWithString:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  *(_QWORD *)&v5 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper shapeInfoToBeginEditing](self, "shapeInfoToBeginEditing", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textStorage"));
    v12 = objc_msgSend(v11, "range");
    -[CRLCanvasEditorHelper p_beginEditingTextShape:replacementRange:withText:](self, "p_beginEditingTextShape:replacementRange:withText:", v10, v12, v13, v14);

  }
}

- (void)p_beginEditingTextShape:(id)a3 replacementRange:(_NSRange)a4 withText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _TtC8Freeform12CRLTextRange *v17;
  void *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelper interactiveCanvasController](self, "interactiveCanvasController"));
  if (+[CRLWPEditor canEditTextIn:using:](_TtC8Freeform11CRLWPEditor, "canEditTextIn:using:", v9, v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionModelTranslator"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textStorage"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathForRange:onStorage:", location, length, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    objc_msgSend(v15, "setSelectionPath:", v14);

    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = sub_1001D2E70;
    v24 = sub_1001D2E80;
    v25 = 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001D85A0;
    v19[3] = &unk_101232970;
    v19[4] = &v20;
    objc_msgSend(v16, "enumerateEditorsOnStackUsingBlock:", v19);

    v17 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", location, length);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21[5], "textInputReceiver"));
    objc_msgSend(v18, "replace:with:", v17, v10);

    _Block_object_dispose(&v20, 8);
  }

}

- (CRLiOSContextMenuController)contextMenuController
{
  return self->mContextMenuController;
}

- (void)setContextMenuController:(id)a3
{
  objc_storeStrong((id *)&self->mContextMenuController, a3);
}

- (BOOL)customPasteMenuDisplayed
{
  return self->mCustomPasteMenuDisplayed;
}

- (void)setCustomPasteMenuDisplayed:(BOOL)a3
{
  self->mCustomPasteMenuDisplayed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContextMenuController, 0);
  objc_storeStrong((id *)&self->mDragAndDropHighlightDecorator, 0);
  objc_storeStrong((id *)&self->mKeyboardManipulator, 0);
  objc_destroyWeak((id *)&self->mCanvasEditor);
}

@end
