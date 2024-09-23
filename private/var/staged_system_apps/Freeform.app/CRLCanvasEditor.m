@implementation CRLCanvasEditor

- (BOOL)wantsDoneButtonWhenEditing
{
  return 0;
}

- (BOOL)shouldBeginTextInputWith:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "shapeInfoToBeginEditing"));
  v5 = v4 != 0;

  return v5;
}

- (CRLTextSelecting)textSelectionDelegate
{
  return 0;
}

- (CRLTextInputReceiving)textInputReceiver
{
  return 0;
}

- (BOOL)wantsToReceiveTextInput
{
  return 0;
}

- (BOOL)wantsVisibleKeyboard
{
  return 0;
}

- (BOOL)wantsToInterceptDeleteEvents
{
  return 0;
}

- (BOOL)wantsRawArrowKeyEvents
{
  return 1;
}

- (void)arrowKeyReceivedInDirection:(unint64_t)a3 withModifierKeys:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v7, "arrowKeyReceivedInDirection:withModifierKeys:", a3, v6);

}

- (void)tabKeyPressed
{
  if ((id)-[CRLCanvasEditor canPerformEditorAction:withSender:](self, "canPerformEditorAction:withSender:", "insertTab:", 0) == (id)1)-[CRLCanvasEditor insertTab:](self, "insertTab:", 0);
  else
    -[CRLCanvasEditor beginEditingWith:](self, "beginEditingWith:", CFSTR("\t"));
}

- (void)beginEditingWith:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "beginEditingOnKeyInputWithString:", v4);

}

- (void)endEditing
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101232190);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v7 = (objc_class *)objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLCanvasEditor endEditing]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m";
    v31 = 1024;
    v32 = 151;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_1012321B0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor endEditing]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
  v16 = (objc_class *)objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 151, 0, "Abstract method not overridden by %{public}@", v18);

  v20 = (objc_class *)objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLCanvasEditor endEditing]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)setEditorController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));

    if (v6 != v4)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012321D0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF13B4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012321F0);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor setEditorController:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 155, 0, "Unexpected editor controller!");

    }
  }

}

- (void)delete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "delete:", v4);

}

- (void)cut:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "cut:", v4);

}

- (void)lock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "lock:", v4);

}

- (void)unlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "unlock:", v4);

}

- (void)deselectAll:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "deselectAll:", v4);

}

- (BOOL)isLayoutSelectable:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v6 = objc_msgSend(v5, "isLayoutSelectable:", v4);

  return v6;
}

- (void)duplicate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "duplicate:", v4);

}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "addContextualMenuItemsToArray:", v4);

}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v8, "addContextualMenuElementsToArray:atPoint:", v7, x, y);

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
  -[CRLCanvasEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
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

- (BOOL)shouldPreventQuickSelect
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editingCoordinator](self, "editingCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "followCoordinator"));
  v4 = objc_msgSend(v3, "isFollowing");

  return v4;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v8, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);

}

- (void)maskWithSelection:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v5 = objc_msgSend(v4, "canPerformMaskWithShapeWithSender:", v6);

  if (v5)
    -[CRLCanvasEditor maskWithShape:](self, "maskWithShape:", v6);
  else
    -[CRLCanvasEditor mask:](self, "mask:", v6);

}

- (void)mask:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "mask");

}

- (void)maskWithShape:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "maskWithShape");

}

- (void)maskWithShapeType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "tag") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
    objc_msgSend(v5, "maskWithShapeType:", objc_msgSend(v4, "tag"));

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232210);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1434();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232230);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor maskWithShapeType:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 285, 0, "Callers to -[CRLCanvasEditor maskWithShape:] must have a -[tag] method to specify the shape type to use for the image mask.");

  }
}

- (void)enterQuickSelectMode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "enterQuickSelectMode:", v4);

}

- (void)presentAlignmentTools:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "presentAlignmentTools:", v4);

}

- (unint64_t)dragOperationForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v9 = objc_msgSend(v8, "dragOperationForDragInfo:atUnscaledPoint:", v7, x, y);

  return (unint64_t)v9;
}

- (BOOL)handleDragOperation:(unint64_t)a3 withDragInfo:(id)a4 atUnscaledPoint:(CGPoint)a5
{
  double y;
  double x;
  id v9;
  void *v10;

  y = a5.y;
  x = a5.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  LOBYTE(a3) = objc_msgSend(v10, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);

  return a3;
}

- (id)repToHighlightForDragInfo:(id)a3 atUnscaledPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "repToHighlightForDragInfo:atUnscaledPoint:", v7, x, y));

  return v9;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v8, "updateDragAndDropUIForPoint:dragInfo:", v7, x, y);

}

- (void)hideDragAndDropUI
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v2, "hideDragAndDropUI");

}

- (BOOL)wantsToHighlightRep:(id)a3 forDragOperationWithDragInfo:(id)a4 atPoint:(CGPoint)a5 allowNonPlaceholderReplacement:(BOOL)a6
{
  uint64_t v6;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  LOBYTE(v6) = objc_msgSend(v13, "wantsToHighlightRep:forDragOperationWithDragInfo:atPoint:allowNonPlaceholderReplacement:", v12, v11, v6, x, y);

  return v6;
}

- (BOOL)insertBoardItemsFromDragAndDrop:(id)a3 atPoint:(CGPoint)a4 onRep:(id)a5 insertionContext:(id)a6 alreadyPositionedInputInfos:(BOOL)a7
{
  uint64_t v7;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  y = a4.y;
  x = a4.x;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  LOBYTE(v7) = objc_msgSend(v16, "insertBoardItemsFromDragAndDrop:atPoint:onRep:insertionContext:alreadyPositionedInputInfos:", v15, v14, v13, v7, x, y);

  return v7;
}

- (CGPath)newDragAndDropHighlightPathWithInset:(double)a3
{
  void *v4;
  CGPath *v5;
  CGRect v7;
  CGRect v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "visibleBoundsRect");
  v8 = CGRectInset(v7, a3, a3);
  v5 = CGPathCreateWithRect(v8, 0);

  return v5;
}

- (void)alignDrawablesByLeftEdge:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 0);

}

- (void)alignDrawablesByRightEdge:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 2);

}

- (void)alignDrawablesByVerticalCenter:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 1);

}

- (void)alignDrawablesByTopEdge:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 3);

}

- (void)alignDrawablesByBottomEdge:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 5);

}

- (void)alignDrawablesByHorizontalCenter:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "alignDrawablesByEdge:", 4);

}

- (void)distributeDrawablesHorizontally:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "distributeDrawablesByEdge:", 1);

}

- (void)distributeDrawablesVertically:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "distributeDrawablesByEdge:", 4);

}

- (void)distributeDrawablesEvenly:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  objc_msgSend(v3, "distributeDrawablesEvenly");

}

- (void)bringToFront:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "bringToFront:", v4);

}

- (void)bringForward:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "bringForward:", v4);

}

- (void)sendBackward:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "sendBackward:", v4);

}

