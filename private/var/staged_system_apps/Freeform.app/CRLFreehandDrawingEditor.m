@implementation CRLFreehandDrawingEditor

- (BOOL)isEditingFreehandDrawing
{
  return 1;
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

- (NSSet)freehandDrawingInfos
{
  double v3;
  uint64_t v4;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, a2).n128_u64[0];
  return (NSSet *)-[CRLBoardItemEditor boardItemsOfClass:](self, "boardItemsOfClass:", v4, v3);
}

- (id)p_infosToSeparate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_shapeItemsSelectedInFreehandDrawings](self, "p_shapeItemsSelectedInFreehandDrawings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
  if (objc_msgSend(v4, "count") == (id)1
    && (v5 = objc_msgSend(v3, "count"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "anyObject")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "childInfos")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v5 == v8))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }
  else
  {
    v9 = v3;
  }
  v10 = v9;

  return v10;
}

- (id)p_infosToMerge
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "childInfos"));
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)p_shapeItemsSelectedInFreehandDrawings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v20 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "infosForCurrentSelectionPath"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v11);
        objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v8);
        v14 = sub_100221D0C(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containingGroup"));
          v18 = objc_msgSend(v5, "containsObject:", v17);

          if (v18)
            objc_msgSend(v4, "addObject:", v16);
        }

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v4;
}

- (BOOL)p_areAllSelectedInfosFreehandDrawings
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infosForCurrentSelectionPath", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
        {
          objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v5);
          if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
          {
            v12 = 0;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

- (id)p_pngDataForInfo:(id)a3
{
  id v4;
  CRLCanvasImager *v5;
  void *v6;
  void *v7;
  CRLCanvasImager *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v16;

  v4 = a3;
  v5 = [CRLCanvasImager alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mainBoard"));
  v8 = -[CRLCanvasImager initWithBoard:](v5, "initWithBoard:", v7);

  v16 = v4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  -[CRLCanvasImager setInfos:](v8, "setInfos:", v9);

  -[CRLFreehandDrawingEditor p_sizeForExportingInfo:](self, "p_sizeForExportingInfo:", v4);
  v11 = v10;
  v13 = v12;

  -[CRLCanvasImager setScaledImageSize:](v8, "setScaledImageSize:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasImager pngData](v8, "pngData"));

  return v14;
}

- (CGSize)p_sizeForExportingInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _QWORD v27[5];
  uint64_t v28;
  double *v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  CGSize result;

  v4 = a3;
  v28 = 0;
  v29 = (double *)&v28;
  v30 = 0x4010000000;
  v31 = &unk_1010E66AB;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layoutForInfoNearestVisibleRect:", v4));

  if (v6)
  {
    objc_msgSend(v6, "frameForCulling");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = v29;
    *((_QWORD *)v29 + 4) = v8;
    *((_QWORD *)v15 + 5) = v10;
    v15[6] = v11;
    v15[7] = v13;
  }
  else
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1002AD114;
    v27[3] = &unk_1012374B0;
    v27[4] = &v28;
    objc_msgSend(v4, "withTemporaryLayoutPerform:", v27);
    v12 = v29[6];
    v14 = v29[7];
  }
  v16 = sub_1000603DC(v12, v14, 2.0);
  v18 = v17;
  v19 = sub_100062E78(1, v16, v17, 1000.0, 1000.0);
  v20 = v19 > v16;
  if (v21 > v18)
    v20 = 1;
  if (!v20)
    v19 = v16;
  v22 = sub_100063090(v19);
  v24 = v23;

  _Block_object_dispose(&v28, 8);
  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)transform:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  objc_msgSend(v3, "beginDrawingTransformModeIfNeeded");

}

- (void)separate:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSeparate](self, "p_infosToSeparate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Separate"), 0, CFSTR("UndoStrings")));
  -[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:](self, "p_separateInfos:preserveInitialSelection:actionString:", v6, 0, v5);

}

- (void)mergeDrawings:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToMerge](self, "p_infosToMerge", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Merge"), 0, CFSTR("UndoStrings")));
  -[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:](self, "p_separateInfos:preserveInitialSelection:actionString:", v6, 1, v5);

}

- (void)straighten:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pencilKitCanvasViewControllerForCanvasViewController:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartSelectionManager"));
  objc_msgSend(v9, "straighten:", v4);

}

- (void)copyAsText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pencilKitCanvasViewControllerForCanvasViewController:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartSelectionManager"));
  objc_msgSend(v9, "copyAsText:", v4);

}

- (void)translateHandwrittenText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pencilKitCanvasViewControllerForCanvasViewController:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "smartSelectionManager"));
  objc_msgSend(v9, "translate:", v4);

}

