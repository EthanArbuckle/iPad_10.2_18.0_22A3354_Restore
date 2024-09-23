@implementation THDocumentViewController

- (THDocumentViewController)initWithDefaultView
{
  THDocumentViewController *v2;
  THDocumentViewController *v3;
  CGSize size;
  NSUserDefaults *v5;
  id v6;

  v2 = -[THDocumentViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", CFSTR("THDocumentViewController"), THBundle());
  v3 = v2;
  if (v2)
  {
    -[THDocumentViewController setEdgesForExtendedLayout:](v2, "setEdgesForExtendedLayout:", 15);
    -[THDocumentViewController setExtendedLayoutIncludesOpaqueBars:](v3, "setExtendedLayoutIncludesOpaqueBars:", 1);
    -[THDocumentViewController setVisibleRelativePageRange:](v3, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
    -[THDocumentViewController setAllowPortraitTOC:](v3, "setAllowPortraitTOC:", 1);
    v3->mOverscrollViewChapterNumber = 0x7FFFFFFFFFFFFFFFLL;
    size = CGRectNull.size;
    v3->mScrollTargetRect.origin = CGRectNull.origin;
    v3->mScrollTargetRect.size = size;
    -[THDocumentViewController setFirstLoad:](v3, "setFirstLoad:", 1);
    -[THDocumentViewController setFlowSizeScale:](v3, "setFlowSizeScale:", objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"));
    -[THDocumentViewController setFtc:](v3, "setFtc:", objc_alloc_init(THWFreeTransformController));
    v3->mLastAbsolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[THDocumentViewController setStatusBarHeightForOrientation:](v3, "setStatusBarHeightForOrientation:", +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
    -[THDocumentViewController setShowFlowModeIfAvailable:](v3, "setShowFlowModeIfAvailable:", 0);
    v5 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
    v6 = -[NSUserDefaults objectForKey:](v5, "objectForKey:", THDocumentLayoutKey);
    if (v6 && objc_msgSend(v6, "intValue") >= 2)
      -[THDocumentViewController setShowFlowModeIfAvailable:](v3, "setShowFlowModeIfAvailable:", 1);
    v3->_accessLock._os_unfair_lock_opaque = 0;
    v3->_displaySleepController = (BCDisplaySleepController *)objc_alloc_init((Class)BCDisplaySleepController);
    -[THDocumentViewController p_setDefaultScrubberCalloutFollowsThumbState](v3, "p_setDefaultScrubberCalloutFollowsThumbState");
    -[THDocumentViewController registerForTraitChanges:withAction:](v3, "registerForTraitChanges:withAction:", +[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"), "_traitCollectionDidChange:previousTraitCollection:");
  }
  return v3;
}

- (void)dealloc
{
  id mCanvasDidZoomCompletion;
  objc_super v4;

  -[NSNotificationCenter removeObserver:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:", self);
  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  -[THDocumentViewController p_cleanupAfterViewUnload](self, "p_cleanupAfterViewUnload");

  self->mOrientationAnchor = 0;
  self->mDocumentLinkResolver = 0;

  self->mLastPageNumberUpdate = 0;
  mCanvasDidZoomCompletion = self->mCanvasDidZoomCompletion;
  if (mCanvasDidZoomCompletion)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 383, CFSTR("Tearing down despite unfired zoom completion block."));
    mCanvasDidZoomCompletion = self->mCanvasDidZoomCompletion;
  }

  self->mGuidedPanController = 0;
  self->mRevealTOCPanController = 0;
  -[THDocumentNavigator setDelegate:](self->mDocumentNavigator, "setDelegate:", 0);

  self->mDocumentNavigator = 0;
  self->_reflowablePaginationController = 0;
  -[THDocumentViewController setFtc:](self, "setFtc:", 0);

  self->_configuration = 0;
  self->mPageViewDisplacement = 0;

  self->mOverscrollTransitionView = 0;
  self->_lastStorageAnchor = 0;

  self->mPageViewProvider = 0;
  self->_flowSectionController = 0;

  self->_scrubberCallout = 0;
  self->_paginatedSectionController = 0;

  self->_scrubber = 0;
  self->_statusBarHeightForOrientation = 0;
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController dealloc](&v4, "dealloc");
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (void)p_cleanupAfterViewUnload
{
  uint64_t v3;

  self->mTapRecognizer = 0;
  self->mContentPageNumberView = 0;

  self->mNavOverlayPageNumberView = 0;
  self->mNavigationOverlayContainer = 0;
  -[TSWPopoverController setDelegate:](self->mPopUpPopoverController, "setDelegate:", 0);

  self->mPopUpPopoverController = 0;
  -[THWExpandedViewController teardown](self->mExpandedViewController, "teardown");

  self->mExpandedViewController = 0;
  -[THDocumentViewController p_releaseOverscrollViews](self, "p_releaseOverscrollViews");
  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;

  *(_QWORD *)&self->TSADocumentViewController_opaque[v3] = 0;
}

- (double)viewFooterHeight
{
  return 0.0;
}

- (double)viewHeaderHeight
{
  double result;
  unint64_t v4;
  uint64_t v5;
  NSNumber *v6;
  double v7;
  double v8;
  double v9;

  if (-[THDocumentViewController prefersStatusBarHidden](self, "prefersStatusBarHidden"))
    return 0.0;
  v4 = -[THDocumentViewController th_cachedInterfaceOrientation](self, "th_cachedInterfaceOrientation");
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  v6 = (NSNumber *)-[NSMutableDictionary objectForKeyedSubscript:](-[THDocumentViewController statusBarHeightForOrientation](self, "statusBarHeightForOrientation"), "objectForKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  if (!v6)
  {
    objc_msgSend(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"), "safeAreaInsets");
    v8 = v7;
    objc_msgSend(UIApp, "statusBarHeightForOrientation:ignoreHidden:", v5, 1);
    if (v8 > v9)
      v9 = v8;
    v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9);
    -[NSMutableDictionary setObject:forKeyedSubscript:](-[THDocumentViewController statusBarHeightForOrientation](self, "statusBarHeightForOrientation"), "setObject:forKeyedSubscript:", v6, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
  }
  -[NSNumber doubleValue](v6, "doubleValue");
  return result;
}

- (void)p_updatePageNumberViewPositionsForSize:(CGSize)a3
{
  double height;
  double width;
  THPageNumberView *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;

  height = a3.height;
  width = a3.width;
  -[THPageNumberView setMode:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setMode:", -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1);
  v6 = -[THDocumentViewController contentPageNumberView](self, "contentPageNumberView");
  if (-[THDocumentViewController isEpub](self, "isEpub"))
    v7 = -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1;
  else
    v7 = 0;
  -[THPageNumberView setBold:](v6, "setBold:", v7);
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    objc_msgSend(-[THDocumentViewController view](self, "view"), "safeAreaInsets");
    v9 = width + -10.0 - v8;
    objc_msgSend(-[THDocumentViewController view](self, "view"), "safeAreaInsets");
    v11 = height + -10.0 - v10;
  }
  else
  {
    -[THDocumentReflowableLayoutConfiguration pageNumberPosition](-[THDocumentViewController configuration](self, "configuration"), "pageNumberPosition");
    v9 = v12;
    v11 = v13;
  }
  -[THPageNumberView updatePosition:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "updatePosition:", v9, v11);
  -[THPageNumberView setMode:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setMode:", 1);
  -[THPageNumberView setBold:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setBold:", 1);
  v14 = -[THPageNumberView superview](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "superview");
  -[THDocumentReflowableLayoutConfiguration pageNumberPosition](-[THDocumentViewController configuration](self, "configuration"), "pageNumberPosition");
  objc_msgSend(v14, "convertPoint:fromView:", -[THDocumentViewController view](self, "view"), v15, v16);
  -[THPageNumberView updatePosition:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "updatePosition:", v17, v18);
  -[THDocumentViewController p_updatePageNumberViewVisibility](self, "p_updatePageNumberViewVisibility");
}

- (void)p_updatePageNumberViewVisibility
{
  uint64_t v3;

  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    v3 = 0;
  else
    v3 = -[THDocumentViewController isEpub](self, "isEpub") ^ 1;
  -[THPageNumberView setHidden:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setHidden:", v3);
  -[THPageNumberView setHidden:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setHidden:", -[THDocumentViewController isEpub](self, "isEpub") ^ 1);
}

- (void)p_updateNavigationOverlayContainerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[THDocumentReflowableLayoutConfiguration bottomFullWidthToolbarFrame](-[THDocumentViewController configuration](self, "configuration"), "bottomFullWidthToolbarFrame");
  -[UIView setFrame:](-[THDocumentViewController navigationOverlayContainer](self, "navigationOverlayContainer"), "setFrame:", v3, v4, v5, v6);
  -[UIView setHidden:](-[THDocumentViewController navigationOverlayContainer](self, "navigationOverlayContainer"), "setHidden:", -[THDocumentViewController isEpub](self, "isEpub") ^ 1);
}

- (void)loadDocument
{
  THiOSThemeProvider *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  THPageViewProvider *v9;
  id v10;
  THPageViewProvider *v11;
  id v12;
  id v13;
  THReflowablePaginationController *v14;
  objc_super v15;

  if ((-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded") & 1) == 0)
  {
    v15.receiver = self;
    v15.super_class = (Class)THDocumentViewController;
    -[THDocumentViewController loadDocument](&v15, "loadDocument");
    -[THDocumentViewController setFlowSizeScale:](self, "setFlowSizeScale:", objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"));
    -[THDocumentViewController setDocumentNavigator:](self, "setDocumentNavigator:", -[THDocumentNavigator initWithDocumentRoot:interactiveCanvasController:]([THDocumentNavigator alloc], "initWithDocumentRoot:interactiveCanvasController:", -[THDocumentViewController documentRoot](self, "documentRoot"), -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController")));
    -[THDocumentNavigator setDelegate:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setDelegate:", self);
    if (-[THDocumentViewController isEpub](self, "isEpub"))
    {
      v3 = objc_alloc_init(THiOSThemeProvider);
      v5 = objc_opt_class(IMThemePage, v4);
      -[THiOSThemeProvider updateWithTheme:traitCollection:](v3, "updateWithTheme:traitCollection:", TSUDynamicCast(v5, -[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme")), -[THDocumentViewController traitCollection](self, "traitCollection"));
      objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "setThemeProvider:", v3);

    }
    if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType"))
    {
      v6 = +[THPagePositionController paginatedPositionerWithDelegate:](THPagePositionController, "paginatedPositionerWithDelegate:", self);
      v7 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType");
      objc_msgSend(v7, "setPageSizeDelegate:", self);
      v8 = objc_msgSend(v7, "copyFixingSize");
      self->_paginatedSectionController = -[THSectionController initWithDelegate:pagePositionController:presentationType:]([THSectionController alloc], "initWithDelegate:pagePositionController:presentationType:", self, v6, v8);

      v9 = [THPageViewProvider alloc];
      v10 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
      -[THDocumentViewController paginatedPageSize](self, "paginatedPageSize");
      v11 = -[THPageViewProvider initWithInteractiveCanvasController:pageSize:](v9, "initWithInteractiveCanvasController:pageSize:", v10);
      self->mPageViewProvider = v11;
      -[THPageViewProvider setDelegate:](v11, "setDelegate:", self);
      -[THPageViewProvider setPreviewEnabled:](self->mPageViewProvider, "setPreviewEnabled:", -[THDocumentViewController isEpub](self, "isEpub") ^ 1);
    }
    if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType"))
    {
      v12 = +[THPagePositionController flowPositionerWithDelegate:](THPagePositionController, "flowPositionerWithDelegate:", self);
      v13 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType");
      objc_msgSend(v13, "setPageSizeDelegate:", self);
      self->_flowSectionController = (THSectionController *)-[THFlowSectionController initWithDelegate:pagePositionController:presentationType:]([THFlowSectionController alloc], "initWithDelegate:pagePositionController:presentationType:", self, v12, v13);
    }
    self->mHaveDisplayedCorruptBookAlert = 0;
    -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
    -[THDocumentViewController setPagePaddingOptions:](self, "setPagePaddingOptions:", 0);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setAllowLayoutAndRenderOnThread:", 1);
    -[THDocumentViewController p_setActiveSectionControllerDeferVantageDidChange:](self, "p_setActiveSectionControllerDeferVantageDidChange:", 0);
    -[THDocumentViewController p_setupPageNumberViews](self, "p_setupPageNumberViews");
    -[THDocumentViewController p_setupNavOverlayContainer](self, "p_setupNavOverlayContainer");
    if (-[THDocumentViewController isEpub](self, "isEpub")
      && -[THDocumentViewController flowSectionController](self, "flowSectionController"))
    {
      if (-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
      {

        v14 = -[THReflowablePaginationController initWithDocumentRoot:sourcePresentationType:targetPresentationType:loadCache:observer:]([THReflowablePaginationController alloc], "initWithDocumentRoot:sourcePresentationType:targetPresentationType:loadCache:observer:", -[THDocumentViewController documentRoot](self, "documentRoot"), -[THSectionController presentationType](-[THDocumentViewController flowSectionController](self, "flowSectionController"), "presentationType"), -[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "presentationType"), 1, self);
        self->_reflowablePaginationController = v14;
        -[THSectionController setReflowablePaginationController:](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "setReflowablePaginationController:", v14);
        objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "setReflowablePaginationController:", self->_reflowablePaginationController);
        -[THReflowablePaginationController assignContentNodes](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "assignContentNodes");
        -[THDocumentLinkResolver invalidatePaginationResults](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "invalidatePaginationResults");
        objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "invalidatePaginationResults");
        -[THReflowablePaginationController paginate](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginate");
      }
    }
    -[THDocumentViewController p_buildContextTree](self, "p_buildContextTree");
  }
}

- (void)ensureDocumentIsLoaded
{
  if ((-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded") & 1) == 0)
    -[THDocumentViewController loadDocument](self, "loadDocument");
}

- (void)unloadDocument
{
  objc_super v3;

  -[THReflowablePaginationController willClose](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "willClose");
  -[THDocumentViewController p_localteardown](self, "p_localteardown");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setAllowLayoutAndRenderOnThread:", 0);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", +[NSArray array](NSArray, "array"));
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
  -[THSectionController teardown](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "teardown");
  -[THDocumentViewController setPaginatedSectionController:](self, "setPaginatedSectionController:", 0);
  -[THSectionController teardown](-[THDocumentViewController flowSectionController](self, "flowSectionController"), "teardown");
  -[THDocumentViewController setFlowSectionController:](self, "setFlowSectionController:", 0);
  -[THDocumentViewController setActiveSectionController:](self, "setActiveSectionController:", 0);
  -[THDocumentViewController setDocumentLinkResolver:](self, "setDocumentLinkResolver:", 0);
  -[THDocumentViewController setDocumentNavigator:](self, "setDocumentNavigator:", 0);
  -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 0);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "teardown");
  objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "teardown");
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController unloadDocument](&v3, "unloadDocument");
  objc_msgSend(+[TSDFrameImageCache sharedFrameImageCache](TSDFrameImageCache, "sharedFrameImageCache"), "didCloseDocument");
  -[THDocumentViewController p_localteardownSecondStage](self, "p_localteardownSecondStage");
}

- (void)p_localteardown
{
  uint64_t v3;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setDelegate:", 0);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "removeFromSuperview");
  -[BKScrubberControl removeTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  -[BKScrubberControl removeFromSuperview](-[THDocumentViewController scrubber](self, "scrubber"), "removeFromSuperview");

  self->_scrubber = 0;
  -[BKScrubberCalloutView removeFromSuperview](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "removeFromSuperview");

  self->_scrubberCallout = 0;
  -[THDocumentViewController setDocumentLinkResolver:](self, "setDocumentLinkResolver:", 0);
  objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "teardown");
  objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "setReflowablePaginationController:", 0);
  -[THReflowablePaginationController unregisterObserver:](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "unregisterObserver:", self);
  -[THReflowablePaginationController teardown](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "teardown");
  -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
}

- (void)p_localteardownSecondStage
{
  -[THPageViewProvider teardown](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "teardown");

  self->mPageViewProvider = 0;
  self->mPageViewDisplacement = 0;
  -[THWAutoplayController teardown](self->mAutoplayController, "teardown");

  self->mAutoplayController = 0;
}

- (void)teardown
{
  objc_super v3;

  -[THDocumentViewController p_localteardown](self, "p_localteardown");
  -[THDocumentViewController p_localteardownSecondStage](self, "p_localteardownSecondStage");
  v3.receiver = self;
  v3.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController teardown](&v3, "teardown");
}

- (void)p_updateScrollViewDecelerationRate
{
  unsigned int v3;
  const UIScrollViewDecelerationRate *v4;

  v3 = -[THDocumentViewController inFlowMode](self, "inFlowMode");
  v4 = &UIScrollViewDecelerationRateFast;
  if (!v3)
    v4 = &UIScrollViewDecelerationRateNormal;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setDecelerationRate:", *v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", v4, v5);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", v6, v7);
  -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
  -[THDocumentViewController p_updateBookmarkAffordances](self, "p_updateBookmarkAffordances");
  -[BCDisplaySleepController userInteractionOccurred](-[THDocumentViewController displaySleepController](self, "displaySleepController"), "userInteractionOccurred");
  -[THDocumentViewController p_updateScrollViewDecelerationRate](self, "p_updateScrollViewDecelerationRate");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  if ((objc_msgSend(-[THDocumentViewController presentedViewController](self, "presentedViewController"), "bc_isModelTransitioning") & 1) == 0)-[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  THDocumentViewController *v3;
  objc_super v4;

  v3 = self;
  v4.receiver = self;
  v4.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](v3, "interactiveCanvasController"), "resumeEditing");
  -[THDocumentViewController setPagePaddingOptions:](v3, "setPagePaddingOptions:", 3);
  if (-[THDocumentViewController canvasViewController](v3, "canvasViewController"))
    v3 = (THDocumentViewController *)-[THDocumentViewController canvasViewController](v3, "canvasViewController");
  -[THDocumentViewController becomeFirstResponder](v3, "becomeFirstResponder");
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  if (a3)
  {
    -[THDocumentReflowableLayoutConfiguration scrubberFrame](-[THDocumentViewController configuration](self, "configuration"), "scrubberFrame");
    -[BKScrubberControl setFrame:](-[THDocumentViewController scrubber](self, "scrubber"), "setFrame:", v6, v7, v8, v9);
  }
  -[BCDisplaySleepController setWindow:](-[THDocumentViewController displaySleepController](self, "displaySleepController"), "setWindow:", a3);
}

- (void)viewDidLoad
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BKScrubberControl *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  UITapGestureRecognizer *v12;
  THGuidedPanController *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewDidLoad](&v18, "viewDidLoad");
  os_unfair_lock_lock(&self->_accessLock);
  self->_th_cachedInterfaceOrientation = (int64_t)objc_msgSend(UIApp, "activeInterfaceOrientation");
  os_unfair_lock_unlock(&self->_accessLock);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "setAutoresizingMask:", 18);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "setAutoresizesSubviews:", 0);
  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setAlwaysBounceHorizontal:", 0);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setAlwaysBounceVertical:", 0);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setDirectionalLockEnabled:", 1);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1);
  v5 = objc_opt_class(THScrollView, v4);
  v6 = (void *)TSUDynamicCast(v5, *(_QWORD *)&self->TSADocumentViewController_opaque[v3]);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setPreventChildInducedBounce:", 1);
    objc_msgSend(v7, "setPreventBounceAnimation:", 1);
  }
  if (-[THDocumentViewController useScrubber](self, "useScrubber"))
  {
    v8 = (BKScrubberControl *)objc_msgSend(objc_alloc((Class)BKScrubberControl), "initWithFrame:style:", -[THDocumentReflowableLayoutConfiguration scrubberStyle](-[THDocumentViewController configuration](self, "configuration"), "scrubberStyle"), CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    self->_scrubber = v8;
    -[BKScrubberControl setBkAccessibilityDelegate:](v8, "setBkAccessibilityDelegate:", self);
    -[BKScrubberControl setAutoresizingMask:](-[THDocumentViewController scrubber](self, "scrubber"), "setAutoresizingMask:", 2);
    -[BKScrubberControl addTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "addTarget:action:forControlEvents:", self, "scrub:", 192);
    -[BKScrubberControl addTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "addTarget:action:forControlEvents:", self, "scrubValueChanged:", 4096);
    -[BKScrubberControl addTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "addTarget:action:forControlEvents:", self, "scrubberTouchDown:", 1);
    -[BKScrubberControl addTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "addTarget:action:forControlEvents:", self, "scrubberTouch:forEvent:", 4095);
    -[BKScrubberControl addTarget:action:forControlEvents:](-[THDocumentViewController scrubber](self, "scrubber"), "addTarget:action:forControlEvents:", self, "scrubEnded:", 448);
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    {
      -[BKScrubberControl setHidden:](-[THDocumentViewController scrubber](self, "scrubber"), "setHidden:", 1);
      -[BKScrubberControl setEnabled:](-[THDocumentViewController scrubber](self, "scrubber"), "setEnabled:", 0);
    }
    objc_msgSend(-[THDocumentViewController view](self, "view"), "addSubview:", -[THDocumentViewController scrubber](self, "scrubber"));
    self->_scrubberCallout = (BKScrubberCalloutView *)objc_msgSend(objc_alloc((Class)BKScrubberCalloutView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[BKScrubberCalloutView setUsesMonospacedDigitFontForSubtitle:](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "setUsesMonospacedDigitFontForSubtitle:", 1);
    -[THDocumentViewController setScrubberCalloutWidth:](self, "setScrubberCalloutWidth:", 0.0);
    v10 = objc_opt_class(IMThemePage, v9);
    v11 = (void *)TSUDynamicCast(v10, -[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"));
    if (v11)
      -[BKScrubberCalloutView setBackgroundColor:](self->_scrubberCallout, "setBackgroundColor:", objc_msgSend(v11, "HUDBackgroundColor"));
    -[BKScrubberCalloutView addToViewController:](self->_scrubberCallout, "addToViewController:", self);
  }
  v12 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "tapGesture:");
  self->mTapRecognizer = v12;
  -[UITapGestureRecognizer setDelegate:](v12, "setDelegate:", self);
  -[UITapGestureRecognizer setCancelsTouchesInView:](self->mTapRecognizer, "setCancelsTouchesInView:", 0);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "addGestureRecognizer:", self->mTapRecognizer);
  self->mPageViewDisplacement = -[THPageViewDisplacement initWithView:scrollView:]([THPageViewDisplacement alloc], "initWithView:scrollView:", -[THDocumentViewController view](self, "view"), *(_QWORD *)&self->TSADocumentViewController_opaque[v3]);
  v13 = -[THGuidedPanController initWithInteractiveCanvasController:]([THGuidedPanController alloc], "initWithInteractiveCanvasController:", -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"));
  self->mGuidedPanController = v13;
  -[THGuidedPanController setDelegate:](v13, "setDelegate:", self);
  if (!-[THDocumentViewController isEpub](self, "isEpub"))
    self->mRevealTOCPanController = -[THRevealTOCPanController initWithDelegate:interactiveCanvasController:]([THRevealTOCPanController alloc], "initWithDelegate:interactiveCanvasController:", -[THDocumentViewController revealTOCDelegate](self, "revealTOCDelegate"), -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"));
  v14 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
  v15 = objc_msgSend(v14, "gestureRecognizerWithKind:", TSWPImmediatePress);
  objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "gestureDispatcher"), "allowSimultaneousRecognitionByRecognizers:", v15, objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "panGestureRecognizer"), 0);
  objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "asiOSCVC"), "guidedPanGestureRecognizer"), "requireGestureRecognizerToFail:", v15);
  v16 = -[THDocumentViewController canvasViewController](self, "canvasViewController");
  if (v16)
  {
    v17 = v16;
    if (!objc_msgSend(v16, "parentViewController"))
      -[THDocumentViewController addChildViewController:](self, "addChildViewController:", v17);
  }
  self->mAutoplayController = objc_alloc_init(THWAutoplayController);
  -[THWAutoplayController setInteractiveCanvasController:](self->mAutoplayController, "setInteractiveCanvasController:", -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"));
}

- (void)viewWillLayoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewWillLayoutSubviews](&v10, "viewWillLayoutSubviews");
  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  v4 = v3;
  v6 = v5;
  -[THDocumentViewController lastLayoutBoundsSize](self, "lastLayoutBoundsSize");
  if (v8 != v4 || v7 != v6)
  {
    if (objc_msgSend(-[THDocumentViewController view](self, "view"), "window"))
    {
      -[THDocumentViewController adjustContentViewFrame](self, "adjustContentViewFrame");
      -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", v4, v6);
    }
  }
}

- (void)viewDidLayoutSubviews
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewDidLayoutSubviews](&v19, "viewDidLayoutSubviews");
  -[THDocumentViewController p_updateNavigationOverlayContainerFrame](self, "p_updateNavigationOverlayContainerFrame");
  if (-[THDocumentViewController isEpub](self, "isEpub"))
  {
    -[THDocumentViewController p_updatePresentationTypeAnimated:](self, "p_updatePresentationTypeAnimated:", 0);
    -[THDocumentReflowableLayoutConfiguration scrubberFrame](-[THDocumentViewController configuration](self, "configuration"), "scrubberFrame");
    -[BKScrubberControl setFrame:](-[THDocumentViewController scrubber](self, "scrubber"), "setFrame:", v3, v4, v5, v6);
    -[BKScrubberControl setOrientation:](-[THDocumentViewController scrubber](self, "scrubber"), "setOrientation:", -[THDocumentViewController inFlowMode](self, "inFlowMode"));
  }
  else if (!-[THDocumentViewController isTransitioning](self, "isTransitioning"))
  {
    objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
    v8 = v7;
    v10 = v9;
    -[THDocumentViewController lastLayoutSize](self, "lastLayoutSize");
    if (v12 != v8 || v11 != v10)
    {
      -[THDocumentViewController bookViewWillTransitionToSize:](self, "bookViewWillTransitionToSize:", v8, v10);
      -[THDocumentViewController bookViewDidTransitionToSize:](self, "bookViewDidTransitionToSize:", v8, v10);
      -[THDocumentViewController setLastLayoutSize:](self, "setLastLayoutSize:", v8, v10);
      objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "repositionGlossaryIfPopoverAnimated:", 0);
      if (-[THDocumentViewController useScrubber](self, "useScrubber"))
      {
        -[THDocumentReflowableLayoutConfiguration scrubberFrame](-[THDocumentViewController configuration](self, "configuration"), "scrubberFrame");
        -[BKScrubberControl setFrame:](-[THDocumentViewController scrubber](self, "scrubber"), "setFrame:", v13, v14, v15, v16);
      }
    }
  }
  -[THDocumentReflowableLayoutConfiguration scrubberCalloutWidth](-[THDocumentViewController configuration](self, "configuration"), "scrubberCalloutWidth");
  -[THDocumentViewController setScrubberCalloutWidth:](self, "setScrubberCalloutWidth:");
  objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
  -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", v17, v18);
}

- (id)childViewControllerForStatusBarHidden
{
  id result;

  result = -[THDocumentViewController expandedViewController](self, "expandedViewController");
  if (result)
    return -[THDocumentViewController expandedViewController](self, "expandedViewController");
  return result;
}

- (id)childViewControllerForStatusBarStyle
{
  id result;

  result = -[THDocumentViewController expandedViewController](self, "expandedViewController");
  if (result)
    return -[THDocumentViewController expandedViewController](self, "expandedViewController");
  return result;
}

- (int64_t)preferredStatusBarStyle
{
  id v3;
  id v4;

  v3 = objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "contentStatusBarStyle");
  if (!-[THDocumentViewController isEpub](self, "isEpub")
    && -[THPresentationType isFlow](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isFlow")&& -[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden"))
  {
    v3 = &dword_0 + 3;
  }
  if (UIAccessibilityIsInvertColorsEnabled() && -[THDocumentViewController isEpub](self, "isEpub"))
  {
    v4 = objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "themeIdentifier");
    if (v4 == (id)kIMThemeIdentifierWhitePageTheme || v4 == (id)kIMThemeIdentifierSepiaPageTheme)
    {
      return 1;
    }
    else if (v4 == (id)kIMThemeIdentifierGrayPageTheme || v4 == (id)kIMThemeIdentifierNightPageTheme)
    {
      return 3;
    }
  }
  return (int64_t)v3;
}

- (int64_t)overrideUserInterfaceStyle
{
  int64_t result;
  uint64_t v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THDocumentViewController;
  result = -[THDocumentViewController overrideUserInterfaceStyle](&v6, "overrideUserInterfaceStyle");
  if (!result)
  {
    v5 = objc_opt_class(IMThemePage, v4);
    result = TSUDynamicCast(v5, -[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"));
    if (result)
      return (int64_t)objc_msgSend((id)result, "userInterfaceStyle");
  }
  return result;
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  id result;

  result = -[THDocumentViewController expandedViewController](self, "expandedViewController");
  if (result)
    return -[THDocumentViewController expandedViewController](self, "expandedViewController");
  return result;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return -[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden");
}

- (BOOL)shouldAutorotate
{
  return objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") ^ 1;
}

- (BOOL)isPageBookmarked
{
  return -[THUserAnnotationDelegate isPageBookmarkedForDocumentViewController:](-[THDocumentViewController userAnnotationDelegate](self, "userAnnotationDelegate"), "isPageBookmarkedForDocumentViewController:", self);
}

- (void)setPageBookmarked:(BOOL)a3
{
  -[THUserAnnotationDelegate setPageBookmarked:forDocumentViewController:](-[THDocumentViewController userAnnotationDelegate](self, "userAnnotationDelegate"), "setPageBookmarked:forDocumentViewController:", a3, self);
}

- (void)updateForTheme:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  TSWPopUpInfo *v14;
  TSUColor *v15;

  if (-[THDocumentViewController isEpub](self, "isEpub"))
  {
    v6 = objc_opt_class(IMThemePage, v5);
    v7 = (void *)TSUDynamicCast(v6, a3);
    v8 = objc_msgSend(v7, "backgroundColorForTraitEnvironment:", self);
    objc_msgSend(-[THDocumentViewController view](self, "view"), "setBackgroundColor:", v8);
    -[THPageNumberView setPageNumberColor:backgroundColor:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageNumberColor:backgroundColor:", objc_msgSend(v7, "headerTextColor"), v8);
    -[THPageNumberView setPageNumberColor:backgroundColor:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumberColor:backgroundColor:", objc_msgSend(v7, "headerTextColorDimmed"), v8);
    -[THOverscrollImageView setBackgroundColor:](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "setBackgroundColor:", v8);
    -[THOverscrollImageView setBackgroundColor:](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "setBackgroundColor:", v8);
    -[UIView setBackgroundColor:](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "setBackgroundColor:", v8);
    -[UIView setBackgroundColor:](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "setBackgroundColor:", v8);
    v9 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
    objc_msgSend(objc_msgSend(v9, "canvasView"), "setBackgroundColor:", v8);
    objc_msgSend(objc_msgSend(objc_msgSend(v9, "canvasView"), "enclosingScrollView"), "setBackgroundColor:", v8);
    v11 = objc_opt_class(THiOSThemeProvider, v10);
    v12 = (void *)TSUDynamicCast(v11, objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "themeProvider"));
    objc_msgSend(v12, "updateWithTheme:traitCollection:", v7, -[THDocumentViewController traitCollection](self, "traitCollection"));
    v13 = objc_msgSend(v12, "forceThemeColors");
    v14 = -[TSWPopoverController popUpInfo](self->mPopUpPopoverController, "popUpInfo");
    if (v13)
      v15 = +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", v8);
    else
      v15 = 0;
    -[TSWPopUpInfo updateBackgroundColor:](v14, "updateBackgroundColor:", v15);
    -[THDocumentViewController p_updatePageViewHostsWithTheme:](self, "p_updatePageViewHostsWithTheme:", v7);
    -[THWExpandedViewController invalidate](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "invalidate");
    -[THSectionController clearCTCaches](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "clearCTCaches");
    objc_msgSend(v9, "pushThreadedLayoutAndRenderDisabled");
    objc_msgSend(v9, "recreateAllLayoutsAndReps");
    objc_msgSend(v9, "layoutIfNeeded");
    objc_msgSend(v9, "popThreadedLayoutAndRenderDisabled");
    -[THDocumentViewController _updateScrubberTheme:](self, "_updateScrubberTheme:", v7);
  }
}

- (void)_updateScrubberTheme:(id)a3
{
  uint64_t v5;

  if (objc_msgSend(a3, "shouldInvertContent"))
    v5 = 1;
  else
    v5 = 2;
  -[BKScrubberControl setThemeInterfaceStyle:](self->_scrubber, "setThemeInterfaceStyle:", v5);
  objc_msgSend(-[BKScrubberControl track](self->_scrubber, "track"), "setTrackBackgroundColor:", objc_msgSend(a3, "quarternaryTextColor"));
  -[BKScrubberCalloutView setBackgroundColor:](self->_scrubberCallout, "setBackgroundColor:", objc_msgSend(a3, "HUDBackgroundColor"));
}

- (void)p_updatePageViewHostsWithTheme:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_BB3C;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = objc_msgSend(a3, "backgroundColorForTraitEnvironment:", self);
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
}

- (id)foregroundTextColor
{
  return objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "contentTextColor");
}

- (id)backgroundColor
{
  return objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "backgroundColorForTraitEnvironment:", self);
}

- (BOOL)pointIsInLeftMargin:(CGPoint)a3 fromView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "convertPoint:fromView:", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  -[THDocumentViewController p_pageMarginWidth](self, "p_pageMarginWidth");
  if (v6 >= v9)
    return 0;
  -[THToolbarDelegate toolbarHeight](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "toolbarHeight");
  return v8 > v10;
}

- (BOOL)pointIsInRightMargin:(CGPoint)a3 fromView:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "convertPoint:fromView:", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  v10 = v9;
  -[THDocumentViewController p_pageMarginWidth](self, "p_pageMarginWidth");
  if (v6 <= v10 - v11)
    return 0;
  -[THToolbarDelegate toolbarHeight](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "toolbarHeight");
  return v8 > v12;
}

- (void)scrub:(id)a3
{
  char *v4;

  v4 = (char *)objc_msgSend(a3, "pageNumber");
  -[THBookNavigation recordOutgoingMajorNavigationJump](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "recordOutgoingMajorNavigationJump");
  -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setVisibleAbsolutePhysicalPageIndex:", v4 - 1);
  -[THBookNavigation recordCurrentLocationInHistory](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "recordCurrentLocationInHistory");
  -[THBookNavigation updateNavigationAffordances](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "updateNavigationAffordances");
}

