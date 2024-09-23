@implementation CRLWPRep

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
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
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
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  LOBYTE(a3) = objc_msgSend(v10, "handleDragOperation:withDragInfo:atUnscaledPoint:", a3, v9, x, y);

  return a3;
}

- (void)updateDragAndDropUIForPoint:(CGPoint)a3 dragInfo:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  objc_super v68;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  objc_msgSend(v8, "adjustedUnscaledPoint:", x, y);
  v10 = v9;
  v12 = v11;

  v68.receiver = self;
  v68.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep updateDragAndDropUIForPoint:dragInfo:](&v68, "updateDragAndDropUIForPoint:dragInfo:", v7, v10, v12);
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v10, v12);
  v14 = v13;
  v16 = v15;
  -[CRLWPRep hideCaretLayer](self, "hideCaretLayer");
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sourceSelectionPathForDragInfo:", v7));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "modelsForSelectionPath:", v18));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectsPassingTest:", &stru_101247720));
  *(_QWORD *)&v23 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v22).n128_u64[0];
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crl_onlyObject", v23));
  v27 = sub_100221D0C(v25, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "textStorage"));
  if (v29)
  {
    if (!objc_msgSend(v20, "count"))
    {
      v66 = v18;
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247740);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E10EEC();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101247760);
      v30 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE8358(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep(DragAdditions) updateDragAndDropUIForPoint:dragInfo:]"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep+DragAdditions.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 243, 0, "If %s found model objects, one should be a storage.", "-[CRLWPRep(DragAdditions) updateDragAndDropUIForPoint:dragInfo:]");

      v18 = v66;
    }
    v33 = objc_msgSend(v29, "changeCount");
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
    v35 = objc_msgSend(v34, "sourceChangeCountForDragInfo:", v7);

    if (v33 != v35)
    {

      v29 = 0;
    }
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  objc_msgSend(v37, "setDragIsStorageLocal:", v29 == v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  v39 = objc_msgSend(v38, "dragIsStorageLocal");

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "sourceSelectionForDragInfo:", v7));

    if (v41
      && -[CRLWPRep isDragPoint:inSelection:includeEndpoints:](self, "isDragPoint:inSelection:includeEndpoints:", v41, 0, v14, v16))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
      v43 = objc_msgSend(v42, "dragIsStorageLocal");

    }
    else
    {
      v43 = 0;
    }
  }
  else
  {
    v43 = 0;
    v41 = 0;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropCaretLayer](self, "dragAndDropCaretLayer"));
  objc_msgSend(v44, "setHidden:", v43);

  if ((_DWORD)v43)
  {
    -[CRLWPRep hideDragAndDropUI](self, "hideDragAndDropUI");
  }
  else
  {
    -[CRLWPRep setDragOperationInProgress:](self, "setDragOperationInProgress:", 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
    objc_msgSend(v45, "dragAndDropNaturalPoint");
    v47 = v46;
    v49 = v48;

    if (v47 != v14 || v49 != v16)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
      objc_msgSend(v50, "setDragAndDropNaturalPoint:", v14, v16);

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v51, "invalidateOverlayLayersForRep:", self);

    }
  }
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  v53 = objc_msgSend(v52, "dragIsStorageLocal");

  if (v53)
  {
    v67 = objc_msgSend(v41, "range");
    v55 = v54;
    *(_QWORD *)&v56 = objc_opt_class(self, v54).n128_u64[0];
    v58 = v41;
    v59 = v29;
    v60 = v7;
    v61 = v20;
    v62 = v28;
    v63 = v21;
    v64 = v18;
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "unfocusedHighlightColorForDarkMode:", 0, v56));
    -[CRLWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v67, v55, objc_msgSend(v65, "CGColor"), 0);

    v18 = v64;
    v21 = v63;
    v28 = v62;
    v20 = v61;
    v7 = v60;
    v29 = v59;
    v41 = v58;
  }

}

- (void)hideDragAndDropUI
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[CRLWPRep setDragOperationInProgress:](self, "setDragOperationInProgress:", 0);
  -[CRLWPRep clearSecondaryHighlight](self, "clearSecondaryHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  objc_msgSend(v3, "setDragAndDropNaturalPoint:", NAN, NAN);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropCaretLayer](self, "dragAndDropCaretLayer"));
  objc_msgSend(v4, "setDelegate:", 0);

  -[CRLWPRep setDragAndDropCaretLayer:](self, "setDragAndDropCaretLayer:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropTopicLayer](self, "dragAndDropTopicLayer"));
  objc_msgSend(v5, "setDelegate:", 0);

  -[CRLWPRep setDragAndDropTopicLayer:](self, "setDragAndDropTopicLayer:", 0);
  -[CRLWPRep setDragAndDropTopicIndentLayer:](self, "setDragAndDropTopicIndentLayer:", 0);
  v6.receiver = self;
  v6.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep hideDragAndDropUI](&v6, "hideDragAndDropUI");
}

- (id)dragItemsForBeginningDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  unsigned int v8;
  _TtC8Freeform23CRLWPEditMenuController *v9;
  void *v10;
  _TtC8Freeform23CRLWPEditMenuController *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));

  if (!v6)
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLWPRep;
    v14 = -[CRLCanvasRep dragItemsForBeginningDragAtPoint:](&v16, "dragItemsForBeginningDragAtPoint:", x, y);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    return v13;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  if (!objc_msgSend(v7, "isRange"))
  {

    goto LABEL_7;
  }
  v8 = -[CRLWPRep isPointInSelectedArea:](self, "isPointInSelectedArea:", x, y);

  if (!v8)
  {
LABEL_7:
    v13 = 0;
    return v13;
  }
  v9 = [_TtC8Freeform23CRLWPEditMenuController alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = -[CRLWPEditMenuController initWithICC:](v9, "initWithICC:", v10);
  -[CRLWPEditMenuController hide](v11, "hide");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_dragItemsForBeginningDragWithSelection:inlineRepBeingDragged:](self, "p_dragItemsForBeginningDragWithSelection:inlineRepBeingDragged:", v12, 0));

  return v13;
}

- (id)p_dragItemsForBeginningDragWithSelection:(id)a3 inlineRepBeingDragged:(id)a4
{
  id v5;
  void *v6;
  CRLItemProviderItemWriter *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  CRLWPiOSTextDraggingContext *v29;
  void *v30;
  CRLWPiOSTextDraggingContext *v31;
  CGSize size;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  UIBezierPath *v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  CRLiOSCanvasDragItem *v61;
  CRLWPiOSTextDraggingContext *v62;
  id v63;
  id v64;
  CRLiOSCanvasDragItem *v65;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  void *v76;
  void *v77;
  id v78;
  CRLWPiOSTextDraggingContext *v79;
  CGPoint origin;
  CGSize v81;
  CRLiOSCanvasDragItem *v82;
  CGRect v83;
  CGRect v84;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = objc_alloc_init(CRLItemProviderItemWriter);
  v14 = sub_100221DDC(v7, 1, v8, v9, v10, v11, v12, v13, (uint64_t)&OBJC_PROTOCOL___CRLWPIngestibleItemWriting);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_textEditorForStorage:](self, "p_textEditorForStorage:", v16));

  v73 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "editorHelper"));
  v19 = objc_msgSend(v18, "hasWhitespaceBoundedWordAtSelection:", v5);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pasteboardController"));
  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "itemProviderWithStorage:selection:boardItems:styleProvider:inIsSmart:pasteboardController:", v20, v5, &__NSArray0__struct, 0, v19, v22));

  if (v23)
  {
    v69 = (void *)v23;
    v72 = v15;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "selectionPathForSelection:onStorage:", v5, v25));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectionPath"));
    v29 = [CRLWPiOSTextDraggingContext alloc];
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v68 = v27;
    v70 = (void *)v28;
    v71 = (void *)v26;
    v31 = -[CRLWPiOSTextDraggingContext initWithEditorController:sourceSelectionPath:changeCount:reverseSelectionPath:](v29, "initWithEditorController:sourceSelectionPath:changeCount:reverseSelectionPath:", v27, v26, objc_msgSend(v30, "changeCount"), v28);

    size = CGRectNull.size;
    origin = CGRectNull.origin;
    v81 = size;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v33, "viewScale");
    v35 = -12.0 / v34;

    LOBYTE(v67) = 1;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:suppressChildReps:drawBackground:inset:](self, "textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:suppressChildReps:drawBackground:inset:", v5, &origin, 1, 0, 1, 0, v35, v67));
    -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", origin, v81);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep backgroundColorForDragPreviewOfSelection:](self, "backgroundColorForDragPreviewOfSelection:", v5));
    v46 = objc_alloc_init((Class)UIView);
    v84.origin.x = CGRectNull.origin.x;
    v84.origin.y = CGRectNull.origin.y;
    v84.size.width = CGRectNull.size.width;
    v84.size.height = CGRectNull.size.height;
    v83.origin.x = v38;
    v83.origin.y = v40;
    v83.size.width = v42;
    v83.size.height = v44;
    if (CGRectEqualToRect(v83, v84))
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(v6, "convertUnscaledToBoundsRect:", v38, v40, v42, v44);
      objc_msgSend(v46, "setFrame:");
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v55, "viewScale");

      v56 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", sub_10005FDDC());
      v47 = (void *)objc_claimAutoreleasedReturnValue(v56);
    }
    v57 = objc_msgSend(v36, "CGImage");
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    objc_msgSend(v58, "setContents:", v57);

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    LODWORD(v60) = 1062836634;
    objc_msgSend(v59, "setOpacity:", v60);

    v61 = [CRLiOSCanvasDragItem alloc];
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_100244EB4;
    v74[3] = &unk_1012477C8;
    v75 = v47;
    v76 = v45;
    v77 = v6;
    v78 = v46;
    v62 = v31;
    v79 = v31;
    v63 = v46;
    v64 = v47;
    v54 = v69;
    v65 = -[CRLiOSCanvasDragItem initWithItemProvider:previewGeneratingBlock:](v61, "initWithItemProvider:previewGeneratingBlock:", v69, v74);
    -[CRLiOSCanvasDragItem setAllowsMoveOperation:](v65, "setAllowsMoveOperation:", 1);
    -[CRLiOSCanvasDragItem setSourceObject:](v65, "setSourceObject:", v73);
    v82 = v65;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));

    v48 = v73;
    v52 = v71;
    v15 = v72;
    v51 = v68;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101247780);
    v48 = v73;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E10F84();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012477A0);
    v49 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE8358(v49);
    v50 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep(DragAdditions) p_dragItemsForBeginningDragWithSelection:inlineRepBeingDragged:]"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep+DragAdditions.m"));
    v52 = (void *)v50;
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 395, 0, "invalid nil value for '%{public}s'", "itemProvider");
    v53 = 0;
    v54 = 0;
  }

  return v53;
}

- (id)dragItemsForBeginningDragOfChildRep:(id)a3
{
  return 0;
}

- (id)p_styleProvider
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPStorageStyleProvider styleProviderForStorage:](CRLWPStorageStyleProvider, "styleProviderForStorage:", v2));

  return v3;
}

- (id)p_textEditorForStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100245104;
  v17 = sub_100245114;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10024511C;
  v10[3] = &unk_101230FD0;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateEditorsOnStackUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

+ (id)focusedHighlightColorForDarkMode:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id *v5;
  id v6;

  v3 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (id *)&unk_1014155A8;
  if (!v3)
    v5 = (id *)&qword_1014155A0;
  v6 = *v5;
  objc_sync_exit(v4);

  return v6;
}

+ (id)unfocusedHighlightColorForDarkMode:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id *v5;
  id v6;

  v3 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = (id *)&qword_1014155B8;
  if (!v3)
    v5 = (id *)&unk_1014155B0;
  v6 = *v5;
  objc_sync_exit(v4);

  return v6;
}

- (void)setSuppressSelectionHighlight:(BOOL)a3
{
  if (self->_suppressSelectionHighlight != a3)
  {
    self->_suppressSelectionHighlight = a3;
    if (a3)
      -[CRLWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers");
  }
}

- (BOOL)p_shouldDisplaySelectionControls
{
  return !-[CRLWPRep suppressSelectionControls](self, "suppressSelectionControls");
}

- (BOOL)shouldShowKnobs
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPRep;
  v3 = -[CRLCanvasRep shouldShowKnobs](&v5, "shouldShowKnobs");
  if (v3)
    LOBYTE(v3) = -[CRLWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls");
  return v3;
}

- (CRLContainerInfo)containerInfo
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info"));
  objc_opt_class(NSObject, v3);
  v10 = sub_10022209C(v2, v4, 1, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return (CRLContainerInfo *)v11;
}

- (void)setDragRange:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger length;

  location = a3.location;
  length = a3.length;
  if (!a3.length)
  {
    location = self->_dragRange.location;
    length = self->_dragRange.length;
  }
  self->_dragRange = a3;
  -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", location, length);
}

- (void)setDropSelection:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  CAShapeLayer *dragAndDropCaretLayer;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dropSelection);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_dropSelection, obj);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v5, "invalidateOverlayLayersForRep:", self);

    v6 = objc_loadWeakRetained((id *)&self->_dropSelection);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v7, "layoutIfNeeded");

      -[CAShapeLayer setHidden:](self->_dragAndDropCaretLayer, "setHidden:", 0);
    }
    else
    {
      -[CAShapeLayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);
      dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
      self->_dragAndDropCaretLayer = 0;

      self->_dragAndDropCaretLayerIsForCaret = 0;
    }
  }

}

- (CRLWPDragAndDropHelper)dragAndDropHelper
{
  CRLWPDragAndDropHelper *dragAndDropHelper;
  CRLWPDragAndDropHelper *v4;
  CRLWPDragAndDropHelper *v5;

  dragAndDropHelper = self->_dragAndDropHelper;
  if (!dragAndDropHelper)
  {
    v4 = -[CRLWPDragAndDropHelper initWithOwningRep:]([CRLWPDragAndDropHelper alloc], "initWithOwningRep:", self);
    v5 = self->_dragAndDropHelper;
    self->_dragAndDropHelper = v4;

    dragAndDropHelper = self->_dragAndDropHelper;
  }
  return dragAndDropHelper;
}

+ (void)initialize
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_opt_class(CRLWPRep, a2);
  if (v3 == a1)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.33, 0.65, 0.25));
    v5 = (void *)qword_1014155A0;
    qword_1014155A0 = v4;

    objc_storeStrong(&qword_1014155A8, (id)qword_1014155A0);
    v6 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.1786, 0.25));
    v7 = (void *)qword_1014155B8;
    qword_1014155B8 = v6;

    objc_storeStrong(&qword_1014155B0, (id)qword_1014155B8);
    v8 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.22, 0.22, 0.22, 0.11));
    v9 = (void *)qword_1014155C0;
    qword_1014155C0 = v8;

  }
}

- (CRLWPRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char *v9;
  objc_class *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  CRLWPRepCaretController *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  uint64_t v23;
  void *v24;
  objc_super v26;

  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)CRLWPRep;
  v9 = -[CRLCanvasRep initWithLayout:canvas:](&v26, "initWithLayout:canvas:", v6, v7);
  if (v9)
  {
    objc_opt_class(CRLCanvasLayout, v8);
    v16 = sub_1002220C8(v6, v10, 1, v11, v12, v13, v14, v15, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
    if (v17)
    {
      objc_msgSend(v9, "p_registerNotifications");
      v9[557] = 1;
      *((_OWORD *)v9 + 22) = xmmword_100EEE418;
      *(_OWORD *)(v9 + 376) = xmmword_100EEE418;
      v9[418] = 1;
      v18 = -[CRLWPRepCaretController initWithDelegate:]([CRLWPRepCaretController alloc], "initWithDelegate:", v9);
      v19 = (void *)*((_QWORD *)v9 + 66);
      *((_QWORD *)v9 + 66) = v18;

      v20 = objc_claimAutoreleasedReturnValue(+[CRLWPRepHelper forCurrentPlatform:](_TtC8Freeform14CRLWPRepHelper, "forCurrentPlatform:", v9));
      v21 = (void *)*((_QWORD *)v9 + 67);
      *((_QWORD *)v9 + 67) = v20;

      v22 = objc_msgSend(v9, "p_isRedesignedTextCursorEnabled");
      v9[321] = v22;
      v9[369] = v22;
      objc_msgSend(v9, "setIbeamLength:", 20.0);
      v23 = objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v24 = (void *)*((_QWORD *)v9 + 70);
      *((_QWORD *)v9 + 70) = v23;

    }
  }

  return (CRLWPRep *)v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPRep p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep dealloc](&v3, "dealloc");
}

- (void)setParentRep:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep setParentRep:](&v19, "setParentRep:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v7 = objc_msgSend(v6, "isCanvasInteractive");

    if (v7)
    {
      *(_QWORD *)&v9 = objc_opt_class(CRLWPSearchReference, v8).n128_u64[0];
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", v9));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryFindResultSearchReference"));
      v14 = sub_100221D0C(v11, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = objc_msgSend(v15, "copy");

      if (-[CRLWPRep p_doesRepIntersectSearchReference:](self, "p_doesRepIntersectSearchReference:", v16))
        -[CRLWPRep p_setPrimaryFindResultSearchReference:](self, "p_setPrimaryFindResultSearchReference:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchReferencesToHighlight"));
      -[CRLWPRep i_setSearchReferencesToHighlight:](self, "i_setSearchReferencesToHighlight:", v18);

    }
  }

}

- (void)willBeRemoved
{
  objc_super v3;

  -[CRLWPRep p_teardown](self, "p_teardown");
  v3.receiver = self;
  v3.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep willBeRemoved](&v3, "willBeRemoved");
}

- (BOOL)p_isRedesignedTextCursorEnabled
{
  return +[CRLFeatureFlagGroup isRedesignedTextCursorEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isRedesignedTextCursorEnabled");
}

- (_NSRange)range
{
  void *v2;
  id v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  void *i;
  void *v8;
  id location;
  NSUInteger length;
  NSUInteger v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  NSRange v20;
  _NSRange result;
  NSRange v22;

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  v4 = 0;
  if (v3)
  {
    v5 = *(_QWORD *)v16;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        {
          location = objc_msgSend(v8, "range");
        }
        else
        {
          v22.location = (NSUInteger)objc_msgSend(v8, "range");
          v22.length = v11;
          v20.location = v6;
          v20.length = v4;
          v12 = NSUnionRange(v20, v22);
          length = v12.length;
          location = (id)v12.location;
        }
        v6 = (NSUInteger)location;
        v4 = length;
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }
  else
  {
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v13 = v6;
  v14 = v4;
  result.length = v14;
  result.location = v13;
  return result;
}

- (CGPoint)pinToNaturalBounds:(CGPoint)a3 andLastLineFragment:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  char *v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double MaxY;
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
  double v44;
  CGFloat rect;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  CGPoint result;
  CGPoint v64;
  CGRect v65;
  CGRect v66;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  -[CRLWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
  v13 = v12;
  v15 = v14;
  if (v4)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v20, "frameBounds");
          v64.x = v13;
          v64.y = v15;
          if (CGRectContainsPoint(v65, v64))
          {
            v21 = (char *)objc_msgSend(v20, "lineCount");
            if (v21)
            {
              objc_msgSend(v20, "boundsOfLineFragmentAtIndex:", v21 - 1);
              rect = v22;
              v24 = v23;
              v26 = v25;
              v28 = v27;
              if (v20)
              {
                objc_msgSend(v20, "transformToWP");
                v29 = v53;
                v30 = v55;
                v42 = v54;
                v31 = v57;
                v43 = v56;
                v44 = v52;
              }
              else
              {
                v31 = 0.0;
                v30 = 0.0;
                v29 = 0.0;
                v42 = 0.0;
                v43 = 0.0;
                v44 = 0.0;
              }
              v66.origin.x = v26;
              v66.origin.y = v28;
              v66.size.width = v24;
              v66.size.height = rect;
              MaxY = CGRectGetMaxY(v66);
              if (v31 + v15 * v30 + v29 * v13 > MaxY)
              {
                if (v20)
                {
                  objc_msgSend(v20, "transformFromWP");
                  v33 = v47;
                  v34 = v46;
                  v35 = v49;
                  v36 = v48;
                  v37 = v51;
                  v38 = v50;
                }
                else
                {
                  v37 = 0.0;
                  v35 = 0.0;
                  v33 = 0.0;
                  v38 = 0.0;
                  v36 = 0.0;
                  v34 = 0.0;
                }
                v39 = v43 + v15 * v42 + v44 * v13;
                v13 = v38 + MaxY * v36 + v34 * v39;
                v15 = v37 + MaxY * v35 + v33 * v39;
              }
            }
            goto LABEL_20;
          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
        if (v17)
          continue;
        break;
      }
    }
LABEL_20:

  }
  v40 = v13;
  v41 = v15;
  result.y = v41;
  result.x = v40;
  return result;
}

- (CGPoint)pinToClosestColumn:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep closestColumnForPoint:](self, "closestColumnForPoint:"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "frameBounds");
    -[CRLWPRep p_pinPoint:toRect:](self, "p_pinPoint:toRect:", x, y, v8, v9, v10, v11);
    x = v12;
    y = v13;
  }

  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGRect)caretRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  -[CRLWPRep caretRectForSelection:](self, "caretRectForSelection:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)selectionRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  -[CRLWPRep rectForSelection:includeRuby:includePaginatedAttachments:](self, "rectForSelection:includeRuby:includePaginatedAttachments:", v3, 0, 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)containsPoint:(CGPoint)a3 withPrecision:(BOOL)a4
{
  _BOOL8 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)CRLWPRep;
  if (!-[CRLCanvasRep containsPoint:withPrecision:](&v12, "containsPoint:withPrecision:"))
    return 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));

  if (!v8)
    return 1;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v10 = objc_msgSend(v9, "containsPoint:withPrecision:", v4, x, y);

  return v10;
}

- (BOOL)didPointHitSelectionEnd:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  CGSize size;
  void *v11;
  double v12;
  double v13;
  void *v14;
  CGPath *v15;
  double v16;
  CGRect v18;
  CGPoint origin;
  CGSize v20;

  y = a3.y;
  x = a3.x;
  v6 = objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    v9 = objc_msgSend(v8, "isInsertionPoint");

    if ((v9 & 1) != 0)
    {
      LOBYTE(v6) = 0;
    }
    else
    {
      size = CGRectNull.size;
      origin = CGRectNull.origin;
      v20 = size;
      v18.origin = origin;
      v18.size = size;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
      objc_msgSend(v11, "viewScale");
      v13 = v12;

      LODWORD(v11) = -[CRLWPRep textIsVertical](self, "textIsVertical");
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
      v15 = -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:", v14, 0, &origin, &v18);

      CGPathRelease(v15);
      v16 = 1.0 / v13;
      if ((_DWORD)v11)
      {
        origin.y = origin.y - v16;
        v18.origin.y = CGRectGetMaxY(v18) - v16;
      }
      else
      {
        origin.x = origin.x - v16;
        v18.origin.x = CGRectGetMaxX(v18) - v16;
      }
      if (sub_100060F8C(x, y, origin.x + -2.5, origin.y + -3.5, v20.width + 5.0, v20.height + 7.0)
        || (LODWORD(v6) = sub_100060F8C(x, y, v18.origin.x + -2.5, v18.origin.y + -3.5, v18.size.width + 5.0, v18.size.height + 7.0), (_DWORD)v6))
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

- (BOOL)isPointInSelectedArea:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  BOOL v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  CGPoint v34;
  CGRect v35;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));

  if (!v6)
    return 0;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
        v13 = objc_msgSend(v12, "range");
        v15 = v14;
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", v13, v15, objc_msgSend(v16, "type"), 0, 0, 0));

        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v18 = v17;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v25;
          while (2)
          {
            for (j = 0; j != v19; j = (char *)j + 1)
            {
              if (*(_QWORD *)v25 != v20)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), "CGRectValue");
              v34.x = x;
              v34.y = y;
              if (CGRectContainsPoint(v35, v34))
              {

                v22 = 1;
                goto LABEL_21;
              }
            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v19)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      v22 = 0;
    }
    while (v8);
  }
  else
  {
    v22 = 0;
  }
LABEL_21:

  return v22;
}

- (CGRect)rectForSelection:(id)a3 includeRuby:(BOOL)a4 includePaginatedAttachments:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
  +[CRLWPColumn boundsRectForSelection:columnArray:includeRuby:includePaginatedAttachments:](CRLWPColumn, "boundsRectForSelection:columnArray:includeRuby:includePaginatedAttachments:", v8, v9, v6, v5);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGPath)newPathForSelection:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGPath *Mutable;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a3;
  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (objc_msgSend(v4, "isRange"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v12);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = objc_msgSend(v4, "range", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", v14, v15, objc_msgSend(v4, "type"), 0, 0, 1));
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v31;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v31 != v18)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v19), "CGRectValue");
                v21 = v20;
                v23 = v22;
                v25 = v24;
                v27 = v26;
                v40.origin.x = x;
                v40.origin.y = y;
                v40.size.width = width;
                v40.size.height = height;
                if (CGRectIsEmpty(v40))
                {
                  x = v21;
                  y = v23;
                  width = v25;
                  height = v27;
                }
                else
                {
                  v41.origin.x = x;
                  v41.origin.y = y;
                  v41.size.width = width;
                  v41.size.height = height;
                  v46.origin.x = v21;
                  v46.origin.y = v23;
                  v46.size.width = v25;
                  v46.size.height = v27;
                  v42 = CGRectUnion(v41, v46);
                  x = v42.origin.x;
                  y = v42.origin.y;
                  width = v42.size.width;
                  height = v42.size.height;
                }
                v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v17);
          }

          v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

  }
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  if (CGRectIsEmpty(v43))
  {
    Mutable = 0;
  }
  else
  {
    Mutable = CGPathCreateMutable();
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v45 = CGRectIntegral(v44);
    CGPathAddRect(Mutable, 0, v45);
  }

  return Mutable;
}

- (CGPath)p_newPathForSelection:(id)a3 withTransform:(CGAffineTransform *)a4 withInset:(double)a5
{
  id v8;
  CGPath *Mutable;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v8 = a3;
  if (objc_msgSend(v8, "isRange"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    Mutable = 0;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v35;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v12);
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v14 = objc_msgSend(v8, "range");
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rectsForSelectionRange:selectionType:forParagraphMode:includeRuby:includePaginatedAttachments:", v14, v15, objc_msgSend(v8, "type"), 0, 0, 1));
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v31;
            do
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v31 != v18)
                  objc_enumerationMutation(v16);
                objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v19), "CGRectValue");
                x = v40.origin.x;
                y = v40.origin.y;
                width = v40.size.width;
                height = v40.size.height;
                if (!CGRectIsNull(v40))
                {
                  v41.origin.x = x;
                  v41.origin.y = y;
                  v41.size.width = width;
                  v41.size.height = height;
                  v42 = CGRectInset(v41, a5, a5);
                  v24 = v42.origin.x;
                  v25 = v42.origin.y;
                  v26 = v42.size.width;
                  v27 = v42.size.height;
                  if (!Mutable)
                    Mutable = CGPathCreateMutable();
                  v43.origin.x = v24;
                  v43.origin.y = v25;
                  v43.size.width = v26;
                  v43.size.height = v27;
                  v44 = CGRectIntegral(v43);
                  CGPathAddRect(Mutable, a4, v44);
                }
                v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
            }
            while (v17);
          }

          v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v10);
    }

  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 caretAffinity:(unint64_t)a4
{
  CRLWPSelection *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v5 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:]([CRLWPSelection alloc], "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, a3, 0, 0, a4);
  -[CRLWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)caretRectForCharIndex:(unint64_t)a3 leadingEdge:(BOOL)a4 caretAffinity:(unint64_t)a5
{
  CRLWPSelection *v9;
  void *v10;
  id v11;
  CRLWPSelection *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  CGRect result;

  v9 = [CRLWPSelection alloc];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v11 = objc_msgSend(v10, "copyWithMarkedText");
  LOBYTE(v25) = a4;
  v12 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v9, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 7, a3, 0, 0, a5, 0x7FFFFFFFFFFFFFFFLL, 0, v25, v11);

  -[CRLWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- ($3D3C930936AA0606C6A30FFE5E4C6F36)p_lineMetricsAtPoint:(SEL)a3 allowNotFound:(CGPoint)a4
{
  _BOOL8 v5;
  double y;
  double x;
  void *v10;
  id v11;
  $3D3C930936AA0606C6A30FFE5E4C6F36 *result;
  _BYTE v13[328];
  __int16 v14;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  memcpy(retstr, &unk_100EEFA70, sizeof($3D3C930936AA0606C6A30FFE5E4C6F36));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep closestColumnForPoint:](self, "closestColumnForPoint:", x, y));
  v14 = 0;
  v11 = objc_msgSend(v10, "charIndexFromPoint:allowPastBreak:pastCenterGoesToNextChar:allowNotFound:isAtEndOfLine:leadingEdge:", 0, 1, v5, (char *)&v14 + 1, &v14, x, y);
  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
      objc_msgSend(v10, "lineMetricsAtCharIndex:allowEndOfLine:", v11, HIBYTE(v14));
    else
      memset(v13, 0, sizeof(v13));
    memcpy(retstr, v13, sizeof($3D3C930936AA0606C6A30FFE5E4C6F36));
  }

  return result;
}

