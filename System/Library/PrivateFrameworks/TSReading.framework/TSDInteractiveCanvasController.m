@implementation TSDInteractiveCanvasController

- (TSDInteractiveCanvasController)init
{
  TSDInteractiveCanvasController *v2;
  TSDInteractiveCanvasController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDInteractiveCanvasController;
  v2 = -[TSDInteractiveCanvasController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TSDInteractiveCanvasController p_commonInit](v2, "p_commonInit");
  __dmb(0xBu);
  return v3;
}

- (void)addCommonObservers
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_rulerUnitsDidChangeNotification_, TSKRulerUnitsDidChangeNotification, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_iccWillBecomeFirstResponderNotification_, CFSTR("TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "addObserver:selector:name:object:", self, sel_p_iccWillResignFirstResponderNotification_, CFSTR("TSDInteractiveCanvasControllerWillResignFirstResponderNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_textGesturesWillBeginNotification_, CFSTR("TSDTextGesturesWillBeginNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_textGesturesDidEndNotification_, CFSTR("TSDTextGesturesDidEndNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_p_willEnterForeground_, *MEMORY[0x24BDF75D0], 0);
}

- (void)removeCommonObservers
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, TSKRulerUnitsDidChangeNotification, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("TSDInteractiveCanvasControllerWillResignFirstResponderNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TSDTextGesturesWillBeginNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TSDTextGesturesDidEndNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);
}

- (void)p_commonInit
{
  TSDCanvas *v3;
  const __CFAllocator *v4;
  const CFDictionaryValueCallBacks *v5;
  CALayer *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  self->mSelfSync = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
  v3 = objc_alloc_init(TSDCanvas);
  self->mCanvas = v3;
  -[TSDCanvas setDelegate:](v3, "setDelegate:", self);
  -[TSDCanvas i_setCanvasController:](self->mCanvas, "i_setCanvasController:", self);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  self->mRepLayersByRep = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]);
  self->mRepsByRepLayer = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mContainerLayersByRep = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mRepsByContainerLayer = CFDictionaryCreateMutable(v4, 0, 0, v5);
  self->mDirectLayerHostsByRep = CFDictionaryCreateMutable(v4, 0, 0, v5);
  v6 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
  self->mRepContainerLayer = v6;
  -[CALayer setDelegate:](v6, "setDelegate:", self);
  -[CALayer setName:](self->mRepContainerLayer, "setName:", CFSTR("repContainer"));
  self->mResizeCanvasOnLayout = 0;
  -[TSDInteractiveCanvasController addCommonObservers](self, "addCommonObservers");
  v7 = *MEMORY[0x24BDBF070];
  v8 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v10 = *(double *)(MEMORY[0x24BDBF070] + 24);
  -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", *MEMORY[0x24BDBF070], v8, v9, v10);
  -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v7, v8, v9, v10);
  self->mTileStorage = objc_alloc_init(TSDTileStorage);
  self->mDisplayLinkDispatch = objc_alloc_init(TSDDisplayLinkDispatch);
  self->mNotificationsToPostWithValidLayouts = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  TSDInteractiveCanvasController *mTextInputResponderSource;
  __CFDictionary *mRepLayersByRep;
  __CFDictionary *mRepsByRepLayer;
  __CFDictionary *mContainerLayersByRep;
  __CFDictionary *mDirectLayerHostsByRep;
  __CFDictionary *mRepsByContainerLayer;
  objc_super v13;

  if (!self->mHasBeenTornDown)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 459, CFSTR("Must call -teardown on ICC before it is deallocated"));
  }
  if (self->mHadLayerHost && !self->mLayerHostHasBeenTornDown)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController dealloc]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 462, CFSTR("Must call -teardown on CVC before ICC is deallocated"));
  }

  CGColorRelease(self->mSelectionHighlightColor);
  -[TSDInteractiveCanvasController removeCommonObservers](self, "removeCommonObservers");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[CALayer setDelegate:](self->mOverlayLayer, "setDelegate:", 0);

  self->mOverlayLayer = 0;
  self->mPopoutLayer = 0;

  self->mGuideController = 0;
  self->mEditorController = 0;

  self->mCanvasEditor = 0;
  self->mTextInputResponder = 0;
  mTextInputResponderSource = self->mTextInputResponderSource;
  if (mTextInputResponderSource)
  {
    --mTextInputResponderSource->mTextInputResponderShareCount;

    self->mTextInputResponderSource = 0;
  }

  self->mUnitFormatter = 0;
  self->mTMCoordinator = 0;

  self->mDynOpController = 0;
  self->mGestureDispatcher = 0;

  self->mTrackingController = 0;
  self->mBackgroundLayoutAndRenderState = 0;
  mRepLayersByRep = self->mRepLayersByRep;
  if (mRepLayersByRep)
  {
    CFRelease(mRepLayersByRep);
    self->mRepLayersByRep = 0;
  }
  mRepsByRepLayer = self->mRepsByRepLayer;
  if (mRepsByRepLayer)
  {
    CFRelease(mRepsByRepLayer);
    self->mRepsByRepLayer = 0;
  }
  mContainerLayersByRep = self->mContainerLayersByRep;
  if (mContainerLayersByRep)
  {
    CFRelease(mContainerLayersByRep);
    self->mContainerLayersByRep = 0;
  }
  mDirectLayerHostsByRep = self->mDirectLayerHostsByRep;
  if (mDirectLayerHostsByRep)
  {
    CFRelease(mDirectLayerHostsByRep);
    self->mDirectLayerHostsByRep = 0;
  }
  mRepsByContainerLayer = self->mRepsByContainerLayer;
  if (mRepsByContainerLayer)
  {
    CFRelease(mRepsByContainerLayer);
    self->mRepsByContainerLayer = 0;
  }
  -[CALayer setDelegate:](self->mRepContainerLayer, "setDelegate:", 0);

  self->mRepContainerLayer = 0;
  self->mDecorators = 0;

  self->mCurrentAnimation = 0;
  self->mHiddenTopLevelLayers = 0;

  self->mCanvas = 0;
  self->mDisplayedAnnotation = 0;

  self->mAnnotationPopoverController = 0;
  self->mNextLayoutBlocks = 0;

  self->mDisplayLinkDispatch = 0;
  self->_directLayerHostProvider = 0;

  self->mCachedTopLevelTilingLayers = 0;
  v13.receiver = self;
  v13.super_class = (Class)TSDInteractiveCanvasController;
  -[TSDInteractiveCanvasController dealloc](&v13, sel_dealloc);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  void *v6;
  uint64_t v7;
  objc_super v8;
  objc_super v9;
  char __str[32];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)TSDInteractiveCanvasController;
  if (-[TSDInteractiveCanvasController respondsToSelector:](&v9, sel_respondsToSelector_))
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDInteractiveCanvasController;
    return -[TSDInteractiveCanvasController methodSignatureForSelector:](&v8, sel_methodSignatureForSelector_, a3);
  }
  else
  {
    result = (id)methodSignatureForSelector__s_actionMethodSignature;
    if (!methodSignatureForSelector__s_actionMethodSignature)
    {
      if (snprintf(__str, 0x20uLL, "%s%s%s%s", "v", "@", ":", "@") >= 0x20)
      {
        v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController methodSignatureForSelector:]");
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 580, CFSTR("ObjCTypes string overflowed"));
      }
      result = (id)objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", __str);
      methodSignatureForSelector__s_actionMethodSignature = (uint64_t)result;
    }
  }
  return result;
}

+ (BOOL)selectorIsActionMethod:(SEL)a3
{
  char *Name;
  char *v5;

  Name = (char *)sel_getName(a3);
  v5 = &Name[strlen(Name) - 1];
  if (*v5 != 58 || strchr(Name, 58) != v5)
    return 0;
  return sel_tilingLayerWillSetNeedsLayout_ != a3 && sel_descriptionWithLocale_ != a3;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  _BOOL4 v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDInteractiveCanvasController;
  if (-[TSDInteractiveCanvasController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = +[TSDInteractiveCanvasController selectorIsActionMethod:](TSDInteractiveCanvasController, "selectorIsActionMethod:", a3);
    if (v5)
      LOBYTE(v5) = -[TSDEditorController editorForEditAction:withSender:](-[TSDInteractiveCanvasController editorController](self, "editorController"), "editorForEditAction:withSender:", a3, 0) != 0;
  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  uint64_t v5;
  TSDEditorController *v6;
  uint64_t v7;
  uint64_t v8;
  TSKAccessController *v9;
  objc_super v10;
  _QWORD v11[6];
  uint64_t v12;

  v5 = objc_msgSend(a3, "selector");
  v12 = 0;
  objc_msgSend(a3, "getArgument:atIndex:", &v12, 2);
  v6 = -[TSDInteractiveCanvasController editorController](self, "editorController");
  v7 = -[TSDEditorController editorForEditAction:withSender:](v6, "editorForEditAction:withSender:", v5, v12);
  if (v7 && (v8 = v7, (objc_opt_respondsToSelector() & 1) != 0))
  {
    v9 = -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
    if (v9)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __52__TSDInteractiveCanvasController_forwardInvocation___block_invoke;
      v11[3] = &unk_24D82A5C8;
      v11[4] = a3;
      v11[5] = v8;
      -[TSKAccessController performRead:](v9, "performRead:", v11);
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSDInteractiveCanvasController;
    -[TSDInteractiveCanvasController doesNotRecognizeSelector:](&v10, sel_doesNotRecognizeSelector_, v5);
  }
}

uint64_t __52__TSDInteractiveCanvasController_forwardInvocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(a1 + 40));
}

- (void)teardownCanvasEditor
{
  TSDCanvasEditor *mCanvasEditor;

  mCanvasEditor = self->mCanvasEditor;
  if (mCanvasEditor)
  {
    -[TSDCanvasEditor setSelection:](mCanvasEditor, "setSelection:", 0);
    if (objc_msgSend(-[TSDEditorController currentEditors](self->mEditorController, "currentEditors"), "indexOfObjectIdenticalTo:", self->mCanvasEditor) != 0x7FFFFFFFFFFFFFFFLL)-[TSDEditorController popEditor:](self->mEditorController, "popEditor:", self->mCanvasEditor);
    -[TSDCanvasEditor teardown](self->mCanvasEditor, "teardown");

    self->mCanvasEditor = 0;
  }

  self->mEditorController = 0;
}

- (void)teardown
{
  TSDCanvasEditor *mCanvasEditor;
  id v4;
  TSDTextInputResponder *mTextInputResponder;
  __CFDictionary *mRepsByRepLayer;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_i_viewScrollingEnded, 0);
  mCanvasEditor = self->mCanvasEditor;
  if (mCanvasEditor)
  {
    -[TSDCanvasEditor setSelection:](mCanvasEditor, "setSelection:", 0);
    v4 = -[TSDEditorController currentEditors](self->mEditorController, "currentEditors");
    if (!v4 || objc_msgSend(v4, "indexOfObjectIdenticalTo:", self->mCanvasEditor) == 0x7FFFFFFFFFFFFFFFLL)
      -[TSDCanvasEditor teardown](self->mCanvasEditor, "teardown");
  }
  -[TSDEditorController teardown](self->mEditorController, "teardown");

  self->mCanvasEditor = 0;
  self->mEditorController = 0;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[TSDDisplayLinkDispatch teardown](self->mDisplayLinkDispatch, "teardown");

  self->mDisplayLinkDispatch = 0;
  -[TSDInteractiveCanvasController removeCommonObservers](self, "removeCommonObservers");
  if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  -[TSDBackgroundLayoutAndRenderState clearDelegate](self->mBackgroundLayoutAndRenderState, "clearDelegate");

  self->mBackgroundLayoutAndRenderState = 0;
  -[TSDInteractiveCanvasController teardownBackgroundRendering](self, "teardownBackgroundRendering");
  -[TSDInteractiveCanvasController setTrackingController:](self, "setTrackingController:", 0);
  if (self->mCanvasEditor)
  {
    -[TSDInteractiveCanvasController endEditing](self, "endEditing");
    -[TSDInteractiveCanvasController teardownCanvasEditor](self, "teardownCanvasEditor");
  }
  mTextInputResponder = self->mTextInputResponder;
  if (self->mTextInputResponderSource)
    -[TSDTextInputResponder forceDelayedResponderChange](mTextInputResponder, "forceDelayedResponderChange");
  else
    -[TSDTextInputResponder teardown](mTextInputResponder, "teardown");
  -[TSDGestureDispatcher teardown](-[TSDInteractiveCanvasController gestureDispatcher](self, "gestureDispatcher"), "teardown");
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    self->mTeardownOnBackgroundThread = 1;
  -[TSDCanvas teardown](self->mCanvas, "teardown");
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    -[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:](self, "p_updateViewsFromRepsForceUpdate:", 1);
  -[TSDTileStorage removeAllContents](self->mTileStorage, "removeAllContents");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  mRepsByRepLayer = self->mRepsByRepLayer;
  v7 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mRepsByRepLayer, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(mRepsByRepLayer);
        -[TSDInteractiveCanvasController p_recursivelyClearLayerDelegate:](self, "p_recursivelyClearLayerDelegate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v8 = -[__CFDictionary countByEnumeratingWithState:objects:count:](mRepsByRepLayer, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
  -[TSDInteractiveCanvasController setDelegate:](self, "setDelegate:", 0);
  -[NSMutableSet removeAllObjects](self->mNotificationsToPostWithValidLayouts, "removeAllObjects");
  self->mHasBeenTornDown = 1;
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  if (self->mSuspendedLowPriorityThreadDispatcher)
  {
    self->mSuspendedLowPriorityThreadDispatcher = 0;
    objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "resume");
  }
}

- (void)p_recursivelyClearLayerDelegate:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "setDelegate:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (void *)objc_msgSend(a3, "sublayers", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TSDInteractiveCanvasController p_recursivelyClearLayerDelegate:](self, "p_recursivelyClearLayerDelegate:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)i_layerHostHasBeenTornDown
{
  self->mLayerHostHasBeenTornDown = 1;
}

- (void)setLayerHost:(id)a3
{
  if (a3)
    self->mHadLayerHost = 1;
  self->mLayerHost = (TSDCanvasLayerHosting *)a3;
}

- (void)i_cvcWillBecomeFirstResponder
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDInteractiveCanvasControllerWillBecomeFirstResponderNotification"), self, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerWillBecomeFirstResponder:](self->mDelegate, "interactiveCanvasControllerWillBecomeFirstResponder:", self);
}

- (void)i_cvcWillResignFirstResponder
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("TSDInteractiveCanvasControllerWillResignFirstResponderNotification"), self, 0);
}

- (void)p_iccWillBecomeFirstResponderNotification:(id)a3
{
  TSDInteractiveCanvasController *v4;
  TSDCanvasView *v5;

  v4 = (TSDInteractiveCanvasController *)objc_msgSend(a3, "object");
  if (v4 != self)
  {
    v5 = -[TSDCanvasView rootCanvasView](-[TSDInteractiveCanvasController canvasView](v4, "canvasView"), "rootCanvasView");
    if (v5 == -[TSDCanvasView rootCanvasView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "rootCanvasView"))-[TSDInteractiveCanvasController endEditing](self, "endEditing");
  }
}

- (void)p_iccWillResignFirstResponderNotification:(id)a3
{
  if ((TSDInteractiveCanvasController *)objc_msgSend(a3, "object") == self && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (-[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldEndEditingWhenLosingFirstResponder:](self->mDelegate, "interactiveCanvasControllerShouldEndEditingWhenLosingFirstResponder:", self))-[TSDInteractiveCanvasController endEditing](self, "endEditing");
  }
}

- (void)teardownBackgroundRendering
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  NSMutableArray *mBackgroundRenderingObjects;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = -[TSDCanvas allReps](self->mCanvas, "allReps");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "i_shutdownTileQueue");
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }
  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  v8 = (void *)-[NSMutableArray copy](self->mBackgroundRenderingObjects, "copy");
  objc_sync_exit(mBackgroundRenderingObjects);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      for (j = 0; j != v9; ++j)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * j), "teardownBackgroundRendering");
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

- (void)addBackgroundRenderingObject:(id)a3
{
  NSMutableArray *mBackgroundRenderingObjects;
  NSMutableArray *v6;

  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  v6 = self->mBackgroundRenderingObjects;
  if (!v6)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    self->mBackgroundRenderingObjects = v6;
  }
  -[NSMutableArray addObject:](v6, "addObject:", a3);
  objc_sync_exit(mBackgroundRenderingObjects);
}

- (void)removeBackgroundRenderingObject:(id)a3
{
  NSMutableArray *mBackgroundRenderingObjects;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  mBackgroundRenderingObjects = self->mBackgroundRenderingObjects;
  objc_sync_enter(mBackgroundRenderingObjects);
  v6 = -[NSMutableArray indexOfObject:](self->mBackgroundRenderingObjects, "indexOfObject:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController removeBackgroundRenderingObject:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 879, CFSTR("removeBackgroundRenderingObject called on an object that is not in the array"));
  }
  -[NSMutableArray removeObjectAtIndex:](self->mBackgroundRenderingObjects, "removeObjectAtIndex:", v6);
  objc_sync_exit(mBackgroundRenderingObjects);
}

- (void)setDelegate:(id)a3
{
  if (self->mDelegate != a3)
    self->mDelegate = (TSDInteractiveCanvasControllerDelegate *)a3;
}

+ (id)keyPathsForValuesAffectingDocumentRoot
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("delegate"));
}

- (TSKDocumentRootProvider)documentRootProvider
{
  return self->mDelegate;
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)-[TSDInteractiveCanvasControllerDelegate documentRoot](self->mDelegate, "documentRoot");
}

- (TSPObjectContext)objectContext
{
  return -[TSPObject context](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "context");
}

- (TSKChangeNotifier)changeNotifier
{
  return -[TSKDocumentRoot changeNotifier](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "changeNotifier");
}

- (TSKAccessController)accessController
{
  return -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
}

- (CGSize)defaultMinimumUnscaledCanvasSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BDBF148];
  v3 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)canvasLayoutInvalidated:(id)a3
{
  if (-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive", a3)
    && (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread")
     || !self->mLayoutAndRenderOnThreadDuringScroll && self->mNestedCanvasAllowLayoutAndRenderOnThread))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setNeedsLayout");
  }
}

- (void)canvasDidUpdateVisibleBounds:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = *MEMORY[0x24BDBF070];
  v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", a3, *MEMORY[0x24BDBF070], v5, v6, v7);
  -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v4, v5, v6, v7);
}

- (void)canvasWillLayout:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerWillLayout:](self->mDelegate, "interactiveCanvasControllerWillLayout:", self);
}

- (void)canvasDidValidateLayouts:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidValidateLayouts:](self->mDelegate, "interactiveCanvasControllerDidValidateLayouts:", self);
}

- (void)canvasDidLayout:(id)a3
{
  _QWORD block[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidLayout:](self->mDelegate, "interactiveCanvasControllerDidLayout:", self);
  -[TSDInteractiveCanvasController p_postNotificationOnMainThreadWithValidLayouts:](self, "p_postNotificationOnMainThreadWithValidLayouts:", CFSTR("TSDInteractiveCanvasControllerDidLayoutNotification"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__TSDInteractiveCanvasController_canvasDidLayout___block_invoke;
  block[3] = &unk_24D829278;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __50__TSDInteractiveCanvasController_canvasDidLayout___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 600);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * i) + 16))();
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 600) = 0;
}

- (void)canvasWillUpdateRepsFromLayouts:(id)a3
{
  if (-[TSDInteractiveCanvasController resizeCanvasOnLayout](self, "resizeCanvasOnLayout", a3))
    -[TSDInteractiveCanvasController p_updateCanvasSizeFromLayouts](self, "p_updateCanvasSizeFromLayouts");
}

- (void)canvasDidUpdateRepsFromLayouts:(id)a3
{
  _QWORD v4[5];

  -[TSDCanvasLayerHosting canvasDidUpdateRepsFromLayouts](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3), "canvasDidUpdateRepsFromLayouts");
  -[TSDInteractiveCanvasController p_updateLayersFromReps](self, "p_updateLayersFromReps");
  if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __65__TSDInteractiveCanvasController_canvasDidUpdateRepsFromLayouts___block_invoke;
    v4[3] = &unk_24D829278;
    v4[4] = self;
    -[TSDInteractiveCanvasController p_acquireLockAndPerformAction:](self, "p_acquireLockAndPerformAction:", v4);
    if (!self->mCurrentlyScrolling)
      -[TSDTrackingController interactiveCanvasControllerUpdatedRepsFromLayouts:](-[TSDInteractiveCanvasController trackingController](self, "trackingController"), "interactiveCanvasControllerUpdatedRepsFromLayouts:", self);
  }
}

uint64_t __65__TSDInteractiveCanvasController_canvasDidUpdateRepsFromLayouts___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateViewsFromReps");
}

- (void)canvasDidValidateLayoutsWithDependencies:(id)a3
{
  -[TSDInteractiveCanvasController p_postNotificationOnMainThreadWithValidLayouts:](self, "p_postNotificationOnMainThreadWithValidLayouts:", CFSTR("TSDInteractiveCanvasControllerDidValidateLayoutsWithDependenciesNotification"));
}

- (CGRect)visibleScaledBoundsForClippingRepsOnCanvas:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (self->mCreateRepsForOffscreenLayouts)
  {
    v3 = *MEMORY[0x24BDBF028];
    v4 = *(double *)(MEMORY[0x24BDBF028] + 8);
    v5 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v6 = *(double *)(MEMORY[0x24BDBF028] + 24);
  }
  else
  {
    -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect", a3);
    v3 = v8;
    v4 = v9;
    v5 = v10;
    v6 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandVisibleBoundsForClippingReps:](self->mDelegate, "interactiveCanvasController:expandVisibleBoundsForClippingReps:", self, v3, v4, v5, v6);
      v3 = v12;
      v4 = v13;
      v5 = v14;
      v6 = v15;
    }
  }
  v16 = v3;
  v17 = v4;
  v18 = v5;
  v19 = v6;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)additionalVisibleInfosForCanvas:(id)a3
{
  void *v3;
  NSSet *v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (self->mCreateRepsForOffscreenLayouts)
    return 0;
  -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor", a3), "canvasSelection");
  v3 = (void *)objc_msgSend((id)TSUProtocolCast(), "infos");
  v6 = -[TSDDynamicOperationController allTransformedReps](-[TSDInteractiveCanvasController dynamicOperationController](self, "dynamicOperationController"), "allTransformedReps");
  if (v6)
  {
    v7 = v6;
    v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithSet:", v3);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(v3, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "info"));
        }
        v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }
  }
  return v3;
}

- (void)canvas:(id)a3 willLayoutRep:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:willLayoutRep:](self->mDelegate, "interactiveCanvasController:willLayoutRep:", self, a4);
}

- (void)canvas:(id)a3 createdRep:(id)a4
{
  -[TSDCanvasEditor repWasCreated:](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor", a3), "repWasCreated:", a4);
}

- (id)canvas:(id)a3 layoutGeometryProviderForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:layoutGeometryProviderForLayout:](self->mDelegate, "interactiveCanvasController:layoutGeometryProviderForLayout:", self, a4);
  else
    return 0;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  -[TSDCanvasLayerHosting presentError:completionHandler:](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "presentError:completionHandler:", a3, a4);
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  -[TSDCanvasLayerHosting presentErrors:withLocalizedDescription:completionHandler:](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "presentErrors:withLocalizedDescription:completionHandler:", a3, a4, a5);
}

+ (id)keyPathsForValuesAffectingEditorController
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("documentRoot"));
}

- (TSDEditorController)editorController
{
  TSDInteractiveCanvasControllerDelegate *v4;
  TSDInteractiveCanvasControllerDelegate *v5;
  TSDEditorController *v6;
  void *v7;

  if (!self->mEditorController
    && -[TSDInteractiveCanvasController documentRoot](self, "documentRoot")
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v4 = -[TSDInteractiveCanvasController delegate](self, "delegate");
    if (v4 && (v5 = v4, (objc_opt_respondsToSelector() & 1) != 0))
    {
      v6 = (TSDEditorController *)(id)-[TSDInteractiveCanvasControllerDelegate editorControllerForInteractiveCanvasController:](v5, "editorControllerForInteractiveCanvasController:", self);
      self->mEditorController = v6;
      if (!v6)
        goto LABEL_10;
    }
    else if (!self->mEditorController)
    {
LABEL_10:
      self->mEditorController = -[TSDEditorController initWithDocumentRoot:]([TSDEditorController alloc], "initWithDocumentRoot:", -[TSDInteractiveCanvasController documentRoot](self, "documentRoot"));
    }
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_p_editorControllerDidChangeTextInputEditor_, CFSTR("TSDEditorControllerDidChangeTextInputEditor"), self->mEditorController);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_p_editorControllerDidChangeCurrentEditors_, CFSTR("TSDEditorControllerDidChangeCurrentEditors"), self->mEditorController);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_p_editorControllerSelectionDidChange_, CFSTR("TSDEditorControllerSelectionDidChange"), self->mEditorController);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_p_editorControllerSelectionDidChange_, CFSTR("TSDEditorControllerSelectionWasForciblyChanged"), self->mEditorController);
    objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_p_editorControllerSelectionDidChangeAndWantsKeyboard_, CFSTR("TSDEditorControllerSelectionDidChangeAndWantsKeyboard"), self->mEditorController);
    -[TSDEditorController pushEditor:](self->mEditorController, "pushEditor:", -[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"));
  }
  return self->mEditorController;
}

- (TSDTextInputResponder)textInputResponder
{
  int v3;
  TSDTextInputResponder *result;

  v3 = TSUSupportsTextInteraction();
  result = self->mTextInputResponder;
  if (v3)
  {
    if (!result)
    {
      result = (TSDTextInputResponder *)objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", -[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"));
      self->mTextInputResponder = result;
    }
  }
  return result;
}

- (id)newCanvasEditor
{
  return -[TSDCanvasEditor initWithInteractiveCanvasController:]([TSDCanvasEditor alloc], "initWithInteractiveCanvasController:", self);
}

- (TSDCanvasEditor)canvasEditor
{
  if (!self->mCanvasEditor
    && -[TSDInteractiveCanvasController documentRoot](self, "documentRoot")
    && !self->mHasBeenTornDown)
  {
    self->mCanvasEditor = (TSDCanvasEditor *)-[TSDInteractiveCanvasController newCanvasEditor](self, "newCanvasEditor");
  }
  return self->mCanvasEditor;
}

- (id)beginEditingRepForInfo:(id)a3
{
  id result;

  -[TSDInteractiveCanvasController p_layoutWithReadLock](self, "p_layoutWithReadLock");
  result = -[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", a3);
  if (result)
    return -[TSDInteractiveCanvasController beginEditingRep:](self, "beginEditingRep:", result);
  return result;
}

- (id)beginEditingRep:(id)a3 clearingSelection:(BOOL)a4 withEditorProvider:(id)a5
{
  _BOOL4 v6;
  TSDEditorController *v9;
  TSDEditorController *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a4;
  v9 = -[TSDInteractiveCanvasController editorController](self, "editorController");
  -[TSDInteractiveCanvasController p_layoutWithReadLock](self, "p_layoutWithReadLock");
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v10 = -[TSDInteractiveCanvasController editorController](self, "editorController");
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__TSDInteractiveCanvasController_beginEditingRep_clearingSelection_withEditorProvider___block_invoke;
  v15[3] = &unk_24D82B380;
  v15[4] = a3;
  v15[5] = &v16;
  -[TSDEditorController enumerateEditorsOnStackUsingBlock:](v10, "enumerateEditorsOnStackUsingBlock:", v15);
  if (*((_BYTE *)v17 + 24))
  {
    -[TSDInteractiveCanvasController p_endEditingToBeginEditingRep:](self, "p_endEditingToBeginEditingRep:", a3);
    v11 = a3;
    if (v6)
      -[TSDCanvasEditor setSelection:](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "setSelection:", 0);
  }
  if (a3)
  {
    v12 = (*((uint64_t (**)(id))a5 + 2))(a5);
    if (v12)
    {
      -[TSDEditorController pushEditor:](v9, "pushEditor:", v12);
      -[TSDEditorController setTextInputEditor:](v9, "setTextInputEditor:", v12);
    }
  }
  v13 = -[TSDEditorController textInputEditor](v9, "textInputEditor");
  _Block_object_dispose(&v16, 8);
  return v13;
}

uint64_t __87__TSDInteractiveCanvasController_beginEditingRep_clearingSelection_withEditorProvider___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "shouldEndEditingToBeginEditingRep:", *(_QWORD *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    *a3 = 1;
  }
  return result;
}

- (id)beginEditingRep:(id)a3
{
  TSDEditorController *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  -[TSDInteractiveCanvasController p_layoutWithReadLock](self, "p_layoutWithReadLock");
  v5 = -[TSDInteractiveCanvasController editorController](self, "editorController");
  v6 = -[TSDEditorController textInputEditor](v5, "textInputEditor");
  if (!a3 || (v7 = (void *)v6) == 0 || (objc_msgSend(a3, "canEditWithEditor:", v6) & 1) == 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __50__TSDInteractiveCanvasController_beginEditingRep___block_invoke;
    v9[3] = &unk_24D82B3A8;
    v9[4] = a3;
    -[TSDInteractiveCanvasController beginEditingRep:clearingSelection:withEditorProvider:](self, "beginEditingRep:clearingSelection:withEditorProvider:", a3, 1, v9);
    return -[TSDEditorController textInputEditor](v5, "textInputEditor");
  }
  return v7;
}

uint64_t __50__TSDInteractiveCanvasController_beginEditingRep___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginEditing");
}

- (void)endEditing
{
  -[TSDInteractiveCanvasController p_endEditingToBeginEditingRep:](self, "p_endEditingToBeginEditingRep:", 0);
}

