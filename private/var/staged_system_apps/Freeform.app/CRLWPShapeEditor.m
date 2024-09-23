@implementation CRLWPShapeEditor

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  objc_class *v17;
  objc_class *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  double v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  id v27;
  void *v28;
  _TtC8Freeform11CRLWPEditor *v29;
  void *v30;
  void *v31;
  _TtC8Freeform11CRLWPEditor *v32;
  id v33;
  void *v35;
  objc_super v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class(CRLWPSelection, v11);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionModelTranslator"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "infosForSelectionPath:", v10));
    *(_QWORD *)&v16 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v15).n128_u64[0];
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crl_onlyObject", v16));
    v20 = sub_1002223BC(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

    *(_QWORD *)&v23 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v22).n128_u64[0];
    v25 = v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "parentInfo", v23));
    v27 = sub_1002223BC(v25, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

    v29 = [_TtC8Freeform11CRLWPEditor alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v32 = -[CRLWPEditor initWithEditingCoordinator:enclosingShape:icc:](v29, "initWithEditingCoordinator:enclosingShape:icc:", v30, v28, v31);

  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)CRLWPShapeEditor;
    v33 = -[CRLShapeEditor nextEditorForSelection:withNewEditorStack:selectionPath:](&v36, "nextEditorForSelection:withNewEditorStack:selectionPath:", v8, v9, v10);
    v32 = (_TtC8Freeform11CRLWPEditor *)objc_claimAutoreleasedReturnValue(v33);
  }

  return v32;
}

- (NSArray)wpEditors
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _TtC8Freeform11CRLWPEditor *v15;
  void *v16;
  void *v17;
  _TtC8Freeform11CRLWPEditor *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableArray *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v23 = objc_opt_new(NSMutableArray);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = objc_opt_self(_TtC8Freeform12CRLBoardItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = [_TtC8Freeform11CRLWPEditor alloc];
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v18 = -[CRLWPEditor initWithEditingCoordinator:enclosingShape:icc:](v15, "initWithEditingCoordinator:enclosingShape:icc:", v16, v14, v17);

          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor storage](v18, "storage"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeForAllOf:](_TtC8Freeform12CRLTextRange, "textRangeForAllOf:", v19));
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPEditor textSelectionDelegate](v18, "textSelectionDelegate"));
            objc_msgSend(v21, "setSelectedTextRange:", v20);

            -[NSMutableArray addObject:](v23, "addObject:", v18);
          }

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return (NSArray *)v23;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v10;
  int64_t v11;
  objc_super v13;

  v6 = a4;
  if ("saveDefaultInsertionPreset:" == a3)
  {
    v10 = -[CRLWPShapeEditor p_canSaveDefaultInsertionPreset](self, "p_canSaveDefaultInsertionPreset");
    goto LABEL_32;
  }
  if ("alignTop:" == a3 || "alignBottom:" == a3 || "alignMiddle:" == a3 || "alignJustify:" == a3)
  {
    v10 = -[CRLShapeEditor anyInfoSupportsVerticalAlignment](self, "anyInfoSupportsVerticalAlignment");
    goto LABEL_32;
  }
  if ("toggleBoldface:" == a3
    || "toggleUnderline:" == a3
    || "toggleItalics:" == a3
    || "toggleStrikethrough:" == a3
    || "alignLeft:" == a3
    || "alignRight:" == a3
    || "alignCenter:" == a3
    || "alignJustified:" == a3
    || "decreaseFontSizeByOne:" == a3
    || "increaseFontSizeByOne:" == a3
    || "decreaseSize:" == a3
    || "increaseSize:" == a3)
  {
    v10 = -[CRLShapeEditor anyInfoSupportsTextInspection](self, "anyInfoSupportsTextInspection");
LABEL_32:
    if (v10)
      v11 = 1;
    else
      v11 = -1;
    goto LABEL_35;
  }
  if ("toggleShrinkToFit:" == a3
    && -[CRLShapeEditor anyInfoSupportsTextInspection](self, "anyInfoSupportsTextInspection")
    && -[CRLWPShapeEditor shouldAddAutosizeTextMenuItem](self, "shouldAddAutosizeTextMenuItem"))
  {
    v11 = 1;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLWPShapeEditor;
    v11 = -[CRLShapeEditor canPerformEditorAction:withSender:](&v13, "canPerformEditorAction:withSender:", a3, v6);
  }