- (id)p_firstDrawingInfo
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v8 = sub_100221D0C(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (BOOL)p_hasTransformableDrawingsSelected
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "infosForCurrentSelectionPath", 0));
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (void)didBecomeCurrentEditorForEditorController:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  -[CRLFreehandDrawingEditor p_fixUpCurrentSelectionPathIfNeeded:](self, "p_fixUpCurrentSelectionPathIfNeeded:", v5);

  v6.receiver = self;
  v6.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor didBecomeCurrentEditorForEditorController:](&v6, "didBecomeCurrentEditorForEditorController:", v4);

}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  -[CRLFreehandDrawingEditor p_fixUpCurrentSelectionPathIfNeeded:](self, "p_fixUpCurrentSelectionPathIfNeeded:", v11);

  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLGroupEditor selectionDidChangeFromSelection:toSelection:withFlags:](&v12, "selectionDidChangeFromSelection:toSelection:withFlags:", v9, v8, a5);

}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CRLFreehandDrawingEditor p_fixUpCurrentSelectionPathIfNeeded:](self, "p_fixUpCurrentSelectionPathIfNeeded:", v8);
  v14.receiver = self;
  v14.super_class = (Class)CRLFreehandDrawingEditor;
  v11 = -[CRLGroupEditor nextEditorForSelection:withNewEditorStack:selectionPath:](&v14, "nextEditorForSelection:withNewEditorStack:selectionPath:", v10, v9, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v7;
  void *v8;
  unsigned int v9;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int64_t v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  BOOL v19;
  unsigned int v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  unsigned int v34;
  unsigned int v35;
  void *v36;
  void *v37;
  CRLFreehandDrawingEditor *v38;
  objc_super v40;

  v6 = a4;
  v7 = -[CRLFreehandDrawingEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = -[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode");
  if ("transform:" == a3)
  {
    v16 = -[CRLFreehandDrawingEditor p_hasTransformableDrawingsSelected](self, "p_hasTransformableDrawingsSelected");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingToolkit"));
    v18 = objc_msgSend(v17, "wantsToSuppressKnobsOnTransformReps");

    v19 = (v16 & v18) == 0;
LABEL_14:
    if (v19)
      v15 = -1;
    else
      v15 = 1;
    goto LABEL_79;
  }
  if ("separate:" == a3 || "mergeDrawings:" == a3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSeparate](self, "p_infosToSeparate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToMerge](self, "p_infosToMerge"));
    v13 = objc_msgSend(v11, "count");
    v14 = objc_msgSend(v12, "count");
    if ("separate:" == a3)
    {
      if (v13 == v14)
      {
        v15 = -1;
      }
      else
      {
        if (objc_msgSend(v11, "count"))
          v25 = v7;
        else
          v25 = 0;
        if ((v25 & 1) != 0)
          v15 = 1;
        else
          v15 = -1;
      }
    }
    else if (v7)
    {
      v15 = -1;
      if (v13 == v14 && objc_msgSend(v12, "count"))
        v15 = 1;
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
      if ((unint64_t)objc_msgSend(v23, "count") > 1)
        v15 = 1;
      else
        v15 = -1;

    }
  }
  else
  {
    v20 = v9;
    if ("p_beginFreehandDrawingMode:" == a3)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "freehandDrawingToolkit"));
      if ((objc_msgSend(v22, "canBeginFreehandDrawingMode") & (v20 ^ 1)) != 0)
        v15 = 1;
      else
        v15 = -1;

    }
    else
    {
      if ("snapToShape:" == a3)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSnapToShape](self, "p_infosToSnapToShape"));
        if (objc_msgSend(v24, "count"))
        {
          v15 = -1;
          if (-[CRLFreehandDrawingEditor p_areAllSelectedInfosFreehandDrawings](self, "p_areAllSelectedInfosFreehandDrawings")&& -[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape"))
          {
            v15 = 1;
          }
        }
        else
        {
          v15 = -1;
        }
        goto LABEL_78;
      }
      if ("straighten:" != a3 && "copyAsText:" != a3)
      {
        if ("translateHandwrittenText:" != a3)
        {
          v21 = v7 | v9;
          if ("group:" == a3 && (v21 & 1) != 0)
            goto LABEL_24;
          v31 = "copy:" == a3 ? v7 | v9 : 0;
          if (v31 != 1)
          {
            if ("cut:" != a3)
              v21 = 0;
            if (v21 != 1)
            {
              if ("delete:" == a3)
                v35 = v9;
              else
                v35 = 0;
              if (v35 != 1
                || (v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController")),
                    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "currentEditors")),
                    v38 = (CRLFreehandDrawingEditor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "lastObject")),
                    v38,
                    v37,
                    v36,
                    v38 != self))
              {
                v40.receiver = self;
                v40.super_class = (Class)CRLFreehandDrawingEditor;
                v15 = -[CRLGroupEditor canPerformEditorAction:withSender:](&v40, "canPerformEditorAction:withSender:", a3, v6);
                goto LABEL_79;
              }
              goto LABEL_24;
            }
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "canvasEditorHelper"));
            v34 = objc_msgSend(v33, "shouldAllowPotentiallyKeyboardBasedActionForSender:", v6);

            if (!v34)
            {
LABEL_24:
              v15 = -1;
              goto LABEL_79;
            }
          }
          v19 = !-[CRLFreehandDrawingEditor canCopySubselection](self, "canCopySubselection");
          goto LABEL_14;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "asiOSCVC"));

        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "delegate"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "pencilKitCanvasViewControllerForCanvasViewController:", v24));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "smartSelectionManager"));
        if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1)&& objc_msgSend(v29, "canTranslate"))
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSnapToShape](self, "p_infosToSnapToShape"));
          if (objc_msgSend(v30, "count")
            && -[CRLFreehandDrawingEditor p_areAllSelectedInfosFreehandDrawings](self, "p_areAllSelectedInfosFreehandDrawings"))
          {
            if (-[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape"))
            {
              v15 = 1;
            }
            else
            {
              v15 = -1;
            }
          }
          else
          {
            v15 = 1;
          }

        }
        else
        {
          v15 = -1;
        }

LABEL_78:
        goto LABEL_79;
      }
      if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
        v15 = 1;
      else
        v15 = -1;
    }
  }
LABEL_79:

  return v15;
}

- (BOOL)p_currentlyInFreehandDrawingMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "freehandDrawingToolkit"));
  v4 = objc_msgSend(v3, "isInDrawingMode");

  return v4;
}

- (BOOL)p_shouldPreventPasteForItemSource:(id)a3
{
  id v4;
  unsigned int v5;

  v4 = a3;
  if (-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode"))
    v5 = objc_msgSend(v4, "hasOnlyNativeFreehandDrawingBoardItems") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (int64_t)editorResponseForCanPasteContentsOfItemSource:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v7;

  v4 = a3;
  if (-[CRLFreehandDrawingEditor p_shouldPreventPasteForItemSource:](self, "p_shouldPreventPasteForItemSource:", v4))
  {
    v5 = -1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLFreehandDrawingEditor;
    v5 = -[CRLGroupEditor editorResponseForCanPasteContentsOfItemSource:](&v7, "editorResponseForCanPasteContentsOfItemSource:", v4);
  }

  return v5;
}

- (void)pasteWithPasteboard:(id)a3 atIndex:(unint64_t)a4 forceMatchStyle:(BOOL)a5 bakeFormulas:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a7;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasEditor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pasteboardController"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "ingestibleItemSourceForPasteboard:", v12));
  v24 = sub_100221DDC(v17, 1, v18, v19, v20, v21, v22, v23, (uint64_t)&OBJC_PROTOCOL___CRLIngestibleItemSource);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (-[CRLFreehandDrawingEditor p_shouldPreventPasteForItemSource:](self, "p_shouldPreventPasteForItemSource:", v25))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C200);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18520();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C220);
    v26 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:]"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 391, 0, "Asked to paste when we said we did not want to!");

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)CRLFreehandDrawingEditor;
    -[CRLGroupEditor pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:](&v29, "pasteWithPasteboard:atIndex:forceMatchStyle:bakeFormulas:completionHandler:", v12, a4, v9, v8, v13);
  }

}

- (BOOL)canPasteIntoCurrentlySelectedGroups
{
  return 1;
}

