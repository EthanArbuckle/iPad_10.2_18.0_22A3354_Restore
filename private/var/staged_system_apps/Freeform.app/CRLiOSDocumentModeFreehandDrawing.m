@implementation CRLiOSDocumentModeFreehandDrawing

- (CRLiOSDocumentModeFreehandDrawing)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  id v6;
  CRLiOSDocumentModeFreehandDrawing *v7;
  CRLiOSDocumentModeFreehandDrawing *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  v7 = -[CRLiOSDocumentMode initWithBoardViewController:](&v10, "initWithBoardViewController:", a3);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_icc, v6);
    v8->_previousCanvasScrollMinTouchCount = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = a3;
  LOBYTE(self) = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5));

  return (char)self;
}

- (unint64_t)hash
{
  return 5;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return "paste:" != a3
      && "copy:" != a3
      && "cut:" != a3
      && "selectAll:" != a3
      && "transform:" != a3
      && "duplicate:" != a3
      && "separate:" != a3
      && "mergeDrawings:" != a3
      && "delete:" != a3;
}

- (unint64_t)pencilModeType
{
  return 1;
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 1;
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  unsigned __int8 v23;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allTouchesDoneGestureRecognizer"));
  if ((id)v8 == v4)
  {
    v23 = 1;
    v9 = v4;
    goto LABEL_22;
  }
  v9 = (void *)v8;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "preventScrollGestureRecognizer"));
  if ((id)v10 == v4)
  {

LABEL_21:
    v23 = 1;
    goto LABEL_22;
  }
  v11 = (void *)v10;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "zoomGestureRecognizer"));
  if ((id)v12 == v4)
  {

LABEL_20:
    goto LABEL_21;
  }
  v13 = (void *)v12;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "freehandDrawingGestureRecognizer"));
  if ((id)v14 == v4)
  {

LABEL_19:
    goto LABEL_20;
  }
  v15 = (void *)v14;
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "knobDragGestureRecognizer"));
  if ((id)v16 == v4)
  {

LABEL_18:
    goto LABEL_19;
  }
  v17 = (void *)v16;
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleTapGestureRecognizer"));
  if ((id)v18 == v4)
  {

LABEL_17:
    goto LABEL_18;
  }
  v19 = (void *)v18;
  v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repDragGestureRecognizer"));
  if ((id)v20 == v4)
  {

    goto LABEL_17;
  }
  v21 = (void *)v20;
  v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "doubleTapGestureRecognizer"));

  if (v22 == v4)
  {
    v23 = 1;
    goto LABEL_23;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appSpecificGestureRecognizersAllowedDuringFreehandDrawing"));
  v23 = objc_msgSend(v9, "containsObject:", v4);
LABEL_22:

LABEL_23:
  return v23;
}

- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_msgSend(a3, "mutableCopy");
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "singleTapGestureRecognizer"));
  objc_msgSend(v4, "removeObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repDragGestureRecognizer"));
  objc_msgSend(v4, "removeObject:", v9);

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "doubleTapGestureRecognizer"));
    objc_msgSend(v4, "removeObject:", v10);

  }
  return v4;
}

- (id)allowedKeyCommandsFromKeyCommands:(id)a3
{
  return 0;
}

- (BOOL)wantsToSuppressZoomInResponseToSelectionChange
{
  return 1;
}

- (BOOL)wantsToSuppressMiniFormatter
{
  return 1;
}

- (BOOL)wantsToSuppressBottomToolbarInCompact
{
  return 1;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 1;
}

- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  unsigned int v12;
  void *v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentTool"));
  v11 = objc_msgSend(v10, "type");

  v12 = objc_msgSend(v9, "isLassoAbleToSelectMixedType");
  if (v11 != (id)9 || v12 == 0)
    v14 = 0;
  else
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPathFromPersistableSelectionPath:selectableBoardItemsFromParentMapAndSiblings:", v6, &stru_10123CFE0));

  return v14;
}

- (BOOL)wantsLegacyEditMenu
{
  return 1;
}

- (void)setInteractiveCanvasController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);

  v5 = obj;
  if (WeakRetained != obj)
  {
    if (self->_isObservingICCNotifications)
    {
      v6 = objc_loadWeakRetained((id *)&self->_icc);
      -[CRLiOSDocumentModeFreehandDrawing p_removeObservationOfInteractiveCanvasController:](self, "p_removeObservationOfInteractiveCanvasController:", v6);

      -[CRLiOSDocumentModeFreehandDrawing p_addObservationOfInteractiveCanvasController:](self, "p_addObservationOfInteractiveCanvasController:", obj);
    }
    objc_storeWeak((id *)&self->_icc, obj);
    v5 = obj;
  }

}

- (void)p_addObservationOfInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));

  objc_msgSend(v6, "addObserver:selector:name:object:", self, "selectionPathDidChange:", CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v5);
  self->_isObservingICCNotifications = 1;

}

- (void)p_removeObservationOfInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));

  objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("CRLEditorControllerSelectionPathDidChangeNotification"), v5);
  self->_isObservingICCNotifications = 0;

}

- (BOOL)wantsDoneButtonInCompact
{
  return 1;
}