- (void)sendToBack:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "sendToBack:", v4);

}

- (void)selectParent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "selectParent:", v4);

}

- (void)presentMediaCompatibilityAlertWithReasons:(int64_t)a3 forMediaType:(int64_t)a4 forSingleMediaObject:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;

  v6 = a5;
  v10 = a6;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v11, "presentMediaCompatibilityAlertWithReasons:forMediaType:forSingleMediaObject:completionHandler:", a3, a4, v6, v10);

}

+ (Class)canvasEditorHelperClass
{
  return (Class)objc_opt_class(CRLCanvasEditorHelper, a2);
}

- (CRLCanvasEditor)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLCanvasEditor *v5;
  CRLCanvasEditor *v6;
  uint64_t v7;
  CRLCanvasEditorHelper *v8;
  CRLCanvasEditorHelper *mCanvasEditorHelper;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasEditor;
  v5 = -[CRLCanvasEditor init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mInteractiveCanvasController, v4);
    v8 = (CRLCanvasEditorHelper *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(v6, v7), "canvasEditorHelperClass")), "initWithCanvasEditor:", v6);
    mCanvasEditorHelper = v6->mCanvasEditorHelper;
    v6->mCanvasEditorHelper = v8;

    v6->mResignFirstResponderWhenKeyboardHides = 1;
  }

  return v6;
}

- (void)teardown
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor pasteboardController](self, "pasteboardController"));
  objc_msgSend(v3, "fulfillPasteboardPromises");

  -[CRLCanvasEditorHelper teardown](self->mCanvasEditorHelper, "teardown");
  objc_storeWeak((id *)&self->mInteractiveCanvasController, 0);
}

- (CRLEditorController)editorController
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));

  return (CRLEditorController *)v3;
}

- (CRLCanvasEditorHelper)canvasEditorHelper
{
  return self->mCanvasEditorHelper;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editingCoordinator"));

  return (_TtC8Freeform21CRLEditingCoordinator *)v3;
}

- (CRLCanvasSelection)canvasSelection
{
  void *v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentEditors"));
  v5 = objc_msgSend(v4, "containsObject:", self);

  if (v5)
  {
    v7 = objc_opt_class(CRLCanvasSelection, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionForEditor:", self));
    v10 = sub_100221D0C(v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  else
  {
    v11 = 0;
  }
  return (CRLCanvasSelection *)v11;
}

- (id)selectionPathWithInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathWithInfo:", v4));

  return v6;
}

- (id)selectionPathWithInfos:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPathWithInfos:", v4));

  return v6;
}

- (id)selectionPathForDraggingSelectionPath:(id)a3
{
  return a3;
}

- (void)canvasInfosDidChange
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008434C;
  v4[3] = &unk_10122D110;
  v4[4] = self;
  objc_msgSend(v3, "performBlockAfterSettingSelection:", v4);

}

- (void)repWasCreated:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "isSelectedIgnoringLocking"))
    objc_msgSend(v3, "becameSelected");

}

- (id)p_filterNonDisplayedInfos:(id)a3
{
  id v4;
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableSet);
  v6 = objc_alloc((Class)NSSet);
  WeakRetained = objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "infosToDisplay"));
  v9 = objc_msgSend(v6, "initWithArray:", v8);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v11)
  {

LABEL_14:
    v20 = v10;
    goto LABEL_15;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v12; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      v17 = sub_1000664C4(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v9, "containsObject:", v18, (_QWORD)v23);

      if (v19)
        objc_msgSend(v5, "addObject:", v16);
      else
        v13 = 1;
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v12);

  v20 = v5;
  if ((v13 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v21 = v20;

  return v21;
}

- (BOOL)shouldUseAlternateSelectionHighlight
{
  return 0;
}

- (BOOL)shouldRemainOnEditorStackForSelection:(id)a3 inSelectionPath:(id)a4 withNewEditors:(id)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;

  v5 = a3;
  v7 = objc_opt_class(CRLCanvasSelection, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  return isKindOfClass & 1;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextEditorForSelection:withNewEditorStack:selectionPath:", v10, v9, v8));

  return v12;
}

- (BOOL)shouldBecomeTextInputEditor
{
  return 1;
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
  v9 = objc_opt_class(CRLCanvasSelection, v8);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232250);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF14B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232270);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor selectionWillChangeFromSelection:toSelection:withFlags:inSelectionPath:withNewEditors:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 582, 0, "Canvas editor expects canvas selection!");

  }
  return 0;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v7 = objc_opt_class(CRLCanvasSelection, v6);
  isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  if ((isKindOfClass & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101232290);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF1534();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012322B0);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor selectionDidChangeFromSelection:toSelection:withFlags:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 589, 0, "Canvas editor expects canvas selection!");

  }
}

- (void)hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layerHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "asiOSCVC"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentDocumentMode"));

  v7 = objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v6);
  v8 = sub_100221D0C(v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "freehandDrawingToolkit"));
  v11 = objc_msgSend(v10, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

  if (v11)
    objc_msgSend(v9, "hideEditMenuForLassoSelection");

}

- (CRLPasteboardController)pasteboardController
{
  CRLPasteboardController *pasteboardController;
  CRLPasteboardController *v4;
  void *v5;
  void *v6;
  CRLPasteboardController *v7;
  CRLPasteboardController *v8;

  pasteboardController = self->_pasteboardController;
  if (!pasteboardController)
  {
    v4 = [CRLPasteboardController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
    v7 = -[CRLPasteboardController initWithDelegate:](v4, "initWithDelegate:", v6);
    v8 = self->_pasteboardController;
    self->_pasteboardController = v7;

    pasteboardController = self->_pasteboardController;
  }
  return pasteboardController;
}

- (id)permittedActionsForReasons:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "permittedActionsForReasons:", a3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "copy:", 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObjectsFromSet:", v6));

  return v7;
}

+ (BOOL)physicalKeyboardIsSender:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(a1) = objc_msgSend(objc_msgSend(a1, "canvasEditorHelperClass"), "physicalKeyboardIsSender:", v4);

  return (char)a1;
}

- (BOOL)canHandleInsertionOfBoardItems:(id)a3 insertionContext:(id)a4
{
  return 1;
}

- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor pasteboardController](self, "pasteboardController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ingestibleItemSourceForPasteboard:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  LOBYTE(self) = objc_msgSend(v10, "canPasteWithItemSource:sender:", v9, v6);

  return (char)self;
}

- (void)pasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
  -[CRLCanvasEditor pasteWithPasteboard:selectionPath:forceMatchStyle:sender:](self, "pasteWithPasteboard:selectionPath:forceMatchStyle:sender:", v7, v8, 0, v6);

}

- (BOOL)canCopyStyle
{
  return 0;
}

- (BOOL)canvasEditorCanDeleteWithSender:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unlockedBoardItemsForSelectionPath:", v7));

  LOBYTE(v6) = objc_msgSend(v8, "count") != 0;
  return (char)v6;
}

