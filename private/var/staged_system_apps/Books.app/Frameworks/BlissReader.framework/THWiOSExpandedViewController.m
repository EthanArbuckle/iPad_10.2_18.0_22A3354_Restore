@implementation THWiOSExpandedViewController

- (THWExpandedRep)expandedRep
{
  id v2;
  uint64_t v3;

  v2 = -[TSDInteractiveCanvasController repForInfo:createIfNeeded:](-[THWiOSExpandedViewController icc](self, "icc"), "repForInfo:createIfNeeded:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent"), 1);
  v3 = objc_opt_class(TSDRep);
  return (THWExpandedRep *)TSUClassAndProtocolCast(v2, v3, 1);
}

- (THWiOSExpandedViewController)initWithDocumentRoot:(id)a3 expandableRep:(id)a4 delegate:(id)a5
{
  THWiOSExpandedViewController *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __objc2_prot *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THWiOSExpandedViewController;
  v8 = -[THWiOSExpandedViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v8->mDocumentRoot = (THDocumentRoot *)a3;
    v8->_wantsStatusBarVisible = objc_msgSend(a5, "isFreeTransformInProgress");
    v9 = objc_msgSend(a4, "expandedContentDrawableToPresent");
    v10 = objc_opt_class(NSObject);
    v13 = &OBJC_PROTOCOL___TSDInfo;
    v11 = TSUClassAndProtocolCast(v9, v10, 1);
    if (!v11)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", &OBJC_PROTOCOL___TSDInfo), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController initWithDocumentRoot:expandableRep:delegate:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 130, CFSTR("invalid nil value for '%s'"), "drawableToPresent");
    -[THWiOSExpandedViewController setDrawableToPresent:](v8, "setDrawableToPresent:", v11, v13);
    -[THWiOSExpandedViewController setDelegate:](v8, "setDelegate:", a5);
    THCanvasCreate(v8, (id *)&v8->_icc, &v8->_cvc);
    objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperviewController](-[THWiOSExpandedViewController delegate](v8, "delegate"), "rootSuperviewController"), "addChildViewController:", v8);
    -[THWiOSExpandedViewController addChildViewController:](v8, "addChildViewController:", -[THWiOSExpandedViewController cvc](v8, "cvc"));
    -[TSDInteractiveCanvasController disableAllGestures](v8->_icc, "disableAllGestures");
    -[TSDInteractiveCanvasController enableGestureKinds:](v8->_icc, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPImmediateSingleTap));
    -[TSDInteractiveCanvasController setCreateRepsForOffscreenLayouts:](-[THWiOSExpandedViewController icc](v8, "icc"), "setCreateRepsForOffscreenLayouts:", 1);
    -[THWiOSExpandedViewController setFreeTransformInFlight:](v8, "setFreeTransformInFlight:", 0);
    objc_msgSend(-[TSDiOSCanvasViewController view](-[THWiOSExpandedViewController cvc](v8, "cvc"), "view"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(-[TSDiOSCanvasViewController view](-[THWiOSExpandedViewController cvc](v8, "cvc"), "view"), "setClipsToBounds:", 0);
    -[TSDiOSCanvasViewController setDelegate:](-[THWiOSExpandedViewController cvc](v8, "cvc"), "setDelegate:", v8);
    -[THWiOSExpandedViewController setOriginalViewScale:](v8, "setOriginalViewScale:", 1.0);
    -[THWiOSExpandedViewController setExpandedRepControllerState:](v8, "setExpandedRepControllerState:", 0);
    objc_msgSend(+[THWAVController sharedController](THWAVController, "sharedController"), "stopPlayer");
    if ((objc_opt_respondsToSelector(a4, "expandableShouldPreloadExpanded") & 1) != 0
      && objc_msgSend(a4, "expandableShouldPreloadExpanded"))
    {
      objc_msgSend(-[THWiOSExpandedViewController view](v8, "view"), "layoutIfNeeded");
    }
    -[THWiOSExpandedViewController registerForTraitChanges:withAction:](v8, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v8;
}

- (BOOL)p_startsVisible
{
  THWExpandedRep *v2;

  v2 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v2, "expandedPanelStartsVisible") & 1) != 0)
    return -[THWExpandedRep expandedPanelStartsVisible](v2, "expandedPanelStartsVisible");
  else
    return 1;
}

- (BOOL)p_alwaysVisible
{
  THWExpandedRep *v2;

  v2 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v2, "expandedPanelAlwaysVisible") & 1) != 0)
    return -[THWExpandedRep expandedPanelAlwaysVisible](v2, "expandedPanelAlwaysVisible");
  else
    return 0;
}

- (void)dismiss
{
  -[THWiOSExpandedViewController dismissExpandedAnimatedWithCompletionBlock:](self, "dismissExpandedAnimatedWithCompletionBlock:", 0);
}

- (void)teardown
{
  -[THWiOSExpandedViewController p_cleanup](self, "p_cleanup");
  self->_wasTornDown = 1;
}

- (void)loadView
{
  -[THWiOSExpandedViewController setView:](self, "setView:", -[THWiOSExpandedView initWithFrame:]([THWiOSExpandedView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  THWExpandedRep *v10;
  THWFreeTransformGestureRecognizer *v11;
  id v12;
  id v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController viewDidLoad](&v14, "viewDidLoad");
  objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview"), "frame");
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "setFrame:", v3, v4, v5, v6);
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "setAutoresizingMask:", 18);
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "setAutoresizesSubviews:", 1);
  v7 = objc_alloc((Class)TSKScrollView);
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  -[THWiOSExpandedViewController setScrollView:](self, "setScrollView:", objc_msgSend(v7, "initWithFrame:"));
  -[UIScrollView setDelegate:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setDelegate:", -[THWiOSExpandedViewController icc](self, "icc"));
  -[UIScrollView setClipsToBounds:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setClipsToBounds:", 0);
  -[UIScrollView setScrollEnabled:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setScrollEnabled:", 1);
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "unscaledSize");
  -[UIScrollView setContentSize:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setContentSize:", v8, v9);
  -[UIScrollView setAutoresizingMask:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setAutoresizingMask:", 18);
  -[UIScrollView setContentInsetAdjustmentBehavior:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setContentInsetAdjustmentBehavior:", 2);
  -[TSDInteractiveCanvasController setInfosToDisplay:](-[THWiOSExpandedViewController icc](self, "icc"), "setInfosToDisplay:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent")));
  v10 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v10, "expandedContentScrollEnabled") & 1) != 0)
    -[UIScrollView setScrollEnabled:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setScrollEnabled:", -[THWExpandedRep expandedContentScrollEnabled](v10, "expandedContentScrollEnabled"));
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "addSubview:", -[THWiOSExpandedViewController scrollView](self, "scrollView"));
  -[UIScrollView addSubview:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "addSubview:", -[TSDiOSCanvasViewController view](-[THWiOSExpandedViewController cvc](self, "cvc"), "view"));
  if ((objc_opt_respondsToSelector(v10, "expandedContentAllowDoubleTapZoom") & 1) != 0)
  {
    if (-[THWExpandedRep expandedContentAllowDoubleTapZoom](v10, "expandedContentAllowDoubleTapZoom"))
    {
      -[TSDInteractiveCanvasController enableGestureKinds:](self->_icc, "enableGestureKinds:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", TSWPTapAndTouch));
      -[THWiOSExpandedViewController setAllowZoom:](self, "setAllowZoom:", 1);
      if ((objc_opt_respondsToSelector(v10, "expandedContentHandlesDoubleTapZoomDirectly") & 1) != 0)
        -[THWiOSExpandedViewController setAllowZoom:](self, "setAllowZoom:", -[THWExpandedRep expandedContentHandlesDoubleTapZoomDirectly](v10, "expandedContentHandlesDoubleTapZoomDirectly") ^ 1);
    }
  }
  if ((objc_opt_respondsToSelector(v10, "expandedSupportedGestureKinds") & 1) != 0)
    -[TSDInteractiveCanvasController enableGestureKinds:](self->_icc, "enableGestureKinds:", -[THWExpandedRep expandedSupportedGestureKinds](v10, "expandedSupportedGestureKinds"));
  v11 = [THWFreeTransformGestureRecognizer alloc];
  v12 = -[TSDInteractiveCanvasController gestureDispatcher](-[THWiOSExpandedViewController icc](self, "icc"), "gestureDispatcher");
  -[THWiOSExpandedViewController setTransformGR:](self, "setTransformGR:", -[THWFreeTransformGestureRecognizer initWithGestureDispatcher:gestureKind:](v11, "initWithGestureDispatcher:gestureKind:", v12, TSDFreeTransform));
  objc_msgSend(-[TSDiOSCanvasViewController viewForGestureRecognizer:](-[THWiOSExpandedViewController cvc](self, "cvc"), "viewForGestureRecognizer:", -[THWiOSExpandedViewController transformGR](self, "transformGR")), "addGestureRecognizer:", -[THWiOSExpandedViewController transformGR](self, "transformGR"));
  -[THWFreeTransformGestureRecognizer setUnmovingParentView:](-[THWiOSExpandedViewController transformGR](self, "transformGR"), "setUnmovingParentView:", -[TSDiOSCanvasViewController view](-[THWiOSExpandedViewController cvc](self, "cvc"), "view"));
  if ((objc_opt_respondsToSelector(v10, "expandedZoomableInteractiveCanvasController") & 1) == 0
    || (v13 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWExpandedRep expandedZoomableInteractiveCanvasController](v10, "expandedZoomableInteractiveCanvasController"), "layerHost"), "asiOSCVC"), "zoomGestureRecognizer")) == 0)
  {
    v13 = -[TSDiOSCanvasViewController zoomGestureRecognizer](-[THWiOSExpandedViewController cvc](self, "cvc"), "zoomGestureRecognizer");
  }
  objc_msgSend(v13, "requireGestureRecognizerToFail:", -[THWiOSExpandedViewController transformGR](self, "transformGR"));
  -[THWiOSExpandedViewController p_updateBackgroundColor](self, "p_updateBackgroundColor");
  -[THWiOSExpandedViewController setAdornmentController:](self, "setAdornmentController:", -[THWAdornmentController initWithExpandedRep:documentRoot:]([THWAdornmentController alloc], "initWithExpandedRep:documentRoot:", v10, -[THWiOSExpandedViewController documentRoot](self, "documentRoot")));
  -[THWAdornmentController setDelegate:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setDelegate:", self);
  -[THWiOSExpandedViewController setFtc:](self, "setFtc:", objc_alloc_init(THWFreeTransformController));
  -[THWFreeTransformController setGestureRecognizerDelegate:](-[THWiOSExpandedViewController ftc](self, "ftc"), "setGestureRecognizerDelegate:", -[THWExpandedRep freeTransformableHandler](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "freeTransformableHandler"));
  -[THWiOSExpandedViewController p_addKeyCommands](self, "p_addKeyCommands");
}

