@implementation THWAutosizedCanvasController

- (THWAutosizedCanvasController)initWithDelegate:(id)a3 documentRoot:(id)a4
{
  THWAutosizedCanvasController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWAutosizedCanvasController;
  v6 = -[THWAutosizedCanvasController init](&v8, "init");
  if (v6)
  {
    v6->_documentRoot = (TSKDocumentRoot *)a4;
    v6->_delegate = (THWAutosizedCanvasControllerDelegate *)a3;
    THCanvasCreate(v6, (id *)&v6->_interactiveCanvasController, &v6->_canvasViewController);
    -[TSDInteractiveCanvasController disableAllGestures](v6->_interactiveCanvasController, "disableAllGestures");
    -[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:](v6->_interactiveCanvasController, "setAllowLayoutAndRenderOnThread:", 1);
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](v6->_interactiveCanvasController, "setCreateRepsForOffscreenLayouts:", 1);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDInteractiveCanvasController setDelegate:](-[THWAutosizedCanvasController interactiveCanvasController](self, "interactiveCanvasController"), "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THWAutosizedCanvasController;
  -[THWAutosizedCanvasController dealloc](&v3, "dealloc");
}

- (TSDCanvasView)canvasView
{
  return (TSDCanvasView *)-[TSDiOSCanvasViewController canvasView](self->_canvasViewController, "canvasView");
}

- (void)teardown
{
  -[TSDInteractiveCanvasController teardown](self->_interactiveCanvasController, "teardown");
  -[TSDiOSCanvasViewController teardown](self->_canvasViewController, "teardown");
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (BOOL)editorAllowsEditMenu
{
  return 0;
}

- (BOOL)allowCopy
{
  return 0;
}

- (BOOL)allowHighlighting
{
  return 0;
}

- (BOOL)allowSelectionPopover
{
  return -[THWAutosizedCanvasControllerDelegate allowSelectionPopoverForAutosizedCanvasController:](-[THWAutosizedCanvasController delegate](self, "delegate"), "allowSelectionPopoverForAutosizedCanvasController:", self);
}

- (id)interactiveCanvasController:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  return -[THWAutosizedCanvasControllerDelegate autosizedCanvasController:geometryProviderForLayout:](-[THWAutosizedCanvasController delegate](self, "delegate", a3), "autosizedCanvasController:geometryProviderForLayout:", self, a4);
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  return -[THWAutosizedCanvasControllerDelegate autosizedCanvasController:delegateConformingToProtocol:forRep:](-[THWAutosizedCanvasController delegate](self, "delegate", a3), "autosizedCanvasController:delegateConformingToProtocol:forRep:", self, a4, a5);
}

- (id)interactiveCanvasController:(id)a3 primaryTargetForGesture:(id)a4
{
  return -[THWAutosizedCanvasControllerDelegate autosizedCanvasController:primaryTargetForGesture:](-[THWAutosizedCanvasController delegate](self, "delegate", a3), "autosizedCanvasController:primaryTargetForGesture:", self, a4);
}

- (void)interactiveCanvasControllerWillLayout:(id)a3
{
  -[THWAutosizedCanvasControllerDelegate autosizedCanvasControllerWillLayout:](self->_delegate, "autosizedCanvasControllerWillLayout:", self);
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_15E27C;
  block[3] = &unk_426DD0;
  block[4] = self;
  if (+[NSThread isMainThread](NSThread, "isMainThread", a3))
    sub_15E27C((uint64_t)block);
  else
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)interactiveCanvasControllerIsRelatedCanvasScrolling:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "autosizedCanvasControllerIsRelatedCanvasScrolling:") & 1) != 0)
    return -[THWAutosizedCanvasControllerDelegate autosizedCanvasControllerIsRelatedCanvasScrolling:](self->_delegate, "autosizedCanvasControllerIsRelatedCanvasScrolling:", self);
  else
    return 0;
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if ((objc_opt_respondsToSelector(self->_delegate, "autosizedCanvasControllerDidLayoutAndRenderOnBackgroundThread:") & 1) != 0)
    -[THWAutosizedCanvasControllerDelegate autosizedCanvasControllerDidLayoutAndRenderOnBackgroundThread:](self->_delegate, "autosizedCanvasControllerDidLayoutAndRenderOnBackgroundThread:", self);
}

- (BOOL)interactiveCanvasController:(id)a3 canvasViewShouldBecomeFirstResponder:(id)a4
{
  return 0;
}

- (BOOL)interactiveCanvasControllerShouldForwardTabEventsToNextResponder:(id)a3
{
  return 1;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return -[THWAutosizedCanvasControllerDelegate autosizedCanvasController:allowsEditMenuForRep:](-[THWAutosizedCanvasController delegate](self, "delegate", a3), "autosizedCanvasController:allowsEditMenuForRep:", self, a4);
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  THWAutosizedCanvasControllerDelegate *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;

  v7 = -[THWAutosizedCanvasController delegate](self, "delegate", a3, a4, a5);
  v8 = objc_opt_class(TSDRep);
  *(_QWORD *)&v9 = TSUDynamicCast(v8, a4).n128_u64[0];
  return -[THWAutosizedCanvasControllerDelegate autosizedCanvasController:allowsSelectionForRep:](v7, "autosizedCanvasController:allowsSelectionForRep:", self, v10, v9);
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (void)setupImmediatePressGesture
{
  id v3;
  id v4;
  TSWPLongPressGestureRecognizer *v5;

  if (!self->_immediatePressGesture)
  {
    v3 = objc_alloc((Class)TSWPLongPressGestureRecognizer);
    v4 = -[TSDInteractiveCanvasController gestureDispatcher](self->_interactiveCanvasController, "gestureDispatcher");
    v5 = (TSWPLongPressGestureRecognizer *)objc_msgSend(v3, "initWithGestureDispatcher:gestureKind:", v4, TSWPImmediatePress);
    self->_immediatePressGesture = v5;
    -[TSWPLongPressGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 0);
    -[TSWPLongPressGestureRecognizer setNumberOfTouchesRequired:](self->_immediatePressGesture, "setNumberOfTouchesRequired:", 1);
    -[TSWPLongPressGestureRecognizer setMinimumPressDuration:](self->_immediatePressGesture, "setMinimumPressDuration:", 0.0);
    objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](self->_canvasViewController, "viewForGestureRecognizer:", self->_immediatePressGesture), "addGestureRecognizer:", self->_immediatePressGesture);
  }
}

- (void)invalidateLayoutsAndFrames
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_msgSend(-[TSDInteractiveCanvasController layoutController](self->_interactiveCanvasController, "layoutController"), "rootLayout");
  v3 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v2, "addLayoutsToArray:", v3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TSDLayout);
        *(_QWORD *)&v11 = TSUDynamicCast(v9, v8).n128_u64[0];
        if (v10)
        {
          v12 = v10;
          objc_msgSend(v10, "invalidateFrame", v11);
          objc_msgSend(v12, "invalidateChildren");
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16, v11);
    }
    while (v5);
  }

}

- (TSKDocumentRoot)documentRoot
{
  return self->_documentRoot;
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->_interactiveCanvasController;
}

- (TSDiOSCanvasViewController)canvasViewController
{
  return self->_canvasViewController;
}

- (THWAutosizedCanvasControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAutosizedCanvasControllerDelegate *)a3;
}

- (TSWPLongPressGestureRecognizer)immediatePressGesture
{
  return self->_immediatePressGesture;
}

- (void)setImmediatePressGesture:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (CGSize)canvasLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_canvasLayoutSize.width;
  height = self->_canvasLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
