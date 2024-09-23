@implementation TSDiOSCanvasViewController

- ($73314616FDF354EDC5180AB8A0BD2955)touchContentPlacement
{
  double v2;
  double v3;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  -[TSDGuidedPanController touchContentPlacement](self->mGuidedPanController, "touchContentPlacement");
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- ($73314616FDF354EDC5180AB8A0BD2955)centerPlusMovementContentPlacement
{
  double v2;
  double v3;
  $73314616FDF354EDC5180AB8A0BD2955 result;

  -[TSDGuidedPanController centerPlusMovementContentPlacement](self->mGuidedPanController, "centerPlusMovementContentPlacement");
  result.var0.y = v3;
  result.var0.x = v2;
  return result;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  id result;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDiOSCanvasViewController;
  if (-[TSDiOSCanvasViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    v6.receiver = self;
    v6.super_class = (Class)TSDiOSCanvasViewController;
    return -[TSDiOSCanvasViewController methodSignatureForSelector:](&v6, sel_methodSignatureForSelector_, a3);
  }
  else
  {
    result = (id)methodSignatureForSelector__s_actionMethodSignature_0;
    if (!methodSignatureForSelector__s_actionMethodSignature_0)
    {
      result = (id)objc_msgSend(MEMORY[0x24BDBCEB0], "signatureWithObjCTypes:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s%s%s%s"), "v", "@", ":", "@"), "UTF8String"));
      methodSignatureForSelector__s_actionMethodSignature_0 = (uint64_t)result;
    }
  }
  return result;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  int v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDiOSCanvasViewController;
  if (-[TSDiOSCanvasViewController respondsToSelector:](&v7, sel_respondsToSelector_))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = +[TSDInteractiveCanvasController selectorIsActionMethod:](TSDInteractiveCanvasController, "selectorIsActionMethod:", a3);
    if (v5)
    {
      -[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController");
      LOBYTE(v5) = objc_opt_respondsToSelector();
    }
  }
  return v5 & 1;
}

- (void)forwardInvocation:(id)a3
{
  objc_msgSend(a3, "invokeWithTarget:", -[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"));
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (!self->mHasBeenTornDown)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController dealloc]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 151, CFSTR("CVC should have been torn down before dealloc"));
  }

  self->mInspectorGestureRecognizersToReenable = 0;
  self->mInspectorSingleTapBlock = 0;

  self->mSingleTapGestureRecognizer = 0;
  self->mDoubleTapGestureRecognizer = 0;

  self->mEditMenuTapGestureRecognizer = 0;
  self->mKnobDragGestureRecognizer = 0;

  self->mMultiSelectGestureRecognizer = 0;
  self->mRepDragGestureRecognizer = 0;

  self->mRepRotateGestureRecognizer = 0;
  self->mZoomGestureRecognizer = 0;

  self->mNudgeGestureRecognizer = 0;
  self->mAllTouchesDoneGestureRecognizer = 0;

  self->mPreventScrollGestureRecognizer = 0;
  self->mGuidedPanGestureRecognizer = 0;

  self->mGuidedPanController = 0;
  self->mSubviewsController = 0;
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSCanvasViewController;
  -[TSDiOSCanvasViewController dealloc](&v5, sel_dealloc);
}

- (void)teardown
{
  void *v3;
  uint64_t v4;

  if (-[TSDiOSCanvasViewController isViewLoaded](self, "isViewLoaded"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
    -[TSDCanvasView teardown](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "teardown");
  }
  self->mHasBeenTornDown = 1;
  -[TSDCanvasSubviewsController teardown](self->mSubviewsController, "teardown");
  if (-[NSSet count](-[TSDCanvasSubviewsController repChildViews](self->mSubviewsController, "repChildViews"), "count"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController teardown]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 183, CFSTR("subviews of cvc %@ not torn down: %@"), self, -[TSDCanvasSubviewsController repChildViews](self->mSubviewsController, "repChildViews"));
  }
  -[TSDiOSCanvasViewController resignFirstResponder](self, "resignFirstResponder");
  -[TSDInteractiveCanvasController i_layerHostHasBeenTornDown](self->mICC, "i_layerHostHasBeenTornDown");
  self->mICC = 0;
}

- (void)loadView
{
  -[TSDiOSCanvasViewController setView:](self, "setView:", objc_alloc_init(TSDCanvasView));
}

- (void)viewDidLoad
{
  TSDCanvasView *v3;
  TSDCanvasView *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  TSDCanvas *v9;
  TSKScrollView *v10;
  TSKScrollView *v11;
  void *v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSDiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = -[TSDiOSCanvasViewController canvasView](self, "canvasView");
  if (v3)
  {
    v4 = v3;
    self->mSubviewsController = -[TSDCanvasSubviewsController initWithLayerAndSubviewHost:]([TSDCanvasSubviewsController alloc], "initWithLayerAndSubviewHost:", self);
    -[TSDiOSCanvasViewController setWantsFullScreenLayout:](self, "setWantsFullScreenLayout:", 1);
    if (!self->mICC)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController viewDidLoad]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 211, CFSTR("invalid nil value for '%s'"), "mICC");
    }
    -[TSDInteractiveCanvasController viewScale](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v8 = v7;
    -[TSDCanvasView setController:](v4, "setController:", self->mICC);
    -[TSDCanvas setViewScale:](-[TSDInteractiveCanvasController canvas](self->mICC, "canvas"), "setViewScale:", v8);
    v9 = -[TSDInteractiveCanvasController canvas](self->mICC, "canvas");
    TSUScreenScale();
    -[TSDCanvas i_setContentsScale:](v9, "i_setContentsScale:");
    -[TSDCanvas i_setCanvasIsWideGamut:](-[TSDInteractiveCanvasController canvas](self->mICC, "canvas"), "i_setCanvasIsWideGamut:", -[TSDiOSCanvasViewController p_shouldUseWideGamut](self, "p_shouldUseWideGamut"));
    -[TSDCanvasView setMultipleTouchEnabled:](v4, "setMultipleTouchEnabled:", 1);
    -[TSDCanvasView setExclusiveTouch:](v4, "setExclusiveTouch:", 1);
    -[TSDCanvasView setClipsToBounds:](v4, "setClipsToBounds:", 1);
    -[TSDCanvasView setClearsContextBeforeDrawing:](v4, "setClearsContextBeforeDrawing:", 0);
    v10 = -[TSDCanvasView enclosingScrollView](v4, "enclosingScrollView");
    if (v10)
    {
      v11 = v10;
      if (!-[TSKScrollView delegate](v10, "delegate"))
        -[TSKScrollView setDelegate:](v11, "setDelegate:", self->mICC);
      -[TSDCanvasLayer fixFrameAndScrollView](-[TSDiOSCanvasViewController canvasLayer](self, "canvasLayer"), "fixFrameAndScrollView");
      -[TSKScrollView setAutoresizesSubviews:](v11, "setAutoresizesSubviews:", 0);
      -[TSKScrollView setDelaysContentTouches:](v11, "setDelaysContentTouches:", 0);
      -[TSKScrollView setCanCancelContentTouches:](v11, "setCanCancelContentTouches:", 1);
    }
    -[TSDInteractiveCanvasController setTextGesturesInFlight:](self->mICC, "setTextGesturesInFlight:", 0);
    -[TSDiOSCanvasViewController setUpGestureRecognizers](self, "setUpGestureRecognizers");
    -[TSDiOSCanvasViewController becomeFirstResponder](self, "becomeFirstResponder");
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController viewDidLoad]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 199, CFSTR("invalid nil value for '%s'"), "canvasView");
  }
}