- (void)selectionPathDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));

  if (v4 != v6)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D000);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E006B8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D020);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing selectionPathDidChange:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 248, 0, "The observed editor controller does not match the editor controller owned by self.interactiveCanvasController. You probably forgot to update observation in -setInteractiveCanvasController:");

  }
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTool"));
  v14 = objc_msgSend(v13, "type");

  if (v14 != (id)9)
  {
    v15 = objc_loadWeakRetained((id *)p_icc);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "editorController"));
    v18 = objc_msgSend(v16, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLShapeEditor, v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 0))
    {
      v20 = objc_loadWeakRetained((id *)p_icc);
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "editorController"));
      v23 = objc_msgSend(v21, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLFreehandDrawingEditor, v22));
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      v25 = objc_loadWeakRetained((id *)p_icc);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "editorController"));
      v28 = objc_msgSend(v26, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLStyledEditor, v27));
      v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

      if (v24 && v29)
      {
        objc_msgSend(v12, "setCurrentToolSelection:", 9);
      }
      else
      {
        v30 = objc_loadWeakRetained((id *)p_icc);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "editorController"));
        v33 = objc_msgSend(v31, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLBoardItemEditor, v32));
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

        if (v34)
        {
          v36 = objc_opt_class(CRLFreehandDrawingEditor, v35);
          if ((objc_opt_isKindOfClass(v34, v36) & 1) == 0)
            objc_msgSend(v12, "setCurrentToolSelection:", 9);
        }

      }
    }
    else if (v19)
    {
      objc_msgSend(v12, "setCurrentToolSelection:", 9);
    }

  }
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  UIEditMenuInteraction *v18;
  UIEditMenuInteraction *lassoSelectionEditMenuInteraction;
  id v20;
  void *v21;
  objc_super v22;

  v4 = a4;
  v22.receiver = self;
  v22.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  v6 = a3;
  -[CRLiOSDocumentMode modeWillBeginFromMode:forced:](&v22, "modeWillBeginFromMode:forced:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedViewController"));

  if (v8 && (objc_opt_respondsToSelector(v7, "dismissPresentedViewController") & 1) != 0)
    objc_msgSend(v7, "dismissPresentedViewController");
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  -[CRLiOSDocumentModeFreehandDrawing p_addObservationOfInteractiveCanvasController:](self, "p_addObservationOfInteractiveCanvasController:", WeakRetained);

  v10 = objc_loadWeakRetained((id *)&self->_icc);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingToolkit"));

  if (!v11)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D040);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00738();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D060);
    v12 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillBeginFromMode:forced:]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 292, 0, "invalid nil value for '%{public}s'", "toolkit");

  }
  objc_msgSend(v11, "addToolkitObserver:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toolTray"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing toolTray](self, "toolTray"));

  if (v15 == v16)
    self->_didFinishPresentingBottomToolTray = 1;
  v17 = objc_msgSend(v6, "pencilModeType");

  if (v17 != (id)1)
    +[CRLAnalyticsFeatureUsed logFeatureUsedWithName:](_TtC8Freeform23CRLAnalyticsFeatureUsed, "logFeatureUsedWithName:", 6);
  v18 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc((Class)UIEditMenuInteraction), "initWithDelegate:", self);
  lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
  self->_lassoSelectionEditMenuInteraction = v18;

  -[UIEditMenuInteraction setPresentsContextMenuAsSecondaryAction:](self->_lassoSelectionEditMenuInteraction, "setPresentsContextMenuAsSecondaryAction:", 0);
  v20 = objc_loadWeakRetained((id *)&self->_icc);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "canvasView"));
  objc_msgSend(v21, "addInteraction:", self->_lassoSelectionEditMenuInteraction);

}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  unint64_t *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *previousFreehandGestureTouchTypes;
  void *v21;
  void *v22;
  void *v23;
  CRLiOSTapGestureRecognizer *v24;
  UITapGestureRecognizer *editMenuTapGR;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v4 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  v6 = a3;
  -[CRLiOSDocumentMode modeDidBeginFromMode:forced:](&v36, "modeDidBeginFromMode:forced:", v6, v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "invalidateAllLayers");

  v8 = objc_loadWeakRetained((id *)&self->_icc);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSCVC"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasView"));
  v13 = objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v12);
  v14 = sub_100221D0C(v13, v6);
  v15 = (unint64_t *)objc_claimAutoreleasedReturnValue(v14);

  if (v15)
  {
    self->_previousCanvasScrollMinTouchCount = v15[3];
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "enclosingScrollView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "panGestureRecognizer"));

    self->_previousCanvasScrollMinTouchCount = (unint64_t)objc_msgSend(v17, "minimumNumberOfTouches");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingGestureRecognizer"));
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "allowedTouchTypes"));
  previousFreehandGestureTouchTypes = self->_previousFreehandGestureTouchTypes;
  self->_previousFreehandGestureTouchTypes = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repDragGestureRecognizer"));
  objc_msgSend(v21, "setAllowedTouchTypes:", &off_1012CAC78);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "singleTapGestureRecognizer"));
  objc_msgSend(v22, "setAllowedTouchTypes:", &off_1012CAC78);

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "doubleTapGestureRecognizer"));
    objc_msgSend(v23, "setAllowedTouchTypes:", &off_1012CAC90);

  }
  v24 = -[CRLiOSTapGestureRecognizer initWithTarget:action:]([CRLiOSTapGestureRecognizer alloc], "initWithTarget:action:", self, "p_editMenuTapReceived:");
  editMenuTapGR = self->_editMenuTapGR;
  self->_editMenuTapGR = &v24->super;

  -[UITapGestureRecognizer setName:](self->_editMenuTapGR, "setName:", CFSTR("freehand edit tap GR"));
  -[UITapGestureRecognizer setDelegate:](self->_editMenuTapGR, "setDelegate:", self);
  -[UITapGestureRecognizer setAllowedTouchTypes:](self->_editMenuTapGR, "setAllowedTouchTypes:", &off_1012CACA8);
  objc_msgSend(v11, "addGestureRecognizer:", self->_editMenuTapGR);
  -[CRLiOSDocumentModeFreehandDrawing p_updatePanAndDrawingGestureRecognizersForState](self, "p_updatePanAndDrawingGestureRecognizersForState");
  if (!v4)
    -[CRLiOSDocumentModeFreehandDrawing p_deselectAllInfosNotInDrawingsOrDrawings](self, "p_deselectAllInfosNotInDrawingsOrDrawings");
  v26 = objc_loadWeakRetained((id *)&self->_icc);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "freehandDrawingToolkit"));

  if (!v27)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D080);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E007C4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D0A0);
    v28 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeDidBeginFromMode:forced:]"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v29, v30, 363, 0, "invalid nil value for '%{public}s'", "toolkit");

  }
  v31 = objc_msgSend(v27, "isRulerToolShowing");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "pencilKitCanvasView"));
  objc_msgSend(v33, "setRulerActive:", v31);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing p_windowScene](self, "p_windowScene"));
  objc_msgSend(v34, "addObserver:selector:name:object:", self, "p_sceneWillDeactivate:", UISceneWillDeactivateNotification, v35);

}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _UNKNOWN **v54;
  void *v55;
  void *v56;
  void *v57;
  UITapGestureRecognizer *editMenuTapGR;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  objc_super v70;

  v69 = a4;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  -[CRLiOSDocumentModeFreehandDrawing p_removeObservationOfInteractiveCanvasController:](self, "p_removeObservationOfInteractiveCanvasController:", WeakRetained);

  v8 = objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v7);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
    goto LABEL_24;
  v9 = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

  objc_msgSend(v11, "hideEditMenu");
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pencilKitCanvasViewControllerForCanvasViewController:", v11));

  objc_msgSend(v13, "removeSmartSelectionViewIfNecessary");
  v14 = objc_loadWeakRetained((id *)&self->_icc);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "freehandDrawingToolkit"));

  if (!v15)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D0C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E008DC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D0E0);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillEndForMode:forced:]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 382, 0, "invalid nil value for '%{public}s'", "toolkit");

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentTool"));
  v20 = objc_msgSend(v19, "type");

  if ((objc_msgSend(v15, "isLassoAbleToSelectMixedType") & 1) != 0)
  {
    if (!v69)
    {
      v67 = v5;
      v21 = objc_loadWeakRetained((id *)&self->_icc);
      v22 = v21;
      if (v20 == (id)9)
      {
        v68 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "editorController"));
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "selectionPath"));

        v25 = objc_loadWeakRetained((id *)&self->_icc);
        v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "selectionModelTranslator"));

        v66 = (void *)v24;
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionPathRemovingCrossContainerSelectionsForSelectionPath:", v24));
        v29 = objc_msgSend(v27, "mostSpecificSelectionOfClass:", objc_opt_class(_TtC8Freeform17CRLGroupSelection, v28));
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = v27;
        v33 = v31;
        if (objc_msgSend(v30, "containsKindOfClass:", objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v32)))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "boardItems"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "selectionPathForInfos:", v34));

        }
        v35 = v30;
        v36 = objc_loadWeakRetained((id *)&self->_icc);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "editorController"));
        objc_msgSend(v37, "setSelectionPath:withFlags:", v33, 0x2000);

        v13 = v68;
        v38 = v66;
        goto LABEL_22;
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "canvasEditor"));
      v43 = v13;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "selectionPathWithInfos:", v44));

      v13 = v43;
      v38 = (void *)v45;

LABEL_21:
      v26 = objc_loadWeakRetained((id *)&self->_icc);
      v31 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "editorController"));
      objc_msgSend(v31, "setSelectionPath:withFlags:", v38, 0x2000);
LABEL_22:

      v5 = v67;
    }
  }
  else if (!v69)
  {
    v67 = v5;
    v39 = objc_loadWeakRetained((id *)&self->_icc);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "canvasEditor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "selectionPathWithInfos:", v41));

    goto LABEL_21;
  }

