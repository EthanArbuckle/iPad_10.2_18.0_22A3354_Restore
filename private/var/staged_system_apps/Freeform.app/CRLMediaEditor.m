@implementation CRLMediaEditor

+ (id)keyPathsForValuesAffectingMediaItems
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("boardItems"));
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingReplacement
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("boardItems"));
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  id v22;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a4;
  v7 = v6;
  if ("replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:" != a3)
  {
    if ("resetSelectionToNaturalDataSize:" == a3)
    {
      v20 = -[CRLMediaEditor p_repCanResetMediaSize](self, "p_repCanResetMediaSize");
    }
    else
    {
      if (sel_isEqual(a3, "showMediaReplaceUI:"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
        if (objc_msgSend(v8, "count") == (id)1)
          v9 = 1;
        else
          v9 = -1;

        goto LABEL_29;
      }
      if ("toggleShadow:" == a3 || "toggleRoundCorners:" == a3)
      {
        v20 = -[CRLMediaEditor p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow](self, "p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow");
      }
      else
      {
        if ("toggleLoop:" != a3)
        {
          v23.receiver = self;
          v23.super_class = (Class)CRLMediaEditor;
          v9 = -[CRLStyledEditor canPerformEditorAction:withSender:](&v23, "canPerformEditorAction:withSender:", a3, v7);
          goto LABEL_29;
        }
        v20 = -[CRLMediaEditor p_allSelectedObjectsAllowTogglingOfLoop](self, "p_allSelectedObjectsAllowTogglingOfLoop");
      }
    }
    if (v20)
      v9 = 1;
    else
      v9 = -1;
    goto LABEL_29;
  }
  v22 = v6;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    v9 = -1;
LABEL_10:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
      if (!objc_msgSend(v15, "canBeReplaced"))
        break;
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "canvasEditor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasEditorHelper"));
      v19 = objc_msgSend(v18, "canReplaceBoardItem:", v15);

      if (v19)
        v9 = 1;
      if (v12 == (id)++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
          goto LABEL_10;

        v7 = v22;
        goto LABEL_29;
      }
    }
  }

  v9 = -1;
  v7 = v22;
LABEL_29:

  return v9;
}

- (BOOL)p_repCanResetMediaSize
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "canResetMediaSize"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (void)resetSelectionToNaturalDataSize:(id)a3
{
  void *v4;
  _TtC8Freeform15CRLCommandGroup *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  void *v18;
  CRLCanvasCommandSelectionBehavior *v19;
  void *v20;
  CRLCanvasCommandSelectionBehavior *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  _TtC8Freeform15CRLCommandGroup *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = objc_alloc_init(_TtC8Freeform15CRLCommandGroup);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "canResetMediaSize"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionPathWithInfo:", v11));

          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_100100C7C;
          v24[3] = &unk_101238288;
          v25 = v5;
          v14 = objc_retainBlock(v24);
          v22[0] = _NSConcreteStackBlock;
          v22[1] = 3221225472;
          v22[2] = sub_100100CC0;
          v22[3] = &unk_1012382B0;
          v23 = v14;
          v15 = v14;
          objc_msgSend(v4, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v13, v22);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Original Size"), 0, CFSTR("UndoStrings")));
  -[CRLCommandGroup setActionString:](v5, "setActionString:", v17);

  if (!-[CRLCommandGroup isEmpty](v5, "isEmpty"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
    v19 = [CRLCanvasCommandSelectionBehavior alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
    v21 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v19, "initWithCanvasEditor:type:constructedInfos:", v20, 2, 0);

    objc_msgSend(v18, "openGroupWithSelectionBehavior:", v21);
    objc_msgSend(v18, "enqueueCommand:", v5);
    objc_msgSend(v18, "closeGroup");

  }
}

- (BOOL)p_boardItemsAreImageAndMovieOnly
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v9 = objc_opt_class(_TtC8Freeform12CRLImageItem, v4);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
          || (v11 = objc_opt_class(_TtC8Freeform12CRLMovieItem, v10),
              (objc_opt_isKindOfClass(v8, v11) & 1) != 0))
        {
          v12 = objc_opt_class(_TtC8Freeform12CRLMovieItem, v10);
          if ((objc_opt_isKindOfClass(v8, v12) & 1) == 0)
            continue;
          v13 = objc_opt_class(_TtC8Freeform12CRLMovieItem, v4);
          v14 = sub_100221D0C(v13, v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          v16 = objc_msgSend(v15, "isAudioOnly");

          if ((v16 & 1) == 0)
            continue;
        }
        v17 = 0;
        goto LABEL_14;
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_14:

  return v17;
}