- (void)p_updateScrubberCheckToolbarState:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  -[BKScrubberControl setEnabled:](-[THDocumentViewController scrubber](self, "scrubber"), "setEnabled:", 1);
  if (v3)
    -[BKScrubberControl setHidden:](-[THDocumentViewController scrubber](self, "scrubber"), "setHidden:", -[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden"));
}

- (void)scrubValueChanged:(id)a3
{
  -[THDocumentViewController _updateScrubberCalloutForPageNumber:](self, "_updateScrubberCalloutForPageNumber:", -[BKScrubberControl pageNumber](self->_scrubber, "pageNumber", a3));
}

- (void)_updateScrubberCalloutForPageNumber:(int64_t)a3
{
  id v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  if ((unint64_t)(a3 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
  {
    v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForAbsolutePageIndex:", a3 - 1);
    if (v5)
    {
      v6 = (const __CFString *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitContainingContentNode:", v5));
      objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Page %@"), &stru_43D7D8, 0), +[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", a3, 0));
      if (v6)
        v7 = v6;
      else
        v7 = &stru_43D7D8;
      objc_msgSend(-[BKScrubberCalloutView title](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "title"), "setText:", v7);
      objc_msgSend(-[BKScrubberCalloutView subtitle](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "subtitle"), "setText:", v8);

    }
  }
}

- (void)scrubEnded:(id)a3
{
  -[THDocumentViewController setIsScrubbing:](self, "setIsScrubbing:", 0);
}

- (void)p_setDefaultScrubberCalloutFollowsThumbState
{
  -[THDocumentViewController setScrubberCalloutFollowsScrollerThumb:](self, "setScrubberCalloutFollowsScrollerThumb:", 0);
}

- (void)layoutScrubberCallout
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIUserInterfaceLayoutDirection v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double MinY;
  char *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double MaxX;
  double v38;
  double v39;
  CGFloat rect;
  double v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "userInterfaceLayoutDirection");
  -[BKScrubberCalloutView sizeThatFits:](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  v13 = v12;
  v41 = v14;
  -[THDocumentViewController scrubberCalloutWidth](self, "scrubberCalloutWidth");
  if (v15 > 0.0)
  {
    -[THDocumentViewController scrubberCalloutWidth](self, "scrubberCalloutWidth");
    v13 = v16;
  }
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  v17 = CGRectGetMidX(v42) - v13 * 0.5;
  v43.origin.x = v4;
  v43.origin.y = v6;
  v43.size.width = v8;
  v43.size.height = v10;
  MinY = CGRectGetMinY(v43);
  v19 = (char *)-[THDocumentReflowableLayoutConfiguration layout](-[THDocumentViewController configuration](self, "configuration"), "layout");
  if (-[THDocumentViewController scrubberCalloutFollowsScrollerThumb](self, "scrubberCalloutFollowsScrollerThumb"))
  {
    rect = v10;
    v20 = -[THDocumentViewController view](self, "view");
    objc_msgSend(-[BKScrubberControl thumb](self->_scrubber, "thumb"), "frame");
    objc_msgSend(v20, "convertRect:fromView:", objc_msgSend(-[BKScrubberControl thumb](self->_scrubber, "thumb"), "superview"), v21, v22, v23, v24);
    if (v19 == (_BYTE *)&dword_0 + 2)
    {
      v29 = CGRectGetMidY(*(CGRect *)&v25) + v41 * -0.5;
      v44.origin.x = v4;
      v44.origin.y = v6;
      v44.size.width = v8;
      v44.size.height = rect;
      v30 = CGRectGetHeight(v44) + -5.0 - v41;
      if (v30 >= v29)
        v30 = v29;
      if (v30 >= 5.0)
        MinY = v30;
      else
        MinY = 5.0;
    }
    else
    {
      v31 = CGRectGetMidX(*(CGRect *)&v25) - v13 * 0.5;
      v45.origin.x = v4;
      v45.origin.y = v6;
      v45.size.width = v8;
      v45.size.height = rect;
      v32 = CGRectGetWidth(v45) + -5.0 - v13;
      if (v32 >= v31)
        v32 = v31;
      if (v32 >= 5.0)
        v17 = v32;
      else
        v17 = 5.0;
    }
  }
  if (-[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll"))
  {
    if (-[THDocumentViewController scrubberCalloutFollowsScrollerThumb](self, "scrubberCalloutFollowsScrollerThumb"))
    {
      -[BKScrubberControl frame](self->_scrubber, "frame");
      if (v11 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v33);
        v38 = 12.0;
      }
      else
      {
        MaxX = CGRectGetMinX(*(CGRect *)&v33) - v13;
        v38 = -12.0;
      }
      v17 = MaxX + v38;
    }
    else
    {
      if (isPhone())
        v39 = 24.0;
      else
        v39 = 34.0;
      -[THDocumentReflowableLayoutConfiguration bottomRightToolbarFrame](-[THDocumentViewController configuration](self, "configuration"), "bottomRightToolbarFrame");
      MinY = CGRectGetMinY(v47) - v41 + -1.0 - v39;
    }
  }
  else
  {
    -[BKScrubberControl frame](self->_scrubber, "frame");
    MinY = CGRectGetMinY(v46) - v41;
  }
  v48.origin.x = v17;
  v48.origin.y = MinY;
  v48.size.width = v13;
  v48.size.height = v41;
  v49 = CGRectIntegral(v48);
  -[BKScrubberCalloutView setFrame:](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "setFrame:", v49.origin.x, v49.origin.y, v49.size.width, v49.size.height);
}

- (void)scrubberTouchDown:(id)a3
{
  -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate", a3), "userWillInteractInToolbar");
  -[BKScrubberCalloutView setFrame:](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "setFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[THDocumentViewController setIsScrubbing:](self, "setIsScrubbing:", 1);
}

- (void)scrubberTouch:(id)a3 forEvent:(id)a4
{
  -[THDocumentViewController setScrubberCalloutVisible:](self, "setScrubberCalloutVisible:", -[BKScrubberControl isTracking](self->_scrubber, "isTracking", a3, a4));
}

- (BOOL)scrubberCalloutVisible
{
  double v2;

  -[BKScrubberCalloutView alpha](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "alpha");
  return v2 == 1.0;
}

- (void)setScrubberCalloutVisible:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  BKScrubberCalloutView *v7;
  double v8;
  _QWORD v9[5];

  v3 = a3;
  v5 = (double)a3;
  -[BKScrubberCalloutView alpha](-[THDocumentViewController scrubberCallout](self, "scrubberCallout"), "alpha");
  if (v6 != v5)
  {
    v7 = -[THDocumentViewController scrubberCallout](self, "scrubberCallout");
    if (v3)
    {
      -[BKScrubberCalloutView setAlpha:](v7, "setAlpha:", 1.0);
    }
    else
    {
      -[BKScrubberCalloutView alpha](v7, "alpha");
      if (v8 == 1.0)
      {
        -[THToolbarDelegate userDidInteractInToolbar](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "userDidInteractInToolbar");
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_C478;
        v9[3] = &unk_426DD0;
        v9[4] = self;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v9, 0, 0.2, 0.3);
      }
    }
    -[THDocumentViewController _updateScrubberCalloutForPageNumber:](self, "_updateScrubberCalloutForPageNumber:", -[BKScrubberControl pageNumber](self->_scrubber, "pageNumber"));
    -[THDocumentViewController layoutScrubberCallout](self, "layoutScrubberCallout");
  }
  if (v3)
    -[THToolbarDelegate userWillInteractInToolbar](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "userWillInteractInToolbar");
}

- (void)willStartRevealTOC
{
  -[THDocumentViewController setIsRevealingTOC:](self, "setIsRevealingTOC:", 1);
}

- (void)startRevealTOC
{
  THPageViewDisplacement *mPageViewDisplacement;
  _QWORD v4[5];

  -[THDocumentViewController setIsRevealingTOC:](self, "setIsRevealingTOC:", 1);
  -[THOverscrollImageView setHidden:](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "setHidden:", 1);
  -[THOverscrollImageView setHidden:](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "setHidden:", 1);
  mPageViewDisplacement = self->mPageViewDisplacement;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_C53C;
  v4[3] = &unk_426EA0;
  v4[4] = self;
  -[THPageViewDisplacement startRevealTOCWithPageIndex:enumerator:](mPageViewDisplacement, "startRevealTOCWithPageIndex:enumerator:", -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex"), v4);
}

- (void)endRevealTOC
{
  THPageViewDisplacement *mPageViewDisplacement;
  uint64_t v4;
  _QWORD v5[5];

  if (!-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_C714;
    v5[3] = &unk_426EA0;
    v5[4] = self;
    -[THPageViewDisplacement endRevealTOCWithEnumerator:](mPageViewDisplacement, "endRevealTOCWithEnumerator:", v5);
  }
  -[THDocumentViewController setIsRevealingTOC:](self, "setIsRevealingTOC:", 0);
  v4 = -[THDocumentViewController p_canOverscroll](self, "p_canOverscroll") ^ 1;
  -[THOverscrollImageView setHidden:](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "setHidden:", v4);
  -[THOverscrollImageView setHidden:](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "setHidden:", v4);
}

- (void)updateTwoUpForSize:(CGSize)a3
{
  double height;
  double width;
  _BOOL4 isTwoUp;
  BOOL v7;
  uint64_t v8;
  _BOOL8 v9;

  height = a3.height;
  width = a3.width;
  isTwoUp = self->_isTwoUp;
  if (-[THDocumentViewController isEpub](self, "isEpub")
    || !-[THBookPropertiesProvider bookIsPaginatedForPortrait](-[THDocumentViewController bookPropertiesDelegate](self, "bookPropertiesDelegate"), "bookIsPaginatedForPortrait")|| width <= height|| width <= 1024.0|| -[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth")|| -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight"))
  {
    v7 = 0;
    v8 = 1;
  }
  else
  {
    v8 = 0;
    v7 = 1;
  }
  self->_isTwoUp = v7;
  if (isTwoUp)
  {
    -[THDocumentViewController setTransitioningFromTwoUpToOneUp:](self, "setTransitioningFromTwoUpToOneUp:", v8);
    v9 = 0;
  }
  else
  {
    -[THDocumentViewController setTransitioningFromTwoUpToOneUp:](self, "setTransitioningFromTwoUpToOneUp:", 0);
    v9 = self->_isTwoUp;
  }
  -[THDocumentViewController setTransitioningFromOneUpToTwoUp:](self, "setTransitioningFromOneUpToTwoUp:", v9);
}

- (void)changeFontSize:(unint64_t)a3
{
  THSectionController *v5;
  id v6;
  double v7;
  id v8;

  -[THDocumentViewController setFlowSizeScale:](self, "setFlowSizeScale:");
  v5 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
  v6 = -[THSectionController bodyAnchorForCanvasRect:](v5, "bodyAnchorForCanvasRect:");
  objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowFontScaleForFontSize:", a3);
  -[THDocumentReflowableLayoutConfiguration setOverrideFontSize:](-[THDocumentViewController configuration](self, "configuration"), "setOverrideFontSize:", v7);
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode") && !-[THDocumentViewController isEpub](self, "isEpub"))
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "recreateAllLayoutsAndReps");
    -[THSectionController rectForBodyAnchor:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "rectForBodyAnchor:", v6);
    -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
    v8 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v8, "setType:", kCATransitionFade);
    objc_msgSend(v8, "setDuration:", 0.150000006);
    objc_msgSend(objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "layer"), "addAnimation:forKey:", v8, 0);
  }
  else
  {
    -[THDocumentViewController p_updatePresentationTypeAnimated:](self, "p_updatePresentationTypeAnimated:", 1);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;

  if (self->mTapRecognizer != a3)
    return 1;
  v6 = objc_msgSend(a4, "view");
  return v6 == -[THDocumentViewController view](self, "view");
}

- (void)tapGesture:(id)a3
{
  double v5;
  double v6;
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
  double width;
  uint64_t v20;
  CGPoint v21;
  CGRect v22;
  CGRect v23;

  if (self->mTapRecognizer == a3
    && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0&& !self->mOverscrollAnimationInProcess)
  {
    objc_msgSend(a3, "locationInView:", -[THDocumentViewController view](self, "view"));
    v6 = v5;
    v8 = v7;
    objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
    v18 = v17 / 3.0;
    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    v23 = CGRectInset(v22, 0.0, v18);
    width = v23.size.width;
    v21.x = v6;
    v21.y = v8;
    if (CGRectContainsPoint(v23, v21))
      -[THDocumentViewController p_animateToNextPage:](self, "p_animateToNextPage:", v6 >= width * 0.5);
    else
      -[THDocumentViewController toggleToolbar](self, "toggleToolbar", v20);
  }
}

- (BOOL)canGoToPreviousPage
{
  unsigned int v3;

  v3 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "isPagingEnabled");
  if (v3)
    LOBYTE(v3) = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") != 0;
  return v3;
}

- (BOOL)canGoToNextPage
{
  unsigned int v3;
  char *v4;

  v3 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "isPagingEnabled");
  if (v3)
  {
    v4 = (char *)-[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") + 1;
    LOBYTE(v3) = v4 < objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
  }
  return v3;
}

- (void)p_animateToNextPage:(BOOL)a3
{
  unsigned int v5;
  char *v6;
  uint64_t v7;
  char *v8;
  THPageViewDisplacement *mPageViewDisplacement;
  id v10;
  _QWORD v11[5];

  v5 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "isPagingEnabled");
  if (a3)
  {
    if (!v5)
      return;
    v6 = (char *)-[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") + 1;
    if (v6 >= objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount"))return;
    v7 = 1;
  }
  else
  {
    if (!v5 || !-[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex"))
      return;
    v7 = -1;
  }
  v8 = (char *)-[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex") + v7;
  if (v8 != (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 1);
    if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
    {
      mPageViewDisplacement = self->mPageViewDisplacement;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_CDC0;
      v11[3] = &unk_426EA0;
      v11[4] = self;
      -[THPageViewDisplacement animateFadeWithDuration:forPageIndex:enumerator:](mPageViewDisplacement, "animateFadeWithDuration:forPageIndex:enumerator:", v8, v11, 0.2);
    }
    if (v8 == (char *)-1)
    {
      -[THDocumentViewController p_horizontalOverscrollPreviousChapter](self, "p_horizontalOverscrollPreviousChapter");
    }
    else if (v8 == (char *)-[THSectionController pageCount](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "pageCount"))
    {
      -[THDocumentViewController p_horizontalOverscrollNextChapter](self, "p_horizontalOverscrollNextChapter");
    }
    else
    {
      v10 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
      if (a3)
        objc_msgSend(v10, "pageRight");
      else
        objc_msgSend(v10, "pageLeft");
    }
  }
}

- (void)p_updateProgressKitForNewNavigationUnit:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits"), "count"))
  {
    v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "uniqueIdentifierForNavigationUnit:", a3);
    v6 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "parentTitleForNavigationUnit:", a3);
    v7 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID");
    v8 = +[BCProgressKitController sharedController](BCProgressKitController, "sharedController");
    objc_msgSend(v8, "activateChapterForBook:chapterID:title:completion:", v7, v5, v6, 0);
    objc_msgSend(v8, "deactivateCurrentWidgetForBook:completion:", v7, 0);
  }
}

- (void)p_updateProgessKitSectionInCanvasRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  THReadingStatisticsDelegate *v9;
  THPresentationType *v10;
  id v11;
  id v12;
  _QWORD v13[13];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit");
  v9 = -[THDocumentViewController readingStatisticsDelegate](self, "readingStatisticsDelegate");
  if (objc_msgSend(objc_msgSend(v8, "contentNodes"), "count") && v9)
  {
    v10 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
    v11 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
    v12 = +[NSMutableArray array](NSMutableArray, "array");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_D160;
    v13[3] = &unk_426EC8;
    *(double *)&v13[9] = x;
    *(double *)&v13[10] = y;
    *(double *)&v13[11] = width;
    *(double *)&v13[12] = height;
    v13[4] = self;
    v13[5] = v8;
    v13[6] = v10;
    v13[7] = v11;
    v13[8] = v12;
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "accessController"), "performRead:", v13);
    if (objc_msgSend(v12, "count"))
      -[THReadingStatisticsDelegate documentViewController:bodyReps:visibleRectIs:](v9, "documentViewController:bodyReps:visibleRectIs:", self, v12, x, y, width, height);
  }
}

- (void)p_getWidgetIDsForInfo:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  unsigned int v13;
  id v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;

  v7 = objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel");
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID");
  v9 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___BCProgressIdentifying, a3);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, "progressKitID");
    v12 = objc_msgSend(v7, "contentNodeForGUID:", objc_msgSend(v10, "progressKitSectionID"));
  }
  else
  {
    v11 = objc_msgSend(-[THDocumentViewController currentContentNode](self, "currentContentNode"), "nodeUniqueIDForInfo:", a3);
    v13 = -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode");
    v14 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
    if (v13)
      v15 = objc_msgSend(v14, "visibleUnscaledRect");
    else
      v15 = objc_msgSend(v14, "visibleUnscaledRectForContent");
    v16 = TSDRoundedRect(v15);
    v12 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", -[THSectionController relativePageRangeForCanvasRect:pad:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "relativePageRangeForCanvasRect:pad:", 0, v16, v17, v18, v19), -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
    objc_msgSend(v12, "nodeGUID");
  }
  v20 = objc_msgSend(v12, "title");
  v21 = objc_msgSend(v7, "navigationUnitContainingContentNode:", v12);
  (*((void (**)(id, id, id, id, _QWORD, id, id))a4 + 2))(a4, v8, objc_msgSend(v7, "uniqueIdentifierForNavigationUnit:", v21), objc_msgSend(v7, "parentTitleForNavigationUnit:", v21), 0, v20, v11);
}

- (void)p_activateProgressForRep:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_D578;
  v3[3] = &unk_426EF0;
  v3[4] = a3;
  v3[5] = self;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", objc_msgSend(a3, "info"), v3);
}

- (void)p_deactivateProgressForRep:(id)a3
{
  objc_msgSend(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"), "deactivateCurrentWidgetForBook:completion:", objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot", a3), "bookDescription"), "asset"), "assetID"), 0);
}

- (void)p_buildContextTree
{
  id v3;
  id v4;
  NSObject *global_queue;
  _QWORD block[7];

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "asset"), "assetID");
  v4 = +[BCProgressKitController sharedController](BCProgressKitController, "sharedController");
  if (objc_msgSend(v4, "isTrackingAssetID:", v3))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D7D0;
    block[3] = &unk_426F18;
    block[4] = self;
    block[5] = v4;
    block[6] = v3;
    dispatch_async(global_queue, block);
  }
}

- (void)paginationController:(id)a3 paginationResultChanged:(id)a4 forContentNode:(id)a5 paginationProgress:(double)a6 paginationComplete:(BOOL)a7
{
  _BOOL4 v7;

  v7 = a7;
  if (!-[THPresentationType isEqualIncludingSize:](-[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController", a3, a4, a5), "presentationType"), "isEqualIncludingSize:", objc_msgSend(a4, "presentationType")))
  {
    if (!v7)
      return;
    goto LABEL_6;
  }
  -[BKScrubberControl setProgress:](-[THDocumentViewController scrubber](self, "scrubber"), "setProgress:", a6);
  -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 0);
  if (v7)
  {
LABEL_6:
    -[THPaginationStatusDelegate paginationDidComplete](-[THDocumentViewController paginationDelegate](self, "paginationDelegate"), "paginationDidComplete");
    return;
  }
  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    -[BKScrubberControl setHidden:](-[THDocumentViewController scrubber](self, "scrubber"), "setHidden:", 0);
}

- (void)paginationController:(id)a3 paginationCompleteStateChangedTo:(BOOL)a4
{
  _BOOL4 v4;
  dispatch_time_t v6;
  _QWORD block[5];

  v4 = a4;
  if (a4)
  {
    -[THDocumentLinkResolver updatePaginationResults](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver", a3), "updatePaginationResults");
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "updatePaginationResults");
    v6 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_DBA4;
    block[3] = &unk_426DD0;
    block[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  -[THPaginationStatusDelegate documentViewController:didChangePaginationStatus:](-[THDocumentViewController paginationDelegate](self, "paginationDelegate", a3), "documentViewController:didChangePaginationStatus:", self, !v4);
  -[THBookNavigation updateNavigationAffordances](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "updateNavigationAffordances");
}

- (CGSize)pageSizeForPresentationType:(id)a3
{
  double v5;
  double v6;
  THSectionController *v7;
  double v8;
  double v9;
  CGSize result;

  if (-[THDocumentViewController isEpub](self, "isEpub")
    || objc_msgSend(a3, "isFlow")
    && -[THDocumentViewController p_isCompactFlowPresentationForSectionController:](self, "p_isCompactFlowPresentationForSectionController:", -[THDocumentViewController flowSectionController](self, "flowSectionController")))
  {
    -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
  }
  else
  {
    if (objc_msgSend(a3, "isPaginated"))
    {
      v7 = -[THDocumentViewController paginatedSectionController](self, "paginatedSectionController");
    }
    else
    {
      if (!-[THDocumentViewController activeSectionController](self, "activeSectionController"))
      {
        -[THDocumentViewController p_windowOrViewSize](self, "p_windowOrViewSize");
        +[THPagePositionController fixedPageSizeForLandscapeOrientation:](THPagePositionController, "fixedPageSizeForLandscapeOrientation:", v8 > v9);
        goto __THDocumentViewController_pageSizeForPresentationType__;
      }
      v7 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    }
    -[THSectionController pageSize](v7, "pageSize");
  }
__THDocumentViewController_pageSizeForPresentationType__:
  result.height = v6;
  result.width = v5;
  return result;
}

- (unint64_t)fontSizeForPresentationType:(id)a3
{
  if (-[THDocumentViewController isEpub](self, "isEpub", a3))
    return -[THDocumentViewController flowSizeScale](self, "flowSizeScale");
  else
    return 0;
}

- (int64_t)columnCountForPresentationType:(id)a3
{
  if (-[THDocumentViewController isEpub](self, "isEpub", a3))
    return -[THDocumentReflowableLayoutConfiguration columnCount](-[THDocumentViewController configuration](self, "configuration"), "columnCount");
  else
    return 0;
}

- (double)gutterWidthForPresentationType:(id)a3
{
  unsigned int v4;
  double result;
  double v6;
  double v7;
  double v8;

  v4 = -[THDocumentViewController isEpub](self, "isEpub", a3);
  result = 0.0;
  if (v4)
  {
    -[THDocumentReflowableLayoutConfiguration gutterWidth](-[THDocumentViewController configuration](self, "configuration", 0.0), "gutterWidth");
    v7 = v6;
    objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](-[THDocumentViewController configuration](self, "configuration"), "environment"), "safeAreaInsets");
    return v7 + v8;
  }
  return result;
}

- (UIEdgeInsets)contentInsetsForPresentationType:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  THDocumentReflowableLayoutConfiguration *v8;
  id v9;
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
  UIEdgeInsets result;

  v5 = TSDEdgeInsetsZero[0];
  v4 = TSDEdgeInsetsZero[1];
  v6 = TSDEdgeInsetsZero[2];
  v7 = TSDEdgeInsetsZero[3];
  if (-[THDocumentViewController isEpub](self, "isEpub", a3))
  {
    v8 = -[THDocumentViewController configuration](self, "configuration");
    v9 = -[THDocumentReflowableLayoutConfiguration environment](v8, "environment");
    -[THDocumentReflowableLayoutConfiguration contentInsets](v8, "contentInsets");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "safeAreaInsets");
    v22 = UIEdgeInsetsAdd(10, v11, v13, v15, v17, v18, v19, v20, v21);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    objc_msgSend(v9, "safeAreaInsets");
    v33 = UIEdgeInsetsSubtract(5, v22, v24, v26, v28, v29, v30, v31, v32);
    v4 = v34;
    v6 = v35;
    v7 = v36;
    v5 = v33 + 4.0;
  }
  v37 = v5;
  v38 = v4;
  v39 = v6;
  v40 = v7;
  result.right = v40;
  result.bottom = v39;
  result.left = v38;
  result.top = v37;
  return result;
}

- (id)backgroundColorForDragUIPlatter
{
  _QWORD v4[2];

  v4[0] = -[THDocumentViewController traitCollection](self, "traitCollection");
  v4[1] = +[UITraitCollection traitCollectionWithUserInterfaceLevel:](UITraitCollection, "traitCollectionWithUserInterfaceLevel:", 1);
  return objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "backgroundColorForTraitCollection:", +[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 2)));
}

- (BOOL)allowTouchOutsideCanvasView:(id)a3 forGesture:(id)a4
{
  return objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSDGesture, a4), "gestureKind") == (id)TSDFreeTransform;
}

- (BOOL)canvasViewController:(id)a3 enableSwipeGestureWithNumberOfTouches:(unint64_t)a4
{
  return a4 == 1;
}

- (BOOL)shouldAdjustContentFrameWhileRotating
{
  return 0;
}

- (CGSize)paginatedPageSize
{
  double v3;
  double v4;
  CGSize result;

  if (-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
    -[THSectionController pageSize](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "pageSize");
  else
    +[THPagePositionController fixedPageSizeForLandscapeOrientation:](THPagePositionController, "fixedPageSizeForLandscapeOrientation:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "bookDescription"), "bookIsPaginatedForLandscape"));
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)paginatedSpreadSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  unsigned int v7;
  double v8;
  double v9;
  CGSize result;

  -[THDocumentViewController paginatedPageSize](self, "paginatedPageSize");
  v4 = v3;
  v6 = v5;
  v7 = -[THDocumentViewController isTwoUp](self, "isTwoUp");
  v8 = v4 + v4;
  if (!v7)
    v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)p_currentPageSize
{
  double v2;
  double v3;
  CGSize result;

  -[THSectionController pageSize](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "pageSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)p_currentSpreadSize
{
  THSectionController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  unsigned int v8;
  double v9;
  double v10;
  CGSize result;

  if (-[THDocumentViewController activeSectionController](self, "activeSectionController"))
    v3 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
  else
    v3 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
  -[THSectionController pageSize](v3, "pageSize");
  v5 = v4;
  v7 = v6;
  v8 = -[THDocumentViewController isTwoUp](self, "isTwoUp");
  v9 = v5 + v5;
  if (!v8)
    v9 = v5;
  v10 = v7;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGRect)contentFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  objc_super v29;
  CGRect result;

  v29.receiver = self;
  v29.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController contentFrame](&v29, "contentFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController")
    && -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode"))
  {
    v11 = TSDScaleSizeWithinSize(-[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize"));
    v12 = TSDRectWithSize(v11);
    v13 = TSDCenterRectOverRect(v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    v22 = v21;
    v4 = TSDRoundedPointForScale(v20, v13, v15, v21);
    v6 = v23;
    v8 = TSDRoundedSizeForScale(v17, v19, v22);
    v10 = v24;
  }
  v25 = v4;
  v26 = v6;
  v27 = v8;
  v28 = v10;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)preserveScrollViewClipping
{
  return 1;
}

- (void)p_updatePresentationTypeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  THDocumentReflowableLayoutConfiguration *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  THSectionController *v12;
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
  double v28;
  double v29;
  double v30;
  id v31;

  v3 = a3;
  v5 = objc_autoreleasePoolPush();
  -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](self, "configuration"), "invalidate");
  v6 = -[THDocumentViewController configuration](self, "configuration");
  v8 = (void *)objc_opt_class(v6, v7);
  -[THDocumentViewController p_currentPageSize](self, "p_currentPageSize");
  -[THDocumentReflowableLayoutConfiguration setDisableContentSpreadPages:](-[THDocumentViewController configuration](self, "configuration"), "setDisableContentSpreadPages:", objc_msgSend(v8, "spreadPagesAllowedWithViewportSize:fontSizeIndex:", objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowSizeScale"), v9, v10) ^ 1);
  v11 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType"), "copyFixingSize");
  if (-[THDocumentViewController isEpub](self, "isEpub")
    && !-[THPresentationType isEqualIncludingSize:](-[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "presentationType"), "isEqualIncludingSize:", v11))
  {
    if (!-[THDocumentViewController lastStorageAnchor](self, "lastStorageAnchor"))
    {
      v12 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
      -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", -[THSectionController bodyAnchorForCanvasRect:](v12, "bodyAnchorForCanvasRect:"));
    }
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "contentOffset");
    v14 = v13;
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
    if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    {
      -[THDocumentViewController p_clearCanvas](self, "p_clearCanvas");
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
      -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 1);
    }
    -[THDocumentLinkResolver invalidatePaginationResults](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "invalidatePaginationResults");
    objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "searchController"), "invalidatePaginationResults");
    objc_msgSend(v11, "pageSize");
    -[THPageViewProvider setPageSize:](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "setPageSize:", v15, v16);
    -[THReflowablePaginationController setPresentationType:](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "setPresentationType:", v11);
    -[THSectionController setPresentationType:](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "setPresentationType:", v11);
    objc_msgSend(v11, "pageSize");
    v18 = v17;
    objc_msgSend(v11, "pageSize");
    v20 = v19;
    -[THDocumentViewController viewHeaderHeight](self, "viewHeaderHeight");
    -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 0, v18, v20 + v21, 0.0);
    -[THReflowablePaginationController paginate](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginate");
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    {
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "recreateAllLayoutsAndReps");
    }
    else
    {
      -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 0);
      -[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:](self, "p_updateVisibleInfosWithPaddingOptions:force:", -[THDocumentViewController p_activePagePaddingOptions](self, "p_activePagePaddingOptions"), 1);
    }
    -[THSectionController rectForBodyAnchor:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "rectForBodyAnchor:", -[THDocumentViewController lastStorageAnchor](self, "lastStorageAnchor"));
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode")
      && v25 <= 20.0
      && -[THDocumentViewController isEpub](self, "isEpub"))
    {
      v25 = 0.0;
    }
    -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v23, v25, v27, v29);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "contentOffset");
    if (v14 != v30)
      -[THDocumentViewController setJustUpdatedPresentationType:](self, "setJustUpdatedPresentationType:", 1);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
    if (v3)
    {
      v31 = +[CATransition animation](CATransition, "animation");
      objc_msgSend(v31, "setType:", kCATransitionFade);
      objc_msgSend(v31, "setDuration:", 0.15);
      objc_msgSend(objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "layer"), "addAnimation:forKey:", v31, 0);
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (void)p_layoutCanvasForSize:(CGSize)a3 duration:(double)a4 forceBackgroundLayout:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;
  THSectionController *v10;
  THModelNavigableAnchor *v11;
  THModelNavigableAnchor *v12;
  THModelNavigableAnchor *v13;
  id v14;
  THPresentationType *v15;
  id v16;
  uint64_t v17;
  id v18;
  THModelContentNode *v19;
  id v20;
  id v21;
  id v22;
  THModelContentNode *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  _QWORD v41[5];

  v5 = a5;
  height = a3.height;
  width = a3.width;
  self->mDisableContentOffsetClamping = 1;
  v10 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
  if (v10 == -[THDocumentViewController selectedSectionController](self, "selectedSectionController"))
  {
LABEL_28:
    -[THBookNavigation viewsDidResize](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "viewsDidResize");
    self->mDisableContentOffsetClamping = 0;
    return;
  }
  -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 1);
  v11 = -[THDocumentViewController orientationAnchor](self, "orientationAnchor");
  if (v11)
  {
    v12 = v11;
    v13 = v11;
  }
  else
  {
    v12 = -[THDocumentNavigator storageAnchorForCurrentPage](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "storageAnchorForCurrentPage");
  }
  if (a4 <= 0.0)
  {
    v14 = 0;
  }
  else
  {
    v14 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v14, "setType:", kCATransitionFade);
    objc_msgSend(v14, "setDuration:", a4);
  }
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "stopScrolling");
    -[THDocumentViewController p_fixScrollViewToMatchCanvas](self, "p_fixScrollViewToMatchCanvas");
    -[THDocumentViewController p_removeCanvasTransform](self, "p_removeCanvasTransform");
  }
  -[THDocumentViewController p_setActiveSectionControllerDeferVantageDidChange:](self, "p_setActiveSectionControllerDeferVantageDidChange:", a4 > 0.0);
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController"))
  {
    v15 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
    v16 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "context"));
    if (-[THDocumentViewController showingExpandedWidgetView](self, "showingExpandedWidgetView")
      && -[THPresentationType isEqual:](v15, "isEqual:", v16))
    {
      v18 = -[THDocumentViewController p_canvasInfoForExpandedInfo:presentationType:](self, "p_canvasInfoForExpandedInfo:presentationType:", -[THWExpandedViewController expandedInfo](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "expandedInfo"), v15);
      v19 = -[THDocumentViewController p_contentNodeForInfo:presentationType:](self, "p_contentNodeForInfo:presentationType:", v18, v15);
      v20 = -[THModelContentNode relativePageIndexForInfo:forPresentationType:](v19, "relativePageIndexForInfo:forPresentationType:", v18, v15);
      v21 = objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel");
      v22 = v20;
      v23 = v19;
    }
    else
    {
      v24 = objc_opt_class(THModelContentNodeAnchor, v17);
      v25 = TSUDynamicCast(v24, v12);
      v27 = objc_opt_class(THModelStorageAnchor, v26);
      v28 = (void *)TSUDynamicCast(v27, v12);
      v29 = -[THPresentationType isFlow](v15, "isFlow");
      v30 = 0;
      if (v29 && v28)
        v30 = objc_msgSend(v28, "range") == 0;
      if (!v25 && !v30)
      {
        -[THSectionController rectForBodyAnchor:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "rectForBodyAnchor:", v28);
LABEL_22:
        v36 = v31;
        v37 = v32;
        v38 = v33;
        v39 = v34;
        -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 0);
        -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v36, v37, v38, v39);
        -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
        -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
        v40 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
        if (v5)
        {
          objc_msgSend(v40, "popThreadedLayoutAndRenderDisabled");
          objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "forceBackgroundLayout");
        }
        else
        {
          objc_msgSend(v40, "layoutIfNeeded");
          objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
        }
        -[THDocumentViewController p_updateNavigationOverlayContainerFrame](self, "p_updateNavigationOverlayContainerFrame");
        -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", width, height);
        if (a4 > 0.0)
        {
          +[CATransaction begin](CATransaction, "begin");
          +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_E888;
          v41[3] = &unk_426DD0;
          v41[4] = self;
          +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v41);
          objc_msgSend(objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "layer"), "addAnimation:forKey:", v14, 0);
          +[CATransaction commit](CATransaction, "commit");
        }
        -[THDocumentViewController setOrientationAnchor:](self, "setOrientationAnchor:", v12);
        goto LABEL_28;
      }
      v35 = objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel");
      v23 = -[THModelBoundAnchor contentNode](v12, "contentNode");
      v21 = v35;
      v22 = 0;
    }
    -[THSectionController canvasRectForRelativePageIndex:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasRectForRelativePageIndex:", objc_msgSend(v21, "navigationUnitRelativePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", v22, v23, v15));
    goto LABEL_22;
  }
}

