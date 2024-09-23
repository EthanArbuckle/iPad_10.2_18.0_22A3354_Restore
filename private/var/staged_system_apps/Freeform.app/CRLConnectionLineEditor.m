@implementation CRLConnectionLineEditor

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  int64_t v8;
  objc_super v10;

  v6 = a4;
  if ("toggleLineType:" == a3 || "setConnectionLineType:" == a3)
  {
    v8 = 1;
  }
  else if ("saveDefaultInsertionPreset:" == a3)
  {
    if (-[CRLConnectionLineEditor p_canSaveDefaultInsertionPreset](self, "p_canSaveDefaultInsertionPreset"))
      v8 = 1;
    else
      v8 = -1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLConnectionLineEditor;
    v8 = -[CRLShapeEditor canPerformEditorAction:withSender:](&v10, "canPerformEditorAction:withSender:", a3, v6);
  }

  return v8;
}

- (void)toggleLineType:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  void *v8;
  CRLCanvasCommandSelectionBehavior *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));

  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
  v9 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v6, "initWithCanvasEditor:", v8);

  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v9);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v15);
        objc_opt_class(CRLConnectionLineAbstractLayout, v12);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "commandToToggleConnectionType"));
          objc_msgSend(v5, "enqueueCommand:", v18);

        }
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v13);
  }

  objc_msgSend(v5, "closeGroup");
}

- (void)setConnectionLineType:(int64_t)a3
{
  void *v5;
  void *v6;
  CRLCanvasCommandSelectionBehavior *v7;
  void *v8;
  void *v9;
  CRLCanvasCommandSelectionBehavior *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

  v7 = [CRLCanvasCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  v10 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v7, "initWithCanvasEditor:", v9);

  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v10);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v14 = v12;
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16);
        objc_opt_class(CRLConnectionLineAbstractLayout, v13);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "commandForSettingConnectionType:", a3));
          objc_msgSend(v6, "enqueueCommand:", v19);

        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  objc_msgSend(v6, "closeGroup");
}

- (id)anyConnectionLine
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  CKRecordID v10;
  Swift::String v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v3)
  {
LABEL_9:

    SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)(v10, v11);
    abort();
  }
  v5 = v3;
  v6 = *(_QWORD *)v15;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v6)
      objc_enumerationMutation(v2);
    v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v7);
    objc_opt_class(CRLConnectionLineAbstractLayout, v4);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      break;
    if (v5 == (id)++v7)
    {
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v5)
        goto LABEL_9;
      goto LABEL_3;
    }
  }
  v12 = v8;

  return v12;
}

- (id)connectionLines
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9);
        objc_opt_class(CRLConnectionLineAbstractLayout, v6);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          objc_msgSend(v3, "addObject:", v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v3;
}

- (double)p_outsetOnLeft:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  double v14;

  v3 = a3;
  *(_QWORD *)&v5 = objc_opt_class(CRLConnectionLineAbstractLayout, a2).n128_u64[0];
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anyObject"));
  v10 = sub_100221D0C(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  -[CRLConnectionLineEditor p_setDynamicOutsetFrom:](self, "p_setDynamicOutsetFrom:", v11);
  v12 = objc_msgSend(v11, "dynamicOutsetType");
  if (v3)
  {
    if (v12 == (id)1 || objc_msgSend(v11, "dynamicOutsetType") != (id)2)
      goto LABEL_4;
LABEL_6:
    objc_msgSend(v11, "outsetTo");
    goto LABEL_7;
  }
  if (v12 == (id)1)
    goto LABEL_6;
LABEL_4:
  objc_msgSend(v11, "outsetFrom");
LABEL_7:
  v14 = v13;

  return v14;
}

- (double)leftOutset
{
  double result;

  -[CRLConnectionLineEditor p_outsetOnLeft:](self, "p_outsetOnLeft:", 1);
  return result;
}

- (double)rightOutset
{
  double result;

  -[CRLConnectionLineEditor p_outsetOnLeft:](self, "p_outsetOnLeft:", 0);
  return result;
}

- (void)beginChangingConnectionOutset
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (!BYTE3(self->super.mNextPathEditor))
  {
    BYTE3(self->super.mNextPathEditor) = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    objc_msgSend(v3, "beginDynamicOperation");
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&v11 = objc_opt_class(CRLConnectionLineAbstractLayout, v6).n128_u64[0];
          v13 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutForInfo:", v10, v11));
          v15 = sub_100221D0C(v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          objc_msgSend(v16, "beginDynamicOutsetChange");
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

  }
}

