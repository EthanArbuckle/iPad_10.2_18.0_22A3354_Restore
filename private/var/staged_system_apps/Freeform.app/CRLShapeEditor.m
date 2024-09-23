@implementation CRLShapeEditor

- (void)setFillInspectorDisclosed:(BOOL)a3
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

  *(&self->super.mIsChangingStrokeWidth + 1) = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
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
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v10, "invalidateKnobs");

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (_TtC8Freeform12CRLShapeItem)anyShapeItem
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeEditor allShapeItems](self, "allShapeItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (_TtC8Freeform12CRLShapeItem *)v3;
}

- (NSArray)allShapeItems
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_self(_TtC8Freeform12CRLShapeItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4));

  return (NSArray *)v5;
}

- (id)nextEditorForSelection:(id)a3 withNewEditorStack:(id)a4 selectionPath:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char isKindOfClass;
  void *v12;
  CRLPathEditor *v13;
  CRLPathEditor *v14;
  void *v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v7 = a5;
  v8 = a3;
  objc_opt_class(CRLPathSelection, v9);
  isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLShapeEditor nextPathEditor](self, "nextPathEditor"));

    if (v12)
    {
      v13 = (CRLPathEditor *)objc_claimAutoreleasedReturnValue(-[CRLShapeEditor nextPathEditor](self, "nextPathEditor"));
    }
    else
    {
      v14 = [CRLPathEditor alloc];
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
      v13 = -[CRLBoardItemEditor initWithInteractiveCanvasController:](v14, "initWithInteractiveCanvasController:", v15);

      *(_QWORD *)&v17 = objc_opt_class(_TtC8Freeform21CRLBoardItemSelection, v16).n128_u64[0];
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mostSpecificSelectionOfClass:", v18, v17));
      v20 = v19;
      if (v19)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "boardItems"));
        -[CRLBoardItemEditor setBoardItems:](v13, "setBoardItems:", v21);

      }
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)addContextualMenuElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  objc_super v23;
  void *v24;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CRLShapeEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v23, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  if (+[CRLFeatureFlagGroup isChangeShapeEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isChangeShapeEnabled"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Change Shape"), 0, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.on.circle")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v9, v10, "showShapeLibraryPopover:", 0));

    if (objc_msgSend(v7, "count"))
    {
      v13 = 0;
      while (1)
      {
        *(_QWORD *)&v14 = objc_opt_class(UIMenu, v12).n128_u64[0];
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v13, v14));
        v18 = sub_100221D0C(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (v19)
        {
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));

          if (v20 == CFSTR("CRLStyleMenuIdentifier"))
            break;
        }
        if (++v13 >= (unint64_t)objc_msgSend(v7, "count"))
          goto LABEL_7;
      }
    }
    else
    {
LABEL_7:
      v13 = -1;
    }
    v24 = v11;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLShapeMenuIdentifier"), 1, v21));

    if (v13 == -1)
      objc_msgSend(v7, "addObject:", v22);
    else
      objc_msgSend(v7, "insertObject:atIndex:", v22, v13);

  }
}

+ (BOOL)anyInfoIsLine:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11 && objc_msgSend(v11, "isLine", (_QWORD)v14))
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

+ (BOOL)anyInfoIsConnectionLine:(id)a3
{
  id v3;
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

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
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
        objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v4);
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

+ (BOOL)anyInfoIsStickyNote:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform19CRLWPStickyNoteItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

        if (v11)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

+ (BOOL)anyInfoIsTextBox:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11 && objc_msgSend(v11, "isAutogrowingTextBox", (_QWORD)v14))
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

+ (BOOL)anyInfoIsAutoresizing:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "geometry", (_QWORD)v15));
        v13 = v12;
        if (v11
          && (!objc_msgSend(v12, "widthValid") || (objc_msgSend(v13, "heightValid") & 1) == 0))
        {

          LOBYTE(v5) = 1;
          goto LABEL_13;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return (char)v5;
}

+ (BOOL)anyInfoIsOpenPath:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11 && objc_msgSend(v11, "isOpenPath", (_QWORD)v14))
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

+ (BOOL)infosAreLines:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "isLine", (_QWORD)v16) & 1) == 0)
        {

          v14 = 0;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

+ (BOOL)infosAreLinesAndConnectionLines:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char isKindOfClass;
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
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v14 = v12;
        if (v12 && objc_msgSend(v12, "isLine", (_QWORD)v19))
        {

        }
        else
        {
          objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v13);
          isKindOfClass = objc_opt_isKindOfClass(v9, v15);

          if ((isKindOfClass & 1) == 0)
          {
            v17 = 0;
            goto LABEL_14;
          }
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v6)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_14:

  return v17;
}

+ (BOOL)infosAreOpenPaths:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (!v12 || (objc_msgSend(v12, "isOpenPath", (_QWORD)v16) & 1) == 0)
        {

          v14 = 0;
          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

+ (BOOL)infosAreTextBoxes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (!v12 || (objc_msgSend(v12, "isAutogrowingTextBox", (_QWORD)v16) & 1) == 0)
        {

          v14 = 0;
          goto LABEL_13;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

+ (BOOL)anyInfoSupportsVerticalAlignment:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        v12 = v11;
        if (v11 && (objc_msgSend(v11, "isAutogrowingTextBox", (_QWORD)v14) & 1) == 0)
        {

          LOBYTE(v5) = 1;
          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

- (BOOL)anyInfoSupportsVerticalAlignment
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor anyInfoSupportsVerticalAlignment:](CRLShapeEditor, "anyInfoSupportsVerticalAlignment:", v2);

  return v3;
}

+ (BOOL)anyInfoSupportsTextInspection:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  uint64_t v9;
  id v10;
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
  v3 = a3;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v4);
        v10 = sub_100221D0C(v9, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

        if (v11)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (BOOL)anyInfoSupportsTextInspection
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor anyInfoSupportsTextInspection:](CRLShapeEditor, "anyInfoSupportsTextInspection:", v2);

  return v3;
}

+ (BOOL)infosAreStickyNotes:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform19CRLWPStickyNoteItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

        if (!v12)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

+ (BOOL)infosAreMixedOpenAndClosedPaths:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  char v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "isOpenPath");
          v7 |= v16 ^ 1;
          v8 |= v16;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  return v8 & v7 & 1;
}

+ (BOOL)infosAreMixedOpenPathsAndLines:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  char v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {
    LOBYTE(v7) = 0;
    v8 = 0;
    goto LABEL_16;
  }
  v6 = v4;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v3);
      v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
      objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
      v13 = sub_100221D0C(v12, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = v14;
      if (v14)
      {
        if ((objc_msgSend(v14, "isLine", (_QWORD)v17) & 1) != 0)
        {
          v8 = 1;
        }
        else
        {
          v7 |= objc_msgSend(v15, "isOpenPath");
          if ((v8 & 1) == 0)
            goto LABEL_11;
        }
        if ((v7 & 1) != 0)
        {

          LOBYTE(v7) = 1;
          v8 = 1;
          goto LABEL_16;
        }
      }
LABEL_11:

    }
    v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v6)
      continue;
    break;
  }
LABEL_16:

  return v8 & v7 & 1;
}

+ (BOOL)infosAreConnectionLines:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform21CRLConnectionLineItem, v5);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

+ (BOOL)infosSupportEndpoints:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12 && (objc_msgSend(v12, "pathIsOpen", (_QWORD)v16) & 1) == 0)
        {

          v14 = 0;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_12:

  return v14;
}

- (BOOL)infosAreOpenPaths
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreOpenPaths:](CRLShapeEditor, "infosAreOpenPaths:", v2);

  return v3;
}

