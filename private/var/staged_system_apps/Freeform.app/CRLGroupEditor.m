@implementation CRLGroupEditor

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  int v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v11);
  v13 = sub_100221D0C(v12, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (!v14)
  {
    v34.receiver = self;
    v34.super_class = (Class)CRLGroupEditor;
    v27 = -[CRLBoardItemEditor nextEditorForSelection:withNewEditorStack:selectionPath:](&v34, "nextEditorForSelection:withNewEditorStack:selectionPath:", v8, v9, v10);
    v25 = (id)objc_claimAutoreleasedReturnValue(v27);
    goto LABEL_16;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "canvasEditor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasEditorHelper"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boardItems"));
  v19 = objc_msgSend(v17, "editorClassForInfos:", v18);

  if (!v19)
  {
LABEL_15:
    v25 = 0;
    goto LABEL_16;
  }
  *(_QWORD *)&v21 = objc_opt_class(CRLBoardItemEditor, v20).n128_u64[0];
  if (!objc_msgSend(v19, "isSubclassOfClass:", v22, v21))
  {
    v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260D08);
    v29 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38C18((uint64_t)v8, v28, v29);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260D28);
    v30 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor nextEditorForSelection:withNewEditorStack:selectionPath:]"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 46, 0, "Unknown editor class for selection %@", v8);

    goto LABEL_15;
  }
  v23 = objc_alloc((Class)v19);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v25 = objc_msgSend(v23, "initWithInteractiveCanvasController:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boardItems"));
  objc_msgSend(v25, "setBoardItems:", v26);

LABEL_16:
  return v25;
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v24;

  v8 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLGroupEditor;
  v9 = a4;
  -[CRLBoardItemEditor selectionDidChangeFromSelection:toSelection:withFlags:](&v24, "selectionDidChangeFromSelection:toSelection:withFlags:", v8, v9, a5);
  objc_opt_class(_TtC8Freeform17CRLGroupSelection, v10);
  LOBYTE(a5) = objc_opt_isKindOfClass(v9, v11);

  if ((a5 & 1) != 0
    || (objc_opt_class(_TtC8Freeform17CRLGroupSelection, v12), (objc_opt_isKindOfClass(v8, v13) & 1) != 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupEditor groupItems](self, "groupItems", v24.receiver, v24.super_class));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "anyObject"));

    *(_QWORD *)&v17 = objc_opt_class(CRLGroupRep, v16).n128_u64[0];
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v17));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForInfo:", v15));
    v22 = sub_100221D0C(v19, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    objc_msgSend(v23, "invalidateKnobs");
  }

}

- (NSSet)groupItems
{
  double v3;
  uint64_t v4;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLGroupItem, a2).n128_u64[0];
  return (NSSet *)-[CRLBoardItemEditor boardItemsOfClass:](self, "boardItemsOfClass:", v4, v3);
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSString *v17;
  void *v18;
  unsigned __int8 v19;
  int64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  objc_super v30;

  v6 = a4;
  v7 = -[CRLGroupEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet crl_setWithSelectors:](NSSet, "crl_setWithSelectors:", "group:", 0));
  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v9).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionForEditor:", self));
  v15 = sub_100221D0C(v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    if (objc_msgSend(v16, "isCrossContainerSelection"))
    {
      v17 = NSStringFromSelector(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = objc_msgSend(v8, "containsObject:", v18);

      if ((v19 & 1) != 0)
      {
        v20 = -1;
        goto LABEL_31;
      }
    }
  }
  if ("insertNewline:" == a3)
  {
    if ((v7 & 1) != 0)
      goto LABEL_26;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    if (objc_msgSend(v22, "count") == (id)1)
      v20 = 1;
    else
      v20 = -1;

  }
  else
  {
    if ("paste:" != a3 && "pasteAsPlainText:" != a3 && "pasteValues:" != a3)
    {
      if ("duplicate:" == a3)
        v21 = v7;
      else
        v21 = 0;
      if (v21 == 1
        && -[CRLGroupEditor canPasteIntoCurrentlySelectedGroups](self, "canPasteIntoCurrentlySelectedGroups"))
      {
        if (-[CRLGroupEditor p_canDuplicateWithSender:](self, "p_canDuplicateWithSender:", v6))
          v20 = 1;
        else
          v20 = -1;
        goto LABEL_31;
      }
LABEL_26:
      v30.receiver = self;
      v30.super_class = (Class)CRLGroupEditor;
      v20 = -[CRLBoardItemEditor canPerformEditorAction:withSender:](&v30, "canPerformEditorAction:withSender:", a3, v6);
      goto LABEL_31;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "canvasEditor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pasteboardController"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "ingestibleItemSourceForPasteboard:", v26));

    v28 = -[CRLGroupEditor editorResponseForCanPasteContentsOfItemSource:](self, "editorResponseForCanPasteContentsOfItemSource:", v27);
    if (v28 != 1)
    {
      v20 = v28;

      if (v20)
        goto LABEL_31;
      goto LABEL_26;
    }
    if (-[CRLGroupEditor p_shouldAllowKeyCommands](self, "p_shouldAllowKeyCommands"))
    {
      v20 = 1;
    }
    else if (+[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v6))
    {
      v20 = -1;
    }
    else
    {
      v20 = 1;
    }

  }