- (void)p_updateBackgroundColor
{
  UIColor *v3;
  UIColor *v4;
  id v5;
  UIColor *v6;

  if (-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider")&& -[THThemeProvider forceThemeColors](-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"), "forceThemeColors"))
  {
    if (-[THWiOSExpandedViewController freeTransformInFlight](self, "freeTransformInFlight"))
    {
      v3 = +[UIColor clearColor](UIColor, "clearColor");
      v4 = v3;
    }
    else
    {
      v4 = (UIColor *)objc_msgSend(-[THWiOSExpandedViewController p_targetViewBackgroundColor](self, "p_targetViewBackgroundColor"), "UIColor");
      v3 = +[UIColor clearColor](UIColor, "clearColor");
    }
  }
  else
  {
    v4 = (UIColor *)objc_msgSend(-[THWiOSExpandedViewController p_targetViewBackgroundColor](self, "p_targetViewBackgroundColor"), "UIColor");
    if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedBackgroundColor") & 1) == 0|| (v5 = -[THWExpandedRep expandedBackgroundColor](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedBackgroundColor")) == 0)
    {
      v6 = 0;
      goto LABEL_11;
    }
    v3 = (UIColor *)objc_msgSend(v5, "platformColor");
  }
  v6 = v3;
LABEL_11:
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "setBackgroundColor:", v4);
  if (v6)
    -[UIScrollView setBackgroundColor:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setBackgroundColor:", v6);
}

- (void)invalidate
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(THWViewportRep);
  v5 = TSUDynamicCast(v3, -[THWiOSExpandedViewController expandedRep](self, "expandedRep")).n128_u64[0];
  if (v4)
  {
    v6 = v4;
    v7 = objc_opt_class(THInteractiveCanvasController);
    v5 = TSUDynamicCast(v7, objc_msgSend(objc_msgSend(v6, "scrollableCanvasController"), "interactiveCanvasController")).n128_u64[0];
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "pushThreadedLayoutAndRenderDisabled", *(double *)&v5);
      objc_msgSend(v9, "recreateAllLayoutsAndReps");
      objc_msgSend(v9, "layoutIfNeeded");
      objc_msgSend(v9, "popThreadedLayoutAndRenderDisabled");
      if (-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"))
      {
        objc_msgSend(objc_msgSend(v9, "canvasView"), "setBackgroundColor:", +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", -[THThemeProvider backgroundColor](-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"), "backgroundColor")));
      }
    }
  }
  -[THWiOSExpandedViewController p_updateBackgroundColor](self, "p_updateBackgroundColor", *(double *)&v5);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  if ((-[THWiOSExpandedViewController im_isCompactHeight](self, "im_isCompactHeight") & 1) != 0)
    return 1;
  else
    return !-[THWiOSExpandedViewController wantsStatusBarVisible](self, "wantsStatusBarVisible");
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;
  uint64_t v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWiOSExpandedViewController;
  result = -[THWiOSExpandedViewController overrideUserInterfaceStyle](&v6, "overrideUserInterfaceStyle");
  if (!result)
  {
    v4 = objc_opt_class(THiOSThemeProvider);
    *(_QWORD *)&v5 = TSUDynamicCast(v4, -[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider")).n128_u64[0];
    if (result)
      return (int64_t)objc_msgSend((id)result, "userInterfaceStyle", v5);
  }
  return result;
}

- (CGRect)pFrameInUnscaledCanvasSizeForExpandedRep:(id)a3
{
  uint64_t v4;

  if ((objc_opt_respondsToSelector(a3, "expandedFrameInUnscaledCanvasSize") & 1) != 0)
    objc_msgSend(a3, "expandedFrameInUnscaledCanvasSize");
  else
    objc_msgSend(a3, "frameInUnscaledCanvas");
  return CGRectIntegral(*(CGRect *)&v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[THWiOSExpandedViewController p_viewSizeDidChange](self, "p_viewSizeDidChange");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if (-[THWiOSExpandedViewController isFirstResponder](self, "isFirstResponder"))
    -[THWiOSExpandedViewController resignFirstResponder](self, "resignFirstResponder");
}

- (void)p_viewSizeDidChange
{
  THWExpandedRep *v3;
  id v4;
  void *v5;
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
  double v19;
  double v20;
  double v21;

  v3 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  v4 = -[THWExpandedRep layout](v3, "layout");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "invalidateFrame");
    objc_msgSend(v5, "invalidateChildren");
  }
  -[THWiOSExpandedViewController _safeAreaInsets](self, "_safeAreaInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18 - (v9 + v13);
  v21 = v20 - (v7 + v11);
  -[THWiOSExpandedViewController p_updateCanvasToSize:](self, "p_updateCanvasToSize:", v19, v21);
  -[THWiOSExpandedViewController p_updateScrollViewLayout](self, "p_updateScrollViewLayout");
  if ((objc_opt_respondsToSelector(v3, "expandedContentAllowPinchZoom") & 1) != 0
    && -[THWExpandedRep expandedContentAllowPinchZoom](v3, "expandedContentAllowPinchZoom"))
  {
    -[THWiOSExpandedViewController setAllowPinchZoom:withMinimumScale:maximumScale:](self, "setAllowPinchZoom:withMinimumScale:maximumScale:", 1, 1.0, 2.0);
  }
  if (v5)
    objc_msgSend(-[THWExpandedRep interactiveCanvasController](v3, "interactiveCanvasController"), "layoutIfNeeded");
  -[THWAdornmentController layoutInFrame:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "layoutInFrame:", v9 + v15, v7 + v17, v19, v21);
}

- (id)p_targetViewBackgroundColor
{
  id v3;

  v3 = +[TSUColor whiteColor](TSUColor, "whiteColor");
  if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedAppearance") & 1) != 0)
  {
    if (-[THWExpandedRep expandedAppearance](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedAppearance") == 1)return +[TSUColor whiteColor](TSUColor, "whiteColor");
    else
      return +[TSUColor blackColor](TSUColor, "blackColor");
  }
  else if (-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"))
  {
    return +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", -[THThemeProvider backgroundColor](-[THDocumentRoot themeProvider](-[THWiOSExpandedViewController documentRoot](self, "documentRoot"), "themeProvider"), "backgroundColor"));
  }
  else
  {
    return v3;
  }
}

- (void)p_cleanup
{
  objc_msgSend(-[THWFreeTransformGestureRecognizer view](-[THWiOSExpandedViewController transformGR](self, "transformGR"), "view"), "removeGestureRecognizer:", -[THWiOSExpandedViewController transformGR](self, "transformGR"));
  -[THWiOSExpandedViewController setTransformGR:](self, "setTransformGR:", 0);
  -[THWAdornmentController teardown](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "teardown");
  -[THWAdornmentController setDelegate:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setDelegate:", 0);
  -[THWiOSExpandedViewController setAdornmentController:](self, "setAdornmentController:", 0);
  -[THWFreeTransformController setGestureRecognizerDelegate:](-[THWiOSExpandedViewController ftc](self, "ftc"), "setGestureRecognizerDelegate:", 0);
  -[THWiOSExpandedViewController setFtc:](self, "setFtc:", 0);
  -[TSDInteractiveCanvasController teardown](-[THWiOSExpandedViewController icc](self, "icc"), "teardown");
  -[TSDiOSCanvasViewController teardown](-[THWiOSExpandedViewController cvc](self, "cvc"), "teardown");
  -[THWiOSExpandedViewController setIcc:](self, "setIcc:", 0);
  -[THWiOSExpandedViewController setCvc:](self, "setCvc:", 0);
  -[THWiOSExpandedViewController setDrawableToPresent:](self, "setDrawableToPresent:", 0);
  -[UIScrollView setDelegate:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setDelegate:", 0);
  -[THWiOSExpandedViewController setScrollView:](self, "setScrollView:", 0);

  self->mContentsRep = 0;
  self->mDocumentRoot = 0;

  self->_expandedRotationAnimationController = 0;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_wasTornDown)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 515, CFSTR("Expanded view controller was not torn down."));
  -[THWiOSExpandedViewController p_cleanup](self, "p_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController dealloc](&v3, "dealloc");
}

- (void)setAllowPinchZoom:(BOOL)a3 withMinimumScale:(double)a4 maximumScale:(double)a5
{
  _BOOL8 v7;

  v7 = a3;
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "setAllowsPinchZoom:", a3);
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "setMinimumPinchViewScale:", a4);
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "setMaximumPinchViewScale:", a5);
  -[THWiOSExpandedViewController setAllowZoom:](self, "setAllowZoom:", v7);
}

- (BOOL)canHandleGesture:(id)a3
{
  THWExpandedRep *v4;
  unsigned int v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  BOOL result;

  v4 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v4, "expandedContentAllowDoubleTapZoom") & 1) != 0)
    v5 = -[THWExpandedRep expandedContentAllowDoubleTapZoom](v4, "expandedContentAllowDoubleTapZoom");
  else
    v5 = 0;
  v6 = objc_opt_class(THWViewportRep);
  v8 = TSUDynamicCast(v6, v4).n128_u64[0];
  result = 0;
  if (!v7
    || (v9 = v7,
        v10 = objc_opt_class(THInteractiveCanvasController),
        v8 = TSUDynamicCast(v10, objc_msgSend(objc_msgSend(v9, "scrollableCanvasController"), "interactiveCanvasController")).n128_u64[0], !v11)|| (objc_msgSend(v11, "gestureHitLink:", a3, *(double *)&v8) & 1) == 0)
  {
    if (v5)
    {
      v12 = objc_msgSend(a3, "gestureKind", *(double *)&v8);
      if (v12 == (id)TSWPTapAndTouch)
        return 1;
    }
    v13 = objc_msgSend(a3, "gestureKind", *(double *)&v8);
    if (v13 == (id)TSWPImmediateSingleTap)
      return 1;
  }
  return result;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  id v6;
  BOOL result;
  unsigned int v8;

  v5 = objc_msgSend(a3, "gestureKind");
  if (v5 == (id)TSWPImmediateSingleTap)
  {
    v8 = objc_msgSend(a3, "gestureState");
    result = 1;
    if (v8 == 3)
      self->mSingleTapPossible = 1;
  }
  else
  {
    v6 = objc_msgSend(a3, "gestureKind");
    if (v6 == (id)TSWPTapAndTouch)
    {
      if (objc_msgSend(a3, "gestureState") == 3)
      {
        self->mSingleTapPossible = 0;
        -[THWiOSExpandedViewController p_handleDoubleTap:](self, "p_handleDoubleTap:", a3);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)gestureSequenceDidEnd
{
  if (self->mSingleTapPossible)
    -[THWiOSExpandedViewController handleSingleTap](self, "handleSingleTap");
}

- (void)handleSingleTap
{
  if (!-[THWiOSExpandedViewController p_alwaysVisible](self, "p_alwaysVisible"))
  {
    -[THWAdornmentController toggleVisibility](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "toggleVisibility");
    if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "userInteractionDidTakePlace") & 1) != 0)-[THWExpandedRep userInteractionDidTakePlace](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "userInteractionDidTakePlace");
  }
}