- (BOOL)canvasEditorCanCopyWithSender:(id)a3
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
  uint64_t v13;
  void *i;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemsForSelectionPath:", v7));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v15, "shouldBeIgnoredWhenCopying", (_QWORD)v18) & 1) == 0)
            objc_msgSend(v9, "addObject:", v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

    v16 = objc_msgSend(v9, "count") != 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)canvasEditorCanCutWithSender:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[CRLCanvasEditor canvasEditorCanDeleteWithSender:](self, "canvasEditorCanDeleteWithSender:", v4))
    v5 = -[CRLCanvasEditor canvasEditorCanCopyWithSender:](self, "canvasEditorCanCopyWithSender:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)canPasteWithSender:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v6 = objc_msgSend(v5, "canPasteWithItemSource:sender:", 0, v4);

  return v6;
}

- (BOOL)canvasEditorCanPasteWithSender:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v6 = objc_msgSend(v5, "canPasteWithItemSource:sender:", 0, v4);

  return v6;
}

- (BOOL)canvasEditorCanOptionDragDuplicateWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isInDrawingMode");

  if ((v7 & 1) != 0)
    v8 = 0;
  else
    v8 = -[CRLCanvasEditor canvasEditorCanCopyWithSender:](self, "canvasEditorCanCopyWithSender:", v4);

  return v8;
}

- (BOOL)canSelectAllWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char **v25;
  uint64_t v26;
  char **v27;
  char *v28;
  void *v29;
  void *v30;
  unsigned __int8 v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isLassoSelectionForMixedTypeEnabledInDrawingMode");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v9 = objc_msgSend(v8, "isInDrawingMode");

  if (!v9 || (v7 & 1) != 0)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPath"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "boardItemsForSelectionPath:", v22));

    v35 = 0u;
    v36 = 0u;
    v19 = objc_msgSend(v15, "count") == 0;
    v37 = 0u;
    v38 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor infosForSelectAllInRoot](self, "infosForSelectAllInRoot"));
    v14 = (uint64_t)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v14)
    {
      v33 = v15;
      v34 = v4;
      v24 = *(_QWORD *)v36;
      v25 = &selRef_isLineSegment;
      while (2)
      {
        v26 = 0;
        v27 = v25;
        v28 = v25[75];
        do
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
          if ((objc_opt_respondsToSelector(v29, v28) & 1) != 0
            && (objc_msgSend(v29, "isSelectable") & 1) != 0)
          {
            v14 = 1;
            goto LABEL_15;
          }
          ++v26;
        }
        while (v14 != v26);
        v14 = (uint64_t)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v25 = v27;
        if (v14)
          continue;
        break;
      }
LABEL_15:
      v15 = v33;
      v4 = v34;
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rootLayout"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "children"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:](CRLFreehandDrawingLayout, "freehandDrawingLayoutsToInteractWithFromLayouts:", v12));
    v14 = objc_msgSend(v13, "count") != 0;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
    v17 = objc_msgSend(v15, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLShapeEditor, v16));
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v18 == 0;

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v31 = objc_msgSend(v30, "allowSelectAllForSender:hasNothingVisiblySelected:hasAtLeastOneThingToSelect:", v4, v19, v14);

  return v31;
}

- (BOOL)canvasEditorCanSelectAllWithSender:(id)a3
{
  return -[CRLCanvasEditor canSelectAllWithSender:](self, "canSelectAllWithSender:", a3);
}

- (BOOL)canvasEditorCanDeselectAllWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boardItemsForSelectionPath:", v8));

  if (objc_msgSend(v9, "count"))
    v11 = 1;
  else
    v11 = objc_msgSend((id)objc_opt_class(self, v10), "physicalKeyboardIsSender:", v4);

  return v11;
}

- (BOOL)canGroupWithSender:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionModelTranslator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "boardItemsForSelectionPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  LOBYTE(v5) = objc_msgSend(v9, "hasSelectedInfosInMultipleContainers");

  if ((v5 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v10 = 0;
      v14 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          if (-[CRLCanvasEditor canGroupBoardItem:](self, "canGroupBoardItem:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), (_QWORD)v17))
          {
            if (v10)
            {
              v10 = 2;
              goto LABEL_16;
            }
            v10 = 1;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v13)
          continue;
        break;
      }
    }
    else
    {
      v10 = 0;
    }
LABEL_16:

  }
  return v10 > 1;
}

- (BOOL)canvasEditorCanGroupWithSender:(id)a3
{
  return -[CRLCanvasEditor canGroupWithSender:](self, "canGroupWithSender:", a3);
}

- (BOOL)canUngroupWithSender:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v7 = objc_msgSend(v5, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  LOBYTE(v4) = objc_msgSend(v9, "canUngroupWithSelection:", v8);

  return (char)v4;
}

- (BOOL)canvasEditorCanUngroupWithSender:(id)a3
{
  return -[CRLCanvasEditor canUngroupWithSender:](self, "canUngroupWithSender:", a3);
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  _QWORD v21[10];

  v6 = a4;
  v21[0] = "deleteBackward:";
  v21[1] = "deleteForward:";
  v21[2] = "deleteToBeginningOfLine:";
  v21[3] = "deleteToEndOfLine:";
  v21[4] = "deleteWordBackward:";
  v21[5] = "deleteWordForward:";
  v21[6] = "insertTab:";
  v21[7] = "insertBacktab:";
  v21[8] = "scrollToBeginningOfDocument:";
  v21[9] = "scrollToEndOfDocument:";
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v8 = (int64_t)objc_msgSend(v7, "canPerformEditorAction:withSender:", a3, v6);

  if (!v8)
  {
    v9 = 0;
    v8 = 1;
    while (!sel_isEqual(a3, (SEL)v21[v9]))
    {
      if (++v9 == 10)
      {
        v8 = 0;
        break;
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v11 = v10;
    if ("select:" == a3)
    {
      v8 = -1;
    }
    else if ("zoomToFitAllContent:" == a3)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "board"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rootContainer"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "childItems"));
      if (objc_msgSend(v18, "count"))
        v8 = 1;
      else
        v8 = -1;

    }
    else if ("zoomToSelection:" == a3)
    {
      if (objc_msgSend(v10, "canZoomToCurrentSelection"))
        v8 = 1;
      else
        v8 = -1;
    }
    else if ("actualSize:" == a3)
    {
      objc_msgSend(v10, "viewScale");
      if (v19 == 1.0)
        v8 = -1;
      else
        v8 = 1;
    }
    else if ("saveSelectedBoardItemsAsStencil:" == a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionModelTranslator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPath"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boardItemsForSelectionPath:", v14));
      if (objc_msgSend(v15, "count"))
        v8 = 1;
      else
        v8 = -1;

    }
  }

  return v8;
}