- (BOOL)canZoomToCurrentSelection
{
  return -[TSDCanvasSelection infoCount](-[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection"), "infoCount") != 0;
}

- (CGPoint)smartZoomCenterForNoSelection
{
  double v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDCanvas unscaledSize](-[TSDInteractiveCanvasController canvas](self, "canvas"), "unscaledSize");
  v2 = TSDRectWithSize();
  v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (void)zoomToCurrentSelection
{
  TSDCanvasSelection *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  NSSet *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;
  CGRect v27;
  CGRect v28;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection");
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -[TSDCanvasSelection infos](v3, "infos", 0);
  v9 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = -[TSDInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12));
        if (v13)
        {
          objc_msgSend((id)objc_msgSend(v13, "geometryInRoot"), "frame");
          v4 = TSDUnionRect(v4, v5, v6, v7, v14, v15, v16, v17);
          v5 = v18;
          v6 = v19;
          v7 = v20;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  v27.origin.x = v4;
  v27.origin.y = v5;
  v27.size.width = v6;
  v27.size.height = v7;
  v28 = CGRectInset(v27, -10.0, -10.0);
  -[TSDInteractiveCanvasController zoomWithAnimationToUnscaledRect:](self, "zoomWithAnimationToUnscaledRect:", v28.origin.x, v28.origin.y, v28.size.width, v28.size.height);
}

- (void)zoomWithAnimationToUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v8 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  objc_msgSend(v8, "minimumPinchViewScale");
  objc_msgSend(v8, "maximumPinchViewScale");
  TSUClamp();
  v10 = v9;
  v11 = TSDCenterOfRect(x, y, width, height);
  v13 = v12;
  objc_msgSend(v8, "contentInset");
  objc_msgSend(v8, "animateToViewScale:contentCenter:contentInset:duration:completionBlock:", 0, v10, v11, v13, v14, v15, v16, v17, 0.2);
}

- (BOOL)shouldZoomOnSelectionChange
{
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate zoomOnSelectionChange:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "zoomOnSelectionChange:", self);
  else
    return 0;
}

- (id)p_setSelection:(id)a3 onInfo:(id)a4 withFlags:(unint64_t)a5
{
  TSDCanvasEditor *v8;
  TSDCanvasEditor *v9;
  void *v10;
  uint64_t v11;

  if (a4)
  {
    v8 = -[TSDInteractiveCanvasController beginEditingRepForInfo:](self, "beginEditingRepForInfo:", a4);
  }
  else
  {
    -[TSDInteractiveCanvasController endEditing](self, "endEditing");
    if (!objc_msgSend(a3, "conformsToProtocol:", &unk_254F7A230))
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = -[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor");
  }
  v9 = v8;
  if (v8 && (objc_opt_respondsToSelector() & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_setSelection:onInfo:withFlags:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1399, CFSTR("editor does not implement optional protocol method"));
  }
LABEL_9:
  -[TSDCanvasEditor setSelection:withFlags:](v9, "setSelection:withFlags:", a3, a5);
  return v9;
}

- (id)infoForModel:(id)a3 withSelection:(id)a4
{
  id result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return (id)TSUProtocolCast();
  result = (id)-[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:infoForModel:withSelection:](self->mDelegate, "interactiveCanvasController:infoForModel:withSelection:", self, a3, a4);
  if (!result)
    return (id)TSUProtocolCast();
  return result;
}

- (id)infoToScrollToForModel:(id)a3 withSelection:(id)a4
{
  id result;
  id v5;

  result = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", a3);
  if (!result)
  {
    result = (id)TSUProtocolCast();
    if (result)
    {
      v5 = result;
      result = (id)objc_msgSend(result, "infoCount");
      if (result)
        return (id)objc_msgSend((id)objc_msgSend(v5, "infos"), "anyObject");
    }
  }
  return result;
}

- (void)scrollCurrentSelectionToVisible
{
  id v3;
  TSKSelection *v4;
  uint64_t v5;

  v3 = -[TSDEditorController mostSpecificCurrentEditorOfClass:](-[TSDInteractiveCanvasController editorController](self, "editorController"), "mostSpecificCurrentEditorOfClass:", 0);
  v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (TSKSelection *)objc_msgSend(v3, "selection");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "model");
    if (!v4)
    {
LABEL_7:
      v4 = -[TSDCanvasEditor selection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "selection");
      if (!v4)
        return;
    }
  }
  else
  {
    v5 = 0;
    if (!v4)
      goto LABEL_7;
  }
  -[TSDInteractiveCanvasController scrollToSelection:onModel:](self, "scrollToSelection:onModel:", v4, v5);
}

- (void)scrollSearchReferenceToVisible:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate willScrollSearchReferenceToVisible:](self->mDelegate, "willScrollSearchReferenceToVisible:", a3);
  -[TSDInteractiveCanvasController p_scrollModelToVisible:withSelection:](self, "p_scrollModelToVisible:withSelection:", objc_msgSend(a3, "model"), objc_msgSend(a3, "selection"));
}

- (void)p_scrollModelToVisible:(id)a3 withSelection:(id)a4
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  CGRect v22;

  -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  v7 = -[TSDInteractiveCanvasController infoToScrollToForModel:withSelection:](self, "infoToScrollToForModel:withSelection:", a3, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:targetRectForInfo:withSelection:](self->mDelegate, "interactiveCanvasController:targetRectForInfo:withSelection:", self, v7, a4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    v9 = *MEMORY[0x24BDBF070];
    v11 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v13 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v15 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  if (CGRectIsNull(v22))
  {
    v16 = -[TSDInteractiveCanvasController layoutForInfoNearestVisibleRect:intersectingSelection:](self, "layoutForInfoNearestVisibleRect:intersectingSelection:", v7, a4);
    if (!v16)
      v16 = -[TSDInteractiveCanvasController validatedLayoutForInfo:](self, "validatedLayoutForInfo:", -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", a3, a4));
    objc_msgSend(v16, "rectForSelection:", a4);
    objc_msgSend(v16, "rectInRoot:");
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v21 = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldAnimateToSearchReferences:](self->mDelegate, "interactiveCanvasControllerShouldAnimateToSearchReferences:", self);
  else
    v21 = 1;
  -[TSDInteractiveCanvasController scrollRectToVisibleWithSelectionOutset:animated:](self, "scrollRectToVisibleWithSelectionOutset:animated:", v21, v9, v11, v13, v15);
}

- (void)setSelection:(id)a3 onModel:(id)a4 withFlags:(unint64_t)a5
{
  uint64_t v9;
  id v10;
  TSDEditorController *v11;
  void *v12;
  uint64_t v13;
  TSDEditorController *v14;
  id v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[9];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__10;
  v30 = __Block_byref_object_dispose__10;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v9 = TSUProtocolCast();
  if (!v9)
  {
    v10 = 0;
    if ((a5 & 0x80) != 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", v9, a3);
  if ((a5 & 0x80) == 0)
  {
LABEL_5:
    v11 = -[TSDInteractiveCanvasController editorController](self, "editorController");
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke;
    v21[3] = &unk_24D82B3D0;
    v21[4] = a4;
    v21[5] = a3;
    v21[6] = v10;
    v21[7] = &v22;
    v21[8] = &v26;
    -[TSDEditorController enumerateEditorsOnStackUsingBlock:](v11, "enumerateEditorsOnStackUsingBlock:", v21);
  }
LABEL_6:
  self->mShouldAnimateAutoscroll = (a5 & 0x10) != 0;
  if (*((_BYTE *)v23 + 24))
  {
    self->mShouldAutoscrollToSelectionAfterLayout = (a5 & 0x40) >> 6;
    self->mShouldCenterSelectionWhenAutoscrolling = (~(_DWORD)a5 & 0x1000040) == 0;
    if ((a5 & 0x40) != 0)
      -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
    if (v27[5] && (objc_opt_respondsToSelector() & 1) == 0)
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setSelection:onModel:withFlags:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1529, CFSTR("editor does not implement optional protocol method"));
    }
    objc_msgSend((id)v27[5], "setSelection:withFlags:", a3, a5);
  }
  else
  {
    self->mShouldAutoscrollToSelectionAfterLayout = 0;
    self->mShouldCenterSelectionWhenAutoscrolling = 0;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    v14 = -[TSDInteractiveCanvasController editorController](self, "editorController");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke_2;
    v16[3] = &unk_24D82B3F8;
    v16[4] = a3;
    v16[5] = v10;
    v16[6] = &v17;
    -[TSDEditorController enumerateEditorsOnStackUsingBlock:](v14, "enumerateEditorsOnStackUsingBlock:", v16);
    if (*((_BYTE *)v18 + 24))
    {
      if ((a5 & 0x40) != 0)
      {
        v15 = -[TSDInteractiveCanvasController p_setSelection:onInfo:withFlags:](self, "p_setSelection:onInfo:withFlags:", a3, v10, a5);
        v27[5] = (uint64_t)v15;
        if (!v15)
          -[TSDInteractiveCanvasController endEditing](self, "endEditing");
        -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
      }
      if (!v27[5])
        -[TSDInteractiveCanvasController p_setSelection:onInfo:withFlags:](self, "p_setSelection:onInfo:withFlags:", a3, v10, a5);
    }
    _Block_object_dispose(&v17, 8);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
}

uint64_t __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "model");
    if (result == a1[4])
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) == 0
        || (result = objc_msgSend(a2, "readyToAcceptSelection:onInfo:", a1[5], a1[6]), (_DWORD)result))
      {
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
        *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) = a2;
        *a3 = 1;
      }
    }
  }
  return result;
}

uint64_t __65__TSDInteractiveCanvasController_setSelection_onModel_withFlags___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(a2, "ignoreSetSelection:onInfo:", a1[4], a1[5]);
    if ((_DWORD)result)
    {
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
      *a3 = 1;
    }
  }
  return result;
}

- (CGRect)scrollFocusRectForModel:(id)a3 withSelection:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v4 = *MEMORY[0x24BDBF070];
  v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)scrollToSelection:(id)a3 onModel:(id)a4
{
  -[TSDInteractiveCanvasController scrollToSelection:onModel:scrollImmediately:](self, "scrollToSelection:onModel:scrollImmediately:", a3, a4, 0);
}

- (void)scrollToSelection:(id)a3 onModel:(id)a4 scrollImmediately:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v8;
  id v9;

  v5 = a5;
  v8 = TSUProtocolCast();
  if (v8)
    v9 = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", v8, a3);
  else
    v9 = 0;
  -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  -[TSDInteractiveCanvasController scrollFocusRectForModel:withSelection:](self, "scrollFocusRectForModel:withSelection:", v8, a3);
  -[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:](self, "p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:", a3, v9, 0, v5, 0);
}

- (void)p_scrollToPrimarySelectionForEditor:(id)a3 skipZoom:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  uint64_t v8;

  if (a3)
  {
    v4 = a4;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(a3, "selection")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(a3, "model"))
        v7 = -[TSDInteractiveCanvasController infoToScrollToForModel:withSelection:](self, "infoToScrollToForModel:withSelection:", objc_msgSend(a3, "model"), objc_msgSend(a3, "selection"));
      else
        v7 = 0;
      v8 = objc_msgSend(a3, "selection");
      -[TSDInteractiveCanvasController scrollFocusRectForModel:withSelection:](self, "scrollFocusRectForModel:withSelection:", objc_msgSend(a3, "model"), objc_msgSend(a3, "selection"));
      -[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:](self, "p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:", v8, v7, 0, 0, v4);
    }
  }
}

- (void)scrollToPrimarySelectionForEditor:(id)a3
{
  -[TSDInteractiveCanvasController p_scrollToPrimarySelectionForEditor:skipZoom:](self, "p_scrollToPrimarySelectionForEditor:skipZoom:", a3, 0);
}

- (void)scrollToPrimarySelection
{
  -[TSDInteractiveCanvasController scrollToPrimarySelectionForEditor:](self, "scrollToPrimarySelectionForEditor:", -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor"));
}

- (void)layoutInvalidated
{
  if (!self->mStaticLayoutAndRenderOnThread)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    }
    -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  }
}

- (void)invalidateReps
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  -[TSDCanvas invalidateReps](self->mCanvas, "invalidateReps");
}

- (void)invalidateRepsIfSynced
{
  if (!self->mLayoutAndRenderOnThreadDuringScroll
    || !self->mCurrentlyWaitingOnThreadedLayoutAndRender
    || (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    -[TSDCanvas invalidateReps](self->mCanvas, "invalidateReps");
  }
}

- (void)invalidateRepsInBackground
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || (-[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread"),
         self->mLayoutAndRenderOnThreadDuringScroll))
    && -[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")
    && !self->mDisableThreadedLayoutAndRender)
  {
    -[NSRecursiveLock lock](self->mSelfSync, "lock");
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    -[TSDCanvas invalidateReps](self->mCanvas, "invalidateReps");
    -[NSRecursiveLock unlock](self->mSelfSync, "unlock");
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
  else
  {
    -[TSDCanvas invalidateReps](self->mCanvas, "invalidateReps");
  }
}

- (void)invalidateLayoutInBackground:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || (-[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread"),
         self->mLayoutAndRenderOnThreadDuringScroll))
    && -[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")
    && !self->mDisableThreadedLayoutAndRender)
  {
    -[NSRecursiveLock lock](self->mSelfSync, "lock");
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    objc_msgSend(a3, "invalidate");
    -[NSRecursiveLock unlock](self->mSelfSync, "unlock");
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
  else
  {
    objc_msgSend(a3, "invalidate");
  }
}

- (void)invalidateVisibleBoundsInBackground
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && (!self->mCurrentlyWaitingOnThreadedLayoutAndRender
     || (-[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread"),
         self->mLayoutAndRenderOnThreadDuringScroll))
    && -[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")
    && !self->mDisableThreadedLayoutAndRender)
  {
    -[NSRecursiveLock lock](self->mSelfSync, "lock");
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    -[TSDCanvas invalidateVisibleBounds](self->mCanvas, "invalidateVisibleBounds");
    -[NSRecursiveLock unlock](self->mSelfSync, "unlock");
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
  else
  {
    -[TSDCanvas invalidateVisibleBounds](self->mCanvas, "invalidateVisibleBounds");
  }
}

- (void)invalidateVisibleBounds
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread")
    && (!self->mForceTilingLayoutOnThreadWhenScrolling
     || !-[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")))
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  -[TSDCanvas invalidateVisibleBounds](self->mCanvas, "invalidateVisibleBounds");
}

- (void)invalidateLayers
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  -[TSDCanvas invalidateLayers](self->mCanvas, "invalidateLayers");
}

- (void)setShouldSuppressRendering:(BOOL)a3
{
  -[TSDInteractiveCanvasController setShouldSuppressRendering:animated:](self, "setShouldSuppressRendering:animated:", a3, 1);
}

- (void)setShouldSuppressRendering:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (self->mShouldSuppressRendering != a3)
  {
    v4 = a4;
    v5 = a3;
    self->mShouldSuppressRendering = a3;
    v7 = (void *)objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "sublayers");
    v8 = v7;
    if (v5)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v33 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "setHidden:", 1);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v10);
      }
    }
    else
    {
      if (v4)
      {
        objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
        LODWORD(v13) = 0;
        objc_msgSend(0, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v13));
      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v8);
            v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
            objc_msgSend(v18, "setHidden:", 0);
            if (v4)
              objc_msgSend(v18, "addAnimation:forKey:", 0, CFSTR("fade in"));
          }
          v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v15);
      }
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v19 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v25;
        do
        {
          for (k = 0; k != v21; ++k)
          {
            if (*(_QWORD *)v25 != v22)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * k), "recursivelyPerformSelector:", sel_setNeedsDisplay);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        }
        while (v21);
      }
    }
    -[TSDInteractiveCanvasController invalidateReps](self, "invalidateReps");
  }
}

- (void)setAllowLayoutAndRenderOnThread:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setAllowLayoutAndRenderOnThread:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1801, CFSTR("should only en/disable layoutAndRenderOnThreadDuringScroll from the MT"));
  }
  if (self->mLayoutAndRenderOnThreadDuringScroll != v3)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
      -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    self->mLayoutAndRenderOnThreadDuringScroll = v3;
  }
}

- (void)setStaticLayoutAndRenderOnThread:(BOOL)a3
{
  if (self->mStaticLayoutAndRenderOnThread != a3)
  {
    if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
      -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    self->mStaticLayoutAndRenderOnThread = a3;
  }
}

- (BOOL)p_currentlyScrolling
{
  return -[TSDInteractiveCanvasController p_currentlyScrollingIncludeEmbeddedCanvasScrolling:](self, "p_currentlyScrollingIncludeEmbeddedCanvasScrolling:", 1);
}

- (BOOL)p_currentlyScrollingIncludeEmbeddedCanvasScrolling:(BOOL)a3
{
  if (self->mCurrentlyScrolling || !a3)
  {
    if (self->mCurrentlyScrolling)
      return 1;
  }
  else if (self->mEmbeddedCanvasScrolling)
  {
    return 1;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerIsRelatedCanvasScrolling:](self->mDelegate, "interactiveCanvasControllerIsRelatedCanvasScrolling:", self);
  else
    return 0;
}

- (BOOL)keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges
{
  return self->mSuppressingKeyboard;
}

- (void)setKeyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges:(BOOL)a3
{
  BOOL v4;
  id v5;

  if (a3)
  {
    -[TSDTextInputResponder clearEditorAndResignFirstResponder](self->mTextInputResponder, "clearEditorAndResignFirstResponder");
    v4 = 1;
  }
  else
  {
    v5 = -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_254F79938))
      -[TSDTextInputResponder setEditor:](self->mTextInputResponder, "setEditor:", v5);
    v4 = 0;
  }
  self->mSuppressingKeyboard = v4;
}

- (void)reuseTextInputResponderFrom:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!*((_QWORD *)a3 + 14))
    *((_QWORD *)a3 + 14) = objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", objc_msgSend((id)objc_msgSend(a3, "layerHost"), "canvasView"));
  if (-[TSDTextInputResponder isFirstResponder](self->mTextInputResponder, "isFirstResponder"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController reuseTextInputResponderFrom:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1888, CFSTR("Unexpected -reuseTextInputResponderFrom: when first responder."));
  }
  if (-[TSDTextInputResponder isFirstResponder](self->mTextInputResponder, "isFirstResponder"))
  {
    objc_msgSend(*((id *)a3 + 14), "setEditor:", -[TSDTextInputResponder editor](self->mTextInputResponder, "editor"));
    objc_msgSend(*((id *)a3 + 14), "cancelDelayedResponderChange");
    objc_msgSend(*((id *)a3 + 14), "becomeFirstResponder");
  }

  self->mTextInputResponder = (TSDTextInputResponder *)*((id *)a3 + 14);
  self->mTextInputResponderSource = (TSDInteractiveCanvasController *)a3;
  ++*((_QWORD *)a3 + 16);
}

- (void)resumeEditing
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController resumeEditing]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 1905, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSDInteractiveCanvasController resumeEditing]"), 0));
}

- (void)p_editorControllerDidChangeTextInputEditor:(id)a3
{
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", MEMORY[0x24BDAC760], 3221225472, __77__TSDInteractiveCanvasController_p_editorControllerDidChangeTextInputEditor___block_invoke, &unk_24D82A5C8, a3, self))__77__TSDInteractiveCanvasController_p_editorControllerDidChangeTextInputEditor___block_invoke((uint64_t)&v3);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], &v3);
}

uint64_t __77__TSDInteractiveCanvasController_p_editorControllerDidChangeTextInputEditor___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "textInputEditor");
  v2 = TSUProtocolCast();
  if (v2 && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112))
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) = objc_msgSend(objc_alloc((Class)TSDTextInputResponderClass()), "initWithNextResponder:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "layerHost"), "canvasView"));
  return objc_msgSend(*(id *)(a1 + 40), "p_maybeSetTextResponderEditorTo:", v2);
}

- (BOOL)p_shouldSuppressAutozoomForEditor:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerSupportsAutozoom:](self->mDelegate, "interactiveCanvasControllerSupportsAutozoom:", self)&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    return objc_msgSend(a3, "suppressAutozoom");
  }
  else
  {
    return 0;
  }
}

- (void)p_editorControllerSelectionDidChange:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("TSDEditorControllerEditorKey"));
  v6 = objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("TSDEditorControllerSelectionFlagsKey")), "unsignedIntegerValue");
  -[TSDInteractiveCanvasController p_editorDidChangeSelection:withSelectionFlags:](self, "p_editorDidChangeSelection:withSelectionFlags:", v5, v6);
  if (!self->mTextGesturesInFlight)
  {
    -[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:](self, "p_editorDoneChangingSelection:withFlags:", v5, v6);
    if ((v6 & 0x40) != 0 && !self->mShouldAutoscrollToSelectionAfterLayout)
    {
      self->mShouldAnimateAutoscroll = (v6 & 0x10) != 0;
      -[TSDInteractiveCanvasController scrollToPrimarySelectionForEditor:](self, "scrollToPrimarySelectionForEditor:", v5);
    }
  }
}

- (void)p_editorControllerSelectionDidChangeAndWantsKeyboard:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("TSDEditorControllerEditorKey"));
  -[TSDInteractiveCanvasController p_editorDidChangeSelection:withSelectionFlags:](self, "p_editorDidChangeSelection:withSelectionFlags:", v5, objc_msgSend((id)objc_msgSend(v4, "objectForKey:", CFSTR("TSDEditorControllerSelectionFlagsKey")), "unsignedIntegerValue"));
  -[TSDInteractiveCanvasController p_editorDoneChangingSelection:](self, "p_editorDoneChangingSelection:", v5);
}

- (TSDCanvasView)canvasView
{
  return (TSDCanvasView *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
}

- (BOOL)canvasViewShouldBecomeFirstResponder:(id)a3
{
  -[TSDInteractiveCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:canvasViewShouldBecomeFirstResponder:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:canvasViewShouldBecomeFirstResponder:", self, -[TSDInteractiveCanvasController canvasView](self, "canvasView"));
  else
    return 1;
}

- (TSDCanvasLayer)canvasLayer
{
  return (TSDCanvasLayer *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
}

+ (id)keyPathsForValuesAffectingViewScale
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("layerHost.canvasLayer.viewScale"));
}

- (double)defaultViewScale
{
  return 0.0;
}

- (double)viewScale
{
  double result;

  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "viewScale");
  return result;
}

- (void)setViewScale:(double)a3
{
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setViewScale:", a3);
}

+ (id)keyPathsForValuesAffectingCurrentViewScale
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("layerHost.canvasLayer.viewScale"));
}

- (double)currentViewScale
{
  double result;

  if (self->mDynamicallyZooming)
    return self->mDynamicViewScale;
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "viewScale");
  return result;
}

- (double)fitWidthViewScale
{
  void *v3;
  double result;

  v3 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  -[TSDCanvas unscaledSize](self->mCanvas, "unscaledSize");
  objc_msgSend(v3, "minimumPinchViewScale");
  objc_msgSend(v3, "maximumPinchViewScale");
  TSUClamp();
  return result;
}

- (CGSize)canvasScrollingOutset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 600.0;
  v3 = 600.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldResizeCanvasToScrollView
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate shouldResizeCanvasToScrollView](self->mDelegate, "shouldResizeCanvasToScrollView");
  else
    return 0;
}

- (CGRect)canvasViewBoundsWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:canvasViewBoundsWithBounds:](self->mDelegate, "interactiveCanvasController:canvasViewBoundsWithBounds:", self, x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  double v11;
  double v12;

  v6 = a5;
  y = a4.y;
  x = a4.x;
  v11 = 0.0;
  if (a6)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDInteractiveCanvasControllerDelegate autoZoomAnimationDurationForInteractiveCanvasController:](self->mDelegate, "autoZoomAnimationDurationForInteractiveCanvasController:", self);
      v11 = v12;
    }
    else
    {
      v11 = 0.300000012;
    }
  }
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:completion:](self, "setViewScale:contentOffset:clampOffset:animationDuration:completion:", v6, 0, a3, x, y, v11);
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 completion:(id)a7
{
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:](self, "setViewScale:contentOffset:clampOffset:animationDuration:forceAnimation:completion:", a5, 0, a7, a3, a4.x, a4.y, a6);
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 clampOffset:(BOOL)a5 animationDuration:(double)a6 forceAnimation:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v9;
  double x;
  double v14;
  CGFloat v15;

  v9 = a7;
  x = a4.x;
  if (a5)
  {
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", a4.x, a4.y, a3);
    x = v14;
    a4.y = v15;
  }
  if (a6 == 0.0)
  {
    -[TSDInteractiveCanvasController p_applyViewScale:andContentOffset:](self, "p_applyViewScale:andContentOffset:", a3, x, a4.y);
    if (a8)
      (*((void (**)(id, uint64_t))a8 + 2))(a8, 1);
  }
  else
  {
    -[TSDInteractiveCanvasController animateToViewScale:contentOffset:duration:forceAnimation:completion:](self, "animateToViewScale:contentOffset:duration:forceAnimation:completion:", v9, a8, a3, x, a4.y, a6);
  }
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4
{
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend((id)-[TSDCanvasLayerHosting clippingLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "clippingLayer"), "bounds");
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:](self, "clampedUnscaledContentOffset:forViewScale:scrollViewBoundsSize:", x, y, a4, v8, v9);
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)clampedUnscaledContentOffset:(CGPoint)a3 forViewScale:(double)a4 scrollViewBoundsSize:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGPoint result;

  height = a5.height;
  width = a5.width;
  v9 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  TSDMultiplySizeScalar(width, height, 1.0 / a4);
  objc_msgSend(v9, "unscaledSize");
  objc_msgSend(v9, "contentInset");
  TSUClamp();
  v11 = v10;
  TSUClamp();
  v13 = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:clampContentOffset:forViewScale:scrollViewBoundsSize:](self->mDelegate, "interactiveCanvasController:clampContentOffset:forViewScale:scrollViewBoundsSize:", self, TSDMultiplyPointScalar(v11, v13, a4));
LABEL_5:
    v11 = TSDMultiplyPointScalar(v14, v15, 1.0 / a4);
    v13 = v16;
    goto LABEL_6;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:clampContentOffset:forViewScale:](self->mDelegate, "interactiveCanvasController:clampContentOffset:forViewScale:", self, TSDMultiplyPointScalar(v11, v13, a4));
    goto LABEL_5;
  }
LABEL_6:
  v17 = v11;
  v18 = v13;
  result.y = v18;
  result.x = v17;
  return result;
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 maintainPosition:(BOOL)a5 animated:(BOOL)a6
{
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setViewScale:andScrollViewFrame:maintainPosition:animated:", a5, a6, a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (void)setViewScale:(double)a3 andScrollViewFrame:(CGRect)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  double height;
  double width;
  double y;
  double x;
  uint64_t v12;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v12 = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerShouldMaintainPositionOnSetViewScale:", self);
  else
    v12 = 1;
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setViewScale:andScrollViewFrame:maintainPosition:animated:", v12, v5, a3, x, y, width, height);
}

- (CGRect)unobscuredFrameOfView:(id)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect result;

  v36 = *MEMORY[0x24BDAC8D0];
  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController unobscuredFrameOfView:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2159, CFSTR("Cannot calculate unobscured frame without view"));
  }
  objc_msgSend(a3, "frame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v15, "addObjectsFromArray:", -[TSDInteractiveCanvasControllerDelegate rectanglesObscuringView:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "rectanglesObscuringView:", a3));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v32 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "CGRectValue");
        v8 = TSDRectSubtractingRect(v8, v10, v12, v14, v20, v21, v22, v23);
        v10 = v24;
        v12 = v25;
        v14 = v26;
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v17);
  }
  v27 = v8;
  v28 = v10;
  v29 = v12;
  v30 = v14;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)wantsUpdatedScrollIndicatorInsets
{
  return 1;
}

- (void)unobscuredFrameDidChange
{
  TSKScrollView *v3;
  TSKScrollView *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double MaxX;
  double v22;
  double MaxY;
  double v24;
  double MinX;
  double v26;
  double MinY;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v3 = -[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView");
  if (v3)
  {
    v4 = v3;
    -[TSDInteractiveCanvasController unobscuredFrameOfView:](self, "unobscuredFrameOfView:", v3);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TSDInteractiveCanvasController setUnobscuredScrollViewFrame:](self, "setUnobscuredScrollViewFrame:");
    if (-[TSDInteractiveCanvasController wantsUpdatedScrollIndicatorInsets](self, "wantsUpdatedScrollIndicatorInsets"))
    {
      -[TSKScrollView frame](v4, "frame");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v29.origin.x = v6;
      v29.origin.y = v8;
      v29.size.width = v10;
      v29.size.height = v12;
      MinY = CGRectGetMinY(v29);
      v30.origin.x = v14;
      v30.origin.y = v16;
      v30.size.width = v18;
      v30.size.height = v20;
      v28 = MinY - CGRectGetMinY(v30);
      v31.origin.x = v6;
      v31.origin.y = v8;
      v31.size.width = v10;
      v31.size.height = v12;
      MinX = CGRectGetMinX(v31);
      v32.origin.x = v14;
      v32.origin.y = v16;
      v32.size.width = v18;
      v32.size.height = v20;
      v26 = MinX - CGRectGetMinX(v32);
      v33.origin.x = v14;
      v33.origin.y = v16;
      v33.size.width = v18;
      v33.size.height = v20;
      MaxY = CGRectGetMaxY(v33);
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      v24 = MaxY - CGRectGetMaxY(v34);
      v35.origin.x = v14;
      v35.origin.y = v16;
      v35.size.width = v18;
      v35.size.height = v20;
      MaxX = CGRectGetMaxX(v35);
      v36.origin.x = v6;
      v36.origin.y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      v22 = MaxX - CGRectGetMaxX(v36);
      -[TSKScrollView setContentInset:](v4, "setContentInset:", v28, v26, v24, v22);
      -[TSKScrollView setScrollIndicatorInsets:](v4, "setScrollIndicatorInsets:", v28, v26, v24, v22);
    }
  }
}