- ($3D3C930936AA0606C6A30FFE5E4C6F36)lineMetricsAtPoint:(SEL)a3
{
  return -[CRLWPRep p_lineMetricsAtPoint:allowNotFound:](self, "p_lineMetricsAtPoint:allowNotFound:", 0, a4.x, a4.y);
}

- ($3D3C930936AA0606C6A30FFE5E4C6F36)lineMetricsAtCharIndex:(SEL)a3
{
  void *v6;
  $3D3C930936AA0606C6A30FFE5E4C6F36 *result;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columnForCharIndex:](self, "columnForCharIndex:"));
  v8 = v6;
  if (v6)
  {
    objc_msgSend(v6, "lineMetricsAtCharIndex:allowEndOfLine:", a4, 0);
  }
  else
  {
    retstr->var7.ty = 0.0;
    *(_OWORD *)&retstr->var7.b = 0u;
    *(_OWORD *)&retstr->var7.d = 0u;
    *(_OWORD *)&retstr->var6.xHeight = 0u;
    *(_OWORD *)&retstr->var6.underlineThickness = 0u;
    *(_OWORD *)&retstr->var6.leadingAbove = 0u;
    *(_OWORD *)&retstr->var6.spaceAfter = 0u;
    *(_OWORD *)&retstr->var6.attachmentHeight = 0u;
    *(_OWORD *)&retstr->var6.capHeight = 0u;
    retstr->var4.size = 0u;
    *(_OWORD *)&retstr->var5 = 0u;
    *(_OWORD *)&retstr->var2.underlineThickness = 0u;
    retstr->var4.origin = 0u;
    *(_OWORD *)&retstr->var2.spaceAfter = 0u;
    *(_OWORD *)&retstr->var2.xHeight = 0u;
    *(_OWORD *)&retstr->var2.capHeight = 0u;
    *(_OWORD *)&retstr->var2.leadingAbove = 0u;
    *(_OWORD *)&retstr->var1 = 0u;
    *(_OWORD *)&retstr->var2.attachmentHeight = 0u;
    retstr->var0.origin = 0u;
    retstr->var0.size = 0u;
  }

  return result;
}

- ($C5ACE5DF23171BCD39C0E4E0C96DCEA5)wordMetricsAtCharIndex:(SEL)a3
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  $C5ACE5DF23171BCD39C0E4E0C96DCEA5 *result;
  _QWORD v21[7];

  *(_OWORD *)&retstr->var5 = xmmword_100EEFBF8;
  *(_OWORD *)&retstr->var6.b = unk_100EEFC08;
  *(_OWORD *)&retstr->var6.d = xmmword_100EEFC18;
  retstr->var6.ty = 0.0;
  retstr->var0.origin = (CGPoint)xmmword_100EEFBB8;
  retstr->var0.size = (CGSize)unk_100EEFBC8;
  *(_OWORD *)&retstr->var1 = xmmword_100EEFBD8;
  *(_OWORD *)&retstr->var3 = unk_100EEFBE8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v8 = objc_msgSend(v7, "wordAtCharIndex:includePreviousWord:", a4, 0);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v8, v10));
  -[CRLWPRep rectForSelection:includeRuby:includePaginatedAttachments:](self, "rectForSelection:includeRuby:includePaginatedAttachments:", v11, 0, 0);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  retstr->var0.origin.x = v13;
  retstr->var0.origin.y = v15;
  retstr->var0.size.width = v17;
  retstr->var0.size.height = v19;
  memset(v21, 0, sizeof(v21));
  result = -[CRLWPRep lineMetricsAtCharIndex:](self, "lineMetricsAtCharIndex:", a4, 0, 0, 0, 0);
  retstr->var1 = 0.0;
  retstr->var2 = 0.0;
  retstr->var3 = 0.0;
  retstr->var4 = 0.0;
  retstr->var6 = *(CGAffineTransform *)&v21[1];
  return result;
}

- (CGRect)caretRectForSelection:(id)a3
{
  id v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = a3;
  if (v4)
  {
    -[CRLWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v4);
    x = v5;
    y = v7;
    width = v9;
    height = v11;
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)p_caretRectForSelection:(id)a3
{
  id v4;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect result;

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (objc_msgSend(v4, "type") != (id)3 && objc_msgSend(v4, "type") != (id)5)
  {
    v26.origin.x = CGRectNull.origin.x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    if (CGRectIsNull(v26))
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "caretRectForSelection:", v4);
            if (v16 > 0.0 || v15 > 0.0)
            {
              x = v13;
              y = v14;
              width = v15;
              height = v16;
              goto LABEL_15;
            }
          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }

  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)p_topicDragRectForSelection:(id)a3
{
  id v4;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  unsigned int v25;
  CGFloat MaxX;
  double v27;
  CGFloat MaxY;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  _BOOL4 v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGAffineTransform v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect result;

  v4 = a3;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255B70);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27A28();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255B90);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_topicDragRectForSelection:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 575, 0, "invalid nil value for '%{public}s'", "sel");

  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v50;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v16, "caretRectForSelection:", v4);
        v19 = v18;
        v21 = v20;
        v22 = v17;
        v24 = v23;
        if (v23 > 0.0 || v17 > 0.0)
        {
          v25 = objc_msgSend(v16, "textIsVertical");
          if (v25)
          {
            v54.origin.x = v19;
            v54.origin.y = v21;
            v54.size.width = v22;
            v54.size.height = v24;
            MaxX = CGRectGetMaxX(v54);
            objc_msgSend(v16, "frameBounds");
            MaxY = v27;
            objc_msgSend(v16, "frameBounds");
            v30 = v29;
            v31 = 1.0;
          }
          else
          {
            objc_msgSend(v16, "frameBounds");
            MaxX = v32;
            objc_msgSend(v16, "frameBounds");
            v31 = v33;
            v30 = 1.0;
            MaxY = v21;
          }
          v34 = objc_msgSend(v4, "range");
          v48 = xmmword_100EEE418;
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
          v36 = objc_msgSend(v35, "paragraphIndexAtCharIndex:effectiveRange:", v34, &v48);

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
          if (v36 == objc_msgSend(v37, "paragraphCount") && *((_QWORD *)&v48 + 1))
          {
            v38 = (unint64_t)v34 > (unint64_t)v48;

            if (v38)
            {
              v39 = v19;
              v40 = v21;
              v41 = v22;
              v42 = v24;
              if (v25)
                MaxX = CGRectGetMinX(*(CGRect *)&v39);
              else
                MaxY = CGRectGetMaxY(*(CGRect *)&v39);
            }
          }
          else
          {

          }
          -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
          v55.origin.x = MaxX;
          v55.origin.y = MaxY;
          v55.size.width = v31;
          v55.size.height = v30;
          v56 = CGRectApplyAffineTransform(v55, &v47);
          x = v56.origin.x;
          y = v56.origin.y;
          if (v25)
          {
            height = v56.size.height;
            x = rint(v56.origin.x);
            width = 1.0;
          }
          else
          {
            width = v56.size.width;
            y = rint(v56.origin.y);
            height = 1.0;
          }
          goto LABEL_33;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_33:

  v43 = x;
  v44 = y;
  v45 = width;
  v46 = height;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (CGRect)p_closestCaretRectForCharacterAtPoint:(CGPoint)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *i;
  void *v19;
  id v20;
  unint64_t v21;
  unint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  -[CRLWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:inLayoutTarget:", 1, 1, 0, 0, 0, 0, v9, v11, v12);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    v16 = v13 + 1;
    if (v15)
    {
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v20 = objc_msgSend(v19, "range");
          if (v16 >= (unint64_t)v20 && v16 - (unint64_t)v20 < v21)
          {
            v15 = v19;
            goto LABEL_14;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v15);
    }
LABEL_14:

    if (v15)
      v23 = v13 + 1;
    else
      v23 = v13;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v23, 0));
    -[CRLWPRep caretRectForSelection:](self, "caretRectForSelection:", v24);
    x = v25;
    y = v26;
    width = v27;
    height = v28;

  }
  v29 = x;
  v30 = y;
  v31 = width;
  v32 = height;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGRect)p_closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4 allowPastBreak:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL4 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  unsigned __int8 v29;
  CGRect result;

  v5 = a5;
  v6 = a4;
  -[CRLWPRep pinToNaturalBounds:andLastLineFragment:](self, "pinToNaturalBounds:andLastLineFragment:", 1, a3.x, a3.y);
  v9 = v8;
  v11 = v10;
  v29 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v13 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:", v5, &v29, v12, v9, v11);

  if (v6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    v15 = objc_msgSend(v14, "isValid");

    if ((v15 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255BB0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E27AB4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255BD0);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 667, 0, "invalid text selection");

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    v20 = v13 < (unint64_t)objc_msgSend(v19, "start");

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    v22 = v21;
    if (v20)
    {
      v23 = objc_msgSend(v21, "start");
LABEL_16:
      v13 = (unint64_t)v23;

      goto LABEL_17;
    }
    v24 = v13 > (unint64_t)objc_msgSend(v21, "end");

    if (v24)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
      v23 = objc_msgSend(v22, "end");
      goto LABEL_16;
    }
  }
LABEL_17:
  -[CRLWPRep caretRectForCharIndex:caretAffinity:](self, "caretRectForCharIndex:caretAffinity:", v13, v29);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (id)cursorAtPoint:(CGPoint)a3 forKnob:(id)a4 withCursorPlatformObject:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLWPRep;
    v11 = -[CRLCanvasRep cursorAtPoint:forKnob:withCursorPlatformObject:](&v15, "cursorAtPoint:forKnob:withCursorPlatformObject:", v9, v10, x, y);
    v12 = objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[CRLWPRep cursorForPoint:withCursorPlatformObject:](self, "cursorForPoint:withCursorPlatformObject:", v10, x, y));
  }
  v13 = (void *)v12;

  return v13;
}

- (double)p_maximumBeamLength
{
  return 1000.0;
}

- (id)cursorForPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  double y;
  double x;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  int v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  int IsEmpty;
  _BOOL4 v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  __CFString *v47;
  void *v48;
  void *v49;
  double MaxX;
  double MinX;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  const __CFString *v59;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  void *v68;
  _OWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _OWORD v89[3];
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  y = a3.y;
  x = a3.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", a4));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasController"));

  v8 = -[CRLWPRep textIsVertical](self, "textIsVertical");
  v9 = objc_claimAutoreleasedReturnValue(-[CRLWPRep p_hyperlinkAtPoint:](self, "p_hyperlinkAtPoint:", x, y));
  v10 = (void *)v9;
  if (v8)
    v11 = 1;
  else
    v11 = 2;
  if (v9)
  {
    width = CGRectZero.size.width;
    v66 = CGRectZero.origin.y;
    v67 = CGRectZero.origin.x;
    height = CGRectZero.size.height;
  }
  else
  {
    -[CRLCanvasRep layerFrameInScaledCanvas](self, "layerFrameInScaledCanvas");
    v66 = v15;
    v67 = v14;
    width = v16;
    height = v17;
  }
  -[CRLWPRep p_closestCaretRectForCharacterAtPoint:](self, "p_closestCaretRectForCharacterAtPoint:", x, y);
  v18 = v90.origin.x;
  v19 = v90.origin.y;
  v20 = v90.size.width;
  v21 = v90.size.height;
  if (CGRectIsNull(v90))
  {
    v22 = 0;
  }
  else
  {
    -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", sub_100061400(v18, v19, v20, v21));
    objc_msgSend(v68, "convertUnscaledToBoundsPoint:");
    v64 = v24;
    v65 = v23;
    if (!v10)
    {
      objc_msgSend(v68, "viewScale");
      v26 = sub_1000603DC(v20, v21, v25);
      if (!v8)
        v26 = v27;
      if (v26 > 0.0)
        -[CRLWPRep setIbeamLength:](self, "setIbeamLength:");
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v29 = v28;
    if (v28)
      objc_msgSend(v28, "transformInRoot");
    else
      memset(v89, 0, sizeof(v89));
    v30 = sub_1000791B0(v89);

    v31 = sub_1003C65B0(v30, 90.0);
    sub_1000618C4(v31);
    if (v32 != 0.0 && v32 != 180.0 && fabs(v32 + -180.0) >= 0.00018)
    {
      if (v32 == 90.0 || v32 == 270.0 || fabs(v32 + -90.0) < 0.0000899999998 || fabs(v32 + -270.0) < 0.000269999999)
      {
        if (v8)
          v11 = 2;
        else
          v11 = 1;
      }
      else
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101255BF0);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E27B34();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101255C10);
        v61 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep cursorForPoint:withCursorPlatformObject:]"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 763, 0, "Something is wrong with our math");

      }
    }
    v88 = 0;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    memset(&v69[3], 0, 32);
    -[CRLWPRep p_lineMetricsAtPoint:allowNotFound:](self, "p_lineMetricsAtPoint:allowNotFound:", 1, x, y);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v34 = v33;
    if (v33)
      objc_msgSend(v33, "transformInRoot");
    else
      memset(v69, 0, 48);
    v35 = sub_100079330((double *)v69, 0.01);

    IsEmpty = CGRectIsEmpty(*(CGRect *)&v69[3]);
    if (v10)
    {
      v37 = 1;
    }
    else
    {
      -[CRLWPRep ibeamLength](self, "ibeamLength");
      v39 = v38;
      -[CRLWPRep p_maximumBeamLength](self, "p_maximumBeamLength");
      v37 = v39 <= v40;
    }
    v22 = v35 & ~IsEmpty & v37;
    if (v22 == 1)
    {
      if (v11 == 2)
      {
        v91.origin.x = v67;
        v91.origin.y = v66;
        v91.size.width = width;
        v91.size.height = height;
        CGRectGetMaxY(v91);
        v92.origin.x = v67;
        v92.origin.y = v66;
        v92.size.width = width;
        v92.size.height = height;
        CGRectGetMinY(v92);
        v41 = sub_1000615D8(v67, v66, width, height, v65);
        v43 = v42;
        width = v44;
        height = v45;
        v46 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v64));
      }
      else
      {
        v93.origin.x = v67;
        v93.origin.y = v66;
        v93.size.width = width;
        v93.size.height = height;
        MaxX = CGRectGetMaxX(v93);
        v94.origin.x = v67;
        v94.origin.y = v66;
        v94.size.width = width;
        v94.size.height = height;
        MinX = CGRectGetMinX(v94);
        v52 = vabdd_f64(v65, MaxX);
        v53 = vabdd_f64(v65, MinX);
        if (v52 > v53)
          v53 = -v52;
        v41 = sub_1000615D8(v67, v66, width, height, v65 + v53);
        v43 = v54;
        width = v55;
        height = v56;
        v46 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v65));
      }
      v47 = (__CFString *)v46;
      v66 = v43;
      v67 = v41;
      if (v10)
        goto LABEL_34;
      goto LABEL_39;
    }
  }
  v47 = &stru_1012A72B0;
  if (v10)
  {
LABEL_34:
    v48 = 0;
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor defaultCursor](CRLCursor, "defaultCursor"));
    goto LABEL_42;
  }
LABEL_39:
  -[CRLWPRep ibeamLength](self, "ibeamLength");
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape beamWithPreferredLength:axis:](UIPointerShape, "beamWithPreferredLength:axis:", v11));
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v57, v67, v66, width, height));
  -[CRLWPRep ibeamLength](self, "ibeamLength");
  v59 = CFSTR("H");
  if (v11 == 2)
    v59 = CFSTR("V");
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f%@%@"), v58, v59, v47));
  -[CRLWPRep setIbeamLength:](self, "setIbeamLength:", 20.0);
  objc_msgSend(v49, "setIdentifierSuffix:", v48);

LABEL_42:
  if (v22)
    objc_msgSend(v49, "setConstrainedAxes:", v11);

  return v49;
}

- (void)p_registerNotifications
{
  unsigned int v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = objc_msgSend(v5, "isCanvasInteractive");

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_selectionChangedNotification:", CFSTR("CRLTPEditorSelectionChanged"), v6);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_markChangedNotification:", CFSTR("CRLWPEditorMarkChanged"), v6);
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "p_editingDidEndNotification:", CFSTR("CRLWPEditorEditingDidEnd"), v6);

  }
}

- (void)p_unregisterNotifications
{
  unsigned int v3;
  void *v4;
  id v5;
  id v6;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v3 = objc_msgSend(v5, "isCanvasInteractive");

  if (v3)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLTPEditorSelectionChanged"), v6);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLWPEditorMarkChanged"), v6);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("CRLWPEditorEditingDidEnd"), v6);

  }
}

- (id)newTrackerForKnob:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  CRLWPTextKnobTracker *v8;

  v4 = a3;
  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255C30);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27BB4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255C50);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep newTrackerForKnob:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 850, 0, "invalid nil value for '%{public}s'", "knob");

  }
  v8 = -[CRLWPTextKnobTracker initWithRep:knob:]([CRLWPTextKnobTracker alloc], "initWithRep:knob:", self, v4);

  return v8;
}

- (id)knobPositioner
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _TtC8Freeform22CRLWPKnobPositioning_i *v9;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform11CRLWPLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = -[CRLWPKnobPositioning_i initWithLayout:]([_TtC8Freeform22CRLWPKnobPositioning_i alloc], "initWithLayout:", v8);
  else
    v9 = 0;

  return v9;
}

- (CGPoint)knobCenterForSelection:(id)a3 knob:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep knobPositioner](self, "knobPositioner"));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "knobCenterForSelection:knob:", v6, v7);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v11 = 0x7FF0000000000000;
    v13 = 0x7FF0000000000000;
  }

  v14 = *(double *)&v11;
  v15 = *(double *)&v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (double)knobOffsetForKnob:(id)a3 paragraphMode:(BOOL)a4
{
  id v6;
  void *v7;
  double Height;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double v14;
  CGRect v16;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "renderable"));
  objc_msgSend(v7, "bounds");
  Height = CGRectGetHeight(v16);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v9, "viewScale");
  v11 = v10;

  v12 = objc_msgSend(v6, "tag");
  v13 = Height * 0.5;
  v14 = 0.0;
  if (v12 == (id)11)
  {
    if (!a4)
      v14 = 0.0 - (v13 / v11 + -1.0);
  }
  else if (!a4)
  {
    v14 = v13 / v11 + -1.0;
  }

  return v14;
}

- (Class)layerClass
{
  return (Class)objc_opt_class(CALayer, a2);
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (int64_t)tilingMode
{
  if (-[CRLWPRep textIsVertical](self, "textIsVertical"))
    return 5;
  else
    return 4;
}

- (void)verticalTextPropertyChanged
{
  CRLNoDefaultImplicitActionLayer *dragAndDropTopicIndentLayer;

  -[CRLWPRep p_destroyLayer:](self, "p_destroyLayer:", 1);
  -[CRLWPRep p_destroyLayer:](self, "p_destroyLayer:", 0);
  -[CRLWPRep p_createLayer:](self, "p_createLayer:", 1);
  -[CRLWPRep p_createLayer:](self, "p_createLayer:", 0);
  dragAndDropTopicIndentLayer = self->_dragAndDropTopicIndentLayer;
  self->_dragAndDropTopicIndentLayer = 0;

}

- (void)processChangedProperty:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep processChangedProperty:](&v5, "processChangedProperty:");
  if (a3 != 7 && a3 != 25)
  {
    if (a3 != 26)
      return;
    -[CRLWPStorageSpellChecker i_resetSpellCheckingForNotification:](self->_spellChecker, "i_resetSpellCheckingForNotification:", 0);
  }
  -[CRLWPRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)spellCheckingStateChanged
{
  -[CRLWPRep setNeedsDisplay](self, "setNeedsDisplay");
  if (-[CRLWPRep p_needsSpellChecker](self, "p_needsSpellChecker"))
  {
    if (!self->_spellChecker)
      -[CRLWPRep p_createSpellChecker](self, "p_createSpellChecker");
  }
  else
  {
    -[CRLWPRep p_destroySpellChecker](self, "p_destroySpellChecker");
  }
}

- (id)p_hyperlinkAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  objc_opt_class(CRLWPHyperlinkField, a2);
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep smartFieldAtPoint:](self, "smartFieldAtPoint:", x, y));
  v9 = sub_100221D0C(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (void)performBlockOnTextLayers:(id)a3
{
  uint64_t v4;
  CALayer **textLayers;
  char v6;
  char v7;
  void (**v8)(void);

  v8 = (void (**)(void))a3;
  v4 = 0;
  textLayers = self->_textLayers;
  v6 = 1;
  do
  {
    v7 = v6;
    if (textLayers[v4])
      v8[2]();
    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);

}

- (id)textLayer
{
  return self->_textLayers[1];
}

- (id)textBackgroundLayer
{
  return self->_textLayers[0];
}

- (void)setNeedsDisplay
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100373F24;
    v12[3] = &unk_101255C78;
    v12[4] = self;
    -[CRLWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v12);
    *(_QWORD *)&v6 = objc_opt_class(CRLShapeRep, v5).n128_u64[0];
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v6));
    v10 = sub_100221D0C(v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    objc_msgSend(v11, "invalidateEffectLayersForChildren");
  }
}

- (void)setNeedsDisplayInRange:(_NSRange)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", a3.location, a3.length));
  -[CRLWPRep rectForSelection:includeRuby:includePaginatedAttachments:](self, "rectForSelection:includeRuby:includePaginatedAttachments:");
  -[CRLWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");

}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v21[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsEmpty(a3))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v9 = objc_msgSend(v8, "isCanvasInteractive");

    if (v9)
    {
      -[CRLCanvasRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", x, y, width, height);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100374140;
      v21[3] = &unk_101255CA0;
      v21[4] = self;
      v21[5] = v10;
      v21[6] = v11;
      v21[7] = v12;
      v21[8] = v13;
      -[CRLWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v21);
      *(_QWORD *)&v15 = objc_opt_class(CRLShapeRep, v14).n128_u64[0];
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v15));
      v19 = sub_100221D0C(v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      objc_msgSend(v20, "invalidateEffectLayersForChildren");
    }
  }
}

- (id)colorBehindLayer:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep backgroundColor](self, "backgroundColor"));
  if (!v6)
  {
    *(_QWORD *)&v7 = objc_opt_class(CRLShapeRep, v5).n128_u64[0];
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v7));
    v11 = sub_100221D0C(v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "colorBehindLayer:", v4));
  }

  return v6;
}

- (void)drawInLayerContext:(CGContext *)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount", a3);
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255CC0);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E27C40();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101255CE0);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
  {
    objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    sub_100DE7E60();
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep drawInLayerContext:]"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 1039, 0, "this method should never be called, and WP reps should never get a bitmap allocated");

}

- (void)drawInContext:(CGContext *)a3
{
  -[CRLWPRep p_drawInContext:limitSelection:suppressInvisibles:](self, "p_drawInContext:limitSelection:suppressInvisibles:", a3, 0, 0);
}

- (void)p_drawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
  uint64_t v8;
  id v9;

  v9 = a4;
  CGContextSaveGState(a3);
  LOBYTE(v8) = a5;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v9, 0x7FFFFFFFFFFFFFFFLL, 0, 3, v8);
  CGContextRestoreGState(a3);

}

- (void)recursivelyDrawInContext:(CGContext *)a3 limitSelection:(id)a4 suppressInvisibles:(BOOL)a5
{
  -[CRLWPRep p_drawInContext:limitSelection:suppressInvisibles:](self, "p_drawInContext:limitSelection:suppressInvisibles:", a3, a4, a5);
}

- (void)drawRubyInContext:(CGContext *)a3 rubyFieldStart:(unint64_t)a4 rubyGlyphRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  id v11;
  CRLWPSelection *v12;
  CRLWPSelection *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  length = a5.length;
  location = a5.location;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v11 = objc_msgSend(v10, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a4, 7, &v15);

  if (v16)
  {
    CGContextSaveGState(a3);
    v12 = [CRLWPSelection alloc];
    v13 = -[CRLWPSelection initWithRange:](v12, "initWithRange:", v15, v16);
    LOBYTE(v14) = 0;
    -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, a3, v13, location, length, 3, v14);
    CGContextRestoreGState(a3);

  }
}

- (id)overlayRenderables
{
  NSArray *v3;
  void *v4;
  id v5;
  uint64_t v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  char v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  CAShapeLayer *dragAndDropCaretLayer;
  CAShapeLayer *v28;
  CAShapeLayer *v29;
  CAShapeLayer *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  CAShapeLayer *v39;
  CAShapeLayer *v40;
  CAShapeLayer *v41;
  CAShapeLayer *v42;
  void *v43;
  void *v44;
  void *v45;
  CRLWPHighlightArrayController *pulseArrayController;
  void *v47;
  void *v48;
  void *v49;
  CRLWPHighlightArrayController *highlightArrayController;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v55;
  objc_super v56;

  v56.receiver = self;
  v56.super_class = (Class)CRLWPRep;
  v3 = -[CRLCanvasRep overlayRenderables](&v56, "overlayRenderables");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (!self->_selectionLineLayers[0])
    -[CRLWPRep p_createSelectionLineLayers](self, "p_createSelectionLineLayers");
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->_selectionLineLayers[v6]));
    objc_msgSend(v5, "addObject:", v9);

    v7 = 0;
    v6 = 1;
  }
  while ((v8 & 1) != 0);
  if (self->_caretPulseController)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](self->_caretPulseController, "layer"));
    objc_msgSend(v11, "setDelegate:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLHighlightController layer](self->_caretPulseController, "layer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v12));
    objc_msgSend(v5, "addObject:", v13);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvas"));
  objc_msgSend(v15, "contentsScale");
  v17 = v16;

  if (!-[CRLCanvasRep shouldShowDragAndDropHighlight](self, "shouldShowDragAndDropHighlight"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dropSelection);
    if (!WeakRetained)
      goto LABEL_28;
    goto LABEL_16;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
  objc_msgSend(v18, "dragAndDropNaturalPoint");
  v19 = sub_1000637EC();

  if ((v19 & 1) != 0)
  {
    WeakRetained = 0;
    goto LABEL_28;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storageForDragDropOperation](self, "storageForDragDropOperation"));

  if (v21 == v22)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dragAndDropHelper](self, "dragAndDropHelper"));
    objc_msgSend(v23, "dragAndDropNaturalPoint");
    v26 = objc_claimAutoreleasedReturnValue(-[CRLWPRep selectionForDragAndDropNaturalPoint:](self, "selectionForDragAndDropNaturalPoint:"));
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v24 = objc_msgSend(v23, "range");
    v26 = objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v24, v25));
  }
  WeakRetained = (id)v26;

  if (WeakRetained)
  {
LABEL_16:
    if ((objc_msgSend(WeakRetained, "isRange") & 1) != 0)
    {
      if (self->_dragAndDropCaretLayerIsForCaret)
      {
        -[CAShapeLayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);
        dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = 0;

        self->_dragAndDropCaretLayerIsForCaret = 0;
      }
      if (!self->_dragAndDropCaretLayer)
      {
        v28 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        v29 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = v28;

        v30 = self->_dragAndDropCaretLayer;
        -[CAShapeLayer setContentsScale:](v30, "setContentsScale:", v17);
        -[CAShapeLayer setAnchorPoint:](v30, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
        -[CAShapeLayer setEdgeAntialiasingMask:](v30, "setEdgeAntialiasingMask:", 0);
        -[CAShapeLayer setDelegate:](v30, "setDelegate:", self);
        -[CAShapeLayer setZPosition:](v30, "setZPosition:", 1.0);
        -[CAShapeLayer setFillColor:](v30, "setFillColor:", 0);
        -[CAShapeLayer setStrokeColor:](v30, "setStrokeColor:", -[CRLWPRep p_highlightLineColor](self, "p_highlightLineColor"));

      }
      v31 = objc_msgSend(WeakRetained, "range");
      v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn pathForHighlightWithRange:columnArray:pathStyle:](CRLWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", v31, v33, v34, 0));

      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "pathByNormalizingClosedPathToRemoveSelfIntersections"));
      -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
      objc_msgSend(v36, "transformUsingAffineTransform:", &v55);
      v37 = objc_retainAutorelease(v36);
      -[CAShapeLayer setPath:](self->_dragAndDropCaretLayer, "setPath:", objc_msgSend(v37, "CGPath"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->_dragAndDropCaretLayer));
      objc_msgSend(v5, "addObject:", v38);

    }
    else
    {
      if (!self->_dragAndDropCaretLayerIsForCaret)
      {
        -[CAShapeLayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);
        v39 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = 0;

      }
      v40 = self->_dragAndDropCaretLayer;
      if (!v40)
      {
        v41 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_caretLayerWithZPosition:](self, "p_caretLayerWithZPosition:", 1.0));
        v42 = self->_dragAndDropCaretLayer;
        self->_dragAndDropCaretLayer = v41;

        self->_dragAndDropCaretLayerIsForCaret = 1;
        -[CAShapeLayer setHidden:](self->_dragAndDropCaretLayer, "setHidden:", 1);
        v40 = self->_dragAndDropCaretLayer;
      }
      -[CRLWPRep p_positionCaretLayer:forSelection:layerRelative:](self, "p_positionCaretLayer:forSelection:layerRelative:", v40, WeakRetained, 0);
      v37 = (id)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", self->_dragAndDropCaretLayer));
      objc_msgSend(v5, "addObject:", v37);
    }

  }