- (void)copyToPasteboard:(id)a3 asPDF:(BOOL)a4 nativeOnly:(BOOL)a5 withSender:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a5;
  v7 = a4;
  v15 = a3;
  if (-[CRLCanvasEditor canvasEditorCanCopyWithSender:](self, "canvasEditorCanCopyWithSender:", 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPath"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "unlockedBoardItemsForSelectionPath:", v13));

    -[CRLCanvasEditor copyBoardItems:toPasteboard:asPDF:nativeOnly:](self, "copyBoardItems:toPasteboard:asPDF:nativeOnly:", v14, v15, v7, v6);
  }

}

- (void)copyBoardItems:(id)a3 toPasteboard:(id)a4 asPDF:(BOOL)a5 nativeOnly:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v18, "shouldBeIgnoredWhenCopying", (_QWORD)v24) & 1) == 0)
          objc_msgSend(v12, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  v19 = v12;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topLevelZOrderedSiblingsOfInfos:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "crl_arrayWithObjectsInSet:", v19));

  if (v21 && objc_msgSend(v21, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor pasteboardController](self, "pasteboardController"));
    v23 = objc_msgSend(v22, "newCopyAssistantWithPasteboard:", v10);
    objc_msgSend(v22, "copyBoardItems:toPasteboard:asPDF:writeAssistant:nativeOnly:icc:", v21, v10, 0, v23, v6, v11);

  }
}

- (void)copyToPasteboard:(id)a3 nativeOnly:(BOOL)a4 withSender:(id)a5
{
  -[CRLCanvasEditor copyToPasteboard:asPDF:nativeOnly:withSender:](self, "copyToPasteboard:asPDF:nativeOnly:withSender:", a3, 0, a4, a5);
}

- (void)copy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard"));
  -[CRLCanvasEditor copyToPasteboard:nativeOnly:withSender:](self, "copyToPasteboard:nativeOnly:withSender:", v5, 0, v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  objc_msgSend(v6, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (void)copyForKeyboardMovementDuplicationToPasteboard:(id)a3
{
  -[CRLCanvasEditor copyToPasteboard:nativeOnly:withSender:](self, "copyToPasteboard:nativeOnly:withSender:", a3, 1, 0);
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4
{
  -[CRLCanvasEditor prepareGeometryForInsertingBoardItems:withInsertionContext:ignoreCanvasBackgroundAlignmentProvidedSnapping:](self, "prepareGeometryForInsertingBoardItems:withInsertionContext:ignoreCanvasBackgroundAlignmentProvidedSnapping:", a3, a4, 0);
}

- (void)prepareGeometryForInsertingBoardItems:(id)a3 withInsertionContext:(id)a4 ignoreCanvasBackgroundAlignmentProvidedSnapping:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  CRLBoardItemPositioner *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  CGAffineTransform v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];

  v56 = a5;
  v7 = a3;
  v57 = a4;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v14 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v9);
        v20 = sub_10022209C(v13, v14, 1, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLFittingOnInsertion);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "board"));
          objc_msgSend(v21, "scaleDownSizeToFitWithinSize:board:", v23, 600.0, 600.0);

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v10);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v24, "visibleUnscaledRect");
  v29 = sub_100061400(v25, v26, v27, v28);
  v31 = v30;

  v32 = v57;
  if (objc_msgSend(v57, "hasPreferredCenter"))
  {
    objc_msgSend(v57, "preferredCenter");
    v29 = v33;
    v31 = v34;
  }
  v35 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:]([CRLBoardItemPositioner alloc], "initWithCanvasEditor:targetCenter:validGeometries:", self, 0, v29, v31);
  -[CRLBoardItemPositioner positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:](v35, "positionBoardItems:ignoreCanvasBackgroundAlignmentProvidedSnapping:", v7, v56);
  v37 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v36);
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "topLevelContainerInfoForEditing"));
  v40 = sub_100221D0C(v37, v39);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

  if (v41)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
    v43 = objc_msgSend(v42, "canInsertBoardItems:intoGroup:", v7, v41);

    if (v43)
    {
      memset(&v64, 0, sizeof(v64));
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topLevelContainerRepForEditing"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layout"));
      v47 = v46;
      if (v46)
        objc_msgSend(v46, "transformInRoot");
      else
        memset(&v64, 0, sizeof(v64));

      v62 = v64;
      CGAffineTransformInvert(&v63, &v62);
      v64 = v63;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v61 = 0u;
      v48 = v7;
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v50; j = (char *)j + 1)
          {
            if (*(_QWORD *)v59 != v51)
              objc_enumerationMutation(v48);
            v53 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "geometry"));
            v63 = v64;
            v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "geometryByAppendingTransform:", &v63));
            objc_msgSend(v53, "setGeometry:", v55);

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        }
        while (v50);
      }

      v32 = v57;
    }
  }

}

- (CGSize)sizeForInsertingMediaOfSize:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)selectionBehaviorForInsertingBoardItems:(id)a3
{
  id v4;
  CRLCanvasCommandSelectionBehavior *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;

  v4 = a3;
  v5 = [CRLCanvasCommandSelectionBehavior alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  v7 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v5, "initWithCanvasEditor:type:constructedInfos:", self, 0, v6);
  return v7;
}

- (void)insertBoardItems:(id)a3 withInsertionContext:(id)a4 postProcessBlock:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));
  if (objc_msgSend(v8, "shouldEndEditing"))
    objc_msgSend(v10, "endEditing");
  if (objc_msgSend(v8, "shouldEndEditing"))
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionBehaviorForInsertingBoardItems:](self, "selectionBehaviorForInsertingBoardItems:", v15));
  else
    v12 = 0;
  objc_msgSend(v11, "openGroupWithSelectionBehavior:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Insert"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v11, "setCurrentGroupActionString:", v14);

  -[CRLCanvasEditor p_insertBoardItems:withInsertionContext:](self, "p_insertBoardItems:withInsertionContext:", v15, v8);
  if (v9)
    v9[2](v9);
  objc_msgSend(v11, "closeGroup");

}

- (void)p_insertBoardItems:(id)a3 withInsertionContext:(id)a4
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
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _TtC8Freeform26CRLCommandInsertBoardItems *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
  if ((objc_msgSend(v9, "isGroupOpen") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012322D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DF15B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012322F0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor p_insertBoardItems:withInsertionContext:]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 1067, 0, "Expected a command group to be open.");

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "board"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "rootContainer"));

  v17 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topLevelContainerInfoForEditing"));
  v19 = sub_100221D0C(v17, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v32 = v20;
  v33 = v8;
  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
    v22 = objc_msgSend(v21, "canInsertBoardItems:intoGroup:", v6, v20);

    if (v22)
    {
      v23 = v20;

      v15 = v23;
    }
  }
  v24 = v7;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v6;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  v34 = v24;
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      v29 = 0;
      v30 = v24;
      do
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        v31 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItem:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItem:", v15, *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v29));
        objc_msgSend(v9, "enqueueCommand:", v31);
        v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "insertionContextFromInsertionContextWithNextZOrder"));

        v29 = (char *)v29 + 1;
        v30 = v24;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v27);
  }

}