- (BOOL)p_shouldUseWideGamut
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)-[TSDiOSCanvasViewController traitCollection](self, "traitCollection");
  if (!v3 || (v4 = objc_msgSend(v3, "displayGamut"), v4 == -1))
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view"), "window"), "traitCollection");
    if (v5)
      v4 = objc_msgSend(v5, "displayGamut");
    else
      v4 = -1;
  }
  return v4 == 1 || v4 == -1;
}

- (void)p_updateWideGamut
{
  TSDCanvas *v3;
  _BOOL8 v4;

  v3 = -[TSDInteractiveCanvasController canvas](self->mICC, "canvas");
  v4 = -[TSDiOSCanvasViewController p_shouldUseWideGamut](self, "p_shouldUseWideGamut");
  if (v4 != -[TSDCanvas canvasIsWideGamut](v3, "canvasIsWideGamut"))
  {
    -[TSDCanvas i_setCanvasIsWideGamut:](v3, "i_setCanvasIsWideGamut:", v4);
    -[TSDInteractiveCanvasController i_canvasWideGamutValueDidChange](self->mICC, "i_canvasWideGamutValueDidChange");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TSDiOSCanvasViewController p_updateWideGamut](self, "p_updateWideGamut");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[TSDInteractiveCanvasController currentlyScrolling](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling"))
  {
    -[TSDiOSCanvasViewController forceStopScrolling](self, "forceStopScrolling");
  }
  v5.receiver = self;
  v5.super_class = (Class)TSDiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

- (BOOL)becomeFirstResponder
{
  objc_super v4;

  -[TSDInteractiveCanvasController i_cvcWillBecomeFirstResponder](self->mICC, "i_cvcWillBecomeFirstResponder");
  v4.receiver = self;
  v4.super_class = (Class)TSDiOSCanvasViewController;
  return -[TSDiOSCanvasViewController becomeFirstResponder](&v4, sel_becomeFirstResponder);
}

- (TSDCanvasLayer)canvasLayer
{
  objc_opt_class();
  objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view"), "layer");
  return (TSDCanvasLayer *)TSUDynamicCast();
}

- (TSDCanvasView)canvasView
{
  objc_opt_class();
  -[TSDiOSCanvasViewController view](self, "view");
  return (TSDCanvasView *)TSUDynamicCast();
}

- (CALayer)layer
{
  return (CALayer *)objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view"), "layer");
}

- (CALayer)clippingLayer
{
  return (CALayer *)-[TSKScrollView layer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "layer");
}

- (BOOL)isInFocusedContainer
{
  return 1;
}

- (id)hitRepWithTouch:(id)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v12;
  uint64_t v13;

  if (-[TSDInteractiveCanvasController allowLayoutAndRenderOnThread](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "allowLayoutAndRenderOnThread")&& -[TSDInteractiveCanvasController currentlyScrolling](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController hitRepWithTouch:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 350, CFSTR("unsafe to find hit reps during scroll if we layout and render on a thread during scroll"));
  }
  if (a3)
  {
    objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v7, v8);
    return -[TSDInteractiveCanvasController hitRep:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:", v9, v10);
  }
  else
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController hitRepWithTouch:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 351, CFSTR("invalid nil value for '%s'"), "touch");
    return 0;
  }
}

- (id)hitKnobWithTouch:(id)a3 returningRep:(id *)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v11;
  uint64_t v12;

  if (a3)
  {
    objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "convertBoundsToUnscaledPoint:", v6, v7);
    return -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitKnobAtPoint:returningRep:", a4, v8, v9);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController hitKnobWithTouch:returningRep:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 366, CFSTR("invalid nil value for '%s'"), "touch");
    if (a4)
      *a4 = 0;
    return 0;
  }
}

- (NSArray)commonGestureRecognizers
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", -[TSDiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"), -[TSDiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"), -[TSDiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"), -[TSDiOSCanvasViewController knobDragGestureRecognizer](self, "knobDragGestureRecognizer"), -[TSDiOSCanvasViewController multiSelectGestureRecognizer](self, "multiSelectGestureRecognizer"), -[TSDiOSCanvasViewController repDragGestureRecognizer](self, "repDragGestureRecognizer"), -[TSDiOSCanvasViewController repRotateGestureRecognizer](self, "repRotateGestureRecognizer"), -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"), -[TSDiOSCanvasViewController nudgeGestureRecognizer](self, "nudgeGestureRecognizer"), 0);
}

- (NSSet)panGestureRecognizers
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", -[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), self->mGuidedPanGestureRecognizer, 0);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  TSDInteractiveCanvasControllerDelegate *v5;
  TSDInteractiveCanvasController *mICC;

  if (self->mGuidedPanGestureRecognizer == a3)
  {
    -[TSDInteractiveCanvasController delegate](self->mICC, "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[TSDInteractiveCanvasController delegate](self->mICC, "delegate");
      mICC = self->mICC;
      -[UIPanGestureRecognizer direction](self->mGuidedPanGestureRecognizer, "direction");
      return -[TSDInteractiveCanvasControllerDelegate interactiveCanvasControllerShouldUseGuidedPan:withMovementDirection:](v5, "interactiveCanvasControllerShouldUseGuidedPan:withMovementDirection:", mICC);
    }
    else
    {
      return 0;
    }
  }
  else if (-[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer") == a3)
  {
    return -[TSKScrollView isDragging](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "isDragging") ^ 1;
  }
  else
  {
    return 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  TSDCanvasView *v7;
  uint64_t v8;

  if (-[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer") == a3
    || self->mGuidedPanGestureRecognizer == a3)
  {
    return 1;
  }
  v7 = -[TSDiOSCanvasViewController canvasView](self, "canvasView");
  objc_msgSend(a4, "locationInView:", v7);
  v8 = -[TSDCanvasView hitTest:withEvent:](v7, "hitTest:withEvent:", 0);
  if (-[TSDiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer") == a3)
    self->mContextMenuMightBeDisplayed = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "isMenuVisible");
  return v8 == (_QWORD)v7;
}

- (void)setUpGestureRecognizers
{
  TSDCanvasView *v3;
  void *v4;
  uint64_t v5;
  TSDTapGestureRecognizer *v6;
  TSDTapGestureRecognizer *v7;
  TSDEditMenuTapGestureRecognizer *v8;
  TSDKnobDragGestureRecognizer *v9;
  TSDAllTouchesDoneGestureRecognizer *v10;
  TSDCanvasZoomPinchGestureRecognizer *v11;
  TSDPreventScrollGestureRecognizer *v12;
  UIPanGestureRecognizer *v13;

  if ((TSUSupportsTextInteraction() & 1) == 0)
  {
    v3 = -[TSDiOSCanvasViewController canvasView](self, "canvasView");
    if (objc_msgSend((id)-[TSDCanvasView gestureRecognizers](v3, "gestureRecognizers"), "count"))
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController setUpGestureRecognizers]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 458, CFSTR("-[TSDICC setUpGestureRecognizers] should be called only once each time the view is loaded"));
    }
    v6 = -[TSDTapGestureRecognizer initWithTarget:action:]([TSDTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_p_handleSingleTapGesture_);
    -[TSDTapGestureRecognizer setDelegate:](v6, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v6);
    -[TSDiOSCanvasViewController setSingleTapGestureRecognizer:](self, "setSingleTapGestureRecognizer:", v6);

    v7 = -[TSDTapGestureRecognizer initWithTarget:action:]([TSDTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_handleDoubleTap_);
    -[TSDTapGestureRecognizer setNumberOfTapsRequired:](v7, "setNumberOfTapsRequired:", 2);
    -[TSDTapGestureRecognizer setDelegate:](v7, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v7);
    -[TSDiOSCanvasViewController setDoubleTapGestureRecognizer:](self, "setDoubleTapGestureRecognizer:", v7);

    v8 = -[TSDEditMenuTapGestureRecognizer initWithTarget:action:]([TSDEditMenuTapGestureRecognizer alloc], "initWithTarget:action:", self, sel_p_handleTapForEditMenu_);
    -[TSDEditMenuTapGestureRecognizer setDelegate:](v8, "setDelegate:", self);
    -[TSDEditMenuTapGestureRecognizer requireGestureRecognizerToFail:](v8, "requireGestureRecognizerToFail:", -[TSDiOSCanvasViewController doubleTapGestureRecognizer](self, "doubleTapGestureRecognizer"));
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v8);
    -[TSDiOSCanvasViewController setEditMenuTapGestureRecognizer:](self, "setEditMenuTapGestureRecognizer:", v8);

    v9 = -[TSDKnobDragGestureRecognizer initWithInteractiveCanvasController:]([TSDKnobDragGestureRecognizer alloc], "initWithInteractiveCanvasController:", self->mICC);
    -[TSDKnobDragGestureRecognizer setDelegate:](v9, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v9);
    -[TSDiOSCanvasViewController setKnobDragGestureRecognizer:](self, "setKnobDragGestureRecognizer:", v9);

    v10 = -[TSDAllTouchesDoneGestureRecognizer initWithTarget:action:]([TSDAllTouchesDoneGestureRecognizer alloc], "initWithTarget:action:", self, sel_p_allTouchesDone_);
    -[TSDAllTouchesDoneGestureRecognizer setDelegate:](v10, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v10);
    -[TSDiOSCanvasViewController setAllTouchesDoneGestureRecognizer:](self, "setAllTouchesDoneGestureRecognizer:", v10);

    v11 = -[TSDCanvasZoomPinchGestureRecognizer initWithTarget:action:]([TSDCanvasZoomPinchGestureRecognizer alloc], "initWithTarget:action:", self, sel_p_zoomWithGesture_);
    -[TSDCanvasZoomPinchGestureRecognizer setDelegate:](v11, "setDelegate:", self);
    -[TSDCanvasZoomPinchGestureRecognizer setAllowedTouchTypes:](v11, "setAllowedTouchTypes:", &unk_24D8FA320);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v11);
    -[TSDiOSCanvasViewController setZoomGestureRecognizer:](self, "setZoomGestureRecognizer:", v11);

    -[TSDiOSCanvasViewController i_updateZoomGestureRecognizer](self, "i_updateZoomGestureRecognizer");
    v12 = -[TSDPreventScrollGestureRecognizer initWithInteractiveCanvasController:]([TSDPreventScrollGestureRecognizer alloc], "initWithInteractiveCanvasController:", self->mICC);
    -[TSDPreventScrollGestureRecognizer setDelegate:](v12, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v12);

    self->mPreventScrollGestureRecognizer = v12;
    v13 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6C38]), "initWithTarget:action:", self, sel_p_guidedPanWithGesture_);
    -[UIPanGestureRecognizer setDelegate:](v13, "setDelegate:", self);
    -[TSDCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v13);

    self->mGuidedPanGestureRecognizer = v13;
    objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "requireGestureRecognizerToFail:", v13);
  }
}