- (void)p_setupPageNumberViews
{
  double v3;
  double v4;

  if (-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"))
  {
    if (-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"))
      objc_msgSend(-[THDocumentViewController view](self, "view"), "insertSubview:belowSubview:", -[THDocumentViewController canvasScrollView](self, "canvasScrollView"), -[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"));
  }
  else
  {
    self->mContentPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", CGPointZero.x, CGPointZero.y);
    objc_msgSend(-[THDocumentViewController view](self, "view"), "insertSubview:aboveSubview:", -[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), -[THDocumentViewController canvasScrollView](self, "canvasScrollView"));
  }
  if (!-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"))
    self->mNavOverlayPageNumberView = -[THPageNumberView initWithPosition:]([THPageNumberView alloc], "initWithPosition:", CGPointZero.x, CGPointZero.y);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
  -[THDocumentViewController p_updatePageNumberViewPositionsForSize:](self, "p_updatePageNumberViewPositionsForSize:", v3, v4);
}

- (void)p_setupNavOverlayContainer
{
  if (-[THDocumentViewController navigationOverlayContainer](self, "navigationOverlayContainer"))
  {
    if (!-[THDocumentViewController navigationOverlayContainer](self, "navigationOverlayContainer"))
      goto LABEL_6;
  }
  else
  {
    self->mNavigationOverlayContainer = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  objc_msgSend(-[THDocumentViewController view](self, "view"), "insertSubview:aboveSubview:", -[THDocumentViewController navigationOverlayContainer](self, "navigationOverlayContainer"), -[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"));
LABEL_6:
  -[THDocumentViewController p_updateNavigationOverlayContainerFrame](self, "p_updateNavigationOverlayContainerFrame");
}

- (BOOL)p_updateScrollViewClipsToBounds
{
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;

  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  v4 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "clipsToBounds");
  if (-[THDocumentViewController p_allowsPinchZoom](self, "p_allowsPinchZoom"))
    v5 = 0;
  else
    v5 = -[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement") ^ 1;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setClipsToBounds:", v5);
  return v4 ^ v5;
}

- (CGRect)p_contentFrameFrameForSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  CGFloat v7;
  CGSize size;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;
  double v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double y;
  double v24;
  double v25;
  CGRect v26;
  CGRect remainder;
  CGRect result;

  height = a3.height;
  width = a3.width;
  remainder.origin = CGPointZero;
  remainder.size = a3;
  -[THDocumentViewController viewHeaderHeight](self, "viewHeaderHeight");
  if (v6 > 0.0)
  {
    v7 = v6;
    size = CGRectZero.size;
    v26.origin = CGRectZero.origin;
    v26.size = size;
    x = remainder.origin.x;
    size.width = remainder.origin.y;
    v10 = width;
    v11 = height;
    CGRectDivide(*(CGRect *)((char *)&size - 8), &v26, &remainder, v7, CGRectMinYEdge);
  }
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController")
    && -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode"))
  {
    v12 = TSDScaleSizeWithinSize(-[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize"));
    v13 = TSDRectWithSize(v12);
    remainder.origin.x = TSDCenterRectOverRect(v13);
    remainder.origin.y = v14;
    remainder.size.width = v15;
    remainder.size.height = v16;
    v17 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvas"), "contentsScale");
    v19 = v18;
    remainder.origin.x = TSDRoundedPointForScale(v17, remainder.origin.x, remainder.origin.y, v18);
    remainder.origin.y = v20;
    remainder.size.width = TSDRoundedSizeForScale(remainder.size.width, remainder.size.height, v19);
    remainder.size.height = v21;
  }
  v22 = remainder.origin.x;
  y = remainder.origin.y;
  v24 = remainder.size.width;
  v25 = remainder.size.height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = y;
  result.origin.x = v22;
  return result;
}

- (void)p_adjustContentViewFrameForSize:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  float v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGRect v19;
  CGRect v20;

  -[THDocumentViewController p_contentFrameFrameForSize:](self, "p_contentFrameFrameForSize:", a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
  v14 = v13;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v12], "frame");
  v20.origin.x = v15;
  v20.origin.y = v16;
  v20.size.width = v17;
  v20.size.height = v18;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  if (!CGRectEqualToRect(v19, v20))
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v12], "setFrame:", v5, v7, v9, v11);
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "adjustContentInsets");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "invalidateVisibleBounds");
  if (v11 != v14
    && -[THDocumentViewController shouldAutoscrollToSelectionOnContentViewSizeChange](self, "shouldAutoscrollToSelectionOnContentViewSizeChange")&& v11 < v14)
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setShouldAutoscrollToSelectionAfterLayout:", 1);
  }
}

- (void)p_updateScrollViewForSize:(CGSize)a3
{
  double height;
  double width;
  __int128 v6;
  uint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat x;
  CGFloat y;
  CGFloat v14;
  CGFloat v15;
  _BOOL4 v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double MinY;
  double MaxY;
  double v33;
  double MaxX;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  CGFloat rect;
  _OWORD v40[3];
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  height = a3.height;
  width = a3.width;
  v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v40[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v40[1] = v6;
  v40[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v7 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setTransform:", v40);
  -[THDocumentViewController p_adjustContentViewFrameForSize:](self, "p_adjustContentViewFrameForSize:", width, height);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "setPagingEnabled:", -[THDocumentViewController shouldPagingBeEnabled](self, "shouldPagingBeEnabled"));
  -[THDocumentViewController p_updateScrollViewClipsToBounds](self, "p_updateScrollViewClipsToBounds");
  if (-[THDocumentViewController configuration](self, "configuration"))
  {
    -[THDocumentReflowableLayoutConfiguration scrubberFrame](-[THDocumentViewController configuration](self, "configuration"), "scrubberFrame");
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v14 = CGRectZero.size.width;
    v15 = CGRectZero.size.height;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    v14 = CGRectZero.size.width;
    v15 = CGRectZero.size.height;
    v11 = v15;
    v10 = v14;
    v9 = y;
    v8 = CGRectZero.origin.x;
  }
  v16 = CGRectEqualToRect(*(CGRect *)&v8, *(CGRect *)&x);
  v17 = *(void **)&self->TSADocumentViewController_opaque[v7];
  if (v16)
  {
    objc_msgSend(v17, "frame");
    v36 = v19;
    v37 = v18;
    rect = v20;
    v22 = v21;
    objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v35 = v29;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "setShowsHorizontalScrollIndicator:", 1);
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "setShowsVerticalScrollIndicator:", 1);
    v41.origin.x = v24;
    v41.origin.y = v26;
    v41.size.width = v28;
    v41.size.height = v30;
    MinY = CGRectGetMinY(v41);
    v42.origin.x = v37;
    v42.origin.y = rect;
    v42.size.width = v36;
    v42.size.height = v22;
    v38 = MinY - CGRectGetMinY(v42);
    v43.origin.x = v37;
    v43.origin.y = rect;
    v43.size.width = v36;
    v43.size.height = v22;
    MaxY = CGRectGetMaxY(v43);
    v44.origin.x = v24;
    v44.origin.y = v26;
    v44.size.width = v28;
    v44.size.height = v35;
    v33 = MaxY - CGRectGetMaxY(v44);
    v45.origin.x = v37;
    v45.origin.y = rect;
    v45.size.width = v36;
    v45.size.height = v22;
    MaxX = CGRectGetMaxX(v45);
    v46.origin.x = v24;
    v46.origin.y = v26;
    v46.size.width = v28;
    v46.size.height = v35;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "setScrollIndicatorInsets:", v38, 0.0, v33, MaxX - CGRectGetMaxX(v46));
  }
  else
  {
    objc_msgSend(v17, "setShowsHorizontalScrollIndicator:", 0);
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "setShowsVerticalScrollIndicator:", 0);
  }
}

- (void)p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  double v20;
  id obj;
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  if (!-[THDocumentViewController showingExpandedWidgetView](self, "showingExpandedWidgetView"))
  {
    if (-[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
      v14 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
    else
      v14 = -[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex");
    v16 = (id)v14;
    -[THDocumentViewController setLastAbsolutePageIndex:](self, "setLastAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
    if (v16 == (id)0x7FFFFFFFFFFFFFFFLL)
      return;
    goto LABEL_19;
  }
  v3 = +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "context"));
  v4 = -[THDocumentViewController p_canvasInfoForExpandedInfo:presentationType:](self, "p_canvasInfoForExpandedInfo:presentationType:", -[THWExpandedViewController expandedInfo](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "expandedInfo"), v3);
  if (-[THDocumentViewController isEpub](self, "isEpub"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    obj = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodes");
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v28;
LABEL_5:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v7);
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v26 = 0;
        v9 = objc_msgSend(v8, "bodyStorageForPresentationType:", v3);
        v11 = objc_opt_class(TSWPDrawableAttachment, v10);
        v12 = objc_msgSend(v9, "range");
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_F2A4;
        v22[3] = &unk_426F40;
        v22[4] = v4;
        v22[5] = self;
        v22[6] = v8;
        v22[7] = &v23;
        objc_msgSend(v9, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", v11, v12, v13, v22);
        LODWORD(v8) = *((unsigned __int8 *)v24 + 24);
        _Block_object_dispose(&v23, 8);
        if ((_DWORD)v8)
          break;
        if (v5 == (id)++v7)
        {
          v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          if (v5)
            goto LABEL_5;
          return;
        }
      }
    }
    return;
  }
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    v15 = -[THDocumentViewController expandableRepForInfo:](self, "expandableRepForInfo:", v4);
    if (v15)
    {
      objc_msgSend(v15, "frameInUnscaledCanvas");
      -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
      return;
    }
  }
  v17 = -[THDocumentViewController p_contentNodeForInfo:presentationType:](self, "p_contentNodeForInfo:presentationType:", v4, v3);
  if (v17)
  {
    v16 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "absolutePageIndexForContentNodeRelativePageIndex:inContentNode:forPresentationType:", objc_msgSend(v17, "relativePageIndexForInfo:forPresentationType:", v4, v3), v17, v3);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v19 = v18;
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    if (vabdd_f64(v19, v20) < 0.00999999978
      || (id)-[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") != v16)
    {
LABEL_19:
      -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setVisibleAbsolutePhysicalPageIndex:", v16);
    }
  }
}

- (void)p_resizeViewsForSize:(CGSize)a3 duration:(double)a4 maintainPageIndex:(BOOL)a5
{
  _BOOL4 v5;
  double height;
  double width;

  v5 = a5;
  height = a3.height;
  width = a3.width;
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:");
  -[THDocumentViewController p_releaseOverscrollViews](self, "p_releaseOverscrollViews");
  -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, a4);
  -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 1);
  -[THDocumentViewController p_setupPageNumberViews](self, "p_setupPageNumberViews");
  -[THDocumentViewController p_setupNavOverlayContainer](self, "p_setupNavOverlayContainer");
  -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
  -[THDocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", 0);
  -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 1);
  if (v5)
    -[THDocumentViewController p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen](self, "p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen");
  -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
}

- (BOOL)disableRotationEdgeClip
{
  return self->mExpandedViewController == 0;
}

- (void)p_dismissActiveAnimated:(BOOL)a3
{
  uint64_t v4;
  uint64_t v5;

  if (-[TSWPopoverController shouldDismissWhileRotating:](self->mPopUpPopoverController, "shouldDismissWhileRotating:", self->mIsRotating))
  {
    -[TSWPopoverController dismissPopoverAnimated:](self->mPopUpPopoverController, "dismissPopoverAnimated:", 0);
  }
  v5 = objc_opt_class(TSWPEditingController, v4);
  objc_msgSend((id)TSUDynamicCast(v5, objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor")), "dismissActivePopovers");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
}

- (id)currentNavigationUnit
{
  return -[THSectionController currentNavigationUnit](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "currentNavigationUnit");
}

- (void)setCurrentNavigationUnit:(id)a3
{
  if (-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit") != a3)
  {
    -[THDocumentViewController p_releaseOverscrollViews](self, "p_releaseOverscrollViews");
    -[THDocumentViewController p_clearCanvas](self, "p_clearCanvas");
    -[THSectionController setCurrentNavigationUnit:](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "setCurrentNavigationUnit:", a3);
    -[THSectionController setCurrentNavigationUnit:](-[THDocumentViewController flowSectionController](self, "flowSectionController"), "setCurrentNavigationUnit:", a3);
    if (!-[THDocumentViewController isEpub](self, "isEpub"))
      -[THToolbarDelegate setCenterTitle:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "setCenterTitle:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", a3));
    if (-[THDocumentViewController activeSectionController](self, "activeSectionController")
      || (-[THDocumentViewController p_setActiveSectionControllerDeferVantageDidChange:](self, "p_setActiveSectionControllerDeferVantageDidChange:", 0), -[THDocumentViewController activeSectionController](self, "activeSectionController")))
    {
      if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
        -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
      -[THDocumentViewController p_windowOrViewSize](self, "p_windowOrViewSize");
      -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:");
      -[THDocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", 0);
      -[THDocumentViewController navigationUnitDidChange:](self, "navigationUnitDidChange:", a3);
      -[THDocumentViewController p_updateProgressKitForNewNavigationUnit:](self, "p_updateProgressKitForNewNavigationUnit:", a3);
      -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
    }
  }
}

- (void)setCurrentNavigationUnit:(id)a3 withRelativePageIndex:(unint64_t)a4 animated:(BOOL)a5
{
  -[THDocumentViewController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", a3, a4, a5);
  -[THSectionController canvasRectForRelativePageIndex:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasRectForRelativePageIndex:", a4);
  -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:");
  -[THDocumentNavigator setVisitedPagesAfterOpening:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setVisitedPagesAfterOpening:", 1);
}

- (void)navigationUnitDidChange:(id)a3
{
  -[THBookNavigation navigationUnitDidChange:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "navigationUnitDidChange:", a3);
  -[THDocumentNavigator setVisitedPagesAfterOpening:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setVisitedPagesAfterOpening:", 1);
}

- (void)recordOutgoingMajorNavigationJump
{
  -[THBookNavigation recordOutgoingMajorNavigationJump](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "recordOutgoingMajorNavigationJump");
}

- (void)viewsDidResize
{
  -[THBookNavigation viewsDidResize](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "viewsDidResize");
}

- (void)recordCurrentLocationInHistory
{
  -[THBookNavigation recordCurrentLocationInHistory](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "recordCurrentLocationInHistory");
}

- (void)updateNavigationAffordances
{
  -[THBookNavigation updateNavigationAffordances](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "updateNavigationAffordances");
}

- (unint64_t)currentChapter
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits");
  if (v3 && (v4 = v3, -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit")))
    return (unint64_t)objc_msgSend(v4, "indexOfObjectIdenticalTo:", -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"));
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)currentLesson
{
  if (objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits")&& -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit")&& -[THDocumentViewController currentContentNode](self, "currentContentNode"))
  {
    return (unint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodes"), "indexOfObjectIdenticalTo:", -[THDocumentViewController currentContentNode](self, "currentContentNode"));
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)currentTOCLessonIndex
{
  id v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  id v10;
  unint64_t result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (!objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnits"))return 0x7FFFFFFFFFFFFFFFLL;
  if (!-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"))
    return 0x7FFFFFFFFFFFFFFFLL;
  if (!-[THDocumentViewController currentContentNode](self, "currentContentNode"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit", 0), "contentNodes");
  v4 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  while (2)
  {
    v8 = 0;
    v9 = &v5[(_QWORD)v6];
    do
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v3);
      v10 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v8);
      if (v10 == -[THDocumentViewController currentContentNode](self, "currentContentNode"))
        return (unint64_t)&v8[(_QWORD)v6];
      ++v8;
    }
    while (v5 != v8);
    v5 = (char *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    result = 0x7FFFFFFFFFFFFFFFLL;
    v6 = v9;
    if (v5)
      continue;
    break;
  }
  return result;
}

- (CGRect)canvasPreviewFrameForDocumentManager
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)inFlowMode
{
  return -[THPresentationType isFlow](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isFlow");
}

- (BOOL)isUpdatingVisibleViewController
{
  return 0;
}

- (BOOL)inPaginatedMode
{
  return -[THPresentationType isPaginated](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isPaginated");
}

- (BOOL)shouldPagingBeEnabled
{
  id v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;

  v3 = objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer");
  v4 = -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode");
  if (v4)
  {
    if (objc_msgSend(v3, "allowsPinchZoom"))
    {
      objc_msgSend(v3, "viewScale");
      v6 = v5;
      objc_msgSend(v3, "minimumPinchViewScale");
      LOBYTE(v4) = vabdd_f64(v6, v7) < 0.00999999978;
    }
    else
    {
      LOBYTE(v4) = 1;
    }
  }
  return v4;
}

- (double)currentViewScale
{
  double result;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  return result;
}

- (double)zoomedInViewScale
{
  double result;

  objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer"), "maximumPinchViewScale");
  return result;
}

- (double)zoomedOutViewScale
{
  double result;

  objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer"), "minimumPinchViewScale");
  return result;
}

- (double)fitWidthViewScale
{
  double v3;
  double v4;
  double v5;

  -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
  v4 = v3;
  -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
  return v5 / v4;
}

- (double)fitHeightViewScale
{
  double v3;
  double v4;
  double v5;

  -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
  v4 = v3;
  -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
  return v5 / v4;
}

- (BOOL)minimizeLayoutPadding
{
  return self->_minimizeLayoutPadding > 0;
}

- (void)pushMinimizeLayoutPadding
{
  ++self->_minimizeLayoutPadding;
}

- (void)popMinimizeLayoutPadding
{
  int64_t minimizeLayoutPadding;

  minimizeLayoutPadding = self->_minimizeLayoutPadding;
  if (minimizeLayoutPadding >= 1)
    self->_minimizeLayoutPadding = --minimizeLayoutPadding;
  if (!minimizeLayoutPadding)
  {
    if (-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"))
      -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
  }
}

- (void)setPerformanceModeBookOpening:(BOOL)a3
{
  if (self->_performanceModeBookOpening != a3)
  {
    self->_performanceModeBookOpening = a3;
    -[THDocumentViewController p_performanceModeUpdated](self, "p_performanceModeUpdated");
  }
}

- (void)p_performanceModeUpdated
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelector:", "performanceModeChanged");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "invalidateReps");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "invalidateLayers");
}

- (int)performanceMode
{
  return self->_performanceModeBookOpening;
}

- (void)validateCommand:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController validateCommand:](&v9, "validateCommand:");
  v5 = (const char *)objc_msgSend(a3, "action");
  if (sel_isEqual(v5, "books_toggleContinuousScroll:"))
  {
    v6 = -[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll");
LABEL_5:
    objc_msgSend(a3, "setState:", v6);
    return;
  }
  if (sel_isEqual(v5, "books_disableContinuousScroll:"))
  {
    v6 = -[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll") ^ 1;
    goto LABEL_5;
  }
  if (sel_isEqual(v5, "books_enableContinuousScroll:"))
  {
    objc_msgSend(a3, "setState:", -[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll"));
    v7 = (void *)THBundle();
    v8 = CFSTR("Vertical Scrolling");
  }
  else if (sel_isEqual(v5, "books_chapterLeft:"))
  {
    v7 = (void *)THBundle();
    v8 = CFSTR("Previous Chapter");
  }
  else
  {
    if (!sel_isEqual(v5, "books_chapterRight:"))
      return;
    v7 = (void *)THBundle();
    v8 = CFSTR("Next Chapter");
  }
  objc_msgSend(a3, "setTitle:", objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_43D7D8, 0));
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  unsigned int v6;
  _BOOL4 isEqual;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)THDocumentViewController;
  v6 = -[THDocumentViewController canPerformAction:withSender:](&v9, "canPerformAction:withSender:", a3, a4);
  if (sel_isEqual(a3, "copy:"))
  {
    if (v6)
      return -[THDocumentViewController canCopy](self, "canCopy");
    return 0;
  }
  if (sel_isEqual(a3, "books_toggleContinuousScroll:")
    || sel_isEqual(a3, "books_disableContinuousScroll:")
    || sel_isEqual(a3, "books_enableContinuousScroll:"))
  {
    if (v6)
      return -[THDocumentViewController isEpub](self, "isEpub");
    return 0;
  }
  if (sel_isEqual(a3, "books_addHighlight:"))
  {
    if (v6)
      return objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canAddHighlight");
    return 0;
  }
  isEqual = sel_isEqual(a3, "books_addNote:");
  if ((isEqual & v6) == 1)
    return objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canAddNote");
  else
    return v6 & ~isEqual;
}

- (void)copy:(id)a3
{
  -[THDocumentViewController copySelection](self, "copySelection", a3);
}

- (void)books_toggleContinuousScroll:(id)a3
{
  if (-[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll"))-[THDocumentViewController books_disableContinuousScroll:](self, "books_disableContinuousScroll:", a3);
  else
    -[THDocumentViewController books_enableContinuousScroll:](self, "books_enableContinuousScroll:", a3);
}

- (void)books_disableContinuousScroll:(id)a3
{
  -[THDocumentViewController p_setPagedPresentation](self, "p_setPagedPresentation", a3);
}

- (void)books_enableContinuousScroll:(id)a3
{
  -[THDocumentViewController p_setFlowPresentation](self, "p_setFlowPresentation", a3);
}

- (void)changeAnnotationStyle:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "changeAnnotationStyle:", a3);
}

- (void)removeNoteAndHighlight:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "removeNoteAndHighlight:", a3);
}

- (void)addNote:(id)a3
{
  -[THDocumentViewController books_addNote:](self, "books_addNote:", a3);
}

- (void)removeNote:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "removeNote:", a3);
}

- (void)books_addHighlight:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "addHighlight:", a3);
}

- (void)books_addNote:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "addNote:", a3);
}

- (void)books_pageForward:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "navigateToNextPage");
}

- (void)books_pageBackward:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "navigateToPreviousPage");
}

- (void)books_chapterLeft:(id)a3
{
  -[THDocumentViewController books_chapterBackward:](self, "books_chapterBackward:", a3);
}

- (void)books_chapterRight:(id)a3
{
  -[THDocumentViewController books_chapterForward:](self, "books_chapterForward:", a3);
}

- (void)books_chapterForward:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "navigateToNextChapter");
}

- (void)books_chapterBackward:(id)a3
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "navigateToPreviousChapter");
}

