@implementation CRLStyledEditor

- (_TtC8Freeform13CRLStyledItem)anyStyledItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "anyObject"));

  return (_TtC8Freeform13CRLStyledItem *)v3;
}

+ (id)keyPathsForValuesAffectingStyledItems
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("boardItems"));
}

- (BOOL)p_canPasteStyle
{
  void *v3;
  uint64_t v4;
  id v5;
  CRLStyledEditor *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  char isKindOfClass;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v5 = objc_msgSend(v3, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLBoardItemEditor, v4));
  v6 = (CRLStyledEditor *)objc_claimAutoreleasedReturnValue(v5);

  if (v6 == self)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pasteboardController"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard stylePasteboard](CRLPasteboard, "stylePasteboard"));
    v13 = objc_msgSend(v10, "containsStylesRelevantTo:on:", v11, v12);

    if (v13)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems", 0));
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v14);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "parentInfo"));
            v20 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v19);
            isKindOfClass = objc_opt_isKindOfClass(v18, v20);

            if ((isKindOfClass & 1) != 0)
            {
              LOBYTE(v15) = 1;
              goto LABEL_15;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v15) = 0;
    }
    v7 = v13 & (v15 ^ 1);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingStroke
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("styledItems"));
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingShadow
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("styledItems"));
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReflection
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("styledItems"));
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingOpacity
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("styledItems"));
}

- (NSSet)selectedObjectsSupportingFill
{
  return 0;
}

- (BOOL)p_canCopyStyle
{
  void *v3;
  uint64_t v4;
  id v5;
  CRLStyledEditor *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v5 = objc_msgSend(v3, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLBoardItemEditor, v4));
  v6 = (CRLStyledEditor *)objc_claimAutoreleasedReturnValue(v5);

  if (v6 == self
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 == (id)1))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "anyObject"));

    if (v10)
      v11 = objc_msgSend(v10, "canCopyStyle");
    else
      v11 = 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v10;
  int64_t v11;
  objc_super v13;

  v6 = a4;
  v10 = "applyStroke:" == a3
     || "takePatternFromStroke:withDefaultStroke:" == a3
     || "applyStrokeColor:" == a3
     || "applyStrokeWidth:" == a3
     || "applyStrokePattern:" == a3;
  if (v10
    || "copyStyle:" == a3 && -[CRLStyledEditor p_canCopyStyle](self, "p_canCopyStyle")
    || sel_isEqual(a3, "pasteStyle:") && -[CRLStyledEditor p_canPasteStyle](self, "p_canPasteStyle"))
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLStyledEditor;
    v11 = -[CRLBoardItemEditor canPerformEditorAction:withSender:](&v13, "canPerformEditorAction:withSender:", a3, v6);
  }

  return v11;
}

- (void)copyStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard stylePasteboard](CRLPasteboard, "stylePasteboard", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pasteboardController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v9 = objc_msgSend(v8, "count");

  if (v9 != (id)1)
  {
    v10 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012313E0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DEF858(v10, v11);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231400);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor copyStyle:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 160, 0, "Should only copy style with a single object selected");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));

  objc_msgSend(v7, "copyStyleFromItem:to:", v16, v4);
}

- (void)pasteStyle:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLCanvasCommandSelectionBehavior *v11;
  void *v12;
  void *v13;
  CRLCanvasCommandSelectionBehavior *v14;
  void *v15;
  void *v16;
  _TtC8Freeform15CRLCommandGroup *v17;
  id v18;

  v18 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard stylePasteboard](CRLPasteboard, "stylePasteboard", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pasteboardController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandsToPasteStyleTo:from:", v7, v18));

  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));

    v11 = [CRLCanvasCommandSelectionBehavior alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasEditor"));
    v14 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v11, "initWithCanvasEditor:", v13);

    objc_msgSend(v10, "openGroupWithSelectionBehavior:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Paste Style"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v10, "setCurrentGroupActionString:", v16);

    v17 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v8);
    objc_msgSend(v10, "enqueueCommand:", v17);

    objc_msgSend(v10, "closeGroup");
  }

}

- (NSArray)strokeSwatches
{
  return (NSArray *)&__NSArray0__struct;
}

- (double)defaultStrokeWidth
{
  return 1.0;
}

- (id)defaultStrokeColor
{
  return +[CRLColor blackColor](CRLColor, "blackColor");
}

- (CRLStroke)stroke
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor anyStyledItem](self, "anyStyledItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stroke"));

  return (CRLStroke *)v3;
}

- (CRLColor)strokeColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor stroke](self, "stroke"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "color"));

  return (CRLColor *)v3;
}

- (BOOL)isChangingStrokeWidth
{
  return self->mIsChangingStrokeWidth;
}

- (double)strokeWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor stroke](self, "stroke"));
  objc_msgSend(v2, "width");
  v4 = v3;

  return v4;
}

- (NSString)strokeColorPickerTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Border Color"), 0, 0));

  return (NSString *)v3;
}