- (void)resetGesturesForContextSwitch
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend((id)-[TSDiOSCanvasViewController view](self, "view", 0), "gestureRecognizers");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "isEnabled"))
        {
          objc_msgSend(v8, "setEnabled:", 0);
          objc_msgSend(v8, "setEnabled:", 1);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  if (-[TSDEditMenuTapGestureRecognizer isEnabled](-[TSDiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"), "isEnabled"))-[TSDEditMenuTapGestureRecognizer setIgnoreTargetAction:](-[TSDiOSCanvasViewController editMenuTapGestureRecognizer](self, "editMenuTapGestureRecognizer"), "setIgnoreTargetAction:", 1);
}

- (void)i_updateZoomGestureRecognizer
{
  -[UIPinchGestureRecognizer setEnabled:](-[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"), "setEnabled:", -[TSDCanvasLayer allowsPinchZoom](-[TSDiOSCanvasViewController canvasLayer](self, "canvasLayer"), "allowsPinchZoom"));
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y;
  double x;
  id v8;
  id v9;
  _BOOL4 v10;
  void (**mInspectorSingleTapBlock)(void);
  id v13;

  y = a3.y;
  x = a3.x;
  -[TSDInteractiveCanvasController setLastTapPoint:](self->mICC, "setLastTapPoint:");
  if (-[TSDiOSCanvasViewControllerDelegate inFindReplaceMode](self->mDelegate, "inFindReplaceMode"))
  {
    -[TSDiOSCanvasViewControllerDelegate handleFindTapAtPoint:](self->mDelegate, "handleFindTapAtPoint:", x, y);
LABEL_11:
    LOBYTE(v10) = 1;
    return v10;
  }
  v13 = 0;
  v8 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v13, x, y);
  if (v8 && (objc_msgSend(v13, "handleSingleTapAtPoint:onKnob:", v8, x, y) & 1) != 0
    || (v9 = -[TSDInteractiveCanvasController hitRep:](self->mICC, "hitRep:", x, y), !objc_msgSend(v9, "repForSelecting"))&& (objc_msgSend(v9, "shouldIgnoreSingleTapAtPoint:withRecognizer:", a4, x, y) & 1) != 0|| (v10 = -[TSDInteractiveCanvasController handleSingleTapAtPoint:](self->mICC, "handleSingleTapAtPoint:", x, y)))
  {
    if (self->mInspectorModeEnabled)
    {
      mInspectorSingleTapBlock = (void (**)(void))self->mInspectorSingleTapBlock;
      if (mInspectorSingleTapBlock)
        mInspectorSingleTapBlock[2]();
    }
    goto LABEL_11;
  }
  return v10;
}

- (void)handleDoubleTap:(id)a3
{
  uint64_t v4;
  void *v5;
  TSDInteractiveCanvasController *mICC;
  TSDCanvasView *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    v5 = (void *)v4;
    mICC = self->mICC;
    v7 = -[TSDiOSCanvasViewController canvasView](self, "canvasView");
    objc_msgSend(v5, "firstTapLocation");
    -[TSDCanvasView convertPoint:fromView:](v7, "convertPoint:fromView:", 0);
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
    v9 = v8;
    v11 = v10;
    if (!-[TSDiOSCanvasViewController handleDoubleTapAtPoint:withRecognizer:](self, "handleDoubleTapAtPoint:withRecognizer:", v5))-[TSDInteractiveCanvasController handleDoubleTapAtPoint:](self->mICC, "handleDoubleTapAtPoint:", v9, v11);
  }
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  TSDCanvasEditor *v11;
  id v13;

  y = a3.y;
  x = a3.x;
  v13 = 0;
  v8 = -[TSDInteractiveCanvasController hitKnobAtPoint:returningRep:](self->mICC, "hitKnobAtPoint:returningRep:", &v13);
  if (v8 && (objc_msgSend(v13, "handleDoubleTapAtPoint:onKnob:", v8, x, y) & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v9 = (void *)objc_msgSend(-[TSDInteractiveCanvasController hitRep:](self->mICC, "hitRep:", x, y), "repForSelecting");
    if (v9)
    {
      v10 = v9;
      if (objc_msgSend(v9, "info"))
      {
        v11 = -[TSDInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor");
        -[TSDCanvasEditor setSelection:](v11, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v11, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_msgSend(v10, "info"))));
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        LOBYTE(v9) = objc_msgSend(v10, "handleDoubleTapAtPoint:withRecognizer:", a4, x, y);
      else
        LOBYTE(v9) = 0;
    }
  }
  return (char)v9;
}

- (void)p_allTouchesDone:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3), "postNotificationName:object:", CFSTR("TSDInteractiveCanvasControllerAllTouchesInGestureFinished"), self);
}

- (void)p_handleTapForEditMenu:(id)a3
{
  void *v4;
  void *v5;
  TSDInteractiveCanvasController *mICC;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  TSDCanvasEditor *v13;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, "ignoreTargetAction") & 1) == 0)
    {
      mICC = self->mICC;
      objc_msgSend(v5, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
      v8 = v7;
      v10 = v9;
      v11 = (void *)objc_msgSend(v5, "touchedRep");
      if (v11)
      {
        v12 = v11;
        if ((objc_msgSend(v11, "isSelectedIgnoringLocking") & 1) == 0
          && -[TSDiOSCanvasViewController shouldSelectAndShowEditMenuOnFirstTapForRep:](self, "shouldSelectAndShowEditMenuOnFirstTapForRep:", v12))
        {
          -[TSDInteractiveCanvasController endEditing](self->mICC, "endEditing");
          v13 = -[TSDInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor");
          -[TSDCanvasEditor setSelection:](v13, "setSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v13, "canvasSelectionWithInfos:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_msgSend(v12, "info"))));
        }
        -[TSDInteractiveCanvasController setLastTapPoint:](self->mICC, "setLastTapPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
        if (objc_msgSend(v12, "isSelectedIgnoringLocking")
          && (objc_msgSend(v12, "shouldIgnoreEditMenuTapAtPoint:withRecognizer:", v5, v8, v10) & 1) == 0)
        {
          if (self->mContextMenuMightBeDisplayed)
            -[TSDiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
          else
            -[TSDiOSCanvasViewController showEditMenu:](self, "showEditMenu:", v12);
        }
      }
    }
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *mSingleTapGestureRecognizer;
  TSDEditMenuTapGestureRecognizer *mEditMenuTapGestureRecognizer;
  BOOL v6;
  BOOL v9;
  BOOL result;

  mSingleTapGestureRecognizer = self->mSingleTapGestureRecognizer;
  mEditMenuTapGestureRecognizer = self->mEditMenuTapGestureRecognizer;
  v6 = mSingleTapGestureRecognizer == a3 && mEditMenuTapGestureRecognizer == a4;
  result = v6
        || (mSingleTapGestureRecognizer == a4 ? (v9 = mEditMenuTapGestureRecognizer == a3) : (v9 = 0),
            v9
         || (-[TSDiOSCanvasViewController preventScrollGestureRecognizer](self, "preventScrollGestureRecognizer") == a3
          || -[TSDiOSCanvasViewController preventScrollGestureRecognizer](self, "preventScrollGestureRecognizer") == a4)
         && (id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer") != a3&& (id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer") != a4)|| -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer") == a3&& (id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer") == a4;
  return result;
}