LABEL_28:
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));

  if (v43)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderableFromLayer:](CRLCanvasRenderable, "renderableFromLayer:", v44));
    objc_msgSend(v5, "addObject:", v45);

  }
  pulseArrayController = self->_pulseArrayController;
  if (pulseArrayController)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](pulseArrayController, "layers"));
    if (objc_msgSend(v47, "count"))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v47, "makeObjectsPerformSelector:withObject:", "setDelegate:", v48);

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderablesFromLayers:](CRLCanvasRenderable, "renderablesFromLayers:", v47));
      objc_msgSend(v5, "addObjectsFromArray:", v49);

    }
  }
  highlightArrayController = self->_highlightArrayController;
  if (highlightArrayController)
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPHighlightArrayController layers](highlightArrayController, "layers"));
    if (objc_msgSend(v51, "count"))
    {
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v51, "makeObjectsPerformSelector:withObject:", "setDelegate:", v52);

      v53 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderablesFromLayers:](CRLCanvasRenderable, "renderablesFromLayers:", v51));
      objc_msgSend(v5, "addObjectsFromArray:", v53);

    }
  }

  return v5;
}

- (BOOL)wantsChildRepLayerUpdatingCallsEvenWithNoChildren
{
  return 1;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  CAShapeLayer *caretLayer;
  _BOOL4 v5;
  CAShapeLayer *v6;
  CAShapeLayer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  caretLayer = self->_caretLayer;
  v5 = caretLayer == 0;
  if (!caretLayer)
  {
    v6 = (CAShapeLayer *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_caretLayerWithZPosition:](self, "p_caretLayerWithZPosition:", 0.5));
    v7 = self->_caretLayer;
    self->_caretLayer = v6;

    -[CRLWPRepCaretController setCaretLayer:](self->_caretController, "setCaretLayer:", self->_caretLayer);
    -[CRLWPRepHelper configureCaretLayer:](self->_repHelper, "configureCaretLayer:", self->_caretLayer);
  }
  if (!self->_selectionHighlightLayer)
  {
    -[CRLWPRep p_createSelectionHighlightLayer](self, "p_createSelectionHighlightLayer");
    v5 = 1;
  }
  if (!self->_selectionParagraphBorderLayer)
    -[CRLWPRep p_createSelectionParagraphBorderLayer](self, "p_createSelectionParagraphBorderLayer");
  if (!self->_markHighlightLayer)
    -[CRLWPRep p_createMarkHighlightLayer](self, "p_createMarkHighlightLayer");
  if (v5)
    -[CRLWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
  if (self->_markHighlightLayer)
    objc_msgSend(v13, "addObject:");
  if (self->_selectionHighlightLayer)
    objc_msgSend(v13, "addObject:");
  if (self->_smartFieldHighlightLayer)
    objc_msgSend(v13, "addObject:");
  if (self->_secondaryHighlightLayer)
    objc_msgSend(v13, "addObject:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));

  if (!v8)
    -[CRLWPRep p_createLayer:](self, "p_createLayer:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));
    objc_msgSend(v13, "addObject:", v10);

  }
  if (self->_selectionParagraphBorderLayer)
    objc_msgSend(v13, "addObject:");
  objc_msgSend(v13, "addObject:", self->_caretLayer);
  if (-[CRLWPRep shouldShowCollaboratorCursorHighlight](self, "shouldShowCollaboratorCursorHighlight")
    && !-[CRLWPRep shouldAddCollaboratorLayerToOverlays](self, "shouldAddCollaboratorLayerToOverlays"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep collaboratorCursorRenderable](self, "collaboratorCursorRenderable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layer"));

    if (v12)
      objc_msgSend(v13, "addObject:", v12);

  }
}

- (BOOL)shouldShowEditMenu
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  unsigned int v10;
  char v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if (objc_msgSend(v3, "isCanvasInteractive"))
  {
    v4 = -[CRLWPRep isBeingEdited](self, "isBeingEdited");

    if ((v4 & 1) == 0)
      return 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textInputResponder"));
    v7 = objc_msgSend(v6, "scribbleInProgress");

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textSelectionDelegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectedTextRange"));
    v10 = objc_msgSend(v9, "isInsertionPointRange");
    v11 = v7 ^ 1;

    if (v10)
    {
      if (objc_msgSend(v3, "editMenuIsVisible"))
      {
        objc_msgSend(v3, "hideEditMenu");
LABEL_11:
        v11 = 0;
        -[CRLWPRep setShouldIgnoreFirstRequestToShowEditMenu:](self, "setShouldIgnoreFirstRequestToShowEditMenu:", 0);
        goto LABEL_7;
      }
      if (-[CRLWPRep shouldIgnoreFirstRequestToShowEditMenu](self, "shouldIgnoreFirstRequestToShowEditMenu"))
        goto LABEL_11;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_7:

  return v11;
}

- (void)refreshEditMenu
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  void *v19;
  id v20;
  void *v21;
  NSUInteger v22;
  void *v23;
  unsigned int v24;
  BOOL v25;
  void *v26;
  id range1;
  id range1a;
  _QWORD v29[5];
  NSRange v30;
  NSRange v31;
  NSRange v32;

  if (-[CRLWPRep isBeingEdited](self, "isBeingEdited"))
  {
    self->_hudStateDirty = 1;
    if (-[CRLWPRep p_isRedesignedTextCursorEnabled](self, "p_isRedesignedTextCursorEnabled"))
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textSelectionManager"));
      v5 = objc_msgSend(v4, "displayingSelectionView");

      if (!v5)
        return;
    }
    else if (-[CRLWPRepCaretController suppressCaret](self->_caretController, "suppressCaret"))
    {
      return;
    }
    range1 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    if (objc_msgSend(range1, "textGesturesInFlight"))
    {
LABEL_10:

      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    if (objc_msgSend(v6, "currentlyScrolling"))
    {

      goto LABEL_10;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v8 = objc_msgSend(v7, "layoutIsValid");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "columns"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastObject"));
      v13 = (void *)v12;
      if (!v11 || !v12)
        goto LABEL_24;
      v14 = objc_msgSend(v11, "range");
      v16 = v15;
      v32.location = (NSUInteger)objc_msgSend(v13, "range");
      v32.length = v17;
      v30.location = (NSUInteger)v14;
      v30.length = v16;
      v18 = NSUnionRange(v30, v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
      v20 = objc_msgSend(v19, "range");
      range1a = v21;
      v22 = (NSUInteger)v20;

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
      v24 = objc_msgSend(v23, "isInsertionPoint");

      if (v24)
      {
        v25 = v22 - v18.location < v18.length && v22 >= v18.location;
        if (!v25 && v18.location + v18.length != v22)
          goto LABEL_24;
      }
      else
      {
        v31.location = v22;
        v31.length = (NSUInteger)range1a;
        if (!NSIntersectionRange(v31, v18).length)
        {
LABEL_24:

          return;
        }
      }
      if (-[CRLWPRep shouldShowEditMenu](self, "shouldShowEditMenu", range1a))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10037535C;
        v29[3] = &unk_101231C50;
        v29[4] = self;
        objc_msgSend(v26, "performBlockOnMainThreadAfterLayoutIfNecessary:", v29);

        self->_hudStateDirty = 0;
      }
      goto LABEL_24;
    }
  }
}

- (void)updateFromLayout
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  CRLWPHighlightArrayController *highlightArrayController;
  double v10;
  double v11;
  void *v12;
  double v13;
  CRLWPHighlightArrayController *pulseArrayController;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 searchHitsAreInvalid;
  _BOOL4 v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep updateFromLayout](&v30, "updateFromLayout");
  if (-[CRLWPRep p_needsSpellChecker](self, "p_needsSpellChecker"))
  {
    if (!self->_spellChecker)
    {
      -[CRLWPRep range](self, "range");
      if (v3)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
        v5 = objc_msgSend(v4, "isInstructional");

        if ((v5 & 1) == 0)
          -[CRLWPRep p_createSpellChecker](self, "p_createSpellChecker");
      }
    }
  }
  else
  {
    -[CRLWPRep p_destroySpellChecker](self, "p_destroySpellChecker");
  }
  if (self->_selectionChanged)
  {
    -[CRLWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", self->_newSelectionFlags);
    -[CRLWPRep i_setNeedsDisplayForSelectionChange](self, "i_setNeedsDisplayForSelectionChange");
    self->_selectionChanged = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v7 = objc_msgSend(v6, "isRange");

  if (v7)
    -[CRLCanvasRep invalidateKnobPositions](self, "invalidateKnobPositions");
  if (self->_markChanged)
    -[CRLWPRep p_updateMarkHighlightLayer](self, "p_updateMarkHighlightLayer");
  highlightArrayController = self->_highlightArrayController;
  if (!highlightArrayController)
  {
    if (!self->_searchHitsAreInvalid)
      goto LABEL_18;
    goto LABEL_17;
  }
  -[CRLWPHighlightArrayController viewScale](highlightArrayController, "viewScale");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v12, "viewScale");
  if (v11 != v13)
  {

LABEL_17:
    -[CRLWPRep p_updateHighlights](self, "p_updateHighlights");
    goto LABEL_18;
  }
  searchHitsAreInvalid = self->_searchHitsAreInvalid;

  if (searchHitsAreInvalid)
    goto LABEL_17;
LABEL_18:
  pulseArrayController = self->_pulseArrayController;
  if (!pulseArrayController)
  {
    if (!self->_searchHitsAreInvalid)
      goto LABEL_23;
    goto LABEL_22;
  }
  -[CRLWPHighlightArrayController viewScale](pulseArrayController, "viewScale");
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v17, "viewScale");
  if (v16 != v18)
  {

LABEL_22:
    -[CRLWPRep p_updateAnimationWithAnimatingPulse:](self, "p_updateAnimationWithAnimatingPulse:", -[CRLWPHighlightArrayController shouldPulsate](self->_pulseArrayController, "shouldPulsate"));
    goto LABEL_23;
  }
  v29 = self->_searchHitsAreInvalid;

  if (v29)
    goto LABEL_22;
LABEL_23:
  if (self->_secondaryHighlightLayer)
    -[CRLWPRep p_updateSecondaryHighlightLayer](self, "p_updateSecondaryHighlightLayer");
  self->_searchHitsAreInvalid = 0;
  *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform11CRLWPLayout, v8).n128_u64[0];
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v19));
  v23 = sub_100221D0C(v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  LODWORD(v22) = -[CRLWPRep hasOverflowed](self, "hasOverflowed");
  if ((_DWORD)v22 != objc_msgSend(v24, "isOverflowing"))
  {
    -[CRLWPRep setHasOverflowed:](self, "setHasOverflowed:", objc_msgSend(v24, "isOverflowing"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "canvasController"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
    objc_msgSend(v26, "invalidateOverlayLayersForRep:", v27);

  }
}

- (CGRect)p_clipRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  CGRect v25;
  CGRect v26;
  CGRect result;
  CGRect v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11), "erasableBounds:", 0);
        v28.origin.x = v12;
        v28.origin.y = v13;
        v28.size.width = v14;
        v28.size.height = v15;
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v26 = CGRectUnion(v25, v28);
        x = v26.origin.x;
        y = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[CRLWPRep newTextLayerUnscaledBounds:forNewTextBounds:](self, "newTextLayerUnscaledBounds:forNewTextBounds:", x, y, width, height, x, y, width, height);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)clipRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep clipRect](&v7, "clipRect");
  -[CRLWPRep p_clipRect:](self, "p_clipRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)didUpdateRenderable:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  Swift::String v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _QWORD v33[4];
  id v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGAffineTransform v39;
  objc_super v40;
  Freeform::SyncEvent::FetchedRecordZoneChanges::Deletion v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep didUpdateRenderable:](&v40, "didUpdateRenderable:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layer"));
  if (!-[CRLCanvasRep isBeingRotated](self, "isBeingRotated")
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout")),
        v7 = objc_msgSend(v6, "wantsNormalLayoutDuringDynamicRotation"),
        v6,
        v7))
  {
    -[CRLWPRep p_clipRect:](self, "p_clipRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v17 = v16;
    if (v16)
      objc_msgSend(v16, "transformInRoot");
    else
      memset(&v39, 0, sizeof(v39));
    v42.origin.x = v9;
    v42.origin.y = v11;
    v42.size.width = v13;
    v42.size.height = v15;
    CGRectApplyAffineTransform(v42, &v39);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    objc_msgSend(v18, "frameInRoot");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v41 = SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v19, v20);
    objc_msgSend(v19, "convertUnscaledToBoundsRect:", v41.recordType._object);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

    v43.origin.x = v22;
    v43.origin.y = v24;
    v43.size.width = v26;
    v43.size.height = v28;
    v44 = CGRectIntegral(v43);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    if (!CGRectIsNull(v44) && (sub_1000637C8() & 1) == 0)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100375BF4;
      v33[3] = &unk_101255CA0;
      v35 = x;
      v36 = y;
      v37 = width;
      v38 = height;
      v34 = v5;
      -[CRLWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v33);

    }
  }
  if (objc_msgSend(v5, "edgeAntialiasingMask"))
    objc_msgSend(v5, "setEdgeAntialiasingMask:", 0);
  -[CRLWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);

}

- (CGRect)rectToClipChildRepRenderables
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  v22.receiver = self;
  v22.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep rectToClipChildRepRenderables](&v22, "rectToClipChildRepRenderables");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform11CRLWPLayout, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v12));
  v16 = sub_100221D0C(v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
  {
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    if (!CGRectIsNull(v23))
    {
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v25 = CGRectIntegral(v24);
      x = v25.origin.x;
      y = v25.origin.y;
      width = v25.size.width;
      height = v25.size.height;
    }
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)screenScaleDidChange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CAShapeLayer *caretLayer;
  CAShapeLayer *selectionParagraphBorderLayer;
  _QWORD v9[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep screenScaleDidChange](&v10, "screenScaleDidChange");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvas"));
  objc_msgSend(v4, "contentsScale");
  v6 = v5;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100375EA0;
  v9[3] = &unk_101255D00;
  *(double *)&v9[4] = v6;
  -[CRLWPRep performBlockOnTextLayers:](self, "performBlockOnTextLayers:", v9);
  caretLayer = self->_caretLayer;
  if (caretLayer)
    -[CAShapeLayer setContentsScale:](caretLayer, "setContentsScale:", v6);
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  if (selectionParagraphBorderLayer)
    -[CAShapeLayer setContentsScale:](selectionParagraphBorderLayer, "setContentsScale:", v6);
}

- (CGRect)newTextLayerUnscaledBounds:(CGRect)a3 forNewTextBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (Class)wpEditorClass
{
  return (Class)objc_opt_class(_TtC8Freeform11CRLWPEditor, a2);
}

- (void)beginEditing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionModelTranslator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLTextRange textRangeForEndOf:](_TtC8Freeform12CRLTextRange, "textRangeForEndOf:", v5));
  v7 = objc_msgSend(v6, "nsRange");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPathForRange:onStorage:", v7, v9, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v11, "setSelectionPath:withSelectionFlags:", v12, 4);

  -[CRLWPRep p_updateCaretLayerColor](self, "p_updateCaretLayerColor");
}

- (void)didBeginEditingWithTextEditor:(id)a3
{
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  *(_QWORD *)&v4 = objc_opt_class(CRLShapeRep, a2).n128_u64[0];
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v4));
  v8 = sub_100221D0C(v6, v7);
  v16 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = v16;
  if (v16)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shapeLayout"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fill"));
    v12 = objc_msgSend(v11, "isOpaque");

    v9 = v16;
    if ((v12 & 1) == 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shadow"));
      v14 = v13;
      if (v13)
        v15 = objc_msgSend(v13, "showForEditingText") ^ 1;
      else
        v15 = 0;
      objc_msgSend(v16, "setShadowOnChildrenDisabled:", v15);

      v9 = v16;
    }
  }

}

- (BOOL)canEditWithEditor:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class(_TtC8Freeform11CRLWPEditor, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    if (v10 == v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
      if (objc_msgSend(v13, "isInTopLevelContainerForEditing"))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
        v12 = objc_msgSend(v14, "isLocked") ^ 1;

      }
      else
      {
        LOBYTE(v12) = 0;
      }

    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (BOOL)p_canRepBeginEditingOnDoubleTap
{
  return 1;
}

- (id)smartFieldAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  if (objc_msgSend(v6, "layoutIsValid"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v8 = objc_msgSend(v7, "hasSmartFields");

    if (!v8)
    {
      v10 = 0;
      return v10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "columns"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn smartFieldWithAttributeKind:inColumnArray:atPoint:](CRLWPColumn, "smartFieldWithAttributeKind:inColumnArray:atPoint:", 6, v9, x, y));

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)p_updateSecondaryHighlightLayer
{
  NSUInteger location;
  NSUInteger length;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (self->_secondaryHighlightLayer)
  {
    location = self->_secondaryHighlightRange.location;
    length = self->_secondaryHighlightRange.length;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn pathForHighlightWithRange:columnArray:pathStyle:](CRLWPColumn, "pathForHighlightWithRange:columnArray:pathStyle:", location, length, v5, self->_secondaryHighlightPathStyle));

    -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    objc_msgSend(v6, "transformUsingAffineTransform:", &v8);
    v7 = objc_retainAutorelease(v6);
    -[CAShapeLayer setPath:](self->_secondaryHighlightLayer, "setPath:", objc_msgSend(v7, "CGPath"));

  }
}

- (void)setSecondaryHighlightRange:(_NSRange)a3 color:(CGColor *)a4 pathStyle:(int)a5
{
  _NSRange *p_secondaryHighlightRange;
  NSUInteger length;
  NSUInteger location;
  CAShapeLayer *secondaryHighlightLayer;
  CAShapeLayer *v13;
  CAShapeLayer *v14;
  CAShapeLayer *v15;
  id v16;

  p_secondaryHighlightRange = &self->_secondaryHighlightRange;
  if (a3.location != self->_secondaryHighlightRange.location || a3.length != self->_secondaryHighlightRange.length)
  {
    length = a3.length;
    if (a3.length)
    {
      location = a3.location;
      secondaryHighlightLayer = self->_secondaryHighlightLayer;
      if (!secondaryHighlightLayer)
      {
        v13 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        v14 = self->_secondaryHighlightLayer;
        self->_secondaryHighlightLayer = v13;

        -[CAShapeLayer setEdgeAntialiasingMask:](self->_secondaryHighlightLayer, "setEdgeAntialiasingMask:", 0);
        -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", self);
        secondaryHighlightLayer = self->_secondaryHighlightLayer;
      }
      -[CAShapeLayer setFillColor:](secondaryHighlightLayer, "setFillColor:", a4);
      p_secondaryHighlightRange->location = location;
      p_secondaryHighlightRange->length = length;
      self->_secondaryHighlightPathStyle = a5;
    }
    else
    {
      p_secondaryHighlightRange->location = 0;
      self->_secondaryHighlightRange.length = 0;
      -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", 0, 0, a4, *(_QWORD *)&a5);
      -[CAShapeLayer removeFromSuperlayer](self->_secondaryHighlightLayer, "removeFromSuperlayer");
      v15 = self->_secondaryHighlightLayer;
      self->_secondaryHighlightLayer = 0;

    }
    v16 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    objc_msgSend(v16, "invalidate");

  }
}

- (void)clearSecondaryHighlight
{
  -[CRLWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", 0, 0, 0, 0);
}

- (void)setHighlightedHyperlinkField:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = objc_msgSend(v4, "range");
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithWhite:alpha:](CRLColor, "colorWithWhite:alpha:", 0.300000012, 0.469999999));
  -[CRLWPRep setSecondaryHighlightRange:color:pathStyle:](self, "setSecondaryHighlightRange:color:pathStyle:", v5, v7, objc_msgSend(v8, "CGColor"), 2);

}

- (id)closestColumnForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "columns"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:](CRLWPColumn, "closestColumnInColumnsArray:forPoint:ignoreEmptyColumns:ignoreDrawableOnlyColumns:", v6, 1, 1, x, y));

  return v7;
}

- (id)columnForCharIndex:(unint64_t)a3
{
  void *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char *v13;
  void *i;
  void *v15;
  char *v16;
  unint64_t v17;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v6 = (char *)objc_msgSend(v5, "range");
  v8 = v7;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "columns"));

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v23;
    v13 = &v6[v8];
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v16 = (char *)objc_msgSend(v15, "range");
        if ((a3 < (unint64_t)v16 || a3 - (unint64_t)v16 >= v17)
          && (&v16[v17] != (char *)a3 || v13 != (char *)a3))
        {
          continue;
        }
        v20 = v15;
        goto LABEL_20;
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v20 = 0;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_20:

  return v20;
}

- (BOOL)isBeingEdited
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v4 = objc_msgSend(v3, "isCanvasInteractive");

  if (!v4)
    return 0;
  *(_QWORD *)&v6 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v5).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", v6));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textInputEditor"));
  v12 = sub_100221D0C(v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "storage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v16 = v14 == v15;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)isDropTarget
{
  unsigned __int8 v3;
  void *v4;

  if (-[CRLCanvasRep shouldShowDragAndDropHighlight](self, "shouldShowDragAndDropHighlight"))
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep dropSelection](self, "dropSelection"));
  v3 = objc_msgSend(v4, "isValid");

  return v3;
}

- (CGSize)hitTestingSlop
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v2, "convertBoundsToUnscaledSize:", 20.0, 2.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8Freeform11CRLWPEditor)textEditor
{
  uint64_t v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  if (-[CRLWPRep isBeingEdited](self, "isBeingEdited"))
  {
    *(_QWORD *)&v4 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v3).n128_u64[0];
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textInputEditor"));
    v10 = sub_100221D0C(v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  else
  {
    v11 = 0;
  }
  return (_TtC8Freeform11CRLWPEditor *)v11;
}

- (void)handleFadeOutForZoom
{
  -[CRLWPRepCaretController setSuppressCaret:](self->_caretController, "setSuppressCaret:", 1);
  -[CRLWPRep hideCaretLayer](self, "hideCaretLayer");
  -[CRLWPRep p_hideCollaboratorCursorLayer](self, "p_hideCollaboratorCursorLayer");
  -[CRLWPRep setShouldIgnoreFirstRequestToShowEditMenu:](self, "setShouldIgnoreFirstRequestToShowEditMenu:", 1);
}

- (void)handleFadeInForZoom
{
  -[CRLWPRep p_updateSecondaryHighlightLayer](self, "p_updateSecondaryHighlightLayer");
  -[CRLWPRepCaretController setSuppressCaret:](self->_caretController, "setSuppressCaret:", 0);
  if (!self->_caretAnimationDisabled)
    self->_selectionChanged = 1;
  -[CRLWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
  -[CRLWPRep setShouldIgnoreFirstRequestToShowEditMenu:](self, "setShouldIgnoreFirstRequestToShowEditMenu:", 1);
  -[CRLWPRep refreshEditMenu](self, "refreshEditMenu");
  -[CRLWPRep p_showCollaboratorCursorLayer](self, "p_showCollaboratorCursorLayer");
}

- (void)gesturesDidEnd:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRLTextGesturesTerminated")));
  v12 = sub_100221DDC(v5, 1, v6, v7, v8, v9, v10, v11, (uint64_t)&OBJC_PROTOCOL___CRLGesture);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);

  if (objc_msgSend(v13, "inputType"))
    -[CRLWPRep refreshEditMenu](self, "refreshEditMenu");

}

- (void)p_addLiftAnimationToFloatingCursor
{
  -[CRLWPRepHelper addLiftAnimationToFloatingCursor:floatingCaretLayer:](self->_repHelper, "addLiftAnimationToFloatingCursor:floatingCaretLayer:", self->_caretLayer, self->_floatingCaretLayer);
}

- (void)p_addDropAnimationToFloatingCursorWithEndingRep:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  CGAffineTransform v41;
  _QWORD v42[2];
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  objc_msgSend(v5, "position");
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v11 = objc_msgSend(v10, "start");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  objc_msgSend(v4, "caretRectForCharIndex:caretAffinity:", v11, objc_msgSend(v12, "caretAffinity"));
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v43.origin.x = v14;
  v43.origin.y = v16;
  v43.size.width = v18;
  v43.size.height = v20;
  if (!CGRectIsNull(v43))
  {
    objc_msgSend(v4, "convertNaturalRectToUnscaledCanvas:", v14, v16, v18, v20);
    -[CRLCanvasRep convertNaturalRectFromUnscaledCanvas:](self, "convertNaturalRectFromUnscaledCanvas:");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
    v44.origin.x = v22;
    v44.origin.y = v24;
    v44.size.width = v26;
    v44.size.height = v28;
    v45 = CGRectApplyAffineTransform(v44, &v41);
    x = v45.origin.x;
    y = v45.origin.y;
    width = v45.size.width;
    height = v45.size.height;
    MidX = CGRectGetMidX(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    MidY = CGRectGetMidY(v46);
    +[CATransaction begin](CATransaction, "begin");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("position")));
    objc_msgSend(v35, "setDelegate:", self);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v7, v9));
    v42[0] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", MidX, MidY));
    v42[1] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
    objc_msgSend(v35, "setValues:", v38);

    objc_msgSend(v35, "setRemovedOnCompletion:", 0);
    objc_msgSend(v35, "setDuration:", 0.25);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
    objc_msgSend(v39, "addAnimation:forKey:", v35, CFSTR("dropAnimation"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
    objc_msgSend(v40, "setPosition:", MidX, MidY);

    +[CATransaction commit](CATransaction, "commit");
  }

}

- (BOOL)ghostCaretAppearance
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep overrideCaretColor](self, "overrideCaretColor"));
  v3 = v2 != 0;

  return v3;
}

- (void)setGhostCaretAppearance:(BOOL)a3
{
  void *v4;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRepHelper colorForGhostCaret](self->_repHelper, "colorForGhostCaret"));
    -[CRLWPRep setOverrideCaretColor:](self, "setOverrideCaretColor:", v4);

  }
  else
  {
    -[CRLWPRep setOverrideCaretColor:](self, "setOverrideCaretColor:", 0);
  }
  -[CRLWPRep p_updateCaretLayerColor](self, "p_updateCaretLayerColor");
}

- (void)updateCaretColorForFloatingCursorInFlight
{
  -[CRLWPRep setGhostCaretAppearance:](self, "setGhostCaretAppearance:", 1);
}

- (void)updateCaretColorForFinishedFloatingCursor
{
  -[CRLWPRep setGhostCaretAppearance:](self, "setGhostCaretAppearance:", 0);
}

- (void)suppressCaret:(BOOL)a3
{
  -[CRLWPRepCaretController setSuppressCaret:](self->_caretController, "setSuppressCaret:", a3);
}

- (void)textInteractionCaretBeganFloating
{
  -[CRLWPRep suppressCaret:](self, "suppressCaret:", 0);
  -[CRLWPRepCaretController showCaretLayerStartingAnimation](self->_caretController, "showCaretLayerStartingAnimation");
  -[CRLWPRep updateCaretColorForFloatingCursorInFlight](self, "updateCaretColorForFloatingCursorInFlight");
}

- (void)textInteractionCaretEndedFloating
{
  -[CRLWPRep updateCaretColorForFinishedFloatingCursor](self, "updateCaretColorForFinishedFloatingCursor");
  -[CRLWPRep suppressCaret:](self, "suppressCaret:", 1);
  -[CRLWPRepCaretController hideCaretLayer](self->_caretController, "hideCaretLayer");
}

