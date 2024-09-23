@implementation CRLiOSDocumentMode

+ (id)modeWithBoardViewController:(id)a3
{
  id v4;
  uint64_t v5;
  Class v6;
  id v7;

  v4 = a3;
  objc_opt_class(a1, v5);
  v7 = objc_msgSend([v6 alloc], "initWithBoardViewController:", v4);

  return v7;
}

- (CRLiOSDocumentMode)initWithBoardViewController:(id)a3
{
  id v4;
  uint64_t v5;
  CRLiOSDocumentMode *v6;
  double v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRLiOSDocumentMode;
  v6 = -[CRLiOSDocumentMode init](&v15, "init");
  if (v6)
  {
    *(_QWORD *)&v7 = objc_opt_class(CRLiOSDocumentMode, v5).n128_u64[0];
    if (-[CRLiOSDocumentMode isMemberOfClass:](v6, "isMemberOfClass:", v8, v7))
    {
      v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245908);
      v10 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E0E5F0(v9, v10);
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_101245928);
      v11 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE81F0(v11, v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSDocumentMode initWithBoardViewController:]"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLApplication/CRLiOSDocumentMode.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 27, 0, "Should not be initializing an abstract instance of CRLiOSDocumentMode.");

    }
    objc_storeWeak((id *)&v6->_boardViewController, v4);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSDocumentMode;
  return -[CRLiOSDocumentMode isEqual:](&v4, "isEqual:", a3);
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLiOSDocumentMode;
  return -[CRLiOSDocumentMode hash](&v3, "hash");
}

- (BOOL)allowGestureInRestrictedGestureMode:(id)a3
{
  return 0;
}

- (id)knobValidatorBlock
{
  return 0;
}

- (id)gesturesToAdjustIfPencilShouldSelectAndScrollFromGestures:(id)a3
{
  return a3;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  return 0;
}

- (BOOL)handleTapOnCanvasBackgroundAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)shouldHandleDoubleTapAtPoint:(CGPoint)a3 touchType:(int64_t)a4
{
  return 0;
}

- (id)allowedKeyCommandsFromKeyCommands:(id)a3
{
  return a3;
}

- (NSArray)editorControllersToObserve
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editorControllersToObserveForMode:", self));

  return (NSArray *)v4;
}

- (BOOL)isValidForEditorController:(id)a3
{
  return 1;
}

- (BOOL)shouldSelectAndScrollWithApplePencil
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("CRLSelectAndScrollWithApplePencil"));

  return v3;
}

- (BOOL)wantsCanvasInRestrictedGestureMode
{
  return 0;
}

- (id)cursorAtPoint:(CGPoint)a3 withCursorPlatformObject:(id)a4
{
  return 0;
}

- (BOOL)wantsAlternateContextMenuBehaviorAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)contextMenuConfigurationForContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4 onInteractiveCanvasController:(id)a5
{
  return 0;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  return 0;
}

- (void)willShowContextMenuInteraction:(id)a3 atPoint:(CGPoint)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController", a3, a4.x, a4.y));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[CRLiOSDocumentMode boardViewController](self, "boardViewController"));
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

  }
}

- (void)performBlockIgnoringSelectionChangesToExitHandwritingMode:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

- (BOOL)wantsToSuppressSelectionKnobs
{
  return 0;
}

- (BOOL)wantsToSuppressMediaReplacementKnobs
{
  return 0;
}

- (BOOL)wantsToSuppressMultiselectionWithSingleBounds
{
  return 0;
}

- (BOOL)wantsToSuppressMiniFormatter
{
  return 0;
}

- (BOOL)wantsToSuppressBottomToolbarInCompact
{
  return 0;
}

- (BOOL)wantsToEndForNonPopoverPresentations
{
  return 0;
}

- (BOOL)wantsToEndForDragAndDropInteractions
{
  return 0;
}

- (id)validateSelectionPathIfNeededFromPersistableSelectionPath:(id)a3 withSelectionPathValidator:(id)a4
{
  return 0;
}

- (BOOL)disallowRectangularMarqueeOperationAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (BOOL)allowedToEnterQuickSelectModeForCanvasViewController:(id)a3
{
  return 1;
}

- (BOOL)wantsToSuppressZoomInResponseToSelectionChange
{
  return 0;
}

- (BOOL)wantsToPreventStandardPencilBehaviors
{
  return 0;
}

- (BOOL)allowsInstantAlpha
{
  return 1;
}

- (BOOL)allowsEditMask
{
  return 1;
}

- (BOOL)allowsHyperlinkEditing
{
  return 1;
}

- (BOOL)allowsDragOnUnselectedReps
{
  return 0;
}

- (BOOL)cellHoverHighlightShouldBeDisplayed
{
  return 0;
}

- (BOOL)shouldAllowTextGesturesInRestrictedGestureMode
{
  return 0;
}

- (BOOL)shouldSuppressKeyboard
{
  return 0;
}

- (unint64_t)pencilModeType
{
  return 0;
}

- (BOOL)navigatorShouldBeReadOnly
{
  return 0;
}

- (BOOL)shouldRejectDragOperationForDragInfo:(id)a3
{
  return 0;
}

- (BOOL)allowsSystemDragSession
{
  return 1;
}

- (BOOL)shouldRestoreModeAfterDocumentReplaced
{
  return 1;
}

- (BOOL)showApplicationToolbarWhenEnteringMode
{
  return 1;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  return 0;
}

- (CRLiOSToolTrayProviding)toolTray
{
  return 0;
}

- (BOOL)wantsDoneButtonInCompact
{
  return 0;
}

- (BOOL)wantsLegacyEditMenu
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)shouldProhibitAction:(SEL)a3 withSender:(id)a4
{
  return 0;
}

- (NSUndoManager)undoManager
{
  return 0;
}

- (_TtC8Freeform25CRLiOSBoardViewController)boardViewController
{
  return (_TtC8Freeform25CRLiOSBoardViewController *)objc_loadWeakRetained((id *)&self->_boardViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_boardViewController);
}

@end