LABEL_31:

  return v20;
}

- (BOOL)canPasteWithPasteboard:(id)a3 sender:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  if (-[CRLGroupEditor p_shouldAllowKeyCommands](self, "p_shouldAllowKeyCommands")
    || !+[CRLCanvasEditor physicalKeyboardIsSender:](CRLCanvasEditor, "physicalKeyboardIsSender:", v7))
  {
    v8 = -[CRLGroupEditor canPasteWithPasteboard:](self, "canPasteWithPasteboard:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)pasteWithPasteboard:(id)a3 sender:(id)a4
{
  -[CRLGroupEditor pasteWithPasteboard:completionHandler:](self, "pasteWithPasteboard:completionHandler:", a3, &stru_101260D48);
}

- (BOOL)p_currentlyEditingInGroup
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v3, "selectionForEditor:", self));

  objc_opt_class(_TtC8Freeform17CRLGroupSelection, v5);
  LOBYTE(v3) = objc_opt_isKindOfClass(v4, v6);

  return v3 & 1;
}

- (void)insertNewline:(id)a3
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupEditor groupItems](self, "groupItems", a3));
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "childItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasEditor spatialInfoComparator](CRLCanvasEditor, "spatialInfoComparator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sortedArrayUsingComparator:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  v17 = sub_100221DDC(v10, 1, v11, v12, v13, v14, v15, v16, (uint64_t)&OBJC_PROTOCOL___CRLCanvasElementInfo);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v18)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v18));
  else
    v19 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfos:", v19));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  objc_msgSend(v21, "setSelectionPath:", v20);

}

- (BOOL)p_shouldAllowKeyCommands
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = objc_msgSend(v2, "shouldAllowKeyCommands");

  return v3;
}

- (BOOL)canPasteIntoCurrentlySelectedGroups
{
  return 1;
}

- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  v4 = a3;
  if (-[CRLGroupEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup")
    && -[CRLGroupEditor canPasteIntoCurrentlySelectedGroups](self, "canPasteIntoCurrentlySelectedGroups"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionModelTranslator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerToInsertIntoForSelectionPath:", v8));

    if (v9
      && (objc_opt_class(_TtC8Freeform12CRLGroupItem, v10), (objc_opt_isKindOfClass(v9, v11) & 1) != 0))
    {
      if (objc_msgSend(v4, "canProduceBoardItems"))
        v12 = 1;
      else
        v12 = -1;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)p_canDuplicateWithSender:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditorHelper"));
  v8 = objc_msgSend(v7, "canvasEditorCanPerformDuplicateAction:withSender:", "duplicate:", v4);

  return v8 != 0;
}

- (BOOL)canPasteWithPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pasteboardController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ingestibleItemSourceForPasteboard:", v4));
  LOBYTE(self) = (id)-[CRLGroupEditor editorResponseForCanPasteContentsOfItemSource:](self, "editorResponseForCanPasteContentsOfItemSource:", v8) == (id)1;

  return (char)self;
}

- (void)paste:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard", a3));
  -[CRLGroupEditor pasteWithPasteboard:completionHandler:](self, "pasteWithPasteboard:completionHandler:", v4, &stru_101260D68);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
  objc_msgSend(v5, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (void)pasteAsPlainText:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard", a3));
  -[CRLGroupEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:](self, "pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:", v4, 0x7FFFFFFFFFFFFFFFLL, 1, 0, &stru_101260D88);

}

- (void)pasteValues:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard", a3));
  -[CRLGroupEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:](self, "pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:", v4, 0x7FFFFFFFFFFFFFFFLL, 1, 1, &stru_101260DA8);

}