- (BOOL)infosAreMixedOpenAndClosedPaths
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreMixedOpenAndClosedPaths:](CRLShapeEditor, "infosAreMixedOpenAndClosedPaths:", v2);

  return v3;
}

- (BOOL)infosAreLines
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreLines:](CRLShapeEditor, "infosAreLines:", v2);

  return v3;
}

- (BOOL)infosAreConnectionLines
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreConnectionLines:](CRLShapeEditor, "infosAreConnectionLines:", v2);

  return v3;
}

- (BOOL)infosAreTextBoxes
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreTextBoxes:](CRLShapeEditor, "infosAreTextBoxes:", v2);

  return v3;
}

- (BOOL)infosSupportEndpoints
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosSupportEndpoints:](CRLShapeEditor, "infosSupportEndpoints:", v2);

  return v3;
}

- (BOOL)suppressesFillInspector
{
  return !-[CRLShapeEditor p_canSetFill](self, "p_canSetFill");
}

- (BOOL)anyInfoIsLineOrConnectionLine
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (+[CRLShapeEditor anyInfoIsLine:](CRLShapeEditor, "anyInfoIsLine:", v3))
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    v4 = +[CRLShapeEditor anyInfoIsConnectionLine:](CRLShapeEditor, "anyInfoIsConnectionLine:", v5);

  }
  return v4;
}

- (BOOL)p_allInfosAreStickyNotes
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreStickyNotes:](CRLShapeEditor, "infosAreStickyNotes:", v2);

  return v3;
}

- (BOOL)suppressesTextInspector
{
  return -[CRLShapeEditor suppressesFillInspector](self, "suppressesFillInspector");
}

- (BOOL)suppressesStyleInspector
{
  return 0;
}

- (BOOL)suppressesPresetInspector
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor infosAreMixedOpenAndClosedPaths:](CRLShapeEditor, "infosAreMixedOpenAndClosedPaths:", v2);

  return v3;
}

- (BOOL)p_shouldShowInspectorForScalarPathSourceOfType:(unint64_t)a3
{
  CRLShapeEditor *v4;
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
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  CRLShapeEditor *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = self;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v26;
    v24 = v4;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_QWORD *)&v16 = objc_opt_class(CRLScalarPathSource, v15).n128_u64[0];
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathSource", v16));
        v20 = sub_100221D0C(v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        if (!v21 || objc_msgSend(v21, "type") != (id)a3)
        {

          v22 = 0;
          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      v4 = v24;
      if (v8)
        continue;
      break;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](v4, "boardItems"));
  v22 = objc_msgSend(v5, "count") != 0;
LABEL_12:

  return v22;
}

- (BOOL)p_shouldShowInspectorForPointPathSourceOfTypes:(id)a3
{
  id v4;
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
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  unsigned int v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        *(_QWORD *)&v16 = objc_opt_class(CRLPointPathSource, v15).n128_u64[0];
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pathSource", v16));
        v20 = sub_100221D0C(v18, v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

        if (!v21)
        {

LABEL_12:
          v24 = 0;
          goto LABEL_13;
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "type")));
        v23 = objc_msgSend(v4, "containsObject:", v22);

        if (!v23)
          goto LABEL_12;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v8)
        continue;
      break;
    }
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v24 = objc_msgSend(v5, "count") != 0;
LABEL_13:

  return v24;
}

- (BOOL)shouldShowRoundedRectInspector
{
  return -[CRLShapeEditor p_shouldShowInspectorForScalarPathSourceOfType:](self, "p_shouldShowInspectorForScalarPathSourceOfType:", 0);
}

- (BOOL)shouldShowPolygonInspector
{
  return -[CRLShapeEditor p_shouldShowInspectorForScalarPathSourceOfType:](self, "p_shouldShowInspectorForScalarPathSourceOfType:", 1);
}

- (BOOL)shouldShowStarInspector
{
  return -[CRLShapeEditor p_shouldShowInspectorForPointPathSourceOfTypes:](self, "p_shouldShowInspectorForPointPathSourceOfTypes:", &off_1012CB560);
}

- (BOOL)shouldShowArrowInspector
{
  return -[CRLShapeEditor p_shouldShowInspectorForPointPathSourceOfTypes:](self, "p_shouldShowInspectorForPointPathSourceOfTypes:", &off_1012CB578);
}

- (BOOL)shouldShowCalloutInspector
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v5);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        *(_QWORD *)&v14 = objc_opt_class(CRLCalloutPathSource, v13).n128_u64[0];
        v16 = v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSource", v14));
        v18 = sub_100221D0C(v16, v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

        if (!v19)
        {
          v20 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v6)
        continue;
      break;
    }
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v20 = objc_msgSend(v3, "count") != 0;
LABEL_11:

  return v20;
}

- (BOOL)shouldShowLineInspector
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _UNKNOWN **v7;
  __objc2_class **p_superclass;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __objc2_class **v20;
  _UNKNOWN **v21;
  void *v22;
  unsigned __int8 v23;
  BOOL v24;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v29;
    v7 = &off_1013C5000;
    p_superclass = &OBJC_METACLASS___CRLAXZorderButton.superclass;
    v27 = v2;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        objc_opt_class(v7 + 409, v4);
        v12 = sub_100221D0C(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathSource"));
        *(_QWORD *)&v16 = objc_opt_class(p_superclass + 409, v15).n128_u64[0];
        if (objc_msgSend(v14, "isMemberOfClass:", v17, v16))
        {

        }
        else
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pathSource"));
          v19 = v6;
          v20 = p_superclass;
          v21 = v7;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bezierPath"));
          v23 = objc_msgSend(v22, "isLineSegment");

          v7 = v21;
          p_superclass = v20;
          v6 = v19;

          v2 = v27;
          if ((v23 & 1) == 0)
          {

            v24 = 0;
            goto LABEL_13;
          }
        }

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v5)
        continue;
      break;
    }
  }

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v24 = objc_msgSend(v2, "count") != 0;
LABEL_13:

  return v24;
}

- (int64_t)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned int v8;
  int64_t v9;
  objc_super v11;

  v6 = a4;
  if ("makePathEditable:" == a3)
  {
    v8 = -[CRLShapeEditor canMakePathEditable](self, "canMakePathEditable");
  }
  else if ("intersectPaths:" == a3)
  {
    v8 = -[CRLShapeEditor canIntersectPaths](self, "canIntersectPaths");
  }
  else if ("makePathSmooth:" == a3 || "makePathSharp:" == a3)
  {
    v8 = -[CRLShapeEditor canMakePathSmoothOrSharp](self, "canMakePathSmoothOrSharp");
  }
  else if ("resetTextAndObjectHandles:" == a3)
  {
    v8 = -[CRLShapeEditor canResetTextAndObjectHandles](self, "canResetTextAndObjectHandles");
  }
  else if ("divideCompoundShape:" == a3)
  {
    v8 = -[CRLShapeEditor canDivideCompoundShape](self, "canDivideCompoundShape");
  }
  else if ("setShapeFill:" == a3)
  {
    v8 = -[CRLShapeEditor p_canSetFill](self, "p_canSetFill");
  }
  else if ("setLineEnd:isLeftLineEnd:" == a3)
  {
    v8 = -[CRLShapeEditor anyInfoIsLineOrConnectionLine](self, "anyInfoIsLineOrConnectionLine");
  }
  else
  {
    if ("showShapeLibraryPopover:" != a3)
    {
      v11.receiver = self;
      v11.super_class = (Class)CRLShapeEditor;
      v9 = -[CRLStyledEditor canPerformEditorAction:withSender:](&v11, "canPerformEditorAction:withSender:", a3, v6);
      goto LABEL_25;
    }
    v8 = -[CRLShapeEditor allowsChangeShape](self, "allowsChangeShape");
  }
  if (v8)
    v9 = 1;
  else
    v9 = -1;