- (void)textInteractionCaretDragStopped
{
  -[CRLWPRep suppressCaret:](self, "suppressCaret:", 0);
  -[CRLWPRepCaretController showCaretLayerStartingAnimation](self->_caretController, "showCaretLayerStartingAnimation");
  -[CRLWPRep updateCaretColorForFinishedFloatingCursor](self, "updateCaretColorForFinishedFloatingCursor");
  -[CRLWPRep enableCaretAnimation](self, "enableCaretAnimation");
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC8Freeform14CRLWPRepHelper *repHelper;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.26, 0.42, 0.95, 1.0));
  v9 = objc_msgSend(v8, "CGColor");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_caretLayerWithZPosition:](self, "p_caretLayerWithZPosition:", 1.0));
  -[CRLWPRep setFloatingCaretLayer:](self, "setFloatingCaretLayer:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  objc_msgSend(v11, "setBackgroundColor:", v9);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  -[CRLWPRep p_positionAndSizeFloatingCaret:atPoint:](self, "p_positionAndSizeFloatingCaret:atPoint:", v12, x, y);

  repHelper = self->_repHelper;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  -[CRLWPRepHelper cornerRadiusForFloatingCaret:](repHelper, "cornerRadiusForFloatingCaret:", v14);
  v16 = v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  objc_msgSend(v17, "setCornerRadius:", v16);

  -[CRLWPRep updateCaretColorForFloatingCursorInFlight](self, "updateCaretColorForFloatingCursorInFlight");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v18, "invalidateOverlayLayersForRep:", self);

  if (v4)
    -[CRLWPRep p_addLiftAnimationToFloatingCursor](self, "p_addLiftAnimationToFloatingCursor");
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;

  y = a3.y;
  x = a3.x;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  -[CRLWPRep p_positionAndSizeFloatingCaret:atPoint:](self, "p_positionAndSizeFloatingCaret:atPoint:", x, y);

}

- (void)endFloatingCursorWithRepForAnimation:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));

  if (v4)
  {
    -[CRLWPRep updateCaretColorForFinishedFloatingCursor](self, "updateCaretColorForFinishedFloatingCursor");
    if (v8
      && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection")),
          v6 = objc_msgSend(v5, "isInsertionPoint"),
          v5,
          v6))
    {
      -[CRLWPRep p_addDropAnimationToFloatingCursorWithEndingRep:](self, "p_addDropAnimationToFloatingCursorWithEndingRep:", v8);
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
      objc_msgSend(v7, "removeFromSuperlayer");

      -[CRLWPRep setFloatingCaretLayer:](self, "setFloatingCaretLayer:", 0);
    }
    -[CRLWPRep enableCaretAnimation](self, "enableCaretAnimation");
  }

}

- (BOOL)selectionChangeWasLocal
{
  return (self->_newSelectionFlags & 0x800) == 0 && self->_selectionChanged;
}

- (BOOL)caretBlinks
{
  return -[CRLWPRepCaretController caretAnimates](self->_caretController, "caretAnimates");
}

- (void)setCaretBlinks:(BOOL)a3
{
  -[CRLWPRepCaretController setCaretAnimates:](self->_caretController, "setCaretAnimates:", a3);
}

- (void)disableCaretAnimation
{
  -[CRLWPRepCaretController setCaretAnimates:](self->_caretController, "setCaretAnimates:", 0);
}

- (void)enableCaretAnimation
{
  -[CRLWPRepCaretController setCaretAnimates:](self->_caretController, "setCaretAnimates:", 1);
}

- (void)willEnterForeground
{
  -[CRLWPRepCaretController willEnterForeground](self->_caretController, "willEnterForeground");
}

- (void)didEnterBackground
{
  -[CRLWPRepCaretController didEnterBackground](self->_caretController, "didEnterBackground");
}

- (void)pulseCaret
{
  CRLPulseAnimationController *caretPulseController;
  CGPath *Mutable;
  double y;
  double height;
  CGFloat x;
  double v8;
  void *v9;
  CRLPulseAnimationController *v10;
  CRLPulseAnimationController *v11;
  void *v12;
  void *v13;
  CRLPulseAnimationController *v14;
  void *v15;
  CRLPulseAnimationController *v16;
  void *v17;
  double v18;
  void *v19;
  uint64_t v20;
  _OWORD v21[3];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CGRect v25;

  caretPulseController = self->_caretPulseController;
  if (caretPulseController)
  {
    self->_caretPulseController = 0;

  }
  Mutable = CGPathCreateMutable();
  -[CRLWPRep caretRect](self, "caretRect");
  y = v25.origin.y;
  height = v25.size.height;
  v25.size.width = 2.0;
  v25.origin.x = v8 + -1.0;
  x = v25.origin.x;
  CGPathAddRect(Mutable, 0, v25);
  LOWORD(v20) = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", 0, 1, 1, 1, 1, 0, x, y, 2.0, height, v20));
  v10 = -[CRLPulseAnimationController initWithDelegate:]([CRLPulseAnimationController alloc], "initWithDelegate:", self);
  v11 = self->_caretPulseController;
  self->_caretPulseController = v10;

  -[CRLPulseAnimationController setAutohide:](self->_caretPulseController, "setAutohide:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "transformInRoot");
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
  }
  v14 = self->_caretPulseController;
  v21[0] = v22;
  v21[1] = v23;
  v21[2] = v24;
  -[CRLHighlightController setTransform:](v14, "setTransform:", v21);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v15, "viewScale");
  -[CRLHighlightController setViewScale:](self->_caretPulseController, "setViewScale:");

  -[CRLPulseAnimationController setDuration:](self->_caretPulseController, "setDuration:", 0.05);
  -[CRLPulseAnimationController setPulseOffset:](self->_caretPulseController, "setPulseOffset:", 4.0);
  v16 = self->_caretPulseController;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v17, "contentsScale");
  -[CRLHighlightController createLayerWithZOrder:contentsScaleForLayers:](v16, "createLayerWithZOrder:contentsScaleForLayers:", 8.0, v18);

  -[CRLHighlightController buildLayersForPath:withImage:](self->_caretPulseController, "buildLayersForPath:withImage:", Mutable, v9);
  -[CRLPulseAnimationController startAnimating](self->_caretPulseController, "startAnimating");
  CGPathRelease(Mutable);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v19, "canvasInvalidatedForRep:", self);

}

- (BOOL)containsStartOfSelection:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  uint64_t v7;
  unsigned __int8 v8;
  _BYTE *v9;
  _BYTE *v10;
  unint64_t v11;
  char *v13;
  void *v14;
  char *v15;

  v4 = a3;
  if (objc_msgSend(v4, "isInsertionPoint"))
  {
    v5 = (char *)objc_msgSend(v4, "start");
    v6 = (char *)-[CRLWPRep range](self, "range");
    if (v5 == v6)
    {
      v8 = objc_msgSend(v4, "caretAffinity") == 0;
      goto LABEL_20;
    }
    v13 = &v6[v7];
    if (v6 < v5 && v5 < v13
      || v5 == v13
      && (objc_msgSend(v4, "caretAffinity") == (id)1
       || (v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage")),
           v15 = (char *)objc_msgSend(v14, "length"),
           v14,
           v5 == v15)))
    {
      v8 = 1;
      goto LABEL_20;
    }
    if (v13 < v5)
    {
      v8 = -[CRLWPRep isOverflowing](self, "isOverflowing");
      goto LABEL_20;
    }
LABEL_19:
    v8 = 0;
    goto LABEL_20;
  }
  if (!objc_msgSend(v4, "isRange"))
    goto LABEL_19;
  v9 = objc_msgSend(v4, "start");
  v10 = -[CRLWPRep range](self, "range");
  v8 = v9 >= v10 && v9 - v10 < v11;
LABEL_20:

  return v8;
}

- (BOOL)p_doesRep:(id)a3 containCharIndex:(unint64_t)a4 isStart:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  BOOL v10;

  v5 = a5;
  v7 = objc_msgSend(a3, "range");
  if (v5 && (unint64_t)v7 <= a4)
    return (unint64_t)v7 + v8 > a4;
  v10 = (unint64_t)v7 + v8 >= a4;
  if ((unint64_t)v7 >= a4)
    v10 = 0;
  return !v5 && v10;
}

- (id)repForCharIndex:(unint64_t)a3 isStart:(BOOL)a4
{
  _BOOL8 v4;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a4;
  if (-[CRLWPRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", self, a3, a4))
    return self;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep siblings](self, "siblings", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (-[CRLWPRep p_doesRep:containCharIndex:isStart:](self, "p_doesRep:containCharIndex:isStart:", v12, a3, v4))
        {
          v13 = v12;

          return v13;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }

  return 0;
}

- (id)siblings
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  CRLWPRep *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v5 = objc_msgSend(v4, "wpKind");

  if (!v5)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childReps"));

    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(CRLWPRep **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v11);
          if (v12 != self)
          {
            objc_opt_class(CRLWPRep, v8);
            v14 = sub_100221D0C(v13, v12);
            v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "storage"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
            v18 = v16 == v17;

            if (v18)
              objc_msgSend(v3, "addObject:", v15);

          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

  }
  return v3;
}

- (id)repForDragging
{
  CRLCanvasRep *v4;
  objc_super v5;

  if (-[CRLWPRep isBeingEdited](self, "isBeingEdited"))
    return 0;
  v5.receiver = self;
  v5.super_class = (Class)CRLWPRep;
  v4 = -[CRLCanvasRep repForDragging](&v5, "repForDragging");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)shouldPreventMarqueeInitiationAtPoint:(CGPoint)a3 withTouchType:(int64_t)a4
{
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  BOOL v12;
  void *v13;
  objc_super v15;

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSCVC"));
  v11 = objc_msgSend(v10, "isCurrentlyInQuickSelectMode");

  if (v11)
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLWPRep;
    return -[CRLCanvasRep shouldPreventMarqueeInitiationAtPoint:withTouchType:](&v15, "shouldPreventMarqueeInitiationAtPoint:withTouchType:", a4, x, y);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    if (objc_msgSend(v13, "wpKind"))
      v12 = -[CRLWPRep isBeingEdited](self, "isBeingEdited");
    else
      v12 = 1;

  }
  return v12;
}

- (id)hyperlinkContainerRep
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char isKindOfClass;
  CRLCanvasRep *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  objc_opt_class(CRLWPShapeRep, v4);
  isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLWPRep;
    v7 = -[CRLCanvasRep repForSelecting](&v10, "repForSelecting");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)wantsToHandleTapsOnBehalfOfRepForSelecting
{
  return 1;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)wantsContextMenuWhenEditingDisabledAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;

  y = a3.y;
  x = a3.x;
  *(_QWORD *)&v6 = objc_opt_class(CRLShapeRep, a2).n128_u64[0];
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v6));
  v10 = sub_100221D0C(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  LOBYTE(v9) = objc_msgSend(v11, "wantsContextMenuWhenEditingDisabledAtPoint:", x, y);
  return (char)v9;
}

- (CRLWPLayoutTarget)layout
{
  CRLCanvasLayout *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLWPRep;
  v2 = -[CRLCanvasRep layout](&v14, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(CRLCanvasLayout, v4);
  v11 = sub_1002220C8(v3, v5, 1, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLWPLayoutTarget);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return (CRLWPLayoutTarget *)v12;
}

- (_TtC8Freeform12CRLWPStorage)storage
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  double v10;
  objc_class *v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform11CRLWPLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v9).n128_u64[0];
  v12 = v11;
  if (v8)
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage", v10));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep info](self, "info", v10));
  v14 = sub_1002223BC(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  return (_TtC8Freeform12CRLWPStorage *)v15;
}

- (NSArray)columns
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "columns"));

  return (NSArray *)v3;
}

- (CRLWPSelection)selection
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
  v3 = v2;
  if (v2)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selection"));
  else
    v4 = 0;

  return (CRLWPSelection *)v4;
}

- (void)addKnobsToArray:(id)a3
{
  void *v4;
  unsigned int v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char v13;
  char v14;
  void *v15;
  void *i;
  void *v17;
  void *v18;
  BOOL v19;
  _BYTE *v20;
  unint64_t v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v26 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v5 = objc_msgSend(v4, "layoutIsValid");

  if (v5 && -[CRLWPRep shouldCreateTextKnobs](self, "shouldCreateTextKnobs"))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
    v6 = objc_msgSend(v25, "wantsParagraphMode");
    v7 = objc_msgSend(v25, "knobTracking");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    if (objc_msgSend(v24, "headCharIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
      v27 = objc_msgSend(v24, "start");
    else
      v27 = objc_msgSend(v24, "headCharIndex");
    v8 = objc_msgSend(v24, "tailCharIndex");
    if (v8 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_msgSend(v24, "end");
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
        v8 = (_BYTE *)sub_1001AEAA8((unint64_t)v8, v9);

      }
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v29;
      v13 = v6 ^ 1;
      if (!v25)
        v13 = 1;
      v14 = v13 | v7 ^ 1;
      v15 = v10;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
          if (objc_msgSend(v17, "lineFragmentForCharIndex:knobTag:selectionType:", v27, 11, objc_msgSend(v18, "type")))
          {
            if ((v14 & 1) != 0)
            {

            }
            else
            {
              v19 = objc_msgSend(v25, "knobTag") == (id)11;

              if (!v19)
                goto LABEL_22;
            }
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep knobClassWithTag:](self, "knobClassWithTag:", 11));
            objc_msgSend(v26, "addObject:", v18);
          }

LABEL_22:
          v10 = v15;
          v20 = objc_msgSend(v17, "range");
          v22 = v8 < v20 || v8 - v20 >= v21;
          if (!v22 && ((v14 & 1) != 0 || objc_msgSend(v25, "knobTag") == (id)10))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep knobClassWithTag:](self, "knobClassWithTag:", 10));
            objc_msgSend(v26, "addObject:", v23);

            v10 = v15;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v11);
    }

  }
}

- (id)knobClassWithTag:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep knobPositioner](self, "knobPositioner"));
  objc_msgSend(v5, "knobRadius");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v8, "viewScale");
  v10 = v7 * v9;

  return -[CRLWPTextKnob initWithType:position:radius:tag:onRep:]([CRLWPTextKnob alloc], "initWithType:position:radius:tag:onRep:", 2, a3, self, CGPointZero.x, CGPointZero.y, v10);
}

- (void)updatePositionsOfKnobs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection", (_QWORD)v10));
        -[CRLWPRep knobCenterForSelection:knob:](self, "knobCenterForSelection:knob:", v9, v8);
        objc_msgSend(v8, "setPosition:");

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)shouldCreateSelectionKnobs
{
  return 0;
}

- (BOOL)shouldCreateLockedKnobs
{
  return 0;
}

- (BOOL)shouldCreateTextKnobs
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  if (!-[CRLWPRep isBeingEdited](self, "isBeingEdited")
    || !-[CRLWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers"))
  {
    return 0;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep knobPositioner](self, "knobPositioner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v6 = objc_msgSend(v3, "shouldCreateKnobsForSelection:inStorage:", v4, v5);

  return v6;
}

- (CGRect)labelRectForCharIndex:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
  +[CRLWPColumn labelRectForCharIndex:withColumns:](CRLWPColumn, "labelRectForCharIndex:withColumns:", a3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)columnRectForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
  +[CRLWPColumn columnRectForRange:withColumns:](CRLWPColumn, "columnRectForRange:withColumns:", location, length, v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)glyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  NSRange v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  NSUInteger v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  NSRange v34;
  CGRect v35;
  CGRect v36;
  CGRect result;
  CGRect v38;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        v16.location = (NSUInteger)objc_msgSend(v15, "range");
        if (length)
          v17 = v16.length == 0;
        else
          v17 = 1;
        v18 = v17;
        v34.location = location;
        v34.length = length;
        v20 = sub_1001E966C(v16, v34, v18);
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v15, "glyphRectForRange:includingLabel:", v20, v19, v4);
          v38.origin.x = v21;
          v38.origin.y = v22;
          v38.size.width = v23;
          v38.size.height = v24;
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          v36 = CGRectUnion(v35, v38);
          x = v36.origin.x;
          y = v36.origin.y;
          width = v36.size.width;
          height = v36.size.height;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (unsigned)fontTraitsForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger length;
  NSUInteger location;
  void *v7;
  unsigned int v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSRange v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  NSUInteger v17;
  unsigned int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  NSRange v25;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v8 = 0;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v13.location = (NSUInteger)objc_msgSend(v12, "range");
        if (length)
          v14 = v13.length == 0;
        else
          v14 = 1;
        v15 = v14;
        v25.location = location;
        v25.length = length;
        v17 = sub_1001E966C(v13, v25, v15);
        if (v17 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v18 = objc_msgSend(v12, "fontTraitsForRange:includingLabel:", v17, v16, v4);
          if (v8)
          {
            if (v8 != v18)
              v8 = (v18 | v8) & 0xFFFFFFF;
          }
          else
          {
            v8 = v18;
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  return v8;
}

- (unint64_t)glyphCountForRubyFieldAtCharIndex:(unint64_t)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = objc_msgSend(v8, "range");
        if (a3 >= (unint64_t)v9 && a3 - (unint64_t)v9 < v10)
        {
          v12 = (unint64_t)objc_msgSend(v8, "glyphCountForRubyFieldAtCharIndex:", a3);
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_14:

  return v12;
}

- (CGRect)glyphRectForRubyFieldAtCharIndex:(unint64_t)a3 glyphRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  unint64_t v17;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  CGRect result;

  length = a4.length;
  location = a4.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        v16 = objc_msgSend(v15, "range");
        if (a3 >= (unint64_t)v16 && a3 - (unint64_t)v16 < v17)
        {
          objc_msgSend(v15, "glyphRectForRubyFieldAtCharIndex:glyphRange:", a3, location, length);
          x = v19;
          y = v20;
          width = v21;
          height = v22;
          goto LABEL_13;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v12);
  }
LABEL_13:

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

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;
  NSRange v12;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = 0;
  if (self->_spellChecker)
  {
    if (-[CRLWPRep p_spellCheckingEnabled](self, "p_spellCheckingEnabled"))
    {
      v3 = (NSUInteger)-[CRLWPStorageSpellChecker rangeOfMisspelledWordAtCharIndex:](self->_spellChecker, "rangeOfMisspelledWordAtCharIndex:", a3);
      v4 = v7;
      v12.location = v3;
      v12.length = v7;
      sub_1001E9700(self->_suppressedMisspellingRange, v12);
      if (v8)
      {
        v3 = 0x7FFFFFFFFFFFFFFFLL;
        v4 = 0;
      }
    }
  }
  v9 = v3;
  v10 = v4;
  result.length = v10;
  result.location = v9;
  return result;
}

- (CGRect)p_convertNaturalRectToRotated:(CGRect)a3 repAngle:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  unsigned int v9;
  long double v10;
  long double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[CRLWPRep textIsVertical](self, "textIsVertical");
  if (v9)
    a4 = fmod(a4 + 270.0, 360.0);
  if ((a4 <= 45.0 || a4 >= 135.0) && (a4 <= 225.0 || a4 >= 315.0))
  {
    v10 = width;
    v11 = height;
  }
  else
  {
    v10 = height;
    v11 = width;
  }
  v12 = hypot(v11, v10);
  if (v9)
    v13 = v12;
  else
    v13 = v10;
  if (v9)
    v14 = v11;
  else
    v14 = v12;
  v15 = -0.0;
  if (a4 <= 180.0)
    v16 = -0.0;
  else
    v16 = width;
  v17 = x + v16;
  if (a4 < 270.0 && a4 > 90.0)
    v15 = height;
  v19 = y + v15;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v19;
  result.origin.x = v17;
  return result;
}

- (BOOL)p_allowCaretForSelection:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  unsigned __int8 v7;
  BOOL v8;
  char *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v14;
  uint64_t v15;
  void *v16;

  v4 = a3;
  v5 = (char *)objc_msgSend(v4, "range");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v7 = objc_msgSend(v6, "hasMarkedText");

  if ((v7 & 1) == 0)
  {
    if (!objc_msgSend(v4, "isInsertionPoint")
      || ((v9 = (char *)-[CRLWPRep range](self, "range"), v5 < v9) || v5 - v9 >= v10)
      && (v11 = (char *)-[CRLWPRep range](self, "range"), v5 != &v11[v12])
      || v5 == -[CRLWPRep range](self, "range") && (objc_msgSend(v4, "isAtEndOfLine") & 1) != 0)
    {
      v8 = 0;
      goto LABEL_10;
    }
    v14 = (char *)-[CRLWPRep range](self, "range");
    if (v5 == &v14[v15] && (objc_msgSend(v4, "isAtEndOfLine") & 1) == 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
      objc_msgSend(v16, "length");

    }
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (void)p_updateLayersForInsertionPointSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CRLWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
  -[CRLWPRep p_hideSelectionHighlightLayer](self, "p_hideSelectionHighlightLayer");
  -[CRLWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
  if (-[CRLWPRep p_isRedesignedTextCursorEnabled](self, "p_isRedesignedTextCursorEnabled"))
    goto LABEL_9;
  if (objc_msgSend(v5, "wantsCaret"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "layerHost"));
    objc_msgSend(v7, "isInFocusedContainer");

  }
  if (!-[CRLWPRep p_allowCaretForSelection:](self, "p_allowCaretForSelection:", v4))
    goto LABEL_9;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorHelper"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calculateVisualRunsFromSelection:updateControllerSelection:", v4, 1));

  if (!-[CRLWPRep p_positionCaretLayer:forSelection:layerRelative:](self, "p_positionCaretLayer:forSelection:layerRelative:", self->_caretLayer)|| !-[CRLWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers"))
  {
    v4 = v9;
LABEL_9:
    -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self->_caretController, "stopCaretLayerAnimationHidingCaret:", 1);
    v9 = v4;
    goto LABEL_10;
  }
  -[CRLWPRepCaretController showCaretLayerStartingAnimation](self->_caretController, "showCaretLayerStartingAnimation");
LABEL_10:

}

- (id)p_imageForRect:(CGRect)a3 usingGlyphRect:(BOOL)a4 prepareBackground:(BOOL)a5 drawBackground:(BOOL)a6 shouldPulsate:(BOOL)a7 forCaret:(BOOL)a8 drawSelection:(id)a9 suppressInvisibles:(BOOL)a10 suppressChildReps:(BOOL)a11
{
  _BOOL4 v11;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGContext *v27;
  CGContext *v28;
  uint64_t v29;
  CGImage *Image;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v11 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v18 = a9;
  memset(&v41, 0, sizeof(v41));
  -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  v40 = v41;
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  v43 = CGRectApplyAffineTransform(v42, &v40);
  v44 = CGRectIntegral(v43);
  v45 = CGRectInset(v44, -0.0, -0.0);
  v19 = v45.origin.x;
  v20 = v45.origin.y;
  v21 = v45.size.width;
  v22 = v45.size.height;
  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v24 = v23;
  v25 = sub_1000603DC(v21, v22, v23);
  v27 = sub_10040FA64(11, v25, v26);
  v28 = v27;
  if (v27)
  {
    CGContextScaleCTM(v27, v24, v24);
    CGContextTranslateCTM(v28, -v19, -v20);
    -[CRLCanvasRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", 0, v28);
    CGContextSetShouldAntialias(v28, 1);
    if (v18 || !a5)
    {
      CGContextSaveGState(v28);
      if (v11)
        v29 = 3;
      else
        v29 = 33;
      LOBYTE(v39) = a10;
      -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", 0, v28, v18, 0x7FFFFFFFFFFFFFFFLL, 0, v29, v39);
      CGContextRestoreGState(v28);
    }
    -[CRLWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", 0, v28);
    Image = CGBitmapContextCreateImage(v28);
    if (Image)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0, v24));
      CGImageRelease(Image);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255D60);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E27D4C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255D80);
      v35 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:]"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v36, v37, 2479, 0, "invalid nil value for '%{public}s'", "ctxImage");

      v31 = 0;
    }
    CGContextRelease(v28);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255D20);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27CC0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255D40);
    v32 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:]"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v33, v34, 2452, 0, "invalid nil value for '%{public}s'", "ctx");

    v31 = 0;
  }

  return v31;
}

- (id)p_imageForZeroLengthPath:(CGPath *)a3
{
  void *v5;
  void *v6;
  void *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGContext *v20;
  CGContext *v21;
  CGImage *Image;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CGAffineTransform v31;
  CGAffineTransform v32;
  CGRect PathBoundingBox;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  if (!a3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255DA0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27EE4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255DC0);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 2492, 0, "invalid nil value for '%{public}s'", "path");

  }
  PathBoundingBox = CGPathGetPathBoundingBox(a3);
  x = PathBoundingBox.origin.x;
  y = PathBoundingBox.origin.y;
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  memset(&v32, 0, sizeof(v32));
  -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
  v31 = v32;
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  v35 = CGRectApplyAffineTransform(v34, &v31);
  v36 = CGRectIntegral(v35);
  v12 = v36.origin.x;
  v13 = v36.origin.y;
  v14 = v36.size.width;
  v15 = v36.size.height;
  +[UIScreen crl_screenScale](UIScreen, "crl_screenScale");
  v17 = v16;
  v18 = sub_1000603DC(v14, v15, v16);
  v20 = sub_10040FA64(11, v18, v19);
  v21 = v20;
  if (v20)
  {
    CGContextScaleCTM(v20, v17, v17);
    CGContextTranslateCTM(v21, -v12, -v13);
    -[CRLCanvasRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", 0, v21);
    CGContextSetShouldAntialias(v21, 1);
    CGContextBeginTransparencyLayer(v21, 0);
    CGContextEndTransparencyLayer(v21);
    -[CRLWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", 0, v21);
    Image = CGBitmapContextCreateImage(v21);
    if (Image)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage imageWithCGImage:scale:orientation:](CRLImage, "imageWithCGImage:scale:orientation:", Image, 0, v17));
      CGImageRelease(Image);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255E20);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E27E58();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255E40);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 2526, 0, "invalid nil value for '%{public}s'", "ctxImage");

      v23 = 0;
    }
    CGContextRelease(v21);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255DE0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27DD8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255E00);
    v24 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_imageForZeroLengthPath:]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v25, v26, 2507, 0, "Nil context");

    v23 = 0;
  }
  return v23;
}

- (id)textImageForSelection:(id)a3 frame:(CGRect *)a4 usingGlyphRect:(BOOL)a5 shouldPulsate:(BOOL)a6 suppressInvisibles:(BOOL)a7 suppressChildReps:(BOOL)a8 drawBackground:(BOOL)a9 inset:(double)a10
{
  _BOOL8 v13;
  _BOOL4 v14;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  _QWORD *v45;
  CGSize v46;
  void *v47;
  uint64_t v49;
  _QWORD v50[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  __n128 (*v54)(uint64_t, uint64_t);
  uint64_t (*v55)();
  void *v56;
  CGRect v57;

  v13 = a6;
  v14 = a5;
  v17 = a3;
  v18 = v17;
  v51 = 0;
  v52 = &v51;
  v53 = 0x5012000000;
  v54 = sub_10037A2E4;
  v55 = nullsub_43;
  v56 = &unk_1010E66AB;
  if (!v14)
    goto LABEL_10;
  if (objc_msgSend(v17, "type") == (id)7 && (unint64_t)objc_msgSend(v18, "visualRangeCount") >= 2)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "visualRanges"));
    v20 = objc_msgSend(v19, "rangeAtIndex:", 0);
    -[CRLWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v20, v21, 0);
    v22 = v52;
    v52[6] = v23;
    v22[7] = v24;
    v22[8] = v25;
    v22[9] = v26;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "visualRanges"));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_10037A2F4;
    v50[3] = &unk_101255E68;
    v50[4] = self;
    v50[5] = &v51;
    objc_msgSend(v27, "enumerateRanges:", v50);

    v28 = v52[6];
    v29 = v52[7];
    v30 = v52[8];
    v31 = v52[9];
  }
  else
  {
    v32 = objc_msgSend(v18, "superRange");
    v34 = v33;
    v35 = objc_msgSend(v18, "type") == (id)2 || (unint64_t)(objc_msgSend(v18, "type") == (id)1);
    -[CRLWPRep glyphRectForRange:includingLabel:](self, "glyphRectForRange:includingLabel:", v32, v34, v35);
    v36 = v52;
    v52[6] = v28;
    v36[7] = v29;
    v36[8] = v30;
    v36[9] = v31;
  }
  if (!CGRectIsEmpty(*(CGRect *)&v28))
  {
    v37 = v52[6];
    v38 = v52[7];
    v39 = v52[8];
    v40 = v52[9];
    v41 = 1;
  }
  else
  {
LABEL_10:
    -[CRLWPRep rectForSelection:includeRuby:includePaginatedAttachments:](self, "rectForSelection:includeRuby:includePaginatedAttachments:", v18, 0, 1);
    v41 = 0;
    v42 = v52;
    v52[6] = v37;
    v42[7] = v38;
    v42[8] = v39;
    v42[9] = v40;
  }
  v57 = CGRectInset(*(CGRect *)&v37, a10, a10);
  v43 = v52;
  v44 = v52;
  *(CGRect *)(v52 + 6) = v57;
  v45 = v44 + 6;
  if (a4)
  {
    v46 = (CGSize)*((_OWORD *)v45 + 1);
    a4->origin = *(CGPoint *)v45;
    a4->size = v46;
    v57 = *(CGRect *)(v43 + 6);
  }
  BYTE1(v49) = a8;
  LOBYTE(v49) = a7;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", v41, 0, a9, v13, 0, v18, v57.origin.x, v57.origin.y, v57.size.width, v57.size.height, v49));
  _Block_object_dispose(&v51, 8);

  return v47;
}