LABEL_24:
  v46 = objc_loadWeakRetained((id *)&self->_icc);
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "canvasView"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "enclosingScrollView"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "panGestureRecognizer"));

  objc_msgSend(v49, "setMinimumNumberOfTouches:", self->_previousCanvasScrollMinTouchCount);
  v50 = objc_loadWeakRetained((id *)&self->_icc);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layerHost"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "asiOSCVC"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "freehandDrawingGestureRecognizer"));
  objc_msgSend(v53, "setAllowedTouchTypes:", self->_previousFreehandGestureTouchTypes);
  if (-[CRLiOSDocumentMode shouldSelectAndScrollWithApplePencil](self, "shouldSelectAndScrollWithApplePencil"))
    v54 = &off_1012CACC0;
  else
    v54 = &off_1012CACD8;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "repDragGestureRecognizer"));
  objc_msgSend(v55, "setAllowedTouchTypes:", v54);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "singleTapGestureRecognizer"));
  objc_msgSend(v56, "setAllowedTouchTypes:", v54);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[UITapGestureRecognizer view](self->_editMenuTapGR, "view"));
  objc_msgSend(v57, "removeGestureRecognizer:", self->_editMenuTapGR);

  editMenuTapGR = self->_editMenuTapGR;
  self->_editMenuTapGR = 0;

  v59 = objc_loadWeakRetained((id *)&self->_icc);
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "freehandDrawingToolkit"));

  if (!v60)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D100);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00850();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D120);
    v61 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing modeWillEndForMode:forced:]"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v62, v63, 444, 0, "invalid nil value for '%{public}s'", "toolkit");

  }
  objc_msgSend(v60, "setRulerToolShowing:", 0);
  objc_msgSend(v60, "removeToolkitObserver:", self);
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing p_windowScene](self, "p_windowScene"));
  objc_msgSend(v64, "removeObserver:name:object:", self, UISceneWillDeactivateNotification, v65);

  v70.receiver = self;
  v70.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  -[CRLiOSDocumentMode modeWillEndForMode:forced:](&v70, "modeWillEndForMode:forced:", v5, v69);

}

- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  UIEditMenuInteraction *lassoSelectionEditMenuInteraction;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  objc_msgSend(WeakRetained, "invalidateAllLayers");

  if (self->_lassoSelectionEditMenuInteraction)
  {
    v8 = objc_loadWeakRetained((id *)&self->_icc);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canvasView"));
    objc_msgSend(v9, "removeInteraction:", self->_lassoSelectionEditMenuInteraction);

    lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
    self->_lassoSelectionEditMenuInteraction = 0;

  }
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v11 = objc_loadWeakRetained((id *)&self->_icc);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "asiOSCVC"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "doubleTapGestureRecognizer"));
    objc_msgSend(v14, "setAllowedTouchTypes:", &off_1012CACF0);

  }
  v15.receiver = self;
  v15.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  -[CRLiOSDocumentMode modeDidEndForMode:forced:](&v15, "modeDidEndForMode:forced:", v6, v4);

}

- (void)modeDidPresentBottomToolTray
{
  -[CRLiOSDocumentModeFreehandDrawing p_updatePanAndDrawingGestureRecognizersForState](self, "p_updatePanAndDrawingGestureRecognizersForState");
  self->_didFinishPresentingBottomToolTray = 1;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  BOOL v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentTool"));
  v6 = objc_msgSend(v5, "type") != (id)9;

  return v6;
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  UIBezierPath *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  unsigned int v27;
  uint64_t v28;
  objc_class *v29;
  id v30;
  void *v31;
  double v32;
  objc_class *v33;
  id v34;
  double v35;
  UIBezierPath *v36;
  void *v37;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentTool"));

  v8 = objc_msgSend(v7, "type");
  if ((unint64_t)v8 >= 7)
  {
    if (v8 != (id)8)
    {
      v22 = 0;
      goto LABEL_4;
    }
    v24 = objc_loadWeakRetained((id *)p_icc);
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "freehandDrawingToolkit"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "toolkitUIState"));
    v27 = objc_msgSend(v26, "eraserToolErasesWholeObjects");

    if (v27)
    {
      v29 = (objc_class *)objc_opt_class(CRLFreehandDrawingToolEraser, v28);
      v30 = sub_1002223BC(v29, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      objc_msgSend(v31, "currentScaledEraserDiameter");
    }
    else
    {
      v33 = (objc_class *)objc_opt_class(CRLFreehandDrawingToolPixelEraser, v28);
      v34 = sub_1002223BC(v33, v7);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v31, "scaledWidthForSlicingEraser");
    }
    v35 = v32;

    v36 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", sub_10005FD98(CGPointZero.x, CGPointZero.y, fmax(v35, 10.0)));
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v37));

    v20 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v20, "visibleBoundsRect");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v12));
  }
  else
  {
    v10 = (objc_class *)objc_opt_class(CRLFreehandDrawingToolStroke, v9);
    v11 = sub_1002223BC(v10, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v12, "unscaledWidth");
    v14 = v13;
    v15 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v15, "viewScale");
    v17 = v14 * v16;

    v18 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", sub_10005FD98(CGPointZero.x, CGPointZero.y, fmax(v17, 10.0)));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(+[UIPointerShape shapeWithPath:](UIPointerShape, "shapeWithPath:", v19));

    v21 = objc_loadWeakRetained((id *)p_icc);
    objc_msgSend(v21, "visibleBoundsRect");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCursor cursorWithShape:activeScaledRect:](CRLCursor, "cursorWithShape:activeScaledRect:", v20));

  }
LABEL_4:

  return v22;
}

- (BOOL)allowsFingerDrawing
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing toolTray](self, "toolTray"));
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D140);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E009F4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D160);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 532, 0, "invalid nil value for '%{public}s'", "toolTray");

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pencilMediator"));

  if (!v10)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D180);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00968();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D1A0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 534, 0, "invalid nil value for '%{public}s'", "pencilMediator");

  }
  if ((objc_msgSend(v3, "hidden") & 1) != 0)
    LOBYTE(v14) = 0;
  else
    v14 = objc_msgSend(v10, "prefersPencilOnlyDrawing") ^ 1;

  return v14;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 0;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBounds
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "freehandDrawingToolkit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTool"));
  v5 = objc_msgSend(v4, "type") != (id)9;

  return v5;
}

- (BOOL)currentlyDisplayingLassoSelectionMenu
{
  return self->_lassoSelectionEditMenuDisplayed;
}

- (void)presentEditMenuForLassoSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!+[CRLAccessibility isVoiceOverEnabled](CRLAccessibility, "isVoiceOverEnabled"))
  {
    if (self->_lassoSelectionEditMenuInteraction)
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layerHost"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "editorController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionPath"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editMenuConfigrationForSelectionPath:withConfigurationIdentifier:", v6, CFSTR("CRLFreehandDrawingModeLassoSelectionMenuIdentifier")));
      -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_lassoSelectionEditMenuInteraction, "presentEditMenuWithConfiguration:", v7);
      self->_lassoSelectionEditMenuDisplayed = 1;

    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123D1C0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E00A80();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123D1E0);
      v8 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing presentEditMenuForLassoSelection]"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 560, 0, "_lassoSelectionMenuInteraction should not be nil.");

    }
  }
}

- (void)hideEditMenuForLassoSelection
{
  UIEditMenuInteraction *lassoSelectionEditMenuInteraction;
  void *v4;
  void *v5;
  void *v6;

  lassoSelectionEditMenuInteraction = self->_lassoSelectionEditMenuInteraction;
  if (lassoSelectionEditMenuInteraction)
  {
    -[UIEditMenuInteraction dismissMenu](lassoSelectionEditMenuInteraction, "dismissMenu");
    self->_lassoSelectionEditMenuDisplayed = 0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D200);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00B00();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D220);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 576, 0, "_lassoSelectionMenuInteraction should not be nil.");

  }
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "freehandDrawingToolkit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentTool"));
  v5 = objc_msgSend(v4, "type");

  if (v5 != (id)9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController"));
    v8 = objc_msgSend(v6, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLFreehandDrawingEditor, v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "canvasEditor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "boardItems"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPathWithInfos:", v11));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "editorController"));
      objc_msgSend(v13, "setSelectionPath:", v12);

    }
    -[UIEditMenuInteraction dismissMenu](self->_lassoSelectionEditMenuInteraction, "dismissMenu");

  }
}

- (void)toolkitDidUpdateRulerVisibility
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));

  if (!v4)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D240);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00C0C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D260);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing toolkitDidUpdateRulerVisibility]"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 615, 0, "invalid nil value for '%{public}s'", "toolkit");

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pencilKitCanvasView"));

  if (!v9)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D280);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00B80();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D2A0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing toolkitDidUpdateRulerVisibility]"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v11, v12, 617, 0, "invalid nil value for '%{public}s'", "pkCanvasView");

  }
  v13 = objc_msgSend(v9, "isRulerActive");
  if (v13 != objc_msgSend(v4, "isRulerToolShowing"))
    objc_msgSend(v9, "setRulerActive:", objc_msgSend(v4, "isRulerToolShowing"));

}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 1;
}