- (void)pasteWithPasteboard:(id)a3 selectionPath:(id)a4 forceMatchStyle:(BOOL)a5 sender:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CRLPasteboardMultipleImportableBoardItemProvider *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CRLPasteboardMultipleImportableBoardItemProvider *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  CRLPasteboardMultipleImportableBoardItemProvider *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[6];
  CRLPasteboardMultipleImportableBoardItemProvider *v40;
  CRLCanvasEditor *v41;
  id v42;
  id v43;
  id v44;
  char v45;
  _QWORD v46[4];
  CRLPasteboardMultipleImportableBoardItemProvider *v47;
  char v48[9];

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor pasteboardController](self, "pasteboardController"));
  v48[0] = 0;
  if ((objc_msgSend(v13, "hasNativeTypesOnPasteboard:", v10) & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providersForNativeBoardItemsAndTextFromPasteboard:validGeometries:", v10, v48));
    v15 = v14;
    if (v14 && objc_msgSend(v14, "count"))
      v16 = -[CRLCanvasEditor p_pasteNativeBoardItemsFromProviders:withPasteboard:selectionPath:sender:hasValidGeometries:allowImageReplacement:](self, "p_pasteNativeBoardItemsFromProviders:withPasteboard:selectionPath:sender:hasValidGeometries:allowImageReplacement:", v15, v10, v11, v12, v48[0], 1);
    v17 = 0;
  }
  else
  {
    switch((unint64_t)objc_msgSend(v13, "preferredImportableDataTypeOnPasteboard:detectImportableURLsInText:", v10, !v7))
    {
      case 1uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providersForBoardItemsFromImportedRichTextFromPasteboard:", v10));
        goto LABEL_20;
      case 2uLL:
        goto LABEL_18;
      case 3uLL:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232310);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DF1634();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101232330);
        v19 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100DE7468(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor pasteWithPasteboard:selectionPath:forceMatchStyle:sender:]"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1104, 0, "Should not be given file promises in normal paste logic! App being copied from is misbehaving.");

LABEL_18:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providersForBoardItemsImportedFromPasteboard:", v10));
        goto LABEL_20;
      case 4uLL:
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providersForBoardItemsFromImportedTextFromPasteboard:", v10));
LABEL_20:
        v17 = v18;
        if (v18 && objc_msgSend(v18, "count"))
        {
          v22 = -[CRLPasteboardMultipleImportableBoardItemProvider initWithImportableBoardItemProviders:]([CRLPasteboardMultipleImportableBoardItemProvider alloc], "initWithImportableBoardItemProviders:", v17);
          -[CRLPasteboardMultipleImportableBoardItemProvider setAlertPresenter:](v22, "setAlertPresenter:", self);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "editingCoordinator"));
          objc_msgSend(v24, "suspendCollaborationWithReason:", CFSTR("CRLCanvasEditorPastingImportableBoardItems"));

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v38 = v11;
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Pasting…"), 0, 0));

          v37 = v12;
          v27 = v25;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layerHost"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPasteboardMultipleImportableBoardItemProvider progress](v22, "progress"));
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100086C04;
          v46[3] = &unk_10122D110;
          v30 = v22;
          v47 = v30;
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "beginModalOperationWithPresentedLocalizedMessage:progress:cancelHandler:", v36, v29, v46));

          v32 = v27;
          v12 = v37;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "editingCoordinator"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "boardItemFactory"));
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_100086C0C;
          v39[3] = &unk_101232358;
          v39[4] = v32;
          v39[5] = v31;
          v40 = v30;
          v41 = self;
          v42 = v38;
          v43 = v37;
          v44 = v10;
          v45 = 0;
          v35 = v30;
          -[CRLPasteboardMultipleImportableBoardItemProvider provideBoardItemsWithFactory:completionHandler:](v35, "provideBoardItemsWithFactory:completionHandler:", v34, v39);

          v11 = v38;
        }
        break;
      default:
        v17 = 0;
        break;
    }
    v15 = 0;
  }

}

- (id)p_pasteNativeBoardItemsFromProviders:(id)a3 withPasteboard:(id)a4 selectionPath:(id)a5 sender:(id)a6 hasValidGeometries:(BOOL)a7 allowImageReplacement:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  CRLCanvasCommandSelectionBehavior *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  CRLCanvasCommandSelectionBehavior *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v39;
  CRLCanvasCommandSelectionBehavior *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];

  v8 = a8;
  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = v17;
  v44 = v16;
  if (!v8)
  {
    v39 = v9;
    v41 = v17;
    v42 = v15;
    v40 = 0;
    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v49 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "commandForReplacingImagePlaceholderInSelection:withBoardItems:isCrossDocument:withSender:outSelectionBehavior:", v16, v14, 0, v18, &v49));
  v21 = (CRLCanvasCommandSelectionBehavior *)v49;

  if (!v20)
  {
    v39 = v9;
    v40 = v21;
    v41 = v18;
    v42 = v15;
LABEL_7:
    v23 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v14, "count"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v43 = v14;
    v24 = v14;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "editingCoordinator"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "boardItemFactory"));
          v33 = objc_msgSend(v29, "newBoardItemWithFactory:bakedSize:", v32, 0);

          if (v33)
            objc_msgSend(v23, "addObject:", v33);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v26);
    }

    v18 = v41;
    v15 = v42;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_commandForPastingProvidedBoardItems:withPasteboard:sender:hasValidGeometries:allowPositionChange:](self, "p_commandForPastingProvidedBoardItems:withPasteboard:sender:hasValidGeometries:allowPositionChange:", v23, v42, v41, v39, 1));
    if (!v20)
    {
      v22 = 0;
      v14 = v43;
      v21 = v40;
      goto LABEL_24;
    }
    v22 = v23;
    v14 = v43;
    v21 = v40;
    if (!v40)
      goto LABEL_18;
    goto LABEL_22;
  }
  v22 = 0;
  if (!v21)
  {
LABEL_18:
    v34 = [CRLCanvasCommandSelectionBehavior alloc];
    if (v22)
      v35 = v22;
    else
      v35 = &__NSArray0__struct;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v35));
    v21 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v34, "initWithCanvasEditor:type:constructedInfos:", self, 0, v36);

  }
LABEL_22:
  v23 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commandController"));
  objc_msgSend(v37, "enqueueCommand:withSelectionBehavior:", v20, v21);

LABEL_24:
  return v22;
}

- (id)pasteNativeInfosFromPasteboard:(id)a3 allowImageReplacement:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v15;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor pasteboardController](self, "pasteboardController"));
  if (objc_msgSend(v8, "hasNativeTypesOnPasteboard:", v6))
  {
    v15 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "providersForNativeBoardItemsAndTextFromPasteboard:validGeometries:", v6, &v15));
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "selectionPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_pasteNativeBoardItemsFromProviders:withPasteboard:selectionPath:sender:hasValidGeometries:allowImageReplacement:](self, "p_pasteNativeBoardItemsFromProviders:withPasteboard:selectionPath:sender:hasValidGeometries:allowImageReplacement:", v10, v6, v12, 0, v15, v4));

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4 withOffset:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "parentContainerItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v12 = v11;
  if (v10)
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:", v9, v10, v8, a5));
  else
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "commandForInsertingBoardItemsIntoTopLevelContainer:below:withOffset:", v9, v8, a5));
  v14 = (void *)v13;

  return v14;
}