- (id)textImageForRect:(CGRect)a3
{
  uint64_t v4;

  LOWORD(v4) = 0;
  return -[CRLWPRep p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:](self, "p_imageForRect:usingGlyphRect:prepareBackground:drawBackground:shouldPulsate:forCaret:drawSelection:suppressInvisibles:suppressChildReps:", 0, 0, 1, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, v4);
}

- (BOOL)isOverflowing
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform11CRLWPLayout, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v3));
  v7 = sub_100221D0C(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  LOBYTE(v6) = objc_msgSend(v8, "isOverflowing");
  return (char)v6;
}

- (BOOL)doesNeedDisplayOnEditingDidEnd
{
  return 0;
}

- (void)editingDidEndWithTextEditor:(id)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  -[CRLWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers", a3);
  if (-[CRLWPRep doesNeedDisplayOnEditingDidEnd](self, "doesNeedDisplayOnEditingDidEnd"))
    -[CRLWPRep setNeedsDisplay](self, "setNeedsDisplay");
  *(_QWORD *)&v5 = objc_opt_class(CRLShapeRep, v4).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep", v5));
  v9 = sub_100221D0C(v7, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
    objc_msgSend(v10, "setShadowOnChildrenDisabled:", 0);

}

- (void)p_updateAnimationWithAnimatingPulse:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  CGColor *v7;
  _QWORD v8[6];

  v3 = a3;
  if (!-[CRLWPHighlightArrayController pulsating](self->_pulseArrayController, "pulsating"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));

    if (v5)
    {
      if (!self->_updatingHighlights)
      {
        self->_updatingHighlights = 1;
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
        objc_msgSend(v6, "viewScale");
        -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

        -[CRLWPHighlightArrayController reset](self->_pulseArrayController, "reset");
        v7 = sub_1001B4168();
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_10037A614;
        v8[3] = &unk_101255E90;
        v8[4] = self;
        v8[5] = v7;
        -[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:](self, "prepareLayoutForImagingSearchReferencesAsActive:usingBlock:", 1, v8);
        CGColorRelease(v7);
        if (v3)
          -[CRLWPHighlightArrayController startAnimating](self->_pulseArrayController, "startAnimating");
        -[CRLWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
        self->_updatingHighlights = 0;
      }
    }
  }
}

- (void)updateVisualSelection:(id)a3
{
  id v4;

  v4 = a3;
  CGPathRelease(-[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:"));

}

- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6
{
  return -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:", a3, a4, a5, a6, 0);
}

- (CGPath)p_newSelectionPathForSelection:(id)a3 transform:(CGAffineTransform *)a4 headPinRect:(CGRect *)a5 tailPinRect:(CGRect *)a6 markedText:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  CGSize size;
  CGPath *Mutable;
  __int128 v28;
  void *v29;
  double v30;
  void *v31;
  __objc2_class_ro **p_info;
  unsigned int v33;
  id v34;
  id v35;
  uint64_t v36;
  double v37;
  double v38;
  void *i;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGSize v66;
  CGSize v67;
  void *v69;
  double v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGAffineTransform v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  CGAffineTransform m;
  CGPoint v80;
  CGSize v81;
  CGPoint origin;
  CGSize v83;
  _BYTE v84[128];
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;

  v7 = a7;
  v12 = a3;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0;
  v15 = objc_msgSend(v12, "type");
  if (objc_msgSend(v12, "headCharIndex") != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = objc_msgSend(v12, "tailCharIndex");
    if (v15 == (id)7 && v16 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = objc_msgSend(v12, "headCharIndex");
      v18 = objc_msgSend(v12, "tailCharIndex");
      if (v18 >= v17)
        v19 = (unint64_t)v17;
      else
        v19 = (unint64_t)v18;
      v20 = objc_msgSend(v12, "headCharIndex");
      v21 = objc_msgSend(v12, "tailCharIndex");
      if (v20 <= v21)
        v22 = v21;
      else
        v22 = v20;
      if (v19 <= (unint64_t)v22 + 1)
        v23 = (unint64_t)v22 + 1;
      else
        v23 = v19;
      if (v19 >= (unint64_t)v22 + 1)
        v13 = (uint64_t)v22 + 1;
      else
        v13 = v19;
      v14 = v23 - v13;
    }
  }
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (uint64_t)objc_msgSend(v12, "range");
    v14 = v24;
  }
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v83 = size;
  v80 = origin;
  v81 = size;
  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0)
  {
    Mutable = 0;
  }
  else
  {
    memset(&m, 0, sizeof(m));
    if (a4)
    {
      v28 = *(_OWORD *)&a4->c;
      *(_OWORD *)&m.a = *(_OWORD *)&a4->a;
      *(_OWORD *)&m.c = v28;
      *(_OWORD *)&m.tx = *(_OWORD *)&a4->tx;
    }
    else
    {
      -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v29, "contentsScale");
    v70 = v30;

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
    p_info = &OBJC_METACLASS___CRLCanvasEditorHelper.info;
    +[CRLWPColumn populateHeadAndTailCharIndicesInSelection:forColumns:](CRLWPColumn, "populateHeadAndTailCharIndicesInSelection:forColumns:", v12, v31);
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPColumn selectionRectsforColumns:forSelection:](CRLWPColumn, "selectionRectsforColumns:forSelection:", v31, v12));
    if (objc_msgSend(v69, "count"))
    {
      Mutable = CGPathCreateMutable();
      v33 = -[CRLWPRep textIsVertical](self, "textIsVertical");
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v34 = v69;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v76;
        if (v33)
          v37 = 0.0;
        else
          v37 = 0.5;
        if (v33)
          v38 = 0.5;
        else
          v38 = 0.0;
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(_QWORD *)v76 != v36)
              objc_enumerationMutation(v34);
            objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i), "CGRectValue");
            v44 = v40;
            v45 = v41;
            v46 = v42;
            v47 = v43;
            if (v7)
            {
              v85 = CGRectInset(*(CGRect *)&v40, v37, v38);
              x = v85.origin.x;
              y = v85.origin.y;
              width = v85.size.width;
              height = v85.size.height;
              v74 = m;
              if (sub_100079384(&v74.a))
              {
                v73 = m;
                v86.origin.x = x;
                v86.origin.y = y;
                v86.size.width = width;
                v86.size.height = height;
                v87 = CGRectApplyAffineTransform(v86, &v73);
                v88.origin.x = sub_100063150(v87.origin.x, v87.origin.y, v87.size.width, v87.size.height, v70);
                v52 = v88.origin.x;
                v53 = v88.origin.y;
                v54 = v88.size.width;
                v55 = v88.size.height;
                v56 = CGRectGetHeight(v88);
                v89.origin.x = v52;
                v89.origin.y = v53;
                v89.size.width = v54;
                v89.size.height = v55;
                v57 = CGRectGetWidth(v89);
                if (v56 * 0.5 <= 2.0)
                  v58 = v56 * 0.5;
                else
                  v58 = 2.0;
                v59 = v57 * 0.5;
                if (v59 <= 2.0)
                  v60 = v59;
                else
                  v60 = 2.0;
                v90.origin.x = v52;
                v90.origin.y = v53;
                v90.size.width = v54;
                v90.size.height = v55;
                CGPathAddRoundedRect(Mutable, 0, v90, v60, v58);
              }
              else
              {
                v95.origin.x = x;
                v95.origin.y = y;
                v95.size.width = width;
                v95.size.height = height;
                v61 = CGRectGetHeight(v95);
                v96.origin.x = x;
                v96.origin.y = y;
                v96.size.width = width;
                v96.size.height = height;
                v62 = CGRectGetWidth(v96);
                if (v61 * 0.5 <= 2.0)
                  v63 = v61 * 0.5;
                else
                  v63 = 2.0;
                v64 = v62 * 0.5;
                if (v64 <= 2.0)
                  v65 = v64;
                else
                  v65 = 2.0;
                v97.origin.x = x;
                v97.origin.y = y;
                v97.size.width = width;
                v97.size.height = height;
                CGPathAddRoundedRect(Mutable, &m, v97, v65, v63);
              }
            }
            else
            {
              v72 = m;
              if (sub_100079384(&v72.a))
              {
                v71 = m;
                v91.origin.x = v44;
                v91.origin.y = v45;
                v91.size.width = v46;
                v91.size.height = v47;
                v92 = CGRectApplyAffineTransform(v91, &v71);
                v93.origin.x = sub_100063150(v92.origin.x, v92.origin.y, v92.size.width, v92.size.height, v70);
                CGPathAddRect(Mutable, 0, v93);
              }
              else
              {
                v94.origin.x = v44;
                v94.origin.y = v45;
                v94.size.width = v46;
                v94.size.height = v47;
                CGPathAddRect(Mutable, &m, v94);
              }
            }
          }
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
        }
        while (v35);
      }

      p_info = (__objc2_class_ro **)(&OBJC_METACLASS___CRLCanvasEditorHelper + 32);
    }
    else
    {
      Mutable = 0;
    }
    if ((unint64_t)a5 | (unint64_t)a6)
      objc_msgSend(p_info + 381, "calculateSelectionPinRectsForSelection:inColumns:outSelectionPinRect:outSelectionTailPinRect:", v12, v31, &origin, &v80);

  }
  if (a5)
  {
    v66 = v83;
    a5->origin = origin;
    a5->size = v66;
  }
  if (a6)
  {
    v67 = v81;
    a6->origin = v80;
    a6->size = v67;
  }

  return Mutable;
}

- (id)p_lineSelectionsForSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  if (objc_msgSend(v4, "isRange"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "lineSelectionsForSelection:", v4));
          if (v10)
          {
            if (!v6)
              v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            objc_msgSend(v6, "addObjectsFromArray:", v10);
          }

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selection"));
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep p_lineSelectionsForSelection:](self, "p_lineSelectionsForSelection:", v5));
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v10);
        if (!v7)
          v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", (_QWORD)v17));
        v12 = objc_msgSend(v4, "copy", (_QWORD)v17);
        v13 = objc_msgSend(v11, "range");
        objc_msgSend(v12, "setRange:", v13, v14);
        objc_msgSend(v7, "addObject:", v12);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v15 = v7;
  return v15;
}

- (CGPoint)p_pinPoint:(CGPoint)a3 toRect:(CGRect)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = sub_1000613A8(a3.x, a3.y, a4.origin.x, a4.origin.y, a4.size.width + -1.0, a4.size.height + -1.0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (void)p_updateLayersForRangeSelection:(id)a3 selectionFlags:(unint64_t)a4
{
  char v4;
  id v6;
  unsigned int v7;
  id *selectionLineLayers;
  void *v9;
  CGSize size;
  CGPath *v11;
  CAShapeLayer *selectionHighlightLayer;
  void *v13;
  double v14;
  double v15;
  unsigned int v16;
  _BOOL4 v17;
  _BOOL4 IsEmpty;
  int v19;
  CGPath *v20;
  double v21;
  double x;
  _BOOL4 v23;
  int v24;
  CGPath *v25;
  CGRect v26;
  double v27;
  CGRect v28;
  CGRect v29;

  v4 = a4;
  v6 = a3;
  v7 = -[CRLWPRep p_canShowSelectionAndCaretLayers](self, "p_canShowSelectionAndCaretLayers");
  -[CRLWPRep hideCaretLayer](self, "hideCaretLayer");
  selectionLineLayers = (id *)self->_selectionLineLayers;
  if (!self->_selectionLineLayers[0])
    -[CRLWPRep p_createSelectionLineLayers](self, "p_createSelectionLineLayers");
  if ((v4 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("path")));
    objc_msgSend(v9, "setDuration:", 0.100000001);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionHighlightLayer, "addAnimation:forKey:", v9, CFSTR("selectionHighlightPathAnimation"));
    if (-[CRLWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls"))
    {
      objc_msgSend(*selectionLineLayers, "addAnimation:forKey:", v9, CFSTR("leftSelectionLinePositionAnimation"));
      -[CAShapeLayer addAnimation:forKey:](self->_selectionLineLayers[1], "addAnimation:forKey:", v9, CFSTR("rightSelectionLinePositionAnimation"));
    }

  }
  size = CGRectNull.size;
  v29.origin = CGRectNull.origin;
  v29.size = size;
  v28.origin = v29.origin;
  v28.size = size;
  if (v7)
  {
    objc_msgSend(v6, "isVisual");
    v11 = -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:", v6, 0, &v29, &v28);
    -[CRLWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
    selectionHighlightLayer = self->_selectionHighlightLayer;
    if (v11)
    {
      -[CAShapeLayer setPath:](selectionHighlightLayer, "setPath:", v11);
      -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 0);
    }
    else
    {
      -[CAShapeLayer setHidden:](selectionHighlightLayer, "setHidden:", 1);
      -[CAShapeLayer setPath:](self->_selectionHighlightLayer, "setPath:", 0);
    }
    CGPathRelease(0);
    CGPathRelease(v11);
    -[CRLWPRep p_setSelectionHighlightColor](self, "p_setSelectionHighlightColor");
  }
  else
  {
    -[CRLWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
    -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 1);
    -[CAShapeLayer setPath:](self->_selectionHighlightLayer, "setPath:", 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas", *(_QWORD *)&v28.origin.x));
  objc_msgSend(v13, "viewScale");
  v15 = v14;

  v16 = -[CRLWPRep textIsVertical](self, "textIsVertical");
  v17 = objc_msgSend(v6, "type") == (id)3 || objc_msgSend(v6, "type") == (id)5;
  if ((-[CRLWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls") & v7) == 1
    && ((IsEmpty = CGRectIsEmpty(v29), v15 == 0.0) ? (v19 = 1) : (v19 = IsEmpty), ((v19 | v17) & 1) == 0))
  {
    v21 = 1.0 / v15;
    if (v16)
    {
      x = v29.origin.x;
      v29.size.height = 2.0 / v15;
      v29.origin.y = v29.origin.y - v21;
    }
    else
    {
      x = v29.origin.x - v21;
      v29.size.width = 2.0 / v15;
      v29.origin.x = v29.origin.x - v21;
    }
    v20 = -[CRLCanvasRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", x);
    objc_msgSend(*selectionLineLayers, "setHidden:", 0);
    objc_msgSend(*selectionLineLayers, "setPath:", v20);
  }
  else
  {
    objc_msgSend(*selectionLineLayers, "setHidden:", 1);
    objc_msgSend(*selectionLineLayers, "setPath:", 0);
    v20 = 0;
  }
  if ((-[CRLWPRep p_shouldDisplaySelectionControls](self, "p_shouldDisplaySelectionControls") & v7) == 1
    && ((v23 = CGRectIsEmpty(v28), v15 == 0.0) ? (v24 = 1) : (v24 = v23), ((v24 | v17) & 1) == 0))
  {
    v26 = v28;
    if (v16)
    {
      v28.origin.y = CGRectGetMaxY(v26) + -1.0 / v15;
      v28.size.height = 2.0 / v15;
      v27 = v28.origin.x;
    }
    else
    {
      v27 = CGRectGetMaxX(v26) + -1.0 / v15;
      v28.origin.x = v27;
      v28.size.width = 2.0 / v15;
    }
    v25 = -[CRLCanvasRep newPathInScaledCanvasFromNaturalRect:](self, "newPathInScaledCanvasFromNaturalRect:", v27, *(_OWORD *)&v28.origin, *(_OWORD *)&v28.size, *(_OWORD *)&v29.origin, *(_OWORD *)&v29.size);
    objc_msgSend(selectionLineLayers[1], "setHidden:", 0);
    objc_msgSend(selectionLineLayers[1], "setPath:", v25);
  }
  else
  {
    -[CAShapeLayer setHidden:](self->_selectionLineLayers[1], "setHidden:", 1);
    -[CAShapeLayer setPath:](self->_selectionLineLayers[1], "setPath:", 0);
    v25 = 0;
  }
  CGPathRelease(v20);
  CGPathRelease(v25);

}

- (BOOL)p_canShowSelectionAndCaretLayers
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSRange v18;
  NSRange v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v4 = objc_msgSend(v3, "isRange");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
    v6 = objc_msgSend(v5, "range");
    v8 = v7;

    v18.location = (NSUInteger)-[CRLWPRep range](self, "range");
    v19.location = (NSUInteger)v6;
    v19.length = v8;
    v9 = NSIntersectionRange(v18, v19);
    if (self->_secondaryHighlightLayer)
      v10 = 1;
    else
      v10 = v9.length == 0;
    if (!v10)
      goto LABEL_6;
    return 0;
  }
  if (self->_secondaryHighlightLayer)
    return 0;
LABEL_6:
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "editorController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectionPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mostSpecificSelectionOfClass:", 0));
  v16 = v11 == v15;

  return v16;
}

- (void)p_hideSelectionLayers
{
  -[CRLWPRep hideCaretLayer](self, "hideCaretLayer");
  -[CRLWPRep p_setSelectionLineLayersHidden:](self, "p_setSelectionLineLayersHidden:", 1);
  -[CRLWPRep p_hideSelectionHighlightLayer](self, "p_hideSelectionHighlightLayer");
  -[CRLWPRep p_hideSelectionParagraphBorderLayer](self, "p_hideSelectionParagraphBorderLayer");
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
}

- (void)i_setNeedsErasableDisplayInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  double x;
  double y;
  double width;
  double height;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  length = a3.length;
  location = a3.location;
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v13), "erasableRectForSelectionRange:", location, length);
        v26.origin.x = v14;
        v26.origin.y = v15;
        v26.size.width = v16;
        v26.size.height = v17;
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v24 = CGRectUnion(v23, v26);
        x = v24.origin.x;
        y = v24.origin.y;
        width = v24.size.width;
        height = v24.size.height;
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  if (!CGRectIsEmpty(v25))
    -[CRLWPRep setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", x, y, width, height);
}

- (void)i_spellCheckerWordsDidChange
{
  if (self->_spellChecker)
  {
    if (-[CRLWPRep p_spellCheckingEnabled](self, "p_spellCheckingEnabled"))
      -[CRLWPRep setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)p_invalidateSuppressedMisspellingRange
{
  if (self->_suppressedMisspellingRange.location != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_suppressedMisspellingRange.length)
      -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:");
  }
}

- (void)p_setSuppressedMisspellingRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSRange v7;
  NSUInteger v8;
  NSUInteger v9;
  NSRange v11;
  NSRange v12;

  length = a3.length;
  location = a3.location;
  v12.location = (NSUInteger)-[CRLWPRep range](self, "range");
  v12.length = v6;
  v11.location = location;
  v11.length = length;
  v7 = NSIntersectionRange(v11, v12);
  if (v7.length)
    v8 = v7.length;
  else
    v8 = 0;
  if (v7.length)
    v9 = v7.location;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  if (v9 != self->_suppressedMisspellingRange.location || v8 != self->_suppressedMisspellingRange.length)
  {
    -[CRLWPRep p_invalidateSuppressedMisspellingRange](self, "p_invalidateSuppressedMisspellingRange");
    self->_suppressedMisspellingRange.location = v9;
    self->_suppressedMisspellingRange.length = v8;
    -[CRLWPRep p_invalidateSuppressedMisspellingRange](self, "p_invalidateSuppressedMisspellingRange");
  }
}

- (void)p_updateSuppressedSpellingRange
{
  void *v3;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  NSRange v11;
  NSRange v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  location = self->_suppressedMisspellingRange.location;
  length = self->_suppressedMisspellingRange.length;
  if (location != 0x7FFFFFFFFFFFFFFFLL || length != 0)
  {
    v12.location = (NSUInteger)-[CRLWPRep range](self, "range");
    v12.length = v7;
    v11.location = location;
    v11.length = length;
    self->_suppressedMisspellingRange = NSIntersectionRange(v11, v12);
  }
  if (objc_msgSend(v3, "isValid"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvas"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10037BA44;
    v10[3] = &unk_10124E0C0;
    v10[4] = self;
    v10[5] = v3;
    objc_msgSend(v9, "performBlockAfterLayoutIfNecessary:", v10);

  }
  else
  {
    -[CRLWPRep p_setSuppressedMisspellingRange:](self, "p_setSuppressedMisspellingRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    self->_changeCountForSpellingSuppression = (unint64_t)objc_msgSend(v8, "changeCount");
  }

}

- (void)p_updateForCurrentSelectionWithFlags:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  Class v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  Class v19;
  NSString *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  BOOL v25;
  void *v26;
  id v27;
  NSUInteger v28;
  NSUInteger v29;
  id v30;
  void *v31;
  unsigned int v32;
  _TtC8Freeform12CRLTextRange *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  unsigned int v38;
  int v39;
  Class v40;
  NSString *v41;
  uint64_t v42;
  Class v43;
  NSString *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  unsigned int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  NSRange v61;
  NSRange v62;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  if (v6)
  {
    objc_opt_class(CRLWPSelection, v5);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255EF0);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        objc_opt_class(CRLWPSelection, v10);
        v41 = NSStringFromClass(v40);
        v46 = (id)objc_claimAutoreleasedReturnValue(v41);
        objc_opt_class(v6, v42);
        v44 = NSStringFromClass(v43);
        *(_DWORD *)buf = 67110658;
        v48 = v8;
        v49 = 2082;
        v50 = "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]";
        v51 = 2082;
        v52 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        v53 = 1024;
        v54 = 3040;
        v55 = 2082;
        v56 = "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]";
        v57 = 2114;
        v58 = v46;
        v59 = 2114;
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
        v60 = v45;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d %{public}s expected %{public}@, got %{public}@", buf, 0x40u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255F10);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      objc_opt_class(CRLWPSelection, v14);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_opt_class(v6, v18);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 3040, 0, "%{public}s expected %{public}@, got %{public}@", "-[CRLWPRep p_updateForCurrentSelectionWithFlags:]", v17, v21);

    }
  }
  if (-[CRLWPRep p_isRedesignedTextCursorEnabled](self, "p_isRedesignedTextCursorEnabled"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v23 = v22 == 0;

    if (!v23)
      -[CRLWPRep p_validateWithLayoutController](self, "p_validateWithLayoutController");
  }
  if (self->_caretLayer && !self->_suppressSelectionHighlight)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v25 = v24 == 0;

    if (!v25)
      -[CRLWPRep p_validateWithLayoutController](self, "p_validateWithLayoutController");
    -[CRLWPRep p_updateSuppressedSpellingRange](self, "p_updateSuppressedSpellingRange");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
    v27 = objc_msgSend(v26, "markedRange");
    v29 = v28;

    v30 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v32 = objc_msgSend(v31, "hasMarkedText");

    if (v32)
    {
      v61.location = (NSUInteger)objc_msgSend(v30, "range");
      v62.location = (NSUInteger)v27;
      v62.length = v29;
      v33 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", NSUnionRange(v61, v62).location, v61.length);
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRange makeTrailingInsertionPoint](v33, "makeTrailingInsertionPoint"));
      v35 = objc_msgSend(v34, "nsRange");
      v37 = objc_msgSend(v30, "copyWithNewRange:", v35, v36);

      v30 = v37;
    }
    v38 = objc_msgSend(v30, "isInsertionPoint");
    if (v29)
      v39 = 1;
    else
      v39 = v38;
    if (v39 == 1)
    {
      -[CRLWPRep p_updateLayersForInsertionPointSelection:](self, "p_updateLayersForInsertionPointSelection:", v30);
    }
    else if (objc_msgSend(v30, "isRange"))
    {
      -[CRLWPRep p_updateLayersForRangeSelection:selectionFlags:](self, "p_updateLayersForRangeSelection:selectionFlags:", v30, a3);
    }
    else
    {
      -[CRLWPRep p_hideSelectionLayers](self, "p_hideSelectionLayers");
    }
    -[CRLWPRep p_updateMarkHighlightLayer](self, "p_updateMarkHighlightLayer");

  }
}

- (void)i_setNeedsDisplayForSelectionChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  NSUInteger v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  NSRange v14;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v17;
  id v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  NSUInteger v22;
  NSRange v23;
  id v24;
  void *v25;
  NSRange v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  CRLWPSelection *v35;
  CRLWPSelection *lastSelection;
  _QWORD v37[6];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  NSRange v47;
  NSRange v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;

  if (!self->_lastSelection)
    goto LABEL_4;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentInfo"));
  if ((objc_opt_respondsToSelector(v4, "shouldHideEmptyBullets") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "parentInfo"));
    v7 = objc_msgSend(v6, "shouldHideEmptyBullets");

    if (v7)
    {
LABEL_4:
      -[CRLWPRep setNeedsDisplay](self, "setNeedsDisplay");
      goto LABEL_38;
    }
  }
  else
  {

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  if (!-[CRLWPSelection isEqual:](self->_lastSelection, "isEqual:", v8)
    && ((objc_msgSend(v8, "isRange") & 1) != 0
     || -[CRLWPSelection isRange](self->_lastSelection, "isRange")))
  {
    if (v8)
    {
      v9 = objc_msgSend(v8, "range");
      v11 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
      v50.location = (NSUInteger)objc_msgSend(v12, "range");
      v50.length = v13;
      v47.location = (NSUInteger)v9;
      v47.length = v11;
      v14 = NSIntersectionRange(v47, v50);
      location = v14.location;
      length = v14.length;

      v17 = v14.length;
    }
    else
    {
      length = 0;
      location = 0;
      v17 = 0;
    }
    v18 = -[CRLWPSelection range](self->_lastSelection, "range");
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v51.location = (NSUInteger)objc_msgSend(v21, "range");
    v51.length = v22;
    v48.location = (NSUInteger)v18;
    v48.length = v20;
    v23 = NSIntersectionRange(v48, v51);

    v24 = objc_alloc_init((Class)NSMutableIndexSet);
    v25 = v24;
    if (length)
      objc_msgSend(v24, "addIndexesInRange:", location, v17);
    if (v23.length)
    {
      objc_msgSend(v25, "addIndexesInRange:", v23.location, v23.length);
      if (length)
      {
        v49.location = location;
        v49.length = v17;
        v26 = NSIntersectionRange(v49, v23);
        objc_msgSend(v25, "removeIndexesInRange:", v26.location, v26.length);
      }
    }
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0x7FFFFFFFFFFFFFFFLL;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_10037CA80;
    v42[3] = &unk_101255F38;
    v42[4] = self;
    v42[5] = &v43;
    objc_msgSend(v25, "enumerateIndexesUsingBlock:", v42);
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0x7FFFFFFFFFFFFFFFLL;
    if (v44[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10037CB1C;
      v37[3] = &unk_101255F38;
      v37[4] = self;
      v37[5] = &v38;
      objc_msgSend(v25, "enumerateIndexesWithOptions:usingBlock:", 2, v37);
      v27 = v44[3];
      if (v27 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v28 = v39[3];
        if (v28 == 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101255F58);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E27F70();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101255F78);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
          {
            objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            sub_100DE7E60();
          }

          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep i_setNeedsDisplayForSelectionChange]"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 3117, 0, "If there is a invisible char, we should have found it going backwards.");

          v27 = v44[3];
          v28 = v39[3];
        }
        if (v27 <= v28 + 1)
          v32 = v28 + 1;
        else
          v32 = v27;
        if (v27 >= v28 + 1)
          v33 = v28 + 1;
        else
          v33 = v27;
        -[CRLWPRep i_setNeedsErasableDisplayInRange:](self, "i_setNeedsErasableDisplayInRange:", v33, v32 - v33);
      }
    }
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v43, 8);

  }
LABEL_38:
  if (self->_lastSelection)
    -[CRLWPRep updateUniversalAccessZoomWindow](self, "updateUniversalAccessZoomWindow");
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v35 = (CRLWPSelection *)objc_msgSend(v34, "copy");
  lastSelection = self->_lastSelection;
  self->_lastSelection = v35;

}

- (void)p_validateWithLayoutController
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutController"));
  objc_msgSend(v2, "validateLayoutWithDependencies:", v3);

}