LABEL_25:

  return v9;
}

- (BOOL)canMakePathEditable
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i)));
          v12 = objc_msgSend(v11, "canMakePathEditable");

          if (!v12)
          {
            LOBYTE(v4) = 0;
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
    LOBYTE(v4) = 1;
LABEL_12:

  }
  return (char)v4;
}

- (BOOL)canMakePathSmoothOrSharp
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canIntersectPaths
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v5 = objc_msgSend(v4, "hasSelectedInfosInMultipleContainers") ^ 1;

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "canBeIntersected"))
        {
          LOBYTE(v5) = 0;
          goto LABEL_14;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:

  return v5;
}

- (BOOL)canResetTextAndObjectHandles
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  CRLShapeEditor *v7;
  BOOL v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController"));
  *(_QWORD *)&v5 = objc_opt_class(CRLBoardItemEditor, v4).n128_u64[0];
  v7 = (CRLShapeEditor *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mostSpecificCurrentEditorOfClass:", v6, v5));

  if (v7 == self)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
    v8 = objc_msgSend(v9, "count") != 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "canResetTextAndObjectHandles"))
          {
            v8 = 0;
            goto LABEL_13;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)canDivideCompoundShape
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "canvasEditor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditorHelper"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "shapeInfo"));
        v13 = objc_msgSend(v5, "canDivideCompoundShape:", v12);

        if (!v13 || !objc_msgSend(v11, "canBeDivided"))
        {
          v14 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v14 = 1;
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v14 = 1;
  }
LABEL_13:

  return v14;
}

- (BOOL)p_shapeLacksEnoughStyleToBeSavedAsCustom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stroke"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRLStroke emptyStroke](CRLStroke, "emptyStroke"));
  if (objc_msgSend(v4, "isEqual:", v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fill"));
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)makePathSharp:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  *(_QWORD *)&v6 = objc_opt_class(CRLPathEditor, v5).n128_u64[0];
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", v7, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Make Sharp"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v10, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v9, &stru_101244308, &stru_101244328);

}

- (void)makePathSmooth:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorController"));
  *(_QWORD *)&v6 = objc_opt_class(CRLPathEditor, v5).n128_u64[0];
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", v7, v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Make Smooth"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v10, "editPathsOnPathEditableRepsWithActionString:usingBlock:filterWithBlock:", v9, &stru_101244348, &stru_101244368);

}

- (void)makePathEditable:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  CRLPathSelection *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CRLCommandSelectionBehavior *v14;
  void *v15;
  void *v16;
  void *v17;
  CRLCommandSelectionBehavior *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editorController](self, "editorController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  *(_QWORD *)&v7 = objc_opt_class(CRLPathEditor, v6).n128_u64[0];
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", v8, v7));
  v39 = v4;
  if (!v37)
  {
    v9 = objc_alloc_init(CRLPathSelection);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathWithAppendedSelection:", v9));

    v5 = (void *)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "commandController"));
  v14 = [CRLCommandSelectionBehavior alloc];
  v36 = v12;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "canvasEditor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "selectionPathWithInfos:", v16));
  v38 = v5;
  v18 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:](v14, "initWithForwardSelectionPath:reverseSelectionPath:", v5, v17);

  objc_msgSend(v13, "openGroupWithSelectionBehavior:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Make Editable"), 0, CFSTR("UndoStrings")));
  v35 = v13;
  objc_msgSend(v13, "setCurrentGroupActionString:", v20);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v22)
  {
    v24 = v22;
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v21);
        v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
        *(_QWORD *)&v28 = objc_opt_class(CRLShapeRep, v23).n128_u64[0];
        v30 = v29;
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", v28));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "repForInfo:", v27));
        v33 = sub_100221D0C(v30, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

        if (v34 && (objc_msgSend(v34, "isPathEditable") & 1) == 0)
        {
          objc_msgSend(v34, "dynamicOperationDidBeginWithRealTimeCommands:", 0);
          objc_msgSend(v34, "dynamicMovePathKnobDidBegin");
          objc_msgSend(v34, "dynamicMovePathKnobDidEndWithTracker:", 0);
          objc_msgSend(v34, "dynamicOperationDidEnd");
        }

      }
      v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v24);
  }

  objc_msgSend(v35, "closeGroup");
  objc_msgSend(v39, "setSelectionPath:", v38);

}

- (void)intersectPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector(v4, "tag") & 1) != 0)
  {
    -[CRLShapeEditor performBooleanOperationOnPaths:](self, "performBooleanOperationOnPaths:", objc_msgSend(v4, "tag"));
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244388);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C034();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012443A8);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor intersectPaths:]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 791, 0, "Callers to -[CRLShapeEditor intersectPaths:] must have a -[tag] method to specify what kind of intersection to perform.");

  }
}

- (void)performBooleanOperationOnPaths:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  objc_class *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  CRLCanvasCommandSelectionBehavior *v36;
  void *v37;
  CRLCanvasCommandSelectionBehavior *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  CRLCanvasInfoGeometry *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v53;
  void *v54;
  void *v55;
  _TtC8Freeform15CRLCommandGroup *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _TtC8Freeform23CRLCommandSetPathSource *v61;
  CRLCanvasInfoGeometry *v62;
  void *v63;
  CRLCanvasCommandSelectionBehavior *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  CRLShapeEditor *v71;
  void *v72;
  void *v73;
  void *v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  void *v84;
  _BYTE v85[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topLevelZOrderedSiblingsOfInfos:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crl_arrayWithObjectsInSet:", v11));

  if ((unint64_t)objc_msgSend(v12, "count") >= 2)
  {
    v69 = a3;
    v71 = self;
    v73 = v10;
    v74 = v7;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v72 = v12;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "selectionPathWithInfo:", v18));

          v78[0] = _NSConcreteStackBlock;
          v78[1] = 3221225472;
          v78[2] = sub_1001F8F3C;
          v78[3] = &unk_101238288;
          v79 = v8;
          objc_msgSend(v5, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v20, v78);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v85, 16);
      }
      while (v15);
    }

    switch(v69)
    {
      case 0uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath uniteBezierPaths:](CRLBezierPath, "uniteBezierPaths:", v8));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = v22;
        v24 = CFSTR("Unite Shapes");
        goto LABEL_15;
      case 1uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath intersectBezierPaths:](CRLBezierPath, "intersectBezierPaths:", v8));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = v22;
        v24 = CFSTR("Intersect Shapes");
        goto LABEL_15;
      case 2uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath subtractBezierPaths:](CRLBezierPath, "subtractBezierPaths:", v8));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = v22;
        v24 = CFSTR("Subtract Shapes");
        goto LABEL_15;
      case 3uLL:
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPath excludeBezierPaths:](CRLBezierPath, "excludeBezierPaths:", v8));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v23 = v22;
        v24 = CFSTR("Exclude Shapes");