- (BOOL)p_isCompactFlowPresentation
{
  THSectionController *v3;
  uint64_t v4;

  if (!-[THDocumentViewController compactFlowPresentationState](self, "compactFlowPresentationState"))
  {
    if (-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
    {
      v3 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
      if (v3 == -[THDocumentViewController flowSectionController](self, "flowSectionController"))
      {
        v4 = 1;
        if (!-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth"))
        {
          if (-[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight"))
            v4 = 1;
          else
            v4 = 2;
        }
      }
      else
      {
        v4 = 2;
      }
    }
    else
    {
      v4 = 1;
    }
    -[THDocumentViewController setCompactFlowPresentationState:](self, "setCompactFlowPresentationState:", v4);
  }
  return -[THDocumentViewController compactFlowPresentationState](self, "compactFlowPresentationState") == 1;
}

- (BOOL)p_isCompactFlowPresentationForSectionController:(id)a3
{
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController") == a3)
    return -[THDocumentViewController p_isCompactFlowPresentation](self, "p_isCompactFlowPresentation");
  if (!-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
    return 1;
  if (-[THDocumentViewController flowSectionController](self, "flowSectionController") != a3)
    return 0;
  if (!-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth"))
    return -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight");
  else
    return 1;
}

- (id)selectedSectionController
{
  if (self->_flowSectionController
    && (!-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController")
     || -[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable")))
  {
    return -[THDocumentViewController flowSectionController](self, "flowSectionController");
  }
  else
  {
    return -[THDocumentViewController paginatedSectionController](self, "paginatedSectionController");
  }
}

- (void)toggleFlowPresentation
{
  if (self->_flowSectionController)
  {
    if (-[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable"))
      -[THDocumentViewController p_setPagedPresentation](self, "p_setPagedPresentation");
    else
      -[THDocumentViewController p_setFlowPresentation](self, "p_setFlowPresentation");
  }
}

- (void)p_setFlowPresentation
{
  if (!-[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable"))
  {
    -[THDocumentViewController setShowFlowModeIfAvailable:](self, "setShowFlowModeIfAvailable:", 1);
    -[THDocumentViewController p_presentationStyleChanged](self, "p_presentationStyleChanged");
  }
}

- (void)p_setPagedPresentation
{
  if (-[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable"))
  {
    -[THDocumentViewController setShowFlowModeIfAvailable:](self, "setShowFlowModeIfAvailable:", 0);
    -[THDocumentViewController p_presentationStyleChanged](self, "p_presentationStyleChanged");
  }
}

- (void)p_presentationStyleChanged
{
  NSUserDefaults *v3;
  uint64_t v4;
  double v5;
  double v6;

  v3 = +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
  if (-[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable"))
    v4 = 2;
  else
    v4 = 1;
  -[NSUserDefaults setInteger:forKey:](v3, "setInteger:forKey:", v4, THDocumentLayoutKey);
  -[THDocumentViewController setLastAbsolutePageIndex:](self, "setLastAbsolutePageIndex:", -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex"));
  objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
  -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, v5, v6, 0.25);
  -[THDocumentViewController p_resetPageDisplacment](self, "p_resetPageDisplacment");
  -[THDocumentViewController p_updateWidgetInteractionMode](self, "p_updateWidgetInteractionMode");
  -[THDocumentViewController p_updateScrubberCheckToolbarState:](self, "p_updateScrubberCheckToolbarState:", 1);
  -[THGuidedPanController setTarget:](-[THDocumentViewController guidedPanController](self, "guidedPanController"), "setTarget:", 0);
}

- (void)p_setActiveSectionControllerDeferVantageDidChange:(BOOL)a3
{
  _BOOL4 v3;
  THSectionController *v5;
  int v6;
  UIColor *v7;
  unsigned __int8 v8;

  v3 = a3;
  v5 = -[THDocumentViewController selectedSectionController](self, "selectedSectionController");
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController") != v5)
  {

    self->_configuration = 0;
    if (-[THDocumentViewController activeSectionController](self, "activeSectionController")
      && !-[THPresentationType isEqual:](-[THSectionController presentationType](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "presentationType"), "isEqual:", -[THSectionController presentationType](v5, "presentationType")))
    {
      -[THBookNavigation vantageWillChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonPresentationMode"));
      v6 = 0;
    }
    else
    {
      v6 = 1;
    }
    -[THDocumentViewController setActiveSectionController:](self, "setActiveSectionController:", v5);
    -[THDocumentViewController setCompactFlowPresentationState:](self, "setCompactFlowPresentationState:", 0);
    v7 = +[UIColor clearColor](UIColor, "clearColor");
    v8 = -[THPresentationType isFlow](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isFlow");
    if ((v8 & 1) != 0 || -[THDocumentViewController isEpub](self, "isEpub"))
      v7 = (UIColor *)objc_msgSend(-[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"), "backgroundColorForTraitEnvironment:", self);
    objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "setBackgroundColor:", v7);
    if (!-[THDocumentViewController isEpub](self, "isEpub"))
    {
      if ((v8 & 1) == 0)
        v7 = +[UIColor clearColor](UIColor, "clearColor");
      objc_msgSend(-[THDocumentViewController view](self, "view"), "setBackgroundColor:", v7);
    }
    if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt"))
    {
      -[THDocumentViewController corruptBookAlert](self, "corruptBookAlert");
      -[THDocumentViewController setActiveSectionController:](self, "setActiveSectionController:", 0);
    }
    else
    {
      -[THDocumentViewController p_updateScrollViewDecelerationRate](self, "p_updateScrollViewDecelerationRate");
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setCreateRepsForOffscreenLayouts:", -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode"));
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "recreateAllLayoutsAndReps");
      -[THDocumentViewController p_updateCanvasSize](self, "p_updateCanvasSize");
      if (((v6 | v3) & 1) == 0)
        -[THBookNavigation vantageDidChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonPresentationMode"));
    }
  }
}

- (CGSize)p_desiredCanvasSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[THSectionController preferredCanvasSize](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "preferredCanvasSize");
  v4 = v3;
  v6 = v5;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
    if (v6 < v7)
      v6 = v7;
  }
  v8 = v4;
  v9 = v6;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)p_updateCanvasSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;

  -[THDocumentViewController p_desiredCanvasSize](self, "p_desiredCanvasSize");
  v4 = v3;
  v6 = v5;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "unscaledSize");
  v9 = v8 == v4 && v7 == v6;
  if (!v9 && !self->mOverscrollAnimationInProcess)
  {
    self->mPreventScrollViewDidScrollReentrance = 1;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setUnscaledSize:", v4, v6);
    self->mPreventScrollViewDidScrollReentrance = 0;
    -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
  }
}

- (CGSize)p_maxScrollViewSizeForViewSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[THDocumentViewController viewHeaderHeight](self, "viewHeaderHeight");
  v6 = height - v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)p_maxScrollViewSize
{
  double v3;
  double v4;
  CGSize result;

  -[THDocumentViewController p_windowOrViewSize](self, "p_windowOrViewSize");
  -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:");
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)p_windowOrViewSize
{
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = -[THDocumentViewController view](self, "view");
  v3 = objc_msgSend(v2, "window");
  if (v3)
    objc_msgSend(v3, "bounds");
  else
    objc_msgSend(v2, "frame");
  v6 = v4;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)zoomOutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = a3;
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController"))
  {
    objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer"), "minimumPinchViewScale");
    v6 = v5;
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "contentOffset");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setViewScale:contentOffset:clampOffset:animated:", 1, v3, v6, v7, v8);
    if (!v3)
      -[THDocumentViewController p_canvasDidZoom](self, "p_canvasDidZoom");
  }
}

- (void)zoomOutIfNecessaryPriorToNavigation
{
  if (-[THDocumentViewController interactiveCanvasControllerShouldAllowZoomToColumn:](self, "interactiveCanvasControllerShouldAllowZoomToColumn:", -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"))|| -[THDocumentViewController p_allowsPinchZoom](self, "p_allowsPinchZoom"))
  {
    -[THDocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", 0);
  }
}

- (void)zoomOutIfNecessaryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a3;
  -[THDocumentViewController currentViewScale](self, "currentViewScale");
  v8 = v7;
  -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
  if (vabdd_f64(v8, v9) < 0.00999999978
    || (-[THDocumentViewController currentViewScale](self, "currentViewScale"),
        v11 = v10,
        -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale"),
        v11 <= v12))
  {
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
  }
  else
  {
    -[THDocumentViewController setCanvasDidZoomCompletion:](self, "setCanvasDidZoomCompletion:", a4);
    -[THDocumentViewController zoomOutAnimated:](self, "zoomOutAnimated:", v5);
  }
}

- (BOOL)p_allowsPinchZoom
{
  id v3;
  _BOOL4 v4;
  double v5;
  double v6;
  double v7;

  v3 = objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer");
  if (-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth")
    || (v4 = -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight")))
  {
    objc_msgSend(v3, "minimumPinchViewScale");
    v6 = v5;
    objc_msgSend(v3, "maximumPinchViewScale");
    if (vabdd_f64(v6, v7) >= 0.00999999978)
      LOBYTE(v4) = !-[THDocumentViewController p_isCompactFlowPresentation](self, "p_isCompactFlowPresentation");
    else
      LOBYTE(v4) = 0;
  }
  return v4;
}

- (BOOL)p_allowsPageDisplacement
{
  THSectionController *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
  if (v3)
  {
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
      v5 = v4;
      v7 = v6;
      -[THDocumentViewController p_windowOrViewSize](self, "p_windowOrViewSize");
      LOBYTE(v3) = 0;
      if (v5 > 0.0 && v8 > 0.0)
        LOBYTE(v3) = v7 / v5 > v9 / v8;
    }
  }
  return (char)v3;
}

- (void)p_updateScrollViewAndZoomSettingsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;

  height = a3.height;
  width = a3.width;
  -[THDocumentViewController p_updateScrollViewForSize:](self, "p_updateScrollViewForSize:");
  -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
  v7 = v6;
  -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:", width, height);
  v9 = v8;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
  v11 = v10;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    v12 = v9;
  else
    v12 = v11;
  v13 = v12 / v7;
  if (-[THDocumentViewController p_isCompactFlowPresentation](self, "p_isCompactFlowPresentation"))
    v13 = 1.0;
  v14 = objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer");
  objc_msgSend(v14, "setShowsScaleFeedback:", 0);
  objc_msgSend(v14, "setMinimumPinchViewScale:", v13);
  objc_msgSend(v14, "setMaximumPinchViewScale:", 1.0);
  objc_msgSend(v14, "setAllowsPinchZoom:", -[THDocumentViewController p_allowsPinchZoom](self, "p_allowsPinchZoom"));
  -[THDocumentViewController p_updateScrollViewClipsToBounds](self, "p_updateScrollViewClipsToBounds");
}

- (CGRect)shadowBoundsForCanvasExitTransformDelegate:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if (-[THDocumentViewController isTwoUp](self, "isTwoUp", a3)
    && objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType")) == (char *)&dword_0 + 1)
  {
    v4 = objc_msgSend(-[THPageViewProvider pageHostForAbsolutePageIndex:](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "pageHostForAbsolutePageIndex:", -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex")), "view");
  }
  else
  {
    v4 = *(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
  }
  objc_msgSend(v4, "bounds");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)rectForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  char *v6;
  char *v7;
  uint64_t v8;
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
  double v28;
  double v29;
  CGRect result;

  v6 = (char *)objc_msgSend(-[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", a4), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
  if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
  {
    v7 = v6 - 1;
    if (v7)
    {
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
      v12 = v24;
      v14 = v25;
      v16 = v23 * 0.5;
      v26 = -0.0;
      if (v7 == (char *)a3)
        v26 = v23 * 0.5;
      v18 = v22 + v26;
    }
    else
    {
      v8 = OBJC_IVAR___TSADocumentViewController__scrollView;
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15 * 0.5;
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v8], "frame");
      v18 = v10 + (v17 - v16) * 0.5;
    }
  }
  else
  {
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
    v12 = v19;
    v16 = v20;
    v14 = v21;
  }
  v27 = v12;
  v28 = v16;
  v29 = v14;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v18;
  return result;
}

- (BOOL)isLastPageInChapterForRelativePageIndex:(unint64_t)a3 chapterIndex:(unint64_t)a4
{
  return (char *)objc_msgSend(-[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", a4), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType"))- 1 == (_BYTE *)a3;
}

- (BOOL)p_isSinglePageChapter
{
  return -[THDocumentViewController isSinglePageChapterForChapterIndex:](self, "isSinglePageChapterForChapterIndex:", -[THDocumentViewController currentChapter](self, "currentChapter"));
}

- (BOOL)isSinglePageChapterForChapterIndex:(unint64_t)a3
{
  return a3 != 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(-[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:"), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType")) == (char *)&dword_0 + 1;
}

- (_NSRange)currentRelativePageIndexRange
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v3 = -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex");
  if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
  {
    if ((unint64_t)objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "pageCountForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType")) <= 1)v4 = 1;
    else
      v4 = 2;
  }
  else
  {
    v4 = 1;
  }
  v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

- (void)sectionControllerNeedsLayout:(id)a3
{
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController") == a3)
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
}

- (BOOL)displaySinglePageChapterSeparately:(id)a3
{
  return 1;
}

- (id)layoutControllerForSectionController:(id)a3
{
  return objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "layoutController");
}

- (BOOL)allowsDescendersToClipForSectionController:(id)a3
{
  return !-[THDocumentViewController isEpub](self, "isEpub", a3);
}

- (BOOL)shouldScaleFlowLayoutsForSectionController:(id)a3
{
  return !-[THDocumentViewController isEpub](self, "isEpub", a3);
}

- (void)sectionControllerInfosDidChange:(id)a3
{
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController") == a3)
    -[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:](self, "p_updateVisibleInfosWithPaddingOptions:force:", -[THDocumentViewController p_activePagePaddingOptions](self, "p_activePagePaddingOptions"), 1);
}

- (unint64_t)currentAbsolutePageIndex
{
  if ((!-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController")
     || -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete"))&& -[THDocumentViewController documentNavigator](self, "documentNavigator"))
  {
    return -[THDocumentNavigator currentAbsolutePageIndex](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "currentAbsolutePageIndex");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (unint64_t)currentRelativePageIndex
{
  return -[THDocumentNavigator currentNavigationUnitRelativePageIndex](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "currentNavigationUnitRelativePageIndex");
}

- (THPresentationType)currentPresentationType
{
  THPresentationType *result;

  result = -[THSectionController presentationType](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "presentationType");
  if (!result)
  {
    if (-[THDocumentViewController showFlowModeIfAvailable](self, "showFlowModeIfAvailable")
      && objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType"))
    {
      return (THPresentationType *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "flowPresentationType");
    }
    else
    {
      return (THPresentationType *)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "defaultPresentationType");
    }
  }
  return result;
}

- (void)p_visiblePageRangeWillChangeTo:(_NSRange)a3
{
  id v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id obj;
  _QWORD v17[5];
  _QWORD v18[6];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if ((id)a3.location != NSInvalidRange[0] || a3.length != (_QWORD)NSInvalidRange[1])
  {
    v5 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodesSurroundingRelativePageRange:forPresentationType:", a3.location, a3.length, -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
    v6 = -[THDocumentViewController visibleRelativePageRange](self, "visibleRelativePageRange");
    if (v6 != NSInvalidRange[0] || v7 != NSInvalidRange[1])
    {
      v9 = -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit");
      v10 = -[THDocumentViewController visibleRelativePageRange](self, "visibleRelativePageRange");
      v5 = objc_msgSend(v5, "tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:", objc_msgSend(v9, "contentNodesSurroundingRelativePageRange:forPresentationType:", v10, v11, -[THDocumentViewController currentPresentationType](self, "currentPresentationType")));
    }
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16, v5);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "startLoading");
          v18[0] = 0;
          v18[1] = v18;
          v18[2] = 0x3052000000;
          v18[3] = sub_11194;
          v18[4] = sub_111A4;
          v18[5] = self;
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_111B4;
          v17[3] = &unk_426FA8;
          v17[4] = v18;
          objc_msgSend(v15, "performWhenFinishedLoading:onError:", &stru_426F80, v17);
          _Block_object_dispose(v18, 8);
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }
  }
}

- (int)p_activePagePaddingOptions
{
  if (-[THDocumentViewController inPaginatedMode](self, "inPaginatedMode")
    && !-[THDocumentViewController minimizeLayoutPadding](self, "minimizeLayoutPadding"))
  {
    return -[THDocumentViewController pagePaddingOptions](self, "pagePaddingOptions");
  }
  else
  {
    return 0;
  }
}

- (void)p_updateVisibleInfos
{
  -[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:](self, "p_updateVisibleInfosWithPaddingOptions:force:", -[THDocumentViewController p_activePagePaddingOptions](self, "p_activePagePaddingOptions"), 0);
}

- (void)p_updateVisibleInfosWithPaddingOptions:(int)a3 force:(BOOL)a4
{
  uint64_t v5;
  unsigned int v7;
  unsigned int v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  THPageViewProvider *v22;
  id v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a3;
  if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt"))
  {
    -[THDocumentViewController corruptBookAlert](self, "corruptBookAlert");
  }
  else
  {
    if (!-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3527, CFSTR("can't update visible page infos without a interactive canvas controller"));
    if (-[THDocumentViewController activeSectionController](self, "activeSectionController")
      && -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"))
    {
      if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
        v7 = 0;
      else
        v7 = -[THSpinnerProvider setupLoadSpinner](-[THDocumentViewController spinnerProvider](self, "spinnerProvider"), "setupLoadSpinner");
      if (!-[THDocumentViewController preventVisibleInfoUpdates](self, "preventVisibleInfoUpdates"))
      {
        v8 = -[THDocumentViewController inPaginatedMode](self, "inPaginatedMode");
        v9 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
        if (v8)
          v10 = objc_msgSend(v9, "visibleUnscaledRect");
        else
          v10 = objc_msgSend(v9, "visibleUnscaledRectForContent");
        v11 = TSDRoundedRect(v10);
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v18 = -[THSectionController relativePageRangeForCanvasRect:pad:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "relativePageRangeForCanvasRect:pad:", v5, v11, v12, v14, v16);
        v20 = v19;
        if (a4
          || -[THDocumentViewController visibleRelativePageRange](self, "visibleRelativePageRange") != v18
          || v24 != v20)
        {
          -[THDocumentViewController p_visiblePageRangeWillChangeTo:](self, "p_visiblePageRangeWillChangeTo:", v18, v20);
          v21 = -[THSectionController infosToDisplayForRelativePageRange:forceLoad:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "infosToDisplayForRelativePageRange:forceLoad:", v18, v20, -[THDocumentViewController firstLoad](self, "firstLoad"));
          -[THDocumentViewController setFirstLoad:](self, "setFirstLoad:", 0);
          v22 = -[THDocumentViewController pageViewProvider](self, "pageViewProvider");
          if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
            v23 = 0;
          else
            v23 = v21;
          -[THPageViewProvider updateWithInfosToDisplay:](v22, "updateWithInfosToDisplay:", v23);
          objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", v21);
          -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", v18, v20);
        }
        -[THDocumentViewController p_updateProgessKitSectionInCanvasRect:](self, "p_updateProgessKitSectionInCanvasRect:", v11, v13, v15, v17);
      }
      if (v7)
        -[THSpinnerProvider hideLoadSpinner](-[THDocumentViewController spinnerProvider](self, "spinnerProvider"), "hideLoadSpinner");
      if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
        -[THDocumentViewController p_updateCanvasSize](self, "p_updateCanvasSize");
    }
  }
}

- (CGSize)pageSizeForPagePositionController:(id)a3
{
  THSectionController *v4;
  double v5;
  double v6;
  CGSize result;

  if (objc_msgSend(a3, "pageHorizontally"))
  {
    if (!-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController pageSizeForPagePositionController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3579, CFSTR("invalid nil value for '%s'"), "self.paginatedSectionController");
    v4 = -[THDocumentViewController paginatedSectionController](self, "paginatedSectionController");
  }
  else
  {
    if (-[THDocumentViewController p_isCompactFlowPresentationForSectionController:](self, "p_isCompactFlowPresentationForSectionController:", -[THDocumentViewController flowSectionController](self, "flowSectionController")))
    {
      -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
      goto LABEL_11;
    }
    if (!-[THDocumentViewController flowSectionController](self, "flowSectionController"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController pageSizeForPagePositionController:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3590, CFSTR("invalid nil value for '%s'"), "self.flowSectionController");
    v4 = -[THDocumentViewController flowSectionController](self, "flowSectionController");
  }
  -[THPresentationType pageSize](-[THSectionController presentationType](v4, "presentationType"), "pageSize");
LABEL_11:
  if (CGSizeZero.width == v5 && CGSizeZero.height == v6)
    -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)p_willLayoutCanvasPaginated:(id)a3
{
  if (!-[THDocumentViewController inPaginatedMode](self, "inPaginatedMode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasPaginated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3609, CFSTR("should be doing paginated layout"));
  -[THSectionController ensureSectionInfosLaidOut:layoutController:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "ensureSectionInfosLaidOut:layoutController:", objc_msgSend(a3, "infosToDisplay"), objc_msgSend(a3, "layoutController"));
}

- (void)p_willLayoutCanvasFlow:(id)a3
{
  THSectionController *v5;
  THSectionController *v6;
  THFlowLayoutAnchor *mLayoutAnchor;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;

  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasFlow:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3616, CFSTR("should be doing flow layout"));
  if (CGRectIsNull(self->mScrollTargetRect))
  {
    if (!self->mLayoutAnchor)
    {
      v5 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
      objc_msgSend(a3, "contentOffset");
      self->mLayoutAnchor = (THFlowLayoutAnchor *)-[THSectionController layoutAnchorForContentOffset:](v5, "layoutAnchorForContentOffset:");
    }
    v6 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    mLayoutAnchor = self->mLayoutAnchor;
    objc_msgSend(a3, "visibleHeight");
    v9 = 2048.0;
    if (v8 + v8 >= 2048.0)
    {
      objc_msgSend(a3, "visibleHeight");
      v9 = v10 + v10;
    }
    objc_msgSend(a3, "visibleHeight");
    v12 = 2048.0;
    if (v11 + v11 >= 2048.0)
    {
      objc_msgSend(a3, "visibleHeight");
      v12 = v13 + v13;
    }
    -[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:](v6, "layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:", mLayoutAnchor, objc_msgSend(a3, "layoutController"), v9, v12);
    if (self->mLayoutAnchor)
    {
      if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasFlow:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3629, CFSTR("layout anchor is only supported in flow"));
      -[THFlowLayoutAnchor deltaFromOriginalOffset](self->mLayoutAnchor, "deltaFromOriginalOffset");
      v15 = v14;
      -[THDocumentViewController currentViewScale](self, "currentViewScale");
      self->mCanvasYOffset = self->mCanvasYOffset - v15 * v16;
      v17 = objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer");
      -[THDocumentViewController p_desiredCanvasSize](self, "p_desiredCanvasSize");
      objc_msgSend(v17, "setUnscaledSizeOnLayer:");
      CGAffineTransformMakeTranslation(&v20, 0.0, self->mCanvasYOffset);
      v18 = objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer");
      v19 = v20;
      objc_msgSend(v18, "setAffineTransform:", &v19);
      objc_msgSend(a3, "visibleBoundsRect");
      if (CGRectIsEmpty(v21))
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_willLayoutCanvasFlow:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3641, CFSTR("visible rect is empty after transforming canvas"));
      -[THDocumentViewController p_updateVerticalOverscrollTransform](self, "p_updateVerticalOverscrollTransform");
    }
  }
}

- (void)interactiveCanvasControllerWillLayout:(id)a3
{
  if ((objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isCorrupt") & 1) == 0
    && objc_msgSend(objc_msgSend(a3, "infosToDisplay"), "count"))
  {
    if (!-[THDocumentViewController activeSectionController](self, "activeSectionController"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController interactiveCanvasControllerWillLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3652, CFSTR("can't layout without a section controller"));
    if (-[THDocumentViewController inPaginatedMode](self, "inPaginatedMode"))
      -[THDocumentViewController p_willLayoutCanvasPaginated:](self, "p_willLayoutCanvasPaginated:", a3);
    else
      -[THDocumentViewController p_willLayoutCanvasFlow:](self, "p_willLayoutCanvasFlow:", a3);
  }

  self->mLayoutAnchor = 0;
}

- (void)p_fireCanvasDidZoomCompletion
{
  void (**v3)(void);

  if (-[THDocumentViewController canvasDidZoomCompletion](self, "canvasDidZoomCompletion"))
  {
    v3 = (void (**)(void))-[THDocumentViewController canvasDidZoomCompletion](self, "canvasDidZoomCompletion");
    -[THDocumentViewController setCanvasDidZoomCompletion:](self, "setCanvasDidZoomCompletion:", 0);
    v3[2]();

  }
}

- (void)p_interactiveCanvasControllerDidLayout
{
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
  -[THDocumentViewController p_fadeOutOverscrollTransition](self, "p_fadeOutOverscrollTransition");
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  -[THDocumentViewController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", "p_interactiveCanvasControllerDidLayout", 0, 0);
  -[THPageViewProvider canvasDidLayout](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "canvasDidLayout");
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode") && CGRectIsNull(self->mScrollTargetRect))
  {
    if (self->mLayoutAnchor)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController interactiveCanvasControllerDidLayout:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 3702, CFSTR("shouldn't have saved off a layout anchor during layout"));
    if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
    {
      -[THDocumentViewController p_fixScrollViewToMatchCanvas](self, "p_fixScrollViewToMatchCanvas");
      if ((objc_msgSend(a3, "currentlyScrolling") & 1) == 0)
        -[THDocumentViewController p_removeCanvasTransform](self, "p_removeCanvasTransform");
    }
  }
}

- (BOOL)tappedCanvasBackgroundAtPoint:(CGPoint)a3
{
  return 1;
}

- (BOOL)zoomOnSelectionChange:(id)a3
{
  return 0;
}

- (void)interactiveCanvasController:(id)a3 scrollViewWillBeginDragging:(id)a4
{
  TSWPopoverController *mPopUpPopoverController;

  objc_msgSend(a3, "contentOffset");
  -[THDocumentViewController setBeginDraggingContentOffset:](self, "setBeginDraggingContentOffset:");
  mPopUpPopoverController = self->mPopUpPopoverController;
  if (mPopUpPopoverController)
    -[TSWPopoverController dismissPopoverAnimated:](mPopUpPopoverController, "dismissPopoverAnimated:", 1);
}

- (BOOL)interactiveCanvasController:(id)a3 allowsDragOfSmartField:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v5 = objc_opt_class(TSWPHyperlinkField, a2);
  v6 = (void *)TSUDynamicCast(v5, a4);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "url"), "scheme"), "length");
    if (v8)
      LOBYTE(v8) = objc_msgSend(objc_msgSend(objc_msgSend(v7, "url"), "scheme"), "isEqualToString:", CFSTR("x-ibooks-th")) ^ 1;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (void)p_swipeToNextOffsetForScrollView:(id)a3 flowPageController:(id)a4 withVelocity:(CGPoint)a5 targetContentOffset:(CGPoint *)a6
{
  double y;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat x;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;

  y = a5.y;
  v10 = objc_msgSend(a4, "contentNode", a3, a5.x);
  objc_msgSend(a4, "desiredPageSizeForRelativePageIndex:", 0);
  v12 = v11;
  v14 = v13;
  -[THSectionController canvasOriginForPageController:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasOriginForPageController:", a4);
  v16 = v15;
  x = a6->x;
  v18 = a6->y;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
  v20 = v19;
  -[THDocumentViewController beginDraggingContentOffset](self, "beginDraggingContentOffset");
  if (y > 0.0)
  {
    v22 = v20 + v21;
    v23 = objc_msgSend(a4, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:", 0, 0.0, v20 + v21 + -40.0 - v16, v12, 40.0);
    if (v23)
    {
      objc_msgSend(a4, "originOfCharacterIndex:forRelativePageIndex:", v23, 0);
      if (v16 + v24 > v22 + v20 * -0.5)
        v22 = v16 + v24;
    }
    if (objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeAfterNode:", v10))
    {
      v25 = v14 + v16;
      if (v25 < v22)
      {
        -[THDocumentViewController beginDraggingContentOffset](self, "beginDraggingContentOffset");
        if (vabdd_f64(v25, v26) <= 50.0)
          v18 = v22;
        else
          v18 = v25;
        goto LABEL_23;
      }
    }
    else if (v22 <= v18)
    {
      goto LABEL_23;
    }
    v18 = v22;
    goto LABEL_23;
  }
  v27 = v21 - v20;
  v28 = objc_msgSend(a4, "firstBodyCharacterIndexOverlappingPageRect:forRelativePageIndex:", 0, 0.0, v27 + 20.0 - v16, v12, 40.0);
  if (v28)
  {
    objc_msgSend(a4, "originOfCharacterIndex:forRelativePageIndex:", v28, 0);
    if (v16 + v29 > v27)
      v27 = v16 + v29;
  }
  v30 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeBeforeNode:", v10);
  if (v30)
  {
    -[THSectionController canvasOriginForPageController:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasOriginForPageController:", -[THSectionController pageControllerForContentNode:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "pageControllerForContentNode:", v30));
    v32 = v31;
    if (v16 <= v27
      || (-[THDocumentViewController beginDraggingContentOffset](self, "beginDraggingContentOffset"), v16 >= v33)
      || (-[THDocumentViewController beginDraggingContentOffset](self, "beginDraggingContentOffset"),
          v18 = v16,
          vabdd_f64(v16, v34) <= 50.0))
    {
      if (v32 <= v27)
        v18 = v27;
      else
        v18 = v32;
    }
  }
  else
  {
    v18 = v27;
  }
LABEL_23:
  a6->x = x;
  a6->y = v18;
}

- (void)interactiveCanvasControllerFreeTransformWillBegin:(id)a3
{
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setClipsToBounds:", 1);
}

- (void)interactiveCanvasControllerFreeTransformDidEnd:(id)a3
{
  if (-[THDocumentViewController p_updateScrollViewClipsToBounds](self, "p_updateScrollViewClipsToBounds", a3))
  {
    if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
    {
      -[THDocumentViewController updateVisibleInfosWithPageIndex:](self, "updateVisibleInfosWithPageIndex:", -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex"));
      objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "enclosingScrollView"), "_prepareToPageWithHorizontalVelocity:verticalVelocity:", 0.0, 0.0);
    }
  }
}

- (BOOL)interactiveCanvasControllerShouldIgnoreOverscroll:(id)a3
{
  return !-[THDocumentViewController p_canOverscroll](self, "p_canOverscroll", a3);
}

- (void)interactiveCanvasController:(id)a3 didOverscrollLeft:(double)a4 state:(int)a5
{
  if (-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView", a3, a4))
  {
    -[THDocumentViewController isEpub](self, "isEpub");
    if ((a5 & 0xFFFFFFFE) == 2)
      -[THDocumentViewController p_horizontalOverscrollPreviousChapter](self, "p_horizontalOverscrollPreviousChapter");
    -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
    -[THDocumentViewController setJustUpdatedPresentationType:](self, "setJustUpdatedPresentationType:", 0);
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollRight:(double)a4 state:(int)a5
{
  if (-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView", a3, a4))
  {
    -[THDocumentViewController isEpub](self, "isEpub");
    if ((a5 & 0xFFFFFFFE) == 2)
      -[THDocumentViewController p_horizontalOverscrollNextChapter](self, "p_horizontalOverscrollNextChapter");
    -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
    -[THDocumentViewController setJustUpdatedPresentationType:](self, "setJustUpdatedPresentationType:", 0);
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollTop:(double)a4 state:(int)a5
{
  unsigned int v8;
  double v9;

  if (-[THDocumentViewController topOverscrollView](self, "topOverscrollView", a3))
  {
    v8 = -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight");
    v9 = 128.0;
    if (v8)
      v9 = 48.0;
    if (a5 == 2 && v9 < a4)
      -[THDocumentViewController p_verticalOverscrollPreviousChapter](self, "p_verticalOverscrollPreviousChapter");
  }
}

- (void)interactiveCanvasController:(id)a3 didOverscrollBottom:(double)a4 state:(int)a5
{
  unsigned int v8;
  double v9;

  if (-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView", a3))
  {
    v8 = -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight");
    v9 = 128.0;
    if (v8)
      v9 = 48.0;
    if (a5 == 2 && v9 < a4)
      -[THDocumentViewController p_verticalOverscrollNextChapter](self, "p_verticalOverscrollNextChapter");
  }
}

- (double)p_pageMarginWidth
{
  char *v2;
  double result;

  v2 = (char *)objc_msgSend(objc_msgSend(-[THDocumentViewController bc_windowForViewController](self, "bc_windowForViewController"), "windowScene"), "interfaceOrientation");
  result = 60.0;
  if ((unint64_t)(v2 - 3) < 2)
    return 70.0;
  return result;
}

- (BOOL)interactiveCanvasController:(id)a3 pointIsInLeftMargin:(CGPoint)a4
{
  double v5;
  double v6;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "convertUnscaledToBoundsPoint:", a4.x, a4.y);
  return -[THDocumentViewController pointIsInLeftMargin:fromView:](self, "pointIsInLeftMargin:fromView:", objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"), v5, v6);
}

- (BOOL)interactiveCanvasController:(id)a3 pointIsInRightMargin:(CGPoint)a4
{
  double v5;
  double v6;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "convertUnscaledToBoundsPoint:", a4.x, a4.y);
  return -[THDocumentViewController pointIsInRightMargin:fromView:](self, "pointIsInRightMargin:fromView:", objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"), v5, v6);
}

- (BOOL)interactiveCanvasControllerShouldPageLeftOnMarginTap:(id)a3
{
  unsigned int v4;

  if ((TSUPadUI(self, a2) & 1) != 0 || (v4 = -[THDocumentViewController isEpub](self, "isEpub")) != 0)
  {
    v4 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "isPagingEnabled");
    if (v4)
      LOBYTE(v4) = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex") != 0;
  }
  return v4;
}

- (BOOL)interactiveCanvasControllerShouldPageRightOnMarginTap:(id)a3
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;

  if ((TSUPadUI(self, a2) & 1) != 0 || (v4 = -[THDocumentViewController isEpub](self, "isEpub")) != 0)
  {
    v4 = objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "isPagingEnabled");
    if (v4)
    {
      v5 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
      v6 = 1;
      if (self->_isTwoUp)
        v6 = 2;
      LOBYTE(v4) = v6 + v5 < (unint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
  }
  return v4;
}

- (void)interactiveCanvasControllerWasTapped:(id)a3
{
  -[THDocumentViewController toggleToolbar](self, "toggleToolbar", a3);
}

- (void)interactiveCanvasControllerWillShowNoteEditor:(id)a3
{
  -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
}

- (void)interactiveCanvasController:(id)a3 wantsToPresentContextMenuAtCanvasPoint:(CGPoint)a4 forAnnotationUUID:(id)a5
{
  double v7;
  double v8;

  objc_msgSend(-[THDocumentViewController view](self, "view", a3), "convertPoint:fromView:", objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"), a4.x, a4.y);
  objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "shouldPresentContextMenuInView:atPoint:forAnnotationUUID:", -[THDocumentViewController view](self, "view"), a5, v7, v8);
}

- (BOOL)interactiveCanvasControllerShouldAllowZoomToColumn:(id)a3
{
  _BOOL4 v4;

  if (-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth", a3)
    || (v4 = -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight")))
  {
    LOBYTE(v4) = !-[THDocumentViewController p_isCompactFlowPresentation](self, "p_isCompactFlowPresentation");
  }
  return v4;
}

- (BOOL)interactiveCanvasController:(id)a3 shouldZoomToColumn:(id)a4 withFrame:(CGRect)a5 tapPoint:(CGPoint)a6
{
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGPoint v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  y = a6.y;
  x = a6.x;
  objc_msgSend(a3, "convertUnscaledToBoundsRect:", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(a3, "convertUnscaledToBoundsPoint:", x, y);
  v18 = v17;
  v20 = v19;
  v24.origin.x = v10;
  v24.origin.y = v12;
  v24.size.width = v14;
  v24.size.height = v16;
  CGRectGetWidth(v24);
  v25.origin.x = v10;
  v25.origin.y = v12;
  v25.size.width = v14;
  v25.size.height = v16;
  CGRectGetHeight(v25);
  v21 = TSDCenterOfRect(v10, v12, v14, v16);
  v26.origin.x = TSDRectWithCenterAndSize(v21);
  v23.x = v18;
  v23.y = v20;
  return CGRectContainsPoint(v26, v23);
}

- (double)interactiveCanvasControllerPaddingForZoomToColumn:(id)a3
{
  return 15.0;
}

- (void)interactiveCanvasController:(id)a3 didZoomToColumn:(id)a4 ofRep:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "endEditing");
  v8 = objc_msgSend(a5, "layout");
  v10 = objc_opt_class(TSDLayout, v9);
  -[THGuidedPanController setTarget:](-[THDocumentViewController guidedPanController](self, "guidedPanController"), "setTarget:", -[THGuidedPanColumnTarget initWithLayout:column:]([THGuidedPanColumnTarget alloc], "initWithLayout:column:", TSUClassAndProtocolCast(v8, v10, 1), a4));
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forRep:(id)a5
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THPageLayerAndSubviewHostProvider))
    return -[THDocumentViewController pageViewProvider](self, "pageViewProvider");
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THPerformanceCoordinator))
    return self;
  return 0;
}

- (id)interactiveCanvasController:(id)a3 delegateConformingToProtocol:(id)a4 forLayout:(id)a5
{
  if (protocol_isEqual((Protocol *)a4, (Protocol *)&OBJC_PROTOCOL___THWWidgetStackHosting))
    return self;
  else
    return 0;
}

- (void)interactiveCanvasController:(id)a3 activateProgressForRep:(id)a4
{
  -[THDocumentViewController p_activateProgressForRep:](self, "p_activateProgressForRep:", a4);
}

- (void)interactiveCanvasController:(id)a3 progressDidChangeForRep:(id)a4 percent:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_126E4;
  v5[3] = &unk_426FD0;
  v5[4] = a5;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", objc_msgSend(a4, "info", a3), v5);
}

- (void)interactiveCanvasController:(id)a3 scoreDidChangeForRep:(id)a4 score:(id)a5 total:(id)a6
{
  _QWORD v6[6];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_127C0;
  v6[3] = &unk_426EF0;
  v6[4] = a5;
  v6[5] = a6;
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", objc_msgSend(a4, "info", a3), v6);
}

- (void)interactiveCanvasController:(id)a3 resetAttemptForRep:(id)a4
{
  -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", objc_msgSend(a4, "info", a3), &stru_427010);
}

- (void)selectionDidChange
{
  if (objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"), "selection"))
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "resumeEditing");
  }
}

- (void)interactiveCanvasControllerWillScroll:(id)a3
{
  _QWORD v4[5];

  objc_msgSend(a3, "contentOffset");
  -[THDocumentViewController setLastScrollOffset:](self, "setLastScrollOffset:");
  -[THBookNavigation vantageWillChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonScrolling"));
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_129A8;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v4, &stru_427050, 0.05, 0.0);
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateScrollToVisibleUnscaledRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  id v10;
  THSectionController *v11;
  double v12;
  double v13;
  double v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    objc_msgSend(a3, "pushThreadedLayoutAndRenderDisabled");
    -[THDocumentViewController p_fixScrollViewToMatchCanvas](self, "p_fixScrollViewToMatchCanvas");

    self->mLayoutAnchor = 0;
    v10 = -[THSectionController layoutAnchorForContentOffset:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "layoutAnchorForContentOffset:", x, y);
    v11 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    objc_msgSend(a3, "visibleHeight");
    v13 = v12;
    objc_msgSend(a3, "visibleHeight");
    -[THSectionController layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:](v11, "layoutContentAtLayoutAnchor:padAbove:padBelow:layoutController:", v10, objc_msgSend(a3, "layoutController"), v13, v14 + v14);
    self->mScrollTargetRect.origin.x = x;
    self->mScrollTargetRect.origin.y = y;
    self->mScrollTargetRect.size.width = width;
    self->mScrollTargetRect.size.height = height;
    objc_msgSend(a3, "popThreadedLayoutAndRenderDisabled");
  }
  -[THBookNavigation vantageWillChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonScrolling"));
}

- (void)interactiveCanvasControllerDidEndScrollingAnimation:(id)a3 stillAnimating:(BOOL)a4
{
  CGSize size;
  _QWORD v6[5];

  size = CGRectNull.size;
  self->mScrollTargetRect.origin = CGRectNull.origin;
  self->mScrollTargetRect.size = size;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode", a3, a4))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12B70;
    v6[3] = &unk_426DD0;
    v6[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v6, &stru_427070, 0.05, 0.0);
  }
}

- (void)interactiveCanvasControllerDidStopScrolling:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  THBookNavigation *v13;
  double v15;
  double v16;
  _QWORD v17[5];

  -[THPageViewProvider canvasDidStopScrolling](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "canvasDidStopScrolling");
  objc_msgSend(a3, "contentOffset");
  v6 = v5;
  v8 = v7;
  -[THDocumentViewController lastScrollOffset](self, "lastScrollOffset");
  v10 = v9;
  v12 = v11;
  v13 = -[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate");
  if (v10 == v6 && v12 == v8)
    -[THBookNavigation vantageChangeWasCancelledBy:reason:](v13, "vantageChangeWasCancelledBy:reason:", self, CFSTR("THVantageChangeReasonScrolling"));
  else
    -[THBookNavigation vantageDidChangeBy:reason:](v13, "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonScrolling"));
  if (-[THDocumentViewController justUpdatedPresentationType](self, "justUpdatedPresentationType")
    || (-[THDocumentViewController lastScrollOffset](self, "lastScrollOffset"), v16 == v6) && v15 == v8)
  {
    -[THDocumentViewController setJustUpdatedPresentationType:](self, "setJustUpdatedPresentationType:", 0);
  }
  else
  {
    -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
  }
  -[THDocumentViewController p_visibleRectChanged](self, "p_visibleRectChanged");
  -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:", 0, 0);
  -[THDocumentViewController p_updateBookmarkAffordances](self, "p_updateBookmarkAffordances");
  -[BCDisplaySleepController userInteractionOccurred](-[THDocumentViewController displaySleepController](self, "displaySleepController"), "userInteractionOccurred");
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    if (CGRectIsNull(self->mScrollTargetRect))
    {
      -[THDocumentViewController p_fixScrollViewToMatchCanvas](self, "p_fixScrollViewToMatchCanvas");
      -[THDocumentViewController p_removeCanvasTransform](self, "p_removeCanvasTransform");
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_12D40;
    v17[3] = &unk_426DD0;
    v17[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v17, &stru_427090, 0.05, 0.0);
  }
  -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 1);
  -[THDocumentViewController setLastScrollOffset:](self, "setLastScrollOffset:", v6, v8);
}

- (void)p_visibleRectChanged
{
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    if (!-[THDocumentViewController isRotating](self, "isRotating"))
      -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
  }
}

- (BOOL)p_isPageLocationApplicable
{
  THPresentationType *v3;

  v3 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
  if (v3)
    LOBYTE(v3) = !-[THDocumentViewController isRotating](self, "isRotating");
  return (char)v3;
}

- (void)p_updatePageNumberingForce:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _BOOL4 v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  THPageNumberView *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  v3 = a3;
  if (!-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded")
    || !-[THDocumentViewController p_isPageLocationApplicable](self, "p_isPageLocationApplicable"))
  {
    return;
  }
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    if (-[THDocumentViewController lastPageNumberUpdate](self, "lastPageNumberUpdate"))
    {
      -[NSDate timeIntervalSinceNow](-[THDocumentViewController lastPageNumberUpdate](self, "lastPageNumberUpdate"), "timeIntervalSinceNow");
      v6 = v5 < -2.0;
      if (v5 >= -2.0 && !v3)
      {
        v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_34:
        v17 = 1;
        goto LABEL_38;
      }
    }
    else
    {
      v6 = 1;
    }
    v7 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
    -[THPageNumberView setPageNumberText:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumberText:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageNumberStringForAbsolutePageIndex:forPresentationType:", v7, -[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "presentationType")));
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v7 + 1;
    if (-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController")
      && !-[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete"))
    {
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v16 = (uint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
    -[BKScrubberControl setPageNumber:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageNumber:", v15);
    -[BKScrubberControl setPageCount:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageCount:", v16);
    -[THPageNumberView setPageNumber:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageNumber:", v15);
    -[THPageNumberView setPageCount:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageCount:", v16);
    if (!v6)
      goto LABEL_34;
    -[THDocumentViewController setLastPageNumberUpdate:](self, "setLastPageNumberUpdate:", +[NSDate date](NSDate, "date"));
LABEL_37:
    v17 = 0;
    goto LABEL_38;
  }
  if (-[THDocumentViewController isEpub](self, "isEpub"))
  {
    if (-[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete"))
    {
      v7 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
      v8 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
      -[BKScrubberControl setPageCount:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageCount:", v8);
      -[THPageNumberView setPageCount:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageCount:", v8);
      -[THPageNumberView setPageCount:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageCount:", v8);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        v9 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v9 = v7 + 1;
      -[BKScrubberControl setPageNumber:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageNumber:", v9);
      -[THPageNumberView setPageNumber:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumber:", v9);
      v10 = -[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView");
      v11 = v9;
    }
    else
    {
      -[BKScrubberControl setPageCount:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageCount:", 1);
      -[BKScrubberControl setPageNumber:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageNumber:", 1);
      v7 = 0x7FFFFFFFFFFFFFFFLL;
      -[THPageNumberView setPageCount:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageCount:", 0x7FFFFFFFFFFFFFFFLL);
      -[THPageNumberView setPageNumber:](-[THDocumentViewController contentPageNumberView](self, "contentPageNumberView"), "setPageNumber:", 0x7FFFFFFFFFFFFFFFLL);
      -[THPageNumberView setPageCount:](-[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView"), "setPageCount:", 0x7FFFFFFFFFFFFFFFLL);
      v10 = -[THDocumentViewController navOverlayPageNumberView](self, "navOverlayPageNumberView");
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    -[THPageNumberView setPageNumber:](v10, "setPageNumber:", v11);
    goto LABEL_37;
  }
  if (-[THDocumentViewController useScrubber](self, "useScrubber"))
  {
    v12 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
    v7 = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v12 + 1;
    if (-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController")
      && !-[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete"))
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v14 = (uint64_t)objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "pageCount");
    }
    -[BKScrubberControl setPageNumber:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageNumber:", v13);
    -[BKScrubberControl setPageCount:](-[THDocumentViewController scrubber](self, "scrubber"), "setPageCount:", v14);
    goto LABEL_37;
  }
  v17 = 0;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_38:
  if (-[THDocumentViewController isEpub](self, "isEpub")
    && -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete")&& (!-[THDocumentViewController inFlowMode](self, "inFlowMode")|| ((v17 | !-[THDocumentViewController inFlowMode](self, "inFlowMode")) & 1) == 0))
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
    v18 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "absolutePageRangeForPresentationType:", +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "context")));
    if (v19 != 0x7FFFFFFFFFFFFFFFLL && v18 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = (uint64_t)v18 + v19 + ~v7;
      if (v20 >= 0)
      {
        if (v20 == 1)
        {
          v21 = -[THDocumentReflowableLayoutConfiguration singularPagesLeftInChapterWithRemainingPageCount:](-[THDocumentViewController configuration](self, "configuration"), "singularPagesLeftInChapterWithRemainingPageCount:", 1);
        }
        else if (v20)
        {
          v21 = -[THDocumentReflowableLayoutConfiguration pluralPagesLeftInChapterWithRemainingPageCount:](-[THDocumentViewController configuration](self, "configuration"), "pluralPagesLeftInChapterWithRemainingPageCount:", v20);
        }
        else
        {
          v21 = -[THDocumentReflowableLayoutConfiguration lastPageInChapterString](-[THDocumentViewController configuration](self, "configuration"), "lastPageInChapterString");
        }
        if (v21)
          -[THToolbarDelegate textForPagesLeftInChapterDidChangeTo:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "textForPagesLeftInChapterDidChangeTo:", v21);
      }
    }
  }
}

- (void)interactiveCanvasControllerDidScroll:(id)a3
{
  _QWORD v5[5];

  if (!self->mPreventScrollViewDidScrollReentrance)
  {
    if ((objc_msgSend(a3, "isOverscrolling") & 1) == 0)
    {
      -[THDocumentViewController setOrientationAnchor:](self, "setOrientationAnchor:", 0);
      if (-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController") != a3)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController interactiveCanvasControllerDidScroll:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4425, CFSTR("bad canvas"));
      if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
      {
        if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
        {
          v5[0] = _NSConcreteStackBlock;
          v5[1] = 3221225472;
          v5[2] = sub_1334C;
          v5[3] = &unk_426DD0;
          v5[4] = a3;
          objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "accessController"), "performWrite:", v5);
        }
      }
      else
      {
        -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 0);
      }
      if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
        -[THDocumentViewController p_visibleRectChanged](self, "p_visibleRectChanged");
    }
    -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:", 1, 0);
  }
}

- (void)interactiveCanvasControllerDidLayoutAndRenderOnBackgroundThread:(id)a3
{
  if ((objc_msgSend(a3, "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0
    && (objc_msgSend(a3, "isOverscrolling") & 1) == 0)
  {
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode") && CGRectIsNull(self->mScrollTargetRect))
      -[THDocumentViewController p_fixScrollViewToMatchCanvas](self, "p_fixScrollViewToMatchCanvas");
    -[THDocumentViewController p_visibleRectChanged](self, "p_visibleRectChanged");
    -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:", 0, 0);
  }
  -[THPageViewProvider canvasDidLayoutAndRenderOnBackgroundThread](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "canvasDidLayoutAndRenderOnBackgroundThread");
}

- (void)p_updateBookmarkAffordances
{
  -[THToolbarDelegate updateBookmarkButton](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "updateBookmarkButton");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "updateBookmarkStatusAnimated:", 0);
}

- (void)p_fixScrollViewToMatchCanvas
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CGAffineTransform v16;
  CGAffineTransform v17;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4494, CFSTR("This operation must only be performed on the main thread."));
  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4495, CFSTR("only for flow"));
  if (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4496, CFSTR("shouldn't fix scroll view while laying out in the background"));
  if (!CGRectIsNull(self->mScrollTargetRect))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_fixScrollViewToMatchCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4497, CFSTR("shouldn't fixup canvas size while animating to a target rect"));
  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "contentSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "bounds");
  if (v5 != v9 || v7 != v8)
  {
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "contentOffset");
    v12 = v11;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "fixFrameAndScrollView");
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "contentOffset");
    v14 = self->mCanvasYOffset + v13 - v12;
    self->mCanvasYOffset = v14;
    CGAffineTransformMakeTranslation(&v17, 0.0, v14);
    v15 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer");
    v16 = v17;
    objc_msgSend(v15, "setAffineTransform:", &v16);
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setContentInset:", -self->mCanvasYOffset, 0.0, self->mCanvasYOffset, 0.0);
    -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
  }
}

- (void)p_removeCanvasTransform
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4517, CFSTR("This operation must only be performed on the main thread."));
  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4518, CFSTR("only for flow"));
  if (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4519, CFSTR("shouldn't remove canvas transform while laying out in the background"));
  if (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4520, CFSTR("shouldn't change the content offset while scrolling"));
  if (!CGRectIsNull(self->mScrollTargetRect))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4521, CFSTR("shouldn't fixup canvas size while animating to a target rect"));
  v3 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "contentSize");
  v5 = v4;
  v7 = v6;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "bounds");
  if (v5 != v9 || v7 != v8)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_removeCanvasTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 4522, CFSTR("call p_fixupScrollViewToMatchCanvas before p_removeCanvasTransform"));
  if (self->mCanvasYOffset != 0.0)
  {
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
      self->mPreventScrollViewDidScrollReentrance = 1;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "contentOffset");
    v12 = v11;
    v14 = v13 - self->mCanvasYOffset;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", *(_QWORD *)&CGAffineTransformIdentity.a, *(_QWORD *)&CGAffineTransformIdentity.b, *(_QWORD *)&CGAffineTransformIdentity.c, *(_QWORD *)&CGAffineTransformIdentity.d, *(_QWORD *)&CGAffineTransformIdentity.tx, *(_QWORD *)&CGAffineTransformIdentity.ty), "layerHost"), "canvasLayer"), "setAffineTransform:", &v15);
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setContentInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v3], "setContentOffset:", v12, v14);
    self->mCanvasYOffset = 0.0;
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
      self->mPreventScrollViewDidScrollReentrance = 0;
    -[THDocumentViewController p_updateVerticalOverscrollTransform](self, "p_updateVerticalOverscrollTransform");
  }
}

- (void)p_updateVerticalOverscrollTransform
{
  CGAffineTransform v3[2];
  CGAffineTransform v4[2];
  CGAffineTransform v5;

  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeTranslation(&v5, 0.0, self->mCanvasYOffset);
  v4[1] = v5;
  v4[0] = v5;
  -[CALayer setAffineTransform:](-[UIView layer](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "layer"), "setAffineTransform:", v4);
  v3[1] = v5;
  v3[0] = v5;
  -[CALayer setAffineTransform:](-[UIView layer](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "layer"), "setAffineTransform:", v3);
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForClippingReps:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (CGRect)interactiveCanvasController:(id)a3 expandVisibleBoundsForTiling:(CGRect)a4
{
  return CGRectInset(a4, -a4.size.width, -a4.size.height);
}

- (CGRect)interactiveCanvasController:(id)a3 expandBoundsForHitTesting:(CGRect)a4
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect result;
  CGRect v48;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = TSDRectWithSize(-[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize"));
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "frame");
  v11 = TSDCenterRectOverRect(v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v44 = v11;
    v18 = v13;
    v19 = v15;
    v20 = v17;
    v21 = x;
    v22 = y;
    v23 = width;
    v24 = height;
    v26 = v25;
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    v28 = vabdd_f64(v26, v27);
    height = v24;
    width = v23;
    y = v22;
    x = v21;
    v17 = v20;
    v15 = v19;
    v13 = v18;
    v11 = v44;
    if (v28 < 0.00999999978)
    {
      -[THDocumentViewController p_currentSpreadSize](self, "p_currentSpreadSize");
      v11 = TSDFitOrFillSizeInRect(0);
      v13 = v29;
      v15 = v30;
      v17 = v31;
    }
  }
  objc_msgSend(-[THDocumentViewController view](self, "view"), "convertRect:toView:", objc_msgSend(a3, "canvasView"), v11, v13, v15, v17);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  if (!-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v48.origin.x = v33;
    v48.origin.y = v35;
    v48.size.width = v37;
    v48.size.height = v39;
    v46 = CGRectUnion(v45, v48);
    v33 = v46.origin.x;
    v35 = v46.origin.y;
    v37 = v46.size.width;
    v39 = v46.size.height;
  }
  v40 = v33;
  v41 = v35;
  v42 = v37;
  v43 = v39;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (void)interactiveCanvasController:(id)a3 layoutRegistered:(id)a4
{
  void *v5;

  v5 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetLayout, a4);
  if (v5)
    objc_msgSend(v5, "setDelegate:", self);
}

- (CGRect)scrollViewClippingBoundsForInteractiveCanvasController:(id)a3
{
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize", a3);
  v4 = TSDRectWithSize(objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds"));
  TSDRectWithSize(v5);
  v6 = TSDCenterRectOverRect(v4);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)interactiveCanvasController:(id)a3 infoForModel:(id)a4 withSelection:(id)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v8 = objc_opt_class(NSObject, a2);
  v9 = (void *)TSUClassAndProtocolCast(a4, v8, 1);
  v11 = objc_opt_class(THWPStorage, v10);
  v12 = TSUDynamicCast(v11, a4);
  if (v12
    && (v14 = v12, v15 = objc_opt_class(TSWPSelection, v13),
                   (v16 = (void *)TSUDynamicCast(v15, a5)) != 0))
  {
    return -[THSectionController bodyInfoForStorage:charIndex:](-[THDocumentViewController activeSectionController](self, "activeSectionController", &OBJC_PROTOCOL___TSDInfo), "bodyInfoForStorage:charIndex:", v14, objc_msgSend(v16, "range"));
  }
  else
  {
    return v9;
  }
}

- (BOOL)canCopy
{
  uint64_t v3;

  v3 = objc_opt_class(THWPEditingController, a2);
  return objc_msgSend((id)TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor")), "canCopy");
}

- (void)copySelection
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_class(THWPEditingController, a2);
  v4 = (void *)TSUDynamicCast(v3, objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor"));
  objc_msgSend(v4, "copy:", self);
}

- (void)p_canvasDidZoom
{
  _BOOL8 v3;

  v3 = -[THDocumentViewController shouldPagingBeEnabled](self, "shouldPagingBeEnabled");
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setPagingEnabled:", v3);
  -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
  -[THDocumentViewController p_fireCanvasDidZoomCompletion](self, "p_fireCanvasDidZoomCompletion");
  -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:", 0, 0);
}

- (void)interactiveCanvasControllerWillZoom:(id)a3
{
  THPageViewDisplacement *mPageViewDisplacement;
  _QWORD v5[5];

  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement", a3))
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_140F4;
    v5[3] = &unk_426EA0;
    v5[4] = self;
    -[THPageViewDisplacement animateShowWithDuration:forPageIndex:enumerator:](mPageViewDisplacement, "animateShowWithDuration:forPageIndex:enumerator:", -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex"), v5, 0.1);
  }
}

- (void)interactiveCanvasControllerDidZoom:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  THPageViewDisplacement *mPageViewDisplacement;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[5];

  -[THDocumentViewController p_canvasDidZoom](self, "p_canvasDidZoom", a3);
  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    -[THDocumentViewController fitWidthViewScale](self, "fitWidthViewScale");
    v5 = v4;
    -[THDocumentViewController fitHeightViewScale](self, "fitHeightViewScale");
    v7 = fmin(v5, v6);
    v8 = v7 + v7 * 0.1;
    mPageViewDisplacement = self->mPageViewDisplacement;
    v10 = -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex");
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    v12 = v11;
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_14318;
    v14[3] = &unk_426EA0;
    v14[4] = self;
    -[THPageViewDisplacement animateZoomWithDuration:initialPageIndex:minViewScale:maxViewScale:currentViewScale:enumerator:](mPageViewDisplacement, "animateZoomWithDuration:initialPageIndex:minViewScale:maxViewScale:currentViewScale:enumerator:", v10, v14, 0.1, v12, v8, v13);
  }
}

- (void)interactiveCanvasController:(id)a3 willAnimateToViewScale:(double)a4 withDuration:(double)a5 unscaledContentOffset:(CGPoint)a6
{
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  THPageViewDisplacement *mPageViewDisplacement;
  double v18;
  _QWORD v19[5];

  x = a6.x;
  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement", a3, a4, a5, a6.x, a6.y))
  {
    -[THDocumentViewController fitWidthViewScale](self, "fitWidthViewScale");
    v11 = v10;
    -[THDocumentViewController fitHeightViewScale](self, "fitHeightViewScale");
    v13 = fmin(v11, v12);
    v14 = v13 + v13 * 0.1;
    -[THDocumentViewController p_currentPageSize](self, "p_currentPageSize");
    *(float *)&v15 = x / v15;
    v16 = vcvtas_u32_f32(*(float *)&v15);
    mPageViewDisplacement = self->mPageViewDisplacement;
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_14534;
    v19[3] = &unk_426EA0;
    v19[4] = self;
    -[THPageViewDisplacement animateZoomWithDuration:initialPageIndex:minViewScale:maxViewScale:currentViewScale:enumerator:](mPageViewDisplacement, "animateZoomWithDuration:initialPageIndex:minViewScale:maxViewScale:currentViewScale:enumerator:", v16, v19, a5, v18, v14, a4);
  }
}

- (CGPoint)interactiveCanvasController:(id)a3 clampContentOffset:(CGPoint)a4 forViewScale:(double)a5
{
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  unsigned int v13;
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
  float v27;
  double v28;
  float v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  if (!self->mDisableContentOffsetClamping)
  {
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    if (vabdd_f64(a5, v10) < 0.00999999978)
    {
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
      v12 = v11;
      v13 = -[THDocumentViewController isTwoUp](self, "isTwoUp");
      v14 = v12 * 0.5;
      if (!v13)
        v14 = v12;
      x = v14 * floor((x + v14 * 0.5) / v14);
    }
    objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasLayer"), "minimumPinchViewScale");
    if (vabdd_f64(a5, v15) >= 0.00999999978)
    {
      -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
      v17 = v20;
      v19 = v21;
    }
    else
    {
      objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "frame");
      v17 = v16;
      v19 = v18;
    }
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "layerHost"), "canvasLayer"), "unscaledSize");
    v24 = TSDMultiplySizeScalar(v22, v23, a5);
    v26 = v25;
    v27 = v17;
    *(float *)&v25 = v24;
    v28 = fminf(v27, *(float *)&v25);
    v29 = v19;
    *(float *)&v25 = v26;
    v30 = fminf(v29, *(float *)&v25);
    v31 = OBJC_IVAR___TSADocumentViewController__scrollView;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
    v33 = (v28 - v32) * 0.5;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v31], "bounds");
    v35 = (v30 - v34) * 0.5;
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v31], "bounds");
    x = TSUClamp(x, v33, v24 - (v33 + v36));
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v31], "bounds");
    y = TSUClamp(y, v35, v26 - (v35 + v37));
  }
  v38 = x;
  v39 = y;
  result.y = v39;
  result.x = v38;
  return result;
}

- (double)interactiveCanvasController:(id)a3 adjustViewScale:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[THDocumentViewController fitWidthViewScale](self, "fitWidthViewScale", a3);
  v7 = v6;
  -[THDocumentViewController fitHeightViewScale](self, "fitHeightViewScale");
  v9 = vabdd_f64(a4, v7);
  if (vabdd_f64(a4, v8) >= 0.1)
    v8 = a4;
  if (v9 >= 0.1)
    v10 = v8;
  else
    v10 = v7;
  -[THDocumentViewController zoomedInViewScale](self, "zoomedInViewScale", v8);
  v12 = v11;
  -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
  return TSUClamp(v10, v13, v12);
}

- (double)nextCanvasViewScaleDetentForProposedViewScale:(double)a3 greater:(BOOL)a4
{
  _BOOL4 v4;
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

  v4 = a4;
  -[THDocumentViewController currentViewScale](self, "currentViewScale");
  v8 = v7;
  -[THDocumentViewController zoomedInViewScale](self, "zoomedInViewScale");
  v10 = v9;
  -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
  v12 = v11;
  -[THDocumentViewController fitWidthViewScale](self, "fitWidthViewScale");
  v14 = v13;
  -[THDocumentViewController fitHeightViewScale](self, "fitHeightViewScale");
  v16 = fmin(v14, v15);
  v17 = fmax(v14, v15);
  if (v4)
  {
    v18 = v12;
    if (v8 >= v12)
    {
      v18 = v16;
      if (v8 >= v16)
      {
        v18 = v17;
        if (v8 >= v17)
        {
          v18 = a3;
          if (v8 < v10)
            v18 = v10;
        }
      }
    }
  }
  else
  {
    v18 = v10;
    if (v8 <= v10)
    {
      v18 = v17;
      if (v8 <= v17)
      {
        v18 = v16;
        if (v8 <= v16)
        {
          v18 = a3;
          if (v8 > v12)
            v18 = v12;
        }
      }
    }
  }
  return TSUClamp(v18, v12, v10);
}

- (BOOL)interactiveCanvasControllerShouldUseGuidedPan:(id)a3 withMovementDirection:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  void *v9;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = objc_opt_class(THInteractiveCanvasController, a2);
  v9 = (void *)TSUDynamicCast(v8, a3);
  if (((objc_msgSend(v9, "isCompactWidth") & 1) != 0 || objc_msgSend(v9, "isCompactHeight"))
    && -[THGuidedPanController wantsToHandlePan](-[THDocumentViewController guidedPanController](self, "guidedPanController"), "wantsToHandlePan"))
  {
    return 1;
  }
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  v12 = v11;
  -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
  if (vabdd_f64(v12, v13) >= 0.00999999978)
    return 0;
  else
    return -[THRevealTOCPanController wantsToHandlePanInDirection:](-[THDocumentViewController revealTOCPanController](self, "revealTOCPanController"), "wantsToHandlePanInDirection:", x, y);
}

- (id)panGuideForInteractiveCanvasController:(id)a3 withMovementDirection:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v8;
  void *v9;
  id result;
  double v11;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  v8 = objc_opt_class(THInteractiveCanvasController, a2);
  v9 = (void *)TSUDynamicCast(v8, a3);
  if ((objc_msgSend(v9, "isCompactWidth") & 1) == 0 && !objc_msgSend(v9, "isCompactHeight")
    || !-[THGuidedPanController wantsToHandlePan](-[THDocumentViewController guidedPanController](self, "guidedPanController"), "wantsToHandlePan")|| (result = -[THDocumentViewController guidedPanController](self, "guidedPanController")) == 0)
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v12 = v11;
    -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
    if (vabdd_f64(v12, v13) < 0.00999999978
      && -[THRevealTOCPanController wantsToHandlePanInDirection:](-[THDocumentViewController revealTOCPanController](self, "revealTOCPanController"), "wantsToHandlePanInDirection:", x, y))
    {
      return -[THDocumentViewController revealTOCPanController](self, "revealTOCPanController");
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)interactiveCanvasControllerShouldDeferViewCreation:(id)a3
{
  return -[THDocumentViewController performanceMode](self, "performanceMode", a3) != 0;
}

- (void)guidedPanWillBegin
{
  _QWORD v3[5];

  -[THDocumentViewController setInGuidedPan:](self, "setInGuidedPan:", 1);
  -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_14BFC;
    v3[3] = &unk_426EA0;
    v3[4] = self;
    -[THPageViewDisplacement animateOpacityAndDisplaymentProgess:delay:duration:initialPageIndex:enumerator:](-[THDocumentViewController pageViewDisplacement](self, "pageViewDisplacement"), "animateOpacityAndDisplaymentProgess:delay:duration:initialPageIndex:enumerator:", -[THDocumentViewController currentRelativePageIndex](self, "currentRelativePageIndex"), v3, 0.0, 0.0, 0.15);
  }
}

- (void)guidedPanWillAnimateFrom:(id)a3 to:(id)a4 duration:(double)a5
{
  id v9;
  double v10;
  _QWORD v11[6];

  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement")
    && !objc_msgSend(a4, "guidedPanTargetKind"))
  {
    v9 = objc_msgSend(a4, "guidedPanRelativePageIndexWithController:", -[THDocumentViewController guidedPanController](self, "guidedPanController"));
    if (objc_msgSend(a3, "guidedPanTargetKind"))
      v10 = 0.2;
    else
      v10 = 0.5;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_14E18;
    v11[3] = &unk_427108;
    v11[4] = self;
    v11[5] = v9;
    -[THPageViewDisplacement animateOpacityAndDisplaymentProgess:delay:duration:initialPageIndex:enumerator:](-[THDocumentViewController pageViewDisplacement](self, "pageViewDisplacement"), "animateOpacityAndDisplaymentProgess:delay:duration:initialPageIndex:enumerator:", v9, v11, 1.0, v10 * a5, (1.0 - v10) * a5);
  }
}

