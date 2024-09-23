@implementation CRLLockedDrawableEditor

- (void)p_unlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "canvasEditor"));

  objc_msgSend(v6, "unlock:", v4);
}

- (CRLBoardItemEditor)auxiliaryDrawableEditor
{
  return self->_auxiliaryDrawableEditor;
}

- (void)setAuxiliaryDrawableEditor:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryDrawableEditor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryDrawableEditor, 0);
}

- (void)crlaxAddContextualMenuOptionsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[CRLLockedDrawableEditor addContextualMenuElementsToArray:atPoint:](self, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title", (_QWORD)v17));
        if (objc_msgSend(v15, "length"))
        {
          v16 = objc_msgSend(v14, "state");

          if (v16 != (id)1)
            continue;
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "title"));
          objc_msgSend(v7, "addObject:", v15);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

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
  id v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  NSMutableArray *v34;
  void *v35;
  id v36;
  void *v37;
  objc_super v38;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v38.receiver = self;
  v38.super_class = (Class)CRLLockedDrawableEditor;
  -[CRLBoardItemEditor addContextualMenuElementsToArray:atPoint:](&v38, "addContextualMenuElementsToArray:atPoint:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Unlock"), 0, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("lock.open")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v9, v10, "unlock:", 0));

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

      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
      if (v20 == CFSTR("CRLCutCopyPasteMenuIdentifier"))
        break;

      if (++v13 >= (unint64_t)objc_msgSend(v7, "count"))
        goto LABEL_5;
    }
    if (v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "children"));
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        v24 = 0;
        while (1)
        {
          *(_QWORD *)&v25 = objc_opt_class(UICommand, v23).n128_u64[0];
          v27 = v26;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "children", v25));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v24));
          v30 = sub_100221D0C(v27, v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

          if (objc_msgSend(v31, "action") == "lock:" && objc_msgSend(v31, "attributes") != (id)4)
            break;

          ++v24;
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "children"));
          v33 = objc_msgSend(v32, "count");

          if (v24 >= (unint64_t)v33)
            goto LABEL_6;
        }

        if (v13 != 0x7FFFFFFFFFFFFFFFLL && v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v34 = objc_opt_new(NSMutableArray);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "children"));
          -[NSMutableArray addObjectsFromArray:](v34, "addObjectsFromArray:", v35);

          -[NSMutableArray insertObject:atIndex:](v34, "insertObject:atIndex:", v11, v24 + 1);
          v36 = -[NSMutableArray copy](v34, "copy");
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "menuByReplacingChildren:", v36));

          objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v13, v37);
          goto LABEL_7;
        }
      }
    }
  }
  else
  {
LABEL_5:
    v19 = 0;
  }
LABEL_6:
  objc_msgSend(v7, "addObject:", v11);
LABEL_7:

}

- (void)addMiniFormatterElementsToArray:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CRLLockedDrawableEditor;
  -[CRLBoardItemEditor addMiniFormatterElementsToArray:atPoint:](&v24, "addMiniFormatterElementsToArray:atPoint:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("eye")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
  v10 = +[CRLURLEditor canOpenItemURLFor:](_TtC8Freeform12CRLURLEditor, "canOpenItemURLFor:", v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Open Link"), 0, 0));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:](CRLQuickInspectorElement, "elementWithName:image:type:action:", v12, v8, 2, "openItemURL:"));

    objc_msgSend(v13, "setTag:", 19);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Open this link");
    goto LABEL_9;
  }
  if (-[CRLBoardItemEditor canShowPreview](self, "canShowPreview"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Preview"), 0, 0));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRLImage crl_quickInspectorImageNamed:](CRLImage, "crl_quickInspectorImageNamed:", CFSTR("eye")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRLQuickInspectorElement elementWithName:image:type:action:](CRLQuickInspectorElement, "elementWithName:image:type:action:", v18, v19, 2, "showPreview:"));

    objc_msgSend(v13, "setTag:", 19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
    if (objc_msgSend(v20, "count") == (id)1)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBoardItemEditor boardItems](self, "boardItems"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "anyObject"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "previewTooltip"));

      if (v15)
      {
        objc_msgSend(v13, "setToolTip:", v15);
LABEL_10:

        objc_msgSend(v7, "addObject:", v13);
        goto LABEL_11;
      }
    }
    else
    {

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v15 = v14;
    v16 = CFSTR("Preview");
LABEL_9:
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v16, 0, 0));
    objc_msgSend(v13, "setToolTip:", v23);

    goto LABEL_10;
  }
LABEL_11:

}

@end