- (CGRect)unobscuredScrollViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectEqualToRect(self->mUnobscuredScrollViewFrame, *MEMORY[0x24BDBF090]))
  {
    -[TSKScrollView frame](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "frame");
  }
  else
  {
    x = self->mUnobscuredScrollViewFrame.origin.x;
    y = self->mUnobscuredScrollViewFrame.origin.y;
    width = self->mUnobscuredScrollViewFrame.size.width;
    height = self->mUnobscuredScrollViewFrame.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double x;
  double y;
  double width;
  double height;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  double v73;
  double v74;
  double MaxX;
  double MinX;
  double v77;
  CGFloat v78;
  double v79;
  double v80;
  CGFloat v81;
  CGFloat v82;
  CGFloat v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  CGFloat v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  double MaxY;
  double MinY;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  CGFloat v105;
  double v106;
  double v107;
  double v108;
  CGFloat v109;
  CGFloat v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  CGFloat v124;
  double v126;
  CGFloat v127;
  CGFloat rect;
  double rect_8;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;

  v4 = a4;
  v6 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  if (v9 == 0.0 && v7 == 0.0)
  {
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
  }
  else
  {
    objc_msgSend(v6, "bounds");
    v18 = v17;
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    v15 = v18 / v19;
    objc_msgSend(v6, "bounds");
    v21 = v20;
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    v16 = v21 / v22;
  }
  objc_msgSend(v6, "unscaledSize");
  v24 = v23;
  v26 = v25;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v28 = v26 - (v8 + v12) / v27;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v178.size.width = v24 - (v10 + v14) / v29;
  v178.origin.x = v15;
  v178.origin.y = v16;
  v178.size.height = v28;
  v130 = CGRectIntersection(a3, v178);
  x = v130.origin.x;
  y = v130.origin.y;
  width = v130.size.width;
  height = v130.size.height;
  if (CGRectIsEmpty(v130))
    return;
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self, "convertUnscaledToBoundsRect:", x, y, width, height);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
  v43 = (void *)objc_msgSend(v42, "enclosingScrollView");
  objc_msgSend(v42, "convertRect:toView:", objc_msgSend(v43, "contentView"), v35, v37, v39, v41);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self, "canvas"), "contentsScale");
  rect_8 = TSDRoundedRectForScale(v45, v47, v49, v51, v52);
  v54 = v53;
  v56 = v55;
  v58 = v57;
  *(double *)&v59 = 0.0;
  v124 = v57;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDInteractiveCanvasControllerDelegate autoZoomAnimationDurationForInteractiveCanvasController:](self->mDelegate, "autoZoomAnimationDurationForInteractiveCanvasController:", self);
    else
      *(double *)&v59 = 0.300000012;
    v58 = v124;
  }
  v122 = *(double *)&v59;
  -[TSDInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
  objc_msgSend((id)objc_msgSend(v43, "contentView"), "convertRect:fromView:", objc_msgSend(v43, "superview"), v60, v61, v62, v63);
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v71 = v70;
  objc_msgSend(v43, "contentOffset");
  v73 = v72;
  v123 = v74;
  rect = v65;
  v131.origin.x = v65;
  v131.origin.y = v67;
  v131.size.width = v69;
  v131.size.height = v71;
  MaxX = CGRectGetMaxX(v131);
  v132.origin.x = rect_8;
  v132.origin.y = v54;
  v132.size.width = v56;
  v132.size.height = v58;
  v126 = v73;
  v127 = v71;
  if (MaxX <= CGRectGetMaxX(v132))
    goto LABEL_15;
  v133.origin.x = rect;
  v133.origin.y = v67;
  v133.size.width = v69;
  v133.size.height = v71;
  MinX = CGRectGetMinX(v133);
  v134.origin.x = rect_8;
  v134.origin.y = v54;
  v134.size.width = v56;
  v134.size.height = v58;
  if (MinX <= CGRectGetMinX(v134))
  {
LABEL_15:
    v141.origin.x = rect;
    v141.origin.y = v67;
    v141.size.width = v69;
    v141.size.height = v71;
    v80 = CGRectGetMinX(v141);
    v142.origin.x = rect_8;
    v142.origin.y = v54;
    v142.size.width = v56;
    v142.size.height = v58;
    if (v80 >= CGRectGetMinX(v142))
    {
      v83 = rect;
      v78 = rect_8;
      v82 = v71;
      goto LABEL_25;
    }
    v143.origin.x = rect;
    v143.origin.y = v67;
    v143.size.width = v69;
    v143.size.height = v71;
    v115 = CGRectGetMaxX(v143);
    v78 = rect_8;
    v144.origin.x = rect_8;
    v144.origin.y = v54;
    v144.size.width = v56;
    v144.size.height = v58;
    v81 = CGRectGetMaxX(v144);
    v82 = v71;
    v83 = rect;
    if (v115 >= v81)
      goto LABEL_25;
    v145.origin.x = rect_8;
    v145.origin.y = v54;
    v145.size.width = v56;
    v145.size.height = v124;
    v116 = CGRectGetMinX(v145);
    v146.origin.x = rect;
    v146.origin.y = v67;
    v146.size.width = v69;
    v146.size.height = v71;
    v117 = v116 - CGRectGetMinX(v146);
    v147.origin.x = rect_8;
    v84 = v54;
    v147.origin.y = v54;
    v85 = v56;
    v147.size.width = v56;
    v147.size.height = v124;
    v86 = CGRectGetMaxX(v147);
    v148.origin.x = rect;
    v109 = v67;
    v110 = v69;
    v148.origin.y = v67;
    v148.size.width = v69;
    v148.size.height = v71;
    if (v117 >= v86 - CGRectGetMaxX(v148))
    {
      v87 = rect_8;
      v153.origin.x = rect_8;
      v153.origin.y = v84;
      v153.size.width = v56;
      v153.size.height = v124;
      v88 = CGRectGetMaxX(v153);
      v89 = v71;
      v83 = rect;
      v154.origin.x = rect;
      v90 = v67;
      v91 = v110;
      v154.origin.y = v109;
      v154.size.width = v110;
      v154.size.height = v127;
      v92 = CGRectGetMaxX(v154);
    }
    else
    {
      v87 = rect_8;
      v149.origin.x = rect_8;
      v149.origin.y = v84;
      v149.size.width = v56;
      v149.size.height = v124;
      v88 = CGRectGetMinX(v149);
      v89 = v71;
      v83 = rect;
      v150.origin.x = rect;
      v90 = v67;
      v91 = v110;
      v150.origin.y = v109;
      v150.size.width = v110;
      v150.size.height = v127;
      v92 = CGRectGetMinX(v150);
    }
    v94 = v88 - v92;
    v56 = v85;
    v54 = v84;
    v78 = v87;
    v82 = v89;
    v69 = v91;
    v67 = v90;
    v93 = v126 + v94;
  }
  else
  {
    v135.origin.x = rect;
    v135.origin.y = v67;
    v135.size.width = v69;
    v135.size.height = v71;
    v112 = CGRectGetMaxX(v135);
    v136.origin.x = rect_8;
    v136.origin.y = v54;
    v136.size.width = v56;
    v136.size.height = v58;
    v113 = v112 - CGRectGetMaxX(v136);
    v137.origin.x = rect;
    v137.origin.y = v67;
    v137.size.width = v69;
    v137.size.height = v71;
    v77 = CGRectGetMinX(v137);
    v138.origin.x = rect_8;
    v138.origin.y = v54;
    v138.size.width = v56;
    v138.size.height = v58;
    if (v113 >= v77 - CGRectGetMinX(v138))
    {
      v151.origin.x = rect;
      v151.origin.y = v67;
      v151.size.width = v69;
      v151.size.height = v71;
      v114 = CGRectGetMinX(v151);
      v78 = rect_8;
      v152.origin.x = rect_8;
      v152.origin.y = v54;
      v152.size.width = v56;
      v152.size.height = v58;
      v79 = CGRectGetMinX(v152);
    }
    else
    {
      v139.origin.x = rect;
      v139.origin.y = v67;
      v139.size.width = v69;
      v139.size.height = v71;
      v114 = CGRectGetMaxX(v139);
      v78 = rect_8;
      v140.origin.x = rect_8;
      v140.origin.y = v54;
      v140.size.width = v56;
      v140.size.height = v58;
      v79 = CGRectGetMaxX(v140);
    }
    v82 = v71;
    v83 = rect;
    v93 = v126 - (v114 - v79);
  }
  v126 = v93;
LABEL_25:
  v95 = v83;
  v96 = v67;
  v97 = v69;
  MaxY = CGRectGetMaxY(*(CGRect *)(&v82 - 3));
  v155.origin.x = v78;
  v155.origin.y = v54;
  v155.size.width = v56;
  v155.size.height = v124;
  if (MaxY <= CGRectGetMaxY(v155))
    goto LABEL_29;
  v156.origin.x = v83;
  v156.origin.y = v67;
  v156.size.width = v69;
  v156.size.height = v127;
  MinY = CGRectGetMinY(v156);
  v157.origin.x = v78;
  v157.origin.y = v54;
  v157.size.width = v56;
  v157.size.height = v124;
  if (MinY <= CGRectGetMinY(v157))
  {
LABEL_29:
    v164.origin.x = v83;
    v164.origin.y = v67;
    v164.size.width = v69;
    v164.size.height = v127;
    v103 = CGRectGetMinY(v164);
    v165.origin.x = v78;
    v165.origin.y = v54;
    v165.size.width = v56;
    v165.size.height = v124;
    if (v103 >= CGRectGetMinY(v165))
    {
      v106 = v123;
    }
    else
    {
      v166.origin.x = v83;
      v166.origin.y = v67;
      v166.size.width = v69;
      v166.size.height = v127;
      v104 = CGRectGetMaxY(v166);
      v167.origin.x = v78;
      v167.origin.y = v54;
      v167.size.width = v56;
      v167.size.height = v124;
      v105 = CGRectGetMaxY(v167);
      v106 = v123;
      if (v104 < v105)
      {
        v168.origin.x = v78;
        v168.origin.y = v54;
        v168.size.width = v56;
        v168.size.height = v124;
        v120 = CGRectGetMinY(v168);
        v169.origin.x = v83;
        v169.origin.y = v67;
        v169.size.width = v69;
        v169.size.height = v127;
        v121 = v120 - CGRectGetMinY(v169);
        v170.origin.x = v78;
        v170.origin.y = v54;
        v170.size.width = v56;
        v170.size.height = v124;
        v111 = CGRectGetMaxY(v170);
        v171.origin.x = v83;
        v171.origin.y = v67;
        v171.size.width = v69;
        v171.size.height = v127;
        if (v121 >= v111 - CGRectGetMaxY(v171))
        {
          v176.origin.x = v78;
          v176.origin.y = v54;
          v176.size.width = v56;
          v176.size.height = v124;
          v107 = CGRectGetMaxY(v176);
          v177.origin.x = v83;
          v177.origin.y = v67;
          v177.size.width = v69;
          v177.size.height = v127;
          v108 = CGRectGetMaxY(v177);
        }
        else
        {
          v172.origin.x = v78;
          v172.origin.y = v54;
          v172.size.width = v56;
          v172.size.height = v124;
          v107 = CGRectGetMinY(v172);
          v173.origin.x = v83;
          v173.origin.y = v67;
          v173.size.width = v69;
          v173.size.height = v127;
          v108 = CGRectGetMinY(v173);
        }
        v106 = v123 + v107 - v108;
      }
    }
  }
  else
  {
    v158.origin.x = v83;
    v158.origin.y = v67;
    v158.size.width = v69;
    v158.size.height = v127;
    v118 = CGRectGetMaxY(v158);
    v159.origin.x = v78;
    v159.origin.y = v54;
    v159.size.width = v56;
    v159.size.height = v124;
    v119 = v118 - CGRectGetMaxY(v159);
    v160.origin.x = v83;
    v160.origin.y = v67;
    v160.size.width = v69;
    v160.size.height = v127;
    v100 = CGRectGetMinY(v160);
    v161.origin.x = v78;
    v161.origin.y = v54;
    v161.size.width = v56;
    v161.size.height = v124;
    if (v119 >= v100 - CGRectGetMinY(v161))
    {
      v174.origin.x = v83;
      v174.origin.y = v67;
      v174.size.width = v69;
      v174.size.height = v127;
      v101 = CGRectGetMinY(v174);
      v175.origin.x = v78;
      v175.origin.y = v54;
      v175.size.width = v56;
      v175.size.height = v124;
      v102 = CGRectGetMinY(v175);
    }
    else
    {
      v162.origin.x = v83;
      v162.origin.y = v67;
      v162.size.width = v69;
      v162.size.height = v127;
      v101 = CGRectGetMaxY(v162);
      v163.origin.x = v78;
      v163.origin.y = v54;
      v163.size.width = v56;
      v163.size.height = v124;
      v102 = CGRectGetMaxY(v163);
    }
    v106 = v123 - (v101 - v102);
  }
  objc_msgSend(v43, "setContentOffset:animated:", v122 > 0.0, v126, v106);
}

- (void)scrollRectToVisibleCenter:(CGRect)a3 animated:(BOOL)a4 onlyScrollNecessaryAxes:(BOOL)a5
{
  int v5;
  _BOOL8 v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MinY;
  _BOOL4 v24;
  double MaxY;
  double MinX;
  double v27;
  _BOOL4 v28;
  double v29;
  double MaxX;
  int v31;
  int v32;
  double v33;
  double v34;
  float MidY;
  double v36;
  float MidX;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v5 = a5;
  v6 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TSDInteractiveCanvasController visibleUnscaledRectForScrollingAutomatically](self, "visibleUnscaledRectForScrollingAutomatically");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v42 = v18;
  -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
  v41 = v19;
  v39 = v20;
  v40 = TSDSubtractPoints(v13, v15, v21);
  v38 = v22;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  MinY = CGRectGetMinY(v45);
  v46.origin.x = v13;
  v46.origin.y = v15;
  v46.size.width = v17;
  v46.size.height = v42;
  if (MinY >= CGRectGetMinY(v46))
  {
    v47.origin.x = x;
    v47.origin.y = y;
    v47.size.width = width;
    v47.size.height = height;
    MaxY = CGRectGetMaxY(v47);
    v48.origin.x = v13;
    v48.origin.y = v15;
    v48.size.width = v17;
    v48.size.height = v42;
    v24 = MaxY > CGRectGetMaxY(v48);
  }
  else
  {
    v24 = 1;
  }
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MinX = CGRectGetMinX(v49);
  v50.origin.x = v13;
  v50.origin.y = v15;
  v50.size.width = v17;
  v50.size.height = v42;
  v44 = width;
  v43 = x;
  if (MinX >= CGRectGetMinX(v50))
  {
    v51.origin.x = x;
    v51.origin.y = y;
    v51.size.width = width;
    v27 = height;
    v51.size.height = height;
    MaxX = CGRectGetMaxX(v51);
    v52.origin.x = v13;
    v52.origin.y = v15;
    v29 = v17;
    v52.size.width = v17;
    v52.size.height = v42;
    v28 = MaxX > CGRectGetMaxX(v52);
  }
  else
  {
    v27 = height;
    v28 = 1;
    v29 = v17;
  }
  v31 = (v24 || v28) & ~v5;
  v32 = v31 | v28;
  if ((v31 | v24) == 1)
  {
    v33 = v43;
    v53.origin.y = y;
    v53.origin.x = v43;
    v34 = v44;
    v53.size.width = v44;
    v53.size.height = v27;
    MidY = CGRectGetMidY(v53);
    v27 = v39;
    v36 = MidY + v42 * -0.5 - v38;
    if (!v32)
      goto LABEL_12;
    goto LABEL_11;
  }
  v36 = y;
  v34 = width;
  v33 = v43;
  if (v32)
  {
LABEL_11:
    v54.origin.x = v33;
    v54.origin.y = v36;
    v54.size.width = v34;
    v54.size.height = v27;
    MidX = CGRectGetMidX(v54);
    v34 = v41;
    v33 = MidX + v29 * -0.5 - v40;
  }
LABEL_12:
  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v6, v33, v36, v34, v27);
}

- (void)scrollRectToVisibleWithSelectionOutset:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", v4);
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  -[TSDInteractiveCanvasController setContentOffset:clamp:animated:](self, "setContentOffset:clamp:animated:", 0, a4, a3.x, a3.y);
}

- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5
{
  -[TSDInteractiveCanvasController setContentOffset:clamp:animated:completionBlock:](self, "setContentOffset:clamp:animated:completionBlock:", a4, a5, 0, a3.x, a3.y);
}

- (void)setContentOffset:(CGPoint)a3 clamp:(BOOL)a4 animated:(BOOL)a5 completionBlock:(id)a6
{
  _BOOL8 v7;
  double y;
  double x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;

  v7 = a5;
  y = a3.y;
  x = a3.x;
  if (a4)
  {
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", x, y, v11);
    x = v12;
    y = v13;
  }
  -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:", x, y);
  v15 = v14;
  v17 = v16;
  v18 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
  v19 = (void *)objc_msgSend(v18, "enclosingScrollView");
  objc_msgSend(v18, "convertPoint:toView:", v19, v15, v17);
  objc_msgSend(v19, "setContentOffset:animated:completionBlock:", v7, a6);
}

- (CGPoint)contentOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
  v4 = (void *)objc_msgSend(v3, "enclosingScrollView");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "contentOffset");
    objc_msgSend(v5, "convertPoint:toView:", v3);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:");
  }
  else
  {
    v6 = *MEMORY[0x24BDBEFB0];
    v7 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)viewScaleForZoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double result;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v15 = v14;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  if (CGRectIsNull(v17))
    return v15;
  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  -[TSDCanvasLayer minimumPinchViewScale](-[TSDCanvasView canvasLayer](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "canvasLayer"), "minimumPinchViewScale");
  -[TSDCanvasLayer maximumPinchViewScale](-[TSDCanvasView canvasLayer](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "canvasLayer"), "maximumPinchViewScale");
  TSUClamp();
  return result;
}

- (BOOL)zoomToFitRect:(CGRect)a3 outset:(BOOL)a4 fitWidthOnly:(BOOL)a5 centerHorizontally:(BOOL)a6 centerVertically:(BOOL)a7 animated:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
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
  double v48;
  double v49;
  double v50;
  BOOL v51;
  double v53;
  double v54;
  double v55;
  CGRect v56;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    v25 = a3.size.height;
    v23 = a3.size.width;
    v21 = a3.origin.y;
    v19 = a3.origin.x;
  }
  if (self->mAnimatingViewScale)
    return 0;
  v56.origin.x = v19;
  v56.origin.y = v21;
  v56.size.width = v23;
  v56.size.height = v25;
  if (CGRectIsNull(v56))
    return 0;
  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  v55 = v26;
  v53 = v28;
  v54 = v27;
  -[TSDInteractiveCanvasController viewScaleForZoomToFitRect:outset:fitWidthOnly:](self, "viewScaleForZoomToFitRect:outset:fitWidthOnly:", v12, v11, x, y, width, height);
  v30 = v29;
  v31 = v53 / v29;
  v32 = (v54 / v29 - v23) * 0.5;
  if (!v10)
    v32 = 0.0;
  v33 = v19 - v32;
  v34 = (v31 - v25) * 0.5;
  if (!v9)
    v34 = 0.0;
  v35 = v21 - v34;
  v36 = (void *)-[TSKScrollView layer](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "layer");
  objc_msgSend(v36, "bounds");
  objc_msgSend(v36, "convertRect:toLayer:", -[TSDCanvasView layer](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "layer"), v37, v38, v39, v40);
  v43 = TSDSubtractPoints(v41, v42, v55);
  v45 = TSDMultiplyPointScalar(v43, v44, 1.0 / v30);
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", TSDAddPoints(v33, v35, v45));
  v47 = v46;
  v49 = v48;
  -[TSDCanvasLayer viewScale](-[TSDCanvasView canvasLayer](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "canvasLayer"), "viewScale");
  if (vabdd_f64(v50, v30) < 0.00999999978)
    return 0;
  v51 = 1;
  -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, v8, v30, v47, v49);
  return v51;
}

- (CGSize)sizeOfScrollViewEnclosingCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "frame");
  v4 = v3;
  v6 = v5;
  if (!-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting clippingLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "clippingLayer"), "frame");
    v4 = v7;
    v6 = v8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate sizeOfScrollViewEnclosingCanvas](self->mDelegate, "sizeOfScrollViewEnclosingCanvas");
  }
  else
  {
    v9 = v4;
    v10 = v6;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)setNeedsDisplayOnLayer:(id)a3
{
  void *v4;
  uint64_t v5;

  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender == objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setNeedsDisplayOnLayer:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2468, CFSTR("invaling on MT while waiting for secondary thread layout / render, or invaling on secondary thread when not waiting on a secondary thread layout / render"));
  }
  objc_msgSend(a3, "setNeedsDisplay");
}

- (void)setNeedsDisplayInRect:(CGRect)a3 onLayer:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  uint64_t v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender == objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2474, CFSTR("invaling on MT while waiting for secondary thread layout / render, or invaling on secondary thread when not waiting on a secondary thread layout / render"));
  }
  objc_msgSend(a4, "setNeedsDisplayInRect:", x, y, width, height);
}

- (CGColor)newDefaultSelectionHighlightColor
{
  return (CGColor *)TSUCGColorCreateDeviceRGB();
}

- (CGColor)selectionHighlightColor
{
  CGColor *result;

  result = self->mSelectionHighlightColor;
  if (!result)
  {
    result = -[TSDInteractiveCanvasController newDefaultSelectionHighlightColor](self, "newDefaultSelectionHighlightColor");
    self->mSelectionHighlightColor = result;
  }
  return result;
}

- (void)setSelectionHighlightColor:(CGColor *)a3
{
  CGColor *Copy;

  Copy = CGColorCreateCopy(a3);
  CGColorRelease(self->mSelectionHighlightColor);
  self->mSelectionHighlightColor = Copy;
  -[TSDInteractiveCanvasController i_invalidateSelectionHighlightLayers](self, "i_invalidateSelectionHighlightLayers");
}

- (void)displayRulerWithSlowFade:(BOOL)a3
{
  -[TSDRulerController displayRulerDragUI](-[TSDInteractiveCanvasController rulerController](self, "rulerController", a3), "displayRulerDragUI");
}

- (void)displayRulerForRect:(CGRect)a3
{
  -[TSDRulerController displayRulerDragUIForRect:](-[TSDInteractiveCanvasController rulerController](self, "rulerController"), "displayRulerDragUIForRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)hideRuler
{
  -[TSDRulerController hideRulerDragUI](-[TSDInteractiveCanvasController rulerController](self, "rulerController"), "hideRulerDragUI");
}

- (id)replaceImageController
{
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDInteractiveCanvasControllerDelegate imageReplacerForInteractiveCanvasController:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "imageReplacerForInteractiveCanvasController:", self);
  else
    return 0;
}

- (CGImage)textImageFromRect:(CGRect)a3
{
  return (CGImage *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C90], "imageWithSize:drawnUsingBlock:", &__block_literal_global_22, a3.size.width, a3.size.height), "CGImage");
}

- (BOOL)spellCheckingSupported
{
  int v3;

  v3 = -[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive");
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      LOBYTE(v3) = -[TSDInteractiveCanvasControllerDelegate spellCheckingSupported](self->mDelegate, "spellCheckingSupported");
    else
      LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)spellCheckingSuppressed
{
  int v3;

  v3 = !-[TSDInteractiveCanvasController spellCheckingSupported](self, "spellCheckingSupported");
  if ((v3 & 1) != 0)
    return 1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate spellCheckingSuppressed](self->mDelegate, "spellCheckingSuppressed") | v3;
  return 0;
}

- (BOOL)isCanvasInteractive
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate isCanvasInteractive](self->mDelegate, "isCanvasInteractive");
  else
    return 0;
}

- (BOOL)isPrinting
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate isPrintingCanvas](self->mDelegate, "isPrintingCanvas");
  else
    return 0;
}

- (BOOL)shouldShowTextOverflowGlyphs
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate shouldShowTextOverflowGlyphs](self->mDelegate, "shouldShowTextOverflowGlyphs");
  else
    return 1;
}

- (BOOL)shouldShowInstructionalText
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate shouldShowInstructionalText](self->mDelegate, "shouldShowInstructionalText");
  else
    return -[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive");
}

- (BOOL)shouldShowUserDefinedGuides
{
  return self->mShowUserDefinedGuides;
}

- (void)setShouldShowUserDefinedGuides:(BOOL)a3
{
  self->mShowUserDefinedGuides = a3;
}

- (void)pushThreadedLayoutAndRenderDisabled
{
  int mDisableThreadedLayoutAndRender;

  mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
  if (!mDisableThreadedLayoutAndRender)
  {
    mDisableThreadedLayoutAndRender = self->mLayoutAndRenderOnThreadDuringScroll;
    if (self->mLayoutAndRenderOnThreadDuringScroll)
    {
      mDisableThreadedLayoutAndRender = self->mCurrentlyWaitingOnThreadedLayoutAndRender;
      if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
      {
        -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
        mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
      }
    }
  }
  self->mDisableThreadedLayoutAndRender = mDisableThreadedLayoutAndRender + 1;
}

- (void)popThreadedLayoutAndRenderDisabled
{
  int mDisableThreadedLayoutAndRender;
  void *v4;
  uint64_t v5;

  mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender;
  if (mDisableThreadedLayoutAndRender
    || (v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController popThreadedLayoutAndRenderDisabled]"), objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2633, CFSTR("unbalanced calls to push/popThreadedLayoutAndRenderDisabled")), (mDisableThreadedLayoutAndRender = self->mDisableThreadedLayoutAndRender) != 0))
  {
    self->mDisableThreadedLayoutAndRender = mDisableThreadedLayoutAndRender - 1;
  }
}

- (void)embeddedCanvasWillBeginScrolling
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController embeddedCanvasWillBeginScrolling]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2643, CFSTR("This operation must only be performed on the main thread."));
  }
  ++self->mEmbeddedCanvasScrolling;
}

- (void)embeddedCanvasDidEndScrolling
{
  void *v3;
  uint64_t v4;
  unsigned int mEmbeddedCanvasScrolling;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController embeddedCanvasDidEndScrolling]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2649, CFSTR("This operation must only be performed on the main thread."));
  }
  mEmbeddedCanvasScrolling = self->mEmbeddedCanvasScrolling;
  if (mEmbeddedCanvasScrolling)
    self->mEmbeddedCanvasScrolling = mEmbeddedCanvasScrolling - 1;
}

- (void)forceStopScrolling
{
  void *v3;
  void *v4;
  uint64_t v5;

  if (self->mCurrentlyScrolling)
  {
    objc_opt_class();
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
    v3 = (void *)TSUDynamicCast();
    -[TSDInteractiveCanvasController contentOffset](self, "contentOffset");
    objc_msgSend(v3, "setContentOffset:");
    if (self->mCurrentlyScrolling)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController forceStopScrolling]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2665, CFSTR("scroll view should no longer be scrolling"));
    }
  }
  -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_i_viewScrollingEnded, 0);
  -[TSDInteractiveCanvasController i_viewScrollingEnded](self, "i_viewScrollingEnded");
}

- (void)toggleShouldShowUserDefinedGuides
{
  -[TSDInteractiveCanvasController setShouldShowUserDefinedGuides:](self, "setShouldShowUserDefinedGuides:", -[TSDInteractiveCanvasController shouldShowUserDefinedGuides](self, "shouldShowUserDefinedGuides") ^ 1);
}

- (void)makeUserDefinedGuidesVisible
{
  self->mShowUserDefinedGuides = 1;
  -[TSDInteractiveCanvasController invalidateLayers](self, "invalidateLayers");
}

- (TSDGuideStorage)guideStorage
{
  return 0;
}

- (CGRect)boundingRectForActiveGuidesForRect:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x24BDBF028];
  v4 = *(double *)(MEMORY[0x24BDBF028] + 8);
  v5 = *(double *)(MEMORY[0x24BDBF028] + 16);
  v6 = *(double *)(MEMORY[0x24BDBF028] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)provideDynamicGuides
{
  return 0;
}

- (id)provideUserDefinedGuides
{
  return 0;
}

- (id)localizedPercentStringForAlignmentGuide:(id)a3
{
  return 0;
}

- (NSArray)infosToDisplay
{
  return -[TSDCanvas infosToDisplay](self->mCanvas, "infosToDisplay");
}

- (void)setInfosToDisplay:(id)a3
{
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  if (self->mLayoutAndRenderOnThreadDuringScroll && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    if (-[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling"))
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setInfosToDisplay:]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2762, CFSTR("this will probably cause a hiccup"));
    }
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  v7 = -[TSDInteractiveCanvasController p_shouldLayoutAndRenderOnThread](self, "p_shouldLayoutAndRenderOnThread");
  if (!v7
    && self->mStaticLayoutAndRenderOnThread
    && self->mDisableThreadedLayoutAndRender <= 0
    && -[TSDCanvasView window](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "window"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController setInfosToDisplay:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2768, CFSTR("we want to do a static layout+render on the BG thread, but threaded layout+render is disabled"));
  }
  -[TSDCanvas i_setInfosToDisplay:updatingLayoutController:](self->mCanvas, "i_setInfosToDisplay:updatingLayoutController:", a3, 0);
  -[TSDCanvasEditor canvasInfosDidChange](self->mCanvasEditor, "canvasInfosDidChange");
  if (v7)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__TSDInteractiveCanvasController_setInfosToDisplay___block_invoke;
    v10[3] = &unk_24D829278;
    v10[4] = self;
    -[TSDInteractiveCanvasController p_acquireLockAndPerformAction:](self, "p_acquireLockAndPerformAction:", v10);
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
  else
  {
    -[TSDCanvas i_updateInfosInLayoutController](self->mCanvas, "i_updateInfosInLayoutController");
  }
}

uint64_t __52__TSDInteractiveCanvasController_setInfosToDisplay___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 418) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "i_updateInfosInLayoutController");
}

- (id)topLevelZOrderedSiblingsOfInfos:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "parentInfo");
        if (v6)
        {
          if ((void *)v9 != v6)
          {
            v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController topLevelZOrderedSiblingsOfInfos:]");
            objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2802, CFSTR("Infos supplied to topLevelZOrderedSiblingsOfInfos: should have same parent."));
          }
        }
        else
        {
          v6 = (void *)v9;
        }
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  return (id)objc_msgSend(v6, "childInfos");
}

- (id)repsForInfo:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = -[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", a3);
  if (v6)
  {
    v7 = v6;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = -[TSDInteractiveCanvasController repForLayout:](self, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11));
          if (v12)
            objc_msgSend(v5, "addObject:", v12);
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
  }
  return v5;
}