- (void)p_didChangeConnectionOutset:(double)a3 onLeft:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  CRLConnectionLineEditor *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  if (BYTE3(self->super.mNextPathEditor))
  {
    v4 = a4;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v22 = self;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v9)
      goto LABEL_19;
    v11 = v9;
    v12 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v15 = objc_opt_class(CRLConnectionLineAbstractLayout, v10).n128_u64[0];
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutForInfo:", v14, v15));
        v19 = sub_100221D0C(v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        if (v20)
        {
          if (!objc_msgSend(v20, "dynamicOutsetType"))
            -[CRLConnectionLineEditor p_setDynamicOutsetFrom:](v22, "p_setDynamicOutsetFrom:", v20);
          v21 = objc_msgSend(v20, "dynamicOutsetType");
          if (v4)
          {
            if (v21 == (id)1 || objc_msgSend(v20, "dynamicOutsetType") != (id)2)
            {
LABEL_13:
              objc_msgSend(v20, "setDynamicOutsetFrom:", a3);
LABEL_16:
              objc_msgSend(v20, "invalidatePath");
              goto LABEL_17;
            }
          }
          else if (v21 != (id)1)
          {
            goto LABEL_13;
          }
          objc_msgSend(v20, "setDynamicOutsetTo:", a3);
          goto LABEL_16;
        }
LABEL_17:

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v11)
      {
LABEL_19:

        return;
      }
    }
  }
}

- (void)p_setDynamicOutsetFrom:(id)a3
{
  uint64_t v3;
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "isTailEndOnLeft"))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend(v4, "setDynamicOutsetType:", v3);

}

- (void)didChangeConnectionLeftOutset:(double)a3
{
  -[CRLConnectionLineEditor p_didChangeConnectionOutset:onLeft:](self, "p_didChangeConnectionOutset:onLeft:", 1, a3);
}

- (void)didChangeConnectionRightOutset:(double)a3
{
  -[CRLConnectionLineEditor p_didChangeConnectionOutset:onLeft:](self, "p_didChangeConnectionOutset:onLeft:", 0, a3);
}

- (void)endChangingConnectionOutset
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (BYTE3(self->super.mNextPathEditor))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          *(_QWORD *)&v11 = objc_opt_class(CRLConnectionLineAbstractLayout, v6).n128_u64[0];
          v13 = v12;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutForInfo:", v10, v11));
          v15 = sub_100221D0C(v13, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          objc_msgSend(v16, "endDynamicOutsetChange");
        }
        v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v7);
    }

    objc_msgSend(v3, "willEndDynamicOperation");
    objc_msgSend(v3, "endDynamicOperation");
    BYTE3(self->super.mNextPathEditor) = 0;

  }
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  y = a4.y;
  x = a4.x;
  v13.receiver = self;
  v13.super_class = (Class)CRLConnectionLineEditor;
  v6 = a3;
  -[CRLShapeEditor addMiniFormatterElementsToArray:atPoint:](&v13, "addMiniFormatterElementsToArray:atPoint:", v6, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v13.receiver, v13.super_class));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Set Connection Line Style"), 0, 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("app.connected.to.app.below.fill")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v8, v9, 2, 64));

  objc_msgSend(v10, "setTag:", 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Choose a connection style"), 0, 0));
  objc_msgSend(v10, "setToolTip:", v12);

  objc_msgSend(v6, "insertObject:atIndex:", v10, objc_msgSend(v6, "count"));
}