LABEL_15:
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, 0, CFSTR("UndoStrings")));
        v7 = v74;

        break;
      default:
        v25 = 0;
        v21 = 0;
        v7 = v74;
        break;
    }
    if ((uint64_t)objc_msgSend(v21, "elementCount") >= 2)
    {
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      *(_QWORD *)&v28 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v27).n128_u64[0];
      v70 = v21;
      v30 = v29;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](v71, "editingCoordinator", v28));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "boardItemFactory"));
      v65 = (void *)v26;
      v68 = v25;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "makeDuplicateOfBoardItem:", v26));
      v34 = sub_1002223BC(v30, v33);
      v67 = (void *)objc_claimAutoreleasedReturnValue(v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));
      v36 = [CRLCanvasCommandSelectionBehavior alloc];
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v67));
      v38 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v36, "initWithCanvasEditor:type:constructedInfos:", v35, 3, v37);

      v64 = v38;
      objc_msgSend(v7, "openGroupWithSelectionBehavior:", v38);
      objc_msgSend(v7, "enableProgressiveEnqueuingInCurrentGroup");
      objc_msgSend(v7, "setCurrentGroupActionString:", v68);
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v13));
      v7 = v74;
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v10));
      objc_msgSend(v66, "minusSet:", v60);
      objc_msgSend(v70, "bounds");
      v40 = v39;
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v70));
      v48 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v40, v42, v44, v46);
      v63 = v35;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "canvasEditorHelper"));
      v84 = v67;
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v84, 1));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "commandForInsertingBoardItemsIntoTopLevelContainer:below:", v50, v51));

      objc_msgSend(v74, "enqueueCommand:", v52);
      v61 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v67, v47);
      objc_msgSend(v74, "enqueueCommand:");
      v62 = v48;
      v53 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v67, v48);
      objc_msgSend(v74, "enqueueCommand:", v53);
      objc_msgSend(v5, "layoutIfNeeded");
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](v71, "editingCoordinator"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v66));

      if (objc_msgSend(v55, "count"))
      {
        v56 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v55);
        objc_msgSend(v74, "enqueueCommand:", v56);

      }
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "canvasEditorHelper"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v60, 0));

      objc_msgSend(v74, "enqueueCommand:", v58);
      objc_msgSend(v74, "closeGroup");
      v75[0] = _NSConcreteStackBlock;
      v75[1] = 3221225472;
      v75[2] = sub_1001F9004;
      v75[3] = &unk_10122D3D8;
      v76 = v5;
      v77 = v67;
      v59 = v67;
      objc_msgSend(v76, "performBlockOnMainThreadAfterLayoutIfNecessary:", v75);

      v10 = v73;
      v25 = v68;
      v21 = v70;
    }

    v12 = v72;
  }

}

- (void)resetTextAndObjectHandles:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  CRLCanvasInfoGeometry *v37;
  __int128 v38;
  _TtC8Freeform23CRLCommandSetPathSource *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *i;
  uint64_t v48;
  id v49;
  void *v50;
  id obj;
  void *v52;
  uint64_t v53;
  id v54;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v55;
  void *v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  CGAffineTransform v62;
  CGAffineTransform v63;
  _QWORD v64[6];
  _QWORD v65[5];
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[5];
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];

  v49 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commandController"));

  objc_msgSend(v5, "openGroup");
  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
  if (v54)
  {
    v53 = *(_QWORD *)v88;
    v50 = v5;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v88 != v53)
        {
          v8 = v7;
          objc_enumerationMutation(obj);
          v7 = v8;
        }
        v57 = v7;
        v9 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v7);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v6);
        v11 = sub_100221D0C(v10, v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = v12;
        if (v12)
        {
          v81 = 0;
          v82 = &v81;
          v83 = 0x3032000000;
          v84 = sub_1001F9788;
          v85 = sub_1001F9798;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pathSource"));
          v86 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bezierPath"));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
          if ((objc_msgSend(v15, "heightValid") & 1) != 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "geometry"));
            v17 = objc_msgSend(v16, "widthValid");

            if ((v17 & 1) != 0)
              goto LABEL_12;
          }
          else
          {

          }
          v80[0] = _NSConcreteStackBlock;
          v80[1] = 3221225472;
          v80[2] = sub_1001F97A0;
          v80[3] = &unk_1012374B0;
          v80[4] = &v81;
          objc_msgSend(v9, "withTemporaryLayoutPerform:", v80);
LABEL_12:
          v73 = 0;
          v74 = &v73;
          v75 = 0x5010000000;
          v76 = &unk_1010E66AB;
          v18 = *(_OWORD *)&CGAffineTransformIdentity.c;
          v77 = *(_OWORD *)&CGAffineTransformIdentity.a;
          v78 = v18;
          v79 = *(_OWORD *)&CGAffineTransformIdentity.tx;
          v66 = 0;
          v67 = &v66;
          v68 = 0x5010000000;
          v69 = &unk_1010E66AB;
          v70 = v77;
          v71 = v18;
          v72 = v79;
          v65[0] = _NSConcreteStackBlock;
          v65[1] = 3221225472;
          v65[2] = sub_1001F9808;
          v65[3] = &unk_1012374B0;
          v65[4] = &v73;
          objc_msgSend(v9, "withTemporaryLayoutPerform:", v65);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "parentInfo"));
          if (v19)
          {
            do
            {
              if ((objc_msgSend(v19, "conformsToProtocol:", &OBJC_PROTOCOL___CRLContainerInfo) & 1) != 0)
                break;
              objc_opt_class(_TtC8Freeform12CRLBoardItem, v20);
              v22 = sub_100221D0C(v21, v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
              v24 = v23;
              if (v23)
              {
                v64[0] = _NSConcreteStackBlock;
                v64[1] = 3221225472;
                v64[2] = sub_1001F98A8;
                v64[3] = &unk_1012443D0;
                v64[4] = &v73;
                v64[5] = &v66;
                objc_msgSend(v23, "withTemporaryLayoutPerform:", v64);
              }
              v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parentInfo"));

              v19 = (void *)v25;
            }
            while (v25);
          }
          v26 = (void *)v82[5];
          v27 = *((_OWORD *)v74 + 3);
          *(_OWORD *)&v63.a = *((_OWORD *)v74 + 2);
          *(_OWORD *)&v63.c = v27;
          *(_OWORD *)&v63.tx = *((_OWORD *)v74 + 4);
          objc_msgSend(v26, "transformUsingAffineTransform:", &v63);
          objc_msgSend((id)v82[5], "bounds");
          v29 = v28;
          v31 = v30;
          v33 = v32;
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v82[5]));
          v37 = -[CRLCanvasInfoGeometry initWithPosition:size:]([CRLCanvasInfoGeometry alloc], "initWithPosition:size:", v29, v31, v33, v35);
          v38 = *((_OWORD *)v67 + 3);
          *(_OWORD *)&v63.a = *((_OWORD *)v67 + 2);
          *(_OWORD *)&v63.c = v38;
          *(_OWORD *)&v63.tx = *((_OWORD *)v67 + 4);
          CGAffineTransformInvert(&v62, &v63);
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasInfoGeometry geometryByAppendingTransform:](v37, "geometryByAppendingTransform:", &v62));

          v55 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v13, v56);
          v39 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v13, v36);
          objc_msgSend(v5, "openGroup");
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Reset Text and Object Handles"), 0, CFSTR("UndoStrings")));
          objc_msgSend(v5, "setCurrentGroupActionString:", v41);

          objc_msgSend(v5, "enableProgressiveEnqueuingInCurrentGroup");
          objc_msgSend(v5, "enqueueCommand:", v55);
          objc_msgSend(v5, "enqueueCommand:", v39);
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layoutForInfo:", v13));

          if (v43)
          {
            v60 = 0u;
            v61 = 0u;
            v58 = 0u;
            v59 = 0u;
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "connectedLayouts"));
            v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v91, 16);
            v52 = v36;
            if (v45)
            {
              v46 = *(_QWORD *)v59;
              do
              {
                for (i = 0; i != v45; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v59 != v46)
                    objc_enumerationMutation(v44);
                  v48 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
                  -[CRLShapeEditor p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:withClineLayout:withShapeItem:](self, "p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:withClineLayout:withShapeItem:", 1, v48, v13);
                  -[CRLShapeEditor p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:withClineLayout:withShapeItem:](self, "p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:withClineLayout:withShapeItem:", 0, v48, v13);
                }
                v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v58, v91, 16);
              }
              while (v45);
            }

            v5 = v50;
            v36 = v52;
          }
          objc_msgSend(v5, "closeGroup");

          _Block_object_dispose(&v66, 8);
          _Block_object_dispose(&v73, 8);
          _Block_object_dispose(&v81, 8);

        }
        v7 = v57 + 1;
      }
      while ((id)(v57 + 1) != v54);
      v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v92, 16);
    }
    while (v54);
  }

  objc_msgSend(v5, "closeGroup");
}