- (BOOL)wantsToSuppressMediaReplacementKnobs
{
  return 1;
}

- (BOOL)isValidForEditorController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  __objc2_class **v9;
  id v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  id v25;
  char v26;
  BOOL v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "freehandDrawingToolkit"));
  v7 = objc_msgSend(v6, "isLassoAbleToSelectMixedType");

  v9 = off_1012297D8;
  if (!v7)
    v9 = off_1012298A0;
  v10 = objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", objc_opt_class(*v9, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = v11 != 0;

  if (v7)
  {
    v14 = objc_msgSend(v4, "mostSpecificCurrentEditorOfClass:", objc_opt_class(_TtC8Freeform11CRLWPEditor, v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
      v16 = 1;
    else
      v16 = v11 == 0;
    v12 = !v16;

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));
  v19 = objc_opt_class(_TtC8Freeform17CRLGroupSelection, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mostSpecificSelectionOfClass:", 0));
  v21 = sub_100221D0C(v19, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "infosForCurrentSelectionPath"));
  v25 = objc_msgSend(v24, "count");

  if (v22)
    v26 = 1;
  else
    v26 = v12;
  if (v25)
    v27 = v26;
  else
    v27 = 1;

  return v27;
}

- (void)prefersPencilOnlyDrawingDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentModeFreehandDrawing;
  -[CRLiOSDocumentMode prefersPencilOnlyDrawingDidChange](&v3, "prefersPencilOnlyDrawingDidChange");
  -[CRLiOSDocumentModeFreehandDrawing p_updatePanAndDrawingGestureRecognizersForState](self, "p_updatePanAndDrawingGestureRecognizersForState");
}

- (void)p_deselectAllInfosNotInDrawingsOrDrawings
{
  void *v3;
  id WeakRetained;
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
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id *location;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  location = (id *)&self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "infosForCurrentSelectionPath"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(_TtC8Freeform12CRLShapeItem, v7);
        v13 = sub_100221D0C(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        v16 = v14;
        if (v14
          && (v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "parentInfo")),
              v19 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v18),
              isKindOfClass = objc_opt_isKindOfClass(v17, v19),
              v17,
              (isKindOfClass & 1) != 0))
        {
          v21 = v3;
          v22 = v16;
        }
        else
        {
          v23 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v15);
          v24 = sub_100221D0C(v23, v11);
          v25 = (void *)objc_claimAutoreleasedReturnValue(v24);

          if (!v25)
            goto LABEL_12;
          v21 = v3;
          v22 = v11;
        }
        objc_msgSend(v21, "addObject:", v22, location);
LABEL_12:

      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v26 = objc_loadWeakRetained(location);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "canvasEditor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "selectionPathWithInfos:", v3));

  v29 = objc_loadWeakRetained(location);
  objc_msgSend(v29, "setSelectionPath:withSelectionFlags:", v28, 0);

}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y;
  double x;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  CRLFreehandDrawingToolMarqueeInput *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  BOOL v27;
  unsigned int v28;
  unsigned __int8 v29;
  uint64_t v30;
  id v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v51;

  y = a3.y;
  x = a3.x;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hitRep:", x, y));

  v12 = objc_opt_class(CRLFreehandDrawingToolMarquee, v11);
  v13 = objc_loadWeakRetained((id *)p_icc);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "freehandDrawingToolkit"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "currentTool"));
  v16 = sub_100221D0C(v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v19 = -[CRLFreehandDrawingToolMarqueeInput initWithUnscaledTapPoint:inputType:]([CRLFreehandDrawingToolMarqueeInput alloc], "initWithUnscaledTapPoint:inputType:", sub_10033831C(a4), x, y);
  if (v10)
  {
    v20 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "info"));
    v22 = sub_100221D0C(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "containingGroup"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layout"));
    if (objc_msgSend(v25, "isInGroup"))
    {
      v26 = objc_msgSend(v24, "isFreehandDrawing");

      if ((v26 & 1) != 0)
        goto LABEL_14;
    }
    else
    {

    }
    v29 = -[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing](self, "allowsFingerDrawing");
    if (a4 == 2 || (v29 & 1) != 0)
    {
      v31 = objc_loadWeakRetained((id *)p_icc);
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "freehandDrawingToolkit"));
      v33 = objc_msgSend(v32, "isLassoAbleToSelectMixedType");

      if (v17)
        v28 = v33;
      else
        v28 = 0;
      goto LABEL_26;
    }
    if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
    {
      if (v17)
      {
        if (objc_msgSend(v17, "handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:", v19))
        {
LABEL_14:
          v28 = 1;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        v34 = objc_opt_class(CRLFreehandDrawingRep, v30);
        v35 = sub_100221D0C(v34, v10);
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        v37 = v36;
        if (v36)
          v38 = objc_msgSend(v36, "handledDirectTouchForDrawingModePencilOnlyAtPoint:", x, y);
        else
          v38 = 0;

        if (v38)
          goto LABEL_14;
      }
    }
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "documentModeController"));
    objc_msgSend(v40, "resetToDefaultModeAnimated:", 1);

    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "repForSelecting"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "info"));

    if (v42 && objc_msgSend(v42, "isSelectable"))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "canvasEditor"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "selectionPathWithInfo:", v42));

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "editorController"));
      objc_msgSend(v46, "setSelectionPath:", v51);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "layerHost"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "asiOSCVC"));
      objc_msgSend(v49, "toggleDefaultEditUIForCurrentSelection");

    }
    v28 = 0;
    goto LABEL_26;
  }
  v27 = 0;
  if (!+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled")|| !v17)
  {
    goto LABEL_30;
  }
  v28 = objc_msgSend(v17, "handleMarqueeOrFingerTapOnMathResultStrokesInDrawingModeWithInput:", v19);
LABEL_27:
  v27 = 0;
  if (v28 && v17)
  {
    -[CRLiOSDocumentModeFreehandDrawing p_handleMarqueeTapWithInput:afterDelay:](self, "p_handleMarqueeTapWithInput:afterDelay:", v19, 0.3);
    v27 = 1;
  }
LABEL_30:

  return v27;
}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1, a3.x, a3.y);
  if (v4)
  {
    if (-[CRLiOSDocumentModeFreehandDrawing currentlyDisplayingLassoSelectionMenu](self, "currentlyDisplayingLassoSelectionMenu"))
    {
      -[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection](self, "hideEditMenuForLassoSelection");
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasEditor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionPathWithInfos:", v8));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "editorController"));
      objc_msgSend(v10, "setSelectionPath:", v9);

      -[CRLiOSDocumentModeFreehandDrawing presentEditMenuForLassoSelection](self, "presentEditMenuForLassoSelection");
    }
  }
  return v4;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  double y;
  double x;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  unsigned int v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  unsigned __int8 v31;
  int v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  CGPoint v53;
  CGRect v54;

  y = a3.y;
  x = a3.x;
  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
    return 0;
  v8 = objc_opt_class(CRLFreehandDrawingToolMarquee, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTool"));
  v12 = sub_100221D0C(v8, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
    objc_msgSend(v13, "cancelCommitSelectionForHandlingMarqueeTapForSmartSelection");
  v52 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "interactiveCanvasController"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "layerHost"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "asiOSCVC"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "delegate"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "pencilKitCanvasViewControllerForCanvasViewController:", v17));

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hitRep:", x, y));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "repForSelecting"));

  v23 = objc_opt_class(CRLShapeRep, v22);
  v24 = sub_100221D0C(v23, v21);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "shapeInfo"));
  v25 = objc_msgSend(v50, "isFreehandDrawingShape");
  v26 = objc_loadWeakRetained((id *)&self->_icc);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "freehandDrawingToolkit"));

  v49 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "currentTool"));
  v29 = objc_msgSend(v28, "type");

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "freehandDrawingToolkit"));
  v31 = objc_msgSend(v30, "isLassoAbleToSelectMixedType");

  if (v21)
    v32 = v25;
  else
    v32 = 1;
  if (v29 != (id)9)
    v32 = 1;
  if (v32)
    v33 = v25;
  else
    v33 = v31 ^ 1 | v25;
  if (-[CRLiOSDocumentModeFreehandDrawing currentlyDisplayingLassoSelectionMenu](self, "currentlyDisplayingLassoSelectionMenu"))
  {
    -[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection](self, "hideEditMenuForLassoSelection");
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "unscaledCoordinateSpace"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "canvasView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "window"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "coordinateSpace"));
  objc_msgSend(v35, "convertPoint:toCoordinateSpace:", v38, x, y);
  v40 = v39;
  v42 = v41;

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "smartSelectionManager"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "smartSelectionView"));
  objc_msgSend(v44, "frame");
  objc_msgSend(v15, "convertBoundsToUnscaledRect:");
  v53.x = x;
  v53.y = y;
  v45 = CGRectContainsPoint(v54, v53);

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "smartSelectionView"));
  if (v46 && v43 && v45)
  {
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "smartSelectionView"));
    objc_msgSend(v43, "handleDoubleTapInputAtUnscaledPoint:inSelectionView:", v47, v40, v42);

  }
  else
  {
    objc_msgSend(v43, "handleDoubleTapInputAtUnscaledPoint:", v40, v42);
  }

  return v33;
}