- (BOOL)shouldSelectAndShowEditMenuOnFirstTapForRep:(id)a3
{
  return 1;
}

- (BOOL)shouldIgnoreTextGestures
{
  if (self->mDelegate && (objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDiOSCanvasViewControllerDelegate shouldIgnoreTextGestures](self->mDelegate, "shouldIgnoreTextGestures");
  else
    return 0;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)TSDiOSCanvasViewController;
  -[TSDiOSCanvasViewController viewWillTransitionToSize:withTransitionCoordinator:](&v26, sel_viewWillTransitionToSize_withTransitionCoordinator_, a3.width, a3.height);
  -[TSDiOSCanvasViewController forceStopScrolling](self, "forceStopScrolling");
  -[TSDTextInputResponder canvasWillRotate](-[TSDInteractiveCanvasController textInputResponder](self->mICC, "textInputResponder"), "canvasWillRotate");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = -[TSDiOSCanvasViewController commonGestureRecognizers](self, "commonGestureRecognizers");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (!objc_msgSend(v11, "state") || objc_msgSend(v11, "state") == 1 || objc_msgSend(v11, "state") == 2))
        {
          objc_msgSend(v11, "performSelector:", sel_cancelBecauseOfRotation);
        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v8);
  }
  -[TSDInteractiveCanvasController i_syncWithLayoutThread](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "i_syncWithLayoutThread");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = -[TSDCanvas topLevelReps](-[TSDInteractiveCanvasController canvas](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "topLevelReps");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "recursivelyPerformSelectorIfImplemented:", sel_canvasWillRotate);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v27, 16);
    }
    while (v14);
  }
  self->mRotating = 1;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__TSDiOSCanvasViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_24D82CB20;
  v17[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", 0, v17);
}

_BYTE *__81__TSDiOSCanvasViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[1096])
  {
    objc_msgSend((id)objc_msgSend(result, "interactiveCanvasController"), "i_syncWithLayoutThread");
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1121) = 0;
    return (_BYTE *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "interactiveCanvasController"), "invalidateReps");
  }
  return result;
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[TSDiOSCanvasViewControllerDelegate allowTouchOutsideCanvasView:forGesture:](self->mDelegate, "allowTouchOutsideCanvasView:forGesture:", a3, a4);
  else
    return 0;
}

- (BOOL)repDragGestureRecognizer:(id)a3 shouldBeginTapHoldTrackingAtScaledPoint:(CGPoint)a4
{
  double y;
  double x;

  if (self->mDelegate && (y = a4.y, x = a4.x, (objc_opt_respondsToSelector() & 1) != 0))
    return -[TSDiOSCanvasViewControllerDelegate canvasViewController:shouldBeginTapHoldDragAtPoint:](self->mDelegate, "canvasViewController:shouldBeginTapHoldDragAtPoint:", self, x, y);
  else
    return 1;
}

- (id)viewForGestureRecognizer:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSDiOSCanvasViewControllerDelegate viewForGestureRecognizer:](self->mDelegate, "viewForGestureRecognizer:", a3);
  else
    return -[TSDiOSCanvasViewController canvasView](self, "canvasView");
}