- (void)p_adjustMagnetsForResetTextAndObjectHandlesForMagnet:(BOOL)a3 withClineLayout:(id)a4 withShapeItem:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "connectionLineInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connectionLinePathSource"));
  v12 = objc_msgSend(v11, "copy");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "board"));
  if (v6)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getConnectedToWithBoardItemOwner:", v14));

    if (v15 != v9)
      goto LABEL_15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "headMagnet"));
  }
  else
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getConnectedFromWithBoardItemOwner:", v14));

    if (v15 != v9)
      goto LABEL_15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tailMagnet"));
  }
  v17 = v16;
  if (v16 && (objc_msgSend(v16, "magnetType") == (id)7 || objc_msgSend(v17, "magnetType") == (id)6))
  {
    if (v6)
      objc_msgSend(v8, "headMagnetCanvasPosition");
    else
      objc_msgSend(v8, "tailMagnetCanvasPosition");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001F9BF4;
    v25[3] = &unk_1012443F8;
    v28 = v18;
    v29 = v19;
    v30 = v6;
    v20 = v12;
    v26 = v20;
    v27 = v17;
    v21 = v17;
    objc_msgSend(v9, "withTemporaryLayoutPerform:", v25);

    v22 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:]([_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc], "initWithConnectionLine:connectedItem:chirality:pathSource:", v10, v9, v6, v20);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "commandController"));
    objc_msgSend(v24, "enqueueCommand:", v22);

  }
  else
  {

  }
  v15 = v9;
LABEL_15:

}

- (void)divideCompoundShape:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;
  CFArrayRef (__cdecl **v15)(CTFontDescriptorRef, CFSetRef);
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  double v43;
  objc_class *v44;
  objc_class *v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  _TtC8Freeform23CRLWPReplaceTextCommand *v53;
  id v54;
  uint64_t v55;
  _TtC8Freeform23CRLWPReplaceTextCommand *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  _TtC8Freeform15CRLCommandGroup *v61;
  void *v62;
  _TtC8Freeform15CRLCommandGroup *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  CRLCanvasCommandSelectionBehavior *v68;
  void *v69;
  CRLCanvasCommandSelectionBehavior *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  id obj;
  void *v86;
  void *v87;
  void *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "boardItemFactory"));
  v75 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  objc_msgSend(v6, "openGroup");
  objc_msgSend(v6, "enableProgressiveEnqueuingInCurrentGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Break Apart"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v6, "setCurrentGroupActionString:", v8);

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topLevelZOrderedSiblingsOfInfos:", v9));

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  if (!v11)
  {

LABEL_33:
    objc_msgSend(v6, "closeGroup", v71, v72);
    goto LABEL_34;
  }
  v13 = v11;
  v14 = 0;
  v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
  v16 = *(_QWORD *)v94;
  v83 = v6;
  v71 = *(_QWORD *)v94;
  v72 = v10;
  v73 = v4;
  do
  {
    v17 = 0;
    v76 = v13;
    do
    {
      if (*(_QWORD *)v94 != v16)
        objc_enumerationMutation(v10);
      v18 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)v17);
      objc_opt_class(_TtC8Freeform12CRLShapeItem, v12);
      v20 = sub_100221D0C(v19, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = v21;
      if (v21)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "pathSource"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bezierPath"));

        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "visuallyDistinctSubregions"));
        if ((unint64_t)objc_msgSend(v26, "count") < 2)
        {
          objc_msgSend(v87, "addObject:", v22);
        }
        else
        {
          v81 = v25;
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15[413], "arrayWithCapacity:", objc_msgSend(v26, "count")));
          objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v27);
          v29 = sub_100221D0C(v28, v22);
          v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "textStorage"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "string"));
          v82 = v17;
          v78 = v31;
          v79 = v30;
          v77 = v32;
          if (v31)
            LODWORD(v33) = objc_msgSend(v32, "isEqualToString:", &stru_1012A72B0) ^ 1;
          else
            LOBYTE(v33) = 0;
          v84 = objc_alloc_init((Class)v15[413]);
          v89 = 0u;
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v80 = v26;
          obj = v26;
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v90;
            do
            {
              for (i = 0; i != v35; i = (char *)i + 1)
              {
                if (*(_QWORD *)v90 != v36)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "geometry", v71, v72));
                objc_msgSend(v38, "bounds");
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "geometryWithNewBounds:"));

                v41 = (void *)objc_claimAutoreleasedReturnValue(+[CRLBezierPathSource pathSourceWithBezierPath:](CRLBezierPathSource, "pathSourceWithBezierPath:", v38));
                *(_QWORD *)&v43 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v42).n128_u64[0];
                v45 = v44;
                v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "makeDuplicateOfBoardItem:", v22, v43));
                v47 = sub_1002223BC(v45, v46);
                v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

                objc_msgSend(v48, "setGeometry:", v40);
                objc_msgSend(v48, "setPathSource:", v41);
                objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v49);
                v51 = sub_100221D0C(v50, v48);
                v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
                if ((v52 == 0) | v33 & 1)
                {
                  LOBYTE(v33) = (v52 == 0) & v33;
                }
                else
                {
                  v53 = [_TtC8Freeform23CRLWPReplaceTextCommand alloc];
                  v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "textStorage"));
                  v54 = objc_msgSend((id)v33, "range");
                  v56 = -[CRLWPReplaceTextCommand initWithShapeItem:range:text:](v53, "initWithShapeItem:range:text:", v52, v54, v55, &stru_1012A72B0);

                  objc_msgSend(v84, "addObject:", v56);
                  LOBYTE(v33) = 0;
                }
                objc_msgSend(v88, "addObject:", v48);
                objc_msgSend(v87, "addObject:", v48);

              }
              v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v97, 16);
            }
            while (v35);
          }

          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v22));
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v74));
          objc_msgSend(v58, "minusSet:", v57);
          v4 = v73;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "canvasEditor"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "commandForInsertingBoardItems:below:", v88, v22));

          objc_msgSend(v83, "enqueueCommand:", v60);
          if (objc_msgSend(v84, "count"))
          {
            v61 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v84);
            objc_msgSend(v83, "enqueueCommand:", v61);

          }
          objc_msgSend(v73, "layoutIfNeeded", v71, v72);
          v62 = (void *)objc_claimAutoreleasedReturnValue(+[CRLConnectionLineAdjustmentHelper commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:](CRLConnectionLineAdjustmentHelper, "commandsForAdjustingConnectionLines:infosToRemove:editingCoordinator:withIcc:", v58, v57, v75, v73));
          if (objc_msgSend(v62, "count"))
          {
            v63 = -[CRLCommandGroup initWithCommands:]([_TtC8Freeform15CRLCommandGroup alloc], "initWithCommands:", v62);
            objc_msgSend(v83, "enqueueCommand:", v63);

          }
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "canvasEditor"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "canvasEditorHelper"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v22));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "commandForDeletingInfosPossiblyFromMultipleContainers:shouldRemoveEmptyContainers:", v66, 0));

          objc_msgSend(v83, "enqueueCommand:", v67);
          v14 = 1;
          v16 = v71;
          v10 = v72;
          v13 = v76;
          v15 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
          v25 = v81;
          v17 = v82;
          v26 = v80;
        }

      }
      v17 = (char *)v17 + 1;
    }
    while (v17 != v13);
    v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v93, v98, 16);
  }
  while (v13);

  v6 = v83;
  if ((v14 & 1) == 0)
    goto LABEL_33;
  v68 = [CRLCanvasCommandSelectionBehavior alloc];
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "canvasEditor"));
  v70 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:type:constructedInfos:](v68, "initWithCanvasEditor:type:constructedInfos:", v69, 3, v87);

  objc_msgSend(v83, "closeGroupWithSelectionBehavior:", v70);
