@implementation CRLiOSCanvasContextMenuInteractionDelegate

- (CRLiOSCanvasContextMenuInteractionDelegate)initWithInteractiveCanvasController:(id)a3
{
  id v4;
  CRLiOSCanvasContextMenuInteractionDelegate *v5;
  CRLiOSCanvasContextMenuInteractionDelegate *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRLiOSCanvasContextMenuInteractionDelegate;
  v5 = -[CRLiOSCanvasContextMenuInteractionDelegate init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);

  return v6;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  unsigned __int8 v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *i;
  void *v48;
  _QWORD *v49;
  char v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  id v60;
  _QWORD v61[7];
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  _BYTE v66[128];

  y = a4.y;
  x = a4.x;
  v7 = a3;
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v10 = objc_msgSend(WeakRetained, "currentlyScrolling");

  if ((v10 & 1) == 0)
  {
    v12 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layerHost"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asiOSCVC"));

    if (!objc_msgSend(v14, "i_allowCanvasInteraction:atPoint:", v7, x, y))
    {
      v11 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v15 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    objc_msgSend(v15, "convertBoundsToUnscaledPoint:", x, y);
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));
    if ((objc_opt_respondsToSelector(v20, "currentDocumentMode") & 1) != 0)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentDocumentMode"));
      v21 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "contextMenuConfigurationForContextMenuInteraction:atPoint:onInteractiveCanvasController:", v7, v21, v17, v19));

      if (v22)
      {
        v23 = v22;
LABEL_22:
        v29 = v23;
        v11 = v23;
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      v54 = 0;
    }
    v24 = objc_msgSend(v7, "menuAppearance");
    if (v24 != (id)2)
    {
      if (!v24)
      {
        v25 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244F98);
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0D2E4();
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_101244FB8);
        v26 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          sub_100E0D234(v26, v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasContextMenuInteractionDelegate contextMenuInteraction:configurationForMenuAtLocation:]"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasContextMenuInteractionDelegate.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v27, v28, 80, 0, "Unexpected menuAppearance!");

      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSCanvasContextMenuInteractionDelegate p_primaryMenuConfigurationAtPoint:](self, "p_primaryMenuConfigurationAtPoint:", v17, v19));
      goto LABEL_21;
    }
    v62 = 0;
    v63 = &v62;
    v64 = 0x2020000000;
    v65 = 0;
    if (v54)
    {
      v31 = objc_msgSend(v54, "wantsAlternateContextMenuBehaviorAtPoint:", v17, v19);
      *((_BYTE *)v63 + 24) = v31;
      if ((v31 & 1) != 0)
        goto LABEL_29;
    }
    v32 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "editorController"));
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_10020F418;
    v61[3] = &unk_101244FE0;
    *(double *)&v61[5] = v17;
    *(double *)&v61[6] = v19;
    v61[4] = &v62;
    objc_msgSend(v33, "enumerateEditorsOnStackUsingBlock:", v61);

    if (*((_BYTE *)v63 + 24))
    {
LABEL_29:
      _Block_object_dispose(&v62, 8);
      v29 = 0;
      goto LABEL_30;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCanvasContextMenuPlatformObject platformObjectWithInteraction:](CRLCanvasContextMenuPlatformObject, "platformObjectWithInteraction:", v7));
    v35 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v60 = 0;
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "hitKnobAtPoint:inputType:returningRep:", 0, &v60, v17, v19));
    v52 = v60;

    if (v53 && v52)
    {
      objc_msgSend(v52, "convertNaturalPointFromUnscaledCanvas:", v17, v19);
      v37 = v36;
      v39 = v38;
      if ((objc_msgSend(v52, "wantsContextMenuAtPoint:withPlatformObject:onKnob:", v34, v53) & 1) == 0)
      {
        v29 = 0;
        v50 = 0;
        goto LABEL_55;
      }
      objc_msgSend(v52, "handleContextMenuClickAtPoint:withPlatformObject:onKnob:", v34, v53, v37, v39);
    }
    else
    {
      v40 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "hitRep:", v17, v19));

      if (v41)
      {
        objc_msgSend(v41, "convertNaturalPointFromUnscaledCanvas:", v17, v19);
        if ((objc_msgSend(v41, "wantsContextMenuAtPoint:withPlatformObject:onKnob:", v34, 0) & 1) == 0)
        {
          v29 = 0;
          v50 = 0;
LABEL_54:

LABEL_55:
          _Block_object_dispose(&v62, 8);
          if ((v50 & 1) != 0)
          {
LABEL_21:
            v23 = v29;
            goto LABEL_22;
          }
LABEL_30:
          v11 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v41, "convertNaturalPointFromUnscaledCanvas:", v17, v19);
        objc_msgSend(v41, "handleContextMenuClickAtPoint:withPlatformObject:onKnob:", v34, 0);
      }

    }
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v42 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "editorController"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "currentEditors"));

    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    v51 = v34;
    if (v45)
    {
      v46 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(_QWORD *)v57 != v46)
            objc_enumerationMutation(v44);
          v48 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v48, "addContextualMenuElementsToArray:atPoint:") & 1) != 0)
            objc_msgSend(v48, "addContextualMenuElementsToArray:atPoint:", v41, v17, v19);
        }
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
      }
      while (v45);
    }

    v34 = v51;
    if (objc_msgSend(v41, "count"))
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10020F480;
      v55[3] = &unk_10123D3C8;
      v55[4] = v41;
      v49 = objc_retainBlock(v55);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", 0, 0, v49));

    }
    else
    {
      v29 = 0;
    }
    v50 = 1;
    goto LABEL_54;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (id)p_primaryMenuConfigurationAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id WeakRetained;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitRep:", x, y));

  if (v6)
  {
    objc_msgSend(v6, "convertNaturalPointFromUnscaledCanvas:", x, y);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextMenuConfigurationAtPoint:"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  id v8;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "menuAppearance") == (id)2)
  {
    v8 = 0;
  }
  else
  {
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asiOSCVC"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
    if ((objc_opt_respondsToSelector(v13, "currentDocumentMode") & 1) == 0
      || (v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentDocumentMode")),
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contextMenuInteraction:previewForHighlightingMenuWithConfiguration:", v6, v7)), v14, !v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canvasView"));
      objc_msgSend(v6, "locationInView:", v16);
      v18 = v17;
      v20 = v19;
      v21 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      objc_msgSend(v21, "convertBoundsToUnscaledPoint:", v18, v20);
      v23 = v22;
      v25 = v24;

      v26 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "hitRep:", v23, v25));

      if (v27)
      {
        objc_msgSend(v27, "convertNaturalPointFromUnscaledCanvas:", v23, v25);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "contextMenuPreviewForHighlightingMenuAtPoint:withConfiguration:", v7));
      }
      else
      {
        v15 = 0;
      }

    }
    v8 = v15;

  }
  return v8;
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_didDisplayMenu)
    goto LABEL_11;
  v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101245000);
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0D414();
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101245020);
  v12 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    sub_100E0D368(v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSCanvasContextMenuInteractionDelegate contextMenuInteraction:willDisplayMenuForConfiguration:animator:]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSCanvasContextMenuInteractionDelegate.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 207, 0, "Should not be told will display when already displayed");

  if (!self->_didDisplayMenu)
  {
LABEL_11:
    WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
    objc_msgSend(v16, "suspendCollaborationWithReason:", CFSTR("iOSCanvasContextMenu"));

    v17 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layerHost"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "asiOSCVC"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "delegate"));
    if ((objc_opt_respondsToSelector(v20, "currentDocumentMode") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvasView"));
      objc_msgSend(v8, "locationInView:", v21);
      v23 = v22;
      v25 = v24;
      v26 = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
      objc_msgSend(v26, "convertBoundsToUnscaledPoint:", v23, v25);
      v28 = v27;
      v30 = v29;

      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "currentDocumentMode"));
      objc_msgSend(v31, "willShowContextMenuInteraction:atPoint:", v8, v28, v30);

    }
    self->_didDisplayMenu = 1;

  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_didDisplayMenu)
  {
    self->_didDisplayMenu = 0;
    p_interactiveCanvasController = &self->_interactiveCanvasController;
    WeakRetained = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editingCoordinator"));
    objc_msgSend(v13, "resumeCollaborationWithReason:", CFSTR("iOSCanvasContextMenu"));

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentEditors"));

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v21, "contextMenuInteraction:willEndForConfiguration:animator:") & 1) != 0)
            objc_msgSend(v21, "contextMenuInteraction:willEndForConfiguration:animator:", v8, v9, v10);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v18);
    }

  }
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  CRLInteractiveCanvasController **p_interactiveCanvasController;
  id WeakRetained;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a4;
  p_interactiveCanvasController = &self->_interactiveCanvasController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
  objc_msgSend(v6, "sourcePoint");
  objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
  v10 = v9;
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = objc_loadWeakRetained((id *)p_interactiveCanvasController);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentEditors"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v21, "addContextualMenuElementsToArray:atPoint:") & 1) != 0)
          objc_msgSend(v21, "addContextualMenuElementsToArray:atPoint:", v13, v10, v12);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1012A72B0, v13));
  return v22;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_didDisplayMenu = 1;
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  self->_didDisplayMenu = 0;
}

- (BOOL)currentlyDisplayingMenu
{
  return self->_didDisplayMenu;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