- (id)commandForInsertingBoardItems:(id)a3 below:(id)a4
{
  return -[CRLCanvasEditor commandForInsertingBoardItems:below:withOffset:](self, "commandForInsertingBoardItems:below:withOffset:", a3, a4, 0);
}

- (void)paste:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "paste:", v4);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  objc_msgSend(v6, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (void)pasteAsPlainText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "pasteAsPlainText:", v4);

}

- (void)pasteValues:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "pasteValues:", v4);

}

- (CGRect)p_boundingRectForPastingBoardItems:(id)a3
{
  id v3;
  CGSize size;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  CGPoint origin;
  CGSize v22;
  CGRect result;

  v3 = a3;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x4010000000;
  v20 = &unk_1010E66AB;
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v22 = size;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100087600;
  v14[3] = &unk_1012323C0;
  v5 = v3;
  v15 = v5;
  v16 = &v17;
  +[CRLCanvasLayoutController temporaryLayoutControllerForInfos:useInBlock:](CRLCanvasLayoutController, "temporaryLayoutControllerForInfos:useInBlock:", v5, v14);
  v6 = v18[4];
  v7 = v18[5];
  v8 = v18[6];
  v9 = v18[7];

  _Block_object_dispose(&v17, 8);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)p_commandForPastingProvidedBoardItems:(id)a3 withPasteboard:(id)a4 sender:(id)a5 hasValidGeometries:(BOOL)a6 allowPositionChange:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  BOOL v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  _TtC8Freeform15CRLCommandGroup *v44;
  double v45;
  CRLBoardItemPositioner *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *i;
  _TtC8Freeform26CRLCommandInsertBoardItems *v60;
  void *v61;
  void *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];

  v7 = a7;
  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!objc_msgSend(v12, "count"))
  {
    v44 = 0;
    goto LABEL_28;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v15, "visibleUnscaledRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[CRLCanvasEditor p_boundingRectForPastingBoardItems:](self, "p_boundingRectForPastingBoardItems:", v12);
  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  if (!v8 || !v7)
  {
    if (v7)
      goto LABEL_5;
LABEL_13:
    v40 = v28;
    v41 = v29;
    v42 = v30;
    v43 = v31;
    goto LABEL_14;
  }
  if (sub_10005FFE0(v17, v19, v21, v23, v24, v25, v26, v27))
    goto LABEL_13;
LABEL_5:
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerHost"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "asiOSCVC"));
  objc_msgSend(v33, "lastTapPoint");
  v35 = v34;
  v37 = v36;

  v39 = CGPointZero.x == v35 && CGPointZero.y == v37;
  if (!v39 && !objc_msgSend((id)objc_opt_class(self, v38), "physicalKeyboardIsSender:", v14))
    goto LABEL_15;
  objc_msgSend(v15, "visibleUnscaledRect");
LABEL_14:
  v35 = sub_100061400(v40, v41, v42, v43);
  v37 = v45;
LABEL_15:
  v46 = -[CRLBoardItemPositioner initWithCanvasEditor:targetCenter:validGeometries:]([CRLBoardItemPositioner alloc], "initWithCanvasEditor:targetCenter:validGeometries:", self, v8, v35, v37);
  -[CRLBoardItemPositioner setShouldPreserveRelativePositions:](v46, "setShouldPreserveRelativePositions:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("com.apple.freeform.Canvas.CRLCanvasRepNoPositionOffsetPasteboardName"));

  if (v48)
  {

    v46 = 0;
  }
  v44 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  if (objc_msgSend(v12, "count"))
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editingCoordinator](self, "editingCoordinator"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v12, v49, v50, v15));
    -[CRLCommandGroup addCommands:](v44, "addCommands:", v51);

  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "board"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "rootContainer"));

  -[CRLBoardItemPositioner positionBoardItems:](v46, "positionBoardItems:", v12);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v55 = v12;
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v56)
  {
    v57 = v56;
    v63 = v15;
    v64 = v14;
    v58 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v58)
          objc_enumerationMutation(v55);
        v60 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItem:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItem:", v54, *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i));
        -[CRLCommandGroup addCommand:](v44, "addCommand:", v60);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v57);

    v55 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("Paste"), 0, 0));
    -[CRLCommandGroup setActionString:](v44, "setActionString:", v61);

    v14 = v64;
    v15 = v63;
  }

LABEL_28:
  return v44;
}

- (NSSet)infosForSelectAllInRoot
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infosToDisplay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (void)selectAll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;
  id WeakRetained;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelContainerRepForEditing"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingToolkit"));
  v9 = objc_msgSend(v8, "isInDrawingMode");

  if (v9)
  {
    v65 = v4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionPathWithInfos:](self, "selectionPathWithInfos:", v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
    objc_msgSend(v12, "setSelectionPath:", v11);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layoutController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rootLayout"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "children"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingLayout freehandDrawingLayoutsToInteractWithFromLayouts:](CRLFreehandDrawingLayout, "freehandDrawingLayoutsToInteractWithFromLayouts:", v17));

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v71;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v71 != v21)
            objc_enumerationMutation(v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)v22), "children"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "crl_arrayByTransformingWithBlock:", &stru_101232400));
          objc_msgSend(v13, "addObjectsFromArray:", v24);

          v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v20);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "allObjects"));
    objc_msgSend(v25, "addObjectsFromArray:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "freehandDrawingToolkit"));
    v29 = objc_msgSend(v28, "isLassoAbleToSelectMixedType");

    if (v29)
    {
      if (v6)
      {
        v31 = objc_opt_class(NSArray, v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerInfo"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "childInfos"));
        v34 = sub_100221D0C(v31, v33);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        v36 = (void *)v35;
        v37 = &__NSArray0__struct;
        if (v35)
          v37 = (void *)v35;
        v38 = v37;

      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor infosForSelectAllInRoot](self, "infosForSelectAllInRoot"));
        v38 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allObjects"));
      }

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v42 = v38;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v43)
      {
        v45 = v43;
        v46 = *(_QWORD *)v67;
        do
        {
          v47 = 0;
          do
          {
            if (*(_QWORD *)v67 != v46)
              objc_enumerationMutation(v42);
            v48 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v47);
            v49 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v44);
            if ((objc_opt_isKindOfClass(v48, v49) & 1) == 0)
              objc_msgSend(v25, "addObject:", v48);
            v47 = (char *)v47 + 1;
          }
          while (v45 != v47);
          v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
        }
        while (v45);
      }

    }
    v41 = objc_msgSend(v25, "copy");

    v4 = v65;
  }
  else if (v6)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerInfo"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "childInfos"));
    v41 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v40));

  }
  else
  {
    v41 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor infosForSelectAllInRoot](self, "infosForSelectAllInRoot"));
  }
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_selectableInfosInInfos:](self, "p_selectableInfosInInfos:", v41));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v50));

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionPathWithInfos:](self, "selectionPathWithInfos:", v51));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
  objc_msgSend(v53, "setSelectionPath:", v52);

  v55 = objc_opt_class(UICommand, v54);
  if ((objc_opt_isKindOfClass(v4, v55) & 1) == 0)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "layerHost"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "asiOSCVC"));
    v59 = objc_msgSend(v58, "isCurrentlyInQuickSelectMode");

    if ((v59 & 1) == 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->mInteractiveCanvasController);
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "miniFormatterPresenter"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "selectionPath"));
      objc_msgSend(v62, "presentMiniFormatterForSelectionPath:", v64);

    }
  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0))
    -[CRLCanvasEditor hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected](self, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (void)group:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "group:", v4);

}