LABEL_34:

}

- (void)p_applyTransformFromInfo:(id)a3 toEditablePathSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfo:", v7));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001FA4FC;
  v12[3] = &unk_101238288;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v8, "forLayoutNearestVisibleRectForInfosForSelectionPath:performBlock:", v10, v12);

}

- (void)setLineEnd:(id)a3 isLeftLineEnd:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  CRLCanvasCommandSelectionBehavior *v8;
  void *v9;
  void *v10;
  CRLCanvasCommandSelectionBehavior *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  double v24;
  id v25;
  _TtC8Freeform20CRLCommandSetLineEnd *v26;
  CRLCanvasCommandSelectionBehavior *v27;
  id obj;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v4 = a4;
  v29 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor editingCoordinator](self, "editingCoordinator"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "commandController"));

  v8 = [CRLCanvasCommandSelectionBehavior alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasEditor"));
  v11 = -[CRLCanvasCommandSelectionBehavior initWithCanvasEditor:](v8, "initWithCanvasEditor:", v10);

  v27 = v11;
  objc_msgSend(v7, "openGroupWithSelectionBehavior:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Stroke Line End Style"), 0, CFSTR("UndoStrings")));
  objc_msgSend(v7, "setCurrentGroupActionString:", v13);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v31;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v31 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v18);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v15);
        v21 = sub_100221D0C(v20, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_QWORD *)&v24 = objc_opt_class(self, v23).n128_u64[0];
        v26 = -[CRLCommandSetLineEnd initWithShapeItem:lineEnd:chirality:]([_TtC8Freeform20CRLCommandSetLineEnd alloc], "initWithShapeItem:lineEnd:chirality:", v22, v29, objc_msgSend(v25, "p_leftLineEndIsHeadForInfo:", v22, v24) ^ v4);
        objc_msgSend(v7, "enqueueCommand:", v26);

        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v16);
  }

  objc_msgSend(v7, "closeGroup");
}

- (id)selectedObjectsSupportingFill
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectsPassingTest:", &stru_101244438));

  return v3;
}

+ (id)keyPathsForValuesAffectingSelectedObjectsSupportingFill
{
  return +[NSSet setWithObject:](NSSet, "setWithObject:", CFSTR("infos"));
}

- (id)selectedObjectsSupportingEndpoints
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor layouts](self, "layouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectsPassingTest:", &stru_101244458));

  return v3;
}

- (BOOL)p_containsOpenPaths
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v3 = +[CRLShapeEditor anyInfoIsOpenPath:](CRLShapeEditor, "anyInfoIsOpenPath:", v2);

  return v3;
}

+ (BOOL)p_leftLineEndIsHeadForInfo:(id)a3
{
  return objc_msgSend(a3, "isTailEndOnLeftBestGuess") ^ 1;
}

- (id)leftLineEnd
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;
  void *v13;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLShapeItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leftLineEndForShape:", v9, v11));

  return v13;
}

+ (id)leftLineEndForShape:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(a1, "p_leftLineEndIsHeadForInfo:", v4) & 1) != 0)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headLineEnd"));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tailLineEnd"));
  v6 = (void *)v5;

  return v6;
}

- (id)rightLineEnd
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  double v11;
  id v12;
  void *v13;

  *(_QWORD *)&v3 = objc_opt_class(_TtC8Freeform12CRLShapeItem, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "anyObject"));
  v8 = sub_1002223BC(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightLineEndForShape:", v9, v11));

  return v13;
}

+ (id)rightLineEndForShape:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(a1, v5).n128_u64[0];
  if ((objc_msgSend(v7, "p_leftLineEndIsHeadForInfo:", v4, v6) & 1) != 0)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tailLineEnd"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "headLineEnd"));
  v9 = (void *)v8;

  return v9;
}

- (id)strokeColorPickerTitle
{
  CRLShapeEditor *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeEditor;
  v3 = -[CRLStyledEditor strokeColorPickerTitle](&v9, "strokeColorPickerTitle");
  LODWORD(v2) = -[CRLShapeEditor infosAreOpenPaths](v2, "infosAreOpenPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if ((_DWORD)v2)
    v6 = CFSTR("Stroke Color");
  else
    v6 = CFSTR("Border Color");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

  return v7;
}

- (id)currentGroupActionStringForStrokeSetting
{
  CRLShapeEditor *v2;
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v2 = self;
  v9.receiver = self;
  v9.super_class = (Class)CRLShapeEditor;
  v3 = -[CRLStyledEditor currentGroupActionStringForStrokeSetting](&v9, "currentGroupActionStringForStrokeSetting");
  LODWORD(v2) = -[CRLShapeEditor infosAreOpenPaths](v2, "infosAreOpenPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if ((_DWORD)v2)
    v6 = CFSTR("Stroke Setting");
  else
    v6 = CFSTR("Border Setting");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, CFSTR("UndoStrings")));

  return v7;
}

- (BOOL)p_shapesContainNonLine
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = objc_opt_self(_TtC8Freeform12CRLBoardItem);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor sortedBoardItemsOfClass:](self, "sortedBoardItemsOfClass:", v4, 0));

  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_opt_class(_TtC8Freeform14CRLWPShapeItem, v6);
        v12 = sub_100221D0C(v11, v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v13));
          if (!+[CRLShapeEditor infosAreLines:](CRLShapeEditor, "infosAreLines:", v14)
            && !+[CRLShapeEditor infosAreConnectionLines:](CRLShapeEditor, "infosAreConnectionLines:", v14))
          {

            LOBYTE(v7) = 1;
            goto LABEL_14;
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:

  return (char)v7;
}