- (void)pencilKitDidSmartSelectStrokesInDrawingShapeItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interactiveCanvasController"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canvasEditor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPathWithInfos:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "editorController"));
  objc_msgSend(v9, "setSelectionPath:", v8);

  if (-[CRLiOSDocumentModeFreehandDrawing currentlyDisplayingLassoSelectionMenu](self, "currentlyDisplayingLassoSelectionMenu"))
  {
    -[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection](self, "hideEditMenuForLassoSelection");
  }
  else
  {
    -[CRLiOSDocumentModeFreehandDrawing presentEditMenuForLassoSelection](self, "presentEditMenuForLassoSelection");
  }

}

- (void)p_editMenuTapReceived:(id)a3
{
  id v4;
  CRLInteractiveCanvasController **p_icc;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v4 = a3;
  p_icc = &self->_icc;
  v6 = objc_loadWeakRetained((id *)&self->_icc);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "canvasView"));
  objc_msgSend(v4, "locationInView:", v7);
  objc_msgSend(v6, "convertBoundsToUnscaledPoint:");
  v9 = v8;
  v11 = v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "asiOSCVC"));

  objc_msgSend(v14, "setLastTapPoint:", v9, v11);
  if (+[CRLFeatureFlagGroup isMathPaperEnabled](_TtC8Freeform19CRLFeatureFlagGroup, "isMathPaperEnabled"))
  {
    v15 = objc_loadWeakRetained((id *)&self->_icc);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "freehandDrawingToolkit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentTool"));
    if (objc_msgSend(v17, "type") == (id)9)
    {

    }
    else
    {
      v18 = -[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing](self, "allowsFingerDrawing");

      if ((v18 & 1) == 0)
      {
        v34 = 0u;
        v35 = 0u;
        v32 = 0u;
        v33 = 0u;
        v19 = objc_loadWeakRetained((id *)p_icc);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "canvas", 0));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topLevelReps"));

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v22)
        {
          v24 = v22;
          v25 = *(_QWORD *)v33;
          while (2)
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v33 != v25)
                objc_enumerationMutation(v21);
              v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v26);
              v28 = objc_opt_class(CRLFreehandDrawingRep, v23);
              v29 = sub_100221D0C(v28, v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
              v31 = v30;
              if (v30 && objc_msgSend(v30, "handledDirectTouchForDrawingModePencilOnlyAtPoint:", v9, v11))
              {

                goto LABEL_16;
              }

              v26 = (char *)v26 + 1;
            }
            while (v24 != v26);
            v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
            if (v24)
              continue;
            break;
          }
        }

      }
    }
  }
  objc_msgSend(v14, "toggleEditMenuForCurrentSelection");
LABEL_16:

}

- (void)p_updatePanAndDrawingGestureRecognizersForState
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  unint64_t previousCanvasScrollMinTouchCount;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "canvasView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "enclosingScrollView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "panGestureRecognizer"));

  v8 = objc_loadWeakRetained((id *)p_icc);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layerHost"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "asiOSCVC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "freehandDrawingGestureRecognizer"));

  if (-[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing](self, "allowsFingerDrawing"))
  {
    v12 = &off_1012CAD08;
    previousCanvasScrollMinTouchCount = 2;
  }
  else
  {
    previousCanvasScrollMinTouchCount = self->_previousCanvasScrollMinTouchCount;
    v12 = &off_1012CAD20;
  }
  objc_msgSend(v7, "setMinimumNumberOfTouches:", previousCanvasScrollMinTouchCount);
  objc_msgSend(v11, "setAllowedTouchTypes:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allowedTouchTypes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "arrayByAddingObject:", &off_1012CBBA8));
  objc_msgSend(v11, "setAllowedTouchTypes:", v15);

  if (!self->_editMenuTapGR)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D2C0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00C98();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D2E0);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_updatePanAndDrawingGestureRecognizersForState]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 857, 0, "invalid nil value for '%{public}s'", "_editMenuTapGR");

  }
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_editMenuTapGR, "setNumberOfTouchesRequired:", objc_msgSend(v7, "minimumNumberOfTouches"));

}

- (id)p_sortedMenuElementsFromMenuElements:(id)a3 withMenuType:(unint64_t)a4
{
  id v5;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v8;
  id v9;
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
  id v23;
  uint64_t v24;
  id v25;
  void *i;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void *j;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  __CFString *v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *k;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  void *v85;
  __CFString *v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  char v102;
  void *v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  uint64_t v108;
  id v109;
  void *v110;
  id v111;
  id v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  void *v118;
  id v119;
  id *location;
  id *locationa;
  void *v123;
  void *v124;
  void *v125;
  CRLiOSDocumentModeFreehandDrawing *v126;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  void *v148;
  id obj;
  id v150;
  uint64_t v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  void *v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];

  v5 = a3;
  v126 = self;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));
  location = (id *)p_icc;
  v9 = objc_loadWeakRetained((id *)p_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "editorController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "selectionPath"));
  v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "boardItemsForSelectionPath:", v11));

  v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Edit"), 0, 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("paintbrush")));
  v138 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v14, v15, "showMiniFormatterToExitDrawingMode:", 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("Select All"), 0, 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("square.dashed")));
  v137 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v17, v18));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("Merge"), 0, 0));
  v125 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v20, 0, "mergeDrawings:", 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Group"), 0, 0));
  v124 = (void *)objc_claimAutoreleasedReturnValue(+[UICommand commandWithTitle:image:action:propertyList:](UICommand, "commandWithTitle:image:action:propertyList:", v22, 0, "group:", 0));

  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
  if (!v23)
  {
    v147 = 0;
    goto LABEL_25;
  }
  v25 = v23;
  v147 = 0;
  v151 = *(_QWORD *)v170;
  do
  {
    for (i = 0; i != v25; i = (char *)i + 1)
    {
      if (*(_QWORD *)v170 != v151)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)i);
      v28 = objc_opt_class(UIMenu, v24);
      v29 = sub_100221D0C(v28, v27);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v32 = v30;
      if (!v30)
      {
        v45 = objc_opt_class(UICommand, v31);
        v46 = sub_100221D0C(v45, v27);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (v44)
          objc_msgSend(v12, "addObject:", v44, location);
        goto LABEL_20;
      }
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "children"));
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v177, 16);
      if (v34)
      {
        v36 = v34;
        v37 = *(_QWORD *)v166;
        do
        {
          for (j = 0; j != v36; j = (char *)j + 1)
          {
            if (*(_QWORD *)v166 != v37)
              objc_enumerationMutation(v33);
            v39 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)j);
            v40 = objc_opt_class(UICommand, v35);
            v41 = sub_100221D0C(v40, v39);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
            if (v42)
              objc_msgSend(v12, "addObject:", v42);

          }
          v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v165, v177, 16);
        }
        while (v36);
      }

      v43 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
      if (v43 == CFSTR("CRLCutCopyPasteMenuIdentifier"))
      {
        v44 = v147;
        v147 = v32;
LABEL_20:

      }
    }
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v178, 16);
  }
  while (v25);