- (CGRect)targetRectForEditMenu:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  CGAffineTransform v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect result;

  v74 = *MEMORY[0x24BDAC8D0];
  x = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  width = *(double *)(MEMORY[0x24BDBF070] + 16);
  height = *(double *)(MEMORY[0x24BDBF070] + 24);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v9 = (void *)objc_msgSend(-[TSDEditorController currentEditors](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "currentEditors"), "reverseObjectEnumerator");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v68;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v68 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v13);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "targetRectForEditMenu");
        x = v75.origin.x;
        y = v75.origin.y;
        width = v75.size.width;
        height = v75.size.height;
        if (!CGRectIsNull(v75))
          break;
      }
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  if (CGRectIsNull(v76))
  {
    v15 = (void *)objc_msgSend(a3, "infos");
    if (objc_msgSend(v15, "count"))
    {
      -[TSDInteractiveCanvasController layoutIfNeeded](self->mICC, "layoutIfNeeded");
      if (objc_msgSend(v15, "count") == 1)
      {
        v16 = -[TSDInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", objc_msgSend(v15, "anyObject"));
        objc_msgSend(v16, "targetRectForEditMenu");
        v17 = v77.origin.x;
        v18 = v77.origin.y;
        v19 = v77.size.width;
        v20 = v77.size.height;
        if (!CGRectIsNull(v77))
        {
          if (v16)
            objc_msgSend(v16, "transformToConvertNaturalToLayerRelative");
          else
            memset(&v66, 0, sizeof(v66));
          v78.origin.x = v17;
          v78.origin.y = v18;
          v78.size.width = v19;
          v78.size.height = v20;
          v79 = CGRectApplyAffineTransform(v78, &v66);
          v29 = v79.origin.x;
          v30 = v79.origin.y;
          width = v79.size.width;
          height = v79.size.height;
          objc_msgSend(v16, "layerFrameInScaledCanvas");
          x = TSDAddPoints(v29, v30, v31);
          y = v32;
        }
      }
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      if (CGRectIsNull(v80))
      {
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v33 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v63;
          do
          {
            v36 = 0;
            do
            {
              if (*(_QWORD *)v63 != v35)
                objc_enumerationMutation(v15);
              v37 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v36);
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              v61 = 0u;
              v38 = -[TSDInteractiveCanvasController repsForInfo:](self->mICC, "repsForInfo:", v37, 0);
              v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v59;
                do
                {
                  v42 = 0;
                  do
                  {
                    if (*(_QWORD *)v59 != v41)
                      objc_enumerationMutation(v38);
                    objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * v42), "layout"), "alignmentFrameInRoot");
                    -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](self->mICC, "convertUnscaledToBoundsRect:");
                    v44 = v43;
                    v46 = v45;
                    v48 = v47;
                    v50 = v49;
                    v81.origin.x = x;
                    v81.origin.y = y;
                    v81.size.width = width;
                    v81.size.height = height;
                    if (CGRectIsNull(v81))
                    {
                      height = v50;
                      width = v48;
                      y = v46;
                      x = v44;
                    }
                    else
                    {
                      x = TSDUnionRect(x, y, width, height, v44, v46, v48, v50);
                      y = v51;
                      width = v52;
                      height = v53;
                    }
                    ++v42;
                  }
                  while (v40 != v42);
                  v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
                }
                while (v40);
              }
              ++v36;
            }
            while (v36 != v34);
            v34 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          }
          while (v34);
        }
        v82.origin.x = x;
        v82.origin.y = y;
        v82.size.width = width;
        v82.size.height = height;
        if (CGRectIsNull(v82))
        {
          x = *MEMORY[0x24BDBF090];
          y = *(double *)(MEMORY[0x24BDBF090] + 8);
          width = *(double *)(MEMORY[0x24BDBF090] + 16);
          height = *(double *)(MEMORY[0x24BDBF090] + 24);
        }
      }
    }
    else
    {
      -[UITapGestureRecognizer locationInView:](-[TSDiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"), "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
      v23 = TSDAddPoints(v21, v22, 0.0);
      x = TSDRectWithOriginAndSize(v24, v23, v25, 1.0, 1.0);
      y = v26;
      width = v27;
      height = v28;
    }
  }
  v54 = x;
  v55 = y;
  v56 = width;
  v57 = height;
  result.size.height = v57;
  result.size.width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (void)showEditMenuForSelection:(id)a3
{
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double x;
  double y;
  double width;
  double height;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double MinY;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController");
  if (((objc_opt_respondsToSelector() & 1) == 0
     || -[TSDiOSCanvasViewControllerDelegate allowEditMenuToAppear](self->mDelegate, "allowEditMenuToAppear"))&& ((-[TSDTextInputResponder isFirstResponder](-[TSDInteractiveCanvasController textInputResponder](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"), "isFirstResponder") & 1) != 0|| -[TSDTextInputResponder canBecomeFirstResponder](-[TSDInteractiveCanvasController textInputResponder](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"), "canBecomeFirstResponder")&& -[TSDTextInputResponder becomeFirstResponder](-[TSDInteractiveCanvasController textInputResponder](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "textInputResponder"), "becomeFirstResponder")|| (-[TSDiOSCanvasViewController isFirstResponder](self, "isFirstResponder") & 1) != 0|| -[TSDiOSCanvasViewController canBecomeFirstResponder](self, "canBecomeFirstResponder")
     && -[TSDiOSCanvasViewController becomeFirstResponder](self, "becomeFirstResponder")))
  {
    -[TSDInteractiveCanvasController visibleBoundsRect](self->mICC, "visibleBoundsRect");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[TSDiOSCanvasViewController targetRectForEditMenu:](self, "targetRectForEditMenu:", a3);
    v31.origin.x = v7;
    v31.origin.y = v9;
    v31.size.width = v11;
    v31.size.height = v13;
    v25 = CGRectIntersection(v24, v31);
    x = v25.origin.x;
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    if (!CGRectEqualToRect(v25, *MEMORY[0x24BDBF070]))
    {
      v18 = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      -[TSDiOSCanvasViewController p_buildMenuItems:forSelection:](self, "p_buildMenuItems:forSelection:", v18, a3);
      objc_msgSend(v5, "setMenuItems:", v18);
      objc_msgSend(v5, "setArrowDirection:", 0);
      v19 = objc_msgSend(a3, "unlockedInfoCount");
      v20 = height * 0.5;
      if (v19 <= 1)
        v20 = -0.0;
      v21 = y + v20;
      if (v21 <= v9 + 100.0 && height >= v13 + -100.0)
      {
        v26.origin.x = x;
        v26.origin.y = v21;
        v26.size.width = width;
        v26.size.height = height;
        v27.origin.x = CGRectGetMidX(v26);
        x = v27.origin.x;
        v27.origin.y = v21;
        v27.size.width = width;
        v27.size.height = height;
        MinY = CGRectGetMinY(v27);
        v28.origin.x = v7;
        v28.origin.y = v9;
        v28.size.width = v11;
        v28.size.height = v13;
        if (MinY <= CGRectGetMinY(v28) + 6.0)
        {
          v30.origin.x = v7;
          v30.origin.y = v9;
          v30.size.width = v11;
          v30.size.height = v13;
          v21 = CGRectGetMinY(v30) + 6.0;
        }
        else
        {
          v29.origin.x = x;
          v29.origin.y = v21;
          v29.size.width = width;
          v29.size.height = height;
          v21 = CGRectGetMinY(v29);
        }
        width = *MEMORY[0x24BDBF148];
        height = *(double *)(MEMORY[0x24BDBF148] + 8);
        objc_msgSend(v5, "setArrowDirection:", 1);
      }
      objc_msgSend(v5, "showMenuFromView:rect:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"), x, v21, width, height);
      self->mContextMenuMightBeDisplayed = 1;
    }
  }
}

- (void)p_buildMenuItems:(id)a3 forSelection:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Cut"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_cutObject_);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Copy"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_copyObject_);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Paste"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_pasteObject_);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_deleteObject_);
  objc_msgSend(a3, "addObject:", v7);
  objc_msgSend(a3, "addObject:", v8);
  objc_msgSend(a3, "addObject:", v9);
  objc_msgSend(a3, "addObject:", v10);

  if (objc_msgSend(a4, "infoCount") == 1)
    v11 = objc_msgSend(a4, "containsUnlockedKindOfClass:", objc_opt_class());
  else
    v11 = 0;
  if ((unint64_t)objc_msgSend(a4, "unlockedInfoCount") >= 2 && (v11 & 1) == 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Group"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_group_);
    objc_msgSend(a3, "addObject:", v12);

  }
  if (v11)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Ungroup"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_ungroup_);
    objc_msgSend(a3, "addObject:", v13);

  }
  if (objc_msgSend(a4, "infoCount") == 1)
  {
    v14 = -[TSDInteractiveCanvasController repForInfo:](self->mICC, "repForInfo:", objc_msgSend((id)objc_msgSend(a4, "infos"), "anyObject"));
    if ((objc_msgSend(v14, "isLocked") & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(a3, "addObjectsFromArray:", objc_msgSend(v14, "itemsToAddToEditMenu"));
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
    v14 = 0;
  }
  v16 = -[TSDEditorController editorForEditAction:withSender:](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "editorForEditAction:withSender:", sel_addOrShowComment_, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v16, "canAddOrShowComment"))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Comment"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_addOrShowComment_);
    objc_msgSend(a3, "addObject:", v17);

  }
  v18 = objc_msgSend(a4, "unlockedInfoCount");
  if (v18 != objc_msgSend(a4, "infoCount"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Unlock"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_unlock_);
    objc_msgSend(a3, "addObject:", v19);

  }
  if (v15)
  {
    v20 = -[TSDiOSCanvasViewController itemsToAddToEditMenuForRep:](self, "itemsToAddToEditMenuForRep:", v14);
    if (v20)
    {
      v21 = v20;
      if (objc_msgSend(v20, "count"))
        objc_msgSend(a3, "addObjectsFromArray:", v21);
    }
  }
  if (-[TSDCanvasEditorHelper canPerformMaskWithShapeWithSender:](-[TSDCanvasEditor canvasEditorHelper](-[TSDInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"), "canvasEditorHelper"), "canPerformMaskWithShapeWithSender:", 0))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BB8]), "initWithTitle:action:", objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("Mask with Shape"), &stru_24D82FEB0, CFSTR("TSDrawables")), sel_maskWithShape_);
    objc_msgSend(a3, "addObject:", v22);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v23 = -[TSDEditorController currentEditors](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "editorController"), "currentEditors");
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v30;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v27);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v28, "addContextualMenuItemsToArray:", a3);
        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v25);
  }
}