- (void)p_handleDoubleTap:(id)a3
{
  THWExpandedRep *v5;
  double v6;
  double v7;

  v5 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v5, "expandedContentHandlesDoubleTapZoomDirectly") & 1) != 0
    && -[THWExpandedRep expandedContentHandlesDoubleTapZoomDirectly](v5, "expandedContentHandlesDoubleTapZoomDirectly"))
  {
    objc_msgSend(a3, "unscaledLocationForICC:", -[THWiOSExpandedViewController icc](self, "icc"));
    -[TSDInteractiveCanvasController convertBoundsToUnscaledPoint:](-[THWiOSExpandedViewController icc](self, "icc"), "convertBoundsToUnscaledPoint:", v6, v7);
    -[THWExpandedRep convertNaturalPointFromUnscaledCanvas:](v5, "convertNaturalPointFromUnscaledCanvas:");
    -[THWExpandedRep expandedContentHandleDoubleTapZoomDirectlyAtPoint:](v5, "expandedContentHandleDoubleTapZoomDirectlyAtPoint:");
  }
  else
  {
    -[THWiOSExpandedViewController p_toggleCanvasZoomAnimated:](self, "p_toggleCanvasZoomAnimated:", 1);
  }
}

- (void)p_toggleCanvasZoomAnimated:(BOOL)a3
{
  _BOOL8 v3;
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
  uint64_t v18;
  double v19;
  double v20;
  __n128 v21;
  __n128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;

  v3 = a3;
  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  v6 = v5;
  -[THWiOSExpandedViewController originalViewScale](self, "originalViewScale");
  v8 = v7;
  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  if (v8 != v9)
  {
    -[THWiOSExpandedViewController originalViewScale](self, "originalViewScale");
LABEL_5:
    v11 = v10;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentMaximumZoomScale") & 1) != 0)
  {
    -[THWExpandedRep expandedContentMaximumZoomScale](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentMaximumZoomScale");
    goto LABEL_5;
  }
  v11 = v6 + v6;
LABEL_7:
  if (vabdd_f64(v6, v11) >= 0.00999999978)
  {
    -[TSDInteractiveCanvasController contentOffset](-[THWiOSExpandedViewController icc](self, "icc"), "contentOffset");
    v13 = v12;
    v15 = v14;
    -[UIScrollView bounds](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "bounds");
    v16 = CGRectGetWidth(v27) * 0.5;
    -[UIScrollView bounds](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "bounds");
    v17 = CGRectGetHeight(v28) * 0.5;
    TSDMultiplyPointScalar(v13, v15, v6);
    v19 = TSDAddPoints(v18);
    v21.n128_f64[0] = TSDMultiplyPointScalar(v19, v20, v11 / v6);
    v23 = TSDSubtractPoints(v21, v22, v16, v17);
    v25 = TSDMultiplyPointScalar(v23, v24, 1.0 / v11);
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](-[THWiOSExpandedViewController icc](self, "icc"), "setViewScale:contentOffset:clampOffset:animated:", 1, v3, v11, v25, v26);
  }
}

- (BOOL)isZoomed
{
  double v3;
  double v4;
  double v5;

  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  v4 = v3;
  -[THWiOSExpandedViewController originalViewScale](self, "originalViewScale");
  return vabdd_f64(v4, v5) >= 0.00999999978;
}

- (void)p_setWantsStatusBarVisible:(BOOL)a3
{
  self->_wantsStatusBarVisible = a3;
  -[THWiOSExpandedViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
}

- (void)presentExpandedAnimatedWithCompletionBlock:(id)a3
{
  id v5;

  -[THWiOSExpandedViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 1);
  v5 = objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "animationController");
  objc_msgSend(v5, "addObserver:", self);
  -[THWiOSExpandedViewController p_setWantsStatusBarVisible:](self, "p_setWantsStatusBarVisible:", 0);
  objc_msgSend(v5, "presentAnimationWithCompletionBlock:overshoot:", a3, 0);
}

- (void)dismissExpandedAnimatedWithCompletionBlock:(id)a3
{
  -[THWExpandedViewControllerDelegate expandedViewControllerWillBeginDismissing:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerWillBeginDismissing:", self);
  -[THWiOSExpandedViewController p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:](self, "p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:", a3, 0);
}

- (void)p_dismissExpandedAnimatedWithCompletionBlock:(id)a3 freeTransformDidEnd:(BOOL)a4
{
  _BOOL8 v4;
  THWExpandedRep *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[6];

  v4 = a4;
  if (!-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
  {
    -[THWiOSExpandedViewController setIsDismissing:](self, "setIsDismissing:", 1);
    -[THWiOSExpandedViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 3);
    -[THWiOSExpandedViewController p_setWantsStatusBarVisible:](self, "p_setWantsStatusBarVisible:", -[THWiOSExpandedViewController im_isCompactHeight](self, "im_isCompactHeight") ^ 1);
    v7 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    if ((objc_opt_respondsToSelector(v7, "willExitExpandedFreeTransformDidEnd:") & 1) != 0)
      -[THWExpandedRep willExitExpandedFreeTransformDidEnd:](v7, "willExitExpandedFreeTransformDidEnd:", v4);
    if (v4)
    {
      v8 = 0;
      v9 = 0;
    }
    else
    {
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "hostICC"), "layerHost"), "canvasLayer");
      v8 = objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "layer");
    }
    v10 = objc_opt_class(TSDRep);
    v11 = objc_msgSend((id)TSUClassAndProtocolCast(v7, v10, 1), "animationController", &OBJC_PROTOCOL___THWExpandedRep);
    if (!v11)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 741, CFSTR("invalid nil value for '%s'"), "animationController");
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_13013C;
    v15[3] = &unk_426E78;
    v15[4] = -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep");
    v15[5] = a3;
    v12 = TSUProtocolCast(&OBJC_PROTOCOL___THAnimatableSource, v7);
    v13 = TSUProtocolCast(&OBJC_PROTOCOL___THAnimatableDestination, -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"));
    if (v12 && (v14 = v13) != 0)
    {
      objc_msgSend(v11, "setSource:", v12);
      objc_msgSend(v11, "setDestination:", v14);
      objc_msgSend(v11, "setHostLayer:", objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview"), "layer"));
      objc_msgSend(v11, "setForegroundLayer:", v9);
      objc_msgSend(v11, "setBackgroundLayer:", v8);
      objc_msgSend(v11, "addObserver:", self);
      objc_msgSend(v11, "presentAnimationWithCompletionBlock:overshoot:", v15, v4);
    }
    else
    {
      -[THWiOSExpandedViewController dismissExpandedImmediate](self, "dismissExpandedImmediate");
      sub_13013C((uint64_t)v15);
    }
  }
}