LABEL_25:

  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v150 = v12;
  v47 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v161, v176, 16);
  if (!v47)
  {
    v129 = 0;
    v130 = 0;
    v49 = 0;
    v131 = 0;
    v132 = 0;
    v133 = 0;
    v134 = 0;
    v136 = 0;
    v139 = 0;
    v135 = 0;
    v140 = 0;
    v143 = 0;
    v145 = 0;
    v148 = 0;
    v152 = 0;
    goto LABEL_66;
  }
  v48 = v47;
  v129 = 0;
  v130 = 0;
  v49 = 0;
  v131 = 0;
  v132 = 0;
  v133 = 0;
  v134 = 0;
  v136 = 0;
  v139 = 0;
  v135 = 0;
  v140 = 0;
  v143 = 0;
  v145 = 0;
  v148 = 0;
  v152 = 0;
  v50 = *(_QWORD *)v162;
  while (2)
  {
    v51 = 0;
    while (2)
    {
      if (*(_QWORD *)v162 != v50)
        objc_enumerationMutation(v150);
      v52 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * v51);
      if (objc_msgSend(v52, "action", location) == "cut:")
      {
        v53 = v152;
        v54 = v49;
        v152 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "copy:")
      {
        v53 = v148;
        v54 = v49;
        v148 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "paste:")
      {
        v53 = v145;
        v54 = v49;
        v145 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "duplicate:")
      {
        v53 = v143;
        v54 = v49;
        v143 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "delete:")
      {
        v53 = v140;
        v54 = v49;
        v140 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "lock:")
      {
        v53 = v139;
        v54 = v49;
        v139 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "unlock:")
      {
        v53 = v136;
        v54 = v49;
        v136 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "transform:")
      {
        v53 = v135;
        v54 = v49;
        v135 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "separate:")
      {
        v53 = v134;
        v54 = v49;
        v134 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "snapToShape:")
      {
        v53 = v133;
        v54 = v49;
        v133 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "straighten:")
      {
        v53 = v132;
        v54 = v49;
        v132 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "copyAsText:")
      {
        v53 = v131;
        v54 = v49;
        v131 = v52;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "translateHandwrittenText:")
      {
        v53 = v130;
        v130 = v52;
LABEL_60:
        v54 = v49;
        goto LABEL_61;
      }
      if (objc_msgSend(v52, "action") == "connectWithConnectionLine:")
      {
        v53 = v129;
        v129 = v52;
        goto LABEL_60;
      }
      v53 = v49;
      v54 = v52;
      if (objc_msgSend(v52, "action") == "editAccessibilityDescription:")
      {
LABEL_61:
        v55 = v52;

        v49 = v54;
      }
      if (v48 != (id)++v51)
        continue;
      break;
    }
    v48 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v161, v176, 16);
    if (v48)
      continue;
    break;
  }
LABEL_66:

  v56 = -[CRLiOSDocumentModeFreehandDrawing p_currentLassoSelectionType](v126, "p_currentLassoSelectionType");
  v57 = -[CRLiOSDocumentModeFreehandDrawing p_currentLockedInfosCount](v126, "p_currentLockedInfosCount");
  v58 = v57;
  v60 = a4;
  v59 = v128;
  v61 = v125;
  v62 = v147;
  if (v56 != (id)2)
  {
LABEL_100:
    v96 = v123;
    if (v58 < (unint64_t)objc_msgSend(v123, "count", location) && v56 != (id)3)
    {
      objc_msgSend(v59, "crl_addNonNilObject:", v152);
      objc_msgSend(v59, "crl_addNonNilObject:", v148);
    }
    objc_msgSend(v59, "crl_addNonNilObject:", v145);
    if (!v60 && (v101 = v140, v56 != (id)3) || v56 == (id)2 && v60 == 1 && (v101 = v138, v58))
    {
      objc_msgSend(v59, "crl_addNonNilObject:", v101);
    }
    else if (v56 == (id)3)
    {
      objc_msgSend(v59, "crl_addNonNilObject:", v137);
      if (!v58 || v60)
      {
        if (v60 == 1)
        {
          if (v58)
            v103 = v136;
          else
            v103 = v139;
          objc_msgSend(v59, "crl_addNonNilObject:", v103);
          goto LABEL_130;
        }
      }
      else
      {
        objc_msgSend(v59, "crl_addNonNilObject:", v136);
      }
      v104 = v140;
      if (!v60)
      {
LABEL_158:
        objc_msgSend(v59, "crl_addNonNilObject:", v104);
LABEL_159:
        v146 = v59;
        goto LABEL_160;
      }
LABEL_130:
      v102 = 1;
      if (v60 != 1)
        goto LABEL_132;
      goto LABEL_131;
    }
    if (v56 == (id)2 && v58)
    {
      if (v58 < (unint64_t)objc_msgSend(v123, "count"))
        objc_msgSend(v59, "crl_addNonNilObject:", v139);
      objc_msgSend(v59, "crl_addNonNilObject:", v136);
    }
    objc_msgSend(v59, "crl_addNonNilObject:", v137);
    if (v56 == (id)2 && v60 == 1 && v58)
    {
      if (v58 < (unint64_t)objc_msgSend(v123, "count"))
        objc_msgSend(v59, "crl_addNonNilObject:", v129);
      v102 = 0;
LABEL_131:
      objc_msgSend(v59, "crl_addNonNilObject:", v140);
LABEL_132:
      if (v56 == (id)1)
      {
        objc_msgSend(v59, "crl_addNonNilObject:", v135);
        objc_msgSend(v59, "crl_addNonNilObject:", v143);
        v105 = objc_loadWeakRetained(locationa);
        v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "canvasEditor"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "editorController"));
        v109 = objc_msgSend(v107, "mostSpecificCurrentEditorOfClass:", objc_opt_class(CRLFreehandDrawingEditor, v108));
        v110 = (void *)objc_claimAutoreleasedReturnValue(v109);

        v59 = v128;
        if (v133
          && objc_msgSend(v110, "canPerformEditorAction:withSender:", objc_msgSend(v133, "action"), 0) == (id)1)
        {
          objc_msgSend(v128, "crl_addNonNilObject:", v133);
        }
        if (v125)
        {
          v111 = objc_msgSend(v110, "canPerformEditorAction:withSender:", objc_msgSend(v125, "action"), 0);
          if (!a4 && v111 == (id)1)
            objc_msgSend(v128, "crl_addNonNilObject:", v125);
        }
        if (v134)
        {
          v112 = objc_msgSend(v110, "canPerformEditorAction:withSender:", objc_msgSend(v134, "action"), 0);
          if (!a4 && v112 == (id)1)
            objc_msgSend(v128, "crl_addNonNilObject:", v134);
        }
        if (-[CRLiOSDocumentModeFreehandDrawing p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath](v126, "p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath"))
        {
          objc_msgSend(v128, "crl_addNonNilObject:", v131);
          objc_msgSend(v128, "crl_addNonNilObject:", v130);
          objc_msgSend(v128, "crl_addNonNilObject:", v132);
        }

LABEL_156:
        if ((v102 & 1) != 0)
          goto LABEL_159;
        v119 = objc_msgSend(v123, "count");
        v104 = v49;
        if ((id)v58 != v119)
          goto LABEL_159;
        goto LABEL_158;
      }
      if (v56 == (id)2)
      {
        if ((unint64_t)objc_msgSend(v123, "count") >= 2)
        {
          v113 = objc_loadWeakRetained(locationa);
          v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "canvasEditor"));
          v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "canvasEditorHelper"));
          v116 = objc_msgSend(v115, "canvasEditorCanPerformGroupActionWithSender:", 0);

          v59 = v128;
          if (v116 != (id)1 || v58)
            goto LABEL_156;
          v117 = v128;
          v118 = v124;