- (BOOL)p_allSelectedObjectsAllowTogglingOfRoundedCornersAndShadow
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "supportsTogglingShadowAndRoundedCorners"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)p_allSelectedObjectsAllowTogglingOfLoop
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "supportsTogglingLooping"))
        {
          v7 = 0;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (BOOL)anySelectedObjectsHaveShadow
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v3);
        v9 = sub_100221D0C(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        if (v10)
        {
          v11 = v10;
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "shadow"));

          if (v12)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (BOOL)anySelectedObjectsHaveRoundCorners
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v3);
        v9 = sub_100221D0C(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = v10;
        if (v10 && objc_msgSend(v10, "hasRoundedCorners"))
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (BOOL)anySelectedObjectsHaveLooping
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v8 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v3);
        v9 = sub_100221D0C(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = v10;
        if (v10 && objc_msgSend(v10, "isLooping"))
        {

          LOBYTE(v4) = 1;
          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v4;
}

- (void)toggleShadow:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _TtC8Freeform19CRLCommandSetShadow *v21;
  void *v22;
  CRLCanvasCommandSelectionBehavior *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v8 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v6, "initWithCanvasEditor:type:constructedInfos:", v7, 2, 0);

  v9 = 0;
  if (!-[CRLMediaEditor anySelectedObjectsHaveShadow](self, "anySelectedObjectsHaveShadow"))
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CRLShadow defaultShadow](CRLShadow, "defaultShadow"));
  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v8);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v11)
    goto LABEL_14;
  v13 = v11;
  v23 = v8;
  v24 = v4;
  v14 = 0;
  v15 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v26 != v15)
        objc_enumerationMutation(v10);
      v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
      v18 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v12);
      v19 = sub_100221D0C(v18, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v20)
      {
        v21 = -[CRLCommandSetShadow initWithBoardItem:shadow:]([_TtC8Freeform19CRLCommandSetShadow alloc], "initWithBoardItem:shadow:", v20, v9);
        objc_msgSend(v5, "enqueueCommand:", v21);

        v14 = 1;
      }

    }
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v13);

  v4 = v24;
  if ((v14 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Shadow Setting"), 0, 0));
    objc_msgSend(v5, "setCurrentGroupActionString:", v22);

LABEL_14:
  }
  objc_msgSend(v5, "closeGroup", v23, v24);

}

- (void)toggleRoundCorners:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CRLCanvasCommandSelectionBehavior *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v8 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v6, "initWithCanvasEditor:type:constructedInfos:", v7, 2, 0);

  v9 = -[CRLMediaEditor anySelectedObjectsHaveRoundCorners](self, "anySelectedObjectsHaveRoundCorners");
  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v11)
    goto LABEL_14;
  v13 = v11;
  v25 = v8;
  v26 = v4;
  v14 = 0;
  v15 = *(_QWORD *)v28;
  v16 = v9 ^ 1;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v19 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v12);
      v20 = sub_100221D0C(v19, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (v21)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "commandToSetRoundedCornersEnabled:", v16));
        if (v23)
        {
          objc_msgSend(v5, "enqueueCommand:", v23);
          v14 = 1;
        }

      }
    }
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v13);

  v4 = v26;
  if ((v14 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Round Corners Setting"), 0, 0));

    objc_msgSend(v5, "setCurrentGroupActionString:", v10);
LABEL_14:

  }
  objc_msgSend(v5, "closeGroup", v25, v26);

}