- (id)repForInfo:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  id v8;
  id result;
  int v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = -[TSDInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:");
  v8 = v7;
  if (!v7)
  {
    v8 = 0;
    if (v4)
    {
      -[TSDInteractiveCanvasController i_layout](self, "i_layout");
      v8 = -[TSDInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", a3);
    }
  }
  result = -[TSDInteractiveCanvasController repForLayout:](self, "repForLayout:", v8);
  if (result)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
    result = 0;
  if (v7 && (v10 & 1) == 0)
  {
    -[TSDInteractiveCanvasController i_layout](self, "i_layout");
    result = -[TSDInteractiveCanvasController repForLayout:](self, "repForLayout:", v8);
  }
  if (!result)
  {
    v11 = -[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", a3);
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", objc_msgSend(v11, "allObjects"));
    objc_msgSend(v12, "sortUsingSelector:", sel_orderedBefore_);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v13 = (void *)objc_msgSend(v12, "reverseObjectEnumerator", 0);
    result = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (result)
    {
      v14 = result;
      v15 = *(_QWORD *)v18;
LABEL_16:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        result = -[TSDInteractiveCanvasController repForLayout:](self, "repForLayout:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16));
        if (result)
          break;
        if (v14 == (id)++v16)
        {
          v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          result = 0;
          if (v14)
            goto LABEL_16;
          return result;
        }
      }
    }
  }
  return result;
}

- (id)repForInfo:(id)a3
{
  return -[TSDInteractiveCanvasController repForInfo:createIfNeeded:](self, "repForInfo:createIfNeeded:", a3, 0);
}

- (id)p_repForLayout:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id result;
  BOOL v8;

  v4 = a4;
  result = -[TSDCanvas repForLayout:](self->mCanvas, "repForLayout:");
  if (result)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    -[TSDInteractiveCanvasController i_layout](self, "i_layout");
    return -[TSDCanvas repForLayout:](self->mCanvas, "repForLayout:", a3);
  }
  return result;
}

- (id)repForLayout:(id)a3
{
  return -[TSDInteractiveCanvasController p_repForLayout:createIfNeeded:](self, "p_repForLayout:createIfNeeded:", a3, 0);
}

- (id)layerForRep:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController layerForRep:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2902, CFSTR("asking for layerForRep: in a non-interactive canvas"));
  }
  return (id)CFDictionaryGetValue(self->mRepLayersByRep, a3);
}

- (id)containerLayerForRep:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController containerLayerForRep:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2910, CFSTR("asking for layerForRep: in a non-interactive canvas"));
  }
  return (id)CFDictionaryGetValue(self->mContainerLayersByRep, a3);
}

- (id)repForLayer:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController repForLayer:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2917, CFSTR("asking for d_repForLayer: in a non-interactive canvas"));
  }
  return (id)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
}

- (id)repForContainerLayer:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController repForContainerLayer:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2923, CFSTR("asking for d_repForLayer: in a non-interactive canvas"));
  }
  return (id)CFDictionaryGetValue(self->mRepsByContainerLayer, a3);
}

- (void)recreateAllLayoutsAndReps
{
  -[TSDInteractiveCanvasController endEditing](self, "endEditing");
  -[TSDCanvasEditor setSelection:](self->mCanvasEditor, "setSelection:", 0);
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "pushLayoutDisabled");
  -[TSDCanvas recreateAllLayoutsAndReps](self->mCanvas, "recreateAllLayoutsAndReps");
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "popLayoutDisabled");
}

- (void)discardRepForClassChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (a3)
  {
    v5 = a3;
    v6 = (void *)objc_msgSend(a3, "parentRep");
    if (v6)
    {
      v7 = v6;
      if (objc_msgSend(v6, "conformsToProtocol:", &unk_254F75148))
      {
        objc_msgSend(v7, "removeChildRep:", a3);
      }
      else
      {
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController discardRepForClassChange:]");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2975, CFSTR("couldn't remove rep from parent"));
      }
    }
    -[TSDCanvas i_unregisterRep:](-[TSDInteractiveCanvasController canvas](self, "canvas"), "i_unregisterRep:", a3);

    -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController discardRepForClassChange:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 2963, CFSTR("invalid nil value for '%s'"), "rep");
  }
}

- (CGRect)visibleBoundsRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleBoundsRectUsingSizeOfEnclosingScrollView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:", 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)p_visibleBoundsRectUsingSizeOfEnclosingScrollView:(BOOL)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect result;
  CGRect v59;
  CGRect v60;

  v4 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3), "canvasLayer");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = (void *)-[TSDCanvasLayerHosting clippingLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "clippingLayer");
    objc_opt_class();
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
    v15 = (void *)TSUDynamicCast();
    if (v14)
    {
      objc_msgSend(v14, "bounds");
    }
    else
    {
      v20 = v15;
      v21 = (void *)objc_msgSend(v15, "contentView");
      -[TSDInteractiveCanvasController unobscuredScrollViewFrame](self, "unobscuredScrollViewFrame");
      objc_msgSend(v21, "convertRect:fromView:", objc_msgSend(v20, "superview"), v22, v23, v24, v25);
    }
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v29 = v19;
    -[TSDInteractiveCanvasController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:visibleBoundsWithClippingLayerBounds:canvasBounds:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:visibleBoundsWithClippingLayerBounds:canvasBounds:", self, v26, v27, v28, v29, v7, v9, v11, v13);
    }
    else
    {
      if (v14
        && ((objc_msgSend(v14, "masksToBounds") & 1) != 0
         || (-[TSDInteractiveCanvasController delegate](self, "delegate"), (objc_opt_respondsToSelector() & 1) != 0)
         && -[TSDInteractiveCanvasControllerDelegate shouldClipToScrollViewBoundsInVisibleBounds](-[TSDInteractiveCanvasController delegate](self, "delegate"), "shouldClipToScrollViewBoundsInVisibleBounds")))
      {
        objc_msgSend(v14, "convertRect:fromLayer:", v5, v7, v9, v11, v13);
        v59.origin.x = v26;
        v59.origin.y = v27;
        v59.size.width = v28;
        v59.size.height = v29;
        v55 = CGRectIntersection(v54, v59);
        v34 = v14;
      }
      else
      {
        -[TSDInteractiveCanvasController delegate](self, "delegate");
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v35 = (void *)-[TSDInteractiveCanvasControllerDelegate visibleBoundsClipViewForInteractiveCanvasController:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "visibleBoundsClipViewForInteractiveCanvasController:", self);
        else
          v35 = (void *)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "window");
        v36 = (void *)objc_msgSend(v35, "layer");
        if (!v36)
          goto LABEL_20;
        v37 = v36;
        objc_msgSend(v36, "convertRect:fromLayer:", v5, v7, v9, v11, v13);
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        objc_msgSend(v37, "bounds");
        v60.origin.x = v46;
        v60.origin.y = v47;
        v60.size.width = v48;
        v60.size.height = v49;
        v56.origin.x = v39;
        v56.origin.y = v41;
        v56.size.width = v43;
        v56.size.height = v45;
        v55 = CGRectIntersection(v56, v60);
        v34 = v37;
      }
      objc_msgSend(v34, "convertRect:toLayer:", v5, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
    }
    v7 = v30;
    v9 = v31;
    v11 = v32;
    v13 = v33;
  }
  else
  {
    v7 = *MEMORY[0x24BDBF028];
    v9 = *(double *)(MEMORY[0x24BDBF028] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF028] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF028] + 24);
  }
LABEL_20:
  v57.origin.x = v7;
  v57.origin.y = v9;
  v57.size.width = v11;
  v57.size.height = v13;
  if (CGRectIsNull(v57))
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v50 = v7;
  v51 = v9;
  v52 = v11;
  v53 = v13;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (CGRect)visibleBoundsRectClippedToWindow
{
  double x;
  double y;
  double width;
  double height;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  x = v30.origin.x;
  y = v30.origin.y;
  width = v30.size.width;
  height = v30.size.height;
  if (!CGRectIsEmpty(v30))
  {
    v7 = -[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
    v8 = (void *)objc_msgSend((id)-[TSDCanvasView window](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "window"), "layer");
    if (v7)
    {
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "convertRect:fromLayer:", v7, x, y, width, height);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v9, "bounds");
        v34.origin.x = v18;
        v34.origin.y = v19;
        v34.size.width = v20;
        v34.size.height = v21;
        v31.origin.x = v11;
        v31.origin.y = v13;
        v31.size.width = v15;
        v31.size.height = v17;
        v32 = CGRectIntersection(v31, v34);
        objc_msgSend(v9, "convertRect:toLayer:", v7, v32.origin.x, v32.origin.y, v32.size.width, v32.size.height);
        x = v22;
        y = v23;
        width = v24;
        height = v25;
      }
    }
  }
  v26 = x;
  v27 = y;
  v28 = width;
  v29 = height;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (CGRect)visibleBoundsRectForTiling
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  -[TSDInteractiveCanvasController p_visibleBoundsRectForTiling](self, "p_visibleBoundsRectForTiling");
  if (CGRectIsNull(v19))
  {
    -[TSDInteractiveCanvasController p_calculateVisibleBoundsRectForTiling](self, "p_calculateVisibleBoundsRectForTiling");
    -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:");
  }
  -[TSDInteractiveCanvasController p_visibleBoundsRectForTiling](self, "p_visibleBoundsRectForTiling");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:expandVisibleBoundsForTiling:](self->mDelegate, "interactiveCanvasController:expandVisibleBoundsForTiling:", self, v4, v6, v8, v10);
    v4 = v11;
    v6 = v12;
    v8 = v13;
    v10 = v14;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)p_calculateVisibleBoundsRectForTiling
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDInteractiveCanvasController p_visibleBoundsRectUsingSizeOfEnclosingScrollView:](self, "p_visibleBoundsRectUsingSizeOfEnclosingScrollView:", 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)visibleUnscaledRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v7;
  CGRect result;

  -[TSDInteractiveCanvasController p_visibleUnscaledRect](self, "p_visibleUnscaledRect");
  if (CGRectIsNull(v7))
  {
    -[TSDInteractiveCanvasController p_calculateVisibleUnscaledRect](self, "p_calculateVisibleUnscaledRect");
    -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:");
  }
  -[TSDInteractiveCanvasController p_visibleUnscaledRect](self, "p_visibleUnscaledRect");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)p_calculateVisibleUnscaledRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)allowAutoscroll
{
  return 1;
}

- (BOOL)allowNegativeAutoscroll
{
  return 1;
}

- (CGRect)convertUnscaledToBoundsRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsInfinite(a3))
  {
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    x = TSDMultiplyRectScalar(x, y, width, height, v8);
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)convertBoundsToUnscaledRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsInfinite(a3))
  {
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    x = TSDMultiplyRectScalar(x, y, width, height, 1.0 / v8);
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGPoint)convertUnscaledToBoundsPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v6 = TSDMultiplyPointScalar(x, y, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)convertBoundsToUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v6 = TSDMultiplyPointScalar(x, y, 1.0 / v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGSize)convertUnscaledToBoundsSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v6 = TSDMultiplySizeScalar(width, height, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)convertBoundsToUnscaledSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  v6 = TSDMultiplySizeScalar(width, height, 1.0 / v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)unitFormatter
{
  id result;

  result = self->mUnitFormatter;
  if (!result)
  {
    result = (id)objc_msgSend(+[TSKRulerUnits instance](TSKRulerUnits, "instance"), "formatter:lenient:", 0, 0);
    self->mUnitFormatter = (NSFormatter *)result;
  }
  return result;
}

- (id)unitStringForPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  BOOL v14;
  void *v15;
  id v16;
  double v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v6 = +[TSKRulerUnits instance](TSKRulerUnits, "instance");
  v7 = -[TSDInteractiveCanvasController unitFormatter](self, "unitFormatter");
  objc_msgSend(v6, "convertPointsToRulerUnits:", x);
  v9 = v8;
  objc_msgSend(v6, "convertPointsToRulerUnits:", y);
  v11 = v10;
  v12 = objc_alloc(MEMORY[0x24BDD16E0]);
  v14 = v9 >= 0.0 || v9 <= -0.01;
  *(float *)&v13 = v9;
  if (!v14)
    *(float *)&v13 = 0.0;
  v15 = (void *)objc_msgSend(v12, "initWithFloat:", v13);
  v16 = objc_alloc(MEMORY[0x24BDD16E0]);
  v18 = v11 >= 0.0 || v11 <= -0.01;
  *(float *)&v17 = v11;
  if (!v18)
    *(float *)&v17 = 0.0;
  v19 = (void *)objc_msgSend(v16, "initWithFloat:", v17);
  v20 = objc_msgSend(v7, "stringForObjectValue:", v15);
  v21 = objc_msgSend(v7, "stringForObjectValue:", v19);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("x: %@  y: %@"), &stru_24D82FEB0, CFSTR("TSDrawables")), v20, v21);
}

- (id)unitStringForSize:(CGSize)a3
{
  double height;
  double width;
  id v6;
  id v7;
  id v8;
  double v9;
  void *v10;
  id v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  height = a3.height;
  width = a3.width;
  v6 = +[TSKRulerUnits instance](TSKRulerUnits, "instance");
  v7 = -[TSDInteractiveCanvasController unitFormatter](self, "unitFormatter");
  v8 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v6, "convertPointsToRulerUnits:", width);
  *(float *)&v9 = v9;
  v10 = (void *)objc_msgSend(v8, "initWithFloat:", v9);
  v11 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v6, "convertPointsToRulerUnits:", height);
  *(float *)&v12 = v12;
  v13 = (void *)objc_msgSend(v11, "initWithFloat:", v12);
  v14 = objc_msgSend(v7, "stringForObjectValue:", v10);
  v15 = objc_msgSend(v7, "stringForObjectValue:", v13);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("w: %@  h: %@"), &stru_24D82FEB0, CFSTR("TSDrawables")), v14, v15);
}

- (id)unitStringForNumber:(double)a3
{
  id v5;
  id v6;
  id v7;
  double v8;
  void *v9;
  uint64_t v10;

  v5 = +[TSKRulerUnits instance](TSKRulerUnits, "instance");
  v6 = -[TSDInteractiveCanvasController unitFormatter](self, "unitFormatter");
  v7 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v5, "convertPointsToRulerUnits:", a3);
  *(float *)&v8 = v8;
  v9 = (void *)objc_msgSend(v7, "initWithFloat:", v8);
  v10 = objc_msgSend(v6, "stringForObjectValue:", v9);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("%@"), &stru_24D82FEB0, CFSTR("TSDrawables")), v10);
}

- (id)unitStringForAngle:(double)a3
{
  void *v3;
  uint64_t v4;
  long double v5;
  double v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("%i\\U00B0"), &stru_24D82FEB0, CFSTR("TSDrawables"));
  TSURound();
  TSDNormalizeAngleInDegrees(v5);
  return (id)objc_msgSend(v3, "stringWithFormat:", v4, (int)v6);
}

- (id)unitStringForAngle:(double)a3 andLength:(double)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  uint64_t v12;

  v7 = +[TSKRulerUnits instance](TSKRulerUnits, "instance");
  v8 = -[TSDInteractiveCanvasController unitFormatter](self, "unitFormatter");
  v9 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(v7, "convertPointsToRulerUnits:", a4);
  *(float *)&v10 = v10;
  v11 = (void *)objc_msgSend(v9, "initWithFloat:", v10);
  v12 = objc_msgSend(v8, "stringForObjectValue:", v11);

  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("%@  l: %@"), &stru_24D82FEB0, CFSTR("TSDrawables")), -[TSDInteractiveCanvasController unitStringForAngle:](self, "unitStringForAngle:", a3), v12);
}

- (id)ancestorRepOfRep:(id)a3 orDelegateConformingToProtocol:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v7 = objc_msgSend(a3, "parentRep");
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        v9 = (void *)objc_msgSend(v8, "delegateConformingToProtocol:forRep:", a4, a3);
        if (v9)
          return v9;
        if ((objc_msgSend(v8, "conformsToProtocol:", a4) & 1) != 0)
          return v8;
        v8 = (void *)objc_msgSend(v8, "parentRep");
      }
      while (v8);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)-[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:delegateConformingToProtocol:forRep:](self->mDelegate, "interactiveCanvasController:delegateConformingToProtocol:forRep:", self, a4, a3);
  }
  return 0;
}

- (void)performBlockNextFrame:(id)a3
{
  -[TSDDisplayLinkDispatch performBlockNextFrame:](self->mDisplayLinkDispatch, "performBlockNextFrame:", a3);
}

- (TSDContainerRep)topLevelContainerRepForEditing
{
  objc_opt_class();
  -[TSDInteractiveCanvasController repForInfo:](self, "repForInfo:", -[TSDCanvasSelection container](-[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection"), "container"));
  return (TSDContainerRep *)TSUDynamicCast();
}

- (id)topLevelRepsForHitTesting
{
  TSDContainerRep *v3;

  v3 = -[TSDInteractiveCanvasController topLevelContainerRepForEditing](self, "topLevelContainerRepForEditing");
  if (v3)
    return -[TSDContainerRep childReps](v3, "childReps");
  else
    return -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps");
}

+ (double)smallRepOutsetForHitTesting
{
  return 20.0;
}

- (id)hitRep:(CGPoint)a3 withGesture:(id)a4 passingTest:(id)a5
{
  double y;
  double x;
  TSDCanvas *v10;
  id v11;
  double v12;

  y = a3.y;
  x = a3.x;
  v10 = -[TSDInteractiveCanvasController canvas](self, "canvas");
  v11 = -[TSDInteractiveCanvasController topLevelRepsForHitTesting](self, "topLevelRepsForHitTesting");
  objc_msgSend((id)objc_opt_class(), "smallRepOutsetForHitTesting");
  return -[TSDCanvas hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:](v10, "hitRep:inTopLevelReps:smallRepOutset:withGesture:passingTest:", v11, a4, a5, x, y, v12);
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;

  y = a3.y;
  x = a3.x;
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && -[TSDInteractiveCanvasController p_currentlyScrollingIncludeEmbeddedCanvasScrolling:](self, "p_currentlyScrollingIncludeEmbeddedCanvasScrolling:", 0))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController hitRep:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3410, CFSTR("unsafe to find hit reps during scroll if we layout and render on a thread during scroll"));
  }
  return -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", 0, 0, x, y);
}

- (id)hitRepsAtPoint:(CGPoint)a3 withSlop:(CGSize)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a3.y;
  x = a3.x;
  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v13, "convertNaturalPointFromUnscaledCanvas:", x, y);
        v14 = objc_msgSend(v13, "hitReps:withSlop:");
        if (v14)
          objc_msgSend(v7, "addObjectsFromArray:", v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  return v7;
}

- (void)p_recursiveHitKnobAtPoint:(CGPoint)a3 inRep:(id)a4 minDistance:(double *)a5 hitKnob:(id *)a6 hitRep:(id *)a7
{
  double y;
  double x;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  int v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  y = a3.y;
  x = a3.x;
  v41 = *MEMORY[0x24BDAC8D0];
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v12 = (void *)objc_msgSend((id)objc_msgSend(a4, "knobs"), "reverseObjectEnumerator");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
        v34 = 0.0;
        if (!*a6 || !objc_msgSend(v17, "overlapsWithKnob:"))
        {
          if ((objc_msgSend(v17, "isHitByUnscaledPoint:andRep:returningDistance:", a4, &v34, x, y) & 1) == 0)
            goto LABEL_14;
LABEL_12:
          v20 = v34;
          if (v34 >= *a5)
            goto LABEL_14;
LABEL_13:
          *a5 = v20;
          *a6 = v17;
          *a7 = a4;
          goto LABEL_14;
        }
        v18 = objc_msgSend(*a6, "obscuresKnob:", v17);
        v19 = objc_msgSend(v17, "obscuresKnob:", *a6);
        if ((objc_msgSend(v17, "isHitByUnscaledPoint:andRep:returningDistance:", a4, &v34, x, y) & 1) == 0)
          goto LABEL_14;
        if (v19)
        {
          v20 = v34;
          goto LABEL_13;
        }
        if ((v18 & 1) == 0)
          goto LABEL_12;
LABEL_14:
        ++v16;
      }
      while (v14 != v16);
      v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v40, 16, v20);
      v14 = v21;
    }
    while (v21);
  }
  v22 = (void *)TSUProtocolCast();
  if (v22)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = (void *)objc_msgSend(v22, "childReps");
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v31 != v26)
            objc_enumerationMutation(v23);
          -[TSDInteractiveCanvasController p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), a5, a6, a7, x, y);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v25);
    }
  }
}

- (id)hitKnobAtPoint:(CGPoint)a3 returningRep:(id *)a4
{
  double y;
  double x;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = 0;
  v18 = 0x47EFFFFFE0000000;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[TSDInteractiveCanvasController p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:](self, "p_recursiveHitKnobAtPoint:inRep:minDistance:hitKnob:hitRep:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12++), &v18, &v20, &v19, x, y);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v10);
  }
  if (a4)
    *a4 = v19;
  return v20;
}

- (TSDLayoutController)layoutController
{
  return -[TSDCanvas layoutController](self->mCanvas, "layoutController");
}

- (id)validatedLayoutForInfo:(id)a3
{
  if (self->mLayoutAndRenderOnThreadDuringScroll
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  return -[TSDLayoutController validatedLayoutForInfo:](-[TSDInteractiveCanvasController layoutController](self, "layoutController"), "validatedLayoutForInfo:", a3);
}

- (id)layoutsForInfo:(id)a3
{
  return -[TSDLayoutController layoutsForInfo:](-[TSDInteractiveCanvasController layoutController](self, "layoutController"), "layoutsForInfo:", a3);
}

- (id)layoutsForModel:(id)a3 withSelection:(id)a4
{
  id result;

  result = -[TSDInteractiveCanvasController infoForModel:withSelection:](self, "infoForModel:withSelection:", a3, a4);
  if (result)
    return -[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", result);
  return result;
}

- (id)layoutForInfo:(id)a3
{
  return -[TSDLayoutController layoutForInfo:](-[TSDInteractiveCanvasController layoutController](self, "layoutController"), "layoutForInfo:", a3);
}

- (id)layoutForModel:(id)a3 withSelection:(id)a4
{
  return (id)objc_msgSend(-[TSDInteractiveCanvasController layoutsForModel:withSelection:](self, "layoutsForModel:withSelection:", a3, a4), "anyObject");
}

- (id)layoutsForInfo:(id)a3 intersectingSelection:(id)a4
{
  id v5;
  _QWORD v7[5];

  v5 = -[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", a3);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__TSDInteractiveCanvasController_layoutsForInfo_intersectingSelection___block_invoke;
  v7[3] = &unk_24D82B460;
  v7[4] = a4;
  return (id)objc_msgSend(v5, "objectsPassingTest:", v7);
}

void *__71__TSDInteractiveCanvasController_layoutsForInfo_intersectingSelection___block_invoke(uint64_t a1)
{
  void *result;
  CGRect v3;

  objc_opt_class();
  result = (void *)TSUDynamicCast();
  if (result)
  {
    objc_msgSend(result, "rectForSelection:", *(_QWORD *)(a1 + 32));
    return (void *)!CGRectIsNull(v3);
  }
  return result;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", a3);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v32;
  v9 = INFINITY;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v32 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      objc_msgSend(v11, "frameInRoot");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
      TSDDistanceToRectFromRect(v13, v15, v17, v19, v20, v21, v22, v23);
      if (v24 < v9)
      {
        -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
        TSDDistanceToRectFromRect(v13, v15, v17, v19, v25, v26, v27, v28);
        v9 = v29;
        v7 = v11;
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v6);
  return v7;
}

- (id)layoutForInfoNearestVisibleRect:(id)a3 intersectingSelection:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = -[TSDInteractiveCanvasController layoutsForInfo:intersectingSelection:](self, "layoutsForInfo:intersectingSelection:", a3);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v34;
  v11 = INFINITY;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v6);
      v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      objc_msgSend(v13, "rectForSelection:", a4);
      objc_msgSend(v13, "rectInRoot:");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
      TSDDistanceToRectFromRect(v15, v17, v19, v21, v22, v23, v24, v25);
      if (v26 < v11)
      {
        -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
        TSDDistanceToRectFromRect(v15, v17, v19, v21, v27, v28, v29, v30);
        v11 = v31;
        v9 = v13;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  }
  while (v8);
  return v9;
}

- (void)layoutIfNeeded
{
  if ((objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "isLayoutDisabled") & 1) == 0)
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
        -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    }
    -[TSDCanvas layoutIfNeeded](self->mCanvas, "layoutIfNeeded");
  }
}

- (void)performBlockAfterNextLayout:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *mNextLayoutBlocks;
  id v9;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController performBlockAfterNextLayout:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3573, CFSTR("This operation must only be performed on the main thread."));
  }
  if (a3)
  {
    v7 = objc_msgSend(a3, "copy");
    mNextLayoutBlocks = self->mNextLayoutBlocks;
    v9 = (id)v7;
    if (!mNextLayoutBlocks)
    {
      mNextLayoutBlocks = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = (uint64_t)v9;
      self->mNextLayoutBlocks = mNextLayoutBlocks;
    }
    -[NSMutableArray addObject:](mNextLayoutBlocks, "addObject:", v7);

  }
}

- (NSArray)additionalLayersUnderRepLayers
{
  return 0;
}

- (NSArray)additionalLayersOverRepLayers
{
  return 0;
}

- (BOOL)shouldEverShowPathHighlightOnInvisibleShapes
{
  return 1;
}

- (BOOL)shouldShowPathHighlightOnUnselectedInvisibleShapes
{
  return 0;
}

- (int)defaultKnobTypeForRep:(id)a3
{
  return 0;
}

- (BOOL)shouldShowOnRepHyperlinkUI
{
  return 0;
}

- (id)actionGhostKnobForRep:(id)a3
{
  return 0;
}

- (BOOL)shouldPopKnobsOutsideEnclosingScrollView
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate shouldPopKnobsOutsideEnclosingScrollView](self->mDelegate, "shouldPopKnobsOutsideEnclosingScrollView");
  else
    return 0;
}

- (void)setOverlayLayerSuppressed:(BOOL)a3
{
  if (self->mOverlayLayerSuppressed != a3)
  {
    self->mOverlayLayerSuppressed = a3;
    -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (void)addDecorator:(id)a3
{
  NSMutableArray *mDecorators;
  void *v6;
  uint64_t v7;

  if (a3)
  {
    mDecorators = self->mDecorators;
    if (!mDecorators)
    {
      mDecorators = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      self->mDecorators = mDecorators;
    }
    if ((-[NSMutableArray containsObject:](mDecorators, "containsObject:", a3) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->mDecorators, "addObject:", a3);
      -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController addDecorator:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3681, CFSTR("invalid nil value for '%s'"), "decorator");
  }
}

- (void)removeDecorator:(id)a3
{
  void *v5;
  uint64_t v6;

  if (a3)
  {
    if (-[NSMutableArray containsObject:](self->mDecorators, "containsObject:"))
    {
      -[NSMutableArray removeObject:](self->mDecorators, "removeObject:", a3);
      -[TSDInteractiveCanvasController invalidateLayers](self, "invalidateLayers");
    }
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController removeDecorator:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 3699, CFSTR("invalid nil value for '%s'"), "decorator");
  }
}

- (id)p_decorators
{
  return (id)-[NSMutableArray copy](self->mDecorators, "copy");
}

- (void)showOrHideComments:(id)a3
{
  -[TSDInteractiveCanvasController setShowsComments:](self, "setShowsComments:", -[TSDInteractiveCanvasController showsComments](self, "showsComments", a3) ^ 1);
}

- (BOOL)showsComments
{
  return 1;
}

- (BOOL)shouldDisplayCommentUIForInfo:(id)a3
{
  return !-[TSDInteractiveCanvasController i_inPrintPreviewMode](self, "i_inPrintPreviewMode", a3)
      && -[TSDInteractiveCanvasController showsComments](self, "showsComments");
}

- (void)invalidateComments
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController showsComments](self, "showsComments");
  -[TSDInteractiveCanvasController invalidateReps](self, "invalidateReps");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_invalidateKnobs);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * j), "recursivelyPerformSelectorIfImplemented:", sel_invalidateComments);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }
}

- (BOOL)attachedCommentsAllowedForDrawable:(id)a3
{
  return objc_msgSend(a3, "supportsAttachedComments");
}

- (id)annotationController
{
  return 0;
}

- (BOOL)hasAnnotations
{
  return objc_msgSend(-[TSDInteractiveCanvasController annotationController](self, "annotationController"), "hasAnnotations");
}

- (void)beginDynamicOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->mInDynamicOperation)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController beginDynamicOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4075, CFSTR("didn't end previous dynamic operation before starting a new one"));
  }
  if (self->mDynamicOperationCounter)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController beginDynamicOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4076, CFSTR("Inspector-driven dynamic operation in process when beginning separate dynamic operation"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate dynamicOperationWillBegin](self->mDelegate, "dynamicOperationWillBegin");
  self->mInDynamicOperation = 1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "willBeginDynamicOperation");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "setScrollEnabled:", 0);
}

- (void)endDynamicOperation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!self->mInDynamicOperation)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController endDynamicOperation]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4099, CFSTR("ending dynamic operation without starting a new one"));
  }
  if (self->mDynamicOperationCounter)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController endDynamicOperation]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4100, CFSTR("Cannot begin inspector dynamic operation while in non-inspector dynamic operation"));
  }
  self->mInDynamicOperation = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didEndDynamicOperation");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate dynamicOperationDidEnd](self->mDelegate, "dynamicOperationDidEnd");
  -[TSDCanvas layoutInvalidated](self->mCanvas, "layoutInvalidated");
  objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView"), "setScrollEnabled:", 1);
}

- (BOOL)isInDynamicOperation
{
  return self->mInDynamicOperation || self->mDynamicOperationCounter > 0;
}

- (void)beginPossiblyParallelInspectorDynamicOperation
{
  int *p_mDynamicOperationCounter;
  unsigned int v3;

  p_mDynamicOperationCounter = &self->mDynamicOperationCounter;
  do
    v3 = __ldaxr((unsigned int *)p_mDynamicOperationCounter);
  while (__stlxr(v3 + 1, (unsigned int *)p_mDynamicOperationCounter));
}