LABEL_155:
          objc_msgSend(v117, "crl_addNonNilObject:", v118);
          goto LABEL_156;
        }
      }
      else if (v56 == (id)3)
      {
        goto LABEL_156;
      }
      v117 = v59;
      v118 = v143;
      goto LABEL_155;
    }
    goto LABEL_130;
  }
  if (a4 != 1 || v57 || !v147)
  {
    if (!a4)
    {
      v97 = objc_loadWeakRetained(location);
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "canvasEditor"));
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "canvasEditorHelper"));
      v100 = objc_msgSend(v99, "canvasEditorCanPerformShowMiniFormatterToExitDrawingModeActionWithSender:", 0);

      v60 = 0;
      v59 = v128;
      if (v100 == (id)1)
        objc_msgSend(v128, "crl_addNonNilObject:", v138);
    }
    goto LABEL_100;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "children"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  v160 = 0u;
  v144 = v63;
  v65 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v158;
    do
    {
      for (k = 0; k != v66; k = (char *)k + 1)
      {
        if (*(_QWORD *)v158 != v67)
          objc_enumerationMutation(v144);
        v69 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v64, "addObject:", v69, location);
        v71 = objc_opt_class(UICommand, v70);
        v72 = sub_100221D0C(v71, v69);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v74 = v73;
        if (v73 && objc_msgSend(v73, "action") == "paste:")
          objc_msgSend(v64, "addObject:", v138);

      }
      v66 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
    }
    while (v66);
  }
  v141 = v64;

  v146 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v153 = 0u;
  v154 = 0u;
  v155 = 0u;
  v156 = 0u;
  v142 = obj;
  v75 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
  if (v75)
  {
    v77 = v75;
    v78 = *(_QWORD *)v154;
    do
    {
      v79 = 0;
      do
      {
        if (*(_QWORD *)v154 != v78)
          objc_enumerationMutation(v142);
        v80 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)v79);
        v81 = objc_opt_class(UIMenu, v76);
        v82 = sub_100221D0C(v81, v80);
        v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
        v85 = v83;
        if (v83)
        {
          v86 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "identifier"));

          if (v86 == CFSTR("CRLCutCopyPasteMenuIdentifier"))
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, CFSTR("CRLCutCopyPasteMenuIdentifier"), 1, v141));
            v91 = v146;
            v92 = v90;
            goto LABEL_91;
          }
        }
        v87 = objc_opt_class(UICommand, v84);
        v88 = sub_100221D0C(v87, v80);
        v89 = (void *)objc_claimAutoreleasedReturnValue(v88);
        v90 = v89;
        if (!v89 || objc_msgSend(v89, "action") != "selectAll:")
        {
          v91 = v146;
          v92 = v80;
LABEL_91:
          objc_msgSend(v91, "addObject:", v92, location);
          goto LABEL_92;
        }
        v173 = v137;
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v173, 1));
        v94 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1012A72B0, 0, 0, 1, v93));

        objc_msgSend(v146, "addObject:", v94);
LABEL_92:

        v79 = (char *)v79 + 1;
      }
      while (v77 != v79);
      v95 = objc_msgSend(v142, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
      v77 = v95;
    }
    while (v95);
  }

  v96 = v123;
  v59 = v128;
  v61 = v125;
  v62 = v147;
LABEL_160:

  return v146;
}

- (id)p_menuElementsToDisplayForLassoSelectionAtPoint:(CGPoint)a3 menuType:(unint64_t)a4
{
  double y;
  double x;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  y = a3.y;
  x = a3.x;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController", 0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentEditors"));

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v16, "addContextualMenuElementsToArray:atPoint:") & 1) != 0)
          objc_msgSend(v16, "addContextualMenuElementsToArray:atPoint:", v8, x, y);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v8, "copy");
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing p_sortedMenuElementsFromMenuElements:withMenuType:](self, "p_sortedMenuElementsFromMenuElements:withMenuType:", v17, a4));

  return v18;
}

- (unint64_t)p_currentLassoSelectionType
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;
  char v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char isKindOfClass;
  uint64_t v21;
  unint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));
  v5 = objc_loadWeakRetained((id *)p_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "boardItemsForSelectionPath:", v7));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v12 = v10;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v9);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v18 = objc_opt_class(_TtC8Freeform22CRLFreehandDrawingItem, v11);
        if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
        {
          v14 = 1;
        }
        else
        {
          v19 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v11);
          isKindOfClass = objc_opt_isKindOfClass(v17, v19);
          v13 |= isKindOfClass ^ 1;
          v14 |= isKindOfClass;
        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }

  v21 = 2;
  if (v14 & 1 | ((v13 & 1) == 0))
    v21 = 3;
  if (v13 & 1 | ((v14 & 1) == 0))
    v22 = v21;
  else
    v22 = 1;

  return v22;
}

- (unint64_t)p_currentLockedInfosCount
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BYTE *v19;
  unint64_t v20;

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "editorController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectionPath"));

  v6 = objc_loadWeakRetained((id *)p_icc);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionModelTranslator"));
  v8 = objc_loadWeakRetained((id *)p_icc);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "editorController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectionPath"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boardItemsForSelectionPath:", v10));

  v12 = objc_loadWeakRetained((id *)p_icc);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "selectionModelTranslator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unlockedBoardItemsForSelectionPath:", v5));

  v15 = objc_msgSend(v11, "count");
  if (v15 < objc_msgSend(v14, "count"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D300);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00D24();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D320);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_currentLockedInfosCount]"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1164, 0, "unlockedItems should not have more items than selectedItems.");

  }
  v19 = objc_msgSend(v11, "count");
  v20 = v19 - (_BYTE *)objc_msgSend(v14, "count");

  return v20;
}

- (BOOL)p_shouldPresentHandwritingIntelligenceActionsForCurrentSelectionPath
{
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  char v23;
  int v24;
  uint64_t v25;
  void *j;
  void *v27;
  unsigned int v28;
  int v29;
  uint64_t v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "selectionModelTranslator"));
  v5 = objc_loadWeakRetained((id *)p_icc);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectionPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "boardItemsForSelectionPath:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v17 = objc_opt_class(_TtC8Freeform27CRLFreehandDrawingShapeItem, v12);
        v18 = sub_100221D0C(v17, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (v19)
          objc_msgSend(v9, "addObject:", v19);

      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v9, "count"))
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = 0;
      v25 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
          if ((objc_msgSend(v27, "isTreatedAsFillForFreehandDrawing", (_QWORD)v32) & ((v23 & 1) == 0)) != 0)
            v23 = 1;
          v28 = objc_msgSend(v27, "isTreatedAsFillForFreehandDrawing");
          if ((v24 & 1) != 0)
            v29 = v24;
          else
            v29 = 1;
          if (!v28)
            v24 = v29;
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
      v30 = (((v23 & 1) == 0) | v24);
    }
    else
    {
      LOBYTE(v30) = 1;
    }

  }
  else
  {
    LOBYTE(v30) = 0;
  }

  return v30 & 1;
}

- (void)p_handleMarqueeTapWithInput:(id)a3 afterDelay:(double)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  v8 = objc_opt_class(CRLFreehandDrawingToolMarquee, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "freehandDrawingToolkit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentTool"));
  v12 = sub_100221D0C(v8, v11);
  v13 = (id)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "performSelector:withObject:afterDelay:", "handleMarqueeTapWithInput:", v6, a4);
}

- (void)p_sceneWillDeactivate:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionManager"));
    if (objc_msgSend(v6, "hasSmartSelectedDrawingShapeItems"))
      -[CRLiOSDocumentModeFreehandDrawing hideEditMenuForLassoSelection](self, "hideEditMenuForLassoSelection");

  }
}

- (id)p_windowScene
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "asiOSCVC"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  if (!v7)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D340);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E00DA4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123D360);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing p_windowScene]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 1226, 0, "invalid nil value for '%{public}s'", "windowScene");

  }
  return v7;
}