- (void)guidedPanDidEnd
{
  -[THDocumentViewController p_canvasDidZoom](self, "p_canvasDidZoom");
  -[THDocumentViewController setInGuidedPan:](self, "setInGuidedPan:", 0);
}

- (int64_t)guidedPanPageIndexForLayout:(id)a3
{
  return -[THDocumentViewController p_relativePageIndexForPageInfo:](self, "p_relativePageIndexForPageInfo:", objc_msgSend(objc_msgSend(a3, "pageLayout"), "info"));
}

- (int)widgetLayoutMode:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)widgetLayoutIsCompact:(id)a3
{
  if (-[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight", a3))
    return 1;
  else
    return -[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth");
}

- (void)flowPageControllerWillChangeContentHeight:(id)a3
{
  THSectionController *v4;

  if (!self->mLayoutAnchor)
  {
    v4 = -[THDocumentViewController activeSectionController](self, "activeSectionController", a3);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "contentOffset");
    self->mLayoutAnchor = (THFlowLayoutAnchor *)-[THSectionController layoutAnchorForContentOffset:](v4, "layoutAnchorForContentOffset:");
  }
}

- (CGRect)flowPageController:(id)a3 overrideForBodyFrame:(CGRect)a4
{
  CGFloat height;
  double width;
  double y;
  double x;
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
  double v28;
  double v29;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (-[THDocumentViewController p_isCompactFlowPresentation](self, "p_isCompactFlowPresentation", a3)
    || -[THDocumentViewController isEpub](self, "isEpub"))
  {
    -[THDocumentViewController p_windowOrViewSize](self, "p_windowOrViewSize");
    v10 = v9;
    if (-[THDocumentViewController isEpub](self, "isEpub"))
    {
      -[THPresentationType contentInsets](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "contentInsets");
    }
    else
    {
      -[THDocumentReflowableLayoutConfiguration contentInsets](-[THDocumentViewController configuration](self, "configuration"), "contentInsets");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](-[THDocumentViewController configuration](self, "configuration"), "environment"), "safeAreaInsets");
      UIEdgeInsetsAdd(10, v14, v16, v18, v20, v21, v22, v23, v24);
    }
    x = v11;
    v25 = v12;
    y = y * (v10 / 768.0);
    if (-[THDocumentViewController isEpub](self, "isEpub"))
      y = y + 20.0;
    width = v10 - x - v25;
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

- (BOOL)flowPageController:(id)a3 isEdgeObscured:(unsigned int)a4
{
  UIUserInterfaceLayoutDirection v6;
  _BOOL4 v7;
  BOOL v8;

  v6 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3), "userInterfaceLayoutDirection");
  v7 = -[THDocumentViewController isEpub](self, "isEpub");
  if (v7)
  {
    if (a4 != 2 || v6 == UIUserInterfaceLayoutDirectionRightToLeft)
    {
      if (a4)
        v8 = 0;
      else
        v8 = v6 == UIUserInterfaceLayoutDirectionRightToLeft;
      LOBYTE(v7) = v8;
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (id)p_overscrollBarWithFrame:(CGRect)a3 chapterIndex:(unint64_t)a4 tocTile:(id)a5
{
  double height;
  double width;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  CGFloat v12;
  __CFAttributedString *Mutable;
  NSString *v14;
  __CFString *v15;
  CTFontRef UIFontForLanguage;
  id v17;
  CGColor *v18;
  NSUInteger v19;
  CGColor *v20;
  CGContext *CurrentContext;
  __int128 v22;
  const __CTLine *v23;
  CGAffineTransform v25;
  CFRange v26;
  CFRange v27;
  CFRange v28;
  CFRange v29;
  CGSize v30;
  CGRect ImageBounds;

  height = a3.size.height;
  width = a3.size.width;
  v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v9 = objc_msgSend(objc_msgSend(a5, "portraitEntries"), "count");
  if (v9)
    v9 = objc_msgSend(objc_msgSend(a5, "portraitEntries"), "objectAtIndex:", 0);
  v10 = objc_msgSend(v9, "sectionIdentifier");
  v12 = TSUScreenScale(v10, v11);
  v30.width = width;
  v30.height = height;
  UIGraphicsBeginImageContextWithOptions(v30, 0, v12);
  Mutable = CFAttributedStringCreateMutable(0, 0);
  CFAttributedStringBeginEditing(Mutable);
  if (v10 && objc_msgSend(v10, "length"))
  {
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Chapter %@"), &stru_43D7D8, 0), v10);
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v14, objc_msgSend(a5, "frontTitleText"));
  }
  else
  {
    v15 = (__CFString *)objc_msgSend(a5, "frontTitleText");
    v14 = 0;
  }
  v26.location = 0;
  v26.length = 0;
  CFAttributedStringReplaceString(Mutable, v26, v15);
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontEmphasizedSystem, 20.0, 0);
  v27.length = (CFIndex)-[__CFString length](v15, "length");
  v27.location = 0;
  CFAttributedStringSetAttribute(Mutable, v27, kCTFontAttributeName, UIFontForLanguage);
  v17 = -[__CFString length](v15, "length");
  v18 = -[UIColor CGColor](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.666666687, 1.0), "CGColor");
  v28.location = 0;
  v28.length = (CFIndex)v17;
  CFAttributedStringSetAttribute(Mutable, v28, kCTForegroundColorAttributeName, v18);
  if (v14)
  {
    v19 = -[NSString length](v14, "length");
    v20 = -[UIColor CGColor](+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.376470596, 1.0), "CGColor");
    v29.location = 0;
    v29.length = v19;
    CFAttributedStringSetAttribute(Mutable, v29, kCTForegroundColorAttributeName, v20);
  }
  CFRelease(UIFontForLanguage);
  CFAttributedStringEndEditing(Mutable);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v22 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v25.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CGContextSetTextMatrix(CurrentContext, &v25);
  CGContextTranslateCTM(CurrentContext, 0.0, height);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v23 = CTLineCreateWithAttributedString(Mutable);
  ImageBounds = CTLineGetImageBounds(v23, CurrentContext);
  CGContextSetTextPosition(CurrentContext, (width - ImageBounds.size.width) * 0.5, floor((height - ImageBounds.size.height) * 0.5));
  CTLineDraw(v23, CurrentContext);
  CFRelease(v23);
  CFRelease(Mutable);
  objc_msgSend(v8, "setImage:", UIGraphicsGetImageFromCurrentImageContext());
  UIGraphicsEndImageContext();
  return v8;
}

- (BOOL)p_canOverscroll
{
  double v4;
  double v5;
  double v6;

  if (-[THDocumentViewController isRotating](self, "isRotating"))
    return 0;
  -[THDocumentViewController currentViewScale](self, "currentViewScale");
  v5 = v4;
  -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
  return vabdd_f64(v5, v6) < 0.00999999978;
}

- (void)p_setupOverscrollViews
{
  unsigned int v3;
  __int128 v4;
  __int128 v5;
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  double v25;
  double v26;
  id v27;
  unint64_t v28;
  id v29;
  THOverscrollImageView *v30;
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
  id v46;
  id v47;
  unint64_t v48;
  id v49;
  double v50;
  UIImage *v51;
  double v52;
  double v53;
  THOverscrollImageView *v54;
  BOOL v55;
  unint64_t v56;
  UIImage *v57;
  double v58;
  double v59;
  THOverscrollImageView *v60;
  double v61;
  uint64_t v62;
  id v63;
  THOverscrollImageView *v64;
  id v65;
  double v66;
  CGPath *Mutable;
  double v68;
  id v69;
  id v70;
  unint64_t v71;
  UIImage *v72;
  double v73;
  double v74;
  double v75;
  THOverscrollImageView *v76;
  UIImage *v77;
  double v78;
  double v79;
  THOverscrollImageView *v80;
  double v81;
  _OWORD v82[3];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _OWORD v86[4];
  CGRect v87;

  v3 = -[THDocumentViewController p_canOverscroll](self, "p_canOverscroll");
  if (!v3)
  {
LABEL_52:
    v62 = v3 ^ 1;
    -[UIView setHidden:](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "setHidden:", v62);
    -[UIView setHidden:](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "setHidden:", v62);
    -[THOverscrollImageView setHidden:](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "setHidden:", v62);
    -[THOverscrollImageView setHidden:](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "setHidden:", v62);
    return;
  }
  v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v86[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v86[1] = v4;
  v86[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  -[CALayer setAffineTransform:](-[UIView layer](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "layer"), "setAffineTransform:", v86);
  v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v83 = *(_OWORD *)&CGAffineTransformIdentity.a;
  v84 = v5;
  v85 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  v82[0] = v83;
  v82[1] = v5;
  v82[2] = v85;
  -[CALayer setAffineTransform:](-[UIView layer](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "layer"), "setAffineTransform:", v82);
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (-[THDocumentViewController activeSectionController](self, "activeSectionController"))
  {
    -[THDocumentViewController p_desiredCanvasSize](self, "p_desiredCanvasSize");
    v9 = v8;
    v11 = v10;
    -[THDocumentViewController currentViewScale](self, "currentViewScale");
    width = TSDMultiplySizeScalar(v9, v11, v12);
    height = v13;
  }
  v14 = -[THDocumentViewController currentChapter](self, "currentChapter");
  if (v14 != self->mOverscrollViewChapterNumber)
  {
    -[THDocumentViewController p_releaseOverscrollViews](self, "p_releaseOverscrollViews");
    self->mOverscrollViewChapterNumber = v14;
  }
  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
    v16 = -[THDocumentViewController inFlowMode](self, "inFlowMode");
    v17 = OBJC_IVAR___TSADocumentViewController__scrollView;
    v18 = *(void **)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
    if (v16)
    {
      objc_msgSend(v18, "setAlwaysBounceHorizontal:", 0);
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "setAlwaysBounceVertical:", 1);
      -[THOverscrollImageView removeFromSuperview](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "removeFromSuperview");
      -[THOverscrollImageView removeFromSuperview](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "removeFromSuperview");
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "frame");
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "frame");
      v20 = v19;
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "frame");
      v22 = v21;
      v23 = height;
      v24 = v21;
      v25 = fmaxf(v23, v24);
      v26 = -20.0 - v21;
      if (v14 && !self->mTopOverscrollView && (v14 <= (unint64_t)objc_msgSend(v15, "count") || !v15))
      {
        self->mTopOverscrollView = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v26, v20, v22);
        -[UIView setBackgroundColor:](self->mTopOverscrollView, "setBackgroundColor:", -[THDocumentViewController backgroundColor](self, "backgroundColor"));
        v27 = -[THDocumentViewController p_overscrollBarWithFrame:chapterIndex:tocTile:](self, "p_overscrollBarWithFrame:chapterIndex:tocTile:", v14 - 1, objc_msgSend(v15, "objectAtIndex:", v14 - 1), 0.0, v22 + -48.0, v20, 48.0);
        objc_msgSend(v27, "setAutoresizingMask:", 12);
        -[UIView addSubview:](self->mTopOverscrollView, "addSubview:", v27);
      }
      if (!self->mBottomOverscrollView)
      {
        v28 = v14 + 1;
        if (v28 < (unint64_t)objc_msgSend(v15, "count") || !v15)
        {
          self->mBottomOverscrollView = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, v25 + 20.0, v20, v22);
          -[UIView setBackgroundColor:](self->mBottomOverscrollView, "setBackgroundColor:", -[THDocumentViewController backgroundColor](self, "backgroundColor"));
          v29 = -[THDocumentViewController p_overscrollBarWithFrame:chapterIndex:tocTile:](self, "p_overscrollBarWithFrame:chapterIndex:tocTile:", v28, objc_msgSend(v15, "objectAtIndex:", v28), 0.0, 0.0, v20, 48.0);
          objc_msgSend(v29, "setAutoresizingMask:", 36);
          -[UIView addSubview:](self->mBottomOverscrollView, "addSubview:", v29);
        }
      }
      if (!-[UIView superview](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "superview"))
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "addSubview:", -[THDocumentViewController topOverscrollView](self, "topOverscrollView"));
      if (!-[UIView superview](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "superview"))objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "addSubview:", -[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"));
      -[UIView setFrame:](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "setFrame:", 0.0, v26, v20, v22);
      v30 = -[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView");
      v31 = 0.0;
      v32 = v25 + 20.0;
      v33 = v20;
      v34 = v22;
    }
    else
    {
      objc_msgSend(v18, "setAlwaysBounceHorizontal:", 1);
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "setAlwaysBounceVertical:", 0);
      -[UIView removeFromSuperview](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "removeFromSuperview");
      -[UIView removeFromSuperview](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "removeFromSuperview");
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "bounds");
      v36 = v35;
      v38 = v37;
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "contentSize");
      if (v39 > 0.0)
      {
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "contentSize");
        v38 = v40;
      }
      v41 = 1.0;
      if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
      {
        if (-[THDocumentViewController p_isSinglePageChapter](self, "p_isSinglePageChapter"))
          v41 = 0.0;
        else
          v41 = 1.0;
      }
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
      if (v42 == 1.0)
        v43 = 0.0;
      else
        v43 = v41;
      v44 = v36 + v43;
      v45 = v43 - v44;
      if (v14 && !self->mLeftOverscrollView && (v14 <= (unint64_t)objc_msgSend(v15, "count") || !v15))
      {
        self->mLeftOverscrollView = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v43 - v44, 0.0, v44, v38);
        -[THOverscrollImageView setBackgroundColor:](self->mLeftOverscrollView, "setBackgroundColor:", -[THDocumentViewController backgroundColor](self, "backgroundColor"));
        objc_msgSend(-[THOverscrollImageView layer](self->mLeftOverscrollView, "layer"), "setZPosition:", -1.0);
        if (!-[THDocumentViewController isEpub](self, "isEpub"))
        {
          if (v15)
          {
            v46 = objc_msgSend(v15, "objectAtIndex:", v14 - 1);
            v47 = objc_msgSend(objc_msgSend(v46, "largerThumbs"), "count");
            if (v47)
            {
              v48 = (unint64_t)v47;
              if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
              {
                v49 = objc_msgSend(v46, "largerThumbs");
                v50 = (v44 - v44 * 0.5) * 0.5;
                if (v48 > 1)
                  v50 = v44 * 0.5;
                v81 = v50;
                v51 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(v49, "objectAtIndex:", v48 - 1)));
                CGRectMakeWithSize(v44, v38);
                v54 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v81, v52, v44 * 0.5, v53);
                -[THOverscrollImageView setImage:](v54, "setImage:", v51);
                -[THOverscrollImageView addSubview:](self->mLeftOverscrollView, "addSubview:", v54);
                v55 = v48 >= 2;
                v56 = v48 - 2;
                if (v55)
                {
                  v57 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v46, "largerThumbs"), "objectAtIndex:", v56)));
                  CGRectMakeWithSize(v44, v38);
                  v60 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", 0.0, v58, v44 * 0.5, v59);
                  -[THOverscrollImageView setImage:](v60, "setImage:", v57);
                  -[THOverscrollImageView addSubview:](self->mLeftOverscrollView, "addSubview:", v60);
                }
                else
                {
                  -[THOverscrollImageView setBackgroundColor:](self->mLeftOverscrollView, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
                }
              }
              else
              {
                -[THOverscrollImageView setImage:](self->mLeftOverscrollView, "setImage:", +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v46, "largerThumbs"), "objectAtIndex:", v48 - 1))));
              }
            }
          }
        }
      }
      v61 = width - v43;
      if (!self->mRightOverscrollView)
      {
        if (v14 + 1 >= (unint64_t)objc_msgSend(v15, "count") && v15)
        {
          v63 = objc_msgSend(objc_msgSend(objc_msgSend(v15, "objectAtIndex:", v14), "largerThumbs"), "count");
          if (!-[THDocumentViewController isEpub](self, "isEpub")
            && (!-[THDocumentViewController isTwoUp](self, "isTwoUp") || (unint64_t)v63 >= 2))
          {
            v64 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v61, 0.0, v44, v38);
            self->mRightOverscrollView = v64;
            -[THOverscrollImageView setClipsToBounds:](v64, "setClipsToBounds:", 1);
            v65 = -[THOverscrollImageView layer](self->mRightOverscrollView, "layer");
            objc_msgSend(v65, "setShadowColor:", -[UIColor CGColor](+[UIColor blackColor](UIColor, "blackColor"), "CGColor"));
            objc_msgSend(v65, "setShadowOffset:", 5.0, 0.0);
            LODWORD(v66) = 1050253722;
            objc_msgSend(v65, "setShadowOpacity:", v66);
            Mutable = CGPathCreateMutable();
            -[THOverscrollImageView bounds](self->mRightOverscrollView, "bounds");
            v87.origin.x = v68 + -10.0;
            v87.size.width = 10.0;
            CGPathAddRect(Mutable, 0, v87);
            objc_msgSend(v65, "setShadowPath:", Mutable);
            CGPathRelease(Mutable);
          }
        }
        else
        {
          self->mRightOverscrollView = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v61, 0.0, v44, v38);
          -[THOverscrollImageView setBackgroundColor:](self->mRightOverscrollView, "setBackgroundColor:", -[THDocumentViewController backgroundColor](self, "backgroundColor"));
          objc_msgSend(-[THOverscrollImageView layer](self->mRightOverscrollView, "layer"), "setZPosition:", -1.0);
          if (!-[THDocumentViewController isEpub](self, "isEpub"))
          {
            if (v15)
            {
              v69 = objc_msgSend(v15, "objectAtIndex:", v14 + 1);
              v70 = objc_msgSend(objc_msgSend(v69, "largerThumbs"), "count");
              if (v70)
              {
                v71 = (unint64_t)v70;
                if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
                {
                  v72 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v69, "largerThumbs"), "objectAtIndex:", 0)));
                  if (v71 <= 1)
                    v73 = (v44 - v44 * 0.5) * 0.5;
                  else
                    v73 = 0.0;
                  CGRectMakeWithSize(v44, v38);
                  v76 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v73, v74, v44 * 0.5, v75);
                  -[THOverscrollImageView setImage:](v76, "setImage:", v72);
                  -[THOverscrollImageView addSubview:](self->mRightOverscrollView, "addSubview:", v76);
                  if (v71 < 2)
                  {
                    -[THOverscrollImageView setBackgroundColor:](self->mRightOverscrollView, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
                  }
                  else
                  {
                    v77 = +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v69, "largerThumbs"), "objectAtIndex:", 1)));
                    CGRectMakeWithSize(v44, v38);
                    v80 = -[THOverscrollImageView initWithFrame:]([THOverscrollImageView alloc], "initWithFrame:", v44 * 0.5, v78, v44 * 0.5, v79);
                    -[THOverscrollImageView setImage:](v80, "setImage:", v77);
                    -[THOverscrollImageView addSubview:](self->mRightOverscrollView, "addSubview:", v80);
                  }
                }
                else
                {
                  -[THOverscrollImageView setImage:](self->mRightOverscrollView, "setImage:", +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", +[TSDBitmapImageProvider CGImageForImageData:](TSDBitmapImageProvider, "CGImageForImageData:", objc_msgSend(objc_msgSend(v69, "largerThumbs"), "objectAtIndex:", 0))));
                }
              }
            }
          }
        }
      }
      if (!-[THOverscrollImageView superview](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "superview"))objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "addSubview:", -[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"));
      if (!-[THOverscrollImageView superview](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "superview"))objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v17], "addSubview:", -[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"));
      -[THOverscrollImageView setFrame:](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "setFrame:", v45, 0.0, v44, v38);
      v30 = -[THDocumentViewController rightOverscrollView](self, "rightOverscrollView");
      v32 = 0.0;
      v31 = v61;
      v33 = v44;
      v34 = v38;
    }
    -[THOverscrollImageView setFrame:](v30, "setFrame:", v31, v32, v33, v34);
    -[THDocumentViewController p_updateVerticalOverscrollTransform](self, "p_updateVerticalOverscrollTransform");
    goto LABEL_52;
  }
}

- (void)p_releaseOverscrollViews
{
  -[UIView removeFromSuperview](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "removeFromSuperview");
  -[UIView removeFromSuperview](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "removeFromSuperview");
  -[THDocumentViewController setTopOverscrollView:](self, "setTopOverscrollView:", 0);
  -[THDocumentViewController setBottomOverscrollView:](self, "setBottomOverscrollView:", 0);
  -[THOverscrollImageView removeFromSuperview](-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"), "removeFromSuperview");
  -[THOverscrollImageView removeFromSuperview](-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"), "removeFromSuperview");
  -[THDocumentViewController setLeftOverscrollView:](self, "setLeftOverscrollView:", 0);
  -[THDocumentViewController setRightOverscrollView:](self, "setRightOverscrollView:", 0);
}

- (void)p_fadeOutOverscrollTransition
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"))
  {
    if (self->mOverscrollTransitionInProcess)
    {
      -[THDocumentViewController p_updateVisibleInfos](self, "p_updateVisibleInfos");
      v3[4] = self;
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_16150;
      v4[3] = &unk_426DD0;
      v4[4] = self;
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_1616C;
      v3[3] = &unk_427130;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v4, v3, 0.25, 0.0);
      self->mOverscrollTransitionInProcess = 0;
      -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
      -[THDocumentViewController setJustUpdatedPresentationType:](self, "setJustUpdatedPresentationType:", 0);
    }
  }
}