- (void)p_drawTextLayerInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  CGContextSaveGState(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));
  -[CRLCanvasRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", v5, a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));
  LOBYTE(v8) = 0;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 3, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));
  -[CRLWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", v7, a3);

  CGContextRestoreGState(a3);
}

- (void)p_drawTextBackgroundLayerInContext:(CGContext *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  CGContextSaveGState(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textBackgroundLayer](self, "textBackgroundLayer"));
  -[CRLCanvasRep setupForDrawingInLayer:context:](self, "setupForDrawingInLayer:context:", v5, a3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textBackgroundLayer](self, "textBackgroundLayer"));
  LOBYTE(v8) = 0;
  -[CRLWPRep p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:](self, "p_drawTextInLayer:context:limitSelection:rubyGlyphRange:renderMode:suppressInvisibles:", v6, a3, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 2, v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textBackgroundLayer](self, "textBackgroundLayer"));
  -[CRLWPRep didDrawInLayer:context:](self, "didDrawInLayer:context:", v7, a3);

  CGContextRestoreGState(a3);
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v6;
  unsigned __int8 v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v7 = objc_msgSend(v6, "shouldSuppressRendering");

  if ((v7 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep textLayer](self, "textLayer"));

    if (v8 == v10)
    {
      -[CRLWPRep p_drawTextLayerInContext:](self, "p_drawTextLayerInContext:", a4);
    }
    else
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep textBackgroundLayer](self, "textBackgroundLayer"));

      if (v9 == v10)
        -[CRLWPRep p_drawTextBackgroundLayerInContext:](self, "p_drawTextBackgroundLayerInContext:", a4);
    }
  }

}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", a3, a4));
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = objc_msgSend(v5, "shouldLayoutTilingLayer:", v4);

  return v6;
}

- (BOOL)textIsVertical
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v3 = objc_msgSend(v2, "textIsVertical");

  return v3;
}

- (void)p_teardown
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  CAShapeLayer *floatingCaretLayer;
  NSArray *searchReferences;
  CRLWPSearchReference *primaryFindResultSearchReference;
  CAShapeLayer *selectionHighlightLayer;
  CAShapeLayer *selectionParagraphBorderLayer;
  CRLWPSelection *lastSelection;
  CAShapeLayer *markHighlightLayer;
  CAShapeLayer *smartFieldHighlightLayer;
  CRLPulseAnimationController *caretPulseController;
  CRLWPHighlightArrayController *pulseArrayController;
  CRLWPRepCaretController *caretController;
  CAShapeLayer *v19;
  CAShapeLayer *v20;
  CAShapeLayer *caretLayer;
  CAShapeLayer *secondaryHighlightLayer;
  CAShapeLayer *dragAndDropCaretLayer;
  CALayer *dragAndDropTopicLayer;
  CRLNoDefaultImplicitActionLayer *dragAndDropTopicIndentLayer;
  void *v26;
  void *v27;
  void *v28;

  if (!self->_tornDown)
  {
    -[CRLWPRep p_unregisterNotifications](self, "p_unregisterNotifications");
    -[CRLWPRepCaretController stopCaretLayerAnimationHidingCaret:](self->_caretController, "stopCaretLayerAnimationHidingCaret:", 0);
    -[CRLWPRepCaretController tearDown](self->_caretController, "tearDown");
    if (-[CRLWPHighlightArrayController autohide](self->_pulseArrayController, "autohide"))
    {
      v3 = objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
      if (v3)
      {
        v4 = (void *)v3;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "primaryFindResultSearchReference"));
        if (v27)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
          v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "primaryFindResultSearchReference"));
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
          v7 = objc_msgSend(v5, "isEqual:", v6);

          if (v7)
            -[CRLWPRep p_clearICCPrimaryFindResultSearchReference](self, "p_clearICCPrimaryFindResultSearchReference");
        }
        else
        {

        }
      }
    }
    -[CAShapeLayer removeAllAnimations](self->_floatingCaretLayer, "removeAllAnimations");
    -[CAShapeLayer removeFromSuperlayer](self->_floatingCaretLayer, "removeFromSuperlayer");
    -[CRLPulseAnimationController disconnect](self->_caretPulseController, "disconnect");
    -[CRLWPHighlightArrayController disconnect](self->_pulseArrayController, "disconnect");
    -[CRLWPRep p_destroySpellChecker](self, "p_destroySpellChecker");
    self->_tornDown = 1;
  }
  floatingCaretLayer = self->_floatingCaretLayer;
  self->_floatingCaretLayer = 0;

  searchReferences = self->_searchReferences;
  self->_searchReferences = 0;

  primaryFindResultSearchReference = self->_primaryFindResultSearchReference;
  self->_primaryFindResultSearchReference = 0;

  -[CAShapeLayer setDelegate:](self->_selectionHighlightLayer, "setDelegate:", 0);
  selectionHighlightLayer = self->_selectionHighlightLayer;
  self->_selectionHighlightLayer = 0;

  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  self->_selectionParagraphBorderLayer = 0;

  lastSelection = self->_lastSelection;
  self->_lastSelection = 0;

  -[CAShapeLayer setDelegate:](self->_markHighlightLayer, "setDelegate:", 0);
  markHighlightLayer = self->_markHighlightLayer;
  self->_markHighlightLayer = 0;

  -[CAShapeLayer setDelegate:](self->_smartFieldHighlightLayer, "setDelegate:", 0);
  smartFieldHighlightLayer = self->_smartFieldHighlightLayer;
  self->_smartFieldHighlightLayer = 0;

  caretPulseController = self->_caretPulseController;
  self->_caretPulseController = 0;

  pulseArrayController = self->_pulseArrayController;
  self->_pulseArrayController = 0;

  caretController = self->_caretController;
  self->_caretController = 0;

  -[CRLWPRep p_destroyLayer:](self, "p_destroyLayer:", 1);
  -[CRLWPRep p_destroyLayer:](self, "p_destroyLayer:", 0);
  -[CAShapeLayer setDelegate:](self->_selectionLineLayers[0], "setDelegate:", 0);
  v19 = self->_selectionLineLayers[0];
  self->_selectionLineLayers[0] = 0;

  -[CAShapeLayer setDelegate:](self->_selectionLineLayers[1], "setDelegate:", 0);
  v20 = self->_selectionLineLayers[1];
  self->_selectionLineLayers[1] = 0;

  -[CAShapeLayer setDelegate:](self->_caretLayer, "setDelegate:", 0);
  caretLayer = self->_caretLayer;
  self->_caretLayer = 0;

  -[CAShapeLayer setDelegate:](self->_secondaryHighlightLayer, "setDelegate:", 0);
  secondaryHighlightLayer = self->_secondaryHighlightLayer;
  self->_secondaryHighlightLayer = 0;

  -[CAShapeLayer setDelegate:](self->_dragAndDropCaretLayer, "setDelegate:", 0);
  dragAndDropCaretLayer = self->_dragAndDropCaretLayer;
  self->_dragAndDropCaretLayer = 0;

  -[CALayer setDelegate:](self->_dragAndDropTopicLayer, "setDelegate:", 0);
  dragAndDropTopicLayer = self->_dragAndDropTopicLayer;
  self->_dragAndDropTopicLayer = 0;

  dragAndDropTopicIndentLayer = self->_dragAndDropTopicIndentLayer;
  self->_dragAndDropTopicIndentLayer = 0;

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
}

- (void)p_drawTextInLayer:(id)a3 context:(CGContext *)a4 limitSelection:(id)a5 rubyGlyphRange:(_NSRange)a6 renderMode:(unint64_t)a7 suppressInvisibles:(BOOL)a8
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSUInteger length;
  unsigned __int8 v31;
  NSUInteger v32;
  NSUInteger v33;
  unsigned __int8 v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned __int8 v49;
  id v52;
  void *v53;
  CRLWPStorageSpellChecker *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSUInteger location;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *i;
  id v68;
  CRLWPRep *v69;
  _OWORD v70[3];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];

  v64 = a3;
  v52 = a5;
  v11 = sub_100411820((uint64_t)a4);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v44, "beginTextStorageChunk:limitSelection:", self, v52);
  v69 = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "textRendererForLayer:context:", v64, a4));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "canvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "freehandDrawingToolkit"));
  v49 = objc_msgSend(v15, "isInDrawingMode");

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v69, "canvas"));
  if (!objc_msgSend(v16, "isCanvasInteractive"))
  {

    goto LABEL_5;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](v69, "textEditor"));

  if (!v17)
  {
LABEL_5:
    v20 = 0;
    v47 = 0;
    v48 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  v18 = objc_msgSend(v17, "markedRange");
  v47 = v19;
  v48 = (uint64_t)v18;
  v20 = v17;
LABEL_6:
  v43 = v20;
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "markedText"));
  v54 = 0;
  if (-[CRLWPRep p_spellCheckingEnabled](v69, "p_spellCheckingEnabled") && !a8)
  {
    v54 = v69->_spellChecker;
    if (v54)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](v69, "layout"));
      if ((objc_msgSend(v21, "isInstructional") & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v69, "storage"));
        if (objc_msgSend(v22, "length"))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v69, "storage"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "markedTextRange"));

          if (v24)
            goto LABEL_16;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](v69, "columns"));
          v25 = +[CRLWPColumn rangeOfColumns:](CRLWPColumn, "rangeOfColumns:", v21);
          -[CRLWPStorageSpellChecker checkRange:synchronously:](v54, "checkRange:synchronously:", v25, v26, 1);
        }
        else
        {

        }
      }

    }
    else
    {
      v54 = 0;
    }
  }
LABEL_16:
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](v69, "columns"));
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (v55)
  {
    v46 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v55; i = (char *)i + 1)
      {
        if (*(_QWORD *)v72 != v46)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](v69, "layout"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "interiorClippingPath"));
        v68 = objc_msgSend(v29, "copy");

        if (v27)
          objc_msgSend(v27, "transformToWP");
        else
          memset(v70, 0, sizeof(v70));
        objc_msgSend(v68, "transformUsingAffineTransform:", v70);
        objc_msgSend(v63, "setInteriorClippingPath:", v68);
        v65 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPRangeArray rangeArray](CRLWPMutableRangeArray, "rangeArray"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPRangeArray rangeArray](CRLWPMutableRangeArray, "rangeArray"));
        v62 = v27;
        if (v64)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](v69, "selection"));
          v61 = v56;
        }
        else
        {
          v61 = 0;
        }
        length = v69->_dragRange.length;
        location = v69->_dragRange.location;
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v69, "canvas"));
        v31 = objc_msgSend(v59, "isCanvasInteractive");
        v32 = v69->_suppressedMisspellingRange.location;
        v33 = v69->_suppressedMisspellingRange.length;
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v69, "canvas"));
        v34 = objc_msgSend(v58, "shouldSuppressBackgrounds");
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](v69, "layout"));
        v35 = objc_msgSend(v57, "pageCount");
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v69, "canvas"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "canvasController"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "canvasEditor"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "canvasSelection"));
        LOBYTE(v42) = a8;
        LOBYTE(v41) = ((a7 & 0x20) != 0) | v34;
        BYTE1(v40) = v49;
        LOBYTE(v40) = v31;
        objc_msgSend(v62, "renderWithRenderer:currentSelection:limitSelection:listRange:rubyGlyphRange:isCanvasInteractive:isInDrawingMode:spellChecker:suppressedMisspellingRange:blackAndWhite:dictationInterpretations:autocorrections:markedRange:markedText:renderMode:pageCount:suppressInvisibles:currentCanvasSelection:", v63, v61, v52, location, length, a6.location, a6.length, v40, v54, v32, v33, v41, v65, v66, v48,
          v47,
          v53,
          a7,
          v35,
          v42,
          v39);

        if (v64)
      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    }
    while (v55);
  }

  objc_msgSend(v44, "endTextStorageChunk:", v69);
}

- (void)p_createLayer:(int64_t)a3
{
  CALayer **textLayers;
  void *v6;
  void *v7;
  void *v8;
  CRLTilingLayer *v9;
  id *v10;
  id v11;
  double v12;
  void *v13;
  CALayer *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  textLayers = self->_textLayers;
  if (self->_textLayers[a3])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255F98);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E27FF0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101255FB8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createLayer:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 3425, 0, "Shouldn't be creating _textLayer again");

  }
  v9 = objc_alloc_init(CRLTilingLayer);
  v10 = (id *)&textLayers[a3];
  v11 = *v10;
  *v10 = v9;

  objc_msgSend(*v10, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(*v10, "setEdgeAntialiasingMask:", 0);
  objc_msgSend(*v10, "setDelegate:", self);
  objc_msgSend(*v10, "setPosition:", CGPointZero.x, CGPointZero.y);
  v12 = -3.0;
  if (a3 == 1)
    v12 = -2.0;
  objc_msgSend(*v10, "setZPosition:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v13, "contentsScale");
  -[CALayer setContentsScale:](textLayers[a3], "setContentsScale:");

  v14 = textLayers[a3];
  objc_opt_class(CRLTilingLayer, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0)
    -[CALayer setTilingMode:](textLayers[a3], "setTilingMode:", -[CRLWPRep tilingMode](self, "tilingMode"));
  if (a3 == 1)
    -[CALayer setDrawsAsynchronously:](textLayers[1], "setDrawsAsynchronously:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v17, "setNeedsDisplayOnLayer:", textLayers[a3]);

}

- (void)p_destroyLayer:(int64_t)a3
{
  CALayer **textLayers;
  CALayer *v5;

  textLayers = self->_textLayers;
  -[CALayer setDelegate:](self->_textLayers[a3], "setDelegate:", 0);
  v5 = textLayers[a3];
  textLayers[a3] = 0;

}

- (id)p_caretLayerWithZPosition:(double)a3
{
  id v5;
  double v6;
  void *v7;

  v5 = objc_alloc_init((Class)CAShapeLayer);
  objc_msgSend(v5, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(v5, "setFillColor:", -[CRLWPRep p_caretLayerColor](self, "p_caretLayerColor"));
  objc_msgSend(v5, "setEdgeAntialiasingMask:", 0);
  LODWORD(v6) = 1.0;
  objc_msgSend(v5, "setOpacity:", v6);
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setZPosition:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v7, "contentsScale");
  objc_msgSend(v5, "setContentsScale:");

  objc_msgSend(v5, "setHidden:", 0);
  objc_msgSend(v5, "setName:", CFSTR("Caret Layer"));
  return v5;
}

- (void)p_positionAndSizeFloatingCaret:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", x, y);
  -[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:](self, "p_closestCaretRectForPoint:inSelection:allowPastBreak:", 1, 1);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v34 = 0u;
  v35 = 0u;
  v33 = 0u;
  -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
  if (v15 <= 0.0 && v13 <= 0.0)
  {
    -[CRLWPRep p_closestCaretRectForPoint:inSelection:allowPastBreak:](self, "p_closestCaretRectForPoint:inSelection:allowPastBreak:", 0, 0, x, y);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }
  if (v15 > 0.0 || v13 > 0.0)
  {
    objc_msgSend(v7, "setAnchorPoint:", 0.5, 0.5);
    objc_msgSend(v7, "setEdgeAntialiasingMask:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v20, "viewScale");
    v22 = v21;

    -[CRLWPRepHelper floatingCaretHeightMult](self->_repHelper, "floatingCaretHeightMult");
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, 2.0 / v22, round(v15 * v23));
  }
  v35 = 0uLL;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = 0uLL;
  objc_msgSend(v7, "setAffineTransform:", v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v24, "convertUnscaledToBoundsPoint:", x, y);
  v26 = v25;
  v28 = v27;

  -[CRLWPRepHelper floatingCaretLineSnapAmount](self->_repHelper, "floatingCaretLineSnapAmount");
  if (v29 > 0.0)
  {
    -[CRLWPRep p_applyLineSnappingToFloatingCaret:atPoint:withRect:](self, "p_applyLineSnappingToFloatingCaret:atPoint:withRect:", v7, x, y, v9, v11, v13, v15);
    v26 = v30;
    v28 = v31;
  }
  objc_msgSend(v7, "setPosition:", v26, v28);

}

- (CGPoint)p_applyLineSnappingToFloatingCaret:(id)a3 atPoint:(CGPoint)a4 withRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double MidY;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGPoint result;
  CGRect v45;
  CGRect v46;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = a4.y;
  v10 = a4.x;
  v12 = a3;
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:", v10, v9);
  v14 = v13;
  v16 = v15;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MidY = CGRectGetMidY(v45);
  -[CRLWPRepHelper floatingCaretLineSnapAmount](self->_repHelper, "floatingCaretLineSnapAmount");
  v19 = v18;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v21 = v20;
  objc_msgSend(v12, "bounds");
  if (v22 >= v21)
    v23 = v21;
  else
    v23 = v22;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  v25 = v24;
  objc_msgSend(v12, "bounds");
  v27 = v26;
  -[CRLCanvasRep naturalBounds](self, "naturalBounds");
  if (v27 >= v25)
    v32 = v25;
  else
    v32 = v27;
  v46 = CGRectInset(*(CGRect *)&v28, v23 * 0.5, v32 * 0.5);
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", sub_1000613A8(v14, MidY + (v16 - MidY) / v19, v46.origin.x, v46.origin.y, v46.size.width, v46.size.height));
  v34 = v33;
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v37, "convertUnscaledToBoundsPoint:", v34, v36);
  v39 = v38;
  v41 = v40;

  v42 = v39;
  v43 = v41;
  result.y = v43;
  result.x = v42;
  return result;
}

- (BOOL)p_positionCaretLayer:(id)a3 forSelection:(id)a4 layerRelative:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  _BOOL4 v16;
  CGFloat v17;
  CGFloat v18;
  double x;
  double y;
  double width;
  double height;
  double v23;
  double v24;
  double v25;
  uint64_t v28;
  double v29;
  double v30;
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
  void *v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  uint64_t v58;
  objc_class *v59;
  id v60;
  void *v61;
  double v62;
  CGFloat v63;
  const CGPath *v64;
  void *v65;
  double v67;
  double v68;
  CGAffineTransform transform;
  CGAffineTransform v70;
  CGAffineTransform v71;
  CGAffineTransform v72;
  CGAffineTransform v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[CRLWPRep p_caretRectForSelection:](self, "p_caretRectForSelection:", v9);
  -[CRLWPRepHelper rectForCaretLayer:](self->_repHelper, "rectForCaretLayer:");
  v14 = v13;
  v15 = v12;
  v16 = v13 > 0.0 || v12 > 0.0;
  if (v16)
  {
    v17 = v10;
    v18 = v11;
    memset(&v73, 0, sizeof(v73));
    if (v5)
      -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
    else
      -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
    v72 = v73;
    v74.origin.x = v17;
    v74.origin.y = v18;
    v74.size.width = v14;
    v74.size.height = v15;
    v75 = CGRectApplyAffineTransform(v74, &v72);
    x = v75.origin.x;
    y = v75.origin.y;
    width = v75.size.width;
    height = v75.size.height;
    v71 = v73;
    v23 = sub_1000791B0(&v71);
    sub_1000618C4(v23);
    v25 = fmod(360.0 - v24, 360.0);
    -[CRLWPRepHelper anchorPointForCaretLayer:rotated:](self->_repHelper, "anchorPointForCaretLayer:rotated:", v14 > 0.0, v25 != 0.0);
    objc_msgSend(v8, "setAnchorPoint:");
    if (v25 == 0.0)
    {
      objc_msgSend(v8, "setEdgeAntialiasingMask:", 0);
      v37 = x;
      v38 = y;
      v39 = width;
      v40 = height;
      if (v14 <= 0.0)
      {
        v77 = CGRectInset(*(CGRect *)&v37, (width + -2.0) * 0.5, 0.0);
        v67 = round(v77.origin.y);
        v68 = round(v77.origin.x);
        v36 = round(v77.size.height);
        v35 = 2.0;
      }
      else
      {
        v76 = CGRectInset(*(CGRect *)&v37, 0.0, (height + -2.0) * 0.5);
        v67 = round(v76.origin.y);
        v68 = round(v76.origin.x);
        v35 = round(v76.size.width);
        v36 = 2.0;
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columnForCharIndex:](self, "columnForCharIndex:", objc_msgSend(v9, "range")));
      -[CRLCanvasRep naturalBounds](self, "naturalBounds");
      v43 = v42;
      v45 = v44;
      v47 = v46;
      v49 = v48;
      objc_msgSend(v41, "boundsIncludingDropCapRectsForSelectionType:", objc_msgSend(v9, "type"));
      v83.origin.x = v50;
      v83.origin.y = v51;
      v83.size.width = v52;
      v83.size.height = v53;
      v78.origin.x = v43;
      v78.origin.y = v45;
      v78.size.width = v47;
      v78.size.height = v49;
      v79 = CGRectUnion(v78, v83);
      v54 = v79.origin.x;
      v55 = v79.origin.y;
      v56 = v79.size.width;
      v57 = v79.size.height;
      if (v5)
        -[CRLCanvasRep transformToConvertNaturalToLayerRelative](self, "transformToConvertNaturalToLayerRelative");
      else
        -[CRLWPRep transformToConvertNaturalToScaledRoot](self, "transformToConvertNaturalToScaledRoot");
      v80.origin.x = v54;
      v80.origin.y = v55;
      v80.size.width = v56;
      v80.size.height = v57;
      v81 = CGRectApplyAffineTransform(v80, &v70);
      if (v68 >= v81.origin.x)
        v32 = v68;
      else
        v32 = v81.origin.x;
      if (v67 >= v81.origin.y)
        v34 = v67;
      else
        v34 = v81.origin.y;

    }
    else
    {
      if (v25 == 180.0 || v25 == 90.0 || v25 == 270.0)
        v28 = 0;
      else
        v28 = 15;
      objc_msgSend(v8, "setEdgeAntialiasingMask:", v28);
      -[CRLWPRep p_convertNaturalRectToRotated:repAngle:](self, "p_convertNaturalRectToRotated:repAngle:", x, y, width, height, v25);
      v32 = v31;
      v34 = v33;
      if (v14 <= 0.0)
        v35 = 2.0;
      else
        v35 = v29;
      if (v14 <= 0.0)
        v36 = v30;
      else
        v36 = 2.0;
    }
    -[CRLWPRepHelper boundsForCaretLayer:](self->_repHelper, "boundsForCaretLayer:", v32, v34, v35, v36);
    objc_msgSend(v8, "setBounds:");
    -[CRLWPRepHelper positionForCaretLayer:](self->_repHelper, "positionForCaretLayer:", v32, v34, v35, v36);
    objc_msgSend(v8, "setPosition:");
    objc_opt_class(CAShapeLayer, v58);
    v60 = sub_1002223BC(v59, v8);
    v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
    CGAffineTransformMakeTranslation(&transform, 0.0, 0.0);
    if (v14 <= 0.0)
      v62 = v35;
    else
      v62 = v36;
    v63 = v62 * 0.5;
    v82.origin.x = 0.0;
    v82.origin.y = 0.0;
    v82.size.width = v35;
    v82.size.height = v36;
    v64 = CGPathCreateWithRoundedRect(v82, v63, v63, &transform);
    objc_msgSend(v61, "setPath:", v64);
    CGPathRelease(v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (360.0 - v25) * 3.14159265 / 180.0));
    objc_msgSend(v8, "setValue:forKeyPath:", v65, CFSTR("transform.rotation.z"));

  }
  return v16;
}

- (BOOL)caretIsHidden
{
  return -[CRLWPRepCaretController caretIsHidden](self->_caretController, "caretIsHidden");
}

- (void)showCaretLayerStartingAnimation
{
  -[CRLWPRepCaretController showCaretLayerStartingAnimation](self->_caretController, "showCaretLayerStartingAnimation");
}

- (void)hideCaretLayer
{
  -[CRLWPRepCaretController hideCaretLayer](self->_caretController, "hideCaretLayer");
}

- (BOOL)isShowingCaret
{
  return 1;
}

- (void)i_textInputResponderDidResignFirstResponder
{
  id v3;

  -[CRLWPRepCaretController willEnterForeground](self->_caretController, "willEnterForeground");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (void)i_textInputResponderDidBecomeFirstResponder
{
  id v3;

  -[CRLWPRepCaretController didEnterBackground](self->_caretController, "didEnterBackground");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (void)p_createSelectionLineLayers
{
  CGColor *v3;
  uint64_t v4;
  CAShapeLayer **selectionLineLayers;
  char v6;
  char v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  CRLWPSelectionHighlightLayer *v13;
  id *v14;
  id v15;
  char *v16;
  uint8_t buf[4];
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v3 = -[CRLWPRep p_highlightLineColor](self, "p_highlightLineColor");
  v4 = 0;
  selectionLineLayers = self->_selectionLineLayers;
  v6 = 1;
  do
  {
    v7 = v6;
    if (selectionLineLayers[v4])
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255FD8);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v18 = v8;
        v19 = 2082;
        v20 = "-[CRLWPRep p_createSelectionLineLayers]";
        v21 = 2082;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        v23 = 1024;
        v24 = 3662;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Shouldn't be creating _selectionLineLayers again", buf, 0x22u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101255FF8);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        *(_DWORD *)buf = 67109378;
        v18 = v8;
        v19 = 2114;
        v20 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionLineLayers]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 3662, 0, "Shouldn't be creating _selectionLineLayers again");

    }
    v13 = objc_alloc_init(CRLWPSelectionHighlightLayer);
    v14 = (id *)&selectionLineLayers[v4];
    v15 = *v14;
    *v14 = v13;

    objc_msgSend(*v14, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
    objc_msgSend(*v14, "setEdgeAntialiasingMask:", 0);
    objc_msgSend(*v14, "setDelegate:", self);
    objc_msgSend(*v14, "setZPosition:", -1.0);
    objc_msgSend(*v14, "setFillColor:", v3);
    v6 = 0;
    v4 = 1;
  }
  while ((v7 & 1) != 0);
}

- (void)p_setSelectionLineLayersHidden:(BOOL)a3
{
  _BOOL8 v3;
  CAShapeLayer **selectionLineLayers;

  v3 = a3;
  selectionLineLayers = self->_selectionLineLayers;
  -[CAShapeLayer setHidden:](self->_selectionLineLayers[0], "setHidden:");
  -[CAShapeLayer setHidden:](selectionLineLayers[1], "setHidden:", v3);
}

- (void)p_setSelectionHighlightColor
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  uint64_t v12;
  double v13;
  id v14;
  uint64_t v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep selection](self, "selection"));
  v4 = objc_msgSend(v3, "type");

  if (v4 == (id)3
    && !-[CRLWPRep usesStandardHighlightColorForReplaceSelections](self, "usesStandardHighlightColorForReplaceSelections"))
  {
    v15 = objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.949019611, 0.75686276, 0.654901981, 0.200000003));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crl_windowWrapper"));
    if (objc_msgSend(v8, "isInSplitViewMode"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
      v11 = objc_msgSend(v10, "isInFocusedContainer");

      if ((v11 & 1) == 0)
      {
        *(_QWORD *)&v13 = objc_opt_class(self, v12).n128_u64[0];
        v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "unfocusedHighlightColorForDarkMode:", 0, v13));
        goto LABEL_9;
      }
    }
    else
    {

    }
    *(_QWORD *)&v16 = objc_opt_class(self, v12).n128_u64[0];
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "focusedHighlightColorForDarkMode:", 0, v16));
  }
LABEL_9:
  v18 = (void *)v15;
  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256018);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E28070();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256038);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_setSelectionHighlightColor]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 3758, 0, "invalid nil value for '%{public}s'", "highlightColor");

  }
  -[CAShapeLayer setFillColor:](self->_selectionHighlightLayer, "setFillColor:", objc_msgSend(v18, "CGColor"));

}

- (void)p_createSelectionHighlightLayer
{
  void *v3;
  void *v4;
  void *v5;
  CRLWPSelectionHighlightLayer *v6;
  CAShapeLayer *selectionHighlightLayer;

  if (self->_selectionHighlightLayer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256058);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E280FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256078);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionHighlightLayer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3764, 0, "Shouldn't be creating _selectionHighlightLayer again");

  }
  v6 = objc_alloc_init(CRLWPSelectionHighlightLayer);
  selectionHighlightLayer = self->_selectionHighlightLayer;
  self->_selectionHighlightLayer = &v6->super;

  -[CAShapeLayer setAnchorPoint:](self->_selectionHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_selectionHighlightLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setDelegate:](self->_selectionHighlightLayer, "setDelegate:", self);
  -[CAShapeLayer setZPosition:](self->_selectionHighlightLayer, "setZPosition:", -1.79999995);
  -[CRLWPRep p_setSelectionHighlightColor](self, "p_setSelectionHighlightColor");
}