- (BOOL)canCopySubselection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char isKindOfClass;
  char v10;

  if (-[CRLFreehandDrawingEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionPath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "orderedSelections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));
    objc_opt_class(_TtC8Freeform17CRLGroupSelection, v7);
    isKindOfClass = objc_opt_isKindOfClass(v6, v8);

    v10 = isKindOfClass ^ 1;
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CRLPasteboard generalPasteboard](CRLPasteboard, "generalPasteboard", a3));
  -[CRLFreehandDrawingEditor copySubselectionToPasteboard:](self, "copySubselectionToPasteboard:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  objc_msgSend(v5, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (id)createFreehandDrawingsToCopyForSubselection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *j;
  void *v32;
  void *v33;
  _BOOL4 v34;
  uint64_t v35;
  double v36;
  objc_class *v37;
  objc_class *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  unsigned int v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  BOOL v51;
  char *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id obj;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[6];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[8];
  _BYTE v87[46];
  uint8_t buf[4];
  unsigned int v89;
  __int16 v90;
  const char *v91;
  __int16 v92;
  const char *v93;
  __int16 v94;
  int v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];

  if (!-[CRLFreehandDrawingEditor canCopySubselection](self, "canCopySubselection"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C240);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E186E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C260);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E18640(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 424, 0, "Should not ask for subselection freehand drawings if we cannot copy subselection!");

  }
  v63 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "canvasEditor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "infosForCurrentSelectionPath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topLevelZOrderedSiblingsOfInfos:", v61));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crl_arrayWithObjectsInSet:", v61));

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v83;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v83 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v8);
        v14 = sub_100221D0C(v13, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = v15;
        if (v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containingGroup"));
          v18 = objc_msgSend(v17, "isFreehandDrawing");

          if (v18)
            objc_msgSend(v68, "addObject:", v16);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v98, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v68, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "editingCoordinator"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "boardItemFactory"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topLevelZOrderedSiblingsOfInfos:", v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "crl_arrayWithObjectsInSet:", v22));

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v62 = v23;
    v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
    if (v66)
    {
      v24 = 0;
      v64 = *(_QWORD *)v79;
      do
      {
        v69 = 0;
        do
        {
          if (*(_QWORD *)v79 != v64)
            objc_enumerationMutation(v62);
          v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)v69);
          *(_QWORD *)v86 = 0;
          *(_QWORD *)v87 = v86;
          *(_QWORD *)&v87[8] = 0x3032000000;
          *(_QWORD *)&v87[16] = sub_1002AEC04;
          *(_QWORD *)&v87[24] = sub_1002AEC14;
          *(_QWORD *)&v87[32] = 0;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "selectionPathWithInfo:", v25));
          v77[0] = _NSConcreteStackBlock;
          v77[1] = 3221225472;
          v77[2] = sub_1002AEC1C;
          v77[3] = &unk_101248C88;
          v77[4] = v25;
          v77[5] = v86;
          objc_msgSend(v67, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v26, v77);

          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "makeFreehandDrawingItemWithGeometry:", *(_QWORD *)(*(_QWORD *)v87 + 40)));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v28 = v68;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v74;
            do
            {
              for (j = 0; j != v29; j = (char *)j + 1)
              {
                if (*(_QWORD *)v74 != v30)
                  objc_enumerationMutation(v28);
                v32 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)j);
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "parentInfo"));
                v34 = v33 == v25;

                if (v34)
                {
                  *(_QWORD *)&v36 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v35).n128_u64[0];
                  v38 = v37;
                  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "makeDuplicateOfBoardItem:", v32, v36));
                  v40 = sub_1002223BC(v38, v39);
                  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);

                  objc_msgSend(v27, "addObject:", v41);
                  ++v24;
                }
              }
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v73, v96, 16);
            }
            while (v29);
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "board"));
          objc_msgSend(v71, "beforeInsertionAddNewItems:board:error:", v27, v42, 0);

          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "childInfos"));
          v44 = objc_msgSend(v43, "count") == 0;

          if (v44)
          {
            v45 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124C2C0);
            v46 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109890;
              v89 = v45;
              v90 = 2082;
              v91 = "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]";
              v92 = 2082;
              v93 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
              v94 = 1024;
              v95 = 486;
              _os_log_error_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Every freehand info should have at least one child!", buf, 0x22u);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124C2E0);
            v47 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_ERROR))
            {
              v52 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v89 = v45;
              v90 = 2114;
              v91 = v52;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v47, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v48, v49, 486, 0, "Every freehand info should have at least one child!");

          }
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "childInfos"));
          v51 = objc_msgSend(v50, "count") == 0;

          if (!v51)
            objc_msgSend(v63, "addObject:", v71);

          _Block_object_dispose(v86, 8);
          v69 = (char *)v69 + 1;
        }
        while (v69 != v66);
        v66 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v78, v97, 16);
      }
      while (v66);
    }
    else
    {
      v24 = 0;
    }

    if (v24 != objc_msgSend(v68, "count"))
    {
      v53 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C300);
      v54 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v59 = v54;
        v60 = objc_msgSend(v68, "count");
        *(_DWORD *)v86 = 67110402;
        *(_DWORD *)&v86[4] = v53;
        *(_WORD *)v87 = 2082;
        *(_QWORD *)&v87[2] = "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]";
        *(_WORD *)&v87[10] = 2082;
        *(_QWORD *)&v87[12] = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
        *(_WORD *)&v87[20] = 1024;
        *(_DWORD *)&v87[22] = 492;
        *(_WORD *)&v87[26] = 2048;
        *(_QWORD *)&v87[28] = v60;
        *(_WORD *)&v87[36] = 2048;
        *(_QWORD *)&v87[38] = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Expected to handle %zi shapes but instead did %zi", v86, 0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C320);
      v55 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E185A0(v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection]"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 492, 0, "Expected to handle %zi shapes but instead did %zi", objc_msgSend(v68, "count"), v24);

    }
  }

  return v63;
}

- (void)copySubselectionToPasteboard:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pasteboardController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor createFreehandDrawingsToCopyForSubselection](self, "createFreehandDrawingsToCopyForSubselection"));
  objc_msgSend(v8, "copyUninsertedFreehandDrawingItems:toPasteboard:", v7, v4);

}

- (void)cut:(id)a3
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

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  objc_msgSend(v6, "openGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Cut"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v6, "setCurrentGroupActionString:", v8);

  -[CRLFreehandDrawingEditor copy:](self, "copy:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorForEditAction:withSender:", "delete:", v4));

  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C340);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E187E0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C360);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor cut:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 513, 0, "invalid nil value for '%{public}s'", "deleteEditor");

  }
  objc_msgSend(v10, "performSelector:withObject:", "delete:", v4);
  objc_msgSend(v6, "closeGroup");

}