- (void)pasteWithPasteboard:(id)a3 completionHandler:(id)a4
{
  -[CRLGroupEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:](self, "pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:", a3, 0x7FFFFFFFFFFFFFFFLL, 0, 0, a4);
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 completionHandler:(id)a5
{
  -[CRLGroupEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:](self, "pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:", a3, a4, 0, 0, a5);
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  unint64_t v20;
  BOOL v21;

  v11 = a3;
  v12 = a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editingCoordinator"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10047EDD8;
  v17[3] = &unk_101260E38;
  v17[4] = self;
  v18 = v11;
  v21 = a5;
  v19 = v12;
  v20 = a4;
  v15 = v12;
  v16 = v11;
  objc_msgSend(v14, "canPerformUserActionUsingBlock:", v17);

}

- (void)p_pasteBoardItems:(id)a3 inGroup:(id)a4 atIndex:(unint64_t)a5 forceMatchStyle:(BOOL)a6 isCrossDocument:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  _TtC8Freeform26CRLCommandInsertBoardItems *v30;
  CRLCanvasCommandSelectionBehavior *v31;
  void *v32;
  CRLCanvasCommandSelectionBehavior *v33;
  unint64_t v34;
  id v35;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext nonInteractiveInsertionContext](CRLInsertionContext, "nonInteractiveInsertionContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "commandController"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasEditor"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasEditorHelper"));
  v19 = objc_msgSend(v18, "canInsertBoardItems:intoGroup:", v11, v12);

  if (v19)
  {
    v34 = a5;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasEditorHelper"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "selectionPath"));
    v35 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "commandForReplacingImagePlaceholderInSelection:withBoardItems:isCrossDocument:withSender:outSelectionBehavior:", v22, v11, v7, 0, &v35));
    v24 = v35;

    if (v23)
    {
      objc_msgSend(v15, "enqueueCommand:withSelectionBehavior:", v23, v24);
    }
    else if (v12)
    {
      if (v34 == 0x7FFFFFFFFFFFFFFFLL
        || (v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "childInfos")),
            v26 = objc_msgSend(v25, "count"),
            v25,
            v27 = (id)v34,
            (unint64_t)v26 < v34))
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "childInfos"));
        v29 = objc_msgSend(v28, "count");

        v27 = v29;
      }
      v30 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:]([_TtC8Freeform26CRLCommandInsertBoardItems alloc], "initWithParentContainer:boardItems:index:", v12, v11, v27);
      v31 = [CRLCanvasCommandSelectionBehavior alloc];
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));
      v33 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v31, "initWithCanvasEditor:type:constructedInfos:", v17, 0, v32);

      objc_msgSend(v15, "enqueueCommand:withSelectionBehavior:", v30, v33);
    }
    else
    {
      objc_msgSend(v17, "insertBoardItems:withInsertionContext:postProcessBlock:", v11, v13, &stru_101260E58);
    }

  }
  else
  {
    objc_msgSend(v17, "prepareGeometryForInsertingBoardItems:withInsertionContext:", v11, v13);
    objc_msgSend(v17, "insertBoardItems:withInsertionContext:postProcessBlock:", v11, v13, &stru_101260E78);
  }

}

- (id)pasteNativeInfosFromPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
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
  id v27;
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
  void *v38;
  CRLGroupEditor *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  unsigned int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  const char *v58;
  _BYTE v59[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerToInsertIntoForSelectionPath:", v9));

  objc_opt_class(_TtC8Freeform12CRLGroupItem, v11);
  v13 = sub_100221D0C(v12, v10);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)v14;
  if (v14)
  {
    v40 = self;
    v42 = (void *)v14;
    v43 = v10;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pasteboardController"));

    v41 = v17;
    v44 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "providersForBoardItemsFromPasteboard:", v4));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        v22 = v18;
        v23 = 0;
        do
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(v22);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editingCoordinator"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "boardItemFactory"));
          v27 = objc_msgSend(v24, "newBoardItemWithFactory:bakedSize:", v26, 0);

          if (v27)
          {
            objc_msgSend(v5, "addObject:", v27);
          }
          else
          {
            v28 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101260ED8);
            v29 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v50 = v28;
              v51 = 2082;
              v52 = "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]";
              v53 = 2082;
              v54 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m";
              v55 = 1024;
              v56 = 361;
              v57 = 2082;
              v58 = "boardItem";
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_101260EF8);
            v30 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v33 = v30;
              v34 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v50 = v28;
              v51 = 2114;
              v52 = v34;
              _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 361, 0, "invalid nil value for '%{public}s'", "boardItem");

          }
          v23 = (char *)v23 + 1;
        }
        while (v20 != v23);
        v18 = v22;
        v20 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v59, 16);
      }
      while (v20);
    }
    if (objc_msgSend(v5, "count"))
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "canvasEditorHelper"));
      v4 = v44;
      v15 = v42;
      objc_msgSend(v36, "prepareGeometryForPastingBoardItems:fromPasteboard:intoContainer:useOriginalPositions:", v5, v44, v42, 1);

      -[CRLGroupEditor p_pasteBoardItems:inGroup:atIndex:forceMatchStyle:isCrossDocument:](v40, "p_pasteBoardItems:inGroup:atIndex:forceMatchStyle:isCrossDocument:", v5, v42, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
      v10 = v43;
    }
    else
    {
      v10 = v43;
      v4 = v44;
      v15 = v42;
    }
    v38 = v41;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260E98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E38D64();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101260EB8);
    v37 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLGroupEditor pasteNativeInfosFromPasteboard:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLGroupEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v38, v18, 355, 0, "invalid nil value for '%{public}s'", "groupToInsertInto");
  }

  return v5;
}

- (void)duplicate:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingCoordinator"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10047FF60;
  v6[3] = &unk_10122F780;
  v6[4] = self;
  objc_msgSend(v5, "canPerformUserActionUsingBlock:", v6);

}

@end