- (void)p_createSelectionParagraphBorderLayer
{
  void *v3;
  void *v4;
  void *v5;
  CAShapeLayer *v6;
  CAShapeLayer *selectionParagraphBorderLayer;
  void *v8;
  double v9;
  void *v10;
  CAShapeLayer **p_selectionParagraphBorderLayer;

  if (self->_selectionParagraphBorderLayer)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256098);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2817C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012560B8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSelectionParagraphBorderLayer]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 3778, 0, "Shouldn't be creating _selectionParagraphBorderLayer again");

  }
  v6 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
  selectionParagraphBorderLayer = self->_selectionParagraphBorderLayer;
  self->_selectionParagraphBorderLayer = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v8, "contentsScale");
  -[CAShapeLayer setContentsScale:](self->_selectionParagraphBorderLayer, "setContentsScale:");

  -[CAShapeLayer setHidden:](self->_selectionParagraphBorderLayer, "setHidden:", 0);
  LODWORD(v9) = 0;
  -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v9);
  -[CAShapeLayer setAnchorPoint:](self->_selectionParagraphBorderLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_selectionParagraphBorderLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setZPosition:](self->_selectionParagraphBorderLayer, "setZPosition:", -1.85000002);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.119999997, 0.370000005, 0.949999988, 0.550000012));
  -[CAShapeLayer setStrokeColor:](self->_selectionParagraphBorderLayer, "setStrokeColor:", objc_msgSend(v10, "CGColor"));

  p_selectionParagraphBorderLayer = &self->_selectionParagraphBorderLayer;
  -[CAShapeLayer setLineWidth:](*p_selectionParagraphBorderLayer, "setLineWidth:", 2.0);
  -[CAShapeLayer setFillColor:](*p_selectionParagraphBorderLayer, "setFillColor:", 0);
}

- (void)p_hideSelectionHighlightLayer
{
  -[CAShapeLayer setHidden:](self->_selectionHighlightLayer, "setHidden:", 1);
}

- (void)p_hideSelectionParagraphBorderLayer
{
  float v3;
  void *v4;
  double v5;
  id v6;

  -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
  if (v3 != 0.0)
  {
    -[CAShapeLayer removeAllAnimations](self->_selectionParagraphBorderLayer, "removeAllAnimations");
    v6 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v6, "setDuration:", 0.15);
    -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v6, "setFromValue:", v4);

    objc_msgSend(v6, "setToValue:", &off_1012CCD58);
    LODWORD(v5) = 0;
    -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v5);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionParagraphBorderLayer, "addAnimation:forKey:", v6, CFSTR("kParagraphModeBorderFadeOutAnimation"));

  }
}

- (void)p_showSelectionParagraphBorderLayerWithPath:(CGPath *)a3
{
  float v4;
  void *v5;
  double v6;
  id v7;

  -[CAShapeLayer setPath:](self->_selectionParagraphBorderLayer, "setPath:", a3);
  -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
  if (v4 != 1.0)
  {
    -[CAShapeLayer removeAllAnimations](self->_selectionParagraphBorderLayer, "removeAllAnimations");
    v7 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v7, "setDuration:", 0.15);
    -[CAShapeLayer opacity](self->_selectionParagraphBorderLayer, "opacity");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    objc_msgSend(v7, "setFromValue:", v5);

    objc_msgSend(v7, "setToValue:", &off_1012CCD68);
    LODWORD(v6) = 1.0;
    -[CAShapeLayer setOpacity:](self->_selectionParagraphBorderLayer, "setOpacity:", v6);
    -[CAShapeLayer addAnimation:forKey:](self->_selectionParagraphBorderLayer, "addAnimation:forKey:", v7, CFSTR("kParagraphModeBorderFadeInAnimation"));

  }
}

- (void)p_createMarkHighlightLayer
{
  CRLWPSelectionHighlightLayer *v3;
  CAShapeLayer *markHighlightLayer;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(CRLWPSelectionHighlightLayer);
  markHighlightLayer = self->_markHighlightLayer;
  self->_markHighlightLayer = &v3->super;

  -[CAShapeLayer setAnchorPoint:](self->_markHighlightLayer, "setAnchorPoint:", CGPointZero.x, CGPointZero.y);
  -[CAShapeLayer setEdgeAntialiasingMask:](self->_markHighlightLayer, "setEdgeAntialiasingMask:", 0);
  -[CAShapeLayer setDelegate:](self->_markHighlightLayer, "setDelegate:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.100000001));
  -[CAShapeLayer setFillColor:](self->_markHighlightLayer, "setFillColor:", objc_msgSend(v5, "CGColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.330000013, 0.649999976, 0.200000003));
  -[CAShapeLayer setStrokeColor:](self->_markHighlightLayer, "setStrokeColor:", objc_msgSend(v6, "CGColor"));

  -[CAShapeLayer setZPosition:](self->_markHighlightLayer, "setZPosition:", -1.9);
}

- (void)p_hideMarkHighlightLayer
{
  -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 1);
}

- (void)p_updateMarkHighlightLayer
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  void *v22;
  CGPath *v23;
  CRLWPSelectionHighlightLayer *v24;
  void *v25;
  id v26;
  CGPath *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  char *v36;
  __int128 v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
  v4 = objc_msgSend(v3, "markedRange");
  v6 = v5;
  v7 = -[CRLWPRep isBeingEdited](self, "isBeingEdited");
  if (v6)
    v8 = v7;
  else
    v8 = 0;
  if (v8 == 1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v4, v6));
    -[CAShapeLayer setSublayers:](self->_markHighlightLayer, "setSublayers:", 0);
    -[CAShapeLayer setPath:](self->_markHighlightLayer, "setPath:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "markedText"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attribute:atIndex:effectiveRange:", NSMarkedClauseSegmentAttributeName, 0, 0));

    if (v11)
    {
      v34 = v3;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v36 = (char *)objc_msgSend(v3, "markedRange");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
      v13 = (char *)objc_msgSend(v12, "length");

      v37 = xmmword_100EEE428;
      v14 = 0;
      while (v14 < (unint64_t)objc_msgSend(v10, "length"))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attribute:atIndex:effectiveRange:", NSMarkedClauseSegmentAttributeName, (_QWORD)v37, &v37));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "attribute:atIndex:effectiveRange:", NSBackgroundColorAttributeName, (_QWORD)v37, 0));
        v17 = v16;
        if (!*((_QWORD *)&v37 + 1) || (v18 = &v36[v37], &v36[(unint64_t)v37] >= v13))
        {

          break;
        }
        if (v15)
        {
          v19 = &v18[*((_QWORD *)&v37 + 1)];
          if (v13 < &v18[*((_QWORD *)&v37 + 1)])
            v19 = v13;
          if (v18 <= v19)
            v20 = v19;
          else
            v20 = &v36[v37];
          if (v18 >= v19)
            v21 = v19;
          else
            v21 = &v36[v37];
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPSelection selectionWithRange:](CRLWPSelection, "selectionWithRange:", v21, v20 - v21));
          v23 = -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:", v22, 0, 0, 0, 1);
          if (v23)
          {
            v24 = objc_alloc_init(CRLWPSelectionHighlightLayer);
            -[CRLWPSelectionHighlightLayer setPath:](v24, "setPath:", v23);
            -[CRLWPSelectionHighlightLayer setStrokeColor:](v24, "setStrokeColor:", 0);
            if (v17)
              -[CRLWPSelectionHighlightLayer setFillColor:](v24, "setFillColor:", objc_msgSend(objc_retainAutorelease(v17), "CGColor"));
            else
              -[CRLWPSelectionHighlightLayer setFillColor:](v24, "setFillColor:", objc_msgSend((id)qword_1014155C0, "CGColor"));
            CFRelease(v23);
            objc_msgSend(v35, "addObject:", v24);

          }
        }

        v14 = *((_QWORD *)&v37 + 1) + v37;
        v37 = (unint64_t)(*((_QWORD *)&v37 + 1) + v37);
      }
      v3 = v34;
      if (objc_msgSend(v35, "count"))
        -[CAShapeLayer setSublayers:](self->_markHighlightLayer, "setSublayers:", v35);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CAShapeLayer sublayers](self->_markHighlightLayer, "sublayers"));
    v26 = objc_msgSend(v25, "count");

    if (v26)
      v27 = 0;
    else
      v27 = -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:](self, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:markedText:", v9, 0, 0, 0, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "markedText"));

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "attributesAtIndex:effectiveRange:", 0, 0));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", NSBackgroundColorAttributeName));
      if (v31)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithUIColor:](CRLColor, "colorWithUIColor:", v31));
        v33 = objc_msgSend(v32, "CGColor");

      }
      else
      {
        v33 = 0;
      }

      if (!v33)
        goto LABEL_42;
    }
    else
    {
      v33 = objc_msgSend((id)qword_1014155C0, "CGColor");
      if (!v33)
        goto LABEL_42;
    }
    -[CAShapeLayer setFillColor:](self->_markHighlightLayer, "setFillColor:", v33);
    -[CAShapeLayer setStrokeColor:](self->_markHighlightLayer, "setStrokeColor:", 0);
    -[CAShapeLayer setPath:](self->_markHighlightLayer, "setPath:", v27);
    -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 0);
LABEL_42:
    CGPathRelease(v27);

    goto LABEL_43;
  }
  -[CAShapeLayer setHidden:](self->_markHighlightLayer, "setHidden:", 1);
LABEL_43:
  self->_markChanged = 0;

}

- (CGRect)boundsForCollaboratorCursorRenderable
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)invalidateCollaboratorCursorRenderable
{
  id v3;

  self->_collaboratorCursorRenderableValid = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (BOOL)shouldAddCollaboratorLayerToOverlays
{
  objc_super v4;

  if (-[CRLWPRep shouldShowCollaboratorCursorHighlight](self, "shouldShowCollaboratorCursorHighlight"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLWPRep;
  return -[CRLCanvasRep shouldAddCollaboratorLayerToOverlays](&v4, "shouldAddCollaboratorLayerToOverlays");
}

- (BOOL)shouldShowCollaboratorCursorHighlight
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  unsigned __int8 v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collaboratorCursorDelegate"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentCollaboratorPresences", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", v3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i)));
        v10 = -[CRLWPRep p_storageMatchesSelectionPath:](self, "p_storageMatchesSelectionPath:", v9);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)collaboratorCursorChangedToSelectionPath:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  CRLWPRep *v7;

  v4 = a3;
  if (qword_10147E4E0 != -1)
    dispatch_once(&qword_10147E4E0, &stru_1012560D8);
  v5 = off_1013D91E0;
  if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Collaborator Cursor: Selection Path Changed called for rep: %{public}@", (uint8_t *)&v6, 0xCu);
  }
  if (-[CRLWPRep p_storageMatchesSelectionPath:](self, "p_storageMatchesSelectionPath:", v4))
  {
    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
    -[CRLWPRep invalidateCollaboratorCursorRenderable](self, "invalidateCollaboratorCursorRenderable");
  }

}

- (void)hideCollaboratorCursors
{
  id v3;

  self->_collaboratorCursorRenderableValid = 0;
  -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v3, "invalidateContentLayersForRep:", self);

}

- (BOOL)p_storageMatchesSelectionPath:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  char **v8;
  void *v9;
  char *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  BOOL v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  BOOL v22;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v24 = a3;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "modelsForSelectionPath:", v24));
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v27;
    v8 = &selRef_startAnimation;
    do
    {
      v9 = 0;
      v10 = v8[43];
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(_TtC8Freeform12CRLWPStorage, v5);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14
          || (objc_opt_respondsToSelector(v11, v10) & 1) != 0
          && (*(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform12CRLWPStorage, v5).n128_u64[0],
              v19 = v18,
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "storage", v17)),
              v21 = sub_100221D0C(v19, v20),
              v14 = (void *)objc_claimAutoreleasedReturnValue(v21),
              v20,
              v14))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
          v16 = v14 == v15;

          if (v16)
          {
            v22 = 1;
            goto LABEL_14;
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v8 = &selRef_startAnimation;
    }
    while (v6);
  }
  v22 = 0;
LABEL_14:

  return v22;
}

- (double)collaborativeCursorOpacityForCaret:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t *v4;

  v3 = a3;
  if (qword_1014155D8 != -1)
    dispatch_once(&qword_1014155D8, &stru_1012560F8);
  v4 = &qword_1014155C8;
  if (!v3)
    v4 = &qword_1014155D0;
  return *(double *)v4;
}

- (void)p_withCollaboratorCursorPerformBlock:(id)a3
{
  id v4;
  void *i;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  unint64_t v19;
  _BOOL4 v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  double v32;
  double v33;
  CGPath *v34;
  __int128 v35;
  __int128 v36;
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  void *v41;
  unsigned __int8 v42;
  CGPath *Mutable;
  CGPath *v44;
  double v45;
  double v46;
  NSString *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  NSUInteger v54;
  id obj;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  CRLWPRep *v61;
  _OWORD v62[3];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _OWORD v66[3];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t buf[64];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  _BYTE v89[128];
  NSRange v90;
  NSRange v91;
  CGRect v92;

  v53 = a3;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "currentCollaboratorPresences"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "collaboratorCursorDelegate"));
  v61 = self;
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v52;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v89, 16);
  if (v4)
  {
    v56 = *(_QWORD *)v68;
    do
    {
      v59 = v4;
      for (i = 0; i != v59; i = (char *)i + 1)
      {
        if (*(_QWORD *)v68 != v56)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "collaboratorCursorSelectionPathForRenderer:collaboratorPresence:", v57, v6));
        if (-[CRLWPRep p_storageMatchesSelectionPath:](v61, "p_storageMatchesSelectionPath:", v7))
        {
          *(_QWORD *)&v9 = objc_opt_class(CRLWPSelection, v8).n128_u64[0];
          v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "orderedSelections", v9));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastObject"));
          v14 = sub_100221D0C(v11, v13);
          v60 = (void *)objc_claimAutoreleasedReturnValue(v14);

          if ((objc_msgSend(v60, "isValid") & 1) != 0)
          {
            v15 = objc_msgSend(v60, "range");
            v17 = v16;
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v61, "storage"));
            v54 = (NSUInteger)v15;
            v19 = (unint64_t)v15 + v17;
            v20 = v19 > (unint64_t)objc_msgSend(v18, "length");

            if (v20)
            {
              v21 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101256118);
              v22 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
              {
                v91.location = v54;
                v91.length = v17;
                v47 = NSStringFromRange(v91);
                v48 = (id)objc_claimAutoreleasedReturnValue(v47);
                v49 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v61, "storage"));
                v50 = objc_msgSend(v49, "length");
                *(_DWORD *)buf = 67110402;
                *(_DWORD *)&buf[4] = v21;
                *(_WORD *)&buf[8] = 2082;
                *(_QWORD *)&buf[10] = "-[CRLWPRep p_withCollaboratorCursorPerformBlock:]";
                *(_WORD *)&buf[18] = 2082;
                *(_QWORD *)&buf[20] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
                *(_WORD *)&buf[28] = 1024;
                *(_DWORD *)&buf[30] = 4043;
                *(_WORD *)&buf[34] = 2114;
                *(_QWORD *)&buf[36] = v48;
                *(_WORD *)&buf[44] = 2048;
                *(_QWORD *)&buf[46] = v50;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v22, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d collaborator selection extends past end of storage (%{public}@ > %lu)", buf, 0x36u);

              }
              if (qword_10147E370 != -1)
                dispatch_once(&qword_10147E370, &stru_101256138);
              v23 = off_1013D9070;
              if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)&buf[4] = v21;
                *(_WORD *)&buf[8] = 2114;
                *(_QWORD *)&buf[10] = v51;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

              }
              v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_withCollaboratorCursorPerformBlock:]"));
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
              v90.location = v54;
              v90.length = v17;
              v26 = NSStringFromRange(v90);
              v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              v28 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v61, "storage"));
              +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v24, v25, 4043, 0, "collaborator selection extends past end of storage (%{public}@ > %lu)", v27, objc_msgSend(v28, "length"));

            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](v61, "storage"));
            v30 = v19 > (unint64_t)objc_msgSend(v29, "length");

            if (!v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](v61, "canvas"));
              objc_msgSend(v31, "viewScale");
              v33 = v32;

              if (v17)
              {
                v34 = -[CRLWPRep p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:](v61, "p_newSelectionPathForSelection:transform:headPinRect:tailPinRect:", v60, 0, 0, 0);
                if (v34)
                {
                  v35 = *(_OWORD *)&CGAffineTransformIdentity.tx;
                  v36 = *(_OWORD *)&CGAffineTransformIdentity.a;
                  v66[1] = *(_OWORD *)&CGAffineTransformIdentity.c;
                  v66[2] = v35;
                  v66[0] = v36;
                  (*((void (**)(id, CGPath *, _OWORD *, uint64_t, _QWORD))v53 + 2))(v53, v34, v66, v6, 0);
                  CFRelease(v34);
                }
              }
              else if (-[CRLWPRep p_allowCaretForSelection:](v61, "p_allowCaretForSelection:", v60))
              {
                -[CRLWPRep p_caretRectForSelection:](v61, "p_caretRectForSelection:", v60);
                x = v92.origin.x;
                y = v92.origin.y;
                width = v92.size.width;
                height = v92.size.height;
                if (!CGRectIsNull(v92))
                {
                  v88 = 0;
                  v86 = 0u;
                  v87 = 0u;
                  v84 = 0u;
                  v85 = 0u;
                  v82 = 0u;
                  v83 = 0u;
                  v80 = 0u;
                  v81 = 0u;
                  v78 = 0u;
                  v79 = 0u;
                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  v72 = 0u;
                  v73 = 0u;
                  memset(buf, 0, sizeof(buf));
                  -[CRLWPRep lineMetricsAtCharIndex:](v61, "lineMetricsAtCharIndex:", v54);
                  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columnForCharIndex:](v61, "columnForCharIndex:", v54));
                  v42 = objc_msgSend(v41, "textIsVertical");
                  if ((v42 & 1) == 0)
                  {
                    x = sub_1000614B8(x, y, width, height);
                    y = 4.0 / v33 + *(double *)&buf[32];
                  }
                  Mutable = CGPathCreateMutable();
                  v44 = Mutable;
                  if (Mutable)
                  {
                    v45 = 7.0 / v33;
                    v46 = 14.0 / v33;
                    CGPathMoveToPoint(Mutable, 0, x, y);
                    if ((v42 & 1) != 0)
                    {
                      CGPathAddLineToPoint(v44, 0, x - v45, y - v46 * 0.5);
                      CGPathAddLineToPoint(v44, 0, x - v45, v46 * 0.5 + y);
                    }
                    else
                    {
                      y = v45 + y;
                      CGPathAddLineToPoint(v44, 0, v46 * 0.5 + x, y);
                      x = x - v46 * 0.5;
                    }
                    CGPathAddLineToPoint(v44, 0, x, y);
                    v64 = 0u;
                    v65 = 0u;
                    v63 = 0u;
                    -[CRLCanvasRep transformToConvertNaturalToLayerRelative](v61, "transformToConvertNaturalToLayerRelative");
                    v62[1] = v64;
                    v62[2] = v65;
                    v62[0] = v63;
                    (*((void (**)(id, CGPath *, _OWORD *, uint64_t, uint64_t))v53 + 2))(v53, v44, v62, v6, 1);
                    CFRelease(v44);
                  }

                }
              }
            }
          }

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v89, 16);
    }
    while (v4);
  }

}

- (id)collaboratorCursorRenderable
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  CRLWPRep *v11;
  id *p_collaboratorCursorRenderable;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, _OWORD *, void *, uint64_t);
  void *v17;
  CRLWPRep *v18;
  id v19;
  uint8_t buf[4];
  CRLWPRep *v21;

  if (qword_10147E4E0 != -1)
    dispatch_once(&qword_10147E4E0, &stru_101256158);
  v3 = off_1013D91E0;
  if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Collaborator Cursor: Requesting collaborator cursor renderable for WPRep: %{public}@", buf, 0xCu);
  }
  if (self->_collaboratorCursorRenderableValid
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCollaboratorPresences")),
        v8 = objc_msgSend(v7, "count") == 0,
        v7,
        v6,
        v8))
  {
    if (qword_10147E4E0 != -1)
      dispatch_once(&qword_10147E4E0, &stru_1012561C0);
    v4 = off_1013D91E0;
    if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Collaborator Cursor: Not regenerating renderable, because it was considered already valid, for WPRep: %{public}@", buf, 0xCu);
    }
    v5 = 0;
  }
  else
  {
    if (qword_10147E4E0 != -1)
      dispatch_once(&qword_10147E4E0, &stru_101256178);
    v9 = off_1013D91E0;
    if (os_log_type_enabled((os_log_t)off_1013D91E0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Collaborator Cursor: Actually re-generating renderable for WPRep: %{public}@", buf, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasRenderable renderable](CRLCanvasRenderable, "renderable"));
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100381284;
    v17 = &unk_1012561A0;
    v18 = self;
    v5 = v10;
    v19 = v5;
    -[CRLWPRep p_withCollaboratorCursorPerformBlock:](self, "p_withCollaboratorCursorPerformBlock:", &v14);
    +[CATransaction commit](CATransaction, "commit", v14, v15, v16, v17, v18);
    self->_collaboratorCursorRenderableValid = 1;

  }
  v11 = self;
  objc_sync_enter(v11);
  p_collaboratorCursorRenderable = (id *)&v11->_collaboratorCursorRenderable;
  if (v5)
    objc_storeStrong(p_collaboratorCursorRenderable, v5);
  else
    v5 = *p_collaboratorCursorRenderable;
  objc_sync_exit(v11);

  return v5;
}

- (id)currentCollaboratorCursorColor
{
  return +[CRLColor magentaColor](CRLColor, "magentaColor");
}

- (void)p_hideCollaboratorCursorLayer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v3, "setDuration:", 0.15);
  objc_msgSend(v3, "setToValue:", &off_1012CCA58);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  objc_msgSend(v3, "setFillMode:", kCAFillModeForwards);
  -[CRLCanvasRenderable addAnimation:forKey:](self->_collaboratorCursorRenderable, "addAnimation:forKey:", v3, CFSTR("opacity"));

}

- (void)p_showCollaboratorCursorLayer
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
  objc_msgSend(v3, "setDuration:", 0.15);
  objc_msgSend(v3, "setToValue:", &off_1012CCA68);
  objc_msgSend(v3, "setRemovedOnCompletion:", 1);
  -[CRLCanvasRenderable addAnimation:forKey:](self->_collaboratorCursorRenderable, "addAnimation:forKey:", v3, CFSTR("opacity"));

}

- (BOOL)p_spellCheckingEnabled
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if ((objc_msgSend(v3, "spellCheckingSuppressed") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    if (objc_msgSend(v5, "isCanvasInteractive"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[CRLWPObjcUserDefaults sharedUserDefaults](_TtC8Freeform21CRLWPObjcUserDefaults, "sharedUserDefaults"));
      v4 = objc_msgSend(v6, "spellCheckingEnabled");

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)p_automaticTextSubstitutionEnabled
{
  void *v3;
  void *v4;
  unsigned int v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  if (objc_msgSend(v3, "isCanvasInteractive"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    v5 = objc_msgSend(v4, "spellCheckingSuppressed") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)p_needsSpellChecker
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v7;
  id v8;

  v3 = -[CRLWPRep p_spellCheckingEnabled](self, "p_spellCheckingEnabled")
    || -[CRLWPRep p_automaticTextSubstitutionEnabled](self, "p_automaticTextSubstitutionEnabled");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  if (objc_msgSend(v4, "wpKind") != 7)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    if (!objc_msgSend(v5, "isInstructional"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
      v8 = objc_msgSend(v7, "length");

      if (v8)
        return v3;
      return 0;
    }

  }
  return 0;
}

- (void)p_createSpellChecker
{
  void *v3;
  CRLWPStorageSpellChecker *v4;
  CRLWPStorageSpellChecker *spellChecker;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_spellChecker || !-[CRLWPRep p_needsSpellChecker](self, "p_needsSpellChecker"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012561E0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E281FC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101256200);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep p_createSpellChecker]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4212, 0, "Asked to create the spell checker when we don't need one.");

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
    v4 = +[CRLWPStorageSpellChecker newSpellCheckerForStorage:selectionPath:orSearchCanvasDelegate:](CRLWPStorageSpellChecker, "newSpellCheckerForStorage:selectionPath:orSearchCanvasDelegate:", v3, 0, 0);
    spellChecker = self->_spellChecker;
    self->_spellChecker = v4;

    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", self, "p_spellcheckFinished:", CFSTR("CRLWPBackgroundSpellCheckCompletedNotification"), self->_spellChecker);

  }
}

- (void)p_spellcheckFinished:(id)a3
{
  _QWORD *v4;
  int64_t v5;
  dispatch_time_t v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100381B54;
  v7[3] = &unk_101256228;
  objc_copyWeak(&v8, &location);
  v4 = objc_retainBlock(v7);
  if (a3)
    v5 = 0;
  else
    v5 = 50000000;
  v6 = dispatch_time(0, v5);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)p_destroySpellChecker
{
  CRLWPStorageSpellChecker *spellChecker;

  spellChecker = self->_spellChecker;
  self->_spellChecker = 0;

}

- (void)didDrawInLayer:(id)a3 context:(CGContext *)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWPRep;
  -[CRLCanvasRep didDrawInLayer:context:](&v4, "didDrawInLayer:context:", a3, a4);
}

- (void)p_selectionChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t newSelectionFlags;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  if (v4)
  {
    v15 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CRLWPEditorKey")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));
    if (v7 == v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));

      if (v8 == v9)
      {
        self->_selectionChanged = 1;
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("CRLWPEditorSelectionFlagsKey")));
        self->_newSelectionFlags = (unint64_t)objc_msgSend(v10, "unsignedIntegerValue");

        newSelectionFlags = self->_newSelectionFlags;
        if ((newSelectionFlags & 0x100) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
          objc_msgSend(v12, "invalidateReps");

          newSelectionFlags = self->_newSelectionFlags;
        }
        self->_hudStateDirty = (newSelectionFlags & 0x800) == 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
        v14 = objc_msgSend(v13, "layoutIsValid");

        if (v14)
          -[CRLWPRep i_setNeedsDisplayForSelectionChange](self, "i_setNeedsDisplayForSelectionChange");
        -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
      }
    }
    else
    {

    }
    v4 = v15;
  }

}

- (void)p_updateCaretLayerColor
{
  CAShapeLayer *caretLayer;
  CGColor *v4;
  CGColor *v5;

  caretLayer = self->_caretLayer;
  if (caretLayer)
  {
    if (-[CAShapeLayer fillColor](caretLayer, "fillColor"))
    {
      v4 = -[CRLWPRep p_caretLayerColor](self, "p_caretLayerColor");
      if (v4)
      {
        v5 = v4;
        if (!CGColorEqualToColor(-[CAShapeLayer fillColor](self->_caretLayer, "fillColor"), v4))
          -[CAShapeLayer setFillColor:](self->_caretLayer, "setFillColor:", v5);
      }
    }
  }
}

- (CGColor)p_caretLayerColor
{
  void *v3;
  void *v4;
  CGColor *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep overrideCaretColor](self, "overrideCaretColor"));

  if (!v3)
    return -[CRLWPRep p_highlightLineColor](self, "p_highlightLineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep overrideCaretColor](self, "overrideCaretColor"));
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  return v5;
}

- (CGColor)p_highlightLineColor
{
  void *v2;
  CGColor *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithRed:green:blue:alpha:](CRLColor, "colorWithRed:green:blue:alpha:", 0.0, 0.435294118, 0.890196078, 1.0));
  v3 = (CGColor *)objc_msgSend(v2, "CGColor");

  return v3;
}

- (CGAffineTransform)transformToConvertNaturalToScaledRoot
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  CGAffineTransform v11;
  CGAffineTransform t1;
  CGAffineTransform v13;

  memset(&v13, 0, sizeof(v13));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "transformInRoot");
  else
    memset(&v13, 0, sizeof(v13));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  objc_msgSend(v7, "viewScale");
  v9 = v8;

  t1 = v13;
  CGAffineTransformMakeScale(&v11, v9, v9);
  return CGAffineTransformConcat(retstr, &t1, &v11);
}

- (id)selectionForDragAndDropNaturalPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  CRLWPSelection *v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 v15;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v15 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v9 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:isAtEndOfLine:inLayoutTarget:", 0, &v15, v8, x, y);

    v10 = v15;
    v11 = [CRLWPSelection alloc];
    v12 = v9;
    v13 = v10;
  }
  else
  {
    v11 = [CRLWPSelection alloc];
    v12 = 0;
    v13 = 0;
  }
  return -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:](v11, "initWithType:range:styleInsertionBehavior:caretAffinity:", 0, v12, 0, 0, v13);
}