- (id)p_insertionContextForInsertAndConnectBoardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  double v15;
  objc_class *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineEditor connectionLines](self, "connectionLines"));
  if (objc_msgSend(v5, "count") != (id)1)
  {
    v11 = 0;
    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = v6;
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedFrom"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectedTo"));

      if (!v10)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "connectionLineInfo"));
        if (v14)
        {
          *(_QWORD *)&v15 = objc_opt_class(CRLConnectionLineRep, v13).n128_u64[0];
          v17 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v15));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "repForInfo:", v14));
          v20 = sub_1002223BC(v17, v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

          if (!v21)
          {
            v11 = 0;
LABEL_36:

            goto LABEL_6;
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "knobForTag:", 11));
          v23 = v22;
          if (v22)
          {
            objc_msgSend(v22, "position");
            objc_msgSend(v7, "convertNaturalPointToUnscaledCanvas:");
            v25 = v24;
            v27 = v26;
            if (v4)
            {
              -[CRLConnectionLineEditor p_unscaledOffsetWhenInsertItem:atEnd:](self, "p_unscaledOffsetWhenInsertItem:atEnd:", v4, v7);
              v24 = sub_1000603D0(v25, v27, v28);
            }
            v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRLInsertionContext dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:](CRLInsertionContext, "dragInsertionContextWithPreferredCenter:required:fromDragToInsertController:insertFloating:targetZOrder:", 1, 0, 0, 0, v24));
            goto LABEL_35;
          }
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253368);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E231E8();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253388);
          v30 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:]"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v31, v32, 270, 0, "invalid nil value for '%{public}s'", "lineHeadKnob");

        }
        else
        {
          +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253328);
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100E2315C();
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_101253348);
          v29 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
            sub_100DE7468(v29);
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:]"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v23, 259, 0, "invalid nil value for '%{public}s'", "connectionLineItem");
        }
        v11 = 0;
LABEL_35:

        goto LABEL_36;
      }
    }
  }
  v11 = 0;
LABEL_6:

LABEL_8:
  return v11;
}

- (CGPoint)p_unscaledOffsetWhenInsertItem:(id)a3 atEnd:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  objc_class *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
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
  double v45;
  double v46;
  double v47;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connectedFrom"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry"));
  objc_msgSend(v9, "size");
  v11 = v10;
  v13 = v12;

  if (v11 >= v13)
    v14 = v11;
  else
    v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "geometry"));

  objc_msgSend(v15, "size");
  v17 = v16;
  v19 = v18;

  if (v17 >= v19)
    v21 = v17;
  else
    v21 = v19;
  v22 = v14 + v21;
  *(_QWORD *)&v23 = objc_opt_class(CRLConnectionLineRep, v20).n128_u64[0];
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v23));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "info"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "repForInfo:", v27));
  v29 = sub_1002223BC(v25, v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "knobForTag:", 11));
  objc_msgSend(v31, "position");
  objc_msgSend(v6, "convertNaturalPointToUnscaledCanvas:");
  v33 = v32;
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "knobForTag:", 10));
  objc_msgSend(v36, "position");
  objc_msgSend(v6, "convertNaturalPointToUnscaledCanvas:");
  v38 = v37;

  v39 = sub_1000603B8(v33, v35, v38);
  v41 = sub_100060398(v39, v40);
  v43 = sub_1000603DC(v41, v42, v22);
  v45 = v44;

  v46 = v43;
  v47 = v45;
  result.y = v47;
  result.x = v46;
  return result;
}

- (BOOL)currentSelectionIsValidForInsertAndConnectBoardItem
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:](self, "p_insertionContextForInsertAndConnectBoardItem:", 0));
  v3 = v2 != 0;

  return v3;
}