- (void)toggleLoop:(id)a3
{
  void *v4;
  void *v5;
  CRLCanvasCommandSelectionBehavior *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  unsigned int v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *i;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CRLCanvasCommandSelectionBehavior *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));
  v6 = [CRLCanvasCommandSelectionBehavior alloc];
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v8 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v6, "initWithCanvasEditor:type:constructedInfos:", v7, 2, 0);

  v9 = -[CRLMediaEditor anySelectedObjectsHaveLooping](self, "anySelectedObjectsHaveLooping");
  objc_msgSend(v5, "openGroupWithSelectionBehavior:", v8);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v11)
    goto LABEL_14;
  v13 = v11;
  v25 = v8;
  v26 = v4;
  v14 = 0;
  v15 = *(_QWORD *)v28;
  v16 = v9 ^ 1;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(_QWORD *)v28 != v15)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
      v19 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v12);
      v20 = sub_100221D0C(v19, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (v21)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "commandToSetLoopingEnabled:", v16));
        if (v23)
        {
          objc_msgSend(v5, "enqueueCommand:", v23);
          v14 = 1;
        }

      }
    }
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  }
  while (v13);

  v4 = v26;
  if ((v14 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Loop Setting"), 0, 0));

    objc_msgSend(v5, "setCurrentGroupActionString:", v10);
LABEL_14:

  }
  objc_msgSend(v5, "closeGroup", v25, v26);

}

- (CRLPlatformControlState)shadowToggledControlState
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v3)
  {

LABEL_15:
    v18 = 0;
    return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v18));
  }
  v5 = v3;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      v11 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v4);
      v12 = sub_100221D0C(v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v13)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "shadow"));
        v16 = v15 != 0;
        v17 = v15 == 0;

        v6 |= v17;
        v7 |= v16;
      }
      else
      {
        v6 = 1;
      }

    }
    v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v5);

  if ((v7 & v6 & 1) == 0)
  {
    if (!(v6 & 1 | ((v7 & 1) == 0)))
    {
      v18 = 1;
      return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v18));
    }
    goto LABEL_15;
  }
  v18 = 2;
  return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v18));
}

- (CRLPlatformControlState)roundCornersToggledControlState
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
  {

LABEL_15:
    v16 = 0;
    return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
  }
  v5 = v3;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      v11 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v4);
      v12 = sub_100221D0C(v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "hasRoundedCorners");
        v6 |= v15 ^ 1;
        v7 |= v15;
      }
      else
      {
        v6 = 1;
      }

    }
    v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v5);

  if ((v7 & v6 & 1) == 0)
  {
    if (!(v6 & 1 | ((v7 & 1) == 0)))
    {
      v16 = 1;
      return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
    }
    goto LABEL_15;
  }
  v16 = 2;
  return (CRLPlatformControlState *)(id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
}

- (id)loopToggledControlState
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  int v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
  {

LABEL_15:
    v16 = 0;
    return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
  }
  v5 = v3;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
      v11 = objc_opt_class(_TtC8Freeform12CRLMediaItem, v4);
      v12 = sub_100221D0C(v11, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = v13;
      if (v13)
      {
        v15 = objc_msgSend(v13, "isLooping");
        v6 |= v15 ^ 1;
        v7 |= v15;
      }
      else
      {
        v6 = 1;
      }

    }
    v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v5);

  if ((v7 & v6 & 1) == 0)
  {
    if (!(v6 & 1 | ((v7 & 1) == 0)))
    {
      v16 = 1;
      return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
    }
    goto LABEL_15;
  }
  v16 = 2;
  return (id)objc_claimAutoreleasedReturnValue(+[CRLPlatformControlState stateWithValue:](CRLPlatformControlState, "stateWithValue:", v16));
}

- (void)showMediaReplaceUI:(id)a3
{
  id v4;
  CRLMediaReplacingHelper *v5;

  v4 = a3;
  v5 = -[CRLMediaReplacingHelper initWithEditor:]([CRLMediaReplacingHelper alloc], "initWithEditor:", self);
  -[CRLMediaReplacingHelper showMediaReplaceUI:](v5, "showMediaReplaceUI:", v4);

}