- (BOOL)p_shapesAreMixed
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  if (+[CRLShapeEditor infosAreStickyNotes:](CRLShapeEditor, "infosAreStickyNotes:", v3)
    || +[CRLShapeEditor infosAreLines:](CRLShapeEditor, "infosAreLines:", v3)
    || +[CRLShapeEditor infosAreConnectionLines:](CRLShapeEditor, "infosAreConnectionLines:", v3))
  {
    v4 = 0;
  }
  else if (+[CRLShapeEditor anyInfoIsStickyNote:](CRLShapeEditor, "anyInfoIsStickyNote:", v3))
  {
    v4 = 1;
  }
  else
  {
    v4 = -[CRLShapeEditor anyInfoIsLineOrConnectionLine](self, "anyInfoIsLineOrConnectionLine");
  }

  return v4;
}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
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
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  _BOOL8 v36;
  char v37;
  objc_super v38;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLShapeEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v38, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v9 = +[CRLShapeEditor infosAreLinesAndConnectionLines:](CRLShapeEditor, "infosAreLinesAndConnectionLines:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Set Fill"), 0, 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("circle.fill")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v11, v12, 2, 4));

  objc_msgSend(v13, "setTag:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Choose a fill color"), 0, 0));
  objc_msgSend(v13, "setToolTip:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Set Stroke"), 0, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("line.diagonal")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v17, v18, 2, 8));

  objc_msgSend(v19, "setTag:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = v20;
  v37 = v9;
  v22 = v9 == 0;
  v23 = v7;
  if (v22)
    v24 = CFSTR("Choose a border style");
  else
    v24 = CFSTR("Choose a line style or set line width");
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v24, 0, 0));
  objc_msgSend(v19, "setToolTip:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Set Line Ends"), 0, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("line.diagonal.arrow")));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:options:](CRLQuickInspectorElement, "elementWithName:image:type:options:", v27, v28, 2, 32));

  objc_msgSend(v29, "setTag:", 6);
  v30 = objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v30, "localizedStringForKey:value:table:", CFSTR("Choose a line end type"), 0, 0));
  objc_msgSend(v29, "setToolTip:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  LOBYTE(v30) = +[CRLShapeEditor anyInfoIsStickyNote:](CRLShapeEditor, "anyInfoIsStickyNote:", v32);

  if ((v30 & 1) == 0)
  {
    if (-[CRLShapeEditor p_shapesAreMixed](self, "p_shapesAreMixed"))
    {
      if ((v37 & 1) != 0
        || (v33 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems")),
            v34 = +[CRLShapeEditor infosAreOpenPaths:](CRLShapeEditor, "infosAreOpenPaths:", v33),
            v33,
            v34))
      {
        objc_msgSend(v23, "addObject:", v19);
LABEL_14:
        objc_msgSend(v23, "addObject:", v29);
      }
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
      v36 = +[CRLShapeEditor anyInfoIsTextBox:](CRLShapeEditor, "anyInfoIsTextBox:", v35);

      if (-[CRLShapeEditor p_canSetFillWithAnyInfoIsTextBox:](self, "p_canSetFillWithAnyInfoIsTextBox:", v36))
        objc_msgSend(v23, "addObject:", v13);
      if (-[CRLShapeEditor p_canSetStrokeWithAnyInfoIsTextBox:](self, "p_canSetStrokeWithAnyInfoIsTextBox:", v36))
        objc_msgSend(v23, "addObject:", v19);
      if (-[CRLShapeEditor infosSupportEndpoints](self, "infosSupportEndpoints"))
        goto LABEL_14;
    }
  }

}

- (BOOL)p_canSetFill
{
  void *v3;
  _BOOL8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v4 = +[CRLShapeEditor anyInfoIsTextBox:](CRLShapeEditor, "anyInfoIsTextBox:", v3);

  return -[CRLShapeEditor p_canSetFillWithAnyInfoIsTextBox:](self, "p_canSetFillWithAnyInfoIsTextBox:", v4);
}

- (BOOL)p_canSetFillWithAnyInfoIsTextBox:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 0;
  else
    return !-[CRLShapeEditor anyInfoIsLineOrConnectionLine](self, "anyInfoIsLineOrConnectionLine", v3, v4);
}

- (BOOL)p_canSetStrokeWithAnyInfoIsTextBox:(BOOL)a3
{
  return !a3;
}

- (void)setShapeFill:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CRLCommandSelectionBehavior *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CRLCommandSelectionBehavior *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_class *v20;
  id v21;
  void *v22;
  _TtC8Freeform17CRLCommandSetFill *v23;
  CRLCommandSelectionBehavior *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));
  v7 = [CRLCommandSelectionBehavior alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPath"));
  v25 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  v12 = -[CRLCommandSelectionBehavior initWithForwardSelectionPath:reverseSelectionPath:](v7, "initWithForwardSelectionPath:reverseSelectionPath:", v9, v11);

  v24 = v12;
  objc_msgSend(v6, "openGroupWithSelectionBehavior:", v12);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v16 = v14;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v18);
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v15);
        v21 = sub_1002223BC(v20, v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        if (v22)
        {
          v23 = -[CRLCommandSetFill initWithShapeItem:fill:]([_TtC8Freeform17CRLCommandSetFill alloc], "initWithShapeItem:fill:", v22, v4);
          objc_msgSend(v6, "enqueueCommand:", v23);

        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v16);
  }

  objc_msgSend(v6, "closeGroup");
}

- (void)showShapeLibraryPopover:(id)a3
{
  if (+[CRLFeatureFlagGroup isEasierConnectionLinesEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isEasierConnectionLinesEnabled", a3)|| +[CRLFeatureFlagGroup isChangeShapeEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isChangeShapeEnabled"))
  {
    +[CRLShapeLibraryPopoverHelper showShapeLibraryForEditor:](_TtC8Freeform28CRLShapeLibraryPopoverHelper, "showShapeLibraryForEditor:", self);
  }
}

- (void)dismissShapeLibraryPopover:(id)a3
{
  +[CRLShapeLibraryPopoverHelper dismissShapeLibraryForEditor:](_TtC8Freeform28CRLShapeLibraryPopoverHelper, "dismissShapeLibraryForEditor:", self);
}

- (BOOL)allowsChangeShape
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
        objc_opt_class(_TtC8Freeform12CRLShapeItem, v3);
        v9 = sub_100221D0C(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = v10;
        if (v10 && objc_msgSend(v10, "allowsChangeShape"))
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

- (void)changeShapeToUsePathSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  CRLCommandSelectionBehavior *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v4 = a3;
  if (-[CRLShapeEditor allowsChangeShape](self, "allowsChangeShape")
    && objc_msgSend(v4, "canUseToChangeShape"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "commandController"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "canvasEditor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasEditorHelper"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfos:", v10));

    v11 = objc_alloc_init((Class)NSMutableSet);
    objc_msgSend(v6, "openGroup");
    objc_msgSend(v6, "enableProgressiveEnqueuingInCurrentGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Change Shape"), 0, CFSTR("UndoStrings")));
    objc_msgSend(v6, "setCurrentGroupActionString:", v13);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v14);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          objc_opt_class(_TtC8Freeform12CRLShapeItem, v16);
          v22 = sub_1002223BC(v21, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          if (objc_msgSend(v23, "allowsChangeShape"))
          {
            objc_msgSend(v11, "addObject:", v23);
            -[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:](self, "p_changeShapeOfItem:toUsePathSource:", v23, v4);
          }

        }
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPathWithInfos:", v11));
    v25 = -[CRLCommandSelectionBehavior initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:]([CRLCommandSelectionBehavior alloc], "initWithCommitSelectionPath:forwardSelectionPath:reverseSelectionPath:", v26, v24, v26);
    objc_msgSend(v6, "closeGroupWithSelectionBehavior:", v25);

  }
}

- (void)p_changeShapeOfItem:(id)a3 toUsePathSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _TtC8Freeform23CRLCommandSetPathSource *v47;
  _TtC8Freeform23CRLCommandSetPathSource *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  CRLCanvasInfoGeometry *v61;
  void *v62;
  double v63;
  CRLCanvasInfoGeometry *v64;
  _TtC8Freeform25CRLCommandSetInfoGeometry *v65;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *i;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  _TtC8Freeform37CRLCommandSetConnectionLineConnection *v107;
  _TtC8Freeform23CRLCommandSetPathSource *v108;
  void *v109;
  void *v110;
  id obj;
  CRLShapeEditor *v112;
  void *v113;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];

  v6 = a3;
  v7 = a4;
  v112 = self;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commandController"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  objc_msgSend(v9, "size");
  if (v10 == 0.0)
  {

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    objc_msgSend(v11, "size");
    v13 = v12;

    if (v13 != 0.0)
      goto LABEL_14;
  }
  +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101244478);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0C1B4();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101244498);
  v14 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100DE7468(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 1532, 0, "Cannot change shape from a shape whose width or height is zero");