- (void)endPossiblyParallelInspectorDynamicOperation
{
  int *p_mDynamicOperationCounter;
  unsigned int v3;
  void *v4;
  uint64_t v5;

  p_mDynamicOperationCounter = &self->mDynamicOperationCounter;
  do
    v3 = __ldaxr((unsigned int *)p_mDynamicOperationCounter);
  while (__stlxr(v3 - 1, (unsigned int *)p_mDynamicOperationCounter));
  if (*p_mDynamicOperationCounter < 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController endPossiblyParallelInspectorDynamicOperation]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4133, CFSTR("Ended more dynamic operations than you began!"));
  }
}

- (BOOL)isInInspectorDynamicOperation
{
  return self->mDynamicOperationCounter > 0;
}

- (void)setInReadMode:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->mInReadMode != a3)
  {
    self->mInReadMode = a3;
    if (a3)
    {
      v20 = 0uLL;
      v21 = 0uLL;
      v18 = 0uLL;
      v19 = 0uLL;
      v4 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps");
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v19 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_willBeginReadMode);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v6);
      }
      objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "resetGesturesForContextSwitch");
    }
    else
    {
      v16 = 0uLL;
      v17 = 0uLL;
      v14 = 0uLL;
      v15 = 0uLL;
      v9 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "recursivelyPerformSelectorIfImplemented:", sel_willEndReadMode);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        }
        while (v11);
      }
    }
    -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (BOOL)usesAlternateDrawableSelectionHighlight
{
  return self->mUsesAlternateDrawableSelectionHighlight;
}

- (void)setUsesAlternateDrawableSelectionHighlight:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->mUsesAlternateDrawableSelectionHighlight != a3)
  {
    self->mUsesAlternateDrawableSelectionHighlight = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          objc_msgSend(v9, "recursivelyPerformSelectorIfImplemented:", sel_i_invalidateSelectionHighlightLayer);
          objc_msgSend(v9, "recursivelyPerformSelectorIfImplemented:", sel_invalidateKnobs);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }
    -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (void)i_invalidateSelectionHighlightLayers
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_i_invalidateSelectionHighlightLayer);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
}

- (void)beginScrollingOperation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "willBeginScrollingOperation");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (void)endScrollingOperation
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "didEndScrollingOperation");
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
}

- (void)p_beginZoomingOperation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "willBeginZoomingOperation");
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v5);
  }
  v9 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v9, "setDuration:", 0.15);
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setToValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10));
  objc_msgSend(v9, "setRemovedOnCompletion:", 0);
  objc_msgSend(v9, "setFillMode:", *MEMORY[0x24BDE5978]);
  v11 = (NSArray *)-[NSArray copy](-[CALayer sublayers](-[TSDInteractiveCanvasController overlayLayer](self, "overlayLayer"), "sublayers"), "copy");
  self->mLayersWithZoomFadeAnimation = v11;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "addAnimation:forKey:", v9, CFSTR("TSDInteractiveCanvasControllerBeginZoomingOperation"));
      }
      while (v13 != v15);
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }
}

- (void)p_endZoomingOperation
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  NSArray *mLayersWithZoomFadeAnimation;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  TSDInteractiveCanvasController *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "didEndZoomingOperation");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "layoutIfNeededIgnoringDisabledLayout");
  v9 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
  objc_msgSend(v9, "setDuration:", 0.15);
  LODWORD(v10) = 0;
  objc_msgSend(v9, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10));
  objc_msgSend(v9, "setRemovedOnCompletion:", 1);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = self;
  mLayersWithZoomFadeAnimation = self->mLayersWithZoomFadeAnimation;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](mLayersWithZoomFadeAnimation, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(mLayersWithZoomFadeAnimation);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * j);
        v17 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v16, "opacity");
        objc_msgSend(v9, "setToValue:", objc_msgSend(v17, "numberWithFloat:"));
        objc_msgSend(v16, "addAnimation:forKey:", v9, CFSTR("TSDInteractiveCanvasControllerEndZoomingOperation"));
        objc_msgSend(v16, "removeAnimationForKey:", CFSTR("TSDInteractiveCanvasControllerBeginZoomingOperation"));
      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](mLayersWithZoomFadeAnimation, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  v18->mLayersWithZoomFadeAnimation = 0;
}

- (void)setShowInvisibleObjects:(BOOL)a3
{
  if (self->mShowInvisibleObjects != a3)
  {
    self->mShowInvisibleObjects = a3;
    -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
  }
}

- (TSDDynamicOperationController)dynamicOperationController
{
  TSDDynamicOperationController *result;

  result = self->mDynOpController;
  if (!result)
  {
    result = -[TSDDynamicOperationController initWithInteractiveCanvasController:]([TSDDynamicOperationController alloc], "initWithInteractiveCanvasController:", self);
    self->mDynOpController = result;
  }
  return result;
}

- (TSDTrackerManipulatorCoordinator)tmCoordinator
{
  TSDTrackerManipulatorCoordinator *result;

  result = self->mTMCoordinator;
  if (!result)
  {
    result = objc_alloc_init(TSDTrackerManipulatorCoordinator);
    self->mTMCoordinator = result;
  }
  return result;
}

- (TSDGestureDispatcher)gestureDispatcher
{
  TSDGestureDispatcher *result;

  result = self->mGestureDispatcher;
  if (!result)
  {
    result = -[TSDGestureDispatcher initWithInteractiveCanvasController:]([TSDGestureDispatcher alloc], "initWithInteractiveCanvasController:", self);
    self->mGestureDispatcher = result;
  }
  return result;
}

- (id)hitRepChromeAtUnscaledPoint:(CGPoint)a3
{
  return 0;
}

- (void)updateSelectionForTapAtPoint:(CGPoint)a3 extendingSelection:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  TSDCanvasEditor *v8;
  void *v9;
  void *v10;
  void *v11;
  TSDCanvasSelection *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  v8 = -[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor");
  v9 = (void *)objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self, "hitRep:", x, y), "repForSelecting");
  if (v9)
  {
    v10 = v9;
    v11 = (void *)objc_msgSend(v9, "parentRepToPerformSelecting");
    if (v11)
    {
      objc_msgSend(v11, "selectChildRep:", v10);
    }
    else if (v4)
    {
      -[TSDInteractiveCanvasController endEditing](self, "endEditing");
      v12 = -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection");
      if (!v12)
        v12 = -[TSDCanvasEditor canvasSelectionWithInfos:](v8, "canvasSelectionWithInfos:", 0);
      v13 = objc_msgSend(v10, "info");
      if (objc_msgSend(v10, "isSelectedIgnoringLocking"))
        v14 = -[TSDCanvasSelection copyExcludingInfo:](v12, "copyExcludingInfo:", v13);
      else
        v14 = -[TSDCanvasSelection copyIncludingInfo:](v12, "copyIncludingInfo:", v13);
      v15 = (id)v14;
      -[TSDCanvasEditor setSelection:](v8, "setSelection:", v14);

    }
    else if ((objc_msgSend(v10, "isSelectedIgnoringLocking") & 1) != 0)
    {
      -[TSDInteractiveCanvasController updateSelectionForTapOnSelectedRep:](self, "updateSelectionForTapOnSelectedRep:", v10);
    }
    else
    {
      -[TSDInteractiveCanvasController endEditing](self, "endEditing");
      -[TSDCanvasEditor setSelectionToRep:](v8, "setSelectionToRep:", v10);
    }
  }
  else if (!v4)
  {
    -[TSDInteractiveCanvasController endEditing](self, "endEditing");
    -[TSDCanvasEditor setSelectionToInfo:](v8, "setSelectionToInfo:", 0);
  }
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDInteractiveCanvasController hitRep:](self, "hitRep:");
  v7 = (void *)objc_msgSend(v6, "repForHandleSingleTap");
  if (v7
    && (objc_msgSend(v6, "isLocked") && !objc_msgSend(v6, "wantsToHandleTapsWhenLocked")
     || (objc_msgSend(v7, "handleSingleTapAtPoint:", x, y) & 1) == 0))
  {
    -[TSDInteractiveCanvasController updateSelectionForTapAtPoint:extendingSelection:](self, "updateSelectionForTapAtPoint:extendingSelection:", 0, x, y);
  }
  return v7 != 0;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  TSDCanvasEditor *v8;

  y = a3.y;
  x = a3.x;
  v6 = (void *)objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self, "hitRep:"), "repForSelecting");
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "info"))
    {
      v8 = -[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor");
      -[TSDCanvasEditor setSelection:](v8, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v8, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_msgSend(v7, "info"))));
    }
    if ((objc_msgSend(v7, "isLocked") & 1) == 0)
      objc_msgSend(v7, "handleDoubleTapAtPoint:", x, y);
  }
  return v7 != 0;
}

- (void)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y;
  double x;
  int v6;
  BOOL v7;
  TSDCanvasSelection *v8;
  TSDInteractiveCanvasControllerDelegate **p_mDelegate;
  BOOL v10;
  int v11;
  void *v12;

  y = a3.y;
  x = a3.x;
  if (-[TSDCanvasEditor selection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "selection"))
    v6 = !-[TSDCanvasSelection isEmpty](-[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection"), "isEmpty");
  else
    v6 = 0;
  -[TSDCanvasEditor setSelection:](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "setSelection:", 0);
  v7 = -[TSDInteractiveCanvasController p_endEditingToBeginEditingRep:](self, "p_endEditingToBeginEditingRep:", 0);
  v8 = -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "canvasSelection");
  if (v8 && -[TSDCanvasSelection infoCount](v8, "infoCount"))
  {
    p_mDelegate = &self->mDelegate;
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v10 = 0;
  }
  else
  {
    p_mDelegate = &self->mDelegate;
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (v7)
        return;
      goto LABEL_12;
    }
    v10 = !v7;
  }
  if (!-[TSDInteractiveCanvasControllerDelegate tappedCanvasBackgroundAtPoint:](*p_mDelegate, "tappedCanvasBackgroundAtPoint:", x, y)&& v10)
  {
LABEL_12:
    v11 = objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "contextMenuMightBeDisplayed") | v6;
    v12 = (void *)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC");
    if (v11 == 1)
      objc_msgSend(v12, "hideEditMenu");
    else
      objc_msgSend(v12, "showEditMenu:", 0);
  }
}

- (id)gestureTargetStack:(id)a3
{
  void *v5;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "array");
  if (-[TSDInteractiveCanvasController currentlyScrolling](self, "currentlyScrolling"))
  {
    -[TSDInteractiveCanvasController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      return (id)-[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:gestureTargetStackWhenScrollingWithGesture:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:gestureTargetStackWhenScrollingWithGesture:", self, a3);
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:primaryTargetForGesture:](self->mDelegate, "interactiveCanvasController:primaryTargetForGesture:", self, a3);
      if (v7)
        objc_msgSend(v5, "addObject:", v7);
    }
    -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor");
    v8 = TSUProtocolCast();
    if (v8)
      objc_msgSend(v5, "addObject:", v8);
    objc_msgSend(a3, "unscaledLocationForICC:", self);
    v10 = v9;
    v12 = v11;
    v13 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", a3, &__block_literal_global_723);
    v14 = TSUProtocolCast();
    if (v14)
    {
      v15 = v14;
      do
      {
        objc_msgSend(v5, "addObject:", v15);
        v13 = (id)objc_msgSend(v13, "parentRep");
        v15 = TSUProtocolCast();
      }
      while (v15);
    }
    v16 = -[TSDInteractiveCanvasController hitRep:withGesture:passingTest:](self, "hitRep:withGesture:passingTest:", a3, &__block_literal_global_724, v10, v12);
    v17 = objc_msgSend(v16, "parentRep");
    if (v17)
    {
      v18 = (void *)v17;
      do
      {
        v19 = TSUProtocolCast();
        if (v19)
        {
          v20 = v19;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (objc_msgSend(v18, "canHandleGesture:forChildRep:", a3, v16))
              objc_msgSend(v5, "addObject:", v20);
          }
        }
        v18 = (void *)objc_msgSend(v18, "parentRep");
      }
      while (v18);
    }
    v21 = TSUProtocolCast();
    if (v21)
      objc_msgSend(v5, "addObject:", v21);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v22 = -[TSDInteractiveCanvasControllerDelegate additionalGestureTargetsForInteractiveCanvasController:gesture:](self->mDelegate, "additionalGestureTargetsForInteractiveCanvasController:gesture:", self, a3);
      if (v22)
        objc_msgSend(v5, "addObjectsFromArray:", v22);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:updateGestureTargetStack:gesture:](self->mDelegate, "interactiveCanvasController:updateGestureTargetStack:gesture:", self, v5, a3);
  }
  return v5;
}

uint64_t __53__TSDInteractiveCanvasController_gestureTargetStack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_254FA1B20);
}

uint64_t __53__TSDInteractiveCanvasController_gestureTargetStack___block_invoke_2()
{
  return 1;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  TSDCanvasAnimation *mCurrentAnimation;
  __CFDictionary *mRepsByRepLayer;
  __CFDictionary *mRepsByContainerLayer;

  mCurrentAnimation = self->mCurrentAnimation;
  if (mCurrentAnimation)
    return -[TSDCanvasAnimation actionForLayer:forKey:](mCurrentAnimation, "actionForLayer:forKey:", a3, a4);
  mRepsByRepLayer = self->mRepsByRepLayer;
  if (mRepsByRepLayer && CFDictionaryGetValue(mRepsByRepLayer, a3))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  mRepsByContainerLayer = self->mRepsByContainerLayer;
  if (mRepsByContainerLayer)
  {
    if (CFDictionaryGetValue(mRepsByContainerLayer, a3))
      return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  if (self->mRepContainerLayer == a3
    || self->mOverlayLayer == a3
    || (CALayer *)objc_msgSend(a3, "superlayer", a3, a4) == self->mOverlayLayer
    || !objc_msgSend(a3, "superlayer")
    || self->mPopoutLayer == a3
    || (CALayer *)objc_msgSend(a3, "superlayer") == self->mPopoutLayer)
  {
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  else
  {
    return 0;
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  uint64_t v5;
  TSKAccessController *v6;
  void *v7;
  uint64_t v8;

  if (!self->mShouldSuppressRendering)
  {
    v5 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", a3, CFSTR("TSDInteractiveCanvasControllerLayerKey"), objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", a4), CFSTR("TSDInteractiveCanvasControllerContextKey"), 0);
    if (+[TSDTilingBackgroundQueue isHoldingReadLockFromBackgroundQueue](TSDTilingBackgroundQueue, "isHoldingReadLockFromBackgroundQueue"))
    {
      -[TSDInteractiveCanvasController p_drawLayerWithReadLock:](self, "p_drawLayerWithReadLock:", v5);
    }
    else
    {
      v6 = -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
      if (!v6)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController drawLayer:inContext:]");
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4621, CFSTR("invalid nil value for '%s'"), "ac");
      }
      -[TSKAccessController performRead:withTarget:argument:](v6, "performRead:withTarget:argument:", sel_p_drawLayerWithReadLock_, self, v5);
    }
  }
}

- (BOOL)shouldLayoutTilingLayer:(id)a3
{
  if ((objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost", a3), "canvasLayer"), "isLayoutDisabled") & 1) != 0|| self->mAnimatingViewScale)
  {
    return 0;
  }
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread")
    && self->mForceTilingLayoutOnThreadWhenScrolling
    && self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    return !-[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling");
  }
  return 1;
}

- (CGRect)visibleBoundsForTilingLayer:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;
  CGRect v23;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController visibleBoundsForTilingLayer:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4639, CFSTR("invalid nil value for '%s'"), "layer");
  }
  v7 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  objc_msgSend(a3, "bounds");
  objc_msgSend(v7, "convertRect:fromLayer:", a3);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[TSDInteractiveCanvasController visibleBoundsRectForTiling](self, "visibleBoundsRectForTiling");
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  v21 = CGRectIntersection(v20, v23);
  objc_msgSend(v7, "convertRect:toLayer:", a3, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)canDrawTilingLayerInBackground:(id)a3
{
  int v5;
  void *Value;

  v5 = -[TSDInteractiveCanvasController supportsBackgroundTileRendering](self, "supportsBackgroundTileRendering");
  if (v5)
  {
    Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
    if (Value)
      LOBYTE(v5) = objc_msgSend(Value, "canDrawTilingLayerInBackground:", a3);
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)shouldBeginDrawingTilingLayerInBackground:(id)a3 returningToken:(id *)a4 andQueue:(id *)a5
{
  void *Value;
  void *v8;
  id v9;

  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  v8 = Value;
  if (Value)
  {
    v9 = Value;
    *a4 = v8;
    *a5 = (id)objc_msgSend(v8, "i_tileQueue");
  }
  return v8 != 0;
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  if (Value)
    LOBYTE(Value) = objc_msgSend(Value, "mustDrawOnMainThreadForInteractiveCanvas");
  return (char)Value;
}

- (id)queueForDrawingTilingLayerInBackground:(id)a3
{
  void *Value;

  Value = (void *)CFDictionaryGetValue(self->mRepsByRepLayer, a3);
  if (-[TSDInteractiveCanvasController supportsBackgroundTileRendering](self, "supportsBackgroundTileRendering")
    && (objc_msgSend(Value, "mustDrawOnMainThreadForInteractiveCanvas") & 1) == 0)
  {
    return (id)objc_msgSend(Value, "i_tileQueue");
  }
  else
  {
    return 0;
  }
}

- (void)backgroundLayoutAndRenderState:(id)a3 performWorkInBackgroundTilingOnly:(BOOL)a4
{
  void *v6;
  uint64_t v7;
  TSKAccessController *v8;
  _QWORD v9[5];
  BOOL v10;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:performWorkInBackgroundTilingOnly:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4748, CFSTR("should be called on a BG thread"));
  }
  v8 = -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke;
  v9[3] = &unk_24D82B4E8;
  v9[4] = self;
  v10 = a4;
  -[TSKAccessController performRead:](v8, "performRead:", v9);
}

uint64_t __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];
  char v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke_2;
  v3[3] = &unk_24D82B4E8;
  v3[4] = v1;
  v4 = *(_BYTE *)(a1 + 40);
  return objc_msgSend(v1, "p_acquireLockAndPerformAction:", v3);
}

uint64_t __99__TSDInteractiveCanvasController_backgroundLayoutAndRenderState_performWorkInBackgroundTilingOnly___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  double v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v37;
  CGRect v38;
  CGRect v39;

  v37 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 418))
  {
    v1 = result;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "activateBackground:", 1);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 16), "topLevelReps");
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v32 != v5)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_willLayoutAndRenderInBackground);
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v4);
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "layerHost"), "canvasLayer"), "setNeedsLayoutForTilingLayers");
    if (!*(_BYTE *)(v1 + 40))
    {
      objc_msgSend(*(id *)(v1 + 32), "layoutIfNeeded");
      v26 = v1;
      if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 432), "count"))
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("opacity"));
        LODWORD(v8) = 0;
        objc_msgSend(v7, "setFromValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8));
        v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 32), "layerHost"), "clippingLayer");
        objc_msgSend(v9, "bounds");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v18 = *(void **)(*(_QWORD *)(v1 + 32) + 432);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          do
          {
            for (j = 0; j != v20; ++j)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
              if ((objc_msgSend(v23, "isHidden") & 1) == 0)
              {
                v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:performWorkInBackgroundTilingOnly:]_block_invoke_2");
                objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4774, CFSTR("should have hidden this layer just after creating it"));
              }
              objc_msgSend(v23, "bounds");
              objc_msgSend(v9, "convertRect:fromLayer:", v23);
              v39.origin.x = v11;
              v39.origin.y = v13;
              v39.size.width = v15;
              v39.size.height = v17;
              if (CGRectIntersectsRect(v38, v39))
                objc_msgSend(v23, "addAnimation:forKey:", v7, CFSTR("fade in"));
              objc_msgSend(v23, "setHidden:", 0);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v20);
        }
      }
      v1 = v26;

      *(_QWORD *)(*(_QWORD *)(v26 + 32) + 432) = 0;
    }
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 418) = 0;
    return objc_msgSend(*(id *)(v1 + 32), "didLayoutAndRenderOnThread");
  }
  return result;
}

- (BOOL)backgroundLayoutAndRenderState:(id)a3 shouldDispatchBackgroundWork:(id)a4
{
  void *v6;
  uint64_t v7;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController backgroundLayoutAndRenderState:shouldDispatchBackgroundWork:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4812, CFSTR("This operation must only be performed on the main thread."));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:shouldDispatchBackgroundWork:](self->mDelegate, "interactiveCanvasController:shouldDispatchBackgroundWork:", self, a4);
  else
    return 1;
}

- (void)backgroundLayoutAndRenderStateDidPerformBackgroundWork:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  NSMutableSet *mNotificationsToPostWithValidLayouts;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[5];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController backgroundLayoutAndRenderStateDidPerformBackgroundWork:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4826, CFSTR("This operation must only be performed on the main thread."));
  }
  if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __89__TSDInteractiveCanvasController_backgroundLayoutAndRenderStateDidPerformBackgroundWork___block_invoke;
    v16[3] = &unk_24D829278;
    v16[4] = self;
    -[TSDInteractiveCanvasController p_acquireLockAndPerformAction:](self, "p_acquireLockAndPerformAction:", v16);
    if (!self->mCurrentlyScrolling)
      -[TSDTrackingController interactiveCanvasControllerUpdatedRepsFromLayouts:](-[TSDInteractiveCanvasController trackingController](self, "trackingController"), "interactiveCanvasControllerUpdatedRepsFromLayouts:", self);
  }
  if (!-[TSDInteractiveCanvasController currentlyScrolling](self, "currentlyScrolling"))
  {
    -[TSDInteractiveCanvasController invalidateLayers](self, "invalidateLayers");
    -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:](self->mDelegate, "interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:", self);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mNotificationsToPostWithValidLayouts = self->mNotificationsToPostWithValidLayouts;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mNotificationsToPostWithValidLayouts, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(mNotificationsToPostWithValidLayouts);
        objc_msgSend(v6, "postNotificationName:object:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), self);
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](mNotificationsToPostWithValidLayouts, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v9);
  }
  -[NSMutableSet removeAllObjects](self->mNotificationsToPostWithValidLayouts, "removeAllObjects");
}

uint64_t __89__TSDInteractiveCanvasController_backgroundLayoutAndRenderStateDidPerformBackgroundWork___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_updateViewsFromReps");
}

- (void)scrollViewDidScroll:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  v48 = *MEMORY[0x24BDAC8D0];
  if (!self->mIgnoreContentOffsetChanges)
  {
    v5 = *MEMORY[0x24BDBF070];
    v6 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v7 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 24);
    -[TSDInteractiveCanvasController setP_visibleBoundsRectForTiling:](self, "setP_visibleBoundsRectForTiling:", *MEMORY[0x24BDBF070], v6, v7, v8);
    v9 = (objc_msgSend(a3, "isScrolling") & 1) != 0 || self->mAnimatingScroll;
    self->mCurrentlyScrolling = v9;
    -[TSDInteractiveCanvasController setP_visibleUnscaledRect:](self, "setP_visibleUnscaledRect:", v5, v6, v7, v8);
    if (!self->mCurrentlyScrolling)
      -[TSDInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");
    if (self->mPopoutLayer)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "bounds");
      v11 = v10;
      v13 = v12;
      objc_msgSend((id)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "canvasLayer"), "contentInset");
      v15 = v14;
      v17 = v16;
      objc_msgSend(a3, "frame");
      v19 = v18;
      objc_msgSend(a3, "contentOffset");
      v21 = v11 + v19 - v20 - v17;
      objc_msgSend(a3, "frame");
      v23 = v22;
      objc_msgSend(a3, "contentOffset");
      v25 = v13 + v23 - v24 - v15;
      -[CALayer position](self->mPopoutLayer, "position");
      if (v27 != v21 || v26 != v25)
        -[CALayer setPosition:](self->mPopoutLayer, "setPosition:", v21, v25);
      -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v37 = -[CALayer sublayers](self->mPopoutLayer, "sublayers", 0);
      v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v39; ++i)
          {
            if (*(_QWORD *)v44 != v40)
              objc_enumerationMutation(v37);
            v42 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
            objc_msgSend(v42, "frame");
            v50.origin.x = v30;
            v50.origin.y = v32;
            v50.size.width = v34;
            v50.size.height = v36;
            objc_msgSend(v42, "setHidden:", !CGRectIntersectsRect(v49, v50));
          }
          v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v39);
      }
    }
    -[TSDInteractiveCanvasController delegate](self, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidScroll:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerDidScroll:", self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasUpdateScrollNotification"), self);
    -[TSDInteractiveCanvasController i_viewScrollDidChange](self, "i_viewScrollDidChange");
    -[TSDInteractiveCanvasController p_invalidateTilingLayers](self, "p_invalidateTilingLayers");
    if (-[TSDInteractiveCanvasController shouldShowUserDefinedGuides](self, "shouldShowUserDefinedGuides"))
      -[TSDInteractiveCanvasController invalidateLayers](self, "invalidateLayers");
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  self->mCurrentlyScrolling = 1;
  -[TSDInteractiveCanvasController i_viewScrollWillChange](self, "i_viewScrollWillChange");
  if (!self->mCreateRepsForOffscreenLayouts && !self->mSuspendedLowPriorityThreadDispatcher)
  {
    self->mSuspendedLowPriorityThreadDispatcher = 1;
    objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "suspend");
  }
  -[TSDInteractiveCanvasController beginScrollingOperation](self, "beginScrollingOperation");
  -[TSDTextInputResponder canvasWillScroll](self->mTextInputResponder, "canvasWillScroll");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasWillScrollNotification"), self);
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:scrollViewWillBeginDragging:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasController:scrollViewWillBeginDragging:", self, a3);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  TSDInteractiveCanvasControllerDelegate *v9;

  y = a4.y;
  x = a4.x;
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = -[TSDInteractiveCanvasController delegate](self, "delegate");
    objc_opt_class();
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:scrollViewWillEndDragging:withVelocity:targetContentOffset:](v9, "interactiveCanvasController:scrollViewWillEndDragging:withVelocity:targetContentOffset:", self, TSUDynamicCast(), a5, x, y);
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    self->mCurrentlyScrolling = 0;
    -[TSDInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded", a3);
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  self->mCurrentlyScrolling = 0;
  -[TSDInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded", a3);
}

- (void)scrollView:(id)a3 willAnimateToContentOffset:(CGPoint)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;

  y = a4.y;
  x = a4.x;
  -[TSDInteractiveCanvasController i_viewScrollWillChange](self, "i_viewScrollWillChange");
  if (self->mAnimatingScroll)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController scrollView:willAnimateToContentOffset:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 4979, CFSTR("scrollView:willAnimateToContentOffset: called whilst already animating"));
  }
  *(_WORD *)&self->mCurrentlyScrolling = 257;
  objc_msgSend(a3, "contentOffset");
  v12 = TSDSubtractPoints(x, y, v10);
  v13 = v11;
  if (v12 != 0.0 || v11 != 0.0)
    objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "hideEditMenu");
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasWillAnimateScrollNotifiction"), self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
    v15 = CGRectOffset(v14, v12, v13);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](self, "convertBoundsToUnscaledRect:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:willAnimateScrollToVisibleUnscaledRect:](self->mDelegate, "interactiveCanvasController:willAnimateScrollToVisibleUnscaledRect:", self);
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  self->mAnimatingScroll = 0;
  -[TSDInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_scrollViewDidEndScrollingAnimation_, a3, 0.0);
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  self->mAnimatingScroll = 0;
  -[TSDInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_scrollViewDidEndScrollingAnimation_, a3, 0.0);
}

- (void)p_scrollViewDidEndScrollingAnimation:(id)a3
{
  _BOOL4 mAnimatingScroll;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    -[TSDInteractiveCanvasController scrollViewDidScroll:](self, "scrollViewDidScroll:", a3);
  }
  if ((objc_msgSend(a3, "isScrolling") & 1) != 0)
  {
    self->mCurrentlyScrolling = 1;
  }
  else
  {
    mAnimatingScroll = self->mAnimatingScroll;
    self->mCurrentlyScrolling = mAnimatingScroll;
    if (!mAnimatingScroll)
      -[TSDInteractiveCanvasController p_viewScrollingEnded](self, "p_viewScrollingEnded");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidEndScrollingAnimation:stillAnimating:](self->mDelegate, "interactiveCanvasControllerDidEndScrollingAnimation:stillAnimating:", self, self->mAnimatingScroll);
  -[TSDInteractiveCanvasController p_invalidateTilingLayers](self, "p_invalidateTilingLayers");
}

- (void)syncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  uint64_t v6;

  v6 = TSUProtocolCast();
  if (v6)
    objc_msgSend(-[TSDInteractiveCanvasController layoutsForInfo:](self, "layoutsForInfo:", v6), "makeObjectsPerformSelector:withObject:", sel_processChanges_, a3);
}

- (BOOL)selectionContainsOnlyInfosOnCanvas:(id)a3 model:(id)a4
{
  return 1;
}

- (CGPoint)scrollView:(id)a3 restrictContentOffset:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDInteractiveCanvasControllerDelegate *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  -[TSDInteractiveCanvasController delegate](self, "delegate", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](self, "convertBoundsToUnscaledPoint:", x, y);
    v8 = v7;
    v10 = v9;
    v11 = -[TSDInteractiveCanvasController delegate](self, "delegate");
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:restrictedContentOffset:forViewScale:](v11, "interactiveCanvasController:restrictedContentOffset:forViewScale:", self, v8, v10, v12);
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](self, "convertUnscaledToBoundsPoint:");
    x = v13;
    y = v14;
  }
  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)asyncProcessChanges:(id)a3 forChangeSource:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController asyncProcessChanges:forChangeSource:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5095, CFSTR("async change notifications should only come in on the main thread"));
  }
  if (-[TSDCanvas i_needsLayout](self->mCanvas, "i_needsLayout")
    && -[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setNeedsLayout");
  }
  v8 = TSUProtocolCast();
  if (v8)
    objc_msgSend(-[TSDInteractiveCanvasController repsForInfo:](self, "repsForInfo:", v8), "makeObjectsPerformSelector:withObject:", sel_processChanges_, a3);
}