- (void)showEditMenu:(id)a3
{
  TSDCanvasEditor *v5;
  TSDCanvasEditor *v6;
  uint64_t v7;

  v5 = -[TSDInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor");
  v6 = v5;
  if (a3)
    v7 = -[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](v5, "canvasSelection"), "infos");
  else
    v7 = 0;
  -[TSDCanvasEditor canvasSelectionWithInfos:](v6, "canvasSelectionWithInfos:", v7);
  -[TSDiOSCanvasViewController showEditMenuForSelection:](self, "showEditMenuForSelection:", TSUProtocolCast());
}

- (void)toggleEditMenuForCurrentSelection
{
  if (self->mContextMenuMightBeDisplayed)
    -[TSDiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  else
    -[TSDiOSCanvasViewController showEditMenuForSelection:](self, "showEditMenuForSelection:", -[TSDCanvasEditor canvasSelection](-[TSDInteractiveCanvasController canvasEditor](self->mICC, "canvasEditor"), "canvasSelection"));
}

- (void)hideEditMenu
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "hideMenu");
  self->mContextMenuMightBeDisplayed = 0;
}

- (id)itemsToAddToEditMenuForRep:(id)a3
{
  return 0;
}

- (id)extraMenuItems
{
  id v2;
  void *v3;

  v2 = -[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = (void *)objc_msgSend(v2, "extraMenuItems");
  else
    v3 = 0;
  if (objc_msgSend(v3, "count"))
    return v3;
  else
    return 0;
}

- (BOOL)canBecomeFirstResponder
{
  return !self->mHasBeenTornDown;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return !-[TSDInteractiveCanvasController isInDynamicOperation](self->mICC, "isInDynamicOperation")
      && -[TSDInteractiveCanvasController canPerformInteractiveAction:withSender:](self->mICC, "canPerformInteractiveAction:withSender:", a3, a4);
}

- (void)setContextMenuMightBeDisplayed:(BOOL)a3
{
  if (!a3 && objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6BB0], "sharedMenuController"), "isMenuVisible"))
    -[TSDiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  self->mContextMenuMightBeDisplayed = a3;
}

- (void)cut:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[TSDiOSCanvasViewController hideEditMenu](self, "hideEditMenu");
  -[TSDInteractiveCanvasController makeEditorPerformAction:withSender:](self->mICC, "makeEditorPerformAction:withSender:", a2, a3);
}

- (void)unlock:(id)a3
{
  TSDCanvasEditor *v4;

  -[TSDInteractiveCanvasController makeEditorPerformAction:withSender:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "makeEditorPerformAction:withSender:", a2, a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[TSDInteractiveCanvasController canvasEditor](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasEditor");
    -[TSDiOSCanvasViewController showEditMenuForSelection:](self, "showEditMenuForSelection:", -[TSDCanvasEditor canvasSelectionWithInfos:](v4, "canvasSelectionWithInfos:", -[TSDCanvasSelection infos](-[TSDCanvasEditor canvasSelection](v4, "canvasSelection"), "infos")));
  }
}

- (void)stopScrolling
{
  void *v3;
  uint64_t v4;
  TSKScrollView *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController stopScrolling]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1171, CFSTR("This operation must only be performed on the main thread."));
  }
  v5 = -[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView");
  -[TSKScrollView contentOffset](v5, "contentOffset");
  -[TSKScrollView setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
}

- (void)forceStopScrolling
{
  void *v3;
  uint64_t v4;
  TSKScrollView *v5;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController forceStopScrolling]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1181, CFSTR("This operation must only be performed on the main thread."));
  }
  v5 = -[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView");
  if (-[TSKScrollView isScrollEnabled](v5, "isScrollEnabled"))
  {
    if (-[TSDInteractiveCanvasController currentlyScrolling](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling"))
    {
      -[TSKScrollView setScrollEnabled:](v5, "setScrollEnabled:", 0);
      -[TSKScrollView setScrollEnabled:](v5, "setScrollEnabled:", 1);
      -[TSKScrollView contentOffset](v5, "contentOffset");
      -[TSKScrollView setContentOffset:animated:](v5, "setContentOffset:animated:", 0);
    }
  }
}

- (void)beginInspectorPanZoomModeWithSingleTapBlock:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!self->mInspectorModeEnabled
    || (v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController beginInspectorPanZoomModeWithSingleTapBlock:]"), objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1199, CFSTR("attempting to re-enable inspector pan/zoom mode")), !self->mInspectorModeEnabled))
  {
    self->mInspectorModeEnabled = 1;
    if (self->mInspectorSingleTapBlock)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController beginInspectorPanZoomModeWithSingleTapBlock:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1203, CFSTR("expected nil value for '%s'"), "mInspectorSingleTapBlock");
    }
    self->mInspectorSingleTapBlock = (id)objc_msgSend(a3, "copy");
    if (!self->mInspectorGestureRecognizersToReenable)
      self->mInspectorGestureRecognizersToReenable = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    -[TSDiOSCanvasViewController addInspectorPanZoomModeGRsToArray:](self, "addInspectorPanZoomModeGRsToArray:", v9);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = (void *)-[TSDCanvasView gestureRecognizers](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "gestureRecognizers");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v9, "containsObject:", v15) & 1) == 0)
          {
            if (objc_msgSend(v15, "isEnabled"))
            {
              -[NSMutableArray addObject:](self->mInspectorGestureRecognizersToReenable, "addObject:", v15);
              objc_msgSend(v15, "setEnabled:", 0);
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }
}

- (void)endInspectorPanZoomMode
{
  void *v3;
  uint64_t v4;
  NSMutableArray *mInspectorGestureRecognizersToReenable;
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
  if (self->mInspectorModeEnabled
    || (v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
        v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController endInspectorPanZoomMode]"), objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1225, CFSTR("attempting to re-disable inspector pan/zoom mode")), self->mInspectorModeEnabled))
  {
    self->mInspectorModeEnabled = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    mInspectorGestureRecognizersToReenable = self->mInspectorGestureRecognizersToReenable;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInspectorGestureRecognizersToReenable, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(mInspectorGestureRecognizersToReenable);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "setEnabled:", 1);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mInspectorGestureRecognizersToReenable, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }
    -[NSMutableArray removeAllObjects](self->mInspectorGestureRecognizersToReenable, "removeAllObjects");

    self->mInspectorSingleTapBlock = 0;
    if (objc_msgSend(-[TSDEditorController textInputEditor](-[TSDInteractiveCanvasController editorController](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "conformsToProtocol:", &unk_254F79938))-[TSDInteractiveCanvasController setShouldAutoscrollToSelectionAfterLayout:](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1);
  }
}

- (void)addInspectorPanZoomModeGRsToArray:(id)a3
{
  objc_msgSend(a3, "addObject:", -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer"));
  objc_msgSend(a3, "addObject:", -[TSDiOSCanvasViewController singleTapGestureRecognizer](self, "singleTapGestureRecognizer"));
}

- (void)p_handleSingleTapGesture:(id)a3
{
  void *v4;
  void *v5;
  TSDInteractiveCanvasController *mICC;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "state") != 4)
    {
      mICC = self->mICC;
      objc_msgSend(v5, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
      -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](mICC, "convertBoundsToUnscaledPoint:");
      v8 = v7;
      v10 = v9;
      if (!-[TSDiOSCanvasViewController handleSingleTapAtPoint:withRecognizer:](self, "handleSingleTapAtPoint:withRecognizer:", v5))-[TSDInteractiveCanvasController tappedCanvasBackgroundAtPoint:](self->mICC, "tappedCanvasBackgroundAtPoint:", v8, v10);
    }
  }
}