LABEL_14:
  objc_msgSend(v7, "naturalSize");
  if (v17 == 0.0 || (objc_msgSend(v7, "naturalSize"), v18 == 0.0))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012444B8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C134();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012444D8);
    v19 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v20, v21, 1533, 0, "Cannot change shape to a shape whose width and height are both nonzero.");

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  objc_msgSend(v22, "size");
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  objc_msgSend(v25, "size");
  v27 = v24 / v26;

  objc_msgSend(v7, "naturalSize");
  v29 = v28;
  objc_msgSend(v7, "naturalSize");
  v31 = v29 / v30;
  v32 = objc_msgSend(v7, "copy");
  v33 = v7;
  v34 = vabdd_f64(v27, v31) < 0.00999999978 || v27 == v31;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
  objc_msgSend(v35, "size");
  v37 = v36;
  v109 = v33;
  if (v34)
  {
    objc_msgSend(v32, "scaleToNaturalSize:", v36);

  }
  else
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    objc_msgSend(v38, "size");
    v40 = v37 * v39;

    objc_msgSend(v33, "naturalSize");
    v42 = v41;
    objc_msgSend(v33, "naturalSize");
    v44 = sqrt(v40 / (v42 * v43));
    objc_msgSend(v33, "naturalSize");
    objc_msgSend(v32, "scaleToNaturalSize:", sub_1000603DC(v45, v46, v44));
  }
  v47 = -[CRLCommandSetPathSource initWithShapeItem:pathSource:]([_TtC8Freeform23CRLCommandSetPathSource alloc], "initWithShapeItem:pathSource:", v6, v32);
  v110 = v32;
  if ((objc_msgSend(v114, "isGroupOpen") & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    v48 = v47;
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012444F8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0C0B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101244518);
    v49 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLShapeEditor p_changeShapeOfItem:toUsePathSource:]"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLShapeEditor.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v50, v51, 1565, 0, "Changing shapes is only supported from within an open command group.");

    v47 = v48;
  }
  v108 = v47;
  objc_msgSend(v114, "enqueueCommand:", v47);
  if (!v34)
  {
    objc_msgSend(v32, "naturalSize");
    v53 = v52;
    v55 = v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    objc_msgSend(v56, "center");
    v58 = v57;
    v60 = v59;

    v61 = [CRLCanvasInfoGeometry alloc];
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geometry"));
    objc_msgSend(v62, "angle");
    v64 = -[CRLCanvasInfoGeometry initWithPosition:size:angle:](v61, "initWithPosition:size:angle:", v58 - v53 * 0.5, v60 - v55 * 0.5, v53, v55, v63);

    v65 = -[CRLCommandSetInfoGeometry initWithBoardItem:geometry:]([_TtC8Freeform25CRLCommandSetInfoGeometry alloc], "initWithBoardItem:geometry:", v6, v64);
    objc_msgSend(v114, "enqueueCommand:", v65);

  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](v112, "interactiveCanvasController"));
  v113 = v6;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "layoutForInfo:", v6));

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "connectedLayouts"));
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v69; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v70)
          objc_enumerationMutation(obj);
        v72 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "connectionLineInfo"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "connectionLinePathSource"));
        v75 = objc_msgSend(v74, "copy");

        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "connectedTo"));
        if (v76 == v67)
        {
          -[CRLShapeEditor p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:](v112, "p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:", v72, v67, v113, 11);
          v97 = v96;
          v99 = v98;
          v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "headMagnet"));
          objc_msgSend(v100, "setMagnetNormalizedPosition:", v97, v99);

          v101 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
          *(_QWORD *)&v103 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v102).n128_u64[0];
          v105 = v104;
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "connectedTo", v103));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "info"));
          v106 = sub_100221D0C(v105, v89);
          v91 = (void *)objc_claimAutoreleasedReturnValue(v106);
          v92 = v101;
          v93 = v73;
          v94 = v91;
          v95 = 1;
        }
        else
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "connectedFrom"));

          if (v77 != v67)
            goto LABEL_53;
          -[CRLShapeEditor p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:](v112, "p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:withOldLayout:withNewInfo:forLineEnd:", v72, v67, v113, 10);
          v79 = v78;
          v81 = v80;
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "tailMagnet"));
          objc_msgSend(v82, "setMagnetNormalizedPosition:", v79, v81);

          v83 = [_TtC8Freeform37CRLCommandSetConnectionLineConnection alloc];
          *(_QWORD *)&v85 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v84).n128_u64[0];
          v87 = v86;
          v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "connectedFrom", v85));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "info"));
          v90 = sub_100221D0C(v87, v89);
          v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
          v92 = v83;
          v93 = v73;
          v94 = v91;
          v95 = 0;
        }
        v107 = -[CRLCommandSetConnectionLineConnection initWithConnectionLine:connectedItem:chirality:pathSource:](v92, "initWithConnectionLine:connectedItem:chirality:pathSource:", v93, v94, v95, v75);

        objc_msgSend(v114, "enqueueCommand:", v107);
LABEL_53:

      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v119, 16);
    }
    while (v69);
  }

}

- (CGPoint)p_getNewMagnetNormalizedPositionAfterChangingShapeWithConnectionLine:(id)a3 withOldLayout:(id)a4 withNewInfo:(id)a5 forLineEnd:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  uint64_t v36;
  uint64_t v37;
  CGPoint result;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (a6 == 11)
    v12 = objc_msgSend(v9, "headMagnetType");
  else
    v12 = objc_msgSend(v9, "tailMagnetType");
  v13 = v12;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3010000000;
  v36 = 0;
  v37 = 0;
  v35[3] = &unk_1010E66AB;
  if (a6 == 11)
    objc_msgSend(v9, "headMagnetCanvasPosition");
  else
    objc_msgSend(v9, "tailMagnetCanvasPosition");
  v36 = v14;
  v37 = v15;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x3010000000;
  v33 = 0;
  v34 = 0;
  v32 = &unk_1010E66AB;
  if (a6 == 11)
    objc_msgSend(v9, "headMagnetNormalizedPosition");
  else
    objc_msgSend(v9, "tailMagnetNormalizedPosition");
  v33 = v16;
  v34 = v17;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1001FC544;
  v23[3] = &unk_101244540;
  v27 = v13;
  v25 = v35;
  v18 = v9;
  v28 = a6;
  v24 = v18;
  v26 = &v29;
  objc_msgSend(v11, "withTemporaryLayoutPerform:", v23);
  v19 = v30[4];
  v20 = v30[5];

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

  v21 = v19;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (BOOL)fillInspectorDisclosed
{
  return *(&self->super.mIsChangingStrokeWidth + 1);
}

- (CRLPathEditor)nextPathEditor
{
  return (CRLPathEditor *)objc_loadWeakRetained((id *)(&self->mFillInspectorDisclosed + 1));
}

- (void)setNextPathEditor:(id)a3
{
  objc_storeWeak((id *)(&self->mFillInspectorDisclosed + 1), a3);
}

- (BOOL)p_anyInfoWasLine
{
  return BYTE1(self->mNextPathEditor);
}

- (void)setP_anyInfoWasLine:(BOOL)a3
{
  BYTE1(self->mNextPathEditor) = a3;
}

- (BOOL)p_anyInfoWasAutoresizing
{
  return BYTE2(self->mNextPathEditor);
}

- (void)setP_anyInfoWasAutoresizing:(BOOL)a3
{
  BYTE2(self->mNextPathEditor) = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)(&self->mFillInspectorDisclosed + 1));
}

@end