- (void)ungroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "ungroup:", v4);

}

- (BOOL)canGroupBoardItem:(id)a3
{
  return _objc_msgSend(a3, "canBeGrouped");
}

- (NSArray)infosToConnect
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v2, "isDraggingToInsertBoardItems") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editorController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineRep infosToConnectFromSelectionPath:withInteractiveCanvasController:](CRLConnectionLineRep, "infosToConnectFromSelectionPath:withInteractiveCanvasController:", v5, v2));

  }
  return (NSArray *)v3;
}

- (void)connectWithConnectionLine:(id)a3
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemFactory"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor connectionLineItemToUseForConnecting](self, "connectionLineItemToUseForConnecting"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editingCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItemFactory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "makeDuplicateOfBoardItem:", v7));

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "makeShapeItemWithShapeType:", 19));
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor infosToConnect](self, "infosToConnect"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "commandController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "blockToRunCommandToPostProcessWithNewBoardItem:shapeType:infosToConnect:commandController:", v11, 2, v12, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext nonInteractiveInsertionContext](CRLInsertionContext, "nonInteractiveInsertionContext"));
  v21 = v11;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  -[CRLCanvasEditor prepareGeometryForInsertingBoardItems:withInsertionContext:](self, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v17, v16);

  v20 = v11;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  -[CRLCanvasEditor insertBoardItems:withInsertionContext:postProcessBlock:](self, "insertBoardItems:withInsertionContext:postProcessBlock:", v18, v16, v15);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v19, "donateTipEventObjectsConnectedWithConnectionLine");

}

- (_TtC8Freeform21CRLConnectionLineItem)connectionLineItemToUseForConnecting
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  CRLCanvasEditor *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "board"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootContainer"));

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childItems"));
  v7 = (char *)objc_msgSend(v6, "count");

  if ((uint64_t)(v7 - 1) < 0)
  {
LABEL_7:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "highestZOrderConnectionLineLayoutAcrossBoard"));
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "connectionLineInfo"));

  }
  else
  {
    while (1)
    {
      --v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childItems"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

      v11 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v10);
      if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
      {
        v13 = (objc_class *)objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v12);
        v14 = sub_1002223BC(v13, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor infosToConnect](self, "infosToConnect"));
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000888A0;
        v21[3] = &unk_101232428;
        v17 = v15;
        v22 = v17;
        v23 = self;
        v18 = objc_msgSend(v16, "crl_containsObjectPassingTest:", v21);

        if (v18)
          v6 = v17;

        if ((v18 & 1) != 0)
          break;
      }

      if ((uint64_t)v7 <= 0)
        goto LABEL_7;
    }
  }

  return (_TtC8Freeform21CRLConnectionLineItem *)v6;
}

- (id)p_nextInfoInTabSequence:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  char *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  unsigned int v24;
  double MaxX;
  double MinY;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v37;
  char *v38;
  int64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  char *v52;
  unint64_t v53;
  void *v55;
  int64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "boardItemsForSelectionPath:", v9));

  v11 = objc_msgSend(v10, "count");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_spatiallySortedSelectableBoardItems](self, "p_spatiallySortedSelectableBoardItems"));
  v13 = objc_msgSend(v12, "mutableCopy");

  if (objc_msgSend(v13, "count"))
  {
    if (!v11)
    {
      if (a3 == 1)
      {
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
        goto LABEL_51;
      }
      if (!a3)
      {
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
LABEL_51:
        v40 = (void *)v41;
        goto LABEL_52;
      }
    }
    v56 = a3;
    v14 = (char *)objc_msgSend(v13, "count", v10);
    if ((unint64_t)(v14 - 1) >= 2)
    {
      v15 = (unint64_t)(v14 - 2);
      do
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v15 + 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "geometry"));

        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v15));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "geometry"));

        objc_msgSend(v19, "size");
        v21 = v20;
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "canvas"));
        v24 = objc_msgSend(v23, "isAnchoredAtRight");

        if (v24)
        {
          objc_msgSend(v17, "transformedBounds");
          MaxX = CGRectGetMaxX(v62);
          objc_msgSend(v17, "transformedBounds");
          MinY = CGRectGetMinY(v63);
          objc_msgSend(v19, "transformedBounds");
          v27 = CGRectGetMaxX(v64);
          objc_msgSend(v19, "transformedBounds");
          v28 = CGRectGetMinY(v65);
          if (MaxX > v27)
            goto LABEL_9;
        }
        else
        {
          objc_msgSend(v17, "position");
          v30 = v29;
          MinY = v31;
          objc_msgSend(v19, "position");
          v33 = v32;
          v28 = v34;
          if (v30 < v33)
          {
LABEL_9:
            if (v28 >= MinY - v21 * 0.33 && v28 < v21 * 0.33 + MinY)
              objc_msgSend(v13, "exchangeObjectAtIndex:withObjectAtIndex:", v15 + 1, v15);
          }
        }

      }
      while (v15-- > 1);
    }
    if (v11 == (id)1)
    {
      v10 = v55;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "anyObject"));
      v38 = (char *)objc_msgSend(v13, "indexOfObject:", v37);

      v39 = v56;
    }
    else
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v10 = v55;
      v43 = v55;
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      if (v44)
      {
        v45 = v44;
        v46 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v45; i = (char *)i + 1)
          {
            if (*(_QWORD *)v58 != v46)
              objc_enumerationMutation(v43);
            objc_msgSend(v42, "addIndex:", objc_msgSend(v13, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i)));
          }
          v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
        }
        while (v45);
      }

      v39 = v56;
      if (v56 == 1)
        v48 = (char *)objc_msgSend(v42, "firstIndex");
      else
        v48 = (char *)objc_msgSend(v42, "lastIndex");
      v38 = v48;

    }
    if (v38 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232448);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DF16B4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101232468);
      v49 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCanvasEditor p_nextInfoInTabSequence:]"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCanvasEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 1617, 0, "couldn't find selected info in all drawables!");

      if (v56 == 1)
      {
LABEL_43:
        v52 = v38 - 1;
LABEL_49:
        v53 = (unint64_t)v52 % (unint64_t)objc_msgSend(v13, "count");
        goto LABEL_50;
      }
    }
    else
    {
      if (v39 == 1 && !v38)
      {
        v53 = (unint64_t)objc_msgSend(v13, "count") - 1;
LABEL_50:
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v53));
        goto LABEL_51;
      }
      if (v39 == 1)
        goto LABEL_43;
    }
    v52 = v38 + 1;
    goto LABEL_49;
  }
  v40 = 0;