- (id)textEditorForDropIntoStorage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));

    if (v7 != v4)
    {
      v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256248);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
        *(_DWORD *)buf = 67110402;
        v28 = v8;
        v29 = 2082;
        v30 = "-[CRLWPRep textEditorForDropIntoStorage:]";
        v31 = 2082;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm";
        v33 = 1024;
        v34 = 4390;
        v35 = 2112;
        v36 = v4;
        v37 = 2112;
        v38 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Specified storage (%@) is not the rep storage (%@).", buf, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256268);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep textEditorForDropIntoStorage:]"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 4390, 0, "Specified storage (%@) is not the rep storage (%@).", v4, v13);

    }
  }
  else
  {
    *(_QWORD *)&v14 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v5).n128_u64[0];
    v16 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentInfo", v14));
    v18 = sub_100221D0C(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    v20 = objc_alloc(-[CRLWPRep wpEditorClass](self, "wpEditorClass"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editingCoordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    v24 = objc_msgSend(v20, "initWithEditingCoordinator:enclosingShape:icc:", v22, v19, v23);

    v6 = v24;
  }

  return v6;
}

- (BOOL)isDragPoint:(CGPoint)a3 inSelection:(id)a4 includeEndpoints:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;

  v5 = a5;
  y = a3.y;
  x = a3.x;
  v9 = a4;
  if (objc_msgSend(v9, "isRange"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v11 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:isAtEndOfLine:leadingEdge:inLayoutTarget:", 0, 0, 0, 0, v10, x, y);

    if (v5)
      v12 = 3;
    else
      v12 = 0;
    v13 = objc_msgSend(v9, "containsCharacterAtIndex:withOptions:", v11, v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)allowGenericDrags
{
  return 0;
}

- (_TtC8Freeform12CRLWPStorage)storageForDragDropOperation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep parentRep](self, "parentRep"));
  v11 = sub_100221DDC(v4, 1, v5, v6, v7, v8, v9, v10, (uint64_t)&OBJC_PROTOCOL___CRLWPRepParent);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12 && (objc_opt_respondsToSelector(v12, "storageForDragDropOperation") & 1) != 0)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "storageForDragDropOperation"));

    v3 = (void *)v13;
  }

  return (_TtC8Freeform12CRLWPStorage *)v3;
}

- (id)backgroundColorForDragPreviewOfSelection:(id)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep colorBehindLayer:](self, "colorBehindLayer:", self->_textLayers[1]));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor whiteColor](CRLColor, "whiteColor"));
  return v3;
}

- (void)p_clearICCPrimaryFindResultSearchReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v4, "canvasInvalidatedForRep:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvas"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003827F8;
  v8[3] = &unk_10124E0C0;
  v8[4] = self;
  v7 = v3;
  v9 = v7;
  objc_msgSend(v6, "performBlockAfterLayoutIfNecessary:", v8);

}

- (void)pulseAnimationDidStop:(id)a3
{
  CRLWPHighlightArrayController *v4;
  CRLWPHighlightArrayController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;

  v4 = (CRLWPHighlightArrayController *)a3;
  v5 = v4;
  if (self->_pulseArrayController == v4)
  {
    if (-[CRLWPHighlightArrayController autohide](v4, "autohide"))
    {
      -[CRLWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
      if (self->_pulseArrayController)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256288);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E2827C();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_1012562A8);
        v6 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep pulseAnimationDidStop:]"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 4471, 0, "expected nil value for '%{public}s'", "_pulseArrayController");

      }
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "primaryFindResultSearchReference"));
      v11 = v10 == 0;

      if (!v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryFindResultSearchReference"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
        v15 = objc_msgSend(v13, "isEqual:", v14);

        if (v15)
          -[CRLWPRep p_clearICCPrimaryFindResultSearchReference](self, "p_clearICCPrimaryFindResultSearchReference");
      }
      -[CRLWPRep p_setPrimaryFindResultSearchReference:](self, "p_setPrimaryFindResultSearchReference:", 0);
      -[CRLWPRep p_updateForCurrentSelectionWithFlags:](self, "p_updateForCurrentSelectionWithFlags:", 0);
      -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v16, "canvasInvalidatedForRep:", self);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
    objc_msgSend(v17, "setPulseHighlight:", 0);

  }
}

- (void)pulseAnimationDidStopForPulse:(id)a3
{
  CRLPulseAnimationController *v4;
  void *v5;
  CRLPulseAnimationController *v6;

  v4 = (CRLPulseAnimationController *)a3;
  if (self->_caretPulseController == v4)
  {
    self->_caretPulseController = 0;
    v6 = v4;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v5, "canvasInvalidatedForRep:", self);

    v4 = v6;
  }

}

- (unint64_t)pulseAnimationStyle:(id)a3
{
  id v4;
  void *v5;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
    v4 = objc_msgSend(v5, "pulseAnimationStyle");

  }
  return (unint64_t)v4;
}

- (void)p_setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  CRLWPHighlightArrayController *pulseArrayController;
  _BOOL8 v6;
  CRLWPHighlightArrayController *v7;
  CRLWPHighlightArrayController *v8;
  void *v9;
  void *v10;
  CRLWPHighlightArrayController *v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;

  pulseArrayController = self->_pulseArrayController;
  if (a3)
  {
    v6 = a4;
    if (!pulseArrayController)
    {
      v7 = -[CRLWPHighlightArrayController initWithZOrder:delegate:]([CRLWPHighlightArrayController alloc], "initWithZOrder:delegate:", self, 8.0);
      v8 = self->_pulseArrayController;
      self->_pulseArrayController = v7;

      pulseArrayController = self->_pulseArrayController;
    }
    -[CRLWPHighlightArrayController setShouldPulsate:](pulseArrayController, "setShouldPulsate:", 1);
    -[CRLWPHighlightArrayController setAutohide:](self->_pulseArrayController, "setAutohide:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "transformInRoot");
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
      v14 = 0u;
    }
    v11 = self->_pulseArrayController;
    v13[0] = v14;
    v13[1] = v15;
    v13[2] = v16;
    -[CRLWPHighlightArrayController setTransform:](v11, "setTransform:", v13);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v12, "viewScale");
    -[CRLWPHighlightArrayController setViewScale:](self->_pulseArrayController, "setViewScale:");

  }
  else if (pulseArrayController)
  {
    self->_pulseArrayController = 0;

  }
}

- (BOOL)p_doesRepIntersectSearchReference:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v19;
  NSRange v20;
  CGRect v21;

  v4 = a3;
  objc_opt_class(CRLWPSearchReference, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storage")),
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage")),
        v11,
        v10,
        v10 == v11))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selection"));
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "range");
      if (v14)
      {
        self = (CRLWPRep *)-[CRLWPRep range](self, "range");
        v16 = v15;
        v20.location = (NSUInteger)objc_msgSend(v13, "range");
        v20.length = v17;
        v19.location = (NSUInteger)self;
        v19.length = v16;
        LOBYTE(self) = NSIntersectionRange(v19, v20).length != 0;
      }
      else
      {
        -[CRLWPRep caretRectForSelection:](self, "caretRectForSelection:", v13);
        LODWORD(self) = !CGRectIsNull(v21);
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (void)i_primaryFindResultChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CRLWPRep p_doesRepIntersectSearchReference:](self, "p_doesRepIntersectSearchReference:")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep primaryFindResultSearchReference](self, "primaryFindResultSearchReference")),
        v4,
        v4))
  {
    -[CRLWPRep p_setPrimaryFindResultSearchReference:](self, "p_setPrimaryFindResultSearchReference:", v5);
  }

}

- (void)p_setPrimaryFindResultSearchReference:(id)a3
{
  unsigned int v4;
  CRLWPHighlightArrayController *pulseArrayController;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = -[CRLWPRep p_doesRepIntersectSearchReference:](self, "p_doesRepIntersectSearchReference:");
  pulseArrayController = self->_pulseArrayController;
  if (v4)
  {
    -[CRLWPHighlightArrayController stop](pulseArrayController, "stop");
    -[CRLWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", v12 != 0, objc_msgSend(v12, "autohideHighlight"));
    objc_opt_class(CRLWPSearchReference, v6);
    v8 = sub_100221D0C(v7, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[CRLWPRep setPrimaryFindResultSearchReference:](self, "setPrimaryFindResultSearchReference:", v9);

  }
  else
  {
    -[CRLWPHighlightArrayController stop](pulseArrayController, "stop");
    -[CRLWPRep p_setPulseControllerActive:autohide:](self, "p_setPulseControllerActive:autohide:", 0, 0);
    -[CRLWPRep setPrimaryFindResultSearchReference:](self, "setPrimaryFindResultSearchReference:", 0);
    self->_selectionChanged = 1;
  }
  self->_searchHitsAreInvalid = 1;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
  objc_msgSend(v10, "invalidate");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v11, "canvasInvalidatedForRep:", self);

}

- (void)i_setSearchReferencesToHighlight:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep searchReferences](self, "searchReferences"));
  if (v6 != v5)
  {
    -[CRLWPRep setSearchReferences:](self, "setSearchReferences:", v5);
    self->_searchHitsAreInvalid = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    objc_msgSend(v7, "invalidate");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v8, "canvasInvalidatedForRep:", self);

    -[CRLCanvasRep invalidateKnobs](self, "invalidateKnobs");
  }

}

- (void)prepareLayoutForImagingSearchReferencesAsActive:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  unsigned int v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGColorRef v23;
  CGColor *v24;
  void *v25;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep storage](self, "storage"));
  v8 = objc_msgSend(v7, "wpKind");

  if (v8 >= 3)
  {
    *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform11CRLWPLayout, v9).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout", v10));
    v14 = sub_100221D0C(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (!v15)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012562C8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28388();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012562E8);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 4588, 0, "invalid nil value for '%{public}s'", "layout");

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layoutController"));
    if (!v19)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256308);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E28308();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101256328);
      v20 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        sub_100DE7E60();
      }

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:]"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 4590, 0, "Building a imageSearchReference for a layout that has no layout controller");

    }
    if (v4)
      v23 = sub_1001B4168();
    else
      v23 = sub_1001B4188();
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[CRLColor colorWithCGColor:](CRLColor, "colorWithCGColor:", v23));
    -[CRLWPRep setBackgroundColor:](self, "setBackgroundColor:", v25);

    objc_msgSend(v19, "validateLayoutWithDependencies:", v15);
    if (objc_msgSend(v15, "layoutIsValid"))
      v6[2](v6);
    -[CRLWPRep setBackgroundColor:](self, "setBackgroundColor:", 0);
    CGColorRelease(v24);
    objc_msgSend(v19, "validateLayoutWithDependencies:", v15);

  }
  else
  {
    v6[2](v6);
  }

}

- (void)p_updateHighlights
{
  void *v3;
  id v4;
  CRLWPHighlightArrayController *highlightArrayController;
  CRLWPHighlightArrayController *v6;
  CRLWPHighlightArrayController *v7;
  void *v8;
  void *v9;
  CRLWPHighlightArrayController *v10;
  void *v11;
  void *v12;
  id v13;
  CGColor *v14;
  _QWORD v15[6];
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep searchReferences](self, "searchReferences"));
  v4 = objc_msgSend(v3, "count");

  highlightArrayController = self->_highlightArrayController;
  if (v4)
  {
    if (!highlightArrayController)
    {
      v6 = -[CRLWPHighlightArrayController initWithZOrder:delegate:]([CRLWPHighlightArrayController alloc], "initWithZOrder:delegate:", self, 3.0);
      v7 = self->_highlightArrayController;
      self->_highlightArrayController = v6;

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep layout](self, "layout"));
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "transformInRoot");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }
    v10 = self->_highlightArrayController;
    v16[0] = v17;
    v16[1] = v18;
    v16[2] = v19;
    -[CRLWPHighlightArrayController setTransform:](v10, "setTransform:", v16);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
    objc_msgSend(v11, "viewScale");
    -[CRLWPHighlightArrayController setViewScale:](self->_highlightArrayController, "setViewScale:");

    -[CRLWPHighlightArrayController reset](self->_highlightArrayController, "reset");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep searchReferences](self, "searchReferences"));
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = sub_1001B4188();
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100383970;
      v15[3] = &unk_101255E90;
      v15[4] = self;
      v15[5] = v14;
      -[CRLWPRep prepareLayoutForImagingSearchReferencesAsActive:usingBlock:](self, "prepareLayoutForImagingSearchReferencesAsActive:usingBlock:", 0, v15);
      CGColorRelease(v14);
    }
  }
  else if (highlightArrayController)
  {
    self->_highlightArrayController = 0;

  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  __int128 v10;
  CGPath *Mutable;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  char v30;
  void *v31;
  void *v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  double height;
  CGFloat v37;
  CGFloat v38;
  CGFloat width;
  CGFloat v40;
  _OWORD v42[3];
  CGAffineTransform v43;
  CGAffineTransform v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectionPath"));
  *(_QWORD *)&v6 = objc_opt_class(CRLWPSelection, v5).n128_u64[0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificSelectionOfClass:", v7, v6));

  if (v8)
  {
    objc_msgSend(v8, "range");
    if (v9)
    {
      v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v42[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
      v42[1] = v10;
      v42[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
      Mutable = -[CRLWPRep p_newPathForSelection:withTransform:withInset:](self, "p_newPathForSelection:withTransform:withInset:", v8, v42, -1.0);
    }
    else
    {
      -[CRLWPRep caretRectForSelection:](self, "caretRectForSelection:", v8);
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep columns](self, "columns"));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v46;
LABEL_7:
        v23 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v22)
            objc_enumerationMutation(v20);
          v24 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v23);
          objc_msgSend(v24, "frameBounds");
          if (sub_100060030(v25, v26, v27, v28, v13, v15))
            break;
          if (v21 == (id)++v23)
          {
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
            if (v21)
              goto LABEL_7;
            goto LABEL_13;
          }
        }
        v29 = v24;

        if (!v29)
          goto LABEL_16;
        objc_msgSend(v29, "transformToWP");
        v30 = 0;
      }
      else
      {
LABEL_13:

LABEL_16:
        +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256348);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E28414();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101256368);
        v31 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)v31, OS_LOG_TYPE_ERROR))
        {
          objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          sub_100DE7E60();
        }

        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep newPathForSearchReference:]"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v32, v33, 4669, 0, "invalid nil value for '%{public}s'", "columnContainingRect");

        v29 = 0;
        memset(&v44, 0, sizeof(v44));
        v30 = 1;
      }
      v50.origin.x = v13;
      v50.origin.y = v15;
      v50.size.width = v17;
      v50.size.height = v19;
      v51 = CGRectApplyAffineTransform(v50, &v44);
      x = v51.origin.x;
      y = v51.origin.y;
      height = v51.size.height;
      if ((v30 & 1) != 0)
        memset(&v43, 0, sizeof(v43));
      else
        objc_msgSend(v29, "transformFromWP");
      v52.size.width = height * 0.444444444;
      v52.origin.x = x;
      v52.origin.y = y;
      v52.size.height = height;
      v53 = CGRectApplyAffineTransform(v52, &v43);
      v37 = v53.origin.x;
      v38 = v53.origin.y;
      width = v53.size.width;
      v40 = v53.size.height;
      if (CGRectIsEmpty(v53))
      {
        Mutable = 0;
      }
      else
      {
        Mutable = CGPathCreateMutable();
        v54.origin.x = v37;
        v54.origin.y = v38;
        v54.size.width = width;
        v54.size.height = v40;
        v55 = CGRectIntegral(v54);
        CGPathAddRect(Mutable, 0, v55);
      }

    }
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectionPath"));
  *(_QWORD *)&v9 = objc_opt_class(CRLWPSelection, v8).n128_u64[0];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostSpecificSelectionOfClass:", v10, v9));

  objc_msgSend(v11, "range");
  if (v12)
  {
    LOBYTE(v15) = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:suppressChildReps:drawBackground:inset:](self, "textImageForSelection:frame:usingGlyphRect:shouldPulsate:suppressInvisibles:suppressChildReps:drawBackground:inset:", v11, 0, 0, v5, 0, 0, -1.0, v15));
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[CRLWPRepHelper animationDidStop:caretLayer:floatingCaretLayer:](self->_repHelper, "animationDidStop:caretLayer:floatingCaretLayer:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "animationForKey:", CFSTR("dropAnimation")));

  v7 = v10;
  if (v6 == v10)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep floatingCaretLayer](self, "floatingCaretLayer"));
    objc_msgSend(v8, "removeFromSuperlayer");

    -[CRLWPRep setFloatingCaretLayer:](self, "setFloatingCaretLayer:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v9, "invalidateOverlayLayersForRep:", self);

    v7 = v10;
  }

}

- (NSArray)scribbleCapableElements
{
  CRLWPRep *v3;

  v3 = self;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)prepareForScribbleBlock
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003842C4;
  v5[3] = &unk_101256390;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (id)willBeginWritingBlock
{
  return 0;
}

- (id)scribbleEditingBlock
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100384354;
  v5[3] = &unk_1012563B8;
  v5[4] = self;
  v2 = objc_retainBlock(v5);
  v3 = objc_retainBlock(v2);

  return v3;
}

- (void)scribbleSetSelectionForBeginEditingWithBoundsPoint:(CGPoint)a3 tappedInRep:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  unint64_t v25;
  unsigned int v26;
  void *v27;
  CRLWPSelection *v28;
  void *v29;
  CRLWPSelection *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int8 v38;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasController"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v11).n128_u64[0];
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mostSpecificCurrentEditorOfClass:", v13, v12));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "storage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storage"));

  if (v15 != v16)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012563D8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E284A0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012563F8);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100DE7E60();
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPRep scribbleSetSelectionForBeginEditingWithBoundsPoint:tappedInRep:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPRep.mm"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 4761, 0, "Expected the tapped rep to match our storage.");

  }
  objc_msgSend(v9, "convertBoundsToUnscaledPoint:", x, y);
  -[CRLCanvasRep convertNaturalPointFromUnscaledCanvas:](self, "convertNaturalPointFromUnscaledCanvas:");
  v21 = v20;
  v23 = v22;
  v38 = 0;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
  LOBYTE(v35) = 0;
  v25 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:", 0, 0, 1, 1, &v38, 0, v21, v23, v35, v24);

  v26 = v38;
  if (-[CRLWPRep scribbleExceedsVerticalDistanceForNearestCharIndex:boundsPoint:isAtEndOfLine:](self, "scribbleExceedsVerticalDistanceForNearestCharIndex:boundsPoint:isAtEndOfLine:", v25, v38, x, y))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layout"));
    LOBYTE(v36) = 0;
    v25 = +[CRLWPColumn charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:](CRLWPColumn, "charIndexFromPoint:allowPastBreak:allowNotFound:pastCenterGoesToNextChar:constrainToAscentAndDescent:isAtEndOfLine:leadingEdge:ignoreEmptyColumns:inLayoutTarget:", 0, 0, 1, 0, &v38, 0, v21, v23, v36, v27);

    v26 = v38;
  }
  v28 = [CRLWPSelection alloc];
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storage"));
  LOBYTE(v37) = 1;
  v30 = -[CRLWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](v28, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, v25, 0, 0, v26, 0x7FFFFFFFFFFFFFFFLL, 0, v37, v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionModelTranslator"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "storage"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "selectionPathForSelection:onStorage:", v30, v32));

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  objc_msgSend(v34, "setSelectionPath:", v33);

}

- (BOOL)scribbleExceedsVerticalDistanceForNearestCharIndex:(unint64_t)a3 boundsPoint:(CGPoint)a4 isAtEndOfLine:(BOOL)a5
{
  BOOL v5;
  double y;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  y = a4.y;
  -[CRLWPRep caretRectForCharIndex:caretAffinity:](self, "caretRectForCharIndex:caretAffinity:", a3, a5, a4.x);
  -[CRLCanvasRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", sub_100061400(v8, v9, v10, v11));
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep canvas](self, "canvas"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasController"));

  objc_msgSend(v17, "convertUnscaledToBoundsPoint:", v13, v15);
  v5 = vabdd_f64(y, v18) > 100.0;

  return v5;
}

- (CGRect)scaledScribbleEditingFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLCanvasRep frameInUnscaledCanvas](self, "frameInUnscaledCanvas");
  objc_msgSend(v3, "convertUnscaledToBoundsRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)shouldDelayScribbleFocus
{
  return 0;
}

- (BOOL)scribbleElementIsFocused
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPRep textEditor](self, "textEditor"));
  v3 = v2 != 0;

  return v3;
}

- (void)updateUniversalAccessZoomWindow
{
  _QWORD *v3;
  CRLWPSelection *v4;
  CRLWPSelection *v5;
  _QWORD v6[4];
  CRLWPSelection *v7;
  CRLWPRep *v8;
  _QWORD *v9;
  _QWORD v10[5];

  if (_UIAccessibilityZoomTouchEnabled(self, a2))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100384D08;
    v10[3] = &unk_101256420;
    v10[4] = self;
    v3 = objc_retainBlock(v10);
    if (((uint64_t (*)(_QWORD *, CRLWPSelection *))v3[2])(v3, self->_lastSelection) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = self->_lastSelection;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100384E5C;
      v6[3] = &unk_101256448;
      v8 = self;
      v9 = v3;
      v7 = v4;
      v5 = v4;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    }
  }
}

- (CGRect)p_convertRectIntoZoomCoordinates:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  -[CRLCanvasRep convertNaturalRectToUnscaledCanvas:](self, "convertNaturalRectToUnscaledCanvas:", x, y, width, height);
  objc_msgSend(v8, "convertUnscaledToBoundsRect:");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)p_selectionPathIncludingInfo:(id)a3 excludingInfo:(id)a4
{
  return 0;
}

- (id)p_textEditorForTextStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1003851FC;
  v17 = sub_10038520C;
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRep interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100385214;
  v10[3] = &unk_101256470;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateEditorsOnStackUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSUUID)scribbleIdentifier
{
  return self->_scribbleIdentifier;
}

- (CRLWPSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
}

- (BOOL)findIsShowing
{
  return self->_findIsShowing;
}

- (void)setFindIsShowing:(BOOL)a3
{
  self->_findIsShowing = a3;
}

- (CRLWPStorageSpellChecker)spellChecker
{
  return self->_spellChecker;
}

- (BOOL)usesStandardHighlightColorForReplaceSelections
{
  return self->_usesStandardHighlightColorForReplaceSelections;
}

- (void)setUsesStandardHighlightColorForReplaceSelections:(BOOL)a3
{
  self->_usesStandardHighlightColorForReplaceSelections = a3;
}

- (CALayer)dragAndDropTopicLayer
{
  return self->_dragAndDropTopicLayer;
}

- (void)setDragAndDropTopicLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dragAndDropTopicLayer, a3);
}

- (CRLNoDefaultImplicitActionLayer)dragAndDropTopicIndentLayer
{
  return self->_dragAndDropTopicIndentLayer;
}

- (void)setDragAndDropTopicIndentLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dragAndDropTopicIndentLayer, a3);
}

- (CAShapeLayer)dragAndDropCaretLayer
{
  return self->_dragAndDropCaretLayer;
}

- (void)setDragAndDropCaretLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dragAndDropCaretLayer, a3);
}

- (CRLColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (CRLWPSelection)dropSelection
{
  return (CRLWPSelection *)objc_loadWeakRetained((id *)&self->_dropSelection);
}

- (BOOL)dragOperationInProgress
{
  return self->_dragOperationInProgress;
}

- (void)setDragOperationInProgress:(BOOL)a3
{
  self->_dragOperationInProgress = a3;
}

- (BOOL)isSelectionHighlightSuppressed
{
  return self->_suppressSelectionHighlight;
}

- (BOOL)suppressSelectionControls
{
  return self->_suppressSelectionControls;
}

- (void)setSuppressSelectionControls:(BOOL)a3
{
  self->_suppressSelectionControls = a3;
}

- (_NSRange)dragRange
{
  _NSRange *p_dragRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_dragRange = &self->_dragRange;
  location = self->_dragRange.location;
  length = p_dragRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)useKeyboardWhenEditing
{
  return self->_useKeyboardWhenEditing;
}

- (void)setUseKeyboardWhenEditing:(BOOL)a3
{
  self->_useKeyboardWhenEditing = a3;
}

- (BOOL)shouldIgnoreFirstRequestToShowEditMenu
{
  return self->_shouldIgnoreFirstRequestToShowEditMenu;
}

- (void)setShouldIgnoreFirstRequestToShowEditMenu:(BOOL)a3
{
  self->_shouldIgnoreFirstRequestToShowEditMenu = a3;
}

- (BOOL)hasOverflowed
{
  return self->_hasOverflowed;
}

- (void)setHasOverflowed:(BOOL)a3
{
  self->_hasOverflowed = a3;
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
  objc_storeStrong((id *)&self->_searchReferences, a3);
}

- (CAShapeLayer)floatingCaretLayer
{
  return self->_floatingCaretLayer;
}

- (void)setFloatingCaretLayer:(id)a3
{
  objc_storeStrong((id *)&self->_floatingCaretLayer, a3);
}

- (BOOL)dragAndDropCaretLayerIsForCaret
{
  return self->_dragAndDropCaretLayerIsForCaret;
}

- (void)setDragAndDropCaretLayerIsForCaret:(BOOL)a3
{
  self->_dragAndDropCaretLayerIsForCaret = a3;
}

- (CRLWPSelection)lastSelection
{
  return self->_lastSelection;
}

- (void)setLastSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (double)ibeamLength
{
  return self->_ibeamLength;
}

- (void)setIbeamLength:(double)a3
{
  self->_ibeamLength = a3;
}

- (CRLColor)overrideCaretColor
{
  return self->_overrideCaretColor;
}

- (void)setOverrideCaretColor:(id)a3
{
  objc_storeStrong((id *)&self->_overrideCaretColor, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  CALayer **textLayers;
  uint64_t j;

  objc_storeStrong((id *)&self->_overrideCaretColor, 0);
  objc_storeStrong((id *)&self->_floatingCaretLayer, 0);
  objc_storeStrong((id *)&self->_searchReferences, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_dragAndDropCaretLayer, 0);
  objc_storeStrong((id *)&self->_dragAndDropTopicIndentLayer, 0);
  objc_storeStrong((id *)&self->_dragAndDropTopicLayer, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_dragAndDropHelper, 0);
  objc_storeStrong((id *)&self->_scribbleIdentifier, 0);
  objc_storeStrong((id *)&self->_repHelper, 0);
  objc_storeStrong((id *)&self->_caretController, 0);
  objc_storeStrong((id *)&self->_collaboratorCursorRenderable, 0);
  objc_destroyWeak((id *)&self->_dropSelection);
  objc_storeStrong((id *)&self->_lastSelection, 0);
  objc_storeStrong((id *)&self->_ungrammaticRanges, 0);
  objc_storeStrong((id *)&self->_misspelledRanges, 0);
  objc_storeStrong((id *)&self->_spellChecker, 0);
  objc_storeStrong((id *)&self->_caretPulseController, 0);
  objc_storeStrong((id *)&self->_highlightArrayController, 0);
  objc_storeStrong((id *)&self->_pulseArrayController, 0);
  objc_storeStrong((id *)&self->_secondaryHighlightLayer, 0);
  objc_storeStrong((id *)&self->_smartFieldHighlightLayer, 0);
  objc_storeStrong((id *)&self->_markHighlightLayer, 0);
  objc_storeStrong((id *)&self->_selectionParagraphBorderLayer, 0);
  objc_storeStrong((id *)&self->_selectionHighlightLayer, 0);
  for (i = 1; i != -1; --i)
    objc_storeStrong((id *)&self->_selectionLineLayers[i], 0);
  objc_storeStrong((id *)&self->_caretLayer, 0);
  textLayers = self->_textLayers;
  for (j = 1; j != -1; --j)
    objc_storeStrong((id *)&textLayers[j], 0);
}

- (NSArray)hyperlinkRegions
{
  CRLWPRep *v2;
  Class isa;

  v2 = self;
  CRLWPRep.hyperlinkRegions.getter();

  sub_1004B8930(0, &qword_1013F8488, off_1012298E0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (CGRect)getCurrentTextFieldBounds
{
  CRLWPRep *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_1008BA61C();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)contextMenuConfigurationAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CRLWPRep *v5;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1009ABFBC(v5, x, y);
  v7 = v6;

  return v7;
}

- (id)contextMenuPreviewForHighlightingMenuAtPoint:(CGPoint)a3 withConfiguration:(id)a4
{
  double y;
  double x;
  id v7;
  CRLWPRep *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_1009AD050((uint64_t)v7, v8, x, y);

  return v9;
}

@end