- (void)p_willEnterForeground:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", a3, 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelector:", sel_i_willEnterForeground);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)p_acquireLockAndPerformAction:(id)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__TSDInteractiveCanvasController_p_acquireLockAndPerformAction___block_invoke;
  v7[3] = &unk_24D82B510;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:performLockedAction:](self->mDelegate, "interactiveCanvasController:performLockedAction:", self, v7);
  }
  else
  {
    -[NSRecursiveLock lock](self->mSelfSync, "lock");
    (*((void (**)(id))a3 + 2))(a3);
    *((_BYTE *)v9 + 24) = 1;
    -[NSRecursiveLock unlock](self->mSelfSync, "unlock");
  }
  if (!*((_BYTE *)v9 + 24))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_acquireLockAndPerformAction:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5152, CFSTR("failed to perform locked action"));
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __64__TSDInteractiveCanvasController_p_acquireLockAndPerformAction___block_invoke(_QWORD *a1)
{
  objc_msgSend(*(id *)(a1[4] + 632), "lock");
  (*(void (**)(void))(a1[5] + 16))();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1[4] + 632), "unlock");
}

- (void)deselectAll:(id)a3
{
  if (-[TSDEditorController editorForEditAction:withSender:](-[TSDInteractiveCanvasController editorController](self, "editorController"), "editorForEditAction:withSender:", a2, a3))
  {
    -[TSDInteractiveCanvasController makeEditorPerformAction:withSender:](self, "makeEditorPerformAction:withSender:", a2, a3);
  }
  else
  {
    -[TSDInteractiveCanvasController endEditing](self, "endEditing");
    -[TSDCanvasEditor setSelection:](-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor"), "setSelection:", 0);
  }
}

- (void)makeEditorPerformAction:(SEL)a3 withSender:(id)a4
{
  TSKAccessController *v7;
  _QWORD v8[7];

  v7 = -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__TSDInteractiveCanvasController_makeEditorPerformAction_withSender___block_invoke;
  v8[3] = &unk_24D82A528;
  v8[5] = a4;
  v8[6] = a3;
  v8[4] = self;
  -[TSKAccessController performRead:](v7, "performRead:", v8);
}

void *__69__TSDInteractiveCanvasController_makeEditorPerformAction_withSender___block_invoke(uint64_t a1)
{
  void *result;

  result = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "editorController"), "editorForEditAction:withSender:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  if (result)
    return (void *)objc_msgSend(result, "performSelector:withObject:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

- (BOOL)shouldResampleImages
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldResampleImages:](self->mDelegate, "interactiveCanvasControllerShouldResampleImages:", self);
  else
    return 1;
}

- (BOOL)canPerformInteractiveAction:(SEL)a3 withSender:(id)a4
{
  _BOOL4 isEqual;
  int v8;

  v8 = 0;
  if (-[TSDEditorController editorForEditAction:withSender:response:](-[TSDInteractiveCanvasController editorController](self, "editorController"), "editorForEditAction:withSender:response:", a3, a4, &v8))
  {
    goto LABEL_2;
  }
  if (v8 == -1)
  {
    LOBYTE(isEqual) = 0;
  }
  else
  {
    if (sel_isEqual(a3, sel_deselectAll_))
    {
LABEL_2:
      LOBYTE(isEqual) = 1;
      return isEqual;
    }
    if (sel_isEqual(a3, sel_nextAnnotation_) || (isEqual = sel_isEqual(a3, sel_previousAnnotation_)))
      LOBYTE(isEqual) = -[TSDInteractiveCanvasController hasAnnotations](self, "hasAnnotations");
  }
  return isEqual;
}

- (void)changeFirstResponderIfNecessary
{
  -[TSDTextInputResponder changeFirstResponderIfNecessary](self->mTextInputResponder, "changeFirstResponderIfNecessary");
}

- (void)p_maybeSetTextResponderEditorTo:(id)a3
{
  if (!-[TSDInteractiveCanvasController keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges](self, "keyboardSuppressedAndTextInputEditorIgnoresFirstResponderChanges")&& (a3|| !self->mPreventSettingNilEditorOnTextResponder&& (!self->mTextInputResponderShareCount|| !-[TSDTextInputResponder editor](self->mTextInputResponder, "editor")|| (-[TSDTextInput wantsKeyboard](-[TSDTextInputResponder editor](self->mTextInputResponder, "editor"), "wantsKeyboard") & 1) == 0)))
  {
    -[TSDTextInputResponder setEditor:](self->mTextInputResponder, "setEditor:", a3);
  }
}

- (void)beginAnimations:(id)a3 context:(void *)a4
{
  void *v7;
  uint64_t v8;

  if (self->mCurrentAnimation)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController beginAnimations:context:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5343, CFSTR("animation nesting not yet supported"));
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  self->mCurrentAnimation = -[TSDCanvasAnimation initWithAnimationID:interactiveCanvasController:context:]([TSDCanvasAnimation alloc], "initWithAnimationID:interactiveCanvasController:context:", a3, self, a4);
}

- (void)commitAnimations
{
  void *v3;
  uint64_t v4;

  if (!self->mCurrentAnimation)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController commitAnimations]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5353, CFSTR("can't commit if we don't have an animation open"));
  }
  objc_msgSend(MEMORY[0x24BDE57D8], "commit");

  self->mCurrentAnimation = 0;
}

- (void)setAnimationDelegate:(id)a3
{
  -[TSDCanvasAnimation setDelegate:](self->mCurrentAnimation, "setDelegate:", a3);
}

- (void)setAnimationWillStartSelector:(SEL)a3
{
  -[TSDCanvasAnimation setWillStartSelector:](self->mCurrentAnimation, "setWillStartSelector:", a3);
}

- (void)setAnimationDidStopSelector:(SEL)a3
{
  -[TSDCanvasAnimation setDidStopSelector:](self->mCurrentAnimation, "setDidStopSelector:", a3);
}

- (void)setAnimationDuration:(double)a3
{
  -[TSDCanvasAnimation setDuration:](self->mCurrentAnimation, "setDuration:", a3);
}

- (double)animationDuration
{
  double result;

  -[TSDCanvasAnimation duration](self->mCurrentAnimation, "duration");
  return result;
}

- (double)animationBeginTime
{
  double result;

  -[TSDCanvasAnimation beginTime](self->mCurrentAnimation, "beginTime");
  return result;
}

- (void)setAnimationDelay:(double)a3
{
  -[TSDCanvasAnimation setDelay:](self->mCurrentAnimation, "setDelay:", a3);
}

- (void)setAnimationStartDate:(id)a3
{
  -[TSDCanvasAnimation setStartDate:](self->mCurrentAnimation, "setStartDate:", a3);
}

- (void)setAnimationTimingFunction:(id)a3
{
  -[TSDCanvasAnimation setTimingFunction:](self->mCurrentAnimation, "setTimingFunction:", a3);
}

- (void)setAnimationRepeatCount:(float)a3
{
  -[TSDCanvasAnimation setRepeatCount:](self->mCurrentAnimation, "setRepeatCount:");
}

- (void)setAnimationRepeatAutoreverses:(BOOL)a3
{
  -[TSDCanvasAnimation setRepeatAutoreverses:](self->mCurrentAnimation, "setRepeatAutoreverses:", a3);
}

- (void)setAnimation:(id)a3 forLayer:(id)a4 forKey:(id)a5
{
  -[TSDCanvasAnimation setAnimation:forLayer:forKey:](self->mCurrentAnimation, "setAnimation:forLayer:forKey:", a3, a4, a5);
}

- (void)setAnimationCompletionBlock:(id)a3
{
  -[TSDCanvasAnimation setCompletionBlock:](self->mCurrentAnimation, "setCompletionBlock:", a3);
}

- (void)setAnimationFilterBlock:(id)a3
{
  -[TSDCanvasAnimation setFilterBlock:](self->mCurrentAnimation, "setFilterBlock:", a3);
}

- (void)setAnimationUseRepFiltering:(BOOL)a3
{
  -[TSDCanvasAnimation setUseRepFiltering:](self->mCurrentAnimation, "setUseRepFiltering:", a3);
}

- (void)i_layoutRegistered:(id)a3
{
  if (objc_msgSend(a3, "info"))
    -[TSKChangeNotifier addObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self, "changeNotifier"), "addObserver:forChangeSource:", self, objc_msgSend(a3, "info"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:layoutRegistered:](self->mDelegate, "interactiveCanvasController:layoutRegistered:", self, a3);
}

- (void)i_layoutUnregistered:(id)a3
{
  if (objc_msgSend(a3, "info"))
    -[TSKChangeNotifier removeObserver:forChangeSource:](-[TSDInteractiveCanvasController changeNotifier](self, "changeNotifier"), "removeObserver:forChangeSource:", self, objc_msgSend(a3, "info"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:layoutUnregistered:](self->mDelegate, "interactiveCanvasController:layoutUnregistered:", self, a3);
}

- (BOOL)i_needsLayout
{
  return -[TSDCanvas i_needsLayout](self->mCanvas, "i_needsLayout");
}

- (void)i_layout
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  TSKAccessController *v7;
  void *v8;
  uint64_t v9;

  if (!self->mTeardownOnBackgroundThread
    && (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0
    && (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    && !self->mNestedCanvasAllowLayoutAndRenderOnThread)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_layout]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5468, CFSTR("i_layout should only be called by our CV, from the main thread or during threaded layout"));
  }
  if (self->mDelegate && !-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_layout]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5469, CFSTR("should only get i_layout for interactive canvases"));
  }
  if (!self->mTeardownOnBackgroundThread
    && (!self->mLayoutAndRenderOnThreadDuringScroll
     || !self->mCurrentlyWaitingOnThreadedLayoutAndRender
     && (!-[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")
      || -[TSDCanvas i_needsLayout](self->mCanvas, "i_needsLayout"))))
  {
    if (-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"))
    {
      v7 = -[TSKDocumentRoot accessController](-[TSDInteractiveCanvasController documentRoot](self, "documentRoot"), "accessController");
      if (!v7)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_layout]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5475, CFSTR("invalid nil value for '%s'"), "ac");
      }
      -[TSKAccessController performRead:withTarget:argument:](v7, "performRead:withTarget:argument:", sel_p_layoutWithReadLock, self, 0);
    }
    if (self->mShouldAutoscrollToSelectionAfterLayout)
    {
      if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      {
        self->mShouldAutoscrollToSelectionAfterLayout = 0;
        -[TSDInteractiveCanvasController p_scrollToPrimarySelectionForEditor:skipZoom:](self, "p_scrollToPrimarySelectionForEditor:skipZoom:", -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](self, "editorController"), "textInputEditor"), self->mSuppressAutozoomToSelectionAfterLayout);
        self->mSuppressAutozoomToSelectionAfterLayout = 0;
        self->mShouldCenterSelectionWhenAutoscrolling = 0;
      }
    }
  }
}

- (void)p_layoutWithReadLock
{
  -[TSDCanvas layoutIfNeeded](self->mCanvas, "layoutIfNeeded");
}

- (void)i_viewWillBeginZooming
{
  double v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
  self->mDynamicViewScale = v3;
  self->mDynamicallyZooming = 1;
  -[TSDInteractiveCanvasController p_beginZoomingOperation](self, "p_beginZoomingOperation");
  -[TSDTextInputResponder canvasWillZoom](self->mTextInputResponder, "canvasWillZoom");
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerWillZoom:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerWillZoom:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasWillZoomNotification"), self);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_willBeginZooming);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "layoutIfNeeded");
}

- (void)i_viewIsZoomingAtPoint:(CGPoint)a3
{
  self->mZoomCenterInBounds = a3;
}

- (void)i_viewDidZoomToViewScale:(double)a3
{
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerIsZooming:viewScale:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerIsZooming:viewScale:", self, a3);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasUpdateZoomNotification"), self);
  -[TSDInteractiveCanvasController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("currentViewScale"));
  self->mDynamicViewScale = a3;
  -[TSDInteractiveCanvasController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("currentViewScale"));
}

- (void)viewDidEndZooming
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidZoom:](-[TSDInteractiveCanvasController delegate](self, "delegate"), "interactiveCanvasControllerDidZoom:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasDidZoomNotification"), self);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_didEndZooming);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[TSDInteractiveCanvasController p_endZoomingOperation](self, "p_endZoomingOperation");
  self->mDynamicallyZooming = 0;
}

- (void)i_canvasContentsScaleDidChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "screenScaleDidChange");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "recursivelyPerformSelector:", sel_screenScaleDidChange);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v11);
  }
}

- (void)i_canvasWideGamutValueDidChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (self->mCurrentlyWaitingOnThreadedLayoutAndRender
    && objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelector:", sel_wideGamutValueDidChange);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (void)i_viewScaleDidChange
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_viewScaleDidChange]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5585, CFSTR("Should not be called if waiting on background layout"));
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
      -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "recursivelyPerformSelector:", sel_viewScaleDidChange);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
  -[TSDInteractiveCanvasController layoutInvalidated](self, "layoutInvalidated");
}

- (double)i_viewScaleForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return a3;
  -[TSDInteractiveCanvasControllerDelegate canvasViewScaleForProposedViewScale:originalViewScale:](self->mDelegate, "canvasViewScaleForProposedViewScale:originalViewScale:", a3, a4);
  return result;
}

- (CGSize)i_canvasCenterOffsetForProposedViewScale:(double)a3 originalViewScale:(double)a4
{
  double v7;
  double v8;
  CGSize result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate canvasCenterOffsetForProposedViewScale:originalViewScale:](self->mDelegate, "canvasCenterOffsetForProposedViewScale:originalViewScale:", a3, a4);
  }
  else
  {
    v7 = *MEMORY[0x24BDBF148];
    v8 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)i_adjustViewScale:(double)a3
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return a3;
  -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:adjustViewScale:](self->mDelegate, "interactiveCanvasController:adjustViewScale:", self, a3);
  return result;
}

- (double)i_nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4
{
  _BOOL8 v4;
  double result;
  void *v8;

  v4 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate nextCanvasViewScaleDetentForProposedViewScale:greater:](self->mDelegate, "nextCanvasViewScaleDetentForProposedViewScale:greater:", v4, a3);
  }
  else
  {
    v8 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
    if (v4)
      objc_msgSend(v8, "maximumPinchViewScale");
    else
      objc_msgSend(v8, "minimumPinchViewScale");
  }
  return result;
}

- (void)i_viewScrollDidChange
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling)
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_viewScrollDidChange]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5656, CFSTR("Shouldn't be iterating over reps during background layout"));
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "recursivelyPerformSelector:", sel_viewScrollDidChange);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
  }
}

- (void)i_viewScrollWillChange
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelector:", sel_viewScrollWillChange);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerWillScroll:](self->mDelegate, "interactiveCanvasControllerWillScroll:", self);
  objc_msgSend(MEMORY[0x24BDE57D8], "flush");
}

- (void)i_viewScrollingEnded
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!self->mLayerHostHasBeenTornDown && (!self->mLayoutAndRenderOnThreadDuringScroll || !self->mCurrentlyScrolling))
  {
    -[TSDInteractiveCanvasController endScrollingOperation](self, "endScrollingOperation");
    -[NSRecursiveLock lock](self->mSelfSync, "lock");
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "recursivelyPerformSelector:", sel_viewScrollingEnded);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidStopScrolling:](self->mDelegate, "interactiveCanvasControllerDidStopScrolling:", self);
    if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      -[TSDInteractiveCanvasController p_updateViewsFromReps](self, "p_updateViewsFromReps");
      -[TSDTrackingController interactiveCanvasControllerUpdatedRepsFromLayouts:](-[TSDInteractiveCanvasController trackingController](self, "trackingController"), "interactiveCanvasControllerUpdatedRepsFromLayouts:", self);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", CFSTR("TSDCanvasDidScrollNotification"), self);
    if (self->mSuspendedLowPriorityThreadDispatcher)
    {
      self->mSuspendedLowPriorityThreadDispatcher = 0;
      objc_msgSend(+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher](TSKLowPriorityThreadDispatcher, "sharedLowPriorityDispatcher"), "resume");
    }
    -[NSRecursiveLock unlock](self->mSelfSync, "unlock");
  }
}

- (void)i_recordUserViewScale
{
  id v3;
  double v4;

  v3 = -[TSDEditorController textInputEditor](self->mEditorController, "textInputEditor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDCanvas viewScale](-[TSDInteractiveCanvasController canvas](self, "canvas"), "viewScale");
    objc_msgSend(v3, "targetPointSizeForSelectionWithViewScale:");
    if (v4 >= 12.0 && v4 <= 72.0)
      -[TSDInteractiveCanvasController p_setTargetPointSize:](self, "p_setTargetPointSize:");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidZoomWithUserGesture:](self->mDelegate, "interactiveCanvasControllerDidZoomWithUserGesture:", self);
}

- (void)i_repNeedsDisplay:(id)a3
{
  -[TSDInteractiveCanvasController setNeedsDisplayOnLayer:](self, "setNeedsDisplayOnLayer:", CFDictionaryGetValue(self->mRepLayersByRep, a3));
}

- (void)i_repNeedsDisplay:(id)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  const void *Value;
  const void *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  Value = CFDictionaryGetValue(self->mRepLayersByRep, a3);
  if (Value)
  {
    v11 = Value;
    objc_msgSend(a3, "convertNaturalRectToLayerRelative:", x, y, width, height);
    -[TSDInteractiveCanvasController setNeedsDisplayInRect:onLayer:](self, "setNeedsDisplayInRect:onLayer:", v11);
  }
}

- (id)i_tileStorage
{
  return self->mTileStorage;
}

- (BOOL)i_inPrintPreviewMode
{
  -[TSDInteractiveCanvasController delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate inPrintPreviewMode](-[TSDInteractiveCanvasController delegate](self, "delegate"), "inPrintPreviewMode");
  else
    return 0;
}

- (id)i_currentAnimation
{
  return self->mCurrentAnimation;
}

- (id)i_descriptionForViewScale:(double)a3
{
  id result;
  unsigned int v6;

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (result = (id)-[TSDInteractiveCanvasControllerDelegate descriptionForCanvasViewScale:](self->mDelegate, "descriptionForCanvasViewScale:", a3)) == 0)
  {
    LOBYTE(v6) = 0;
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3CC0], "numberFormatWithValueType:formatString:decimalPlaces:currencyCode:useAccountingStyle:negativeStyle:showThousandsSeparator:fractionAccuracy:", 2, 0, 0, 0, 0, 4, v6), "stringFromDouble:", a3);
  }
  return result;
}

- (CGRect)i_clippingBoundsForScrollViewEnclosingCanvas
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v3 = TSDRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate scrollViewClippingBoundsForInteractiveCanvasController:](self->mDelegate, "scrollViewClippingBoundsForInteractiveCanvasController:", self);
    v3 = v10;
    v5 = v11;
    v7 = v12;
    v9 = v13;
  }
  v14 = v3;
  v15 = v5;
  v16 = v7;
  v17 = v9;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)i_topLevelLayersForTiling
{
  NSSet *v3;
  __CFDictionary *mDirectLayerHostsByRep;
  _QWORD v6[5];

  v3 = -[TSDInteractiveCanvasController p_cachedTopLevelTilingLayers](self, "p_cachedTopLevelTilingLayers");
  if (!v3)
  {
    if (self->_directLayerHostProvider)
    {
      v3 = (NSSet *)objc_msgSend(MEMORY[0x24BEB3CB0], "set");
      mDirectLayerHostsByRep = self->mDirectLayerHostsByRep;
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __59__TSDInteractiveCanvasController_i_topLevelLayersForTiling__block_invoke;
      v6[3] = &unk_24D82B538;
      v6[4] = v3;
      -[__CFDictionary enumerateKeysAndObjectsUsingBlock:](mDirectLayerHostsByRep, "enumerateKeysAndObjectsUsingBlock:", v6);
    }
    else
    {
      v3 = (NSSet *)objc_msgSend(MEMORY[0x24BEB3CB0], "setWithArray:", objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "sublayers"));
      objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "subviewsController"), "updateTopLevelLayersForTiling:", v3);
    }
    -[TSDInteractiveCanvasController setP_cachedTopLevelTilingLayers:](self, "setP_cachedTopLevelTilingLayers:", v3);
  }
  return v3;
}

uint64_t __59__TSDInteractiveCanvasController_i_topLevelLayersForTiling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "directLayerhostUpdateTopLevelTilingLayers:forRep:", *(_QWORD *)(a1 + 32), a2);
}

- (void)p_postNotificationOnMainThreadWithValidLayouts:(id)a3
{
  uint64_t v5;
  __CFRunLoop *Main;
  const void *v7;
  _QWORD block[6];
  _QWORD v9[5];

  v5 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke;
  v9[3] = &unk_24D82B560;
  v9[4] = self;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0 || !self->mLayoutAndRenderOnThreadDuringScroll)
  {
    __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke((uint64_t)v9, (uint64_t)a3);
  }
  else
  {
    Main = CFRunLoopGetMain();
    v7 = (const void *)*MEMORY[0x24BDBD598];
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke_2;
    block[3] = &unk_24D82B588;
    block[4] = a3;
    block[5] = v9;
    CFRunLoopPerformBlock(Main, v7, block);
    CFRunLoopWakeUp(Main);
  }
}

uint64_t __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 401) && *(_BYTE *)(v2 + 418))
    return objc_msgSend(*(id *)(v2 + 448), "addObject:", a2);
  else
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:", a2, *(_QWORD *)(a1 + 32));
}

uint64_t __81__TSDInteractiveCanvasController_p_postNotificationOnMainThreadWithValidLayouts___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)p_updateCanvasSizeFromLayouts
{
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double width;
  double height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  -[TSDInteractiveCanvasController defaultMinimumUnscaledCanvasSize](self, "defaultMinimumUnscaledCanvasSize");
  v3 = TSDRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[TSDCanvas i_unscaledRectOfLayouts](self->mCanvas, "i_unscaledRectOfLayouts");
  v26.origin.x = v10;
  v26.origin.y = v11;
  v26.size.width = v12;
  v26.size.height = v13;
  v24.origin.x = v3;
  v24.origin.y = v5;
  v24.size.width = v7;
  v24.size.height = v9;
  v25 = CGRectUnion(v24, v26);
  width = v25.size.width;
  height = v25.size.height;
  -[TSDInteractiveCanvasController canvasScrollingOutset](self, "canvasScrollingOutset", v25.origin.x, v25.origin.y);
  v17 = TSDAddSizes(width, height, v16);
  v19 = v18;
  if (-[TSDInteractiveCanvasController isInDynamicOperation](self, "isInDynamicOperation"))
  {
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
    if (v20 > v17)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
      v17 = v21;
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
    if (v22 > v19)
    {
      objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
      v19 = v23;
    }
  }
  objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "setUnscaledSize:", v17, v19);
}

- (void)p_updateViewsFromReps
{
  -[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:](self, "p_updateViewsFromRepsForceUpdate:", 0);
}

- (BOOL)p_allowUpdateViewsFromReps
{
  if (-[TSDInteractiveCanvasController currentlyScrolling](self, "currentlyScrolling"))
    return 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldDeferViewCreation:](self->mDelegate, "interactiveCanvasControllerShouldDeferViewCreation:", self) ^ 1;
  return 1;
}

- (void)p_updateViewsFromRepsForceUpdate:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  TSDCanvasLayerHosting *v10;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5889, CFSTR("This operation must only be performed on the main thread."));
  }
  if (a3
    || -[TSDInteractiveCanvasController p_allowUpdateViewsFromReps](self, "p_allowUpdateViewsFromReps")
    && -[TSDInteractiveCanvasController canvasView](self, "canvasView"))
  {
    if (self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_updateViewsFromRepsForceUpdate:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 5893, CFSTR("Should not be called if waiting on background layout"));
    }
    v10 = -[TSDInteractiveCanvasController layerHost](self, "layerHost");
    v9 = (id)-[TSDCanvasLayerHosting subviewsController](v10, "subviewsController");
    objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](v10, "subviewsController"), "updateViewsFromReps");

  }
}

- (void)p_updateLayersFromReps
{
  void *v3;
  double v4;
  double v5;
  id v6;
  NSArray *v7;
  TSDRepDirectLayerHostProvider *directLayerHostProvider;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  id v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  NSMutableArray *mHiddenTopLevelLayers;
  void *Value;
  TSDCanvas *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  const void *v32;
  const void *v33;
  const void *v34;
  id v35;
  id v36;
  id v37;
  TSDRepDirectLayerHostProvider *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  NSArray *v46;
  TSDRepDirectLayerHostProvider *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t m;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id obj;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
    return;
  v3 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self, "canvas"), "contentsScale");
  v5 = v4;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v52 = v3;
  objc_msgSend(v3, "bounds");
  -[CALayer setFrame:](self->mRepContainerLayer, "setFrame:", TSDRectWithSize());
  v7 = -[TSDInteractiveCanvasController additionalLayersUnderRepLayers](self, "additionalLayersUnderRepLayers");
  directLayerHostProvider = self->_directLayerHostProvider;
  if (directLayerHostProvider)
  {
    -[TSDRepDirectLayerHostProvider directLayerHostUpdateAdditionalLayersUnderRepLayers:](directLayerHostProvider, "directLayerHostUpdateAdditionalLayersUnderRepLayers:", v7);
  }
  else if (v7)
  {
    objc_msgSend(v6, "addObjectsFromArray:");
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v54 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v55 = v6;
  v57 = v10;
  v53 = (void *)-[__CFDictionary allKeys](self->mRepLayersByRep, "allKeys");
  if (self->mLayoutAndRenderOnThreadDuringScroll && !self->mStaticLayoutAndRenderOnThread)
    v11 = objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") ^ 1;
  else
    v11 = 0;
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps");
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v71;
    v15 = *MEMORY[0x24BDBEFB0];
    v16 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v71 != v14)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v19 = -[TSDInteractiveCanvasController layerForRep:](self, "layerForRep:", v18);
        v20 = objc_msgSend(v9, "count");
        -[TSDInteractiveCanvasController p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:](self, "p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:", v18, v9, v57);
        if (v19)
          v21 = 0;
        else
          v21 = v11;
        if (v21 == 1)
        {
          v22 = objc_msgSend(v9, "count");
          if (v20 < v22)
          {
            v23 = v22;
            do
            {
              v24 = (void *)objc_msgSend(v9, "objectAtIndex:", v20);
              objc_msgSend(v24, "setHidden:", 1);
              mHiddenTopLevelLayers = self->mHiddenTopLevelLayers;
              if (!mHiddenTopLevelLayers)
              {
                mHiddenTopLevelLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
                self->mHiddenTopLevelLayers = mHiddenTopLevelLayers;
              }
              -[NSMutableArray addObject:](mHiddenTopLevelLayers, "addObject:", v24);
              ++v20;
            }
            while (v23 != v20);
          }
        }
        if (-[TSDInteractiveCanvasController shouldClipThemeContentToCanvas](self, "shouldClipThemeContentToCanvas")
          && objc_msgSend(v18, "canClipThemeContentToCanvas"))
        {
          Value = (void *)CFDictionaryGetValue(self->mContainerLayersByRep, v18);
          v27 = -[TSDInteractiveCanvasController canvas](self, "canvas");
          objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "unscaledSize");
          -[TSDCanvas convertUnscaledToBoundsRect:](v27, "convertUnscaledToBoundsRect:", TSDRectWithSize());
          objc_msgSend(Value, "setBounds:");
          objc_msgSend(Value, "setPosition:", v15, v16);
          objc_msgSend(Value, "setAnchorPoint:", 0.0, 0.0);
          objc_msgSend(Value, "setMasksToBounds:", 1);
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v13);
  }
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v28 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v67 != v30)
          objc_enumerationMutation(v53);
        v32 = *(const void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        if ((objc_msgSend(v57, "containsObject:", v32) & 1) == 0)
        {
          v33 = CFDictionaryGetValue(self->mRepLayersByRep, v32);
          v34 = CFDictionaryGetValue(self->mContainerLayersByRep, v32);
          -[TSDInteractiveCanvasController p_discardLayer:forRep:](self, "p_discardLayer:forRep:", v33, v32);
          -[TSDInteractiveCanvasController p_discardContainerLayer:forRep:](self, "p_discardContainerLayer:forRep:", v34, v32);
        }
      }
      v29 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
    }
    while (v29);
  }

  if (!self->_directLayerHostProvider
    && (objc_msgSend(v9, "isEqualToArray:", -[CALayer sublayers](self->mRepContainerLayer, "sublayers")) & 1) == 0)
  {
    -[CALayer setSublayers:](self->mRepContainerLayer, "setSublayers:", v9);
  }

  objc_msgSend(v55, "addObject:", self->mRepContainerLayer);
  -[TSDInteractiveCanvasController p_setupPopoutLayerForReps:](self, "p_setupPopoutLayerForReps:", v57);
  v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (!-[TSDInteractiveCanvasController overlayLayerSuppressed](self, "overlayLayerSuppressed"))
  {
    v36 = -[TSDInteractiveCanvasController p_overlayLayerForReps:](self, "p_overlayLayerForReps:", v57);
    if (v36)
    {
      v37 = v36;
      objc_msgSend(v36, "setContentsScale:", v5);
      objc_msgSend(v35, "addObject:", v37);
    }
  }
  v38 = self->_directLayerHostProvider;
  if (v38)
    -[TSDRepDirectLayerHostProvider directLayerHostUpdateRepOverlayLayers:](v38, "directLayerHostUpdateRepOverlayLayers:", v35);
  else
    objc_msgSend(v55, "addObjectsFromArray:", v35);

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v39 = (void *)objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "subviews");
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v63 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * k), "layer");
        if (v44)
        {
          v45 = v44;
          objc_msgSend(v44, "setContentsScale:", v5);
          objc_msgSend(v55, "addObject:", v45);
        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    }
    while (v41);
  }
  if (!self->_directLayerHostProvider)
    objc_msgSend(v55, "addObjectsFromArray:", objc_msgSend((id)-[TSDCanvasLayerHosting subviewsController](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "subviewsController"), "updateAlternateLayersForViews"));

  v46 = -[TSDInteractiveCanvasController additionalLayersOverRepLayers](self, "additionalLayersOverRepLayers");
  v47 = self->_directLayerHostProvider;
  if (v47)
  {
    -[TSDRepDirectLayerHostProvider directLayerHostUpdateAdditionalLayersAboveRepLayers:](v47, "directLayerHostUpdateAdditionalLayersAboveRepLayers:", v46);
  }
  else
  {
    if (!v46)
      goto LABEL_63;
    objc_msgSend(v55, "addObjectsFromArray:");
  }
  if (!self->_directLayerHostProvider)
  {
LABEL_63:
    if ((objc_msgSend(v55, "isEqualToArray:", objc_msgSend(v52, "sublayers")) & 1) == 0)
      objc_msgSend(v52, "setSublayers:", v55);
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v48 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v59;
    do
    {
      for (m = 0; m != v49; ++m)
      {
        if (*(_QWORD *)v59 != v50)
          objc_enumerationMutation(v55);
        -[TSDInteractiveCanvasController p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m));
      }
      v49 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    }
    while (v49);
  }

  -[TSDInteractiveCanvasController setP_cachedTopLevelTilingLayers:](self, "setP_cachedTopLevelTilingLayers:", 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerDidUpdateLayersFromReps:](self->mDelegate, "interactiveCanvasControllerDidUpdateLayersFromReps:", self);
}