- (void)insertContentsOfFreehandDrawingsFromItemSource:(id)a3 atUnscaledPoint:(CGPoint)a4 completionHandler:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  CGFloat v22;
  CGFloat v23;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = a5;
  if ((objc_msgSend(v9, "hasOnlyNativeFreehandDrawingBoardItems") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C380);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1886C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C3A0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor insertContentsOfFreehandDrawingsFromItemSource:atUnscaledPoint:completionHandler:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 520, 0, "Should only call this if we have freehand drawings to insert!");

  }
  if (objc_msgSend(v9, "hasOnlyNativeFreehandDrawingBoardItems"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editingCoordinator"));
    objc_msgSend(v15, "suspendCollaborationWithReason:", CFSTR("CRLFreehandEditorInsertingAsyncDrawables"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "editingCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "boardItemFactory"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1002AF514;
    v20[3] = &unk_10124C410;
    v20[4] = self;
    v22 = x;
    v23 = y;
    v21 = v10;
    v19 = objc_msgSend(v9, "loadProvidersForNativeBoardItemsWithBoardItemFactory:loadHandler:", v18, v20);

  }
}

- (void)p_insertFreehandDrawingsFromProviders:(id)a3 atUnscaledPoint:(CGPoint)a4 isCrossDocument:(BOOL)a5 completionHandler:(id)a6
{
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  CGSize size;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  unsigned int v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  CGFloat v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _TtC8Freeform26CRLCommandInsertBoardItems *v54;
  void *v55;
  _TtC8Freeform26CRLCommandInsertBoardItems *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  CRLCommandSelectionBehavior *v65;
  void *v66;
  void *v67;
  void (**v68)(id, void *);
  void *v69;
  CRLFreehandDrawingEditor *v70;
  void *v71;
  id v72;
  uint64_t v73;
  id v74;
  id obj;
  id v76;
  void *i;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  CGAffineTransform t1;
  CGAffineTransform v88;
  CGAffineTransform t2;
  CGAffineTransform v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  CGFloat *v97;
  uint64_t v98;
  void *v99;
  CGPoint origin;
  CGSize v101;
  _BYTE v102[128];
  _BYTE v103[128];
  CGAffineTransform buf;
  _BYTE v105[128];

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v68 = (void (**)(id, void *))a6;
  v76 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  v70 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editingCoordinator"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "boardItemFactory"));

  v96 = 0;
  v97 = (CGFloat *)&v96;
  v98 = 0x4010000000;
  v99 = &unk_1010E66AB;
  size = CGRectNull.size;
  origin = CGRectNull.origin;
  v101 = size;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = v10;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v93;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v93 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)v17);
        *(_QWORD *)&v19 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v14).n128_u64[0];
        v21 = v20;
        v22 = objc_msgSend(v18, "newBoardItemWithFactory:bakedSize:", v78, 0, v19);
        v23 = sub_100221D0C(v21, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if (v24)
        {
          v91[0] = _NSConcreteStackBlock;
          v91[1] = 3221225472;
          v91[2] = sub_1002B0100;
          v91[3] = &unk_1012374B0;
          v91[4] = &v96;
          objc_msgSend(v24, "withTemporaryLayoutPerform:", v91);
          objc_msgSend(v76, "addObject:", v24);
        }
        else
        {
          v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C430);
          v26 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf.a) = 67110146;
            HIDWORD(buf.a) = v25;
            LOWORD(buf.b) = 2082;
            *(_QWORD *)((char *)&buf.b + 2) = "-[CRLFreehandDrawingEditor p_insertFreehandDrawingsFromProviders:atUnscale"
                                              "dPoint:isCrossDocument:completionHandler:]";
            WORD1(buf.c) = 2082;
            *(_QWORD *)((char *)&buf.c + 4) = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreeha"
                                              "ndDrawingEditor.m";
            WORD2(buf.d) = 1024;
            *(_DWORD *)((char *)&buf.d + 6) = 553;
            WORD1(buf.tx) = 2082;
            *(_QWORD *)((char *)&buf.tx + 4) = "drawable";
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)&buf, 0x2Cu);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124C450);
          v27 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            LODWORD(buf.a) = 67109378;
            HIDWORD(buf.a) = v25;
            LOWORD(buf.b) = 2114;
            *(_QWORD *)((char *)&buf.b + 2) = v30;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)&buf, 0x12u);

          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_insertFreehandDrawingsFromProviders:atUnscaledPoint:isCrossDocument:completionHandler:]"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 553, 0, "invalid nil value for '%{public}s'", "drawable");

        }
        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    }
    while (v15);
  }

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_firstDrawingInfo](v70, "p_firstDrawingInfo"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v70, "interactiveCanvasController"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "layoutForInfo:", v71));

  v32 = sub_100061400(v97[4], v97[5], v97[6], v97[7]);
  v33 = sub_1000603B8(x, y, v32);
  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeTranslation(&buf, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "parent"));
  v36 = v35;
  if (v35)
    objc_msgSend(v35, "transformInRoot");
  else
    memset(&v88, 0, sizeof(v88));
  CGAffineTransformInvert(&t2, &v88);
  t1 = buf;
  CGAffineTransformConcat(&v90, &t1, &t2);
  buf = v90;

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v72 = v76;
  v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
  if (v74)
  {
    v73 = *(_QWORD *)v84;
    do
    {
      for (i = 0; i != v74; i = (char *)i + 1)
      {
        if (*(_QWORD *)v84 != v73)
          objc_enumerationMutation(v72);
        v38 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)i);
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "childInfos"));
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v102, 16);
        if (v41)
        {
          v42 = *(_QWORD *)v80;
          do
          {
            for (j = 0; j != v41; j = (char *)j + 1)
            {
              if (*(_QWORD *)v80 != v42)
                objc_enumerationMutation(v39);
              v44 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)j);
              objc_opt_class(_TtC8Freeform12CRLShapeItem, v40);
              v46 = sub_100221D0C(v45, v44);
              v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
              if (v47)
              {
                v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "ungroupedGeometryForChildItem:", v47));
                objc_msgSend(v47, "setGeometry:", v48);

                v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "geometry"));
                v90 = buf;
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "geometryByAppendingTransform:", &v90));
                objc_msgSend(v47, "setGeometry:", v50);

                objc_msgSend(v47, "setParentInfo:", 0);
                objc_msgSend(v37, "addObject:", v47);
              }

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v79, v102, 16);
          }
          while (v41);
        }

      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v83, v103, 16);
    }
    while (v74);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v70, "interactiveCanvasController"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "canvasEditor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "canvasEditorHelper"));
  objc_msgSend(v53, "prepareGeometryForInsertingNativelySourcedShapes:intoFreehandDrawing:", v37, v71);

  v54 = [_TtC8Freeform26CRLCommandInsertBoardItems alloc];
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "childInfos"));
  v56 = -[CRLCommandInsertBoardItems initWithParentContainer:boardItems:index:](v54, "initWithParentContainer:boardItems:index:", v71, v37, objc_msgSend(v55, "count"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v70, "interactiveCanvasController"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "selectionModelTranslator"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "selectionPathForNothingSelectedInsideGroup:", v71));

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v70, "interactiveCanvasController"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "canvasEditor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "canvasEditorHelper"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v37));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "selectionPathByReplacingInfosInSelectionPath:withInfos:", v59, v63));

  v65 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithForwardSelectionPath:reverseSelectionPath:", v64, v59);
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v70, "interactiveCanvasController"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "commandController"));
  objc_msgSend(v67, "enqueueCommand:withSelectionBehavior:", v56, v65);

  if (v68)
    v68[2](v68, v37);

  _Block_object_dispose(&v96, 8);
}

- (unint64_t)p_randomExportIdentifier
{
  return vcvtmd_u64_f64(sub_1003C663C(100000.0, 999999.0));
}