- (void)p_setupVerticalOverscrollTransitionAnimationToChapter:(id)a3
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _QWORD v14[6];
  _QWORD v15[5];

  v5 = -[THDocumentViewController view](self, "view");
  -[UIView frame](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "frame");
  objc_msgSend(v5, "convertRect:fromView:", *(_QWORD *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView]);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[UIView removeFromSuperview](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "removeFromSuperview");
  -[UIView setFrame:](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "setFrame:", v7, v9, v11, v13);
  objc_msgSend(-[THDocumentViewController view](self, "view"), "addSubview:", -[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"));
  -[THDocumentViewController p_verticalOverscrollAnimationDuration](self, "p_verticalOverscrollAnimationDuration");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_16310;
  v15[3] = &unk_426DD0;
  v15[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v15, &stru_427150);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_16380;
  v14[3] = &unk_426E28;
  v14[4] = self;
  v14[5] = a3;
  -[NSOperationQueue addOperation:](+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"), "addOperation:", +[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", v14));
}

- (void)p_verticalOverscrollSetPreviousChapterNavigationUnit:(id)a3
{
  THSectionController *v5;
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

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
  -[THDocumentViewController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", a3);
  -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
  -[THDocumentViewController updateVisibleInfos](self, "updateVisibleInfos");
  v5 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleHeight");
  -[THSectionController layoutContentFromBottom:layoutController:](v5, "layoutContentFromBottom:layoutController:", objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutController"), v6 + v6);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
  v7 = TSDRectWithSize(-[THDocumentViewController p_desiredCanvasSize](self, "p_desiredCanvasSize"));
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
  if (v13 > v14)
  {
    v15 = v13 - v14;
  }
  else
  {
    v14 = v13;
    v15 = v9;
  }
  -[THDocumentViewController p_setUnscaledCanvasRect:](self, "p_setUnscaledCanvasRect:", v7, v15, v11, v14);
}

- (void)p_verticalOverscrollPreviousChapter
{
  unint64_t v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[11];
  _QWORD v28[9];

  v3 = -[THDocumentViewController currentChapter](self, "currentChapter");
  if (v3 && v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", v3 - 1);
    if (v4)
    {
      v5 = v4;
      self->mOverscrollAnimationInProcess = 1;
      v6 = -[THDocumentViewController view](self, "view");
      -[UIView frame](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "frame");
      v7 = OBJC_IVAR___TSADocumentViewController__scrollView;
      objc_msgSend(v6, "convertRect:fromView:", *(_QWORD *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView]);
      v9 = v8;
      v11 = v10;
      v12 = v10 + v10;
      -[THDocumentViewController setOverscrollTransitionView:](self, "setOverscrollTransitionView:", objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v13, v14, v8, v10 + v10));
      -[UIView removeFromSuperview](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "removeFromSuperview");
      -[UIView setFrame:](-[THDocumentViewController topOverscrollView](self, "topOverscrollView"), "setFrame:", 0.0, 0.0, v9, v11);
      -[UIView addSubview:](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "addSubview:", -[THDocumentViewController topOverscrollView](self, "topOverscrollView"));
      objc_msgSend(-[THDocumentViewController view](self, "view"), "addSubview:", -[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"));
      objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
      v15 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView");
      objc_msgSend(v15, "removeFromSuperview");
      objc_msgSend(v15, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = v11 + 20.0;
      objc_msgSend(v15, "setFrame:", v16, v22);
      -[UIView addSubview:](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "addSubview:", v15);
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v7], "frame");
      v24 = v23;
      v26 = v25;
      -[THDocumentViewController setTopOverscrollView:](self, "setTopOverscrollView:", 0);
      -[THDocumentViewController p_verticalOverscrollAnimationDuration](self, "p_verticalOverscrollAnimationDuration");
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_16700;
      v28[3] = &unk_427178;
      v28[4] = self;
      v28[5] = v24;
      v28[6] = v26;
      *(double *)&v28[7] = v9;
      *(double *)&v28[8] = v12;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_16740;
      v27[3] = &unk_4271A0;
      *(double *)&v27[7] = v17;
      *(double *)&v27[8] = v22;
      v27[9] = v19;
      v27[10] = v21;
      v27[4] = v15;
      v27[5] = self;
      v27[6] = v5;
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v28, v27);
    }
  }
}

- (void)p_verticalOverscrollNextChapter
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  _QWORD v29[11];
  _QWORD v30[9];

  v3 = -[THDocumentViewController currentChapter](self, "currentChapter");
  v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v3 + 1;
    if (v5 < (unint64_t)objc_msgSend(v4, "count"))
    {
      v6 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", v5);
      if (v6)
      {
        v7 = v6;
        self->mOverscrollAnimationInProcess = 1;
        v8 = -[THDocumentViewController view](self, "view");
        -[UIView frame](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "frame");
        v9 = OBJC_IVAR___TSADocumentViewController__scrollView;
        objc_msgSend(v8, "convertRect:fromView:", *(_QWORD *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView]);
        v11 = v10;
        v13 = v12;
        v14 = v12 + v12;
        -[THDocumentViewController setOverscrollTransitionView:](self, "setOverscrollTransitionView:", objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v16, v15 - v12, v10, v12 + v12));
        -[UIView removeFromSuperview](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "removeFromSuperview");
        -[UIView setFrame:](-[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"), "setFrame:", 0.0, v13, v11, v13);
        -[UIView addSubview:](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "addSubview:", -[THDocumentViewController bottomOverscrollView](self, "bottomOverscrollView"));
        objc_msgSend(-[THDocumentViewController view](self, "view"), "addSubview:", -[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"));
        objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
        v17 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView");
        objc_msgSend(v17, "removeFromSuperview");
        objc_msgSend(v17, "frame");
        v19 = v18;
        v21 = v20;
        v23 = v22;
        v24 = v13 + -20.0 - v22;
        objc_msgSend(v17, "setFrame:", v18, v24);
        -[UIView addSubview:](-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView"), "addSubview:", v17);
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v9], "frame");
        v26 = v25;
        v28 = v27 - v13;
        -[THDocumentViewController setBottomOverscrollView:](self, "setBottomOverscrollView:", 0);
        -[THDocumentViewController p_verticalOverscrollAnimationDuration](self, "p_verticalOverscrollAnimationDuration");
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_16B2C;
        v30[3] = &unk_427178;
        v30[4] = self;
        v30[5] = v26;
        *(double *)&v30[6] = v28;
        *(double *)&v30[7] = v11;
        *(double *)&v30[8] = v14;
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_16B6C;
        v29[3] = &unk_4271A0;
        *(double *)&v29[7] = v19;
        *(double *)&v29[8] = v24;
        v29[9] = v21;
        *(double *)&v29[10] = v23;
        v29[4] = v17;
        v29[5] = self;
        v29[6] = v7;
        +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v30, v29);
      }
    }
  }
}

- (void)p_animateHorizontalOverscrollToPageIndex:(unint64_t)a3 duration:(double)a4 animationCompletionBlock:(id)a5 layoutCompletionBlock:(id)a6
{
  unint64_t v11;
  id v12;
  uint64_t v13;
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
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  CABasicAnimation *v30;
  THPageViewProvider *mPageViewProvider;
  _QWORD v32[6];
  CATransform3D v33;
  CATransform3D v34;
  _QWORD v35[9];
  char v36;

  if (!-[THPresentationType isPaginated](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "isPaginated"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 5621, CFSTR("This animation is only supported in paginated layout."));
  v11 = -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex");
  v12 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", v11, -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
  v13 = OBJC_IVAR___TSADocumentViewController__scrollView;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "contentOffset");
  v15 = v14;
  v17 = v16;
  -[THSectionController canvasRectForRelativePageIndex:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "canvasRectForRelativePageIndex:", v12);
  v19 = v18;
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "setContentOffset:", v19 * v20, v17);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "contentOffset");
  v22 = v21 - v15;
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "bounds");
  if ((double)a3 <= (double)v11)
    v24 = v23;
  else
    v24 = -v23;
  if (vabdd_f64(v22, v24) >= 0.00999999978)
  {
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "pushLayoutDisabled");
    objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "setUserInteractionEnabled:", 0);
    v26 = objc_opt_class(THScrollView, v25);
    v27 = (void *)TSUCheckedDynamicCast(v26, *(_QWORD *)&self->TSADocumentViewController_opaque[v13]);
    v28 = v27;
    if (v27 && objc_msgSend(v27, "preventBounceAnimation"))
    {
      objc_msgSend(v28, "setPreventBounceAnimation:", 0);
      v29 = 1;
    }
    else
    {
      v29 = 0;
    }
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:", a4);
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_170EC;
    v35[3] = &unk_4271C8;
    v35[7] = a6;
    v35[8] = a3;
    v35[4] = self;
    v35[5] = v28;
    v36 = v29;
    v35[6] = a5;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v35);
    v30 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("sublayerTransform"));
    CATransform3DMakeTranslation(&v34, v22, 0.0, 0.0);
    -[CABasicAnimation setFromValue:](v30, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v34));
    CATransform3DMakeTranslation(&v33, v24, 0.0, 0.0);
    -[CABasicAnimation setToValue:](v30, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &v33));
    -[CABasicAnimation setTimingFunction:](v30, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
    -[CABasicAnimation setRemovedOnCompletion:](v30, "setRemovedOnCompletion:", 0);
    -[CABasicAnimation setFillMode:](v30, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v13], "layer"), "addAnimation:forKey:", v30, CFSTR("slide-pages"));
    if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
    {
      mPageViewProvider = self->mPageViewProvider;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_171B8;
      v32[3] = &unk_427240;
      v32[4] = self;
      *(double *)&v32[5] = a4;
      -[THPageViewProvider syncPerformBlock:](mPageViewProvider, "syncPerformBlock:", v32);
    }
    +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    if (a5)
      (*((void (**)(id))a5 + 2))(a5);
    -[THDocumentNavigator setVisibleAbsolutePhysicalPageIndex:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "setVisibleAbsolutePhysicalPageIndex:", a3);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutIfNeeded");
    +[CATransaction flush](CATransaction, "flush");
    if (a6)
      (*((void (**)(id))a6 + 2))(a6);
  }
}

- (void)p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:(unint64_t)a3
{
  _QWORD v5[5];
  _QWORD v6[5];

  self->mOverscrollAnimationInProcess = 1;
  -[THDocumentViewController p_horizontalOverscrollAnimationDuration](self, "p_horizontalOverscrollAnimationDuration");
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_17324;
  v6[3] = &unk_426DD0;
  v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_173D4;
  v5[3] = &unk_426DD0;
  -[THDocumentViewController p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:](self, "p_animateHorizontalOverscrollToPageIndex:duration:animationCompletionBlock:layoutCompletionBlock:", a3, v6, v5);
}

- (void)p_horizontalOverscrollPreviousChapter
{
  unint64_t v3;
  id v4;
  void *v5;
  THPresentationType *v6;

  if (!-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView")
    && (!-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController")
     || -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete")))
  {
    if (-[THDocumentViewController p_canOverscroll](self, "p_canOverscroll"))
    {
      if (-[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"))
      {
        v3 = -[THDocumentViewController currentChapter](self, "currentChapter");
        if (v3)
        {
          if (v3 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v4 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", v3 - 1);
            if (v4)
            {
              v5 = v4;
              -[THDocumentViewController setOverscrollTransitionView:](self, "setOverscrollTransitionView:", -[THDocumentViewController leftOverscrollView](self, "leftOverscrollView"));
              -[THDocumentViewController setLeftOverscrollView:](self, "setLeftOverscrollView:", 0);
              v6 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
              -[THDocumentViewController p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:](self, "p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:", objc_msgSend(v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", (char *)objc_msgSend(v5, "pageCountForPresentationType:", v6) - 1, v6));
            }
          }
        }
      }
    }
  }
}

- (void)p_horizontalOverscrollNextChapter
{
  unint64_t v3;
  id v4;
  unint64_t v5;
  id v6;
  void *v7;

  if (!-[THDocumentViewController overscrollTransitionView](self, "overscrollTransitionView")
    && (!-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController")
     || -[THReflowablePaginationController paginationComplete](-[THDocumentViewController reflowablePaginationController](self, "reflowablePaginationController"), "paginationComplete")))
  {
    if (-[THDocumentViewController p_canOverscroll](self, "p_canOverscroll"))
    {
      if (-[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"))
      {
        v3 = -[THDocumentViewController currentChapter](self, "currentChapter");
        v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles");
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v5 = v3 + 1;
          if (v5 < (unint64_t)objc_msgSend(v4, "count"))
          {
            v6 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", v5);
            if (v6)
            {
              v7 = v6;
              -[THDocumentViewController setOverscrollTransitionView:](self, "setOverscrollTransitionView:", -[THDocumentViewController rightOverscrollView](self, "rightOverscrollView"));
              -[THDocumentViewController setRightOverscrollView:](self, "setRightOverscrollView:", 0);
              -[THDocumentViewController p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:](self, "p_setupHorizontalOverscrollTransitionAnimationToAbsolutePageIndex:", objc_msgSend(v7, "absolutePageIndexForRelativePageIndex:forPresentationType:", 0, -[THDocumentViewController currentPresentationType](self, "currentPresentationType")));
            }
          }
        }
      }
    }
  }
}

- (void)p_pageLeft
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pageLeft");
}

- (void)p_pageRight
{
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pageRight");
}

- (void)presentSearchResultsForString:(id)a3
{
  -[THToolbarDelegate showSearchPopoverWithText:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "showSearchPopoverWithText:", a3);
}

- (BOOL)shouldEnableInspectorButton
{
  return 0;
}

- (void)showToolbarAnimated:(BOOL)a3
{
  -[THToolbarDelegate showToolbarAnimated:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "showToolbarAnimated:", a3);
  -[THDocumentViewController p_updatePageNumberViewVisibility](self, "p_updatePageNumberViewVisibility");
}

- (void)hideToolbarAnimated:(BOOL)a3
{
  -[THToolbarDelegate hideToolbarAnimated:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "hideToolbarAnimated:", a3);
  -[THDocumentViewController p_updatePageNumberViewVisibility](self, "p_updatePageNumberViewVisibility");
}

- (void)settingToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "updateBookmarkVisibleState");
  -[THDocumentViewController p_updateScrubberCheckToolbarState:](self, "p_updateScrubberCheckToolbarState:", 0);
  if (v4)
    -[THDocumentViewController setScrubberHiddenAnimated:](self, "setScrubberHiddenAnimated:", v5);
  else
    -[BKScrubberControl setHidden:](-[THDocumentViewController scrubber](self, "scrubber"), "setHidden:", v5);
}

- (void)setScrubberHiddenAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_17788;
  v3[3] = &unk_427268;
  v3[4] = self;
  v4 = a3;
  +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", -[THDocumentViewController scrubber](self, "scrubber"), 256, v3, 0, 0.25);
}

- (void)toggleToolbar
{
  if (!-[THDocumentViewController showingExpandedWidgetView](self, "showingExpandedWidgetView"))
  {
    if ((-[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden") & 1) != 0)-[THDocumentViewController showToolbarAnimated:](self, "showToolbarAnimated:", 1);
    else
      -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
  }
}

- (void)p_setUnscaledCanvasRect:(CGRect)a3
{
  -[THDocumentViewController p_setUnscaledCanvasRect:animated:](self, "p_setUnscaledCanvasRect:animated:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)p_setUnscaledCanvasRect:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if ((!-[THDocumentViewController inFlowMode](self, "inFlowMode")
     || objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "isLayoutDisabled"))&& -[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_setUnscaledCanvasRect:animated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 5885, CFSTR("don't jump to a new location on the canvas if layout is disabled (flow mode won't take it well)"));
  }
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {

    self->mLayoutAnchor = 0;
    self->mLayoutAnchor = (THFlowLayoutAnchor *)-[THSectionController layoutAnchorForContentOffset:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "layoutAnchorForContentOffset:", x, y);
  }
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
  -[THSectionController ensureLayoutThroughRect:pad:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "ensureLayoutThroughRect:pad:", -[THDocumentViewController p_activePagePaddingOptions](self, "p_activePagePaddingOptions"), x, y, width, height);
  -[THDocumentViewController p_updateCanvasSize](self, "p_updateCanvasSize");
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setContentOffset:clamp:animated:", 1, v4, x, y);
  -[THDocumentViewController p_visibleRectChanged](self, "p_visibleRectChanged");
  if ((objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyWaitingOnThreadedLayoutAndRender") & 1) == 0)
  {
    -[THDocumentViewController p_updateBookmarkAffordances](self, "p_updateBookmarkAffordances");
    -[BCDisplaySleepController userInteractionOccurred](-[THDocumentViewController displaySleepController](self, "displaySleepController"), "userInteractionOccurred");
  }
}

- (void)p_clearCanvas
{
  if (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "staticLayoutAndRenderOnThread"))objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_clearCanvas]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 5919, CFSTR("Clearing canvas during a static layout and render"));
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);
  -[THDocumentViewController setVisibleRelativePageRange:](self, "setVisibleRelativePageRange:", NSInvalidRange[0], NSInvalidRange[1]);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "pushThreadedLayoutAndRenderDisabled");
  -[THPageViewProvider updateWithInfosToDisplay:](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "updateWithInfosToDisplay:", 0);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setInfosToDisplay:", +[NSArray array](NSArray, "array"));
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "popThreadedLayoutAndRenderDisabled");
}

- (id)currentContentNode
{
  return -[THDocumentNavigator currentContentNode](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "currentContentNode");
}

- (double)p_horizontalOverscrollAnimationDuration
{
  _BOOL4 IsVoiceOverRunning;
  double result;

  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  result = 0.5;
  if (IsVoiceOverRunning)
    return 0.0;
  return result;
}

- (double)p_verticalOverscrollAnimationDuration
{
  _BOOL4 IsVoiceOverRunning;
  double result;

  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  result = 0.75;
  if (IsVoiceOverRunning)
    return 0.0;
  return result;
}

- (void)followAbsolutePageIndex:(unint64_t)a3
{
  id v5;
  id v6;

  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "contentNodeForAbsolutePageIndex:", a3);
    -[THDocumentViewController p_ensureInNavigationUnitForContentNode:](self, "p_ensureInNavigationUnitForContentNode:", v5);
    v6 = objc_msgSend(v5, "storageAnchorForNodeRelativePageIndex:", objc_msgSend(v5, "relativePageIndexForAbsolutePageIndex:forPresentationType:", a3, +[THPresentationType paginatedPresentationTypeInContext:](THPresentationType, "paginatedPresentationTypeInContext:", -[THPresentationType context](-[THDocumentViewController currentPresentationType](self, "currentPresentationType"), "context"))));
    objc_msgSend(v6, "setAbsolutePageIndex:", a3);
    -[THDocumentViewController followAnchor:pulse:](self, "followAnchor:pulse:", v6, 0);
  }
}

- (BOOL)followAnchor:(id)a3 pulse:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  uint64_t v11;

  if (a3)
  {
    v4 = a4;
    if (-[THDocumentViewController isEpub](self, "isEpub"))
    {
      v8 = objc_opt_class(THModelStorageAnchor, v7);
      -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", TSUDynamicCast(v8, a3));
      -[THDocumentViewController p_updatePresentationTypeAnimated:](self, "p_updatePresentationTypeAnimated:", 0);
    }
    -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 1);
    v10 = -[THDocumentNavigator followAnchor:pulse:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "followAnchor:pulse:", a3, v4);
    if (v10)
    {
      v11 = objc_opt_class(THModelStorageAnchor, v9);
      -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", TSUDynamicCast(v11, a3));
    }
    -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 1);
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)followLink:(id)a3
{
  return -[THDocumentViewController followLink:animated:](self, "followLink:animated:", a3, 1);
}

- (BOOL)followLink:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", a4);
  LOBYTE(v4) = -[THDocumentNavigator followLink:animated:](-[THDocumentViewController documentNavigator](self, "documentNavigator"), "followLink:animated:", a3, v4);
  -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 1);
  return v4;
}

- (id)anchorFromLink:(id)a3
{
  return -[THBookNavigation anchorFromLink:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "anchorFromLink:", a3);
}

- (void)showTOC
{
  -[THBookNavigation showTOC](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "showTOC");
}

- (void)closeDocument
{
  -[THBookNavigation closeDocument](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "closeDocument");
}

- (BOOL)isNotesFullscreenVisible
{
  return -[THBookNavigation isNotesFullscreenVisible](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "isNotesFullscreenVisible");
}

- (BOOL)isGlossaryVisible
{
  return -[THBookNavigation isGlossaryVisible](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "isGlossaryVisible");
}

- (void)showGlossaryViewWithAnchor:(id)a3
{
  -[THBookNavigation showGlossaryViewWithAnchor:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "showGlossaryViewWithAnchor:", a3);
}

- (id)bookLinkResolver
{
  return -[THBookNavigation bookLinkResolver](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "bookLinkResolver");
}

- (void)hideNavigationHistory
{
  -[THBookNavigation hideNavigationHistory](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "hideNavigationHistory");
}

- (void)documentNavigator:(id)a3 willNavigateToAbsolutePageIndex:(unint64_t)a4 inContentNode:(id)a5
{
  objc_msgSend(a5, "startLoading", a3, a4);
  objc_msgSend(a5, "waitUntilFinishedLoadingAndPaginating");
  -[THDocumentViewController p_ensureInNavigationUnitForContentNode:](self, "p_ensureInNavigationUnitForContentNode:", a5);
}

- (void)documentNavigator:(id)a3 scrollToAbsolutePageIndex:(unint64_t)a4 specificUnscaledCanvasRect:(CGRect)a5 animated:(BOOL)a6 willPulse:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL8 v8;
  double height;
  double width;
  double y;
  double x;

  v7 = a7;
  v8 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode", a3))
  {
    if (v7)
    {
      if (y + -100.0 >= 0.0)
        y = y + -100.0;
      else
        y = 0.0;
    }
    else if (!a4 && y <= 20.0 && -[THDocumentViewController isEpub](self, "isEpub"))
    {
      y = 0.0;
    }
  }
  -[THDocumentViewController p_setUnscaledCanvasRect:animated:](self, "p_setUnscaledCanvasRect:animated:", v8, x, y, width, height);
  -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", 0);
}

- (void)documentNavigator:(id)a3 failedToFollowLink:(id)a4
{
  -[THBookNavigation followLink:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate", a3), "followLink:", a4);
}

- (void)documentNavigator:(id)a3 failedToFollowAnchor:(id)a4 pulse:(BOOL)a5
{
  -[THBookNavigation followAnchor:pulse:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate", a3), "followAnchor:pulse:", a4, a5);
}

- (void)documentNavigator:(id)a3 didJumpToStorageAnchor:(id)a4 withWillJumpReturn:(BOOL)a5
{
  -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", a5, a4);
}

- (void)documentNavigator:(id)a3 willJumpToPageLocation:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate", a3), "willJumpToPageLocation:") & 1) != 0)-[THBookNavigation willJumpToPageLocation:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "willJumpToPageLocation:", a4);
}

- (void)documentNavigator:(id)a3 didJumpToPageLocation:(id)a4
{
  if ((objc_opt_respondsToSelector(-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate", a3), "didJumpToPageLocation:") & 1) != 0)-[THBookNavigation didJumpToPageLocation:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "didJumpToPageLocation:", a4);
  -[BCDisplaySleepController userInteractionOccurred](-[THDocumentViewController displaySleepController](self, "displaySleepController"), "userInteractionOccurred");
}

- (BOOL)documentNavigatorIsOnActiveCanvas:(id)a3
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_msgSend(-[THDocumentViewController viewIfLoaded](self, "viewIfLoaded", a3), "window"), "windowScene");
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, "activationState"))
      LOBYTE(v3) = objc_msgSend(v4, "activationState") == (char *)&dword_0 + 1;
    else
      LOBYTE(v3) = 1;
  }
  return (char)v3;
}

- (unint64_t)visiblePageCountForDocumentNavigator:(id)a3
{
  if (-[THDocumentViewController isTwoUp](self, "isTwoUp", a3))
    return 2;
  else
    return 1;
}

- (id)p_expandedViewControllerForRep:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  THWiOSExpandedMovieViewController *v14;

  v5 = objc_opt_class(THWMovieInfo, a2);
  v6 = (void *)TSUDynamicCast(v5, objc_msgSend(a3, "expandedContentDrawableToPresent"));
  v8 = objc_opt_class(THWDrawablesWidgetInfo, v7);
  v9 = (void *)TSUDynamicCast(v8, objc_msgSend(a3, "info"));
  v11 = objc_opt_class(THWMovieInfo, v10);
  v12 = (void *)TSUDynamicCast(v11, objc_msgSend(v9, "expandedStageDrawable"));
  if ((!v6 || objc_msgSend(v6, "isAudioOnly"))
    && (!v12 || (objc_msgSend(v12, "isAudioOnly") & 1) != 0))
  {
    return -[THWiOSExpandedViewController initWithDocumentRoot:expandableRep:delegate:]([THWiOSExpandedViewController alloc], "initWithDocumentRoot:expandableRep:delegate:", -[THDocumentViewController documentRoot](self, "documentRoot"), a3, self);
  }
  v14 = -[THWiOSExpandedMovieViewController initWithDocumentRoot:expandableRep:delegate:]([THWiOSExpandedMovieViewController alloc], "initWithDocumentRoot:expandableRep:delegate:", -[THDocumentViewController documentRoot](self, "documentRoot"), a3, self);
  objc_msgSend(-[THDocumentViewController parentViewController](self, "parentViewController"), "addChildViewController:", v14);
  return v14;
}

- (void)presentRepExpanded:(id)a3
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentRepExpanded:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6208, CFSTR("This operation must only be performed on the main thread."));
  if (a3)
  {
    if (!self->mExpandedViewController)
      -[THDocumentViewController presentExpandedViewController:completionBlock:](self, "presentExpandedViewController:completionBlock:", -[THDocumentViewController p_expandedViewControllerForRep:](self, "p_expandedViewControllerForRep:", a3), 0);
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentRepExpanded:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6209, CFSTR("invalid nil value for '%s'"), "expandableRep");
  }
}

- (void)presentExpandedViewController:(id)a3 completionBlock:(id)a4
{
  _QWORD v6[6];

  -[THDocumentViewController setExpandedViewController:](self, "setExpandedViewController:", a3);
  -[THDocumentViewController refreshStatusBarAppearance](self, "refreshStatusBarAppearance");
  objc_msgSend(-[THDocumentViewController view](self, "view"), "setUserInteractionEnabled:", 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_18328;
  v6[3] = &unk_427290;
  v6[4] = self;
  v6[5] = a4;
  -[THWExpandedViewController presentExpandedAnimatedWithCompletionBlock:](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "presentExpandedAnimatedWithCompletionBlock:", v6);
}

- (BOOL)repIsPresentedExpanded:(id)a3
{
  THWExpandedViewController *v5;
  id v6;

  if (!objc_msgSend(a3, "info"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController repIsPresentedExpanded:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6235, CFSTR("invalid nil value for '%s'"), "expandableRep.info");
  v5 = -[THDocumentViewController expandedViewController](self, "expandedViewController");
  if (v5)
  {
    v6 = objc_msgSend(a3, "info");
    LOBYTE(v5) = v6 == objc_msgSend(-[THWExpandedViewController expandedRepSourceRep](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "expandedRepSourceRep"), "info");
  }
  return (char)v5;
}

- (CGSize)widgetHostExpandedSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "frame");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (id)p_pressableRepGestureRecognizer
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvasView"), "gestureRecognizers");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = *(_QWORD *)v11;
  v6 = (id)TSWPImmediatePress;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v5)
      objc_enumerationMutation(v2);
    v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v7);
    if (objc_msgSend(v8, "gestureKind") == v6)
      return v8;
    if (v4 == (id)++v7)
    {
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        goto LABEL_3;
      return 0;
    }
  }
}

- (void)presentPopoverForPopUpInfo:(id)a3 withFrame:(CGRect)a4 inLayer:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  void *v13;
  TSUColor *v14;
  uint64_t v15;
  uint64_t v16;
  THWPopUpContentProvider *v17;
  double v18;
  THWPopUpContentProvider *v19;
  TSWPopoverController *v20;
  id v21;
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
  TSWPopoverController *mPopUpPopoverController;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  _QWORD v39[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6264, CFSTR("This operation must only be performed on the main thread."));
    if (a3)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6265, CFSTR("invalid nil value for '%s'"), "popUp");
  if (a5)
  {
LABEL_4:
    if (!a3)
      return;
    goto LABEL_9;
  }
LABEL_8:
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6266, CFSTR("invalid nil value for '%s'"), "layer");
  if (!a3)
    return;
LABEL_9:
  if (-[TSWPopoverController popUpInfo](self->mPopUpPopoverController, "popUpInfo") != a3)
  {
    if (!objc_msgSend(a3, "frameViewSettings"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6271, CFSTR("invalid nil value for '%s'"), "popUp.frameViewSettings");
    if (!objc_msgSend(a3, "popoverTheme"))
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6272, CFSTR("invalid nil value for '%s'"), "popUp.popoverTheme");
    if (self->mPopUpPopoverController)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController presentPopoverForPopUpInfo:withFrame:inLayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6273, CFSTR("expected nil value for '%s'"), "mPopUpPopoverController");
    v12 = objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "themeProvider");
    if (v12 && (v13 = v12, objc_msgSend(v12, "forceThemeColors")))
      v14 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", objc_msgSend(v13, "backgroundColor"));
    else
      v14 = 0;
    objc_msgSend(a3, "updateBackgroundColor:", v14);
    v16 = objc_opt_class(TSWPEditingController, v15);
    objc_msgSend((id)TSUDynamicCast(v16, objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "editorController"), "textInputEditor")), "setSelection:", 0);
    v17 = [THWPopUpContentProvider alloc];
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
    v19 = -[THWPopUpContentProvider initWithPopUpInfo:scale:documentRoot:scrollableCanvasHost:bookNavigator:documentNavigator:](v17, "initWithPopUpInfo:scale:documentRoot:scrollableCanvasHost:bookNavigator:documentNavigator:", a3, -[THDocumentViewController documentRoot](self, "documentRoot"), self, self, -[THDocumentViewController documentNavigator](self, "documentNavigator"), v18);
    v20 = -[TSWPopoverController initWithContentProvider:]([TSWPopoverController alloc], "initWithContentProvider:", v19);
    self->mPopUpPopoverController = v20;
    -[TSWPopoverController setDelegate:](v20, "setDelegate:", self);

    v21 = -[THDocumentViewController p_pressableRepGestureRecognizer](self, "p_pressableRepGestureRecognizer");
    -[TSWPopoverController setPassThroughGestureRecognizers:](self->mPopUpPopoverController, "setPassThroughGestureRecognizers:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "panGestureRecognizer"), v21, 0));
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "window"), "statusBarMinDimension");
    v31 = v25 + v30;
    v32 = v29 - v30;
    mPopUpPopoverController = self->mPopUpPopoverController;
    objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), "layer"), "convertRect:fromLayer:", a5, x, y, width, height);
    -[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:](mPopUpPopoverController, "presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:", objc_msgSend(-[THDocumentViewController view](self, "view"), "superview"), 15, 1, 1, v34, v35, v36, v37, v23, v31, v27, v32);
    v38 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, a3);
    if (v38)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_18ABC;
      v39[3] = &unk_426EF0;
      v39[4] = v38;
      v39[5] = self;
      -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", v38, v39);
    }
  }
}

- (BOOL)widgetHostingAllowInteractionOnPageForRep:(id)a3
{
  if (-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth")
    || -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight"))
  {
    return objc_msgSend(a3, "widgetInteractionAllowOnPageForCompact");
  }
  else
  {
    return 1;
  }
}

- (BOOL)widgetHostingAllowAutoplayForRep:(id)a3
{
  if (-[THDocumentViewController th_cachedIsCompactWidth](self, "th_cachedIsCompactWidth")
    || -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight"))
  {
    return objc_msgSend(a3, "widgetInteractionAllowAutoplayForCompact");
  }
  else
  {
    return 1;
  }
}

- (BOOL)widgetHostingShouldAllowNaturalHorizontalScrollForRep:(id)a3
{
  _BOOL4 v4;

  v4 = -[THDocumentViewController inFlowMode](self, "inFlowMode", a3);
  if (v4)
    LOBYTE(v4) = -[THDocumentViewController isEpub](self, "isEpub");
  return v4;
}

- (BOOL)popoverController:(id)a3 shouldIgnorePassThroughGestureRecognizer:(id)a4
{
  BOOL result;
  id v7;
  double v8;
  double v9;
  TSWPopUpInfo *v10;

  result = 0;
  if (self->mPopUpPopoverController == a3
    && -[THDocumentViewController p_pressableRepGestureRecognizer](self, "p_pressableRepGestureRecognizer") == a4)
  {
    v7 = -[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController");
    objc_msgSend(a4, "locationInView:", objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"));
    objc_msgSend(v7, "convertBoundsToUnscaledPoint:");
    v10 = (TSWPopUpInfo *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "hitRep:allowsAllReps:", 1, v8, v9), "info")), "popUpInfo");
    if (!v10 || v10 == -[TSWPopoverController popUpInfo](self->mPopUpPopoverController, "popUpInfo"))
      return 1;
  }
  return result;
}

- (void)popoverControllerWillDismiss:(id)a3
{
  uint64_t v4;

  if (self->mPopUpPopoverController == a3)
  {
    v4 = TSUProtocolCast(&OBJC_PROTOCOL___TSDInfo, objc_msgSend(a3, "popUpInfo"));
    if (v4)
      -[THDocumentViewController p_getWidgetIDsForInfo:completion:](self, "p_getWidgetIDsForInfo:completion:", v4, &stru_4272B0);
    -[TSWPopoverController setDelegate:](self->mPopUpPopoverController, "setDelegate:", 0);

    self->mPopUpPopoverController = 0;
    objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "becomeFirstResponder");
  }
}

- (id)hostCanvasLayer
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer");
}

- (id)curtainColorForFreeTransform
{
  if (!-[THDocumentViewController expandedViewController](self, "expandedViewController"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController curtainColorForFreeTransform]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6451, CFSTR("invalid nil value for '%s'"), "self.expandedViewController");
  return -[THWExpandedViewController curtainColorForFreeTransform](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "curtainColorForFreeTransform");
}

- (CGRect)rectForCompletionAnimationWithRep:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(objc_msgSend(-[THDocumentViewController hostCanvasLayer](self, "hostCanvasLayer", a3), "superlayer"), "frame");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)freeTransformDidBeginWithRep:(id)a3 expandableRep:(id)a4
{
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformDidBeginWithRep:expandableRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6463, CFSTR("This operation must only be performed on the main thread."));
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformDidBeginWithRep:expandableRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6464, CFSTR("invalid nil value for '%s'"), "freeTransformableRep");
  -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 1);
  -[THDocumentViewController setExpandedViewController:](self, "setExpandedViewController:", -[THDocumentViewController p_expandedViewControllerForRep:](self, "p_expandedViewControllerForRep:", a4));
  self->mShowToolbarOnCancelFTC = -[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden") ^ 1;
  -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
}

- (void)freeTransformDidEndWithRep:(id)a3 expandableRep:(id)a4 completionBlock:(id)a5
{
  if (!-[THDocumentViewController expandedViewController](self, "expandedViewController", a3, a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformDidEndWithRep:expandableRep:completionBlock:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6477, CFSTR("invalid nil value for '%s'"), "self.expandedViewController");
  -[THDocumentViewController presentExpandedViewController:completionBlock:](self, "presentExpandedViewController:completionBlock:", -[THDocumentViewController expandedViewController](self, "expandedViewController"), a5);
}

- (void)freeTransformPostAnimationDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  if (!-[THDocumentViewController expandedViewController](self, "expandedViewController", a3, a4))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController freeTransformPostAnimationDidCancelWithRep:expandableRep:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6484, CFSTR("invalid nil value for '%s'"), "self.expandedViewController");
  -[THWExpandedViewController teardown](-[THDocumentViewController expandedViewController](self, "expandedViewController"), "teardown");

  self->mExpandedViewController = 0;
}

- (void)freeTransformDidCancelWithRep:(id)a3 expandableRep:(id)a4
{
  if (self->mShowToolbarOnCancelFTC)
    -[THDocumentViewController showToolbarAnimated:](self, "showToolbarAnimated:", 1, a4);
}