- (void)handleHyperlinkWithURL:(id)a3
{
  -[THWExpandedViewControllerDelegate expandedViewController:handleHyperlinkWithURL:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewController:handleHyperlinkWithURL:", self, a3);
}

- (void)dismissExpandedImmediate
{
  THWiOSExpandedViewController *v3;
  THWExpandedRep *v4;

  -[THWiOSExpandedViewController setIsDismissing:](self, "setIsDismissing:", 1);
  v3 = self;
  -[THWiOSExpandedViewController _dismissWillReplaceContentWithFlush:](self, "_dismissWillReplaceContentWithFlush:", 0);
  -[THWExpandedViewControllerDelegate expandedViewControllerWillDismiss:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerWillDismiss:", self);
  -[THWiOSExpandedViewController removeFromParentViewController](self, "removeFromParentViewController");
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "removeFromSuperview");
  -[THWiOSExpandedViewController _dismissReplaceContent](self, "_dismissReplaceContent");
  v4 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v4, "didExitExpanded") & 1) != 0)
    -[THWExpandedRep didExitExpanded](v4, "didExitExpanded");
  -[THWExpandedViewControllerDelegate expandedViewControllerDidDismiss:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerDidDismiss:", self);
  -[THWiOSExpandedViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", 4);
  -[THWiOSExpandedViewController setIsDismissing:](self, "setIsDismissing:", 0);
  -[THWiOSExpandedViewController setNeedsWhitePointAdaptivityStyleUpdate](self, "setNeedsWhitePointAdaptivityStyleUpdate");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (UIEdgeInsets)_safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  if (objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "superview")
    || (objc_opt_respondsToSelector(-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerSafeAreaInsets:") & 1) == 0)
  {
    objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "safeAreaInsets");
  }
  else
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerSafeAreaInsets:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerSafeAreaInsets:", self);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)p_updateCanvasToSize:(CGSize)a3
{
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "setUnscaledSize:", a3.width, a3.height);
}

- (void)p_updateScrollViewLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "unscaledSize");
  -[UIScrollView setContentSize:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setContentSize:", v3, v4);
  -[THWiOSExpandedViewController _safeAreaInsets](self, "_safeAreaInsets");
  -[UIScrollView setContentInset:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setContentInset:", v5, v6, v7, v8);
}

- (BOOL)shouldAutorotate
{
  return -[THWiOSExpandedViewController expandedRepControllerState](self, "expandedRepControllerState") == 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  char v8;
  __int128 v9;
  unsigned __int8 v10;
  _QWORD v11[9];
  char v12;
  _QWORD v13[9];
  char v14;
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  CGAffineTransform v23;
  objc_super v24;

  if (!self->_wasTornDown)
  {
    height = a3.height;
    width = a3.width;
    v24.receiver = self;
    v24.super_class = (Class)THWiOSExpandedViewController;
    -[THWiOSExpandedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v24, "viewWillTransitionToSize:withTransitionCoordinator:");
    if (a4)
    {
      objc_msgSend(a4, "targetTransform");
      if (CGAffineTransformIsIdentity(&v23))
      {
        -[THWiOSExpandedViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
        v8 = 0;
      }
      else
      {
        -[THWiOSExpandedViewController bookViewWillRotateTransitionToSize:withTransitionCoordinator:](self, "bookViewWillRotateTransitionToSize:withTransitionCoordinator:", a4, width, height);
        v8 = 1;
      }
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v15[0] = 0;
      v15[1] = v15;
      v15[2] = 0x5010000000;
      v15[3] = "";
      v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      v16 = *(_OWORD *)&CGAffineTransformIdentity.a;
      v17 = v9;
      v18 = *(_OWORD *)&CGAffineTransformIdentity.tx;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1305C8;
      v13[3] = &unk_429E78;
      v14 = v8;
      v13[5] = &v19;
      v13[6] = v15;
      v13[4] = self;
      *(double *)&v13[7] = width;
      *(double *)&v13[8] = height;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_130638;
      v11[3] = &unk_429EA0;
      v12 = v8;
      v11[4] = self;
      v11[5] = &v19;
      *(double *)&v11[7] = width;
      *(double *)&v11[8] = height;
      v11[6] = v15;
      v10 = objc_msgSend(a4, "animateAlongsideTransition:completion:", v13, v11);
      *((_BYTE *)v20 + 24) = v10;
      _Block_object_dispose(v15, 8);
      _Block_object_dispose(&v19, 8);
    }
    else
    {
      -[THWiOSExpandedViewController bookViewWillTransitionToSize:withTransitionCoordinator:](self, "bookViewWillTransitionToSize:withTransitionCoordinator:", 0, width, height);
      -[THWiOSExpandedViewController bookViewDidTransitionToSize:withContext:](self, "bookViewDidTransitionToSize:withContext:", 0, width, height);
    }
  }
}

- (void)bookViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  THWExpandedRep *v7;
  id v8;
  THWExpandedTransitionRotationAnimationController *expandedRotationAnimationController;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  -[THWAdornmentController controllerWillTransitionToSize:withTransitionCoordinator:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "controllerWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  v7 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v7, "expandedRotationAnimationController") & 1) != 0)
    v8 = -[THWExpandedRep expandedRotationAnimationController](v7, "expandedRotationAnimationController");
  else
    v8 = 0;
  -[THWiOSExpandedViewController setExpandedRotationAnimationController:](self, "setExpandedRotationAnimationController:", v8);
  expandedRotationAnimationController = self->_expandedRotationAnimationController;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  -[THWExpandedTransitionRotationAnimationController expandedWillTransitionFromSize:toSize:](expandedRotationAnimationController, "expandedWillTransitionFromSize:toSize:", v10, v11, width, height);
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
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
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  THWExpandedRep *v23;
  id v24;
  CGRect v25;
  CGRect v26;

  height = a3.height;
  width = a3.width;
  -[THWAdornmentController controllerWillTransitionToSize:withTransitionCoordinator:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "controllerWillTransitionToSize:withTransitionCoordinator:", a4, a3.width, a3.height);
  -[THWiOSExpandedViewController setRotationScrim:](self, "setRotationScrim:", +[CALayer layer](CALayer, "layer"));
  -[CALayer setBackgroundColor:](-[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"), "setBackgroundColor:", objc_msgSend(-[THWiOSExpandedViewController p_targetViewBackgroundColor](self, "p_targetViewBackgroundColor"), "CGColor"));
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "bounds");
  v16 = v15 * -0.707;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "bounds");
  v18 = v17 * -0.707;
  v25.origin.x = v8;
  v25.origin.y = v10;
  v25.size.width = v12;
  v25.size.height = v14;
  v26 = CGRectInset(v25, v16, v18);
  -[CALayer setFrame:](-[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"), "setFrame:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  -[CALayer setZPosition:](-[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"), "setZPosition:", -32000.0);
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "layer"), "addSublayer:", -[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"));
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  self->_preRotateViewFrame.origin.x = v19;
  self->_preRotateViewFrame.origin.y = v20;
  self->_preRotateViewFrame.size.width = v21;
  self->_preRotateViewFrame.size.height = v22;
  -[THWAdornmentController setDisablePanelFrameAnimation:](self->_adornmentController, "setDisablePanelFrameAnimation:", 1);
  v23 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  if ((objc_opt_respondsToSelector(v23, "expandedRotationAnimationController") & 1) != 0)
    v24 = -[THWExpandedRep expandedRotationAnimationController](v23, "expandedRotationAnimationController");
  else
    v24 = 0;
  -[THWiOSExpandedViewController setExpandedRotationAnimationController:](self, "setExpandedRotationAnimationController:", v24);
  -[THWExpandedTransitionRotationAnimationController expandedWillRotateTransitionFromSize:toSize:](self->_expandedRotationAnimationController, "expandedWillRotateTransitionFromSize:toSize:", self->_preRotateViewFrame.size.width, self->_preRotateViewFrame.size.height, width, height);
  -[UIScrollView setClipsToBounds:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setClipsToBounds:", 0);
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView"), "setClipsToBounds:", 0);
}

- (CGAffineTransform)bookViewWillAnimateRotationToSize:(SEL)a3 withContext:(CGSize)a4
{
  double height;
  double width;
  id v10;
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
  THWAdornmentController *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  THWExpandedTransitionRotationAnimationController *expandedRotationAnimationController;
  double v36;
  unsigned int v37;
  unsigned int v38;
  TSDInteractiveCanvasController *v39;
  __int128 v40;
  double y;
  double x;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGAffineTransform v50[2];
  CGAffineTransform v51;
  CGAffineTransform v52;
  CGAffineTransform v53;

  height = a4.height;
  width = a4.width;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v10 = -[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView");
  if (v10)
  {
    objc_msgSend(v10, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  +[CATransaction begin](CATransaction, "begin");
  -[THWiOSExpandedViewController _safeAreaInsets](self, "_safeAreaInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  v20 = v14 + v19;
  v22 = v12 + v21;
  v24 = v23 - (v14 + v18);
  v26 = v25 - (v12 + v16);
  v27 = -[THWiOSExpandedViewController adornmentController](self, "adornmentController");
  objc_msgSend(a5, "transitionDuration");
  -[THWAdornmentController controllerWillAnimateToSize:duration:inFrame:](v27, "controllerWillAnimateToSize:duration:inFrame:", width, height, v28, v20, v22, v24, v26);
  -[THWiOSExpandedViewController p_updateCanvasToSize:](self, "p_updateCanvasToSize:", v24, v26);
  -[THWiOSExpandedViewController p_updateScrollViewLayout](self, "p_updateScrollViewLayout");
  v30 = self->_preRotateViewFrame.size.width;
  v29 = self->_preRotateViewFrame.size.height;
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  v32 = v31;
  v34 = v33;
  expandedRotationAnimationController = self->_expandedRotationAnimationController;
  objc_msgSend(a5, "transitionDuration");
  -[THWExpandedTransitionRotationAnimationController expandedWillAnimateRotationFromSize:toSize:duration:](expandedRotationAnimationController, "expandedWillAnimateRotationFromSize:toSize:duration:", v30, v29, v32, v34, v36);
  v37 = -[THWExpandedTransitionRotationAnimationController autoRotationMode](self->_expandedRotationAnimationController, "autoRotationMode");
  if (v37)
  {
    v38 = v37;
    v39 = -[THWiOSExpandedViewController icc](self, "icc");
    v40 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v53.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v53.c = v40;
    *(_OWORD *)&v53.tx = *(_OWORD *)&retstr->tx;
    x = CGPointZero.x;
    y = CGPointZero.y;
    if (v38 == 1)
    {
      v43 = v32 / v30;
    }
    else if (v38 == 2)
    {
      v43 = v34 / v29;
    }
    else
    {
      v43 = 1.0;
      if (v38 == 3)
      {
        -[THWExpandedTransitionRotationAnimationController scaleForCenteredAutoRotateFromSize:toSize:](self->_expandedRotationAnimationController, "scaleForCenteredAutoRotateFromSize:toSize:", v30, v29, v32, v34);
        v43 = v44;
        -[THWExpandedTransitionRotationAnimationController translateForCenteredAutoRotateFromSize:toSize:](self->_expandedRotationAnimationController, "translateForCenteredAutoRotateFromSize:toSize:", v30, v29, v32, v34);
        x = v45;
        y = v46;
      }
    }
    v52 = v53;
    CGAffineTransformScale(&v53, &v52, v43, v43);
    if (v38 == 4)
    {
      v51 = v53;
      v47 = x;
      v48 = y;
    }
    else
    {
      v47 = x - (v30 - v32) * 0.5;
      v48 = y - (v29 - v34) * 0.5;
      v51 = v53;
    }
    CGAffineTransformTranslate(&v52, &v51, v47, v48);
    v53 = v52;
    v50[1] = v52;
    v50[0] = v52;
    objc_msgSend(-[TSDInteractiveCanvasController canvasView](v39, "canvasView"), "setTransform:", v50);
  }
  return (CGAffineTransform *)+[CATransaction commit](CATransaction, "commit");
}

- (void)bookViewDidAnimateRotationToSize:(CGSize)a3 withContext:(id)a4 transform:(CGAffineTransform *)a5
{
  double height;
  double width;
  double v9;
  __int128 v10;

  height = a3.height;
  width = a3.width;
  -[THWAdornmentController controllerDidTransitionToSize:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController", a4), "controllerDidTransitionToSize:", a3.width, a3.height);
  -[CALayer removeFromSuperlayer](-[THWiOSExpandedViewController rotationScrim](self, "rotationScrim"), "removeFromSuperlayer");
  -[THWiOSExpandedViewController setRotationScrim:](self, "setRotationScrim:", 0);
  -[THWExpandedTransitionRotationAnimationController expandedDidAnimateRotationToSize:](self->_expandedRotationAnimationController, "expandedDidAnimateRotationToSize:", width, height);
  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  if (fabs(v9 + -1.0) >= 0.00999999978
    && (objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentNonContiguousZoomScale") & 1) != 0&& -[THWExpandedRep expandedContentNonContiguousZoomScale](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentNonContiguousZoomScale"))
  {
    -[TSDInteractiveCanvasController setViewScale:](-[THWiOSExpandedViewController icc](self, "icc"), "setViewScale:", 1.0);
    -[THWiOSExpandedViewController p_toggleCanvasZoomAnimated:](self, "p_toggleCanvasZoomAnimated:", 0);
  }
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc", *(_QWORD *)&a5->a, *(_QWORD *)&a5->b, *(_QWORD *)&a5->c, *(_QWORD *)&a5->d, *(_QWORD *)&a5->tx, *(_QWORD *)&a5->ty), "canvasView"), "setTransform:", &v10);
  -[UIScrollView setClipsToBounds:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setClipsToBounds:", 1);
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView"), "setClipsToBounds:", 1);
  -[THWAdornmentController setDisablePanelFrameAnimation:](self->_adornmentController, "setDisablePanelFrameAnimation:", 0);
}

- (void)bookViewDidRotateTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  -[THWExpandedTransitionRotationAnimationController expandedDidRotateTransitionToSize:](self->_expandedRotationAnimationController, "expandedDidRotateTransitionToSize:", a4, a3.width, a3.height);
  -[THWiOSExpandedViewController setExpandedRotationAnimationController:](self, "setExpandedRotationAnimationController:", 0);
  -[THWAdornmentController updateVisibility](self->_adornmentController, "updateVisibility");
}

- (void)bookViewDidTransitionToSize:(CGSize)a3 withContext:(id)a4
{
  double height;
  double width;
  double v7;

  height = a3.height;
  width = a3.width;
  -[THWiOSExpandedViewController p_viewSizeDidChange](self, "p_viewSizeDidChange", a4);
  -[THWAdornmentController controllerDidTransitionToSize:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "controllerDidTransitionToSize:", width, height);
  -[THWExpandedTransitionRotationAnimationController expandedDidTransitionToSize:](self->_expandedRotationAnimationController, "expandedDidTransitionToSize:", width, height);
  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  if (fabs(v7 + -1.0) >= 0.00999999978
    && (objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentNonContiguousZoomScale") & 1) != 0&& -[THWExpandedRep expandedContentNonContiguousZoomScale](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentNonContiguousZoomScale"))
  {
    -[TSDInteractiveCanvasController setViewScale:](-[THWiOSExpandedViewController icc](self, "icc"), "setViewScale:", 1.0);
    -[THWiOSExpandedViewController p_toggleCanvasZoomAnimated:](self, "p_toggleCanvasZoomAnimated:", 0);
  }
  -[UIScrollView setClipsToBounds:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setClipsToBounds:", 1);
  objc_msgSend(-[TSDInteractiveCanvasController canvasView](-[THWiOSExpandedViewController icc](self, "icc"), "canvasView"), "setClipsToBounds:", 1);
  -[THWiOSExpandedViewController setExpandedRotationAnimationController:](self, "setExpandedRotationAnimationController:", 0);
  -[THWAdornmentController setDisablePanelFrameAnimation:](self->_adornmentController, "setDisablePanelFrameAnimation:", 0);
  -[THWAdornmentController updateVisibility](self->_adornmentController, "updateVisibility");
}

- (BOOL)p_hasRepForICC:(id)a3 forInfo:(id)a4
{
  return objc_msgSend(a3, "repForInfo:createIfNeeded:", a4, 1) != 0;
}

- (BOOL)p_hasSourceRepForInfo:(id)a3
{
  return -[THWiOSExpandedViewController p_hasRepForICC:forInfo:](self, "p_hasRepForICC:forInfo:", -[THWiOSExpandedViewController p_sourceICC](self, "p_sourceICC"), a3);
}

- (id)p_sourceRepForInfo:(id)a3
{
  id v3;

  v3 = objc_msgSend(-[THWiOSExpandedViewController p_sourceICC](self, "p_sourceICC"), "repForInfo:createIfNeeded:", a3, 1);
  if (!v3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController p_sourceRepForInfo:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1108, CFSTR("invalid nil value for '%s'"), "resultRep");
  return v3;
}

- (BOOL)p_hasTargetRepForInfo:(id)a3
{
  return -[THWiOSExpandedViewController p_hasRepForICC:forInfo:](self, "p_hasRepForICC:forInfo:", -[THWiOSExpandedViewController p_targetICC](self, "p_targetICC"), a3);
}

- (id)p_targetRepForInfo:(id)a3
{
  return objc_msgSend(-[THWiOSExpandedViewController p_targetICC](self, "p_targetICC"), "repForInfo:createIfNeeded:", a3, 0);
}

- (void)_dismissWillReplaceContentWithFlush:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  v5 = -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep");
  if (-[THWiOSExpandedViewController p_hasSourceRepForInfo:](self, "p_hasSourceRepForInfo:", objc_msgSend(v5, "info")))
  {
    v6 = -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", objc_msgSend(v5, "info"));
    if (v6)
    {
      v7 = v6;
      if (v3)
        +[CATransaction flush](CATransaction, "flush");
      objc_msgSend(v5, "willReplaceContentsFromRep:", v7);
    }
  }
}

- (void)_dismissReplaceContent
{
  TSDRep *mContentsRep;
  id v4;

  mContentsRep = self->mContentsRep;
  if (mContentsRep)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController _dismissReplaceContent]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1148, CFSTR("expected nil value for '%s'"), "mContentsRep");
    mContentsRep = self->mContentsRep;
  }

  self->mContentsRep = 0;
  if (-[THWiOSExpandedViewController p_hasTargetRepForInfo:](self, "p_hasTargetRepForInfo:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent")))
  {
    v4 = -[THWiOSExpandedViewController p_targetRepForInfo:](self, "p_targetRepForInfo:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent"));
    if (!v4)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController _dismissReplaceContent]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1154, CFSTR("invalid nil value for '%s'"), "targetContentsRep");
    objc_msgSend(v4, "replaceContentsFromRep:", -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", objc_msgSend(v4, "info")));
  }
}

- (void)animationControllerWillPresent:(id)a3
{
  if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing", a3))
  {
    -[THWiOSExpandedViewController _dismissWillReplaceContentWithFlush:](self, "_dismissWillReplaceContentWithFlush:", 1);
    -[THWExpandedViewControllerDelegate expandedViewControllerWillDismiss:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerWillDismiss:", self);
  }
  else
  {
    -[THWExpandedViewControllerDelegate expandedViewControllerWillPresent:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerWillPresent:", self);
  }
}

- (void)animationControllerTeardownTarget:(id)a3
{
  TSDRep *mContentsRep;
  TSDRep *v5;
  id v6;
  id v7;

  if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing", a3))
  {
    -[THWiOSExpandedViewController _dismissReplaceContent](self, "_dismissReplaceContent");
  }
  else if (self->mContentsRep)
  {
    mContentsRep = -[THWiOSExpandedViewController p_targetRepForInfo:](self, "p_targetRepForInfo:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent"));
    v5 = mContentsRep;
    if (self->mContentsRep != mContentsRep)
    {
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController animationControllerTeardownTarget:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1179, CFSTR("Save contents rep and contents rep do not match."));
      mContentsRep = self->mContentsRep;
    }
    v6 = -[TSDRep info](mContentsRep, "info");
    if (self->mContentsRep == v5)
    {
      v7 = v6;
      if (-[THWiOSExpandedViewController p_hasSourceRepForInfo:](self, "p_hasSourceRepForInfo:", v6))
        -[TSDRep replaceContentsFromRep:](self->mContentsRep, "replaceContentsFromRep:", -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", v7));
    }
  }
}

- (void)animationControllerDidPresent:(id)a3
{
  id v4;
  THWiOSExpandedViewController *v5;
  THWExpandedRep *v6;
  THWExpandedRep *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  THWExpandedRep *v11;
  THWExpandedRep *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __objc2_prot *v16;
  __objc2_prot *v17;

  v4 = -[THWiOSExpandedViewController parentViewController](self, "parentViewController", a3);
  if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
  {
    v5 = self;
    -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0);
    -[THWiOSExpandedViewController removeFromParentViewController](self, "removeFromParentViewController");
    objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "removeFromSuperview");
    v6 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    if ((objc_opt_respondsToSelector(v6, "didExitExpanded") & 1) != 0)
      -[THWExpandedRep didExitExpanded](v6, "didExitExpanded");
    v7 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    v8 = objc_opt_class(TSDRep);
    v16 = &OBJC_PROTOCOL___BCProgressTracking;
    v9 = TSUClassAndProtocolCast(v7, v8, 1);
    if (v9)
    {
      v10 = v9;
      if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController delegate](self, "delegate", &OBJC_PROTOCOL___BCProgressTracking), "expandedViewController:deactivateProgressForRep:") & 1) != 0)-[THWExpandedViewControllerDelegate expandedViewController:deactivateProgressForRep:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewController:deactivateProgressForRep:", self, v10);
    }
    -[THWExpandedViewControllerDelegate expandedViewControllerDidDismiss:](-[THWiOSExpandedViewController delegate](self, "delegate", v16), "expandedViewControllerDidDismiss:", self);
  }
  else
  {
    -[THWAdornmentController addAdornmentViewsToView:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "addAdornmentViewsToView:", -[THWiOSExpandedViewController view](self, "view"));
    if (-[THWiOSExpandedViewController p_startsVisible](self, "p_startsVisible")
      || -[THWiOSExpandedViewController p_alwaysVisible](self, "p_alwaysVisible"))
    {
      -[THWAdornmentController setAdornmentsVisible:animated:completionBlock:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setAdornmentsVisible:animated:completionBlock:", 1, 1, 0);
    }
    v11 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    if ((objc_opt_respondsToSelector(v11, "didPresentExpanded") & 1) != 0)
      -[THWExpandedRep didPresentExpanded](v11, "didPresentExpanded");
    -[THWExpandedViewControllerDelegate expandedViewControllerDidPresent:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerDidPresent:", self);
    v12 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    v13 = objc_opt_class(TSDRep);
    v17 = &OBJC_PROTOCOL___BCProgressTracking;
    v14 = TSUClassAndProtocolCast(v12, v13, 1);
    if (v14)
    {
      v15 = v14;
      if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController delegate](self, "delegate", &OBJC_PROTOCOL___BCProgressTracking), "expandedViewController:activateProgressForRep:") & 1) != 0)-[THWExpandedViewControllerDelegate expandedViewController:activateProgressForRep:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewController:activateProgressForRep:", self, v15);
    }
    -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0, v17);
  }
  objc_msgSend(v4, "setNeedsWhitePointAdaptivityStyleUpdate");

  self->mContentsRep = 0;
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  uint64_t v5;

  if (-[THWiOSExpandedViewController expandedRepControllerState](self, "expandedRepControllerState") == 1)
  {
    v5 = 2;
LABEL_5:
    -[THWiOSExpandedViewController setExpandedRepControllerState:](self, "setExpandedRepControllerState:", v5);
    goto LABEL_6;
  }
  if (-[THWiOSExpandedViewController expandedRepControllerState](self, "expandedRepControllerState") == 3)
  {
    v5 = 4;
    goto LABEL_5;
  }
LABEL_6:
  if (!-[THWiOSExpandedViewController isDismissing](self, "isDismissing")
    && (objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "didPresentExpandedPostCommit") & 1) != 0)
  {
    -[THWExpandedRep didPresentExpandedPostCommit](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "didPresentExpandedPostCommit");
  }
  -[THWiOSExpandedViewController setIsDismissing:](self, "setIsDismissing:", 0);
  objc_msgSend(a3, "removeObserver:", self);
}