- (NSString)currentGroupActionStringForStrokeSetting
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Border Setting"), 0, CFSTR("UndoStrings")));

  return (NSString *)v3;
}

- (void)applyStroke:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _TtC8Freeform19CRLCommandSetStroke *v17;
  CRLCanvasCommandSelectionBehavior *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v19 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  v18 = v9;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  objc_msgSend(v6, "enableProgressiveEnqueuingInCurrentGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor currentGroupActionStringForStrokeSetting](self, "currentGroupActionStringForStrokeSetting"));
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
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
        v17 = -[CRLCommandSetStroke initWithStyledItem:stroke:]([_TtC8Freeform19CRLCommandSetStroke alloc], "initWithStyledItem:stroke:", v16, v4);
        objc_msgSend(v6, "enqueueCommand:", v17);
        -[CRLStyledEditor p_enqueueCommandsToAdjustCustomMagnetsForInfo:](self, "p_enqueueCommandsToAdjustCustomMagnetsForInfo:", v16);

        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  objc_msgSend(v6, "closeGroup");
}

- (void)applyStrokeColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  CRLStyledEditor *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _TtC8Freeform19CRLCommandSetStroke *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  CRLCanvasCommandSelectionBehavior *v28;
  void *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  _BYTE v46[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v29 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  v28 = v9;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor currentGroupActionStringForStrokeSetting](self, "currentGroupActionStringForStrokeSetting"));
  v31 = v6;
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = self;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v33;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v33 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stroke"));
        v18 = v17;
        if (v17 && !objc_msgSend(v17, "isNullStroke"))
        {
          v20 = objc_msgSend(v18, "mutableCopy");
          objc_msgSend(v20, "setColor:", v4);
          if (v20)
          {
LABEL_9:
            v21 = -[CRLCommandSetStroke initWithStyledItem:stroke:]([_TtC8Freeform19CRLCommandSetStroke alloc], "initWithStyledItem:stroke:", v16, v20);
            objc_msgSend(v31, "enqueueCommand:", v21);
            goto LABEL_20;
          }
        }
        else
        {
          -[CRLStyledEditor defaultStrokeWidth](v11, "defaultStrokeWidth");
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:](CRLStroke, "strokeWithColor:width:", v4));
          v20 = objc_msgSend(v19, "mutableCopy");

          if (v20)
            goto LABEL_9;
        }
        v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231420);
        v23 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          v37 = v22;
          v38 = 2082;
          v39 = "-[CRLStyledEditor applyStrokeColor:]";
          v40 = 2082;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
          v42 = 1024;
          v43 = 256;
          v44 = 2082;
          v45 = "newStroke";
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231440);
        v24 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v26 = v24;
          v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v37 = v22;
          v38 = 2114;
          v39 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokeColor:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 256, 0, "invalid nil value for '%{public}s'", "newStroke");

LABEL_20:
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v13);
  }

  objc_msgSend(v31, "closeGroup");
}

- (void)applyStrokeWidth:(double)a3
{
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _TtC8Freeform19CRLCommandSetStroke *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  CRLCanvasCommandSelectionBehavior *v28;
  void *v29;
  id obj;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  unsigned int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  const char *v45;
  _BYTE v46[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v29 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  v28 = v9;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  objc_msgSend(v6, "enableProgressiveEnqueuingInCurrentGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor currentGroupActionStringForStrokeSetting](self, "currentGroupActionStringForStrokeSetting"));
  v31 = v6;
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stroke"));
        v17 = v16;
        if (v16 && !objc_msgSend(v16, "isNullStroke"))
        {
          v20 = objc_msgSend(v17, "mutableCopy");
          objc_msgSend(v20, "setWidth:", a3);
          if (v20)
          {
LABEL_9:
            v21 = -[CRLCommandSetStroke initWithStyledItem:stroke:]([_TtC8Freeform19CRLCommandSetStroke alloc], "initWithStyledItem:stroke:", v15, v20);
            objc_msgSend(v31, "enqueueCommand:", v21);
            goto LABEL_20;
          }
        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor defaultStrokeColor](self, "defaultStrokeColor"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStroke strokeWithColor:width:](CRLStroke, "strokeWithColor:width:", v18, a3));
          v20 = objc_msgSend(v19, "mutableCopy");

          if (v20)
            goto LABEL_9;
        }
        v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231460);
        v23 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          v37 = v22;
          v38 = 2082;
          v39 = "-[CRLStyledEditor applyStrokeWidth:]";
          v40 = 2082;
          v41 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
          v42 = 1024;
          v43 = 285;
          v44 = 2082;
          v45 = "newStroke";
          _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101231480);
        v24 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v26 = v24;
          v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v37 = v22;
          v38 = 2114;
          v39 = v27;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokeWidth:]"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 285, 0, "invalid nil value for '%{public}s'", "newStroke");