- (BOOL)canHandleInsertAndConnectBoardItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:](self, "p_insertionContextForInsertAndConnectBoardItem:", v4));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
    v11 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v9 = objc_msgSend(v7, "canHandleInsertionOfBoardItems:insertionContext:", v8, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)insertAndConnectBoardItem:(id)a3 postProcessBlock:(id)a4
{
  id v6;
  void (**v7)(void);
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
  id v33;
  CRLConnectionLineMagnet *v34;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CRLCanvasInfoGeometry *v54;
  void *v55;
  double v56;
  double v57;
  CRLCanvasInfoGeometry *v58;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void (**v64)(void);
  id v65;
  id v66;

  v6 = a3;
  v7 = (void (**)(void))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v64 = v7;
  if (!v8)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012533A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23528();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012533C8);
    v9 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 331, 0, "invalid nil value for '%{public}s'", "icc");

    v7 = v64;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  if (!v63)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012533E8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2349C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253408);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 334, 0, "invalid nil value for '%{public}s'", "canvasEditor");

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineEditor anyConnectionLine](self, "anyConnectionLine"));
  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253428);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23410();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253448);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 337, 0, "invalid nil value for '%{public}s'", "connectionLineLayout");

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectedTo"));

  if (v19)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253468);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2338C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253488);
    v20 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 338, 0, "Connection line already has something connected to its to-end.");

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "connectionLineInfo"));
  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
    objc_msgSend(v24, "openGroup");

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
    objc_msgSend(v25, "enableProgressiveEnqueuingInCurrentGroup");

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLConnectionLineEditor p_insertionContextForInsertAndConnectBoardItem:](self, "p_insertionContextForInsertAndConnectBoardItem:", v6));
    if (!v26)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_1012534E8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E23300();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101253508);
      v27 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v28, v29, 353, 0, "invalid nil value for '%{public}s'", "insertionContext");

    }
    v66 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
    objc_msgSend(v63, "prepareGeometryForInsertingBoardItems:withInsertionContext:ignoreCanvasBackgroundAlignmentProvidedSnapping:", v30, v26, 1);

    v65 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
    objc_msgSend(v63, "insertBoardItems:withInsertionContext:postProcessBlock:", v31, v26, 0);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "connectionLinePathSource"));
    v33 = objc_msgSend(v32, "copy");

    v34 = -[CRLConnectionLineMagnet initWithType:normalizedPosition:]([CRLConnectionLineMagnet alloc], "initWithType:normalizedPosition:", 1, 0.5, 0.5);
    objc_msgSend(v33, "setHeadMagnet:", v34);

    v35 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v23, v6, 1, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
    objc_msgSend(v36, "enqueueCommand:", v35);

    objc_msgSend(v8, "layoutIfNeeded");
    objc_msgSend(v15, "headPoint");
    objc_msgSend(v15, "convertNaturalPointToUnscaledCanvas:");
    v38 = v37;
    objc_msgSend(v15, "unclippedHeadPoint");
    objc_msgSend(v15, "convertNaturalPointToUnscaledCanvas:");
    v41 = sub_1000603B8(v39, v40, v38);
    -[CRLConnectionLineEditor p_unscaledOffsetWhenInsertItem:atEnd:](self, "p_unscaledOffsetWhenInsertItem:atEnd:", v6, v15);
    v44 = sub_1000603DC(v42, v43, -1.0);
    v46 = sub_1000603D0(v44, v45, v41);
    v48 = v47;
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layoutForInfo:", v6));
    objc_msgSend(v49, "centerForConnecting");
    v51 = sub_1000603D0(v46, v48, v50);
    v53 = v52;

    v54 = [CRLCanvasInfoGeometry alloc];
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    objc_msgSend(v55, "size");
    v58 = -[CRLCanvasInfoGeometry initWithCenter:size:](v54, "initWithCenter:size:", v51, v53, v56, v57);

    v59 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v6, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
    objc_msgSend(v60, "enqueueCommand:", v59);

    if (v64)
      v64[2]();
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));
    objc_msgSend(v61, "closeGroup");

    v7 = v64;
    objc_msgSend(v8, "layoutIfNeeded");

  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012534A8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E23274();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012534C8);
    v62 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v62);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor insertAndConnectBoardItem:postProcessBlock:]"));
    v33 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v26, v33, 341, 0, "invalid nil value for '%{public}s'", "connectionLineItem");
  }

}

- (unint64_t)p_getMagnetTypeOppositeFromType:(unint64_t)a3
{
  if (a3 - 2 > 3)
    return 1;
  else
    return qword_100EEF600[a3 - 2];
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
  uint64_t v17;
  double v18;
  objc_class *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset *v30;
  void *v31;
  void *v32;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", a3));
  v5 = objc_msgSend(v4, "count");

  if (v5 != (id)1)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253528);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E235B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101253548);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLConnectionLineEditor saveDefaultInsertionPreset:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLConnectionLineEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 423, 0, "Only should save default style with a single object selected!");

  }
  *(_QWORD *)&v10 = objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v6).n128_u64[0];
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "anyObject"));
  v15 = sub_1002223BC(v12, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  if (v16)
  {
    *(_QWORD *)&v18 = objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v17).n128_u64[0];
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v18));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editingCoordinator"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "boardItemFactory"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "makeShapeItemWithShapeType:", 1));
    v25 = sub_1002223BC(v20, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

    if (v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stroke"));
      objc_msgSend(v26, "setStroke:", v27);

      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fill"));
      objc_msgSend(v26, "setFill:", v28);

      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "shadow"));
      objc_msgSend(v26, "setShadow:", v29);

      v30 = -[CRLCommandSetDefaultShapeInsertionPreset initWithShapeItem:shapeType:]([_TtC8Freeform40CRLCommandSetDefaultShapeInsertionPreset alloc], "initWithShapeItem:shapeType:", v26, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "commandController"));
      objc_msgSend(v32, "enqueueCommand:", v30);

    }
  }

}

@end