- (void)setPageBookmarked:(BOOL)a3 forPageRep:(id)a4
{
  -[THDocumentViewController setPageBookmarked:](self, "setPageBookmarked:", a3, a4);
}

- (BOOL)bookmarksShouldBeVisible
{
  unsigned int v3;
  id v4;

  v3 = objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB") ^ 1;
  v4 = -[THDocumentViewController im_ancestorViewControllerConformingToProtocol:](self, "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___THPageBookmarkVisibility);
  if ((objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB") & 1) == 0
    && v4)
  {
    LOBYTE(v3) = objc_msgSend(v4, "bookmarksShouldBeVisible");
  }
  return v3 & ~-[THDocumentViewController inFlowMode](self, "inFlowMode");
}

- (CGRect)bookmarkHotspotRegionForPage:(id)a3
{
  double x;
  CGFloat y;
  double width;
  CGFloat height;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (-[THToolbarDelegate isToolbarHidden](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "isToolbarHidden")&& -[THDocumentViewController isEpub](self, "isEpub")&& !-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    objc_msgSend(objc_msgSend(a3, "geometry"), "boundsBeforeRotation");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[THDocumentReflowableLayoutConfiguration bookmarkHotspotDimension](-[THDocumentViewController configuration](self, "configuration"), "bookmarkHotspotDimension");
    width = v17;
    v22.origin.x = v10;
    v22.origin.y = v12;
    v22.size.width = v14;
    v22.size.height = v16;
    x = CGRectGetMaxX(v22) - width;
    v23.origin.x = v10;
    v23.origin.y = v12;
    v23.size.width = v14;
    v23.size.height = v16;
    y = CGRectGetMinY(v23);
    height = width;
  }
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)p_canvasInfoForExpandedInfo:(id)a3 presentationType:(id)a4
{
  if (!objc_msgSend(a4, "isPaginated"))
    return -[THDocumentViewController p_expandableInfoForInfo:forceLoad:](self, "p_expandableInfoForInfo:forceLoad:", a3, 0);
  -[THDocumentViewController p_ownerInfoForPopUpInfo:](self, "p_ownerInfoForPopUpInfo:", a3);
  return a3;
}

- (id)p_contentNodeForInfo:(id)a3 presentationType:(id)a4
{
  uint64_t v5;
  void *v6;
  id result;

  while (1)
  {
    v5 = objc_opt_class(THModelPageInfo, a2);
    v6 = (void *)TSUDynamicCast(v5, a3);
    if (v6)
      break;
    result = objc_msgSend(a3, "parentInfo");
    a3 = result;
    if (!result)
      return result;
  }
  return objc_msgSend(v6, "parent");
}

- (UIView)rootSuperview
{
  return (UIView *)objc_msgSend(-[THDocumentViewController view](self, "view"), "superview");
}

- (UIView)expandedWindowHostView
{
  return (UIView *)objc_msgSend(-[THDocumentViewController view](self, "view"), "superview");
}

- (CGSize)windowMinSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)isFreeTransformInProgress
{
  return -[THWFreeTransformController isFreeTransformInProgress](-[THDocumentViewController ftc](self, "ftc"), "isFreeTransformInProgress");
}

- (id)expandableRepForInfo:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v5 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:createIfNeeded:", a3, 1);
  if (!v5)
  {
    v6 = -[THDocumentViewController p_expandableInfoForInfo:forceLoad:](self, "p_expandableInfoForInfo:forceLoad:", a3, 0);
    if (!v6
      || (v5 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", v6)) == 0)
    {
      v5 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", -[THDocumentViewController p_ownerInfoForPopUpInfo:](self, "p_ownerInfoForPopUpInfo:", a3));
    }
  }
  v7 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWPressableRep, v5);
  v9 = objc_opt_class(TSDRep, v8);
  v10 = (id)TSUClassAndProtocolCast(v5, v9, 1);
  if ((objc_opt_respondsToSelector(v7, "expandableRep") & 1) != 0)
    v10 = objc_msgSend(v7, "expandableRep", &OBJC_PROTOCOL___THWExpandableRep);
  if (v5)
  {
    if (!v10)
    {
      v12 = objc_opt_class(TSDRep, v11);
      v10 = (id)TSUClassAndProtocolCast(v5, v12, 1);
    }
  }
  if (v10)
    return v10;
  if (!objc_msgSend(a3, "parentInfo"))
    return 0;
  return -[THDocumentViewController expandableRepForInfo:](self, "expandableRepForInfo:", objc_msgSend(a3, "parentInfo"));
}

- (void)expandedViewControllerWillPresent:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "endEditing");
  -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 0);
  -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 1);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:withObject:", "expandedViewControllerWillPresent:", a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }
}

- (void)expandedViewControllerDidPresent:(id)a3
{
  -[THDocumentViewController setPagePaddingOptions:](self, "setPagePaddingOptions:", 0);
  -[THDocumentViewController hideToolbarAnimated:](self, "hideToolbarAnimated:", 1);
  -[THToolbarDelegate setToolbarHiddenFromAccessibility:](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "setToolbarHiddenFromAccessibility:", 1);
}

- (void)expandedViewControllerWillBeginDismissing:(id)a3
{
  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode", a3))
  {
    -[THDocumentViewController p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen](self, "p_ensureVisibleAbsolutePhysicalPageIndexFromFullscreen");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "forceStopScrolling");
  }
}

- (void)expandedViewControllerDidDismiss:(id)a3
{
  THDocumentViewController *v3;

  v3 = self;
  if (-[THDocumentViewController expandedViewController](self, "expandedViewController") == a3)
  {
    -[THWExpandedViewController setDelegate:](-[THDocumentViewController expandedViewController](v3, "expandedViewController"), "setDelegate:", 0);
    -[THWExpandedViewController teardown](v3->mExpandedViewController, "teardown");

    v3->mExpandedViewController = 0;
  }
  -[THDocumentViewController setPagePaddingOptions:](v3, "setPagePaddingOptions:", 3);
  if (-[THDocumentViewController inPaginatedMode](v3, "inPaginatedMode"))
    -[THDocumentViewController p_updateVisibleInfos](v3, "p_updateVisibleInfos");
  -[THDocumentViewController refreshStatusBarAppearance](v3, "refreshStatusBarAppearance");
  -[THDocumentViewController setLastAbsolutePageIndex:](v3, "setLastAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[THToolbarDelegate setToolbarHiddenFromAccessibility:](-[THDocumentViewController toolbarDelegate](v3, "toolbarDelegate"), "setToolbarHiddenFromAccessibility:", 0);
  if (-[THDocumentViewController canvasViewController](v3, "canvasViewController"))
    v3 = (THDocumentViewController *)-[THDocumentViewController canvasViewController](v3, "canvasViewController");
  -[THDocumentViewController becomeFirstResponder](v3, "becomeFirstResponder");
}

- (UIEdgeInsets)expandedViewControllerSafeAreaInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend(-[THDocumentViewController view](self, "view", a3), "safeAreaInsets");
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)expandedViewController:(id)a3 handleHyperlinkWithURL:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_19908;
  v4[3] = &unk_426E28;
  v4[4] = self;
  v4[5] = a4;
  -[THWExpandedViewController dismissExpandedAnimatedWithCompletionBlock:](-[THDocumentViewController expandedViewController](self, "expandedViewController", a3), "dismissExpandedAnimatedWithCompletionBlock:", v4);
}

- (id)actionForHyperlink:(id)a3 inRep:(id)a4 gesture:(id)a5
{
  id v8;
  id v9;
  id v11;
  uint64_t v12;
  TSWPTwoPartAction *v13;
  _QWORD v15[7];
  _QWORD v16[5];
  _QWORD v17[6];

  v8 = objc_msgSend(a5, "gestureKind");
  v9 = (id)TSWPLongPress;
  if (v8 != (id)TSWPImmediateSingleTap && v8 != (id)TSWPLongPress)
    return 0;
  v11 = v8;
  v16[4] = a4;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_19A50;
  v17[3] = &unk_426E28;
  v17[4] = a4;
  v17[5] = a3;
  v15[6] = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_19A5C;
  v16[3] = &unk_426DD0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_19A68;
  v15[3] = &unk_426F18;
  v15[4] = a4;
  v15[5] = self;
  v13 = +[TSWPTwoPartAction actionWithStartAction:cancelAction:finishAction:](TSWPTwoPartAction, "actionWithStartAction:cancelAction:finishAction:", v17, v16, v15);
  if (v11 == v9)
    v12 = 1;
  else
    v12 = TSUSupportsTextInteraction();
  -[TSWPTwoPartAction setPerformImmediately:](v13, "setPerformImmediately:", v12);
  return v13;
}

- (void)expandedViewControllerWantsDismiss:(id)a3
{
  -[THWExpandedViewController dismissExpandedAnimatedWithCompletionBlock:](-[THDocumentViewController expandedViewController](self, "expandedViewController", a3), "dismissExpandedAnimatedWithCompletionBlock:", 0);
}

- (id)expandedViewController:(id)a3 actionForHyperlink:(id)a4 inRep:(id)a5 gesture:(id)a6
{
  id v11;
  id v12;
  id v14;
  THDocumentNavigator *v15;
  id v16;
  uint64_t v17;
  TSWPTwoPartAction *v18;
  _QWORD v20[8];
  _QWORD v21[5];
  _QWORD v22[6];

  v11 = objc_msgSend(a6, "gestureKind");
  v12 = (id)TSWPLongPress;
  if (v11 != (id)TSWPImmediateSingleTap && v11 != (id)TSWPLongPress)
    return 0;
  v14 = v11;
  v15 = -[THDocumentViewController documentNavigator](self, "documentNavigator");
  if (!v15)
    return -[THDocumentViewController actionForHyperlink:inRep:gesture:](self, "actionForHyperlink:inRep:gesture:", a4, a5, a6);
  v16 = -[THDocumentNavigator linkForURL:inStorage:](v15, "linkForURL:inStorage:", objc_msgSend(a4, "url"), objc_msgSend(a4, "parentStorage"));
  if ((objc_msgSend(v16, "targetIsApplePub") & 1) == 0
    && !objc_msgSend(v16, "targetIsiBooks"))
  {
    return -[THDocumentViewController actionForHyperlink:inRep:gesture:](self, "actionForHyperlink:inRep:gesture:", a4, a5, a6);
  }
  v21[4] = a5;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_19C70;
  v22[3] = &unk_426E28;
  v22[4] = a5;
  v22[5] = a4;
  v20[7] = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_19C7C;
  v21[3] = &unk_426DD0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_19C88;
  v20[3] = &unk_4272D8;
  v20[4] = a5;
  v20[5] = a3;
  v20[6] = self;
  v18 = +[TSWPTwoPartAction actionWithStartAction:cancelAction:finishAction:](TSWPTwoPartAction, "actionWithStartAction:cancelAction:finishAction:", v22, v21, v20);
  if (v14 == v12)
    v17 = 1;
  else
    v17 = TSUSupportsTextInteraction();
  -[TSWPTwoPartAction setPerformImmediately:](v18, "setPerformImmediately:", v17);
  return v18;
}

- (void)expandedViewController:(id)a3 activateProgressForRep:(id)a4
{
  -[THDocumentViewController p_activateProgressForRep:](self, "p_activateProgressForRep:", a4);
}

- (void)expandedViewController:(id)a3 deactivateProgressForRep:(id)a4
{
  -[THDocumentViewController p_deactivateProgressForRep:](self, "p_deactivateProgressForRep:", a4);
}

- (void)p_ensureInNavigationUnitForContentNode:(id)a3
{
  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController p_ensureInNavigationUnitForContentNode:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6840, CFSTR("invalid nil value for '%s'"), "node");
  if (!-[THNavigationUnit containsContentNode:](-[THSectionController currentNavigationUnit](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "currentNavigationUnit"), "containsContentNode:", a3))-[THDocumentViewController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitContainingContentNode:", a3));
}

- (void)p_zoomToAnchor:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *i;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];

  if (a3)
  {
    v5 = objc_msgSend(a3, "range");
    v7 = v6;
    v8 = objc_msgSend(a3, "contentNode");
    v9 = objc_msgSend(v8, "bodyStorageForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
    if (v9)
      v10 = objc_msgSend(v8, "nodeUniqueIDForInfo:", v9);
    else
      v10 = 0;
    v11 = objc_msgSend(a3, "storageUID");
    if (objc_msgSend(v10, "isEqualToString:", v11))
    {
      v12 = -[THSectionController pageControllerForContentNode:](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "pageControllerForContentNode:", v8);
      v13 = objc_msgSend(v12, "relativePageIndexForCharIndex:forceLayout:", v5, 0);
      if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = v13;
        v16 = objc_opt_class(THPageRep, v14);
        v17 = (void *)TSUDynamicCast(v16, objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForInfo:", objc_msgSend(v12, "pageInfoForRelativePageIndex:", v15)));
        if (v17)
        {
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v18 = objc_msgSend(v17, "childReps");
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v19)
          {
            v21 = v19;
            v22 = *(_QWORD *)v46;
            v44 = v7;
            while (2)
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v46 != v22)
                  objc_enumerationMutation(v18);
                v24 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
                v25 = objc_opt_class(THBodyRep, v20);
                v26 = TSUDynamicCast(v25, v24);
                if (v26)
                {
                  v27 = (void *)v26;
                  v28 = objc_opt_class(THWPRep, v20);
                  v29 = TSUDynamicCast(v28, objc_msgSend(v27, "repForCharIndex:isStart:", v5, 0));
                  if (v29)
                  {
                    v38 = (void *)v29;
                    v7 = v44;
                    goto LABEL_25;
                  }
                }
              }
              v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
              if (v21)
                continue;
              break;
            }
          }
        }
      }
    }
    else
    {
      v30 = objc_msgSend(v8, "infoForNodeUniqueID:forPresentationType:", v11, -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
      if (v30)
      {
        v32 = objc_msgSend(v30, "parentInfo");
        if (v32)
          v32 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layoutForInfo:", v32);
        v33 = objc_opt_class(TSWPShapeRep, v31);
        v34 = TSUDynamicCast(v33, objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", v32));
        if (v34)
        {
          v36 = (void *)v34;
          v37 = objc_opt_class(THWPRep, v35);
          v38 = (void *)TSUDynamicCast(v37, objc_msgSend(v36, "containedRep"));
          if (v38)
          {
LABEL_25:
            objc_msgSend(v38, "rectForHighlight:lineHasAttachment:", v5, v7, objc_msgSend(objc_msgSend(v38, "storage"), "rangeContainsAttachment:", v5, v7));
            v39 = objc_msgSend(v38, "closestColumnForPoint:");
            if (v39)
            {
              objc_msgSend(v39, "frameBounds");
              objc_msgSend(v38, "convertNaturalRectToUnscaledCanvas:");
              objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "zoomToFitRect:outset:fitWidthOnly:centerHorizontally:centerVertically:animated:", 1, 1, 1, 1, 1, v40, v41, v42, v43);
            }
          }
        }
      }
    }
  }
}

- (id)p_ownerInfoForPopUpInfo:(id)a3
{
  id v4;
  id result;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "allReps");
  result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "popUpInfo") == a3)
          return objc_msgSend(v9, "info");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (id)p_expandableInfoForInfo:(id)a3 forceLoad:(BOOL)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit", 0), "contentNodes");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v8)
    return 0;
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v18;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v11)
      objc_enumerationMutation(v7);
    v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
    if (a4 || objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "isLoaded"))
    {
      v10 = objc_msgSend(v13, "expandableInfoForWidgetInfo:forPresentationType:", a3, +[THPresentationType flowPresentationTypeInContext:](THPresentationType, "flowPresentationTypeInContext:", objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "context")));
      if (objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB"))
      {
        if (v10)
          return v10;
      }
      v15 = objc_opt_class(THWGutterInfo, v14);
      if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
        return v10;
    }
    if (v9 == (id)++v12)
    {
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        goto LABEL_3;
      return v10;
    }
  }
}

- (BOOL)showingExpandedWidgetView
{
  return -[THDocumentViewController expandedViewController](self, "expandedViewController") != 0;
}

- (void)switchToNavigationUnitForChapterIndex:(unint64_t)a3
{
  id v4;

  v4 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", a3);
  if (!v4)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController switchToNavigationUnitForChapterIndex:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 6984, CFSTR("invalid nil value for '%s'"), "navigationUnit");
  -[THDocumentViewController setCurrentNavigationUnit:](self, "setCurrentNavigationUnit:", v4);
}

- (id)navigationUnitForChapterIndex:(unint64_t)a3
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitContainingContentNode:", -[THDocumentLinkResolver contentNodeFromLink:](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "contentNodeFromLink:", -[THDocumentLinkResolver absoluteLink:withContentNode:](-[THDocumentViewController documentLinkResolver](self, "documentLinkResolver"), "absoluteLink:withContentNode:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles"), "objectAtIndex:", a3), "firstModelLink"), 0)));
}

- (void)updateVisibleInfosWithPageIndex:(unint64_t)a3
{
  double v5;
  double v6;

  -[THDocumentViewController p_currentPageSize](self, "p_currentPageSize");
  v6 = v5 * (double)a3;
  -[THDocumentViewController setLastAbsolutePageIndex:](self, "setLastAbsolutePageIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 1);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "setContentOffset:animated:", 0, v6, 0.0);
  -[THDocumentViewController setPreventVisibleInfoUpdates:](self, "setPreventVisibleInfoUpdates:", 0);
  -[THDocumentViewController p_updateVisibleInfosWithPaddingOptions:force:](self, "p_updateVisibleInfosWithPaddingOptions:force:", 0, 0);
}

- (id)contentNodeForPageIndex:(unint64_t)a3
{
  return objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"), "contentNodeForRelativePageIndex:forPresentationType:", a3, -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
}

- (CGRect)targetRelativeRectForPoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6
{
  _BOOL4 v6;
  THPresentationType *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  double v28;
  double v29;
  double width;
  CGFloat height;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  double v36;
  unsigned int v37;
  CGFloat v38;
  CGFloat v39;
  double MinX;
  double MaxX;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  char *v49;
  id v50;
  unint64_t v51;
  double *v52;
  unsigned int v53;
  double v54;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat y;
  double x;
  uint64_t v68;
  CGFloat v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  CGPoint v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect result;

  v6 = a6;
  y = a3.y;
  x = a3.x;
  -[THDocumentViewController ensureDocumentIsLoaded](self, "ensureDocumentIsLoaded");
  v10 = -[THSectionController presentationType](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "presentationType");
  v11 = TSDRectWithSize(-[THSectionController pageSize](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "pageSize"));
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = v14;
  v19 = v16;
  v20 = -[THDocumentViewController navigationUnitForChapterIndex:](self, "navigationUnitForChapterIndex:", a5);
  if ((objc_msgSend(objc_msgSend(v20, "contentNodeForRelativePageIndex:forPresentationType:", a4, v10), "isLoaded") & 1) != 0|| v6)
  {
    v21 = objc_msgSend(v20, "pageInfoForRelativePageIndex:forPresentationType:", a4, v10);
    if (!v21)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 7042, CFSTR("invalid nil value for '%s'"), "targetPage");
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v22 = objc_msgSend(v21, "modelBodyInfos");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
    if (v23)
    {
      v24 = v23;
      v62 = v19;
      v63 = v18;
      v64 = v13;
      v65 = v11;
      v60 = v17;
      v61 = v15;
      v25 = *(_QWORD *)v71;
      while (2)
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v71 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
          objc_msgSend(objc_msgSend(v27, "geometry"), "boundsBeforeRotation");
          v28 = v76.origin.x;
          v29 = v76.origin.y;
          width = v76.size.width;
          height = v76.size.height;
          v75.y = y;
          v75.x = x;
          if (CGRectContainsPoint(v76, v75))
          {
            v32 = objc_msgSend(v27, "lineHints");
            if (v32)
            {
              v33 = v32;
              if (objc_msgSend(v32, "valid"))
              {
                if (objc_msgSend(v33, "hintsCount"))
                {
                  v34 = objc_msgSend(v27, "columnStyle");
                  if (objc_msgSend(v34, "columnCount"))
                  {
                    v35 = 0;
                    v36 = x - v28;
                    v37 = 1;
                    while (1)
                    {
                      v68 = 0;
                      v69 = 0.0;
                      objc_msgSend(v34, "positionForColumnIndex:bodyWidth:outWidth:outGap:", v35, &v69, &v68, width);
                      v38 = v77.origin.x;
                      v39 = v69;
                      v77.origin.y = 0.0;
                      v77.size.width = v69;
                      v77.size.height = height;
                      MinX = CGRectGetMinX(v77);
                      v78.origin.y = 0.0;
                      v78.origin.x = v38;
                      v78.size.width = v39;
                      v78.size.height = height;
                      MaxX = CGRectGetMaxX(v78);
                      if (v36 <= MaxX && v36 >= MinX)
                        break;
                      v35 = v37;
                      v43 = (unint64_t)objc_msgSend(v34, "columnCount") > v37++;
                      if (!v43)
                        goto LABEL_22;
                    }
                    v44 = MaxX;
                    v46 = CGRectZero.origin.x;
                    v45 = CGRectZero.origin.y;
                    v48 = CGRectZero.size.width;
                    v47 = CGRectZero.size.height;
                    v49 = (char *)objc_msgSend(v33, "hints");
                    v50 = objc_msgSend(v33, "hintsCount");
                    if (v50)
                    {
                      v51 = (unint64_t)v50;
                      v52 = (double *)(v49 + 24);
                      v53 = 1;
                      do
                      {
                        if (*((_QWORD *)v52 + 2))
                        {
                          v54 = TSUCenterOfRect(*(v52 - 3), *(v52 - 2), *(v52 - 1), *v52);
                          if (v54 <= v44 && v54 >= MinX)
                          {
                            v79.origin.x = v46;
                            v79.origin.y = v45;
                            v79.size.width = v48;
                            v79.size.height = v47;
                            if (CGRectIsEmpty(v79))
                            {
                              v47 = *v52;
                              v48 = *(v52 - 1);
                              v45 = *(v52 - 2);
                              v46 = *(v52 - 3);
                            }
                            else
                            {
                              v80.origin.x = v46;
                              v80.origin.y = v45;
                              v80.size.width = v48;
                              v80.size.height = v47;
                              v81 = CGRectUnion(v80, *(CGRect *)(v52 - 3));
                              v46 = v81.origin.x;
                              v45 = v81.origin.y;
                              v48 = v81.size.width;
                              v47 = v81.size.height;
                            }
                          }
                        }
                        v43 = v51 > v53++;
                        v52 += 7;
                      }
                      while (v43);
                    }
                    if (v48 > 0.0)
                    {
                      v64 = v29 + v45;
                      v65 = v28 + v46;
                      v62 = v47;
                      v63 = v48;
                    }
                    goto LABEL_38;
                  }
                }
              }
            }
          }
LABEL_22:
          ;
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v70, v74, 16);
        if (v24)
          continue;
        break;
      }
LABEL_38:
      v17 = v60;
      v15 = v61;
      v13 = v64;
      v11 = v65;
      v19 = v62;
      v18 = v63;
    }
  }
  v56 = v11 / v15;
  v57 = v13 / v17;
  v58 = v18 / v15;
  v59 = v19 / v17;
  result.size.height = v59;
  result.size.width = v58;
  result.origin.y = v57;
  result.origin.x = v56;
  return result;
}

- (CGRect)targetRelativeRectForRelativePoint:(CGPoint)a3 atPageIndex:(unint64_t)a4 chapterIndex:(unint64_t)a5 waitForContentNodeLoad:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  v6 = a6;
  y = a3.y;
  x = a3.x;
  -[THDocumentViewController ensureDocumentIsLoaded](self, "ensureDocumentIsLoaded");
  v12 = -[THSectionController pageSize](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "pageSize");
  if (x > 1.0 || x < 0.0)
    v12 = objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 7142, CFSTR("Invalid relative x coordinate."));
  if (y > 1.0 || y < 0.0)
    v12 = objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THDocumentViewController targetRelativeRectForRelativePoint:atPageIndex:chapterIndex:waitForContentNodeLoad:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 7143, CFSTR("Invalid relative y coordinate."));
  TSDRectWithSize(v12);
  -[THDocumentViewController targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:](self, "targetRelativeRectForPoint:atPageIndex:chapterIndex:waitForContentNodeLoad:", a4, a5, v6, x * v13, y * v14);
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)zoomToRelativeTargetRect:(CGRect)a3 atPageIndex:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  BOOL IsEmpty;
  BOOL v11;
  double v12;
  double v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  IsEmpty = CGRectIsEmpty(a3);
  v11 = height == 1.0 && width == 1.0;
  if (!IsEmpty && !v11)
  {
    TSDRectWithSize(-[THSectionController pageSize](-[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"), "pageSize"));
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "zoomToColumnWithFrame:", v12 * (double)a4 + v12 * x, v13 * y + 0.0, width * v12, height * v13);
  }
}

- (void)showPageThumbnailsForMissingPageIndexes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = objc_msgSend(a3, "mutableCopy");
  v4 = -[THDocumentViewController visibleRelativePageRange](self, "visibleRelativePageRange");
  objc_msgSend(v6, "removeIndexesInRange:", v4, v5);
  -[THDocumentViewController showPageThumbnailsForPageIndexes:animated:duration:](self, "showPageThumbnailsForPageIndexes:animated:duration:", v6, 0, 0.0);

}

- (void)showPageThumbnailsForPageIndexes:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id v19;
  _BOOL4 v20;
  _QWORD v21[5];

  v20 = a4;
  if (!self->mCurrentThumbnailViews)
  {
    self->mCurrentThumbnailViews = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->mCurrentThumbnailPageIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
  }
  v8 = objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "tocModel"), "tiles"), "objectAtIndex:", -[THDocumentViewController currentChapter](self, "currentChapter"));
  v9 = objc_msgSend(a3, "firstIndex");
  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v9;
    if (v20)
      v11 = 0.0;
    else
      v11 = 1.0;
    do
    {
      if ((-[NSMutableIndexSet containsIndex:](self->mCurrentThumbnailPageIndexes, "containsIndex:", v10) & 1) == 0)
      {
        v12 = OBJC_IVAR___TSADocumentViewController__scrollView;
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
        v14 = v13 * (double)(unint64_t)v10;
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v12], "bounds");
        v16 = v15;
        objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[v12], "bounds");
        v18 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", v14, 0.0, v16, v17);
        v19 = objc_msgSend(objc_alloc((Class)TSDBitmapImageProvider), "initWithImageData:", objc_msgSend(objc_msgSend(v8, "largerThumbs"), "objectAtIndex:", v10));
        objc_msgSend(v18, "setAlpha:", v11);
        objc_msgSend(v18, "setImage:", +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", objc_msgSend(v19, "CGImageForNaturalSize")));

        objc_msgSend(objc_msgSend(-[THDocumentViewController canvasViewController](self, "canvasViewController"), "canvasView"), "addSubview:", v18);
        -[NSMutableArray addObject:](self->mCurrentThumbnailViews, "addObject:", v18);
        -[NSMutableIndexSet addIndex:](self->mCurrentThumbnailPageIndexes, "addIndex:", v10);

      }
      v10 = objc_msgSend(a3, "indexGreaterThanIndex:", v10);
    }
    while (v10 != (id)0x7FFFFFFFFFFFFFFFLL);
  }
  if (v20)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1AEE4;
    v21[3] = &unk_426DD0;
    v21[4] = self;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, a5);
  }
}

- (void)hidePageThumbnailsAnimated:(BOOL)a3 duration:(double)a4
{
  _QWORD v5[5];
  _QWORD v6[5];

  if (a3)
  {
    v5[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1B098;
    v6[3] = &unk_426DD0;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1B188;
    v5[3] = &unk_427130;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, a4);
  }
  else
  {
    -[NSMutableArray makeObjectsPerformSelector:](self->mCurrentThumbnailViews, "makeObjectsPerformSelector:", "removeFromSuperview", a4);

    self->mCurrentThumbnailViews = 0;
    self->mCurrentThumbnailPageIndexes = 0;
  }
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

- (BOOL)editorAllowsHyperlinkInteraction
{
  return 0;
}

- (void)corruptBookAlert
{
  id v3;
  UIAlertController *v4;
  _QWORD v5[5];

  objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "setIsCorrupt:", 1);
  if (!self->mHaveDisplayedCorruptBookAlert)
  {
    v3 = objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("This book is either missing content or contains invalid content."), &stru_43D7D8, 0);
    v4 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v3, objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Try downloading the book again"), &stru_43D7D8, 0), 1);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1B350;
    v5[3] = &unk_427300;
    v5[4] = self;
    -[UIAlertController addAction:](v4, "addAction:", +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("OK"), &stru_43D7D8, 0), 1, v5));
    -[THDocumentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);
    self->mHaveDisplayedCorruptBookAlert = 1;
  }
}

- (void)scrollableCanvasViewControllerDidReceiveBackgroundTap:(id)a3
{
  -[THDocumentViewController toggleToolbar](self, "toggleToolbar", a3);
}

- (id)scrollableCanvasActivityItemProviderWithCachedAnnotation:(id)a3
{
  return -[THBookPropertiesProvider activityItemProviderWithCachedAnnotation:](-[THDocumentViewController bookPropertiesDelegate](self, "bookPropertiesDelegate"), "activityItemProviderWithCachedAnnotation:", a3);
}

- (BOOL)allowCopy
{
  return -[THBookPropertiesProvider allowCopy](-[THDocumentViewController bookPropertiesDelegate](self, "bookPropertiesDelegate"), "allowCopy");
}

- (BOOL)allowHighlighting
{
  return 1;
}

- (id)titleOfCurrentNavigationUnit
{
  return objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "titleStringForNavigationUnit:", -[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit"));
}

- (id)activityItemProviderWithCachedAnnotation:(id)a3
{
  return -[THBookPropertiesProvider activityItemProviderWithCachedAnnotation:](-[THDocumentViewController bookPropertiesDelegate](self, "bookPropertiesDelegate"), "activityItemProviderWithCachedAnnotation:", a3);
}

- (BOOL)suspendCanvasScroll
{
  uint64_t v3;

  v3 = objc_opt_class(THScrollView, a2);
  return objc_msgSend((id)TSUDynamicCast(v3, *(_QWORD *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView]), "suspendScrolling");
}

- (void)setSuspendCanvasScroll:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v5 = objc_opt_class(THScrollView, a2);
  v6 = (void *)TSUDynamicCast(v5, *(_QWORD *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView]);
  objc_msgSend(v6, "setSuspendScrolling:", v3);
}

- (void)removePreviewForRelativePageIndex:(unint64_t)a3
{
  THNavigationUnit *v5;
  THPresentationType *v6;

  if (!-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    v5 = -[THSectionController currentNavigationUnit](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "currentNavigationUnit");
    v6 = -[THDocumentViewController currentPresentationType](self, "currentPresentationType");
    if (-[THNavigationUnit pageCountForPresentationType:](v5, "pageCountForPresentationType:", v6) > a3)
      objc_msgSend(-[THPageViewProvider pageHostForAbsolutePageIndex:](-[THDocumentViewController pageViewProvider](self, "pageViewProvider"), "pageHostForAbsolutePageIndex:", -[THNavigationUnit absolutePageIndexForRelativePageIndex:forPresentationType:](v5, "absolutePageIndexForRelativePageIndex:forPresentationType:", a3, v6)), "unloadPreviewAnimated:", 0);
    -[THDocumentViewController setLastLayoutSize:](self, "setLastLayoutSize:", CGSizeZero.width, CGSizeZero.height);
  }
}

- (void)pageViewProviderViewsAdded:(id)a3 pageIndexSet:(id)a4
{
  THPageViewDisplacement *mPageViewDisplacement;
  _QWORD v7[6];

  if (-[THDocumentViewController inGuidedPan](self, "inGuidedPan", a3)
    && -[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1B5F8;
    v7[3] = &unk_427378;
    v7[4] = self;
    v7[5] = a4;
    -[THPageViewDisplacement hideWithEnumerator:](mPageViewDisplacement, "hideWithEnumerator:", v7);
  }
  else if ((objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "currentlyScrolling") & 1) == 0)
  {
    -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:pageIndexSet:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:pageIndexSet:", 0, 0, a4);
  }
  -[THDocumentViewController p_updatePageViewHostsWithTheme:](self, "p_updatePageViewHostsWithTheme:", -[THThemeDelegate theme](-[THDocumentViewController themeDelegate](self, "themeDelegate"), "theme"));
}

- (CGRect)pageViewProviderUnclippedVisibleBounds:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", a3), "visibleBoundsRect");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (unint64_t)pageViewProviderStartAbsolutePageIndex:(id)a3
{
  return (unint64_t)objc_msgSend(-[THDocumentViewController currentNavigationUnit](self, "currentNavigationUnit", a3), "startPageAbsolutePageIndexForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
}

- (int64_t)p_relativePageIndexForPageInfo:(id)a3
{
  _BYTE *v4;

  v4 = objc_msgSend(a3, "absolutePageIndex");
  return v4
       - (_BYTE *)-[THNavigationUnit startPageAbsolutePageIndexForPresentationType:](-[THSectionController currentNavigationUnit](-[THDocumentViewController activeSectionController](self, "activeSectionController"), "currentNavigationUnit"), "startPageAbsolutePageIndexForPresentationType:", -[THDocumentViewController currentPresentationType](self, "currentPresentationType"));
}

- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4
{
  -[THDocumentViewController p_updatePageViewsForScrollingAnimated:restoreOrigin:pageIndexSet:](self, "p_updatePageViewsForScrollingAnimated:restoreOrigin:pageIndexSet:", a3, a4, 0);
}

- (void)p_updatePageViewsForScrollingAnimated:(BOOL)a3 restoreOrigin:(BOOL)a4 pageIndexSet:(id)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  double v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  uint64_t v13;
  THPageViewDisplacement *mPageViewDisplacement;
  _QWORD v15[6];

  v6 = a4;
  v7 = a3;
  if (-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement"))
  {
    if (!self->mOverscrollAnimationInProcess
      && !-[THDocumentViewController isRotating](self, "isRotating")
      && !-[THDocumentViewController preventVisibleInfoUpdates](self, "preventVisibleInfoUpdates")
      && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "dynamicallyZooming") & 1) == 0)
    {
      -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
      v10 = v9;
      -[THDocumentViewController currentViewScale](self, "currentViewScale");
      if (vabdd_f64(v10, v11) < 0.00999999978
        && !-[THDocumentViewController isRevealingTOC](self, "isRevealingTOC")
        && (objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "animatingScroll") & 1) == 0)
      {
        v12 = -[THGuidedPanController isFocusedOnTarget](-[THDocumentViewController guidedPanController](self, "guidedPanController"), "isFocusedOnTarget");
        if ((a5 || (v12 & 1) == 0) && !-[THDocumentViewController inGuidedPan](self, "inGuidedPan"))
        {
          if (-[THDocumentViewController isTwoUp](self, "isTwoUp"))
            v13 = 2;
          else
            v13 = 1;
          -[THPageViewDisplacement setNumberOfPagesShown:](self->mPageViewDisplacement, "setNumberOfPagesShown:", v13);
          mPageViewDisplacement = self->mPageViewDisplacement;
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1B938;
          v15[3] = &unk_4273A0;
          v15[4] = self;
          v15[5] = a5;
          -[THPageViewDisplacement updateDisplacementAnimated:restoreOrigin:enumerator:](mPageViewDisplacement, "updateDisplacementAnimated:restoreOrigin:enumerator:", v7, v6, v15);
        }
      }
    }
  }
}