- (void)replaceSelectedMediaWithData:(id)a3 actionString:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLMediaReplacingHelper *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[CRLMediaReplacingHelper initWithEditor:]([CRLMediaReplacingHelper alloc], "initWithEditor:", self);
  -[CRLMediaReplacingHelper replaceSelectedMediaWithData:actionString:completion:](v11, "replaceSelectedMediaWithData:actionString:completion:", v10, v9, v8);

}

- (void)replaceCanvasElementInfo:(id)a3 withFilesAtURLs:(id)a4 allowedTypes:(id)a5 actionString:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  CRLMediaReplacingHelper *v17;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[CRLMediaReplacingHelper initWithEditor:]([CRLMediaReplacingHelper alloc], "initWithEditor:", self);
  -[CRLMediaReplacingHelper replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:](v17, "replaceCanvasElementInfo:withFilesAtURLs:allowedTypes:actionString:completion:", v16, v15, v14, v13, v12);

}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  int v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  int v17;
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
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  __CFString *v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  __CFString *v51;
  void *v52;
  void *v53;
  int v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  _QWORD v64[2];
  _BYTE v65[128];
  _BYTE v66[128];

  v5 = a3;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v60;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v60 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i), "supportsTogglingShadowAndRoundedCorners"))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor mediaItems](self, "mediaItems"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v56;
    while (2)
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(v12);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)j), "supportsTogglingLooping"))
        {
          v17 = 0;
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v14)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_21:

  if (v11)
  {
    v54 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Shadow"), 0, 0));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("shadow")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v19, v20, "toggleShadow:", 0));

    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor shadowToggledControlState](self, "shadowToggledControlState"));
    objc_msgSend(v21, "setState:", objc_msgSend(v52, "stateValue"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("Round Corners"), 0, 0));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("rectangle.roundedtop")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v23, v24, "toggleRoundCorners:", 0));

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor roundCornersToggledControlState](self, "roundCornersToggledControlState"));
    objc_msgSend(v25, "setState:", objc_msgSend(v26, "stateValue"));
    v53 = v21;
    v64[0] = v21;
    v64[1] = v25;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v64, 2));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLShadowAndRoundCornersMenuIdentifier"), 1, v27));

    if (objc_msgSend(v5, "count"))
    {
      v30 = 1;
      while (1)
      {
        v31 = objc_opt_class(UIMenu, v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v30 - 1));
        v33 = sub_100221D0C(v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

        if (v34)
        {
          v35 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));

          if (v35 == CFSTR("CRLCutCopyPasteMenuIdentifier"))
            break;
        }
        v36 = v30++ >= (unint64_t)objc_msgSend(v5, "count");
        if (v36)
          goto LABEL_28;
      }
      v37 = v52;
      if (v30 - 1 < (unint64_t)objc_msgSend(v5, "count"))
        objc_msgSend(v5, "insertObject:atIndex:", v28, v30);
    }
    else
    {
LABEL_28:
      objc_msgSend(v5, "addObject:", v28);
      v37 = v52;
    }

    v17 = v54;
  }
  if (v17)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("Loop"), 0, 0));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("repeat")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v39, v40, "toggleLoop:", 0));

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLMediaEditor loopToggledControlState](self, "loopToggledControlState"));
    objc_msgSend(v41, "setState:", objc_msgSend(v42, "stateValue"));
    v63 = v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v63, 1));
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLLoopMenuIdentifier"), 1, v43));

    if (objc_msgSend(v5, "count"))
    {
      v46 = 1;
      while (1)
      {
        v47 = objc_opt_class(UIMenu, v45);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v46 - 1));
        v49 = sub_100221D0C(v47, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

        if (v50)
        {
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));

          if (v51 == CFSTR("CRLCutCopyPasteMenuIdentifier"))
            break;
        }
        v36 = v46++ >= (unint64_t)objc_msgSend(v5, "count");
        if (v36)
          goto LABEL_37;
      }
      if (v46 - 1 < (unint64_t)objc_msgSend(v5, "count"))
        objc_msgSend(v5, "insertObject:atIndex:", v44, v46);
    }
    else
    {
LABEL_37:
      objc_msgSend(v5, "addObject:", v44);
    }

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
  -[CRLMediaEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
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

@end