- (id)p_suffixForExportedFileWithIdentifier:(unint64_t)a3 index:(unint64_t)a4 count:(unint64_t)a5
{
  NSString *v5;
  uint64_t v7;

  if (a5 < 2)
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%zd"), a3, v7);
  else
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%zd-%zd"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (id)imageURLsOfDrawings
{
  CRLTemporaryDirectory *v3;
  id v4;
  id v5;
  int v6;
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
  unsigned int v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  char *v26;
  id v27;
  CRLTemporaryDirectory *v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v42 = 0;
  v3 = -[CRLTemporaryDirectory initWithError:]([CRLTemporaryDirectory alloc], "initWithError:", &v42);
  v4 = v42;
  if (v4)
  {
    v5 = v4;
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C470);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E188EC((uint64_t)v5, v6);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124C490);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor imageURLsOfDrawings]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 619, 0, "Failed to create a temporary directory for sharing drawings as images: %@", v5);

  }
  else
  {
    v29 = v3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTemporaryDirectory path](v3, "path"));
    v34 = -[CRLFreehandDrawingEditor p_randomExportIdentifier](self, "p_randomExportIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
    v33 = objc_msgSend(v10, "count");

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
    if (v35)
    {
      v36 = 0;
      v5 = 0;
      v32 = *(_QWORD *)v39;
      do
      {
        v11 = 0;
        do
        {
          v12 = v5;
          if (*(_QWORD *)v39 != v32)
            objc_enumerationMutation(obj);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_pngDataForInfo:](self, "p_pngDataForInfo:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v11)));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_suffixForExportedFileWithIdentifier:index:count:](self, "p_suffixForExportedFileWithIdentifier:index:count:", v34, (char *)v11 + v36, v33));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("drawing%@.png"), v14));
          v16 = v8;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v15));
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v17));

          v37 = v12;
          v19 = objc_msgSend(v13, "writeToURL:options:error:", v18, 1, &v37);
          v5 = v37;

          if (v19)
          {
            objc_msgSend(v30, "addObject:", v18);
          }
          else if (v5)
          {
            v20 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124C4B0);
            v21 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67110146;
              v44 = v20;
              v45 = 2082;
              v46 = "-[CRLFreehandDrawingEditor imageURLsOfDrawings]";
              v47 = 2082;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m";
              v49 = 1024;
              v50 = 635;
              v51 = 2112;
              v52 = v5;
              _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Failed to write drawing image data to temporary directory while sharing: %@", buf, 0x2Cu);
            }
            if (qword_10147E370 != -1)
              dispatch_once(&qword_10147E370, &stru_10124C4D0);
            v22 = off_1013D9070;
            if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            {
              v25 = v22;
              v26 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
              *(_DWORD *)buf = 67109378;
              v44 = v20;
              v45 = 2114;
              v46 = v26;
              _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor imageURLsOfDrawings]"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
            +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 635, 0, "Failed to write drawing image data to temporary directory while sharing: %@", v5);

          }
          v11 = (char *)v11 + 1;
          v8 = v16;
        }
        while (v35 != v11);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v53, 16);
        v36 += (uint64_t)v11;
      }
      while (v35);
    }
    else
    {
      v5 = 0;
    }

    v3 = v29;
    -[CRLTemporaryDirectory leakTemporaryDirectory](v29, "leakTemporaryDirectory");
  }

  v27 = objc_msgSend(v30, "copy");
  return v27;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  char *v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
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
  id v61;
  id v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  void *k;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  CRLFreehandDrawingEditor *v72;
  void *v73;
  void *v74;
  void *v75;
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
  objc_super v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v88.receiver = self;
  v88.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v88, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  v75 = v7;
  if (-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode"))
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v8 = objc_msgSend(v7, "copy");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v9)
    {
      v11 = v9;
      v72 = self;
      v12 = *(_QWORD *)v85;
      while (1)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v85 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)i);
          objc_opt_class(UIMenu, v10);
          v16 = sub_100221D0C(v15, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = v17;
          if (v17)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
            if (objc_msgSend(v19, "isEqualToString:", CFSTR("CRLAlignMenuIdentifier")))
            {

            }
            else
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("CRLDistributeMenuIdentifier"));

              v7 = v75;
              if (!v21)
                goto LABEL_12;
            }
            objc_msgSend(v7, "removeObjectIdenticalTo:", v14);
          }
LABEL_12:

        }
        v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
        if (!v11)
        {

          v22 = (char *)objc_msgSend(v7, "count");
          goto LABEL_26;
        }
      }
    }

    v22 = (char *)objc_msgSend(v7, "count");
  }
  else
  {
    v72 = self;
    v22 = (char *)objc_msgSend(v7, "count");
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    v23 = v7;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v81;
      do
      {
        for (j = 0; j != v26; j = (char *)j + 1)
        {
          if (*(_QWORD *)v81 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)j);
          objc_opt_class(UICommand, v25);
          v31 = sub_100221D0C(v30, v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
          v33 = v32;
          if (v32 && sel_isEqual((SEL)objc_msgSend(v32, "action"), "delete:"))
            v22 = (char *)objc_msgSend(v23, "indexOfObjectIdenticalTo:", v29) + 1;

        }
        v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v26);
    }

    v7 = v75;
LABEL_26:
    self = v72;
  }
  if (-[CRLFreehandDrawingEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup"))
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("Resize"), 0, 0));
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage crl_internalSystemImageNamed:](UIImage, "crl_internalSystemImageNamed:", CFSTR("square.resize")));
    v37 = objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v35, v36, "transform:", 0));

    v74 = (void *)v37;
    objc_msgSend(v7, "insertObject:atIndex:", v37, v22);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus.rectangle.on.rectangle")));
    v41 = objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v39, v40, "duplicate:", 0));

    v73 = (void *)v41;
    objc_msgSend(v7, "insertObject:atIndex:", v41, v22 + 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("Separate"), 0, 0));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.split.1x2")));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v43, v44, "separate:", 0));

    objc_msgSend(v7, "insertObject:atIndex:", v45, v22 + 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor snapToShapeActionName](self, "snapToShapeActionName"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLFreehandDrawingEditor snapToShapeActionSymbolName](CRLFreehandDrawingEditor, "snapToShapeActionSymbolName"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v47));
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v46, v48, "snapToShape:", 0));

    v7 = v75;
    objc_msgSend(v75, "insertObject:atIndex:", v49, v22 + 3);
    if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("Straighten"), 0, 0));
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("wrench.adjustable")));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v51, v52, "straighten:", 0));

      objc_msgSend(v75, "insertObject:atIndex:", v71, v22 + 4);
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("Copy as Text"), 0, 0));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("textformat")));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v54, v55, "copyAsText:", 0));

      objc_msgSend(v75, "insertObject:atIndex:", v56, v22 + 5);
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "localizedStringForKey:value:table:", CFSTR("Translate"), 0, 0));
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("translate")));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v58, v59, "translateHandwrittenText:", 0));

      v7 = v75;
      objc_msgSend(v75, "insertObject:atIndex:", v60, v22 + 6);

    }
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v61 = objc_msgSend(v7, "copy", v71);
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
  if (v62)
  {
    v64 = v62;
    v65 = *(_QWORD *)v77;
    while (2)
    {
      for (k = 0; k != v64; k = (char *)k + 1)
      {
        if (*(_QWORD *)v77 != v65)
          objc_enumerationMutation(v61);
        v67 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)k);
        objc_opt_class(UICommand, v63);
        v69 = sub_100221D0C(v68, v67);
        v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
        if (objc_msgSend(v70, "action") == "group:")
        {
          objc_msgSend(v7, "removeObjectIdenticalTo:", v67);

          goto LABEL_41;
        }

      }
      v64 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
      if (v64)
        continue;
      break;
    }
  }