LABEL_52:

  return v40;
}

+ (id)spatialInfoComparator
{
  return &stru_1012324A8;
}

- (id)p_spatiallySortedSelectableBoardItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  Block_layout *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topLevelContainerRepForEditing"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerInfo"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "childInfos"));
LABEL_13:
    v9 = (void *)v6;
    goto LABEL_14;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = objc_msgSend(v7, "hasSelectedInfosInMultipleContainers");

  if (!v8)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infosToDisplay"));
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "containersForSelection"));

  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "childInfos"));
        objc_msgSend(v9, "addObjectsFromArray:", v15);

      }
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }
LABEL_14:

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_selectableInfosInInfos:](self, "p_selectableInfosInInfos:", v9));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvas"));
  v19 = objc_msgSend(v18, "isAnchoredAtRight");

  if (v19)
    v20 = &stru_1012324C8;
  else
    v20 = &stru_1012324A8;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sortedArrayUsingComparator:", v20));

  return v21;
}

- (id)p_selectableInfosInInfos:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "repForInfo:", v12, (_QWORD)v16));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "repForSelecting"));

        if (v14 == v13)
          objc_msgSend(v5, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v5;
}

- (void)insertTab:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isInDrawingMode");

  if (!v7 || (v4 & 1) == 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_nextInfoInTabSequence:](self, "p_nextInfoInTabSequence:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionPathWithInfo:](self, "selectionPathWithInfo:", v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
    objc_msgSend(v9, "setSelectionPath:", v8);

  }
}

- (void)insertBacktab:(id)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;

  v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isInDrawingMode");

  if (!v7 || (v4 & 1) == 0)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor p_nextInfoInTabSequence:](self, "p_nextInfoInTabSequence:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor selectionPathWithInfo:](self, "selectionPathWithInfo:", v10));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor editorController](self, "editorController"));
    objc_msgSend(v9, "setSelectionPath:", v8);

  }
}

- (BOOL)handlesSpacebar
{
  return 1;
}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v6, "beginEditingOnKeyInputWithString:", v5);

}

- (void)insertNewline:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  objc_msgSend(v4, "beginEditingOnKeyInputWithString:", v3);

}

- (id)createArrangeInspectorDelegate
{
  return -[CRLDrawableZOrderArranger initWithCanvasEditor:]([CRLDrawableZOrderArranger alloc], "initWithCanvasEditor:", self);
}

- (CRLArrangeInspectorDelegate)arrangeInspectorDelegate
{
  CRLArrangeInspectorDelegate *mZOrderArranger;
  CRLArrangeInspectorDelegate *v4;
  CRLArrangeInspectorDelegate *v5;

  mZOrderArranger = self->mZOrderArranger;
  if (!mZOrderArranger)
  {
    v4 = (CRLArrangeInspectorDelegate *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor createArrangeInspectorDelegate](self, "createArrangeInspectorDelegate"));
    v5 = self->mZOrderArranger;
    self->mZOrderArranger = v4;

    mZOrderArranger = self->mZOrderArranger;
  }
  return mZOrderArranger;
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasLayer"));
  objc_msgSend(v4, "contentInset");
  v6 = v5;

  objc_msgSend(v10, "contentOffset");
  v8 = v7;
  objc_msgSend(v10, "viewScale");
  objc_msgSend(v10, "setContentOffset:scrollOptions:", 1, v8, v6 / v9);

}

- (void)scrollToEndOfDocument:(id)a3
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(v14, "contentOffset");
  v13 = v12;
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  objc_msgSend(v14, "setContentOffset:scrollOptions:", 1, v13, CGRectGetMaxY(v15));

}

- (void)zoomIn:(id)a3
{
  CRLCanvasEditor *v4;
  void *v5;
  CRLCanvasEditor *v6;
  id v7;

  v4 = (CRLCanvasEditor *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v7 = v5;
  if (v4)
    v6 = v4;
  else
    v6 = self;
  objc_msgSend(v5, "zoomIn:", v6);

}

- (void)zoomOut:(id)a3
{
  CRLCanvasEditor *v4;
  void *v5;
  CRLCanvasEditor *v6;
  id v7;

  v4 = (CRLCanvasEditor *)a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  v7 = v5;
  if (v4)
    v6 = v4;
  else
    v6 = self;
  objc_msgSend(v5, "zoomOut:", v6);

}

- (void)zoomToFitAllContent:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  objc_msgSend(v3, "zoomToFitAllContent");

}

- (void)zoomToSelection:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  objc_msgSend(v3, "zoomToCurrentSelection");

}

- (void)actualSize:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "followCoordinator"));
  objc_msgSend(v6, "endFollowSessionForLocalParticipantWithShouldShowRefollowPlacard:", 1);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v7, "setViewScale:", 1.0);

}

- (id)leadingBarButtonGroupsWithDefaultGroups:(id)a3
{
  return &__NSArray0__struct;
}

- (id)trailingBarButtonGroupsWithDefaultGroups:(id)a3
{
  return &__NSArray0__struct;
}

- (void)scrollCanvasPageUp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasPageUp:", v4);

}

- (void)scrollCanvasPageDown:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasPageDown:", v4);

}

- (void)scrollCanvasUp:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasUp:", v4);

}

- (void)scrollCanvasDown:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasDown:", v4);

}

- (void)scrollCanvasLeft:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasLeft:", v4);

}

- (void)scrollCanvasRight:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditor canvasEditorHelper](self, "canvasEditorHelper"));
  objc_msgSend(v5, "scrollCanvasRight:", v4);

}

- (UIInputViewController)inputAccessoryViewController
{
  return self->inputAccessoryViewController;
}

- (NSArray)leadingBarButtonGroups
{
  return self->leadingBarButtonGroups;
}

- (NSArray)trailingBarButtonGroups
{
  return self->trailingBarButtonGroups;
}

- (BOOL)resignFirstResponderWhenKeyboardHides
{
  return self->mResignFirstResponderWhenKeyboardHides;
}

- (void)setResignFirstResponderWhenKeyboardHides:(BOOL)a3
{
  self->mResignFirstResponderWhenKeyboardHides = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->trailingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->leadingBarButtonGroups, 0);
  objc_storeStrong((id *)&self->inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_pasteboardController, 0);
  objc_storeStrong((id *)&self->mInputView, 0);
  objc_storeStrong((id *)&self->mZOrderArranger, 0);
  objc_storeStrong((id *)&self->mCanvasEditorHelper, 0);
  objc_destroyWeak((id *)&self->mInteractiveCanvasController);
}

@end