- (void)p_zoomWithGesture:(id)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TSDCanvasZoomTracker *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  TSDCanvasZoomTracker *mCanvasZoomTracker;
  double v15;
  double v16;
  double v17;

  v5 = 1;
  v6 = 1;
  switch(objc_msgSend(a3, "state"))
  {
    case 1:
      if (self->mCanvasZoomTracker)
      {
        v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController p_zoomWithGesture:]");
        objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1277, CFSTR("expected nil value for '%s'"), "mCanvasZoomTracker");
      }
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 0);
      v5 = 0;
      v6 = 0;
      break;
    case 2:
      break;
    case 3:
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 1);
      v5 = 0;
      v6 = 2;
      break;
    case 4:
      objc_msgSend((id)-[TSKScrollView panGestureRecognizer](-[TSDCanvasView enclosingScrollView](-[TSDiOSCanvasViewController canvasView](self, "canvasView"), "enclosingScrollView"), "panGestureRecognizer"), "setEnabled:", 1);
      goto LABEL_7;
    default:
LABEL_7:
      v5 = 0;
      v6 = 3;
      break;
  }
  if (!self->mCanvasZoomTracker)
  {
    v9 = -[TSDCanvasZoomTracker initWithCanvasLayer:]([TSDCanvasZoomTracker alloc], "initWithCanvasLayer:", -[TSDiOSCanvasViewController canvasLayer](self, "canvasLayer"));
    self->mCanvasZoomTracker = v9;
    -[TSDCanvasZoomTracker setDelegate:](v9, "setDelegate:", self);
  }
  objc_msgSend(a3, "locationInView:", -[TSDiOSCanvasViewController canvasView](self, "canvasView"));
  v11 = v10;
  v13 = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[TSDCanvasLayer setShowsScaleFeedback:](-[TSDiOSCanvasViewController canvasLayer](self, "canvasLayer"), "setShowsScaleFeedback:", -[TSDiOSCanvasViewControllerDelegate canvasViewControllerShouldShowScaleFeedback:](self->mDelegate, "canvasViewControllerShouldShowScaleFeedback:", self));
  if (!v5 || objc_msgSend(a3, "numberOfTouches") == 2)
  {
    mCanvasZoomTracker = self->mCanvasZoomTracker;
    objc_msgSend(a3, "scale");
    v16 = v15;
    objc_msgSend(a3, "velocity");
    -[TSDCanvasZoomTracker zoomWithScale:velocity:locationInView:phase:](mCanvasZoomTracker, "zoomWithScale:velocity:locationInView:phase:", v6, v16, v17, v11, v13);
  }
}

- (void)canvasZoomTracker:(id)a3 willBeginViewScaleFeedbackWithFastPinch:(BOOL)a4
{
  TSDCanvasView *v6;
  UIPinchGestureRecognizer *v7;
  UIPinchGestureRecognizer *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TSKScrollView *v17;
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
  long double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;

  v6 = -[TSDiOSCanvasViewController canvasView](self, "canvasView", a3);
  v7 = -[TSDiOSCanvasViewController zoomGestureRecognizer](self, "zoomGestureRecognizer");
  if (a4 || (v8 = v7, -[UIPinchGestureRecognizer numberOfTouches](v7, "numberOfTouches") != 2))
  {
    v17 = -[TSDCanvasView enclosingScrollView](v6, "enclosingScrollView");
    -[TSKScrollView center](v17, "center");
    objc_msgSend((id)-[TSKScrollView superview](v17, "superview"), "convertPoint:toView:", v6, v19, v18 + -120.0);
    v14 = v20;
    v16 = v21;
    v12 = v21;
    v10 = v20;
  }
  else
  {
    -[UIPinchGestureRecognizer locationOfTouch:inView:](v8, "locationOfTouch:inView:", 0, v6);
    v10 = v9;
    v12 = v11;
    -[UIPinchGestureRecognizer locationOfTouch:inView:](v8, "locationOfTouch:inView:", 1, v6);
    v14 = v13;
    v16 = v15;
  }
  v22 = TSDAddPoints(v10, v12, v14);
  v24 = TSDMultiplyPointScalar(v22, v23, 0.5);
  v26 = v25;
  if (vabdd_f64(v10, v14) >= 40.0)
  {
    if (v10 >= v14)
      v27 = v14;
    else
      v27 = v10;
    if (v10 >= v14)
      v28 = v10;
    else
      v28 = v14;
    if (v10 >= v14)
      v29 = v12;
    else
      v29 = v16;
    v30 = TSDSubtractPoints(v28, v29, v27);
    v32 = TSDAngleFromDelta(v30, v31);
    v33 = TSDDeltaFromAngle(v32 + -1.57079633);
    v35 = TSDMultiplyPointScalar(v33, v34, 120.0);
    TSDAddPoints(v24, v26, v35);
  }
  self->mLastZoomHUDLocation.x = TSDRoundedPoint();
  self->mLastZoomHUDLocation.y = v36;
}

- (void)canvasZoomTrackerWillBeginFinalZoomAnimation:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "beginIgnoringInteractionEvents");
}

- (void)canvasZoomTrackerDidEndFinalZoomAnimation:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", a3), "endIgnoringInteractionEvents");
}

- (void)canvasZoomTrackerDidFinish:(id)a3
{
  -[TSDCanvasZoomTracker setDelegate:](self->mCanvasZoomTracker, "setDelegate:", 0);

  self->mCanvasZoomTracker = 0;
}

- (BOOL)isDraggingViaGuidedPan
{
  return (unint64_t)(-[UIPanGestureRecognizer state](self->mGuidedPanGestureRecognizer, "state") - 1) < 3;
}

- (void)p_guidedPanWithGesture:(id)a3
{
  TSDInteractiveCanvasControllerDelegate *v5;
  TSDInteractiveCanvasController *mICC;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TSDGuidedPanController *mGuidedPanController;
  void *v11;
  uint64_t v12;

  if (objc_msgSend(a3, "state") == 1)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = -[TSDInteractiveCanvasController delegate](self->mICC, "delegate");
      mICC = self->mICC;
      -[UIPanGestureRecognizer direction](self->mGuidedPanGestureRecognizer, "direction");
      v7 = -[TSDInteractiveCanvasControllerDelegate panGuideForInteractiveCanvasController:withMovementDirection:](v5, "panGuideForInteractiveCanvasController:withMovementDirection:", mICC);
      if (!v7)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController p_guidedPanWithGesture:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1427, CFSTR("invalid nil value for '%s'"), "panGuide");
      }
      mGuidedPanController = self->mGuidedPanController;
      if (!mGuidedPanController)
      {
        mGuidedPanController = -[TSDGuidedPanController initWithInteractiveCanvasController:]([TSDGuidedPanController alloc], "initWithInteractiveCanvasController:", self->mICC);
        self->mGuidedPanController = mGuidedPanController;
      }
      -[TSDGuidedPanController setGuide:](mGuidedPanController, "setGuide:", v7);
    }
    else
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController p_guidedPanWithGesture:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1438, CFSTR("can't handle guided pan without a guide"));
    }
  }
  -[TSDGuidedPanController handlePanGesture:](self->mGuidedPanController, "handlePanGesture:", a3);
}