LABEL_35:

  return v11;
}

- (BOOL)p_shapesAreDifferent
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  char *v27;
  BOOL v28;
  id obj;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  unsigned int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  const char *v46;
  _BYTE v47[128];

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = objc_opt_self(_TtC8Freeform12CRLBoardItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4));

  obj = v5;
  v32 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
  if (v32)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v31 = *(_QWORD *)v34;
    while (2)
    {
      v11 = 0;
      v12 = v8;
      v13 = v9;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v34 != v31)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v11);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v6);
        v17 = sub_100221D0C(v16, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (!v18)
        {
          v19 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125F138);
          v20 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67110146;
            v38 = v19;
            v39 = 2082;
            v40 = "-[CRLWPShapeEditor p_shapesAreDifferent]";
            v41 = 2082;
            v42 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m";
            v43 = 1024;
            v44 = 93;
            v45 = 2082;
            v46 = "shapeItem";
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10125F158);
          v21 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v26 = v21;
            v27 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = 67109378;
            v38 = v19;
            v39 = 2114;
            v40 = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeEditor p_shapesAreDifferent]"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v22, v23, 93, 0, "invalid nil value for '%{public}s'", "shapeItem");

        }
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v18));
        v10 = +[CRLShapeEditor infosAreLines:](CRLShapeEditor, "infosAreLines:", v24);
        v9 = +[CRLShapeEditor infosAreStickyNotes:](CRLShapeEditor, "infosAreStickyNotes:", v24);
        v25 = objc_msgSend(v18, "isAutogrowingTextBox");
        v8 = v25;
        if ((v7 & 1) != 0 && (((v14 ^ v10) & 1) != 0 || ((v13 ^ v9) & 1) != 0 || ((v12 ^ v25) & 1) != 0))
        {

          v28 = 1;
          goto LABEL_24;
        }

        v11 = (char *)v11 + 1;
        v7 = 1;
        v12 = v8;
        v13 = v9;
        v14 = v10;
      }
      while (v32 != v11);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
      if (v32)
        continue;
      break;
    }
  }
  v28 = 0;
LABEL_24:

  return v28;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  double v14;
  objc_class *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
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
  objc_super v42;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CRLWPShapeEditor;
  -[CRLShapeEditor addMiniFormatterElementsToArray:atPoint:](&v42, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v9 = -[CRLWPShapeEditor p_shapesAreDifferent](self, "p_shapesAreDifferent");

    if ((v9 & 1) != 0)
      goto LABEL_14;
  }
  else
  {

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (+[CRLShapeEditor infosAreStickyNotes:](CRLShapeEditor, "infosAreStickyNotes:", v10))
  {
LABEL_13:

    goto LABEL_14;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v12 = +[CRLShapeEditor infosAreLines:](CRLShapeEditor, "infosAreLines:", v11);

  if ((v12 & 1) == 0)
  {
    *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v13).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "anyObject"));
    v19 = sub_1002223BC(v16, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v19);

    v20 = objc_msgSend(v10, "isAutogrowingTextBox");
    v21 = v20;
    if (v20)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Set Text Color"), 0, 0));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("circle.fill")));
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v23, v24, 2, 0x80000));

      objc_msgSend(v25, "setTag:", 4);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Choose a text color"), 0, 0));
      objc_msgSend(v25, "setToolTip:", v27);

      objc_msgSend(v7, "addObject:", v25);
      v28 = 0x20000;
    }
    else
    {
      v28 = 16;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("Modify Text"), 0, 0));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("textformat")));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v30, v31, 2, v28));

    objc_msgSend(v32, "setTag:", 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v34 = v33;
    if ((v21 & 1) != 0)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Format text, change alignment, or choose a list style"), 0, 0));
      objc_msgSend(v32, "setToolTip:", v35);

      objc_msgSend(v7, "addObject:", v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("Set Font Size"), 0, 0));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v37, 0, 2, 0x100000));

      objc_msgSend(v38, "setTag:", 5);
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Choose a font size"), 0, 0));
      objc_msgSend(v38, "setToolTip:", v40);

      objc_msgSend(v7, "addObject:", v38);
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Format text"), 0, 0));
      objc_msgSend(v32, "setToolTip:", v41);

      objc_msgSend(v7, "addObject:", v32);
    }

    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)p_canSaveDefaultInsertionPreset
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "count") == (id)1;

  return v3;
}