LABEL_41:

}

- (id)snapToShapeActionName
{
  unint64_t v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = -[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2 == 2)
    v5 = CFSTR("Snap to Shapes");
  else
    v5 = CFSTR("Snap to Shape");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (BOOL)crlaxShouldOfferSnapToShapeFromInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSnapToShape](self, "p_infosToSnapToShape"));
  v10 = objc_msgSend(v9, "containsObject:", v8)
     && -[CRLFreehandDrawingEditor canPerformEditorAction:withSender:](self, "canPerformEditorAction:withSender:", "snapToShape:", 0)&& objc_msgSend(v8, "canSnapToShape")&& -[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape") != 0;

  return v10;
}

+ (id)snapToShapeActionSymbolName
{
  return CFSTR("star");
}

- (void)addContextualMenuItemsToArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char **v34;
  void *v35;
  char **v36;
  char *v37;
  void *v38;
  void *v39;
  id v40;
  CRLFreehandDrawingEditor *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  _BYTE v47[128];

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor addContextualMenuItemsToArray:](&v46, "addContextualMenuItemsToArray:", v4);
  if (-[CRLFreehandDrawingEditor p_currentlyEditingInGroup](self, "p_currentlyEditingInGroup"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
    v7 = objc_msgSend(v6, "isLassoAbleToSelectMixedType");

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Resize"), 0, 0));

    v10 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v9, "transform:");
    if ((v7 & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "infosForCurrentSelectionPath"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allObjects"));
      v14 = -[CRLFreehandDrawingEditor p_shouldShowResizeMenuItemForSelectedItems:](self, "p_shouldShowResizeMenuItemForSelectedItems:", v13);

      if (v14)
        objc_msgSend(v4, "addObject:", v10);

    }
    else
    {
      objc_msgSend(v4, "addObject:", v10);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Duplicate"), 0, 0));

    v17 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v16, "duplicate:");
    objc_msgSend(v4, "addObject:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Separate"), 0, 0));

    v20 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v19, "separate:");
    objc_msgSend(v4, "addObject:", v20);
    v21 = -[CRLFreehandDrawingEditor p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape](self, "p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = v22;
    if (v21 == 2)
      v24 = CFSTR("Snap to Shapes");
    else
      v24 = CFSTR("Snap to Shape");
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, 0, 0));

    v26 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v25, "snapToShape:");
    objc_msgSend(v4, "addObject:", v26);

  }
  v41 = self;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("Merge"), 0, 0));

  v29 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v28, "mergeDrawings:");
  objc_msgSend(v4, "addObject:", v29);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v30 = objc_msgSend(v4, "copy");
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v43;
    v34 = &selRef_getRulerSnapLineOriginAndTangent_andNormal_;
    while (2)
    {
      v35 = 0;
      v36 = v34;
      v37 = v34[28];
      do
      {
        if (*(_QWORD *)v43 != v33)
          objc_enumerationMutation(v30);
        v38 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v35);
        if (objc_msgSend(v38, "action") == v37)
        {
          objc_msgSend(v4, "removeObject:", v38);
          goto LABEL_21;
        }
        v35 = (char *)v35 + 1;
      }
      while (v32 != v35);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      v34 = v36;
      if (v32)
        continue;
      break;
    }
  }
LABEL_21:

  if (!-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](v41, "p_currentlyInFreehandDrawingMode"))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_titleForOptionalEditDrawingAction](v41, "p_titleForOptionalEditDrawingAction"));
    if (v39)
    {
      v40 = objc_msgSend(objc_alloc((Class)UIMenuItem), "initWithTitle:action:", v39, "p_beginFreehandDrawingMode:");
      objc_msgSend(v4, "insertObject:atIndex:", v40, 0);

    }
  }

}

- (id)p_titleForOptionalEditDrawingAction
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](self, "freehandDrawingInfos"));
  v3 = objc_msgSend(v2, "count");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (v3 == (id)1)
    v6 = CFSTR("Edit Drawing");
  else
    v6 = CFSTR("Edit Drawings");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return v7;
}

- (CGRect)targetRectForEditMenu
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLFreehandDrawingEditor *v11;
  double v12;
  double v13;
  CKRecordID v14;
  Swift::String v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));

  if (-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "editorController"));
    v11 = (CRLFreehandDrawingEditor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mostSpecificCurrentEditorOfClass:", 0));

    if (v11 == self)
    {
      objc_msgSend(v9, "lastTapPoint");
      objc_msgSend(v7, "convertUnscaledToBoundsPoint:");
      sub_1000603D0(v12, v13, 0.0);
      SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v14, v15);
      x = v16;
      y = v17;
      width = v18;
      height = v19;
    }
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLFreehandDrawingEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v12, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  if (!-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Edit Drawing"), 0, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("scribble")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:action:parent:children:](CRLQuickInspectorElement, "elementWithName:image:type:options:action:parent:children:", v9, v10, 2, 0x1000000, "p_beginFreehandDrawingMode:", 0, 0));

    objc_msgSend(v7, "insertObject:atIndex:", v11, objc_msgSend(v7, "count"));
  }

}

- (void)p_beginFreehandDrawingMode:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "freehandDrawingToolkit"));
  objc_msgSend(v3, "beginDrawingModeIfNeededForTouchType:", 1);

}