- (void)p_recursivelyUpdateLayerForRep:(id)a3 accumulatingLayers:(id)a4 andReps:(id)a5
{
  void *v9;
  void *Value;
  TSDRepDirectLayerHostProvider *directLayerHostProvider;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  objc_class *v21;
  id v22;
  objc_class *v23;
  objc_class *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t m;
  void *v56;
  void *v57;
  void *v58;
  _BYTE v59[12];
  _BOOL4 v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v9 = (void *)objc_msgSend((id)TSUProtocolCast(), "layerAndSubviewHost");
  if (self->_directLayerHostProvider)
  {
    Value = (void *)CFDictionaryGetValue(self->mDirectLayerHostsByRep, a3);
    directLayerHostProvider = self->_directLayerHostProvider;
    if (directLayerHostProvider)
      v12 = (void *)-[TSDRepDirectLayerHostProvider directLayerHostForRep:](directLayerHostProvider, "directLayerHostForRep:", a3);
    else
      v12 = 0;
    if (v12 == Value)
    {
      v12 = Value;
    }
    else
    {
      if (Value)
      {
        objc_msgSend(Value, "directLayerHostUpdateWithContainerLayer:forRep:", 0, a3);
        CFDictionaryRemoveValue(self->mDirectLayerHostsByRep, a3);
      }
      if (v12)
      {
        CFDictionarySetValue(self->mDirectLayerHostsByRep, a3, v12);
        *(_DWORD *)&v59[8] = 0;
        *(_QWORD *)v59 = v9 == 0;
        v13 = 1;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v12 = 0;
  }
  v13 = v12 != 0;
  if (v9)
    v14 = v12 == 0;
  else
    v14 = 0;
  if (v14)
  {
    a4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v13 = 0;
    v59[0] = 0;
    v12 = 0;
    *(_QWORD *)&v59[4] = a4;
  }
  else
  {
    v59[0] = v9 == 0;
    *(_QWORD *)&v59[4] = 0;
  }
LABEL_18:
  -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self, "canvas"), "contentsScale");
  v16 = v15;
  v17 = (void *)CFDictionaryGetValue(self->mContainerLayersByRep, a3);
  if (v17)
  {
    v18 = v17;
    v19 = v17;
  }
  else
  {
    v18 = objc_alloc_init(MEMORY[0x24BDE56D0]);
    v20 = (void *)MEMORY[0x24BDD17C8];
    v21 = (objc_class *)objc_opt_class();
    objc_msgSend(v18, "setName:", objc_msgSend(v20, "stringWithFormat:", CFSTR("containerLayer(%@)"), NSStringFromClass(v21)));
    CFDictionarySetValue(self->mContainerLayersByRep, a3, v18);
    CFDictionarySetValue(self->mRepsByContainerLayer, v18, a3);
    objc_msgSend(v18, "setDelegate:", self);
  }
  v60 = v13;
  if (v13)
    objc_msgSend(v12, "directLayerHostUpdateWithContainerLayer:forRep:", v18, a3);
  else
    objc_msgSend(a4, "addObject:", v18);
  v22 = (id)CFDictionaryGetValue(self->mRepLayersByRep, a3);
  v23 = (objc_class *)objc_msgSend(a3, "layerClass");
  v61 = v18;
  if (v22)
  {
    if ((objc_msgSend(v22, "isMemberOfClass:", v23) & 1) != 0)
      goto LABEL_34;
    -[TSDInteractiveCanvasController p_discardLayer:forRep:](self, "p_discardLayer:forRep:", v22, a3);
  }
  v22 = objc_alloc_init(v23);
  objc_msgSend(a3, "didCreateLayer:", v22);
  CFDictionarySetValue(self->mRepLayersByRep, a3, v22);
  CFDictionarySetValue(self->mRepsByRepLayer, v22, a3);
  objc_msgSend(v22, "setDelegate:", self);
  v24 = (objc_class *)objc_opt_class();
  objc_msgSend(v22, "setName:", NSStringFromClass(v24));
  if ((objc_msgSend(a3, "directlyManagesLayerContent") & 1) == 0)
    objc_msgSend(v22, "setNeedsDisplay");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v22, "setTilingMode:", objc_msgSend(a3, "tilingMode"));
    objc_msgSend(v22, "setDrawsInBackground:", objc_msgSend(a3, "canDrawInBackgroundDuringScroll"));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](self, "canvas"), "contentsScale");
    objc_msgSend(v22, "setContentsScale:");
  }

LABEL_34:
  if ((objc_msgSend(a3, "layerUpdatesPaused") & 1) == 0)
    objc_msgSend(a3, "willUpdateLayer:", v22);
  if (v22)
  {
    objc_msgSend(a5, "addObject:", a3);
    v57 = v12;
    v58 = v9;
    if ((objc_msgSend(a3, "layerUpdatesPaused") & 1) == 0)
    {
      objc_msgSend(a3, "updateLayerGeometryFromLayout:", v22);
      objc_msgSend(v22, "setMasksToBounds:", objc_msgSend(a3, "masksToBounds"));
      objc_msgSend(v22, "setOpaque:", objc_msgSend(a3, "isOpaque"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(v22, "setContentsScale:", v16);
      v25 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v26 = (void *)objc_msgSend(a3, "additionalLayersUnderLayer");
      v56 = v25;
      if (v26)
      {
        v27 = v26;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v75;
          do
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v75 != v30)
                objc_enumerationMutation(v27);
              v32 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                && (objc_msgSend(a3, "repDirectlyManagesContentsScaleOfLayer:", v32) & 1) == 0)
              {
                objc_msgSend(v32, "setContentsScale:", v16);
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v74, v81, 16);
          }
          while (v29);
        }
        v25 = v56;
        objc_msgSend(v56, "addObjectsFromArray:", v27);
      }
      objc_msgSend(v25, "addObject:", v22);
      v33 = (void *)objc_msgSend(a3, "additionalLayersOverLayer");
      if (v33)
      {
        v34 = v33;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v71;
          do
          {
            for (j = 0; j != v36; ++j)
            {
              if (*(_QWORD *)v71 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                objc_msgSend(v39, "setContentsScale:", v16);
            }
            v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          }
          while (v36);
        }
        v25 = v56;
        objc_msgSend(v56, "addObjectsFromArray:", v34);
      }
      objc_msgSend(v61, "setSublayers:", v25);

      v12 = v57;
      v9 = v58;
    }
    v40 = (void *)TSUProtocolCast();
    if (v40)
    {
      v41 = v40;
      if (!objc_msgSend(v40, "layerUpdatesPaused")
        || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v41, "allowSublayerUpdatesWhenPaused"))
      {
        v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v41, "addAdditionalChildBackgroundLayersToArray:", v42);
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v43 = (void *)objc_msgSend(v41, "childReps");
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v67;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v67 != v46)
                objc_enumerationMutation(v43);
              -[TSDInteractiveCanvasController p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:](self, "p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * k), v42, a5);
            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
          }
          while (v45);
        }
        v48 = v41;
        goto LABEL_81;
      }
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v51 = (void *)objc_msgSend(v41, "childReps");
      v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      if (v52)
      {
        v53 = v52;
        v54 = *(_QWORD *)v63;
        do
        {
          for (m = 0; m != v53; ++m)
          {
            if (*(_QWORD *)v63 != v54)
              objc_enumerationMutation(v51);
            -[TSDInteractiveCanvasController p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:](self, "p_recursivelyUpdateLayerForRep:accumulatingLayers:andReps:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m), 0, a5);
          }
          v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
        }
        while (v53);
      }
    }
    else if ((objc_msgSend(0, "layerUpdatesPaused") & 1) == 0)
    {
      v49 = TSUProtocolCast();
      if (v49)
      {
        v50 = (void *)v49;
        v42 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v48 = v50;
LABEL_81:
        objc_msgSend(v48, "addAdditionalChildLayersToArray:", v42);
        objc_msgSend(v22, "tilingSafeSetSublayers:", v42);

        v12 = v57;
        v9 = v58;
      }
    }
  }
  if ((objc_msgSend(a3, "layerUpdatesPaused") & 1) == 0)
    objc_msgSend(a3, "didUpdateLayer:", v22);
  if ((v59[0] & 1) == 0)
    objc_msgSend((id)objc_msgSend(v9, "containerLayer"), "setSublayers:", *(_QWORD *)&v59[4]);

  if (v60 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v12, "directLayerHostUpdateOverlayLayers:forRep:", objc_msgSend(a3, "overlayLayers"), a3);
}

- (void)p_discardContainerLayer:(id)a3 forRep:(id)a4
{
  id v6;

  v6 = a3;
  -[TSDInteractiveCanvasController p_recursivelyClearLayerDelegate:](self, "p_recursivelyClearLayerDelegate:", a3);
  if (a3)
    CFDictionaryRemoveValue(self->mRepsByContainerLayer, a3);
  if (a4)
  {
    CFDictionaryRemoveValue(self->mContainerLayersByRep, a4);
    if (self->_directLayerHostProvider)
    {
      objc_msgSend((id)CFDictionaryGetValue(self->mDirectLayerHostsByRep, a4), "directLayerHostRemoveIfMatchingContainerLayer:forRep:", a3, a4);
      CFDictionaryRemoveValue(self->mDirectLayerHostsByRep, a4);
    }
  }

}

- (void)p_recursivelyUpdateLayerEdgeAntialiasingForLayer:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(a3, "setAllowsEdgeAntialiasing:", 1);
  v5 = objc_msgSend(a3, "mask");
  if (v5)
    -[TSDInteractiveCanvasController p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", v5);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_msgSend(a3, "sublayers", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[TSDInteractiveCanvasController p_recursivelyUpdateLayerEdgeAntialiasingForLayer:](self, "p_recursivelyUpdateLayerEdgeAntialiasingForLayer:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (void)p_discardLayer:(id)a3 forRep:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[TSDInteractiveCanvasController p_recursivelyClearLayerDelegate:](self, "p_recursivelyClearLayerDelegate:", a3);
  v7 = a3;
  if (a3)
  {
    CFDictionaryRemoveValue(self->mRepsByRepLayer, a3);
    v7 = a3;
  }
  if (a4)
  {
    CFDictionaryRemoveValue(self->mRepLayersByRep, a4);
    v7 = a3;
  }

}

- (void)p_setupPopoutLayerForReps:(id)a3
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  CALayer *mPopoutLayer;
  CALayer *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
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
  double v49;
  double v50;
  uint64_t v52;
  void *v53;
  TSDInteractiveCanvasController *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v65 = *MEMORY[0x24BDAC8D0];
  v52 = objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView"), "enclosingScrollView");
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v54 = self;
  -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v60 != v16)
          objc_enumerationMutation(a3);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "popoutLayers", v52);
        if (v18)
        {
          v19 = v18;
          v57 = 0u;
          v58 = 0u;
          v55 = 0u;
          v56 = 0u;
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v56;
            do
            {
              for (j = 0; j != v21; ++j)
              {
                if (*(_QWORD *)v56 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * j);
                objc_msgSend(v24, "frame");
                v68.origin.x = v7;
                v68.origin.y = v9;
                v68.size.width = v11;
                v68.size.height = v13;
                objc_msgSend(v24, "setHidden:", !CGRectIntersectsRect(v66, v68));
                objc_msgSend(v5, "addObject:", v24);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            }
            while (v21);
          }
        }
      }
      v15 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v15);
  }
  v25 = objc_msgSend(v5, "count", v52);
  mPopoutLayer = v54->mPopoutLayer;
  if (v25)
  {
    if (!mPopoutLayer)
    {
      v27 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      v54->mPopoutLayer = v27;
      -[CALayer setName:](v27, "setName:", CFSTR("popout"));
      -[CALayer setAnchorPoint:](v54->mPopoutLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[CALayer setDelegate:](v54->mPopoutLayer, "setDelegate:", v54);
      -[CALayer setBackgroundColor:](v54->mPopoutLayer, "setBackgroundColor:", 0);
      v28 = (void *)objc_msgSend((id)objc_msgSend(v53, "layer"), "superlayer");
      if (!v28)
        v28 = (void *)objc_msgSend((id)objc_msgSend(v53, "superview"), "layer");
      objc_msgSend(v28, "addSublayer:", v54->mPopoutLayer);
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v54, "layerHost"), "canvasLayer"), "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[CALayer bounds](v54->mPopoutLayer, "bounds");
    v69.origin.x = v30;
    v69.origin.y = v32;
    v69.size.width = v34;
    v69.size.height = v36;
    if (!CGRectEqualToRect(v67, v69))
      -[CALayer setBounds:](v54->mPopoutLayer, "setBounds:", v30, v32, v34, v36);
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](v54, "layerHost"), "canvasLayer"), "contentInset");
    v38 = v37;
    v40 = v39;
    objc_msgSend(v53, "frame");
    v42 = v41;
    objc_msgSend(v53, "contentOffset");
    v44 = v30 + v42 - v43 - v40;
    objc_msgSend(v53, "frame");
    v46 = v45;
    objc_msgSend(v53, "contentOffset");
    v48 = v32 + v46 - v47 - v38;
    -[CALayer position](v54->mPopoutLayer, "position");
    if (v50 != v44 || v49 != v48)
      -[CALayer setPosition:](v54->mPopoutLayer, "setPosition:", v44, v48);
    -[CALayer setSublayers:](v54->mPopoutLayer, "setSublayers:", v5);
  }
  else
  {
    -[CALayer setDelegate:](mPopoutLayer, "setDelegate:", 0);
    -[CALayer removeFromSuperlayer](v54->mPopoutLayer, "removeFromSuperlayer");

    v54->mPopoutLayer = 0;
  }

}

- (id)p_overlayLayerForReps:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  CALayer *mOverlayLayer;
  CALayer *v19;
  CGColor *DeviceRGB;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
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
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(a3);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (!self->_directLayerHostProvider
          || !CFDictionaryGetValue(self->mDirectLayerHostsByRep, *(const void **)(*((_QWORD *)&v36 + 1) + 8 * i))
          || (objc_opt_respondsToSelector() & 1) == 0)
        {
          v11 = objc_msgSend(v10, "overlayLayers");
          if (v11)
            objc_msgSend(v5, "addObjectsFromArray:", v11);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v7);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v12 = -[TSDInteractiveCanvasController p_decorators](self, "p_decorators", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v12);
        v17 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "decoratorOverlayLayers");
        if (v17)
          objc_msgSend(v5, "addObjectsFromArray:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);
  }
  if (objc_msgSend(v5, "count") || self->mShowGrayOverlay)
  {
    mOverlayLayer = self->mOverlayLayer;
    if (!mOverlayLayer)
    {
      v19 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      self->mOverlayLayer = v19;
      -[CALayer setName:](v19, "setName:", CFSTR("overlayLayer"));
      -[CALayer setAnchorPoint:](self->mOverlayLayer, "setAnchorPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[CALayer setDelegate:](self->mOverlayLayer, "setDelegate:", self);
      -[CALayer setZPosition:](self->mOverlayLayer, "setZPosition:", 3.0);
      mOverlayLayer = self->mOverlayLayer;
    }
    -[CALayer setSublayers:](mOverlayLayer, "setSublayers:", v5);
    if (self->mShowGrayOverlay)
    {
      DeviceRGB = (CGColor *)TSUCGColorCreateDeviceRGB();
      -[CALayer setBackgroundColor:](self->mOverlayLayer, "setBackgroundColor:", DeviceRGB);
      CGColorRelease(DeviceRGB);
    }
    else
    {
      -[CALayer setBackgroundColor:](self->mOverlayLayer, "setBackgroundColor:", 0);
    }
    objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "bounds");
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;
    -[CALayer bounds](self->mOverlayLayer, "bounds");
    v44.origin.x = v22;
    v44.origin.y = v24;
    v44.size.width = v26;
    v44.size.height = v28;
    if (!CGRectEqualToRect(v43, v44))
      -[CALayer setBounds:](self->mOverlayLayer, "setBounds:", v22, v24, v26, v28);
    -[CALayer position](self->mOverlayLayer, "position");
    if (v30 != v22 || v29 != v24)
      -[CALayer setPosition:](self->mOverlayLayer, "setPosition:", v22, v24);
  }
  else
  {
    -[CALayer setDelegate:](self->mOverlayLayer, "setDelegate:", 0);
    -[CALayer removeFromSuperlayer](self->mOverlayLayer, "removeFromSuperlayer");

    self->mOverlayLayer = 0;
  }

  return self->mOverlayLayer;
}

- (void)p_drawLayerWithReadLock:(id)a3
{
  const void *v5;
  uint64_t v6;
  uint64_t v7;
  const void *Value;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (const void *)objc_msgSend(a3, "objectForKey:", CFSTR("TSDInteractiveCanvasControllerLayerKey"));
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("TSDInteractiveCanvasControllerContextKey")), "pointerValue");
  v7 = v6;
  if (v5)
  {
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_drawLayerWithReadLock:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6453, CFSTR("invalid nil value for '%s'"), "layer");
    if (v7)
      goto LABEL_3;
  }
  v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_drawLayerWithReadLock:]");
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6454, CFSTR("invalid nil value for '%s'"), "ctx");
LABEL_3:
  Value = CFDictionaryGetValue(self->mRepsByRepLayer, v5);
  if (Value)
    -[TSDInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:](self, "i_drawRepWithReadLock:inContext:forLayer:", Value, v7, v5);
}

- (void)i_drawRepWithReadLock:(id)a3 inContext:(CGContext *)a4 forLayer:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (!a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6466, CFSTR("invalid nil value for '%s'"), "rep");
    if (a4)
      goto LABEL_3;
LABEL_5:
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController i_drawRepWithReadLock:inContext:forLayer:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6467, CFSTR("invalid nil value for '%s'"), "ctx");
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  CGContextSaveGState(a4);
  objc_msgSend(a3, "setupForDrawingInLayer:context:", a5, a4);
  objc_msgSend(a3, "drawInLayerContext:", a4);
  objc_msgSend(a3, "didDrawInLayer:context:", a5, a4);
  CGContextRestoreGState(a4);
}

- (BOOL)p_endEditingToBeginEditingRep:(id)a3
{
  TSDEditorController *v5;
  TSDCanvasEditor *v6;
  uint64_t v8;

  self->mShouldAutoscrollToSelectionAfterLayout = 0;
  self->mShouldCenterSelectionWhenAutoscrolling = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate canvasWillEndEditingToBeginEditingRep:](self->mDelegate, "canvasWillEndEditingToBeginEditingRep:", a3);
  v5 = -[TSDInteractiveCanvasController editorController](self, "editorController");
  v6 = -[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor");
  if (-[TSDEditorController textInputEditor](v5, "textInputEditor") == v6
    || objc_msgSend(-[TSDEditorController currentEditors](v5, "currentEditors"), "indexOfObjectIdenticalTo:", v6) == 0x7FFFFFFFFFFFFFFFLL)
  {
    return 0;
  }
  v8 = -[TSDCanvasEditor editorToPopToOnEndEditing](v6, "editorToPopToOnEndEditing");
  if (v8)
    -[TSDEditorController popToEditor:](v5, "popToEditor:", v8);
  -[TSDEditorController setTextInputEditor:](v5, "setTextInputEditor:", v6);
  return 1;
}

- (id)p_backgroundLayoutAndRenderState
{
  id result;

  result = self->mBackgroundLayoutAndRenderState;
  if (!result)
  {
    result = -[TSDBackgroundLayoutAndRenderState initWithDelegate:]([TSDBackgroundLayoutAndRenderState alloc], "initWithDelegate:", self);
    self->mBackgroundLayoutAndRenderState = (TSDBackgroundLayoutAndRenderState *)result;
  }
  return result;
}

- (void)disableThreadedLayoutAndRender
{
  int *p_mDisableThreadedLayoutAndRender;
  unsigned int v3;

  p_mDisableThreadedLayoutAndRender = &self->mDisableThreadedLayoutAndRender;
  do
    v3 = __ldaxr((unsigned int *)p_mDisableThreadedLayoutAndRender);
  while (__stlxr(v3 + 1, (unsigned int *)p_mDisableThreadedLayoutAndRender));
}

- (void)enableThreadedLayoutAndRender
{
  int *p_mDisableThreadedLayoutAndRender;
  unsigned int v3;

  p_mDisableThreadedLayoutAndRender = &self->mDisableThreadedLayoutAndRender;
  do
    v3 = __ldaxr((unsigned int *)p_mDisableThreadedLayoutAndRender);
  while (__stlxr(v3 - 1, (unsigned int *)p_mDisableThreadedLayoutAndRender));
}

- (BOOL)i_temporarilyDisabledLayoutAndRenderOnThreadDuringScroll
{
  return self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll;
}

- (BOOL)p_shouldLayoutAndRenderOnThread
{
  return -[TSDInteractiveCanvasController p_shouldLayoutAndRenderOnThreadForcePendingLayout:](self, "p_shouldLayoutAndRenderOnThreadForcePendingLayout:", 1);
}

- (BOOL)p_shouldLayoutAndRenderOnThreadForcePendingLayout:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;

  if (!self->mLayoutAndRenderOnThreadDuringScroll)
    return 0;
  v3 = a3;
  if ((!-[TSDInteractiveCanvasController p_currentlyScrolling](self, "p_currentlyScrolling")
     || !-[TSDCanvasView window](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "window"))
    && !self->mStaticLayoutAndRenderOnThread)
  {
    return 0;
  }
  if (self->mDisableThreadedLayoutAndRender)
    return 0;
  self->mLayoutAndRenderOnThreadDuringScroll = 0;
  v5 = 1;
  self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll = 1;
  if (v3)
  {
    -[TSDInteractiveCanvasController layoutIfNeeded](self, "layoutIfNeeded");
    objc_msgSend(MEMORY[0x24BDE57D8], "flush");
  }
  self->mTemporarilyDisabledLayoutAndRenderOnThreadDuringScroll = 0;
  self->mLayoutAndRenderOnThreadDuringScroll = 1;
  return v5;
}

- (void)p_viewScrollingEnded
{
  void *v3;
  uint64_t v4;

  if (!self->mStaticLayoutAndRenderOnThread && !self->mHasBeenTornDown)
  {
    if (self->mLayerHostHasBeenTornDown)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_viewScrollingEnded]");
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6590, CFSTR("not expecting layerHost to have been torn down at this point"));
    }
    if (self->mLayoutAndRenderOnThreadDuringScroll)
      -[TSDInteractiveCanvasController i_syncWithLayoutThread](self, "i_syncWithLayoutThread");
    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_i_viewScrollingEnded, 0);
    -[TSDInteractiveCanvasController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_i_viewScrollingEnded, 0, 0.0);
  }
}

- (void)p_invalidateForBackgroundLayout
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_invalidateForBackgroundLayout]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6604, CFSTR("This operation must only be performed on the main thread."));
  }
  if (-[TSDInteractiveCanvasController p_shouldLayoutAndRenderOnThread](self, "p_shouldLayoutAndRenderOnThread"))
  {
    self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
    objc_msgSend(-[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState"), "setNeedsLayoutAndRender");
  }
}

- (void)p_invalidateTilingLayers
{
  id v3;

  if (self->mCreateRepsForOffscreenLayouts)
  {
    if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
    {
      if (-[TSDInteractiveCanvasController p_shouldLayoutAndRenderOnThreadForcePendingLayout:](self, "p_shouldLayoutAndRenderOnThreadForcePendingLayout:", !self->mForceTilingLayoutOnThreadWhenScrolling))
      {
        self->mCurrentlyWaitingOnThreadedLayoutAndRender = 1;
        v3 = -[TSDInteractiveCanvasController p_backgroundLayoutAndRenderState](self, "p_backgroundLayoutAndRenderState");
      }
      else
      {
        v3 = (id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
      }
      objc_msgSend(v3, "setNeedsLayoutForTilingLayers");
    }
  }
  else if (!self->mCurrentlyWaitingOnThreadedLayoutAndRender)
  {
    -[TSDInteractiveCanvasController invalidateVisibleBoundsInBackground](self, "invalidateVisibleBoundsInBackground");
  }
}

- (void)p_rulerUnitsDidChangeNotification:(id)a3
{

  self->mUnitFormatter = 0;
}

- (void)p_textGesturesWillBeginNotification:(id)a3
{
  self->mTextGesturesInFlight = 1;
}

- (void)p_textGesturesDidEndNotification:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (self->mTextGesturesInFlight)
  {
    self->mTextGesturesInFlight = 0;
    if (self->mSelectionChangeNotificationDeferredEditor)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || -[TSDInteractiveCanvasControllerDelegate allowTextEditingToBegin](self->mDelegate, "allowTextEditingToBegin"))
      {
        -[TSDInteractiveCanvasController p_editorDoneChangingSelection:](self, "p_editorDoneChangingSelection:", self->mSelectionChangeNotificationDeferredEditor);
      }
      if (self->mShouldAutoscrollToSelectionAfterGestures && !self->mShouldAutoscrollToSelectionAfterLayout)
        -[TSDInteractiveCanvasController scrollToPrimarySelection](self, "scrollToPrimarySelection");

      self->mSelectionChangeNotificationDeferredEditor = 0;
    }
    if (!-[TSDInteractiveCanvasController currentlyScrolling](self, "currentlyScrolling", a3))
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v4 = -[TSDCanvas topLevelReps](self->mCanvas, "topLevelReps", 0);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "recursivelyPerformSelectorIfImplemented:", sel_gesturesDidEnd);
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }
    }
  }
}

- (void)p_editorDidChangeSelection:(id)a3 withSelectionFlags:(unint64_t)a4
{
  unsigned int v4;
  _BOOL4 v7;

  v4 = a4;
  if (-[TSDInteractiveCanvasController canvasEditor](self, "canvasEditor") == a3)
    -[TSDInteractiveCanvasController invalidateLayers](self, "invalidateLayers");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate selectionDidChange](self->mDelegate, "selectionDidChange");
  -[UITextInputDelegate selectionDidChange:](-[TSDTextInputResponder inputDelegate](self->mTextInputResponder, "inputDelegate"), "selectionDidChange:", self->mTextInputResponder);
  LOBYTE(v7) = self->mTextGesturesInFlight;
  if (v7)
  {
    self->mSelectionChangeNotificationDeferredEditor = (TSDEditor *)a3;
    v7 = (v4 >> 6) & 1;
    self->mShouldAnimateAutoscroll = (v4 & 0x10) != 0;
  }
  self->mShouldAutoscrollToSelectionAfterGestures = v7;
}

- (void)p_editorDoneChangingSelection:(id)a3
{
  -[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:](self, "p_editorDoneChangingSelection:withFlags:", a3, 0);
}

- (void)p_editorDoneChangingSelection:(id)a3 withFlags:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = -[TSDEditorController textInputEditor](self->mEditorController, "textInputEditor");
  v8 = TSUProtocolCast();
  -[TSDInteractiveCanvasController p_maybeSetTextResponderEditorTo:](self, "p_maybeSetTextResponderEditorTo:", v8);
  -[TSDTextInputResponder editorDidChangeSelection:withFlags:](self->mTextInputResponder, "editorDidChangeSelection:withFlags:", v7, a4);
  if (v8 && v7 != -[TSDEditorController textInputEditor](self->mEditorController, "textInputEditor"))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6745, CFSTR("Text input editor changed during -[TSDInteractiveCanvasController p_editorDoneChangingSelection]."));
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_editorDoneChangingSelection:withFlags:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6746, CFSTR("If the text input editor changes during p_editorDoneChangingSelection, you are likely to zombie 'editor' right now:"));
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate editorDidChangeSelectionWithTextInputEditor:changingEditor:](self->mDelegate, "editorDidChangeSelectionWithTextInputEditor:changingEditor:", v7, a3);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate editorDidChangeSelection:](self->mDelegate, "editorDidChangeSelection:", v7);
  }
}

- (double)p_targetPointSize
{
  double result;
  float v4;
  float v5;

  result = self->mTargetPointSize;
  if (result == 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "floatForKey:", CFSTR("TSDTargetPointSize"));
    v5 = v4;
    result = v4;
    self->mTargetPointSize = result;
    if (v5 == 0.0)
    {
      self->mTargetPointSize = 17.0;
      return 17.0;
    }
  }
  return result;
}

- (void)p_setTargetPointSize:(double)a3
{
  void *v4;
  double v5;

  self->mTargetPointSize = a3;
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  *(float *)&v5 = a3;
  objc_msgSend(v4, "setFloat:forKey:", CFSTR("TSDTargetPointSize"), v5);
}

- (BOOL)p_centerOnInitialSelection
{
  return objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "centerOnInitialSelection");
}