- (void)beginDrawingTransformMode
{
  CRLiOSDocumentModeFreehandDrawingTransform *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  CRLiOSDocumentModeFreehandDrawingTransform *v8;

  v3 = [CRLiOSDocumentModeFreehandDrawingTransform alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v8 = -[CRLiOSDocumentModeFreehandDrawingTransform initWithBoardViewController:andInteractiveCanvasController:](v3, "initWithBoardViewController:andInteractiveCanvasController:", v4, WeakRetained);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "documentModeController"));
  objc_msgSend(v7, "setMode:animated:", v8, 0);

}

- (id)toolTray
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sharedPencilTray"));

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  CRLiOSDocumentModeFreehandDrawing *v5;
  CRLInteractiveCanvasController **p_icc;
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v5 = self;
  p_icc = &self->_icc;
  v7 = a4;
  v8 = a3;
  v9 = objc_loadWeakRetained((id *)p_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "canvasView"));
  objc_msgSend(v7, "locationInView:", v10);
  objc_msgSend(v9, "convertBoundsToUnscaledPoint:");
  v12 = v11;
  v14 = v13;

  v15 = objc_msgSend(v7, "type");
  LOBYTE(v5) = -[CRLiOSDocumentModeFreehandDrawing p_gestureRecognizer:shouldReceiveTouchAtLocation:touchType:](v5, "p_gestureRecognizer:shouldReceiveTouchAtLocation:touchType:", v8, v15, v12, v14);

  return (char)v5;
}

- (BOOL)p_gestureRecognizer:(id)a3 shouldReceiveTouchAtLocation:(CGPoint)a4 touchType:(int64_t)a5
{
  double y;
  double x;
  UITapGestureRecognizer *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;

  y = a4.y;
  x = a4.x;
  v9 = (UITapGestureRecognizer *)a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "asiOSCVC"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "delegate"));
  v15 = objc_opt_class(UIViewController, v14);
  v16 = sub_100221D0C(v15, v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "presentedViewController"));

  if (v18)
    goto LABEL_2;
  if (self->_editMenuTapGR != v9)
    goto LABEL_4;
  v21 = objc_loadWeakRetained((id *)&self->_icc);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "freehandDrawingToolkit"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentTool"));
  v39 = objc_msgSend(v23, "type");

  if (v39 == (id)9)
  {
LABEL_2:
    v19 = 0;
    goto LABEL_5;
  }
  if (a5 || -[CRLiOSDocumentModeFreehandDrawing allowsFingerDrawing](self, "allowsFingerDrawing"))
  {
LABEL_4:
    v19 = 1;
    goto LABEL_5;
  }
  v24 = objc_loadWeakRetained((id *)&self->_icc);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "hitRep:", x, y));

  if (v25)
  {
    v27 = objc_opt_class(_TtC8Freeform12CRLBoardItem, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "info"));
    v29 = sub_100221D0C(v27, v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);

    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "containingGroup"));
    if ((objc_msgSend(v31, "isFreehandDrawing") & 1) != 0
      || (v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "repForSelecting")), v32, !v32))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "parentRep"));

      if (v33)
      {
        v35 = objc_opt_class(CRLFreehandDrawingRep, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "parentRep"));
        v37 = sub_100221D0C(v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

      }
      v19 = 1;
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }

LABEL_5:
  return v19;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v6 = a4;
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

  if (v7 == CFSTR("CRLFreehandDrawingModeLassoSelectionMenuIdentifier"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
    objc_msgSend(v6, "sourcePoint");
    objc_msgSend(WeakRetained, "convertBoundsToUnscaledPoint:");
    v15 = v14;
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:](self, "p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:", 0, v15, v17));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1012A72B0, v18));

  }
  else
  {
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

    if (v8 != CFSTR("CRLFreehandDrawingModeLassoSelectionMenuIdentifier"))
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123D380);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E00E30();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123D3A0);
      v9 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawing editMenuInteraction:menuForConfiguration:suggestedActions:]"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawing.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v10, v11, 1290, 0, "Freehand drawing mode should only accept CRLFreehandDrawingModeLassoSelectionEditMenuIdentifier now for lasso selection feature.");

    }
    v12 = 0;
  }

  return v12;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillUndo](NSNotification, "CRLCommandControllerWillUndo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "p_commandControllerWillUndoOrRedo:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillRedo](NSNotification, "CRLCommandControllerWillRedo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "p_commandControllerWillUndoOrRedo:", v9, v11);

}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3, a4, a5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillRedo](NSNotification, "CRLCommandControllerWillRedo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "commandController"));
  objc_msgSend(v12, "removeObserver:name:object:", self, v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotification CRLCommandControllerWillUndo](NSNotification, "CRLCommandControllerWillUndo"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commandController"));
  objc_msgSend(v12, "removeObserver:name:object:", self, v9, v11);

}

- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5
{
  double y;
  double x;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v12[5];

  y = a4.y;
  x = a4.x;
  if (objc_msgSend(a3, "menuAppearance") == (id)1)
  {
    v8 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:](self, "p_menuElementsToDisplayForLassoSelectionAtPoint:menuType:", 1, x, y));
    if (objc_msgSend(v9, "count"))
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100163F6C;
      v12[3] = &unk_10123D3C8;
      v12[4] = v9;
      v10 = objc_retainBlock(v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextMenuConfiguration configurationWithIdentifier:previewProvider:actionProvider:](UIContextMenuConfiguration, "configurationWithIdentifier:previewProvider:actionProvider:", CFSTR("CRLFreehandDrawingModeLassoSelectionMenuIdentifier"), 0, v10));

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
    goto LABEL_5;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingGestureRecognizer"));
  if (v12 != v6)
    goto LABEL_3;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "doubleTapGestureRecognizer"));

  if (v13 != v7)
    goto LABEL_5;
  v16 = objc_loadWeakRetained((id *)p_icc);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "freehandDrawingToolkit"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pencilMediator"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentTool"));
  v19 = objc_msgSend(v18, "type");

  if (v19 == (id)9 || (objc_msgSend(v17, "prefersPencilOnlyDrawing") & 1) == 0)
  {

LABEL_3:
    goto LABEL_5;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingGestureRecognizer"));
  v21 = objc_msgSend(v20, "inputType");

  if (v21 == (id)1)
  {
    v14 = 1;
    goto LABEL_6;
  }
LABEL_5:
  v14 = 0;
LABEL_6:

  return v14;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  CRLInteractiveCanvasController **p_icc;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  p_icc = &self->_icc;
  WeakRetained = objc_loadWeakRetained((id *)&self->_icc);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layerHost"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "asiOSCVC"));

  if (!+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
    goto LABEL_12;
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingGestureRecognizer"));
  if (v12 == v6)
  {
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "doubleTapGestureRecognizer"));
    if (WeakRetained == v7)
    {

      goto LABEL_13;
    }
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "doubleTapGestureRecognizer"));
  if (v13 != v6)
  {

    v14 = 0;
    v15 = 0;
    v16 = v6;
    if (v12 != v6)
    {
LABEL_15:

      goto LABEL_16;
    }
LABEL_14:

    v12 = v16;
    v15 = v14;
    goto LABEL_15;
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "freehandDrawingGestureRecognizer"));

  if (v12 == v6)
  {

  }
  else
  {

  }
  if (v17 == v7)
  {
LABEL_13:
    v18 = objc_loadWeakRetained((id *)p_icc);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "freehandDrawingToolkit"));

    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentTool"));
    v14 = objc_msgSend(WeakRetained, "type") == (id)9;
    goto LABEL_14;
  }
LABEL_12:
  v15 = 0;
LABEL_16:

  return v15;
}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_icc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icc);
  objc_storeStrong((id *)&self->_lassoSelectionEditMenuInteraction, 0);
  objc_storeStrong((id *)&self->_editMenuTapGR, 0);
  objc_storeStrong((id *)&self->_previousFreehandGestureTouchTypes, 0);
}

@end