- (void)animationControllerSetupTarget:(id)a3
{
  id v5;
  __int128 v6;
  THWExpandedRep *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _OWORD v13[3];

  if (!-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
  {
    -[THWAdornmentController setDisablePanelFrameAnimation:](self->_adornmentController, "setDisablePanelFrameAnimation:", 1);
    v5 = -[THWiOSExpandedViewController view](self, "view");
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v13[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v13[1] = v6;
    v13[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    objc_msgSend(v5, "setTransform:", v13);
    objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview"), "bounds");
    objc_msgSend(v5, "setFrame:");
    objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview"), "addSubview:", v5);
    v7 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    v8 = -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep");
    if ((objc_opt_respondsToSelector(v8, "expandableWillPresentExpanded") & 1) != 0)
      objc_msgSend(v8, "expandableWillPresentExpanded");
    if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
      v9 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "hostICC"), "layerHost"), "canvasLayer");
    else
      v9 = objc_msgSend(v5, "layer");
    v10 = v9;
    if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
      v11 = objc_msgSend(v5, "layer");
    else
      v11 = objc_msgSend(objc_msgSend(objc_msgSend(v8, "hostICC"), "layerHost"), "canvasLayer");
    v12 = v11;
    objc_msgSend(a3, "setSource:", v8);
    objc_msgSend(a3, "setDestination:", v7);
    objc_msgSend(a3, "setHostLayer:", objc_msgSend(-[THWExpandedViewControllerDelegate rootSuperview](-[THWiOSExpandedViewController delegate](self, "delegate"), "rootSuperview"), "layer"));
    objc_msgSend(a3, "setForegroundLayer:", v10);
    objc_msgSend(a3, "setBackgroundLayer:", v12);
    objc_msgSend(v5, "layoutIfNeeded");
    -[THWAdornmentController setDisablePanelFrameAnimation:](self->_adornmentController, "setDisablePanelFrameAnimation:", 0);
    if ((objc_opt_respondsToSelector(v7, "expandedDidAppearPreAnimation") & 1) != 0)
      -[THWExpandedRep expandedDidAppearPreAnimation](v7, "expandedDidAppearPreAnimation");
  }
}

