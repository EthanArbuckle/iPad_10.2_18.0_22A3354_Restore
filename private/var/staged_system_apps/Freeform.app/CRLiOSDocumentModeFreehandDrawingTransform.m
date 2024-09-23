@implementation CRLiOSDocumentModeFreehandDrawingTransform

- (CRLiOSDocumentModeFreehandDrawingTransform)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  return -[CRLiOSDocumentModeFreehandDrawing initWithBoardViewController:andInteractiveCanvasController:](&v5, "initWithBoardViewController:andInteractiveCanvasController:", a3, a4);
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v4 = a4;
  v6 = a3;
  objc_opt_class(CRLiOSDocumentModeFreehandDrawing, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012484A8);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E129CC(v9, v10);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012484C8);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentModeFreehandDrawingTransform modeWillBeginFromMode:forced:]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentModeFreehandDrawingTransform.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 23, 0, "Transform mode is a submode of freehand drawing mode and can only transition from a freehand drawing mode");

  }
  v14.receiver = self;
  v14.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  -[CRLiOSDocumentModeFreehandDrawing modeWillBeginFromMode:forced:](&v14, "modeWillBeginFromMode:forced:", v6, v4);

}

- (void)modeDidBeginFromMode:(id)a3 forced:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  -[CRLiOSDocumentModeFreehandDrawing modeDidBeginFromMode:forced:](&v9, "modeDidBeginFromMode:forced:", a3, a4);
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionManager"));
    objc_msgSend(v8, "beginSuppressingSmartSelection");

  }
}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  -[CRLiOSDocumentModeFreehandDrawing modeWillEndForMode:forced:](&v9, "modeWillEndForMode:forced:", a3, a4);
  if (+[CRLFeatureFlagsHelper isOSFeatureEnabled:](CRLFeatureFlagsHelper, "isOSFeatureEnabled:", 1))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "smartSelectionManager"));
    objc_msgSend(v8, "endSuppressingSmartSelection");

  }
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layerHost"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "asiOSCVC"));

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  if (-[CRLiOSDocumentModeFreehandDrawing allowGestureInRestrictedGestureMode:](&v11, "allowGestureInRestrictedGestureMode:", v4))
  {
    v8 = 1;
  }
  else
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "repRotateGestureRecognizer"));
    v8 = v9 == v4;

  }
  return v8;
}

- (void)toolkitDidUpdateCurrentToolSelection
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  -[CRLiOSDocumentModeFreehandDrawing toolkitDidUpdateCurrentToolSelection](&v3, "toolkitDidUpdateCurrentToolSelection");
  -[CRLiOSDocumentModeFreehandDrawingTransform p_endTransformMode](self, "p_endTransformMode");
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 0;
}

- (void)p_doneButtonTapped:(id)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentModeController"));
  objc_msgSend(v3, "resetToDefaultModeAnimated:", 1);

}

- (void)selectionPathDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSDocumentModeFreehandDrawingTransform;
  -[CRLiOSDocumentModeFreehandDrawing selectionPathDidChange:](&v4, "selectionPathDidChange:", a3);
  -[CRLiOSDocumentModeFreehandDrawingTransform p_endTransformMode](self, "p_endTransformMode");
}

- (void)p_endTransformMode
{
  CRLiOSDocumentModeFreehandDrawing *v3;
  void *v4;
  CRLiOSDocumentModeFreehandDrawing *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v3 = [CRLiOSDocumentModeFreehandDrawing alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFreehandDrawing interactiveCanvasController](self, "interactiveCanvasController"));
  v5 = -[CRLiOSDocumentModeFreehandDrawing initWithBoardViewController:andInteractiveCanvasController:](v3, "initWithBoardViewController:andInteractiveCanvasController:", v7, v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "documentModeController"));
  objc_msgSend(v6, "setMode:animated:", v5, 0);

}

@end