- (void)saveDefaultInsertionPreset:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  _TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset *v20;
  void *v21;
  void *v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", a3));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)1)
  {
    v7 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F178);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E35D54(v7, v8);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125F198);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPShapeEditor saveDefaultInsertionPreset:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLWPShapeEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 166, 0, "Only should save default style with a single object selected!");

  }
  *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v6).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "anyObject"));
  v17 = sub_1002223BC(v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
  {
    if ((objc_msgSend(v18, "isAutogrowingTextBox") & 1) != 0)
    {
      v19 = 1;
    }
    else if (objc_msgSend(v18, "pathIsOpen"))
    {
      v19 = 2;
    }
    else
    {
      v19 = 0;
    }
    v20 = -[CRLCommandSetDefaultShapeInsertionPreset initWithShapeItem:shapeType:]([_TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset alloc], "initWithShapeItem:shapeType:", v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "commandController"));
    objc_msgSend(v22, "enqueueCommand:", v20);

  }
}

- (void)increaseSize:(id)a3
{
  sub_1007F8E04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1007FAC94);
}

- (void)decreaseSize:(id)a3
{
  sub_1007F8E04(self, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1007FAC74);
}

- (void)toggleBoldface:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.toggleBoldface(_:));
}

- (void)toggleItalics:(id)a3
{
  sub_10053C87C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CRLWPShapeEditor.toggleItalics(_:));
}

- (void)toggleUnderline:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.toggleUnderline(_:));
}

- (void)toggleStrikethrough:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.toggleStrikethrough(_:));
}

- (void)alignLeft:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.alignLeft(_:));
}

- (void)alignRight:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.alignRight(_:));
}

- (void)alignCenter:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.alignCenter(_:));
}

- (void)alignJustified:(id)a3
{
  sub_100714BDC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id, __n128))CRLWPShapeEditor.alignJustified(_:));
}

- (void)decreaseFontSizeByOne:(id)a3
{
  sub_10053C87C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CRLWPShapeEditor.decreaseFontSizeByOne(_:));
}

- (void)increaseFontSizeByOne:(id)a3
{
  sub_10053C87C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))CRLWPShapeEditor.increaseFontSizeByOne(_:));
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  CRLWPShapeEditor *v6;

  v5 = a3;
  v6 = self;
  CRLWPShapeEditor.addContextualMenuElements(to:at:)(v5);

}

- (BOOL)shouldAddAutosizeTextMenuItem
{
  CRLWPShapeEditor *v2;
  char v3;

  v2 = self;
  v3 = sub_100DCCCC8();

  return v3 & 1;
}

- (void)toggleShrinkToFit:(id)a3
{
  CRLWPShapeEditor *v5;
  uint64_t v6;
  double v7;
  CRLWPShapeEditor *v8;
  uint64_t KeyPath;
  char v10;
  char v11;
  __int128 v12;
  __int128 v13;

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v12, v6);
    *(_QWORD *)&v7 = swift_unknownObjectRelease(a3).n128_u64[0];
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v8 = self;
  }
  KeyPath = swift_getKeyPath("p7T", v7, v12, v13);
  sub_100DCB5E8(KeyPath);
  v11 = v10;
  swift_release(KeyPath);
  if (v11 != 2)
    sub_1007FA8AC((v11 & 1) == 0);

  sub_1004CB800((uint64_t)&v12, &qword_1013E0230);
}

- (CRLPlatformControlState)shrinkToFitControlState
{
  CRLWPShapeEditor *v2;
  id v3;

  v2 = self;
  v3 = sub_100DCCFD8();

  return (CRLPlatformControlState *)v3;
}

@end