- (BOOL)animationControllerSetsDestination:(id)a3
{
  return 1;
}

- (void)hideAdornments
{
  if (!-[THWiOSExpandedViewController p_alwaysVisible](self, "p_alwaysVisible"))
    -[THWAdornmentController setAdornmentsVisible:animated:completionBlock:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setAdornmentsVisible:animated:completionBlock:", 0, 1, 0);
}

- (void)showAdornments
{
  if (!-[THWiOSExpandedViewController p_alwaysVisible](self, "p_alwaysVisible"))
    -[THWAdornmentController setAdornmentsVisible:animated:completionBlock:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setAdornmentsVisible:animated:completionBlock:", 1, 1, 0);
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  THWExpandedRep *v10;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSDGesture, a4);
  v6 = objc_msgSend(v5, "gestureKind");
  if (v6 == (id)TSWPImmediateSingleTap)
  {
    v8 = 1;
  }
  else
  {
    v7 = objc_msgSend(v5, "gestureKind");
    v8 = v7 == (id)TSWPTapAndTouch;
  }
  v9 = objc_msgSend(v5, "gestureKind");
  if (v9 == (id)TSDFreeTransform)
  {
    v10 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
    if ((objc_opt_respondsToSelector(v10, "expandedAllowFreeTransform") & 1) != 0)
      return -[THWExpandedRep expandedAllowFreeTransform](v10, "expandedAllowFreeTransform");
    return 1;
  }
  return v8;
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (id)p_sourceICC
{
  if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
    return -[THWiOSExpandedViewController icc](self, "icc");
  else
    return objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "hostICC");
}

- (id)p_targetICC
{
  if (-[THWiOSExpandedViewController isDismissing](self, "isDismissing"))
    return objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "hostICC");
  else
    return -[THWiOSExpandedViewController icc](self, "icc");
}

- (void)interactiveCanvasController:(id)a3 willLayoutRep:(id)a4
{
  TSDInfo *v6;
  void *v7;

  if (-[THWiOSExpandedViewController p_targetICC](self, "p_targetICC") == a3)
  {
    v6 = -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent");
    if (objc_msgSend(a4, "info") == v6)
    {

      self->mContentsRep = 0;
      self->mContentsRep = (TSDRep *)a4;
      v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWExpandedRep, a4);
      if ((objc_opt_respondsToSelector(v7, "expandedWillPresentWithController:") & 1) != 0)
        objc_msgSend(v7, "expandedWillPresentWithController:", self);
    }
    if (-[THWiOSExpandedViewController p_hasSourceRepForInfo:](self, "p_hasSourceRepForInfo:", objc_msgSend(a4, "info")))
    {
      objc_msgSend(a4, "willReplaceContentsFromRep:", -[THWiOSExpandedViewController p_sourceRepForInfo:](self, "p_sourceRepForInfo:", objc_msgSend(a4, "info")));
    }
  }
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  double y;
  double x;
  UIScrollView *v9;
  id v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat width;
  CGFloat height;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  float v24;
  double v25;
  float v26;
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
  CGPoint result;
  CGRect v38;
  CGRect v39;

  y = a4.y;
  x = a4.x;
  v9 = -[THWiOSExpandedViewController scrollView](self, "scrollView", a3);
  v10 = -[UIScrollView window](v9, "window");
  if (!v10)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController interactiveCanvasController:clampContentOffset:forViewScale:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1429, CFSTR("invalid nil value for '%s'"), "window");
  objc_msgSend(v10, "bounds");
  v11 = v38.origin.x;
  v12 = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  v15 = CGRectGetWidth(v38);
  v39.origin.x = v11;
  v39.origin.y = v12;
  v39.size.width = width;
  v39.size.height = height;
  v16 = CGRectGetHeight(v39);
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "safeAreaInsets");
  v18 = v16 - v17;
  objc_msgSend(-[TSDiOSCanvasViewController canvasLayer](-[THWiOSExpandedViewController cvc](self, "cvc"), "canvasLayer"), "unscaledSize");
  v21 = TSDMultiplySizeScalar(v19, v20, a5);
  v23 = v22;
  v24 = v15;
  *(float *)&v22 = v21;
  v25 = fminf(v24, *(float *)&v22);
  v26 = v18;
  *(float *)&v22 = v23;
  v27 = fminf(v26, *(float *)&v22);
  -[UIScrollView bounds](v9, "bounds");
  v29 = (v25 - v28) * 0.5;
  -[UIScrollView bounds](v9, "bounds");
  v31 = (v27 - v30) * 0.5;
  -[UIScrollView bounds](v9, "bounds");
  v33 = TSUClamp(x, v29, v21 - (v32 + v29));
  -[UIScrollView bounds](v9, "bounds");
  v35 = TSUClamp(y, v31, v23 - (v31 + v34));
  v36 = v33;
  result.y = v35;
  result.x = v36;
  return result;
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  void *v5;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetLayout, a4);
  if (v5)
    objc_msgSend(v5, "setDelegate:", self);
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  objc_msgSend(-[THWiOSExpandedViewController view](self, "view", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "bounds");
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "convertRect:toView:", objc_msgSend(a3, "canvasView"), v6, v7, v8, v9);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  objc_msgSend(-[TSDiOSCanvasViewController view](-[THWiOSExpandedViewController cvc](self, "cvc", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height), "view"), "bounds");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)additionalGestureTargetsForInteractiveCanvasController:(id)a3 gesture:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = +[NSMutableArray array](NSMutableArray, "array", a3);
  v7 = TSUProtocolCast(&OBJC_PROTOCOL___TSDGestureTarget, -[THWiOSExpandedViewController expandedRep](self, "expandedRep"));
  v8 = objc_msgSend(a4, "gestureKind");
  if (v8 == (id)TSDFreeTransform && v7 != 0)
    objc_msgSend(v6, "addObject:", v7);
  objc_msgSend(v6, "addObject:", self);
  return v6;
}