- (CGRect)p_outsetSelectionRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    v8 = *MEMORY[0x24BDBF070];
    v9 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v10 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v11 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  else
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    v21 = CGRectInset(v20, -15.0, -15.0);
    v8 = v21.origin.x;
    v9 = v21.origin.y;
    v10 = v21.size.width;
    v11 = v21.size.height;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:outsetSelectionRect:](self->mDelegate, "interactiveCanvasController:outsetSelectionRect:", self, x, y, width, height);
    v8 = v12;
    v9 = v13;
    v10 = v14;
    v11 = v15;
  }
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = v11;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6
{
  -[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:](self, "p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:", a3, a4, a5, 0, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (void)p_autoscrollToSelection:(id)a3 withInfo:(id)a4 isInitialSelection:(BOOL)a5 focusRect:(CGRect)a6 scrollImmediately:(BOOL)a7 skipZoom:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _BOOL4 v14;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  id v39;
  void *v40;
  id v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  char v64;
  double v65;
  void *v66;
  uint64_t v67;
  double v68;
  double v69;
  double v70;
  CGFloat v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  BOOL v86;
  _BOOL8 mShouldAnimateAutoscroll;
  CGFloat v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  float v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  double v103;
  CGFloat v104;
  CGFloat v105;
  double v106;
  double v107;
  CGFloat v108;
  CGFloat v109;
  CGFloat v110;
  CGFloat v111;
  CGFloat v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  uint64_t v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;
  CGRect v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v14 = a5;
  v118 = *MEMORY[0x24BDAC8D0];
  v18 = -[TSDEditorController textInputEditor](self->mEditorController, "textInputEditor");
  if (self->mAnimatingViewScale)
    return;
  v19 = v18;
  if (-[TSDInteractiveCanvasController p_shouldSuppressAutozoomForEditor:](self, "p_shouldSuppressAutozoomForEditor:", v18)|| !a7 && self->mTextGesturesInFlight)
  {
    return;
  }
  v20 = *MEMORY[0x24BDBF070];
  v21 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v22 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v23 = *(double *)(MEMORY[0x24BDBF070] + 24);
  v111 = v21;
  v112 = *MEMORY[0x24BDBF070];
  v109 = v23;
  v110 = v22;
  if (a4)
  {
    v24 = -[TSDInteractiveCanvasController layoutForInfoNearestVisibleRect:intersectingSelection:](self, "layoutForInfoNearestVisibleRect:intersectingSelection:", a4, a3);
    if (v24
      || (v24 = -[TSDInteractiveCanvasController layoutForInfo:](self, "layoutForInfo:", a4),
          v28 = v23,
          v27 = v22,
          v20 = v112,
          v26 = v21,
          v25 = v112,
          v24))
    {
      objc_msgSend(v24, "rectForSelection:", a3, v25, v26, v27, v28);
      objc_msgSend(v24, "rectInRoot:");
      -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:");
      v20 = v29;
      v21 = v30;
      v22 = v31;
      v23 = v32;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v19, "zoomRectForSelection:", a3);
      else
        objc_msgSend(v24, "frameInRoot");
      -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:");
    }
  }
  else
  {
    v33 = (void *)TSUProtocolCast();
    v28 = v23;
    v27 = v22;
    v26 = v21;
    v25 = v20;
    if (v33)
    {
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v34 = (void *)objc_msgSend(v33, "infos");
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
      v28 = v23;
      v27 = v22;
      v20 = v112;
      v26 = v21;
      v25 = v112;
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v114;
        v20 = v112;
        do
        {
          for (i = 0; i != v36; ++i)
          {
            if (*(_QWORD *)v114 != v37)
              objc_enumerationMutation(v34);
            v39 = -[TSDInteractiveCanvasController layoutForInfoNearestVisibleRect:](self, "layoutForInfoNearestVisibleRect:", *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i));
            if (v39)
            {
              v40 = v39;
              v41 = -[TSDInteractiveCanvasController p_repForLayout:createIfNeeded:](self, "p_repForLayout:createIfNeeded:", v39, 1);
              if (v41)
                objc_msgSend(v41, "frameInUnscaledCanvasIncludingChrome");
              else
                objc_msgSend(v40, "frameInRoot");
              -[TSDInteractiveCanvasController p_outsetSelectionRect:](self, "p_outsetSelectionRect:");
              v127.origin.x = v42;
              v127.origin.y = v43;
              v127.size.width = v44;
              v127.size.height = v45;
              v119.origin.x = v20;
              v119.origin.y = v21;
              v119.size.width = v22;
              v119.size.height = v23;
              v120 = CGRectUnion(v119, v127);
              v20 = v120.origin.x;
              v21 = v120.origin.y;
              v22 = v120.size.width;
              v23 = v120.size.height;
            }
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v113, v117, 16);
        }
        while (v36);
        v28 = v109;
        v27 = v110;
        v26 = v111;
        v25 = v112;
      }
    }
  }
  v104 = v28;
  v107 = v25;
  v98 = v26;
  v100 = v27;
  v121.origin.x = v20;
  v121.origin.y = v21;
  v121.size.width = v22;
  v121.size.height = v23;
  if (!CGRectIsNull(v121))
  {
    v122.size.height = v104;
    v122.origin.x = v107;
    v122.origin.y = v98;
    v122.size.width = v100;
    if (!CGRectIsEmpty(v122))
    {
      if (-[TSDInteractiveCanvasController shouldZoomOnSelectionChange](self, "shouldZoomOnSelectionChange"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[TSDInteractiveCanvasController p_targetPointSize](self, "p_targetPointSize");
          objc_msgSend(v19, "viewScaleForSelectionWithTargetPointSize:");
          *(float *)&v46 = v46;
          if (*(float *)&v46 > 0.0)
          {
            v47 = (void *)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer");
            -[TSDInteractiveCanvasController fitWidthViewScale](self, "fitWidthViewScale");
            objc_msgSend(v47, "maximumPinchViewScale");
            TSUClamp();
            *(float *)&v48 = v48;
            v97 = *(float *)&v48;
            -[TSDInteractiveCanvasController visibleUnscaledRect](self, "visibleUnscaledRect");
            v91 = v50;
            v94 = v49;
            v88 = v52;
            v89 = v51;
            -[TSDInteractiveCanvasController visibleUnscaledRectForAutoscroll](self, "visibleUnscaledRectForAutoscroll");
            v128.origin.x = v53;
            v128.origin.y = v54;
            v128.size.width = v55;
            v128.size.height = v56;
            v123.origin.y = v91;
            v123.origin.x = v94;
            v123.size.height = v88;
            v123.size.width = v89;
            if (!CGRectEqualToRect(v123, v128))
            {
              v57 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v58 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:]");
              objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6877, CFSTR("Scrolling automatically in an unsupported configuration!"));
            }
            -[TSDInteractiveCanvasController visibleBoundsRect](self, "visibleBoundsRect");
            v60 = v97;
            v92 = v61;
            v95 = v59 / v97;
            if (v22 > v95)
            {
              v96 = v59;
              -[TSDInteractiveCanvasController fitWidthViewScale](self, "fitWidthViewScale");
              objc_msgSend(v47, "maximumPinchViewScale");
              TSUClamp();
              *(float *)&v62 = v62;
              v97 = *(float *)&v62;
              v60 = *(float *)&v62;
              v95 = v96 / *(float *)&v62;
            }
            v90 = v60;
            if (v14)
            {
              v63 = -[TSDInteractiveCanvasController p_centerOnInitialSelection](self, "p_centerOnInitialSelection");
              if ((v63 & 1) != 0)
              {
                v64 = 1;
LABEL_40:
                v93 = v92 / v90;
                if (v107 > v20)
                {
                  v66 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                  v67 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController p_autoscrollToSelection:withInfo:isInitialSelection:focusRect:scrollImmediately:skipZoom:]");
                  v63 = objc_msgSend(v66, "handleFailureInFunction:file:lineNumber:description:", v67, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 6893, CFSTR("zoomrect should be a superrect of target rect"));
                }
                v68 = (v95 - v22) * 0.5;
                if (v68 < 0.0)
                  v68 = 0.0;
                v69 = v20 - v68;
                v70 = (v93 - v23) * 0.5;
                if (v70 < 0.0)
                  v70 = 0.0;
                v71 = TSDRectWithOriginAndSize(v63, v69, v21 - v70, v95, v93);
                v101 = TSDTranslatedRectMaximizingOverlapWithRect(v71, v72, v73, v74, v107, v98, v100, v104);
                v105 = v75;
                if ((v64 & 1) == 0)
                {
                  v99 = v77;
                  v108 = v76;
                  v124.origin.x = x;
                  v124.origin.y = y;
                  v124.size.width = width;
                  v124.size.height = height;
                  v129.origin.y = v111;
                  v129.origin.x = v112;
                  v129.size.height = v109;
                  v129.size.width = v110;
                  if (!CGRectEqualToRect(v124, v129))
                    TSDTranslatedRectMaximizingOverlapWithRect(v101, v105, v108, v99, x, y, width, height);
                }
                objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "contentInset");
                -[TSDCanvas unscaledSize](-[TSDInteractiveCanvasController canvas](self, "canvas"), "unscaledSize");
                TSUClamp();
                v102 = v78;
                objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "contentInset");
                -[TSDCanvas unscaledSize](-[TSDInteractiveCanvasController canvas](self, "canvas"), "unscaledSize");
                TSUClamp();
                -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v102, v79, v97);
                if (!a8)
                {
                  v103 = v81;
                  v106 = v80;
                  -[TSDInteractiveCanvasController viewScale](self, "viewScale");
                  v82 = v97;
                  if (v83 != v97
                    || ((-[TSDInteractiveCanvasController contentOffset](self, "contentOffset"), v82 = v97, v106 == v85)
                      ? (v86 = v103 == v84)
                      : (v86 = 0),
                        !v86))
                  {
                    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](self, "setViewScale:contentOffset:clampOffset:animated:", 1, 1, v82, v106, v103);
                    v21 = v111;
                    v20 = v112;
                    v23 = v109;
                    v22 = v110;
                  }
                }
                goto LABEL_56;
              }
            }
            v63 = -[TSDInteractiveCanvasController viewScale](self, "viewScale");
            if (v65 != v97)
            {
              v64 = 0;
              goto LABEL_40;
            }
          }
        }
      }
    }
  }
LABEL_56:
  v125.origin.x = v20;
  v125.origin.y = v21;
  v125.size.width = v22;
  v125.size.height = v23;
  if (!CGRectIsNull(v125))
  {
    v126.origin.x = x;
    v126.origin.y = y;
    v126.size.width = width;
    v126.size.height = height;
    if (!CGRectIsNull(v126))
    {
      v23 = height;
      v22 = width;
      v21 = y;
      v20 = x;
    }
    mShouldAnimateAutoscroll = self->mShouldAnimateAutoscroll;
    if (self->mShouldCenterSelectionWhenAutoscrolling)
      -[TSDInteractiveCanvasController scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:](self, "scrollRectToVisibleCenter:animated:onlyScrollNecessaryAxes:", mShouldAnimateAutoscroll, 1, v20, v21, v22, v23);
    else
      -[TSDInteractiveCanvasController scrollRectToVisible:animated:](self, "scrollRectToVisible:animated:", mShouldAnimateAutoscroll, v20, v21, v22, v23);
  }
}

- (void)i_syncWithLayoutThread
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __56__TSDInteractiveCanvasController_i_syncWithLayoutThread__block_invoke;
  v2[3] = &unk_24D829278;
  v2[4] = self;
  -[TSDInteractiveCanvasController p_acquireLockAndPerformAction:](self, "p_acquireLockAndPerformAction:", v2);
}

uint64_t __56__TSDInteractiveCanvasController_i_syncWithLayoutThread__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 418) = 0;
  return result;
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5
{
  -[TSDInteractiveCanvasController animateToViewScale:contentOffset:duration:completion:](self, "animateToViewScale:contentOffset:duration:completion:", 0, a3, a4.x, a4.y, a5);
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 completion:(id)a6
{
  -[TSDInteractiveCanvasController animateToViewScale:contentOffset:duration:forceAnimation:completion:](self, "animateToViewScale:contentOffset:duration:forceAnimation:completion:", 0, a6, a3, a4.x, a4.y, a5);
}

- (void)animateToViewScale:(double)a3 contentOffset:(CGPoint)a4 duration:(double)a5 forceAnimation:(BOOL)a6 completion:(id)a7
{
  double y;
  double x;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
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
  double v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  TSDCanvasAnimation *mCurrentAnimation;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CATransform3D v64;
  _QWORD v65[2];
  uint64_t (*v66)(uint64_t);
  void *v67;
  void *v68;
  void *v69;
  TSDInteractiveCanvasController *v70;
  id v71;
  double v72;
  double v73;
  double v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  CGAffineTransform v79;
  CGAffineTransform m;
  const __CFString *v81;
  _QWORD v82[2];

  y = a4.y;
  x = a4.x;
  v82[1] = *MEMORY[0x24BDAC8D0];
  if (!a6
    && (objc_msgSend((id)-[TSDCanvasLayerHosting canvasLayer](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasLayer"), "viewScale"), v13 == a3)&& (-[TSDInteractiveCanvasController contentOffset](self, "contentOffset"), x == v15)&& y == v14)
  {
    if (a7)
      (*((void (**)(id, uint64_t))a7 + 2))(a7, 1);
  }
  else if (!self->mAnimatingViewScale)
  {
    v61 = x;
    v62 = y;
    v63 = a5;
    self->mAnimatingViewScale = 1;
    v16 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
    v17 = (void *)objc_msgSend(v16, "canvasLayer");
    v18 = (void *)objc_msgSend(v16, "enclosingScrollView");
    -[TSDInteractiveCanvasController i_viewWillBeginZooming](self, "i_viewWillBeginZooming");
    objc_msgSend(v17, "bounds");
    v20 = v19;
    v22 = v21;
    objc_msgSend(v17, "contentInset");
    v24 = v23;
    v26 = v25;
    memset(&v79, 0, sizeof(v79));
    CGAffineTransformMakeTranslation(&v79, -v20, -v22);
    v78 = v79;
    CGAffineTransformTranslate(&m, &v78, v26, v24);
    v79 = m;
    v77 = m;
    objc_msgSend(v16, "setTransform:", &v77);
    objc_msgSend(v17, "bounds");
    v28 = v27;
    objc_msgSend(v17, "bounds");
    v58 = v26;
    v59 = v24;
    objc_msgSend(v17, "setBounds:", v26, v24, v28);
    -[TSDInteractiveCanvasController viewScale](self, "viewScale");
    v30 = v29;
    memset(&v78, 0, sizeof(v78));
    v60 = a3;
    v31 = a3 / v29;
    if (v16)
      objc_msgSend(v16, "transform");
    v76 = v78;
    CGAffineTransformTranslate(&m, &v76, v20, v22);
    v78 = m;
    v76 = m;
    CGAffineTransformScale(&m, &v76, a3 / v30, a3 / v30);
    v78 = m;
    objc_msgSend(v17, "position");
    v33 = v32;
    v35 = v34;
    objc_msgSend(v18, "contentOffset");
    v37 = v36;
    v39 = v38;
    v40 = TSDSubtractPoints(v36, v38, v33);
    v42 = TSDMultiplyPointScalar(v40, v41, v31);
    v44 = TSDSubtractPoints(v42, v43, v40);
    v45 = TSDSubtractPoints(v33, v35, v44);
    v47 = v46;
    v48 = v58 - v58 * v31 + -(v37 - v61 * v30) * v31;
    v75 = v78;
    v49 = v59 - v59 * v31 + -(v39 - v62 * v30) * v31;
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v66 = __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke_2;
    v67 = &unk_24D82B5B0;
    v68 = v17;
    v69 = v16;
    v72 = v60;
    v73 = v61;
    v74 = v62;
    v70 = self;
    v71 = a7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[TSDInteractiveCanvasControllerDelegate interactiveCanvasController:willAnimateToViewScale:withDuration:unscaledContentOffset:](self->mDelegate, "interactiveCanvasController:willAnimateToViewScale:withDuration:unscaledContentOffset:", self, v60, v63, v61, v62);
    v50 = v45 - v48;
    v51 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v81 = CFSTR("TSDInteractiveCanvasControllerDurationKey");
    *(float *)&v52 = v63;
    v82[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v52);
    objc_msgSend(v51, "postNotificationName:object:userInfo:", CFSTR("TSDCanvasUpdateZoomNotification"), self, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1));
    if (v63 <= 0.0)
    {
      m = v75;
      objc_msgSend(v16, "setTransform:", &m);
      objc_msgSend(v17, "setPosition:", v50, v47 - v49);
      v66((uint64_t)v65);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setCompletionBlock:", v65);
      v53 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("position"));
      objc_msgSend(v53, "setToValue:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v50, v47 - v49));
      v54 = (void *)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform"));
      v55 = (void *)MEMORY[0x24BDD1968];
      m = v78;
      CATransform3DMakeAffineTransform(&v64, &m);
      objc_msgSend(v54, "setToValue:", objc_msgSend(v55, "valueWithCATransform3D:", &v64));
      v56 = (void *)objc_msgSend(MEMORY[0x24BDE5638], "animation");
      objc_msgSend(v56, "setAnimations:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v53, v54, 0));
      objc_msgSend(v56, "setDuration:", v63);
      objc_msgSend(v56, "setTimingFunction:", objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]));
      objc_msgSend(v56, "setRemovedOnCompletion:", 0);
      objc_msgSend(v56, "setFillMode:", *MEMORY[0x24BDE5970]);
      mCurrentAnimation = self->mCurrentAnimation;
      if (mCurrentAnimation)
      {
        -[TSDCanvasAnimation beginTime](mCurrentAnimation, "beginTime");
        objc_msgSend(v56, "setBeginTime:");
        objc_msgSend(v56, "setBeginTimeMode:", -[TSDCanvasAnimation beginTimeMode](self->mCurrentAnimation, "beginTimeMode"));
      }
      objc_msgSend(v17, "addAnimation:forKey:", v56, CFSTR("viewScaleAnimation"));
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    }
  }
}

uint64_t __102__TSDInteractiveCanvasController_animateToViewScale_contentOffset_duration_forceAnimation_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t result;
  _OWORD v8[8];

  objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:", CFSTR("viewScaleAnimation"));
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "enclosingScrollView"), "layer"), "removeAllAnimations");
  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
  v8[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
  v8[5] = v3;
  v4 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
  v8[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
  v8[7] = v4;
  v5 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
  v8[0] = *MEMORY[0x24BDE5598];
  v8[1] = v5;
  v6 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
  v8[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);
  objc_msgSend(*(id *)(a1 + 48), "p_applyViewScale:andContentOffset:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "interactiveCanvasControllerDidAnimateViewScale:");
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 496) = 0;
  objc_msgSend(*(id *)(a1 + 48), "viewDidEndZooming");
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)p_applyViewScale:(double)a3 andContentOffset:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  self->mIgnoreContentOffsetChanges = 1;
  -[TSDInteractiveCanvasController setViewScale:](self, "setViewScale:", a3);
  self->mIgnoreContentOffsetChanges = 0;
  -[TSDInteractiveCanvasController setContentOffset:animated:](self, "setContentOffset:animated:", 0, x, y);
}

- (void)doubleTappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDInteractiveCanvasControllerDelegate doubleTappedCanvasBackgroundAtPoint:](self->mDelegate, "doubleTappedCanvasBackgroundAtPoint:", x, y);
}

- (id)viewWithTransferredLayers
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  if (!-[TSDInteractiveCanvasController isCanvasInteractive](self, "isCanvasInteractive"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInteractiveCanvasController viewWithTransferredLayers]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 7130, CFSTR("viewWithTransferredLayers makes sense only when the canvas is interactive"));
  }
  v5 = (void *)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "canvasView");
  v6 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(v5, "frame");
  v7 = (void *)objc_msgSend(v6, "initWithFrame:");
  objc_msgSend(v5, "bounds");
  objc_msgSend(v7, "setBounds:");
  v8 = (void *)-[NSArray copy](-[CALayer sublayers](-[TSDInteractiveCanvasController repContainerLayer](self, "repContainerLayer"), "sublayers"), "copy");
  objc_msgSend(v8, "makeObjectsPerformSelector:", sel_removeFromSuperlayer);
  objc_msgSend((id)objc_msgSend(v7, "layer"), "setSublayers:", v8);

  self->mOverlayLayer = 0;
  return v7;
}

- (CGPoint)lastTapPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastTapPoint.x;
  y = self->mLastTapPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (id)canvasReferenceController
{
  return 0;
}

- (TSDCanvasLayerHosting)layerHost
{
  return self->mLayerHost;
}

- (void)setLastTapPoint:(CGPoint)a3
{
  self->mLastTapPoint = a3;
}

- (TSDCanvas)canvas
{
  return self->mCanvas;
}

- (TSDInteractiveCanvasControllerDelegate)delegate
{
  return self->mDelegate;
}

- (BOOL)inspectorModeEnabled
{
  return self->mInspectorModeEnabled;
}

- (BOOL)shouldSuppressRendering
{
  return self->mShouldSuppressRendering;
}

- (BOOL)animatingViewScale
{
  return self->mAnimatingViewScale;
}

- (BOOL)textGesturesInFlight
{
  return self->mTextGesturesInFlight;
}

- (void)setTextGesturesInFlight:(BOOL)a3
{
  self->mTextGesturesInFlight = a3;
}

- (TSDRulerController)rulerController
{
  return self->mRulerController;
}

- (void)setRulerController:(id)a3
{
  self->mRulerController = (TSDRulerController *)a3;
}

- (TSDRepDirectLayerHostProvider)directLayerHostProvider
{
  return self->_directLayerHostProvider;
}

- (void)setDirectLayerHostProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 648);
}

- (BOOL)resizeCanvasOnLayout
{
  return self->mResizeCanvasOnLayout;
}

- (void)setResizeCanvasOnLayout:(BOOL)a3
{
  self->mResizeCanvasOnLayout = a3;
}

- (void)setCanvasEditor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (BOOL)preventSettingNilEditorOnTextResponder
{
  return self->mPreventSettingNilEditorOnTextResponder;
}

- (void)setPreventSettingNilEditorOnTextResponder:(BOOL)a3
{
  self->mPreventSettingNilEditorOnTextResponder = a3;
}

- (BOOL)createRepsForOffscreenLayouts
{
  return self->mCreateRepsForOffscreenLayouts;
}

- (void)setCreateRepsForOffscreenLayouts:(BOOL)a3
{
  self->mCreateRepsForOffscreenLayouts = a3;
}

- (BOOL)allowLayoutAndRenderOnThread
{
  return self->mLayoutAndRenderOnThreadDuringScroll;
}

- (BOOL)staticLayoutAndRenderOnThread
{
  return self->mStaticLayoutAndRenderOnThread;
}

- (BOOL)nestedCanvasAllowLayoutAndRenderOnThread
{
  return self->mNestedCanvasAllowLayoutAndRenderOnThread;
}

- (void)setNestedCanvasAllowLayoutAndRenderOnThread:(BOOL)a3
{
  self->mNestedCanvasAllowLayoutAndRenderOnThread = a3;
}

- (BOOL)forceTilingLayoutOnThreadWhenScrolling
{
  return self->mForceTilingLayoutOnThreadWhenScrolling;
}

- (void)setForceTilingLayoutOnThreadWhenScrolling:(BOOL)a3
{
  self->mForceTilingLayoutOnThreadWhenScrolling = a3;
}

- (BOOL)currentlyWaitingOnThreadedLayoutAndRender
{
  return self->mCurrentlyWaitingOnThreadedLayoutAndRender;
}

- (BOOL)shouldAutoscrollToSelectionAfterLayout
{
  return self->mShouldAutoscrollToSelectionAfterLayout;
}

- (void)setShouldAutoscrollToSelectionAfterLayout:(BOOL)a3
{
  self->mShouldAutoscrollToSelectionAfterLayout = a3;
}

- (BOOL)suppressAutozoomToSelectionAfterLayout
{
  return self->mSuppressAutozoomToSelectionAfterLayout;
}

- (void)setSuppressAutozoomToSelectionAfterLayout:(BOOL)a3
{
  self->mSuppressAutozoomToSelectionAfterLayout = a3;
}

- (void)setUnobscuredScrollViewFrame:(CGRect)a3
{
  self->mUnobscuredScrollViewFrame = a3;
}

- (BOOL)shouldClipThemeContentToCanvas
{
  return self->mShouldClipThemeContentToCanvas;
}

- (void)setShouldClipThemeContentToCanvas:(BOOL)a3
{
  self->mShouldClipThemeContentToCanvas = a3;
}

- (CGRect)p_visibleBoundsRectForTiling
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->mVisibleBoundsRectForTiling, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setP_visibleBoundsRectForTiling:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->mVisibleBoundsRectForTiling, &v3, 32, 1, 0);
}

- (CGRect)p_visibleUnscaledRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->mVisibleUnscaledRect, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setP_visibleUnscaledRect:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->mVisibleUnscaledRect, &v3, 32, 1, 0);
}

- (CALayer)repContainerLayer
{
  return self->mRepContainerLayer;
}

- (CALayer)overlayLayer
{
  return self->mOverlayLayer;
}

- (BOOL)overlayLayerSuppressed
{
  return self->mOverlayLayerSuppressed;
}

- (BOOL)showGrayOverlay
{
  return self->mShowGrayOverlay;
}

- (void)setShowGrayOverlay:(BOOL)a3
{
  self->mShowGrayOverlay = a3;
}

- (BOOL)inVersionBrowsingMode
{
  return self->mInVersionBrowsingMode;
}

- (void)setInVersionBrowsingMode:(BOOL)a3
{
  self->mInVersionBrowsingMode = a3;
}

- (BOOL)inReadMode
{
  return self->mInReadMode;
}

- (BOOL)showInvisibleObjects
{
  return self->mShowInvisibleObjects;
}

- (TSDTrackingController)trackingController
{
  return self->mTrackingController;
}

- (void)setTrackingController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 656);
}

- (BOOL)supportsBackgroundTileRendering
{
  return self->mSupportsBackgroundTileRendering;
}

- (void)setSupportsBackgroundTileRendering:(BOOL)a3
{
  self->mSupportsBackgroundTileRendering = a3;
}

- (NSSet)p_cachedTopLevelTilingLayers
{
  return (NSSet *)objc_getProperty(self, a2, 664, 1);
}

- (void)setP_cachedTopLevelTilingLayers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 664);
}

- ($73314616FDF354EDC5180AB8A0BD2955)screenTopContentPlacement
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v8;
  double v9;
  double MinY;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  $73314616FDF354EDC5180AB8A0BD2955 result;
  CGRect v16;
  CGRect v17;

  -[TSDInteractiveCanvasController i_clippingBoundsForScrollViewEnclosingCanvas](self, "i_clippingBoundsForScrollViewEnclosingCanvas");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  MidX = CGRectGetMidX(v16);
  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v9 = MidX / v8;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MinY = CGRectGetMinY(v17);
  v11 = -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  TSDContentPlacementWithAnchorPoint(v11, v9, MinY / v12);
  result.var0.y = v14;
  result.var0.x = v13;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)screenBottomContentPlacement
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v8;
  double v9;
  double MaxY;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  $73314616FDF354EDC5180AB8A0BD2955 result;
  CGRect v16;
  CGRect v17;

  -[TSDInteractiveCanvasController i_clippingBoundsForScrollViewEnclosingCanvas](self, "i_clippingBoundsForScrollViewEnclosingCanvas");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  MidX = CGRectGetMidX(v16);
  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v9 = MidX / v8;
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  MaxY = CGRectGetMaxY(v17);
  v11 = -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  TSDContentPlacementWithAnchorPoint(v11, v9, MaxY / v12);
  result.var0.y = v14;
  result.var0.x = v13;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  double v2;
  double v3;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "touchContentPlacement");
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  double v2;
  double v3;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  objc_msgSend((id)-[TSDCanvasLayerHosting asiOSCVC](-[TSDInteractiveCanvasController layerHost](self, "layerHost"), "asiOSCVC"), "centerPlusMovementContentPlacement");
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- (id)clampContentLocation:(id)a3 forPlacement:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  y = a4.var0.y;
  x = a4.var0.x;
  v7 = -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", a3, a4.var0.x, a4.var0.y, 0.0, 0.0);
  objc_msgSend(v7, "unscaledPoint");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "viewScale");
  -[TSDInteractiveCanvasController clampedUnscaledContentOffset:forViewScale:](self, "clampedUnscaledContentOffset:forViewScale:", v9, v11, v12);
  objc_msgSend(v7, "setUnscaledPoint:");
  return -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", v7, 0.0, 0.0, x, y);
}

- (id)convertContentLocation:(id)a3 fromPlacement:(id)a4 toPlacement:(id)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v7 = TSDSubtractPoints(a5.var0.x, a5.var0.y, a4.var0.x);
  v9 = v8;
  objc_msgSend(a3, "unscaledPoint");
  v11 = v10;
  v13 = v12;
  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v15 = v7 * v14;
  objc_msgSend(a3, "viewScale");
  v17 = v11 + v15 / v16;
  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v19 = v9 * v18;
  objc_msgSend(a3, "viewScale");
  v21 = v13 + v19 / v20;
  objc_msgSend(a3, "viewScale");
  return +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", v17, v21, v22);
}

- (id)clampedCenterContentLocationForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5
{
  return -[TSDInteractiveCanvasController clampContentLocation:forPlacement:](self, "clampContentLocation:forPlacement:", -[TSDInteractiveCanvasController convertContentLocation:fromPlacement:toPlacement:](self, "convertContentLocation:fromPlacement:toPlacement:", +[TSDContentLocation contentLocationWithUnscaledPoint:viewScale:](TSDContentLocation, "contentLocationWithUnscaledPoint:viewScale:", a3.x, a3.y, a5), a4.var0.x, a4.var0.y, 0.5, 0.5), 0.5, 0.5);
}

- (CGPoint)clampedCenterPointForPoint:(CGPoint)a3 withPlacement:(id)a4 viewScale:(double)a5
{
  double v5;
  double v6;
  CGPoint result;

  objc_msgSend(-[TSDInteractiveCanvasController clampedCenterContentLocationForPoint:withPlacement:viewScale:](self, "clampedCenterContentLocationForPoint:withPlacement:viewScale:", a3.x, a3.y, a4.var0.x, a4.var0.y, a5), "unscaledPoint");
  result.y = v6;
  result.x = v5;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)contentPlacementForPoint:(CGPoint)a3 inView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  -[TSKScrollView convertPoint:fromView:](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "convertPoint:fromView:", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  -[TSKScrollView contentOffset](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "contentOffset");
  v10 = TSDSubtractPoints(v6, v8, v9);
  v12 = v11;
  -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  v14 = v10 / v13;
  v15 = -[TSKScrollView bounds](-[TSDCanvasView enclosingScrollView](-[TSDInteractiveCanvasController canvasView](self, "canvasView"), "enclosingScrollView"), "bounds");
  TSDContentPlacementWithAnchorPoint(v15, v14, v12 / v16);
  result.var0.y = v18;
  result.var0.x = v17;
  return result;
}

@end