- (void)p_editMenuDidHide:(id)a3
{
  -[TSDiOSCanvasViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_p_clearCanvasSelectionForMenu, 0, 0.25);
}

- (id)p_willPresentError:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(a3, "localizedRecoveryOptions");
  if (v4
    && objc_msgSend(v4, "count")
    && (!objc_msgSend(v3, "recoveryAttempter")
     || (objc_opt_respondsToSelector() & 1) == 0 && (objc_opt_respondsToSelector() & 1) == 0))
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "userInfo"), "mutableCopy");
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BDD0FF0]);
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BDD0FE8]);
    objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x24BDD11D0]);
    v3 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", objc_msgSend(v3, "domain"), objc_msgSend(v3, "code"), v5);

  }
  return v3;
}

- (void)presentError:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[8];

  v6 = -[TSDiOSCanvasViewController p_willPresentError:](self, "p_willPresentError:", a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67F8]), "initWithError:", v6);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__TSDiOSCanvasViewController_presentError_completionHandler___block_invoke;
  v8[3] = &unk_24D82CB48;
  v8[4] = v6;
  v8[5] = self;
  v8[6] = v7;
  v8[7] = a4;
  objc_msgSend(v7, "showWithCompletionHandler:", v8);
}

void __61__TSDiOSCanvasViewController_presentError_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(*(id *)(a1 + 32), "recoveryAttempter");
  if (!v4)
    goto LABEL_6;
  v5 = (void *)v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 40), sel_p_didPresentErrorWithRecovery_completionHandler_, objc_msgSend(*(id *)(a1 + 56), "copy"));
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "attemptRecoveryFromError:optionIndex:", *(_QWORD *)(a1 + 32), a2);
  else
LABEL_6:
    v6 = 0;
  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
LABEL_9:

}

- (void)p_didPresentErrorWithRecovery:(BOOL)a3 completionHandler:(void *)a4
{
  if (a4)
  {
    (*((void (**)(void *, BOOL))a4 + 2))(a4, a3);

  }
}

- (void)presentErrors:(id)a3 withLocalizedDescription:(id)a4 completionHandler:(id)a5
{
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[6];

  v8 = objc_msgSend(a3, "count");
  v9 = objc_alloc(MEMORY[0x24BDF67F8]);
  if (v8 == 1)
    v10 = (void *)objc_msgSend(v9, "initWithError:", objc_msgSend(a3, "objectAtIndex:", 0));
  else
    v10 = (void *)objc_msgSend(v9, "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", a4, 0, 0, objc_msgSend((id)TSDBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D82FEB0, CFSTR("TSDrawables")), 0);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __87__TSDiOSCanvasViewController_presentErrors_withLocalizedDescription_completionHandler___block_invoke;
  v11[3] = &unk_24D82CB70;
  v11[4] = v10;
  v11[5] = a5;
  objc_msgSend(v10, "showWithCompletionHandler:", v11);
}

void __87__TSDiOSCanvasViewController_presentErrors_withLocalizedDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

- (void)beginModalOperationWithLocalizedMessage:(id)a3 progress:(id)a4 cancelHandler:(id)a5
{
  void *v5;
  uint64_t v6;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread", a3, a4, a5) & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController beginModalOperationWithLocalizedMessage:progress:cancelHandler:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1553, CFSTR("Modal operations must be started on the main thread,"));
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "beginIgnoringInteractionEvents");
}

- (void)endModalOperation
{
  void *v2;
  uint64_t v3;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDiOSCanvasViewController endModalOperation]");
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDiOSCanvasViewController.m"), 1565, CFSTR("Modal operations must be ended on the main thread,"));
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "endIgnoringInteractionEvents");
}

- (void)presentMovieCompatibilityAlertForUnplayableMovieURLs:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (void)presentMovieCompatibilityAlertForUnplayableMoviePasteboardDrawableProviders:(id)a3 completionHandler:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)newMoviePlaybackHUDWithFrame:(CGRect)a3 playerController:(id)a4 movieRep:(id)a5
{
  return 0;
}

- (id)newAudioPlaybackHUDWithFrame:(CGRect)a3 audioRep:(id)a4 delegate:(id)a5
{
  return 0;
}

- (Class)movieInspectorPaneClass
{
  return 0;
}

- (Class)audioInspectorPaneClass
{
  return 0;
}

- (id)topLevelReps
{
  return -[TSDCanvas topLevelReps](-[TSDInteractiveCanvasController canvas](-[TSDiOSCanvasViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "topLevelReps");
}

- (TSDInteractiveCanvasController)interactiveCanvasController
{
  return self->mICC;
}

- (void)setInteractiveCanvasController:(id)a3
{
  self->mICC = (TSDInteractiveCanvasController *)a3;
}

- (TSDiOSCanvasViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSDiOSCanvasViewControllerDelegate *)a3;
}

- (UITapGestureRecognizer)singleTapGestureRecognizer
{
  return self->mSingleTapGestureRecognizer;
}

- (void)setSingleTapGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (UITapGestureRecognizer)doubleTapGestureRecognizer
{
  return self->mDoubleTapGestureRecognizer;
}

- (void)setDoubleTapGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1000);
}

- (TSDEditMenuTapGestureRecognizer)editMenuTapGestureRecognizer
{
  return self->mEditMenuTapGestureRecognizer;
}

- (void)setEditMenuTapGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1008);
}

- (TSDKnobDragGestureRecognizer)knobDragGestureRecognizer
{
  return self->mKnobDragGestureRecognizer;
}

- (void)setKnobDragGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1016);
}

- (TSDMultiSelectGestureRecognizer)multiSelectGestureRecognizer
{
  return self->mMultiSelectGestureRecognizer;
}

- (void)setMultiSelectGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1024);
}

- (TSDRepDragGestureRecognizer)repDragGestureRecognizer
{
  return self->mRepDragGestureRecognizer;
}

- (void)setRepDragGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1032);
}

- (TSDRepRotateGestureRecognizer)repRotateGestureRecognizer
{
  return self->mRepRotateGestureRecognizer;
}

- (void)setRepRotateGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1040);
}

- (UIPinchGestureRecognizer)zoomGestureRecognizer
{
  return &self->mZoomGestureRecognizer->super;
}

- (void)setZoomGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1048);
}

- (TSDNudgeGestureRecognizer)nudgeGestureRecognizer
{
  return self->mNudgeGestureRecognizer;
}

- (void)setNudgeGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1056);
}

- (TSDAllTouchesDoneGestureRecognizer)allTouchesDoneGestureRecognizer
{
  return self->mAllTouchesDoneGestureRecognizer;
}

- (void)setAllTouchesDoneGestureRecognizer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 1064);
}

- (TSDPreventScrollGestureRecognizer)preventScrollGestureRecognizer
{
  return self->mPreventScrollGestureRecognizer;
}

- (UIPanGestureRecognizer)guidedPanGestureRecognizer
{
  return self->mGuidedPanGestureRecognizer;
}

- (BOOL)isPopoverGestureInFlight
{
  return self->mIsPopoverGestureInFlight;
}

- (BOOL)contextMenuMightBeDisplayed
{
  return self->mContextMenuMightBeDisplayed;
}

- (BOOL)isRotating
{
  return self->_isRotating;
}

- (TSDCanvasSubviewsController)subviewsController
{
  return self->mSubviewsController;
}

@end