- (BOOL)interactiveCanvasController:(id)a3 allowsEditMenuForRep:(id)a4
{
  return 0;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldBeginEditingTHWPRep:(id)a4 withGesture:(id)a5
{
  return 0;
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  return (id)TSUProtocolCast(a4, self, a3);
}

- (void)exitAVPresentation:(id)a3
{
  -[THWiOSExpandedViewController dismissExpandedAnimatedWithCompletionBlock:](self, "dismissExpandedAnimatedWithCompletionBlock:", &stru_429EC0);
  objc_msgSend(a3, "setDelegate:", 0);
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (int)widgetLayoutMode:(id)a3
{
  return 1;
}

- (BOOL)widgetLayoutIsCompactFlow:(id)a3
{
  return 0;
}

- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "bounds");
  v3 = TSDRectWithSize(-[THWiOSExpandedViewController _safeAreaInsets](self, "_safeAreaInsets"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)expandedRepControllerInvalidateChildrenInPanel:(int)a3 invalidateWPAuto:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  -[THWAdornmentController invalidateChildrenInPanel:](self->_adornmentController, "invalidateChildrenInPanel:");
  if (v4)
    -[THWAdornmentController invalidateWPAutoInPanel:](self->_adornmentController, "invalidateWPAutoInPanel:", v5);
}

- (id)expandedRepSourceRep
{
  return -[THWExpandedViewControllerDelegate expandableRepForInfo:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandableRepForInfo:", -[THWiOSExpandedViewController drawableToPresent](self, "drawableToPresent"));
}

- (void)expandedRepControllerAnimatePanel:(int)a3 withCrossFadeContent:(BOOL)a4 backgroundLayout:(BOOL)a5 duration:(double)a6
{
  -[THWAdornmentController animatePanel:withCrossFadeContent:backgroundLayout:duration:](self->_adornmentController, "animatePanel:withCrossFadeContent:backgroundLayout:duration:", *(_QWORD *)&a3, a4, a5, a6);
}

- (void)expandedRepControllerUpdatePanelVisibility
{
  -[THWAdornmentController updateVisibility](self->_adornmentController, "updateVisibility");
}

- (BOOL)expandedRepControllerHasRoomForPanels
{
  return -[THWAdornmentController hasRoomForPanels](self->_adornmentController, "hasRoomForPanels");
}

- (double)expandedHeightForPanel:(int)a3 allowDefault:(BOOL)a4
{
  THWAdornmentController *adornmentController;
  double result;

  adornmentController = self->_adornmentController;
  if (adornmentController)
  {
    -[THWAdornmentController heightForPanel:allowDefault:](adornmentController, "heightForPanel:allowDefault:", *(_QWORD *)&a3, a4);
  }
  else
  {
    result = 44.0;
    if (a3 >= 3 || !a4)
      return 0.0;
  }
  return result;
}

- (void)presentRepExpanded:(id)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController presentRepExpanded:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1635, CFSTR("Main canvas widget host should handle this."));
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  return 0;
}

- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"),
      1647,
      CFSTR("This operation must only be performed on the main thread."));
}

- (BOOL)inFlowMode
{
  return -[THWExpandedViewControllerDelegate inFlowMode](-[THWiOSExpandedViewController delegate](self, "delegate"), "inFlowMode");
}

- (CGSize)widgetHostExpandedSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  return 1;
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  return 0;
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  return 1;
}

- (id)hostCanvasLayer
{
  return objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWiOSExpandedViewController icc](self, "icc"), "layerHost"), "canvasLayer");
}

- (void)p_setOnCanvasRepShadowLayerHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWFreeTransformableRep, -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"));
  if ((objc_opt_respondsToSelector(v4, "styledRep") & 1) != 0)
  {
    v5 = objc_msgSend(v4, "styledRep");
    objc_msgSend(objc_msgSend(v5, "shadowLayer"), "setHidden:", v3);
    objc_msgSend(objc_msgSend(v5, "reflectionLayer"), "setHidden:", v3);
  }
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWFreeTransformableRep, -[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep", a3));
  if (v4)
    objc_msgSend(v4, "rectForCompletion");
  else
    objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "layout"), "frameInParent");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  _QWORD v5[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread", a3, a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWiOSExpandedViewController freeTransformDidBeginWithRep:expandableRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Drawables/THWiOSExpandedViewController.m"), 1722, CFSTR("This operation must only be performed on the main thread."));
  self->mControlsVisibleBeforeTransform = -[THWAdornmentController adornmentsVisible](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "adornmentsVisible");
  self->_freeTransformWasCancelled = 0;
  -[THWiOSExpandedViewController setFreeTransformInFlight:](self, "setFreeTransformInFlight:", 1);
  -[THWAdornmentController setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setAdornmentsVisible:buttonVisible:controlsVisible:forceVisibility:animated:completionBlock:", 0, 0, 0, 1, 1, 0);
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "targetLayer"), "setHidden:", 1);
  objc_msgSend(-[THWiOSExpandedViewController view](self, "view"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1323AC;
  v5[3] = &unk_426DD0;
  v5[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.5);
  -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 1);
  -[THWExpandedViewControllerDelegate expandedViewControllerWillBeginDismissing:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewControllerWillBeginDismissing:", self);
}

- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5
{
  -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0, a4);
  -[THWiOSExpandedViewController p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:](self, "p_dismissExpandedAnimatedWithCompletionBlock:freeTransformDidEnd:", a5, 1);
}

- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  -[THWiOSExpandedViewController setFreeTransformInFlight:](self, "setFreeTransformInFlight:", 0, a4);
}

- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  -[THWExpandedViewControllerDelegate expandedViewControllerDidCancelDismiss:](-[THWiOSExpandedViewController delegate](self, "delegate", a3, a4), "expandedViewControllerDidCancelDismiss:", self);
  self->_freeTransformWasCancelled = 1;
  -[THWiOSExpandedViewController p_updateBackgroundColor](self, "p_updateBackgroundColor");
  if (self->mControlsVisibleBeforeTransform)
    -[THWAdornmentController setAdornmentsVisible:animated:completionBlock:](-[THWiOSExpandedViewController adornmentController](self, "adornmentController"), "setAdornmentsVisible:animated:completionBlock:", 1, 1, 0);
  objc_msgSend(objc_msgSend(-[THWiOSExpandedViewController expandedRepSourceRep](self, "expandedRepSourceRep"), "targetLayer"), "setHidden:", 0);
  -[THWiOSExpandedViewController p_setWantsStatusBarVisible:](self, "p_setWantsStatusBarVisible:", 0);
  -[THWiOSExpandedViewController p_setOnCanvasRepShadowLayerHidden:](self, "p_setOnCanvasRepShadowLayerHidden:", 0);
}

- (void)freeTransformWillFadeOutCurtain:(id)a3 expandableRep:(id)a4
{
  uint64_t v5;

  if (self->_freeTransformWasCancelled)
    v5 = 0;
  else
    v5 = -[THWiOSExpandedViewController im_isCompactHeight](self, "im_isCompactHeight", a3, a4) ^ 1;
  -[THWiOSExpandedViewController p_setWantsStatusBarVisible:](self, "p_setWantsStatusBarVisible:", v5, a4);
  if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedBackgroundColor") & 1) != 0)-[UIScrollView setBackgroundColor:](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
}

- (void)handleCloseForAdornmentController:(id)a3
{
  -[THWiOSExpandedViewController dismiss](self, "dismiss", a3);
}

- (BOOL)adornmentController:(id)a3 allowWindowMoveForPanel:(int)a4
{
  return a4 == 0;
}

- (unint64_t)widgetInteractionModeForRep:(id)a3
{
  return 1;
}

- (void)progressDidChangeForRep:(id)a3 percent:(id)a4
{
  void *v6;

  v6 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, -[THWiOSExpandedViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v6, "interactiveCanvasController:progressDidChangeForRep:percent:") & 1) != 0)
    objc_msgSend(v6, "interactiveCanvasController:progressDidChangeForRep:percent:", 0, a3, a4);
}

- (void)scoreDidChangeForRep:(id)a3 score:(id)a4 total:(id)a5
{
  void *v8;

  v8 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, -[THWiOSExpandedViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v8, "interactiveCanvasController:scoreDidChangeForRep:score:total:") & 1) != 0)
    objc_msgSend(v8, "interactiveCanvasController:scoreDidChangeForRep:score:total:", 0, a3, a4, a5);
}

- (void)resetAttemptForRep:(id)a3
{
  void *v4;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THInteractiveCanvasControllerDelegate, -[THWiOSExpandedViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "interactiveCanvasController:resetAttemptForRep:") & 1) != 0)
    objc_msgSend(v4, "interactiveCanvasController:resetAttemptForRep:", 0, a3);
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewController:actionForHyperlink:inRep:gesture:") & 1) != 0)return -[THWExpandedViewControllerDelegate expandedViewController:actionForHyperlink:inRep:gesture:](-[THWiOSExpandedViewController delegate](self, "delegate"), "expandedViewController:actionForHyperlink:inRep:gesture:", self, a3, a4, a5);
  else
    return 0;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  THWExpandedRep *v6;
  THWExpandedRep *v7;

  v6 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep", a3);
  if (a4)
  {
    v7 = v6;
    if ((objc_opt_respondsToSelector(v6, "expandedShouldDismissOnChangeFromSizeClassPairWithController:flowMode:") & 1) != 0)
    {
      if (-[THWExpandedRep expandedShouldDismissOnChangeFromSizeClassPairWithController:flowMode:](v7, "expandedShouldDismissOnChangeFromSizeClassPairWithController:flowMode:", self, -[THWiOSExpandedViewController inFlowMode](self, "inFlowMode")))-[THWiOSExpandedViewController dismissExpandedImmediate](self, "dismissExpandedImmediate");
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewController;
  -[THWiOSExpandedViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[THWiOSExpandedViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)p_addKeyCommands
{
  THWExpandedRep *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  char **v7;

  v3 = -[THWiOSExpandedViewController expandedRep](self, "expandedRep");
  v4 = TSUProtocolCast(&OBJC_PROTOCOL___THWNavigationHandlerProtocol, v3);
  v5 = TSUProtocolCast(&OBJC_PROTOCOL___THWMediaTransportProtocol, v3);
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputEscape, 0, "p_handleEscapeKey:"));
  if (!v4)
  {
    if (!v5)
      return;
    v6 = CFSTR(" ");
    v7 = &selRef_p_handleMediaTransportKey_;
    goto LABEL_9;
  }
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR(" "), 0x20000, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputLeftArrow, 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", UIKeyInputRightArrow, 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\n"), 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0, "p_handleNavigationKey:"));
  -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\t"), 0x20000, "p_handleNavigationKey:"));
  if ((objc_opt_respondsToSelector(v4, "handleNavigateCommandWithNumber:") & 1) != 0)
  {
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("0"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("1"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("2"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("3"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("4"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("5"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("6"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("7"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("8"), 0, "p_handleNumber:"));
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("9"), 0, "p_handleNumber:"));
  }
  if ((objc_opt_respondsToSelector(v3, "expandedContentAllowPinchZoom") & 1) != 0
    && -[THWExpandedRep expandedContentAllowPinchZoom](v3, "expandedContentAllowPinchZoom"))
  {
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("+"), 0, "p_handleZoomInKey:"));
    v6 = CFSTR("-");
    v7 = &selRef_p_handleZoomOutKey_;
LABEL_9:
    -[THWiOSExpandedViewController addKeyCommand:](self, "addKeyCommand:", +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v6, 0, *v7));
  }
}