LABEL_20:
        -[CRLStyledEditor p_enqueueCommandsToAdjustCustomMagnetsForInfo:](self, "p_enqueueCommandsToAdjustCustomMagnetsForInfo:", v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v46, 16);
    }
    while (v12);
  }

  objc_msgSend(v31, "closeGroup");
}

- (void)p_enqueueCommandsToAdjustCustomMagnetsForInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfo:", v4));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "adjustCustomMagnetPositions");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandsForAdjustingMagnetsFromClineLayouts"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
          objc_msgSend(v14, "enqueueCommand:", v13);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

- (void)beginChangingStrokeWidth:(double)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  self->mIsChangingStrokeWidth = 1;
  objc_msgSend(v4, "beginDynamicOperation");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v10, "dynamicStrokeWidthChangeDidBegin");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)didChangeStrokeWidth:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10)));
        objc_msgSend(v11, "dynamicStrokeWidthUpdateToValue:", a3);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)endChangingStrokeWidth:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10)));
        objc_msgSend(v11, "dynamicStrokeWidthChangeDidEnd");

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "willEndDynamicOperation");
  objc_msgSend(v5, "endDynamicOperation");
  self->mIsChangingStrokeWidth = 0;
  -[CRLStyledEditor applyStrokeWidth:](self, "applyStrokeWidth:", a3);

}

- (void)takePatternFromStroke:(id)a3 withDefaultStroke:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  CRLCanvasCommandSelectionBehavior *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  _TtC8Freeform19CRLCommandSetStroke *v23;
  void *v24;
  id obj;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v6 = a3;
  v26 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));
  v9 = [CRLCanvasCommandSelectionBehavior alloc];
  v24 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  v11 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v9, "initWithCanvasEditor:type:", v10, 2);

  objc_msgSend(v8, "openGroupWithSelectionBehavior:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor currentGroupActionStringForStrokeSetting](self, "currentGroupActionStringForStrokeSetting"));
  objc_msgSend(v8, "setCurrentGroupActionString:", v12);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stroke"));
        v19 = objc_msgSend(v6, "mutableCopy");
        if (v18 && (objc_msgSend(v18, "isNullStroke") & 1) == 0)
        {
          v20 = v19;
          v21 = v18;
        }
        else
        {
          v20 = v19;
          v21 = v26;
        }
        objc_msgSend(v20, "setPropertiesFromStroke:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pattern"));
        objc_msgSend(v19, "setPattern:", v22);

        objc_msgSend(v19, "setCap:", objc_msgSend(v6, "cap"));
        v23 = -[CRLCommandSetStroke initWithStyledItem:stroke:]([_TtC8Freeform19CRLCommandSetStroke alloc], "initWithStyledItem:stroke:", v17, v19);
        objc_msgSend(v8, "enqueueCommand:", v23);

      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(v8, "closeGroup");
}

- (void)applyStrokePattern:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLStroke *v19;
  id v20;
  _TtC8Freeform19CRLCommandSetStroke *v21;
  unsigned int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char *v27;
  CRLCanvasCommandSelectionBehavior *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  unsigned int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;
  _BYTE v45[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v29 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:](v7, "initWithCanvasEditor:type:", v8, 2);

  v28 = v9;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor currentGroupActionStringForStrokeSetting](self, "currentGroupActionStringForStrokeSetting"));
  v11 = v6;
  objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems"));
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stroke"));
        v18 = v17;
        if (v17 && !objc_msgSend(v17, "isNullStroke"))
        {
          v20 = objc_msgSend(v18, "mutableCopy");
        }
        else
        {
          v19 = objc_alloc_init(CRLStroke);
          v20 = -[CRLStroke mutableCopy](v19, "mutableCopy");

        }
        objc_msgSend(v20, "setPattern:", v4);
        if (v20)
        {
          v21 = -[CRLCommandSetStroke initWithStyledItem:stroke:]([_TtC8Freeform19CRLCommandSetStroke alloc], "initWithStyledItem:stroke:", v16, v20);
          objc_msgSend(v11, "enqueueCommand:", v21);
        }
        else
        {
          v22 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012314A0);
          v23 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v36 = v22;
            v37 = 2082;
            v38 = "-[CRLStyledEditor applyStrokePattern:]";
            v39 = 2082;
            v40 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m";
            v41 = 1024;
            v42 = 410;
            v43 = 2082;
            v44 = "newStroke";
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_1012314C0);
          v24 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v26 = v24;
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v36 = v22;
            v37 = 2114;
            v38 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v21 = (_TtC8Freeform19CRLCommandSetStroke *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLStyledEditor applyStrokePattern:]"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLStyledEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v25, 410, 0, "invalid nil value for '%{public}s'", "newStroke");

        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v13);
  }

  objc_msgSend(v11, "closeGroup");
}

- (BOOL)p_anyItemHasStroke
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLStyledEditor styledItems](self, "styledItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "stroke"));
        v7 = v6;
        if (v6 && !objc_msgSend(v6, "isNullStroke"))
        {

          LOBYTE(v3) = 1;
          goto LABEL_12;
        }

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

@end