- (void)p_separateInfos:(id)a3 preserveInitialSelection:(BOOL)a4 actionString:(id)a5
{
  id v7;
  id v8;
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
  unint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  double v24;
  objc_class *v25;
  objc_class *v26;
  void *v27;
  id v28;
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
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  CRLCanvasInfoGeometry *v44;
  void *v45;
  void *v46;
  CRLCanvasInfoGeometry *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void **p_cache;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  CRLCanvasCommandSelectionBehavior *v77;
  void *v78;
  void *v79;
  CRLCanvasCommandSelectionBehavior *v80;
  _TtC8Freeform27CRLPersistableSelectionPath *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  objc_class *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  CFArrayRef (__cdecl **v99)(CTFontDescriptorRef, CFSetRef);
  void *v100;
  id v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  CRLCanvasCommandSelectionBehavior *v110;
  void *v111;
  CRLCanvasCommandSelectionBehavior *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  _BYTE v124[12];
  void *v125;
  void *v126;
  id v127;
  CRLCanvasInfoGeometry *v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  id v134;
  _BOOL4 v135;
  void *v136;
  CRLFreehandDrawingEditor *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  _BYTE v151[56];
  _QWORD v152[5];
  void *v153;
  _BYTE v154[128];
  _BYTE v155[128];

  v135 = a4;
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "commandController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainBoard"));

  v137 = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boardItemFactory"));

  if (objc_msgSend(v7, "count"))
  {
    v132 = v13;
    v136 = v10;
    objc_msgSend(v11, "openGroup");
    objc_msgSend(v11, "enableProgressiveEnqueuingInCurrentGroup");
    v133 = v11;
    v131 = v8;
    objc_msgSend(v11, "setCurrentGroupActionString:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topLevelZOrderedSiblingsOfInfos:", v7));
    v134 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crl_arrayWithObjectsInSet:", v7));

    v152[0] = _NSConcreteStackBlock;
    v152[1] = 3221225472;
    v152[2] = sub_1002B26C8;
    v152[3] = &unk_10124C4F8;
    v130 = v15;
    v152[4] = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "crl_arrayByTransformingWithBlock:", v152));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v140 = v17;
    v141 = v9;
    if (objc_msgSend(v17, "count"))
    {
      v20 = 0;
      v138 = v18;
      do
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v20));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v20));
        *(_QWORD *)&v24 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v23).n128_u64[0];
        v26 = v25;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "containingGroup", v24));
        v28 = sub_1002223BC(v26, v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutForInfo:", v29));
        if ((objc_msgSend(v19, "containsObject:", v29) & 1) == 0)
          objc_msgSend(v19, "addObject:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "geometry"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "geometry"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "computeInfoGeometryFromPureLayoutGeometry:", v32));
        v34 = v19;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "geometryWithParentGeometry:", v33));

        objc_msgSend(v22, "setGeometry:", v35);
        v19 = v34;

        ++v20;
        v17 = v140;
        v9 = v141;
        v18 = v138;
      }
      while (v20 < (unint64_t)objc_msgSend(v140, "count"));
    }
    if (objc_msgSend(v19, "count") == (id)1)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      *(_QWORD *)&v38 = objc_opt_class(CRLFreehandDrawingLayout, v37).n128_u64[0];
      v40 = v39;
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layoutForInfo:", v36, v38));
      v42 = sub_100221D0C(v40, v41);
      v43 = (void *)objc_claimAutoreleasedReturnValue(v42);

      v44 = [CRLCanvasInfoGeometry alloc];
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "pureGeometry"));
      v46 = v45;
      if (v45)
        objc_msgSend(v45, "fullTransform");
      else
        memset(v151, 0, 48);
      v47 = -[CRLCanvasInfoGeometry initWithFullTransform:widthValid:heightValid:](v44, "initWithFullTransform:widthValid:heightValid:", v151, 1, 1);

    }
    else
    {
      v47 = (CRLCanvasInfoGeometry *)objc_claimAutoreleasedReturnValue(+[CRLGroupItem groupGeometryFromChildrenInfos:](_TtC8Freeform12CRLGroupItem, "groupGeometryFromChildrenInfos:", v18));
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editingCoordinator"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "boardItemFactory"));
    v128 = v47;
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "makeFreehandDrawingItemWithGeometry:", v47));

    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v51 = v18;
    v52 = (uint64_t)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
    v129 = v19;
    if (v52)
    {
      v53 = *(_QWORD *)v148;
      while (2)
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v148 != v53)
            objc_enumerationMutation(v51);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v147 + 1) + 8 * i), "aspectRatioLocked") & 1) != 0)
          {
            v52 = 1;
            goto LABEL_23;
          }
        }
        v52 = (uint64_t)objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v147, v155, 16);
        if (v52)
          continue;
        break;
      }
    }
LABEL_23:

    objc_msgSend(v50, "setAspectRatioLocked:", v52);
    v145 = 0u;
    v146 = 0u;
    v143 = 0u;
    v144 = 0u;
    v55 = v51;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v143, v154, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v144;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(_QWORD *)v144 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * (_QWORD)j);
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "geometry"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "geometry"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "geometryRelativeToGeometry:", v62));

          objc_msgSend(v60, "setGeometry:", v63);
        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v143, v154, 16);
      }
      while (v57);
    }

    v142 = 0;
    objc_msgSend(v50, "beforeInsertionAddNewItems:board:error:", v55, v132, &v142);
    p_cache = &OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer.cache;
    v65 = v141;
    v127 = v142;
    if (v127)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C518);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18AB4();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C538);
      v66 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v67, v68, 970, 0, "expected nil value for '%{public}s'", "insertionError");

    }
    v69 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v50));
    v70 = (void *)v69;
    if (v135)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](v137, "editorController"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "selectionPath"));

      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "canvasEditor"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](v137, "freehandDrawingInfos"));
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "selectionPathWithInfos:", v74));
      v76 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](v137, "editorController"));
      objc_msgSend(v76, "setSelectionPath:", v75);

      v77 = [CRLCanvasCommandSelectionBehavior alloc];
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "canvasEditor"));
      v79 = v70;
      v80 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v77, "initWithCanvasEditor:type:constructedInfos:", v78, 3, v70);

      v81 = -[CRLPersistableSelectionPath initWithSelectionPath:]([_TtC8Freeform27CRLPersistableSelectionPath alloc], "initWithSelectionPath:", v72);
      -[CRLCommandSelectionBehavior setPersistableReverseSelectionPath:](v80, "setPersistableReverseSelectionPath:", v81);

      p_cache = (void **)(&OBJC_METACLASS___CRLFreehandDrawingRepTrifurcationContainer + 16);
    }
    else
    {
      v79 = (void *)v69;
      v80 = 0;
    }
    v82 = objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "selectionPathWithInfos:", 0));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "editorController"));
    v139 = (void *)v82;
    objc_msgSend(v83, "setSelectionPath:", v82);

    v84 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor freehandDrawingInfos](v137, "freehandDrawingInfos"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "anyObject"));

    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "parentInfo"));
    objc_opt_class(NSObject, v87);
    v94 = sub_1002220C8(v86, v88, 1, v89, v90, v91, v92, v93, (uint64_t)&OBJC_PROTOCOL___CRLContainerInfo);
    v95 = objc_claimAutoreleasedReturnValue(v94);

    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "canvasEditorHelper"));
    v153 = v50;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v153, 1));
    v125 = (void *)v95;
    v126 = v85;
    v98 = objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "commandToInsertBoardItems:intoContainer:belowBoardItem:withOffset:", v97, v95, v85, 0));

    *(_QWORD *)&v124[4] = v98;
    if (v98)
    {
      v99 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      v100 = v133;
      objc_msgSend(v133, "enqueueCommand:", v98);
      v101 = v134;
    }
    else
    {
      *(_QWORD *)v124 = objc_msgSend(p_cache + 373, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C558);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E18A28();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C578);
      v102 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v102);
      v103 = p_cache + 373;
      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]"));
      v99 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
      objc_msgSend(v103, "handleFailureInFunction:file:lineNumber:isFatal:description:", v104, v105, 1011, 0, "invalid nil value for '%{public}s'", "insertCommand");

      v100 = v133;
      v101 = v134;
      v65 = v141;
    }
    objc_msgSend(v100, "openGroup");
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "selectionPathWithInfos:", v101));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "editorController"));
    objc_msgSend(v107, "setSelectionPath:", v106);

    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "canvasEditorHelper"));
    objc_msgSend(v108, "delete:", v137);

    objc_msgSend(v100, "closeGroup");
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "editorController"));
    objc_msgSend(v109, "setSelectionPath:", v139);

    if (!v135)
    {
      v110 = [CRLCanvasCommandSelectionBehavior alloc];
      v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "canvasEditor"));
      v112 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v110, "initWithCanvasEditor:type:constructedInfos:", v111, 3, v79);

      v80 = v112;
    }
    v10 = v136;
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "selectionPathWithInfos:", v79));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "editorController"));
    objc_msgSend(v114, "setSelectionPath:", v113);

    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "arrangeInspectorDelegate"));
    objc_msgSend(v115, "moveToFrontForArrangeInspector");

    if (!v80)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C598);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1899C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124C5B8);
      v116 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v116);
      v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99[444], "stringWithUTF8String:", "-[CRLFreehandDrawingEditor p_separateInfos:preserveInitialSelection:actionString:]"));
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99[444], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLFreehandDrawingEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v117, v118, 1034, 0, "invalid nil value for '%{public}s'", "selectionBehavior");

      v10 = v136;
    }
    v11 = v133;
    objc_msgSend(v133, "closeGroupWithSelectionBehavior:", v80);
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v137, "interactiveCanvasController"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "freehandDrawingToolkit"));
    objc_msgSend(v120, "endDrawingModeIfNeeded");

    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathWithInfos:", v79));
    v122 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v137, "interactiveCanvasController"));
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "editorController"));
    objc_msgSend(v123, "setSelectionPath:", v121);

    v7 = v134;
    v8 = v131;
    v13 = v132;
    v9 = v141;
    v15 = v130;
  }

}