- (void)p_handleEscapeKey:(id)a3
{
  -[THWiOSExpandedViewController dismiss](self, "dismiss", a3);
}

- (void)p_handleNavigationKey:(id)a3
{
  void *v4;
  NSString *v5;
  _QWORD v6[3];

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWNavigationHandlerProtocol, -[THWiOSExpandedViewController expandedRep](self, "expandedRep"));
  v6[0] = UIKeyInputRightArrow;
  v6[1] = CFSTR("\r");
  v6[2] = CFSTR("\n");
  if (-[NSArray containsObject:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3), "containsObject:", objc_msgSend(a3, "input")))
  {
    goto LABEL_2;
  }
  v5 = UIKeyInputLeftArrow;
  if (!-[NSArray containsObject:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1), "containsObject:", objc_msgSend(a3, "input")))
  {
    if (!objc_msgSend(&off_469A60, "containsObject:", objc_msgSend(a3, "input")))
      return;
    if ((objc_msgSend(a3, "modifierFlags") & 0x20000) == 0)
    {
LABEL_2:
      objc_msgSend(v4, "handleNavigateNextCommand");
      return;
    }
  }
  objc_msgSend(v4, "handleNavigatePreviousCommand");
}

- (void)p_handleNumber:(id)a3
{
  void *v4;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWNavigationHandlerProtocol, -[THWiOSExpandedViewController expandedRep](self, "expandedRep"));
  if ((objc_opt_respondsToSelector(v4, "handleNavigateCommandWithNumber:") & 1) != 0)
    objc_msgSend(v4, "handleNavigateCommandWithNumber:", objc_msgSend(objc_msgSend(a3, "input"), "integerValue"));
}

- (void)p_handleMediaTransportKey:(id)a3
{
  void *v4;

  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWMediaTransportProtocol, -[THWiOSExpandedViewController expandedRep](self, "expandedRep"));
  if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", CFSTR(" ")))
  {
    objc_msgSend(v4, "handleTransportPlayPauseCommand");
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputRightArrow))
  {
    if (objc_msgSend(a3, "modifierFlags") == &loc_100000)
      objc_msgSend(v4, "handleTransportFastforwardCommand");
    else
      objc_msgSend(v4, "handleTransportNextFrameCommand");
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputLeftArrow))
  {
    if (objc_msgSend(a3, "modifierFlags") == &loc_100000)
      objc_msgSend(v4, "handleTransportRewindCommand");
    else
      objc_msgSend(v4, "handleTransportPreviousFrameCommand");
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputUpArrow))
  {
    objc_msgSend(v4, "handleTransportIncreaseVolumeCommand");
  }
  else if (objc_msgSend(objc_msgSend(a3, "input"), "isEqualToString:", UIKeyInputDownArrow))
  {
    objc_msgSend(v4, "handleTransportDecreaseVolumeCommand");
  }
}

- (void)p_handleZoomInKey:(id)a3
{
  -[THWiOSExpandedViewController zoomInOrOut:](self, "zoomInOrOut:", 1);
}

- (void)p_handleZoomOutKey:(id)a3
{
  -[THWiOSExpandedViewController zoomInOrOut:](self, "zoomInOrOut:", 0);
}

- (void)zoomInOrOut:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v3 = a3;
  -[TSDInteractiveCanvasController viewScale](-[THWiOSExpandedViewController icc](self, "icc"), "viewScale");
  v6 = v5;
  if (v3)
  {
    v7 = objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentMaximumZoomScale");
    v8 = 8.0;
    if ((v7 & 1) != 0)
      -[THWExpandedRep expandedContentMaximumZoomScale](-[THWiOSExpandedViewController expandedRep](self, "expandedRep", 8.0), "expandedContentMaximumZoomScale");
    v9 = v6 * 1.5;
    if (v6 * 1.5 > v8)
      v9 = v8;
  }
  else
  {
    -[THWiOSExpandedViewController originalViewScale](self, "originalViewScale");
    v11 = v10;
    if ((objc_opt_respondsToSelector(-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentMaximumZoomScale") & 1) != 0)
    {
      -[THWExpandedRep expandedContentMinimumZoomScale](-[THWiOSExpandedViewController expandedRep](self, "expandedRep"), "expandedContentMinimumZoomScale");
      v11 = v12;
    }
    if (v6 / 1.5 >= v11)
      v9 = v6 / 1.5;
    else
      v9 = v11;
  }
  if (vabdd_f64(v6, v9) >= 0.00999999978)
    -[THWiOSExpandedViewController p_updateContentOffsetFromCurrentViewScale:toNewViewScale:animated:duration:completion:](self, "p_updateContentOffsetFromCurrentViewScale:toNewViewScale:animated:duration:completion:", 1, 0, v6);
}

- (void)p_updateContentOffsetFromCurrentViewScale:(double)a3 toNewViewScale:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  _BOOL4 v9;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  __n128 v22;
  __n128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  TSDInteractiveCanvasController *v29;
  double v30;
  _QWORD v31[5];
  CGRect v32;
  CGRect v33;

  v9 = a5;
  -[TSDInteractiveCanvasController contentOffset](-[THWiOSExpandedViewController icc](self, "icc"), "contentOffset");
  v14 = v13;
  v16 = v15;
  -[UIScrollView bounds](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "bounds");
  v17 = CGRectGetWidth(v32) * 0.5;
  -[UIScrollView bounds](-[THWiOSExpandedViewController scrollView](self, "scrollView"), "bounds");
  v18 = CGRectGetHeight(v33) * 0.5;
  TSDMultiplyPointScalar(v14, v16, a3);
  v20 = TSDAddPoints(v19);
  v22.n128_f64[0] = TSDMultiplyPointScalar(v20, v21, a4 / a3);
  v24 = TSDSubtractPoints(v22, v23, v17, v18);
  v26 = TSDMultiplyPointScalar(v24, v25, 1.0 / a4);
  v28 = v27;
  v29 = -[THWiOSExpandedViewController icc](self, "icc");
  if (v9)
  {
    if (a6 == 0.0)
      v30 = 0.3;
    else
      v30 = a6;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_133104;
    v31[3] = &unk_427CC0;
    v31[4] = a7;
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animationDuration:completion:](v29, "setViewScale:contentOffset:clampOffset:animationDuration:completion:", 1, v31, a4, v26, v28, v30);
  }
  else
  {
    -[TSDInteractiveCanvasController setViewScale:contentOffset:clampOffset:animated:](v29, "setViewScale:contentOffset:clampOffset:animated:", 0, 0, a4, v26, v28);
    if (a7)
      (*((void (**)(id))a7 + 2))(a7);
  }
}

- (THWExpandedViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWExpandedViewControllerDelegate *)a3;
}

- (THDocumentRoot)documentRoot
{
  return self->mDocumentRoot;
}

- (void)setDocumentRoot:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSDInteractiveCanvasController)icc
{
  return self->_icc;
}

- (void)setIcc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSDiOSCanvasViewController)cvc
{
  return self->_cvc;
}

- (void)setCvc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (THWAdornmentController)adornmentController
{
  return self->_adornmentController;
}

- (void)setAdornmentController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (TSDInfo)drawableToPresent
{
  return self->_drawableToPresent;
}

- (void)setDrawableToPresent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (double)originalViewScale
{
  return self->_originalViewScale;
}

- (void)setOriginalViewScale:(double)a3
{
  self->_originalViewScale = a3;
}

- (CALayer)rotationScrim
{
  return self->_rotationScrim;
}

- (void)setRotationScrim:(id)a3
{
  self->_rotationScrim = (CALayer *)a3;
}

- (BOOL)allowZoom
{
  return self->_allowZoom;
}

- (void)setAllowZoom:(BOOL)a3
{
  self->_allowZoom = a3;
}

- (THWFreeTransformGestureRecognizer)transformGR
{
  return self->_transformGR;
}

- (void)setTransformGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 104);
}

- (THWFreeTransformController)ftc
{
  return self->_ftc;
}

- (void)setFtc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

- (CGRect)preRotateViewFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preRotateViewFrame.origin.x;
  y = self->_preRotateViewFrame.origin.y;
  width = self->_preRotateViewFrame.size.width;
  height = self->_preRotateViewFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreRotateViewFrame:(CGRect)a3
{
  self->_preRotateViewFrame = a3;
}

- (THWExpandedTransitionRotationAnimationController)expandedRotationAnimationController
{
  return self->_expandedRotationAnimationController;
}

- (void)setExpandedRotationAnimationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (BOOL)disablePanelAnimation
{
  return self->_disablePanelAnimation;
}

- (void)setDisablePanelAnimation:(BOOL)a3
{
  self->_disablePanelAnimation = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (BOOL)wantsStatusBarVisible
{
  return self->_wantsStatusBarVisible;
}

- (void)setWantsStatusBarVisible:(BOOL)a3
{
  self->_wantsStatusBarVisible = a3;
}

- (int)expandedRepControllerState
{
  return self->_expandedRepControllerState;
}

- (void)setExpandedRepControllerState:(int)a3
{
  self->_expandedRepControllerState = a3;
}

- (BOOL)wasTornDown
{
  return self->_wasTornDown;
}

- (void)setWasTornDown:(BOOL)a3
{
  self->_wasTornDown = a3;
}

- (BOOL)freeTransformWasCancelled
{
  return self->_freeTransformWasCancelled;
}

- (void)setFreeTransformWasCancelled:(BOOL)a3
{
  self->_freeTransformWasCancelled = a3;
}

- (BOOL)freeTransformInFlight
{
  return self->_freeTransformInFlight;
}

- (void)setFreeTransformInFlight:(BOOL)a3
{
  self->_freeTransformInFlight = a3;
}

@end
