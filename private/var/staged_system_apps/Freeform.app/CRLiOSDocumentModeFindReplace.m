@implementation CRLiOSDocumentModeFindReplace

- (CRLiOSDocumentModeFindReplace)initWithBoardViewController:(id)a3 andInteractiveCanvasController:(id)a4
{
  id v6;
  CRLiOSDocumentModeFindReplace *v7;
  CRLiOSDocumentModeFindReplace *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CRLiOSDocumentModeFindReplace;
  v7 = -[CRLiOSDocumentMode initWithBoardViewController:](&v10, "initWithBoardViewController:", a3);
  v8 = v7;
  if (v7)
    objc_storeWeak((id *)&v7->_interactiveCanvasController, v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  uint64_t v7;

  v4 = a3;
  *(_QWORD *)&v6 = objc_opt_class(self, v5).n128_u64[0];
  LOBYTE(self) = objc_msgSend(v4, "isMemberOfClass:", v7, v6);

  return (char)self;
}

- (unint64_t)hash
{
  return 5;
}

- (void)modeWillBeginFromMode:(id)a3 forced:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLiOSDocumentModeFindReplace;
  -[CRLiOSDocumentMode modeWillBeginFromMode:forced:](&v12, "modeWillBeginFromMode:forced:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editorController"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionModelTranslator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPathForInfos:", 0));

  objc_msgSend(v6, "setSelectionPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textInputResponder"));
  objc_msgSend(v11, "setDisallowBecomingFirstResponder:", 1);

}

- (void)modeWillEndForMode:(id)a3 forced:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textInputResponder"));
  objc_msgSend(v8, "setDisallowBecomingFirstResponder:", 0);

  v9.receiver = self;
  v9.super_class = (Class)CRLiOSDocumentModeFindReplace;
  -[CRLiOSDocumentMode modeWillEndForMode:forced:](&v9, "modeWillEndForMode:forced:", v6, v4);

}

- (void)modeDidEndForMode:(id)a3 forced:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLiOSDocumentModeFindReplace;
  -[CRLiOSDocumentMode modeDidEndForMode:forced:](&v11, "modeDidEndForMode:forced:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "findReplaceInteraction"));
  objc_msgSend(v6, "dismissFindNavigator");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layerHost"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "asiOSCVC"));
  objc_msgSend(v9, "becomeFirstResponderIfAppropriate");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentModeFindReplace interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(v10, "setShowGrayOverlay:", 0);

}

- (BOOL)allowsEditMask
{
  return 0;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 1;
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 1;
}

- (BOOL)allowsDragOnUnselectedReps
{
  return 0;
}

- (BOOL)allowsPencilAnnotations
{
  return 0;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  return 1;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController", a4, a3.x, a3.y));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "findReplaceInteraction"));
  objc_msgSend(v5, "dismissFindNavigator");

  return 1;
}

- (void)handleAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController", a3.x, a3.y));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "documentModeController"));
  objc_msgSend(v3, "performSelector:withObject:afterDelay:", "resetToDefaultModeAnimated:", &__kCFBooleanTrue, 0.0);

}

- (CRLInteractiveCanvasController)interactiveCanvasController
{
  return (CRLInteractiveCanvasController *)objc_loadWeakRetained((id *)&self->_interactiveCanvasController);
}

- (void)setInteractiveCanvasController:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveCanvasController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end