- (id)traitCollection
{
  UITraitCollection *v3;
  UITraitCollection *v4;
  uint64_t v5;
  id v6;
  objc_super v8;
  _QWORD v9[2];

  v8.receiver = self;
  v8.super_class = (Class)THDocumentViewController;
  v3 = -[THDocumentViewController traitCollection](&v8, "traitCollection");
  if (!v3)
    return objc_alloc_init((Class)UITraitCollection);
  v4 = v3;
  if (-[THDocumentViewController isViewLoaded](self, "isViewLoaded"))
  {
    v5 = -[THDocumentViewController inFlowMode](self, "inFlowMode") ? 2 : 1;
    v6 = +[UITraitCollection bk_traitCollectionWithReadingMode:](UITraitCollection, "bk_traitCollectionWithReadingMode:", v5);
    v9[0] = v4;
    v9[1] = v6;
    v4 = +[UITraitCollection traitCollectionWithTraitsFromCollections:](UITraitCollection, "traitCollectionWithTraitsFromCollections:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, 2));
    if (!v4)
      return objc_alloc_init((Class)UITraitCollection);
  }
  return v4;
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  os_unfair_lock_s *p_accessLock;

  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  self->_th_cachedIsCompactHeight = -[THDocumentViewController im_isCompactHeight](self, "im_isCompactHeight");
  self->_th_cachedIsCompactWidth = -[THDocumentViewController im_isCompactWidth](self, "im_isCompactWidth");
  self->_th_cachedInterfaceOrientation = -[THDocumentViewController interfaceOrientation](self, "interfaceOrientation");
  os_unfair_lock_unlock(p_accessLock);
  -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](self, "configuration"), "invalidate");
  -[THDocumentViewController p_updateScrollViewDecelerationRate](self, "p_updateScrollViewDecelerationRate");
  -[THDocumentViewController setCompactFlowPresentationState:](self, "setCompactFlowPresentationState:", 0);
}

- (int64_t)th_cachedInterfaceOrientation
{
  os_unfair_lock_s *p_accessLock;
  int64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  v7[3] = self->_th_cachedInterfaceOrientation;
  os_unfair_lock_unlock(p_accessLock);
  v4 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v4;
}

- (BOOL)th_cachedIsCompactHeight
{
  THDocumentViewController *v2;
  os_unfair_lock_s *p_accessLock;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = self;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  *((_BYTE *)v6 + 24) = v2->_th_cachedIsCompactHeight;
  os_unfair_lock_unlock(p_accessLock);
  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (BOOL)th_cachedIsCompactWidth
{
  THDocumentViewController *v2;
  os_unfair_lock_s *p_accessLock;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = self;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  *((_BYTE *)v6 + 24) = v2->_th_cachedIsCompactWidth;
  os_unfair_lock_unlock(p_accessLock);
  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  THSectionController *v8;
  char v9;
  double v10;
  unsigned __int8 v11;
  _QWORD v12[7];
  char v13;
  _QWORD v14[8];
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  CGAffineTransform v20;
  _QWORD v21[5];
  objc_super v22;

  height = a3.height;
  width = a3.width;
  -[THWFreeTransformController cancelTransform](-[THDocumentViewController ftc](self, "ftc"), "cancelTransform");
  -[THDocumentViewController setLastLayoutBoundsSize:](self, "setLastLayoutBoundsSize:", width, height);
  if (!-[THDocumentViewController lastStorageAnchor](self, "lastStorageAnchor"))
  {
    v8 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    -[THDocumentViewController setLastStorageAnchor:](self, "setLastStorageAnchor:", -[THSectionController bodyAnchorForCanvasRect:](v8, "bodyAnchorForCanvasRect:"));
  }
  if (-[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL
    && !-[THDocumentViewController expandedViewController](self, "expandedViewController"))
  {
    -[THDocumentViewController setLastAbsolutePageIndex:](self, "setLastAbsolutePageIndex:", -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex"));
  }
  -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", width, height);
  if (-[THDocumentViewController p_isSinglePageChapter](self, "p_isSinglePageChapter"))
    -[THDocumentViewController p_layoutSinglePageChapter](self, "p_layoutSinglePageChapter");
  v22.receiver = self;
  v22.super_class = (Class)THDocumentViewController;
  -[THDocumentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v22, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1C0C4;
  v21[3] = &unk_4273C8;
  v21[4] = self;
  objc_msgSend(a4, "animateAlongsideTransition:completion:", v21, 0);
  if (!-[THDocumentViewController isEpub](self, "isEpub") && objc_msgSend(a4, "isAnimated"))
  {
    -[THDocumentViewController setIsTransitioning:](self, "setIsTransitioning:", 1);
    if (a4 && (objc_msgSend(a4, "targetTransform"), !CGAffineTransformIsIdentity(&v20)))
    {
      objc_msgSend(a4, "transitionDuration");
      -[THDocumentViewController bookViewWillRotateTransitionToSize:duration:](self, "bookViewWillRotateTransitionToSize:duration:", width, height, v10);
      v9 = 1;
    }
    else
    {
      -[THDocumentViewController bookViewWillTransitionToSize:](self, "bookViewWillTransitionToSize:", width, height);
      v9 = 0;
    }
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1C124;
    v14[3] = &unk_4273F0;
    v15 = v9;
    v14[4] = self;
    v14[5] = &v16;
    *(double *)&v14[6] = width;
    *(double *)&v14[7] = height;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1C18C;
    v12[3] = &unk_427418;
    v13 = v9;
    v12[4] = self;
    *(double *)&v12[5] = width;
    *(double *)&v12[6] = height;
    v11 = objc_msgSend(a4, "animateAlongsideTransition:completion:", v14, v12);
    *((_BYTE *)v17 + 24) = v11;
    _Block_object_dispose(&v16, 8);
  }
}

- (void)p_layoutSinglePageChapter
{
  THPageViewProvider *mPageViewProvider;
  _QWORD v4[5];

  if (-[THDocumentViewController transitioningFromTwoUpToOneUp](self, "transitioningFromTwoUpToOneUp")
    || -[THDocumentViewController transitioningFromOneUpToTwoUp](self, "transitioningFromOneUpToTwoUp"))
  {
    mPageViewProvider = self->mPageViewProvider;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1C26C;
    v4[3] = &unk_426DD0;
    v4[4] = self;
    -[THPageViewProvider syncPerformBlock:](mPageViewProvider, "syncPerformBlock:", v4);
  }
}

- (void)bookViewWillTransitionToSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](self, "configuration"), "invalidate");
    if (-[THDocumentViewController p_isSinglePageChapter](self, "p_isSinglePageChapter"))
      -[THDocumentViewController p_layoutSinglePageChapter](self, "p_layoutSinglePageChapter");
    if (-[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex") == 0x7FFFFFFFFFFFFFFFLL)
      -[THDocumentViewController setLastAbsolutePageIndex:](self, "setLastAbsolutePageIndex:", -[THDocumentViewController currentAbsolutePageIndex](self, "currentAbsolutePageIndex"));
    -[THDocumentViewController updateTwoUpForSize:](self, "updateTwoUpForSize:", width, height);
    -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 0);
    objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
    -[THDocumentViewController setVisibleUnscaledRectBeforeRotation:](self, "setVisibleUnscaledRectBeforeRotation:");
    if (-[THDocumentViewController showingExpandedWidgetView](self, "showingExpandedWidgetView"))
      -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, 0.0);
    -[THBookNavigation vantageWillChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonWindowResize"));
  }
}

- (void)bookViewWillRotateTransitionToSize:(CGSize)a3 duration:(double)a4
{
  double height;
  double width;
  THWExpandedViewController *v8;
  _BOOL8 v9;
  THSectionController *v10;
  _QWORD v11[5];

  height = a3.height;
  width = a3.width;
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", 0);
  objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "setContentInset:", 0.0, 0.0, 0.0, 0.0);
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    -[THDocumentReflowableLayoutConfiguration invalidate](-[THDocumentViewController configuration](self, "configuration"), "invalidate");
    +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
    self->_previousTransitionSize = CGSizeZero;
    v8 = -[THDocumentViewController expandedViewController](self, "expandedViewController");
    v9 = 1;
    if (!v8)
      v9 = -[THDocumentViewController presentedViewController](self, "presentedViewController", 1) != 0;
    -[THDocumentViewController setDeferCanvasLayoutToAfterRotationHasCompleted:](self, "setDeferCanvasLayoutToAfterRotationHasCompleted:", v9);
    self->mIsRotating = 1;
    -[THDocumentViewController p_releaseOverscrollViews](self, "p_releaseOverscrollViews");
    v10 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    if (v10 == -[THDocumentViewController flowSectionController](self, "flowSectionController"))
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1C5D0;
      v11[3] = &unk_426DD0;
      v11[4] = self;
      +[UIView performBlockWithActionsAndAnimationsDisabled:](UIView, "performBlockWithActionsAndAnimationsDisabled:", v11);
    }
    else
    {
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "visibleUnscaledRect");
      -[THDocumentViewController setVisibleUnscaledRectBeforeRotation:](self, "setVisibleUnscaledRectBeforeRotation:");
      objc_msgSend(-[THDocumentViewController view](self, "view"), "setClipsToBounds:", 1);
    }
    if ((-[THDocumentViewController showingExpandedWidgetView](self, "showingExpandedWidgetView")
       || -[THDocumentViewController currentChapter](self, "currentChapter") != 0x7FFFFFFFFFFFFFFFLL)
      && !-[THDocumentViewController deferCanvasLayoutToAfterRotationHasCompleted](self, "deferCanvasLayoutToAfterRotationHasCompleted"))
    {
      -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 0, width, height, a4);
    }
    objc_msgSend(-[THDocumentViewController canvasScrollView](self, "canvasScrollView"), "setClipsToBounds:", 0);
    -[THDocumentViewController p_dismissActiveAnimated:](self, "p_dismissActiveAnimated:", 0);
    -[THBookNavigation vantageWillChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageWillChangeBy:reason:", self, CFSTR("THVantageChangeReasonRotation"));
  }
}

- (void)bookViewWillAnimateRotationToSize:(CGSize)a3 duration:(double)a4
{
  double height;
  double width;
  THSectionController *v8;
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
  unsigned int v23;
  double v24;
  double v25;
  id v26;
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
  double MidX;
  double v41;
  double v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;

  height = a3.height;
  width = a3.width;
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    v8 = -[THDocumentViewController activeSectionController](self, "activeSectionController");
    if (v8 == -[THDocumentViewController paginatedSectionController](self, "paginatedSectionController"))
    {
      -[THDocumentViewController p_maxScrollViewSizeForViewSize:](self, "p_maxScrollViewSizeForViewSize:", width, height);
      v10 = v9;
      v12 = v11;
      -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
      -[THDocumentViewController zoomedOutViewScale](self, "zoomedOutViewScale");
      v14 = v13;
      -[THDocumentViewController visibleUnscaledRectBeforeRotation](self, "visibleUnscaledRectBeforeRotation");
      v19 = TSDCenterOfRect(v15, v16, v17, v18);
      -[THDocumentViewController visibleUnscaledRectBeforeRotation](self, "visibleUnscaledRectBeforeRotation");
      v21 = v20;
      v22 = v12 / v14 * 0.5;
      v23 = -[THDocumentViewController p_isSinglePageChapter](self, "p_isSinglePageChapter");
      if (v23)
        -[THDocumentViewController p_layoutSinglePageChapter](self, "p_layoutSinglePageChapter");
      v24 = v22 + v21;
      if (-[THDocumentViewController transitioningFromTwoUpToOneUp](self, "transitioningFromTwoUpToOneUp"))
      {
        v19 = v19 + v10 * -0.5;
      }
      else if (-[THDocumentViewController transitioningFromOneUpToTwoUp](self, "transitioningFromOneUpToTwoUp"))
      {
        if ((objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "navigationModel"), "navigationUnitRelativePageIndexForAbsolutePageIndex:forPresentationType:", -[THDocumentViewController lastAbsolutePageIndex](self, "lastAbsolutePageIndex"), -[THDocumentViewController currentPresentationType](self, "currentPresentationType")) & 1) != 0)
        {
          -[THDocumentViewController visibleUnscaledRectBeforeRotation](self, "visibleUnscaledRectBeforeRotation");
          v19 = v19 - v25;
        }
        if (v23)
        {
          v26 = objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "canvasView");
          objc_msgSend(v26, "frame");
          v28 = v27;
          v43 = v30;
          v44 = v29;
          v32 = v31 + v31;
          objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "viewScale");
          objc_msgSend(v26, "setFrame:", v28 - v19 * v33, v44, v32, v43);
        }
      }
      objc_msgSend(*(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView], "bounds");
      v36 = v19 - TSDMultiplySizeScalar(v34, v35, 1.0 / v14) * 0.5;
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "clampedUnscaledContentOffset:forViewScale:", v36, v24 - v37 * 0.5, v14);
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "animateToViewScale:contentOffset:duration:", v14, v38, v39, a4);
    }
    objc_msgSend(-[THDocumentViewController view](self, "view"), "bounds");
    MidX = CGRectGetMidX(v45);
    objc_msgSend(objc_msgSend(-[THDocumentViewController view](self, "view"), "window"), "statusBarMinDimension");
    v42 = v41;
    -[UIView bounds](self->mWhiteBackground, "bounds");
    -[UIView setCenter:](self->mWhiteBackground, "setCenter:", MidX, v42 + CGRectGetHeight(v46) * 0.5);
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
    {
      objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "recreateAllLayoutsAndReps");
      -[THDocumentViewController p_updateCanvasSize](self, "p_updateCanvasSize");
      -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, width, height, 0.0);
    }
  }
}

- (void)p_updateWidgetInteractionMode
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController", 0), "canvas"), "topLevelReps");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "recursivelyPerformSelectorIfImplemented:", "widgetInteractionModeChanged");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (void)bookViewDidRotateTransitionToSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    if (-[THDocumentViewController deferCanvasLayoutToAfterRotationHasCompleted](self, "deferCanvasLayoutToAfterRotationHasCompleted"))
    {
      +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", self->_previousTransitionSize.width, self->_previousTransitionSize.height));
      self->_previousTransitionSize.width = width;
      self->_previousTransitionSize.height = height;
      -[THDocumentViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "p_performDelayedLayoutAndRotation:", +[NSValue valueWithCGSize:](NSValue, "valueWithCGSize:", width, height), 0.5);
    }
    else
    {
      -[THDocumentViewController p_didFinishTransitionWithSize:](self, "p_didFinishTransitionWithSize:", width, height);
    }
  }
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "setCenteredInScrollView:", -[THDocumentViewController inFlowMode](self, "inFlowMode") ^ 1);
  objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasLayer"), "adjustContentInsets");
}

- (void)p_performDelayedLayoutAndRotation:(id)a3
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[THDocumentViewController setDeferCanvasLayoutToAfterRotationHasCompleted:](self, "setDeferCanvasLayoutToAfterRotationHasCompleted:", 0);
  objc_msgSend(a3, "CGSizeValue");
  v6 = v5;
  v8 = v7;
  -[THDocumentViewController p_layoutCanvasForSize:duration:forceBackgroundLayout:](self, "p_layoutCanvasForSize:duration:forceBackgroundLayout:", 1);
  -[THDocumentViewController p_didFinishTransitionWithSize:](self, "p_didFinishTransitionWithSize:", v6, v8);
  objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "forceStopScrolling");
}

- (void)p_didFinishTransitionWithSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  self->mIsRotating = 0;
  -[THDocumentViewController p_setupPageNumberViews](self, "p_setupPageNumberViews");
  -[THDocumentViewController p_setupNavOverlayContainer](self, "p_setupNavOverlayContainer");
  -[THDocumentViewController p_updateScrollViewAndZoomSettingsForSize:](self, "p_updateScrollViewAndZoomSettingsForSize:", width, height);
  -[UIView removeFromSuperview](self->mWhiteBackground, "removeFromSuperview");

  self->mWhiteBackground = 0;
  -[THDocumentViewController p_updatePageNumberingForce:](self, "p_updatePageNumberingForce:", 1);
  -[THDocumentViewController p_setupOverscrollViews](self, "p_setupOverscrollViews");
  -[THDocumentViewController p_resetPageDisplacment](self, "p_resetPageDisplacment");
  -[THDocumentViewController p_updateWidgetInteractionMode](self, "p_updateWidgetInteractionMode");
  -[THBookNavigation vantageDidChangeBy:reason:](-[THDocumentViewController bookNavigationDelegate](self, "bookNavigationDelegate"), "vantageDidChangeBy:reason:", self, CFSTR("THVantageChangeReasonRotation"));
}

- (void)p_resetPageDisplacment
{
  THPageViewDisplacement *mPageViewDisplacement;
  _QWORD v4[5];

  if (!-[THDocumentViewController p_allowsPageDisplacement](self, "p_allowsPageDisplacement")
    && !-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    mPageViewDisplacement = self->mPageViewDisplacement;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1CE30;
    v4[3] = &unk_427218;
    v4[4] = self;
    -[THPageViewDisplacement resetAnimationsWithEnumerator:](mPageViewDisplacement, "resetAnimationsWithEnumerator:", v4);
  }
}

- (void)bookViewDidTransitionToSize:(CGSize)a3
{
  double height;
  double width;

  height = a3.height;
  width = a3.width;
  if (-[THDocumentViewController isDocumentLoaded](self, "isDocumentLoaded"))
  {
    if (-[THDocumentViewController currentChapter](self, "currentChapter") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
      {
        objc_msgSend(-[THDocumentViewController interactiveCanvasController](self, "interactiveCanvasController"), "recreateAllLayoutsAndReps");
        -[THDocumentViewController p_updateCanvasSize](self, "p_updateCanvasSize");
      }
      -[THDocumentViewController p_resizeViewsForSize:duration:maintainPageIndex:](self, "p_resizeViewsForSize:duration:maintainPageIndex:", 1, width, height, 0.0);
    }
    -[THDocumentViewController p_resetPageDisplacment](self, "p_resetPageDisplacment");
    -[THDocumentViewController p_updateWidgetInteractionMode](self, "p_updateWidgetInteractionMode");
  }
}

- (CGSize)widgetStackMaxContainerSizeForSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
  {
    -[THDocumentViewController p_maxScrollViewSize](self, "p_maxScrollViewSize");
    height = fmin(height, v6 + 10.0 * -2.0);
  }
  v7 = width;
  v8 = height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (THDocumentReflowableLayoutConfiguration)configuration
{
  THDocumentReflowableLayoutConfiguration *result;
  THDocumentReflowableLayoutConfiguration *v4;
  unsigned int v5;
  double v6;
  uint64_t v7;
  double v8;

  result = self->_configuration;
  if (!result)
  {
    self->_configuration = -[THDocumentReflowableLayoutConfiguration initWithViewController:provider:]([THDocumentReflowableLayoutConfiguration alloc], "initWithViewController:provider:", self, self);
    v4 = -[THDocumentViewController configuration](self, "configuration");
    v5 = -[THDocumentViewController isEpub](self, "isEpub");
    v6 = 0.8;
    if (!v5)
      v6 = 1.0;
    -[THDocumentReflowableLayoutConfiguration setLargeSizeFactor:](v4, "setLargeSizeFactor:", v6);
    if (-[THDocumentViewController parentViewController](self, "parentViewController"))
      objc_msgSend(-[THDocumentReflowableLayoutConfiguration environment](self->_configuration, "environment"), "setView:", objc_msgSend(-[THDocumentViewController parentViewController](self, "parentViewController"), "view"));
    if (-[THDocumentViewController inFlowMode](self, "inFlowMode"))
      v7 = 2;
    else
      v7 = 1;
    -[THDocumentReflowableLayoutConfiguration setLayout:](-[THDocumentViewController configuration](self, "configuration"), "setLayout:", v7);
    objc_msgSend(+[THApplicationSettings sharedSettings](THApplicationSettings, "sharedSettings"), "flowFontScaleForFontSize:", -[THDocumentViewController flowSizeScale](self, "flowSizeScale"));
    -[THDocumentReflowableLayoutConfiguration setOverrideFontSize:](-[THDocumentViewController configuration](self, "configuration"), "setOverrideFontSize:", v8);
    return self->_configuration;
  }
  return result;
}

- (double)statusBarHeight
{
  double result;

  if (-[THDocumentViewController p_prefersStatusBarHidden](self, "p_prefersStatusBarHidden"))
    return 0.0;
  objc_msgSend(UIApp, "statusBarHeight");
  return result;
}

- (double)toolbarHeight
{
  unsigned int v2;
  double result;

  v2 = -[THDocumentViewController th_cachedIsCompactHeight](self, "th_cachedIsCompactHeight");
  result = 44.0;
  if (v2)
    return 32.0;
  return result;
}

- (double)fontSize
{
  return (double)(unint64_t)objc_msgSend(objc_msgSend(objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "properties"), "paginatedPresentationType"), "fontSize");
}

- (BOOL)isEpub
{
  return objc_msgSend(-[THDocumentViewController documentRoot](self, "documentRoot"), "isEPUB");
}

- (BOOL)im_isRTL
{
  return 0;
}

- (double)topBarHeight
{
  double result;

  -[THToolbarDelegate topBarHeight](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "topBarHeight");
  return result;
}

- (double)bottomBarHeight
{
  double result;

  -[THToolbarDelegate bottomBarHeight](-[THDocumentViewController toolbarDelegate](self, "toolbarDelegate"), "bottomBarHeight");
  return result;
}

- (BOOL)isScrubberDisabled
{
  return 0;
}

- (BOOL)willAdjustHeightForSnapshot
{
  id v2;
  uint64_t v3;
  int v4;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGRect v19;
  CGRect v20;

  v2 = -[THDocumentViewController view](self, "view");
  v4 = isPad(v2, v3);
  if (v4)
  {
    v5 = objc_msgSend(v2, "window");
    if (!v5)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL isSnapshotContainerFullscreenForView(UIView *)"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THDocumentViewController.mm"), 195, CFSTR("invalid nil value for '%s'"), "window");
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(objc_msgSend(v5, "screen"), "bounds");
    v20.origin.x = v14;
    v20.origin.y = v15;
    v20.size.width = v16;
    v20.size.height = v17;
    v19.origin.x = v7;
    v19.origin.y = v9;
    v19.size.width = v11;
    v19.size.height = v13;
    LOBYTE(v4) = CGRectEqualToRect(v19, v20);
  }
  return v4;
}

- (id)transitionContentView
{
  return *(id *)&self->TSADocumentViewController_opaque[OBJC_IVAR___TSADocumentViewController__scrollView];
}

- (void)buildHoverControlRegionForInteraction:(id)a3 withBuilder:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIUserInterfaceLayoutDirection v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double MaxX;
  double v29;
  double v30;
  double v31;

  if (-[THDocumentViewController isEpub](self, "isEpub"))
  {
    -[THDocumentReflowableLayoutConfiguration scrubberFrame](-[THDocumentViewController configuration](self, "configuration"), "scrubberFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(objc_msgSend(a3, "view"), "bounds");
    MinX = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    if (-[THDocumentReflowableLayoutConfiguration isScroll](-[THDocumentViewController configuration](self, "configuration"), "isScroll")&& -[THDocumentReflowableLayoutConfiguration layout](-[THDocumentViewController configuration](self, "configuration"), "layout") == (char *)&dword_0 + 2)
    {
      v23 = -[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "userInterfaceLayoutDirection");
      v24 = v8;
      v25 = v10;
      v26 = v12;
      v27 = v14;
      if (v23 == UIUserInterfaceLayoutDirectionRightToLeft)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v24);
      }
      else
      {
        MinX = CGRectGetMinX(*(CGRect *)&v24);
        MaxX = v20 - MinX;
      }
    }
    else
    {
      -[THDocumentReflowableLayoutConfiguration bottomFullWidthToolbarFrame](-[THDocumentViewController configuration](self, "configuration"), "bottomFullWidthToolbarFrame");
      MinX = v29;
      v18 = v30;
      v22 = v31;
    }
    objc_msgSend(a4, "addRegionWithRect:", MinX, v18, MaxX, v22);
  }
}

- (THDocumentLinkResolver)documentLinkResolver
{
  return self->mDocumentLinkResolver;
}

- (void)setDocumentLinkResolver:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 232);
}

- (int)pagePaddingOptions
{
  return self->mPagePaddingOptions;
}

- (void)setPagePaddingOptions:(int)a3
{
  self->mPagePaddingOptions = a3;
}

- (BOOL)preventVisibleInfoUpdates
{
  return self->mPreventVisibleInfoUpdates;
}

- (void)setPreventVisibleInfoUpdates:(BOOL)a3
{
  self->mPreventVisibleInfoUpdates = a3;
}

- (THWExpandedViewController)expandedViewController
{
  return self->mExpandedViewController;
}

- (void)setExpandedViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 480);
}

- (THModelNavigableAnchor)orientationAnchor
{
  return self->mOrientationAnchor;
}

- (void)setOrientationAnchor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 248);
}

- (THToolbarDelegate)toolbarDelegate
{
  return self->mToolbarDelegate;
}

- (void)setToolbarDelegate:(id)a3
{
  self->mToolbarDelegate = (THToolbarDelegate *)a3;
}

- (THBookNavigation)bookNavigationDelegate
{
  return self->mBookNavigationDelegate;
}

- (void)setBookNavigationDelegate:(id)a3
{
  self->mBookNavigationDelegate = (THBookNavigation *)a3;
}

- (_NSRange)visibleRelativePageRange
{
  _NSRange *p_mVisibleRelativePageRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_mVisibleRelativePageRange = &self->mVisibleRelativePageRange;
  location = self->mVisibleRelativePageRange.location;
  length = p_mVisibleRelativePageRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setVisibleRelativePageRange:(_NSRange)a3
{
  self->mVisibleRelativePageRange = a3;
}

- (THUserAnnotationDelegate)userAnnotationDelegate
{
  return self->mUserAnnotationDelegate;
}

- (void)setUserAnnotationDelegate:(id)a3
{
  self->mUserAnnotationDelegate = (THUserAnnotationDelegate *)a3;
}

- (THSpinnerProvider)spinnerProvider
{
  return self->mSpinnerProvider;
}

- (void)setSpinnerProvider:(id)a3
{
  self->mSpinnerProvider = (THSpinnerProvider *)a3;
}

- (THRevealTOCDelegate)revealTOCDelegate
{
  return self->mRevealTOCDelegate;
}

- (void)setRevealTOCDelegate:(id)a3
{
  self->mRevealTOCDelegate = (THRevealTOCDelegate *)a3;
}

- (THBookPropertiesProvider)bookPropertiesDelegate
{
  return self->mBookPropertiesDelegate;
}

- (void)setBookPropertiesDelegate:(id)a3
{
  self->mBookPropertiesDelegate = (THBookPropertiesProvider *)a3;
}

- (THThemeDelegate)themeDelegate
{
  return self->mThemeDelegate;
}

- (void)setThemeDelegate:(id)a3
{
  self->mThemeDelegate = (THThemeDelegate *)a3;
}

- (THPageNumberView)contentPageNumberView
{
  return self->mContentPageNumberView;
}

- (void)setContentPageNumberView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (THPageNumberView)navOverlayPageNumberView
{
  return self->mNavOverlayPageNumberView;
}

- (void)setNavOverlayPageNumberView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (UIView)navigationOverlayContainer
{
  return self->mNavigationOverlayContainer;
}

- (void)setNavigationOverlayContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 600);
}

- (NSDate)lastPageNumberUpdate
{
  return self->mLastPageNumberUpdate;
}

- (void)setLastPageNumberUpdate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (THOverscrollImageView)leftOverscrollView
{
  return self->mLeftOverscrollView;
}

- (void)setLeftOverscrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 608);
}

- (THOverscrollImageView)rightOverscrollView
{
  return self->mRightOverscrollView;
}

- (void)setRightOverscrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 616);
}

- (UIView)topOverscrollView
{
  return self->mTopOverscrollView;
}

- (void)setTopOverscrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 368);
}

- (UIView)bottomOverscrollView
{
  return self->mBottomOverscrollView;
}

- (void)setBottomOverscrollView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 376);
}

- (UIView)overscrollTransitionView
{
  return self->mOverscrollTransitionView;
}

- (void)setOverscrollTransitionView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (BOOL)allowPortraitTOC
{
  return self->mAllowPortraitTOC;
}

- (void)setAllowPortraitTOC:(BOOL)a3
{
  self->mAllowPortraitTOC = a3;
}

- (BOOL)isRotating
{
  return self->mIsRotating;
}

- (CGPoint)lastScrollOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->mLastScrollOffset.x;
  y = self->mLastScrollOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLastScrollOffset:(CGPoint)a3
{
  self->mLastScrollOffset = a3;
}

- (unint64_t)lastAbsolutePageIndex
{
  return self->mLastAbsolutePageIndex;
}

- (void)setLastAbsolutePageIndex:(unint64_t)a3
{
  self->mLastAbsolutePageIndex = a3;
}

- (CGRect)visibleUnscaledRectBeforeRotation
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mVisibleUnscaledRectBeforeRotation.origin.x;
  y = self->mVisibleUnscaledRectBeforeRotation.origin.y;
  width = self->mVisibleUnscaledRectBeforeRotation.size.width;
  height = self->mVisibleUnscaledRectBeforeRotation.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVisibleUnscaledRectBeforeRotation:(CGRect)a3
{
  self->mVisibleUnscaledRectBeforeRotation = a3;
}

- (THGuidedPanController)guidedPanController
{
  return self->mGuidedPanController;
}

- (THRevealTOCPanController)revealTOCPanController
{
  return self->mRevealTOCPanController;
}

- (id)canvasDidZoomCompletion
{
  return self->mCanvasDidZoomCompletion;
}

- (void)setCanvasDidZoomCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (THDocumentNavigator)documentNavigator
{
  return self->mDocumentNavigator;
}

- (void)setDocumentNavigator:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 624);
}

- (THWAutoplayController)autoplayController
{
  return self->mAutoplayController;
}

- (THPageViewProvider)pageViewProvider
{
  return self->mPageViewProvider;
}

- (THPageViewDisplacement)pageViewDisplacement
{
  return self->mPageViewDisplacement;
}

- (void)setPageViewDisplacement:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 640);
}

- (BOOL)firstLoad
{
  return self->mFirstLoad;
}

- (void)setFirstLoad:(BOOL)a3
{
  self->mFirstLoad = a3;
}

- (BOOL)isRevealingTOC
{
  return self->mIsRevealingTOC;
}

- (void)setIsRevealingTOC:(BOOL)a3
{
  self->mIsRevealingTOC = a3;
}

- (BOOL)isTwoUp
{
  return self->_isTwoUp;
}

- (unint64_t)flowSizeScale
{
  return self->_flowSizeScale;
}

- (void)setFlowSizeScale:(unint64_t)a3
{
  self->_flowSizeScale = a3;
}

- (THSectionController)activeSectionController
{
  return self->_activeSectionController;
}

- (void)setActiveSectionController:(id)a3
{
  self->_activeSectionController = (THSectionController *)a3;
}

- (BOOL)showFlowModeIfAvailable
{
  return self->_showFlowModeIfAvailable;
}

- (void)setShowFlowModeIfAvailable:(BOOL)a3
{
  self->_showFlowModeIfAvailable = a3;
}

- (THPaginationStatusDelegate)paginationDelegate
{
  return self->_paginationDelegate;
}

- (void)setPaginationDelegate:(id)a3
{
  self->_paginationDelegate = (THPaginationStatusDelegate *)a3;
}

- (THReadingStatisticsDelegate)readingStatisticsDelegate
{
  return self->_readingStatisticsDelegate;
}

- (void)setReadingStatisticsDelegate:(id)a3
{
  self->_readingStatisticsDelegate = (THReadingStatisticsDelegate *)a3;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (BOOL)deferCanvasLayoutToAfterRotationHasCompleted
{
  return self->_deferCanvasLayoutToAfterRotationHasCompleted;
}

- (void)setDeferCanvasLayoutToAfterRotationHasCompleted:(BOOL)a3
{
  self->_deferCanvasLayoutToAfterRotationHasCompleted = a3;
}

- (BOOL)performanceModeBookOpening
{
  return self->_performanceModeBookOpening;
}

- (BOOL)visibleInfoUpdatesAllowedInLandscape
{
  return self->_visibleInfoUpdatesAllowedInLandscape;
}

- (void)setVisibleInfoUpdatesAllowedInLandscape:(BOOL)a3
{
  self->_visibleInfoUpdatesAllowedInLandscape = a3;
}

- (BCDisplaySleepController)displaySleepController
{
  return self->_displaySleepController;
}

- (THSectionController)flowSectionController
{
  return self->_flowSectionController;
}

- (void)setFlowSectionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 704);
}

- (THSectionController)paginatedSectionController
{
  return self->_paginatedSectionController;
}

- (void)setPaginatedSectionController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 712);
}

- (THReflowablePaginationController)reflowablePaginationController
{
  return self->_reflowablePaginationController;
}

- (void)setReflowablePaginationController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 720);
}

- (THWFreeTransformController)ftc
{
  return self->_ftc;
}

- (void)setFtc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 728);
}

- (BKScrubberControl)scrubber
{
  return self->_scrubber;
}

- (void)setScrubber:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 736);
}

- (BKScrubberCalloutView)scrubberCallout
{
  return self->_scrubberCallout;
}

- (void)setScrubberCallout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 744);
}

- (double)scrubberCalloutWidth
{
  return self->_scrubberCalloutWidth;
}

- (void)setScrubberCalloutWidth:(double)a3
{
  self->_scrubberCalloutWidth = a3;
}

- (THModelStorageAnchor)lastStorageAnchor
{
  return self->_lastStorageAnchor;
}

- (void)setLastStorageAnchor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 760);
}

- (BOOL)justUpdatedPresentationType
{
  return self->_justUpdatedPresentationType;
}

- (void)setJustUpdatedPresentationType:(BOOL)a3
{
  self->_justUpdatedPresentationType = a3;
}

- (NSMutableDictionary)statusBarHeightForOrientation
{
  return self->_statusBarHeightForOrientation;
}

- (void)setStatusBarHeightForOrientation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 768);
}

- (CGRect)previousContentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_previousContentFrame.origin.x;
  y = self->_previousContentFrame.origin.y;
  width = self->_previousContentFrame.size.width;
  height = self->_previousContentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreviousContentFrame:(CGRect)a3
{
  self->_previousContentFrame = a3;
}

- (CGPoint)beginDraggingContentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_beginDraggingContentOffset.x;
  y = self->_beginDraggingContentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setBeginDraggingContentOffset:(CGPoint)a3
{
  self->_beginDraggingContentOffset = a3;
}

- (CGSize)previousTransitionSize
{
  double width;
  double height;
  CGSize result;

  width = self->_previousTransitionSize.width;
  height = self->_previousTransitionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreviousTransitionSize:(CGSize)a3
{
  self->_previousTransitionSize = a3;
}

- (BOOL)inGuidedPan
{
  return self->_inGuidedPan;
}

- (void)setInGuidedPan:(BOOL)a3
{
  self->_inGuidedPan = a3;
}

- (int)compactFlowPresentationState
{
  return self->_compactFlowPresentationState;
}

- (void)setCompactFlowPresentationState:(int)a3
{
  self->_compactFlowPresentationState = a3;
}

- (BOOL)transitioningFromTwoUpToOneUp
{
  return self->_transitioningFromTwoUpToOneUp;
}

- (void)setTransitioningFromTwoUpToOneUp:(BOOL)a3
{
  self->_transitioningFromTwoUpToOneUp = a3;
}

- (BOOL)transitioningFromOneUpToTwoUp
{
  return self->_transitioningFromOneUpToTwoUp;
}

- (void)setTransitioningFromOneUpToTwoUp:(BOOL)a3
{
  self->_transitioningFromOneUpToTwoUp = a3;
}

- (CGSize)lastLayoutSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLayoutSize.width;
  height = self->_lastLayoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLayoutSize:(CGSize)a3
{
  self->_lastLayoutSize = a3;
}

- (BOOL)isTransitioning
{
  return self->_isTransitioning;
}

- (void)setIsTransitioning:(BOOL)a3
{
  self->_isTransitioning = a3;
}

- (CGSize)lastLayoutBoundsSize
{
  double width;
  double height;
  CGSize result;

  width = self->_lastLayoutBoundsSize.width;
  height = self->_lastLayoutBoundsSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setLastLayoutBoundsSize:(CGSize)a3
{
  self->_lastLayoutBoundsSize = a3;
}

- (BOOL)isScrubbing
{
  return self->_isScrubbing;
}

- (void)setIsScrubbing:(BOOL)a3
{
  self->_isScrubbing = a3;
}

- (BOOL)scrubberCalloutFollowsScrollerThumb
{
  return self->_scrubberCalloutFollowsScrollerThumb;
}

- (void)setScrubberCalloutFollowsScrollerThumb:(BOOL)a3
{
  self->_scrubberCalloutFollowsScrollerThumb = a3;
}

@end