- (unint64_t)p_countOfShapesSelectedInFreehandDrawingAbleToSnapToShape
{
  void *v3;
  void *v4;
  CRLFreehandDrawingSnapToShapeHelper *v5;
  id v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSnapToShape](self, "p_infosToSnapToShape"));
  v5 = -[CRLFreehandDrawingSnapToShapeHelper initWithInteractiveCanvasController:]([CRLFreehandDrawingSnapToShapeHelper alloc], "initWithInteractiveCanvasController:", v3);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = (unint64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
  {

    goto LABEL_19;
  }
  v8 = 0;
  v9 = *(_QWORD *)v16;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if (objc_msgSend(v11, "canSnapToShape", (_QWORD)v15))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper unscaledPKStrokesBySnappingShapeItem:](v5, "unscaledPKStrokesBySnappingShapeItem:", v11));
        v13 = v12;
        if (v12 && objc_msgSend(v12, "count"))
        {
          if (v8 > 0)
          {

LABEL_17:
            v7 = 2;
            goto LABEL_19;
          }
          ++v8;
        }

      }
    }
    v7 = (unint64_t)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
      continue;
    break;
  }

  v7 = v8 == 1;
  if (v8 >= 2)
    goto LABEL_17;
LABEL_19:

  return v7;
}

- (void)snapToShape:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  CRLFreehandDrawingSnapToShapeHelper *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CRLCanvasCommandSelectionBehavior *v20;
  void *v21;
  CRLCanvasCommandSelectionBehavior *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingEditor p_infosToSnapToShape](self, "p_infosToSnapToShape", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v24 = v5;
  v7 = -[CRLFreehandDrawingSnapToShapeHelper initWithInteractiveCanvasController:]([CRLFreehandDrawingSnapToShapeHelper alloc], "initWithInteractiveCanvasController:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v6, "openGroup");
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Snap to Shapes"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v6, "setCurrentGroupActionString:", v10);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v16, "canSnapToShape"))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper unscaledPKStrokesBySnappingShapeItem:](v7, "unscaledPKStrokesBySnappingShapeItem:", v16));
          v25 = 0;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLFreehandDrawingSnapToShapeHelper commandForSnappingShapeItem:toStrokesInUnscaledSpace:outCreatedAndModifiedShapes:](v7, "commandForSnappingShapeItem:toStrokesInUnscaledSpace:outCreatedAndModifiedShapes:", v16, v17, &v25));
          v19 = v25;
          objc_msgSend(v8, "addObjectsFromArray:", v19);
          objc_msgSend(v6, "enqueueCommand:", v18);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v20 = [CRLCanvasCommandSelectionBehavior alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasEditor"));
  v22 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v20, "initWithCanvasEditor:type:constructedInfos:", v21, 3, v8);

  objc_msgSend(v6, "closeGroupWithSelectionBehavior:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "canvasEditor"));
  objc_msgSend(v23, "hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected");

}

- (void)p_fixUpCurrentSelectionPathIfNeeded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  if ((objc_msgSend(v5, "isInDynamicOperation") & 1) == 0
    && !-[CRLFreehandDrawingEditor p_currentlyInFreehandDrawingMode](self, "p_currentlyInFreehandDrawingMode"))
  {
    *(_QWORD *)&v7 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v6).n128_u64[0];
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificSelectionOfClass:", v8, v7));
    *(_QWORD *)&v11 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v10).n128_u64[0];
    if (objc_msgSend(v9, "containsKindOfClass:", v12, v11))
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1002B2D4C;
      v14[3] = &unk_10122D3B0;
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
      v16 = v5;
      v17 = v9;
      v13 = v15;
      objc_msgSend(v13, "performBlockAfterSettingSelection:", v14);

    }
  }

}

- (BOOL)p_shouldShowResizeMenuItemForSelectedItems:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayByTransformingWithBlock:", &stru_10124C5F8));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v12 = objc_opt_class(_TtC8Freeform12CRLGroupItem, v7).n128_u64[0];
        if (objc_msgSend(v11, "isMemberOfClass:", v13, v12, (_QWORD)v23))
        {
          objc_opt_class(_TtC8Freeform12CRLGroupItem, v14);
          v16 = sub_100221D0C(v15, v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allNestedChildrenItemsExcludingGroups"));
          objc_msgSend(v4, "addObjectsFromArray:", v18);

        }
        else
        {
          objc_msgSend(v4, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v8);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crl_arrayByTransformingWithBlock:", &stru_10124C638));
  if (objc_msgSend(v19, "count"))
  {
    v20 = objc_msgSend(v19, "count");
    v21 = v20 == objc_msgSend(v4, "count");
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

@end
