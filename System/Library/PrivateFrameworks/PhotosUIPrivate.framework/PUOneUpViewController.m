@implementation PUOneUpViewController

- (PUOneUpViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[PUOneUpViewController initWithBrowsingSession:options:](self, "initWithBrowsingSession:options:", 0, 0);
}

- (PUOneUpViewController)initWithCoder:(id)a3
{
  return -[PUOneUpViewController initWithBrowsingSession:options:](self, "initWithBrowsingSession:options:", 0, 0);
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4
{
  return -[PUOneUpViewController initWithBrowsingSession:options:initialActivity:](self, "initWithBrowsingSession:options:initialActivity:", a3, a4, 0);
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5
{
  return -[PUOneUpViewController initWithBrowsingSession:options:initialActivity:presentationOrigin:](self, "initWithBrowsingSession:options:initialActivity:presentationOrigin:", a3, a4, a5, 0);
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3 options:(unint64_t)a4 initialActivity:(unint64_t)a5 presentationOrigin:(int64_t)a6
{
  id v12;
  PUOneUpViewController *v13;
  PUOneUpViewController *v14;
  uint64_t v15;
  OS_dispatch_queue *preheatAssetsQueue;
  void *v17;
  PUOneUpViewControllerSpec *v18;
  PUOneUpViewControllerSpec *spec;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *scrubbingIdentifier;
  PUBrowsingSession **p_browsingSession;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  PUOneUpVisualImageAnalyzingController *v30;
  PUOneUpVisualImageAnalyzingController *visualImageAnalyzingController;
  PULoadingIndicatorController *v32;
  PULoadingIndicatorController *loadingIndicatorController;
  uint64_t v34;
  PUAggregateDictionaryTracer *aggregateDictionaryTracer;
  uint64_t v36;
  PXUserEventTracker *userEventTracker;
  uint64_t v38;
  PUOneUpEventTracker *eventTracker;
  PUInteractiveSwipeDismissalController *v40;
  PUInteractiveSwipeDismissalController *interactiveSwipeDismissalController;
  PUInteractivePinchDismissalController *v42;
  PUInteractivePinchDismissalController *interactivePinchDismissalController;
  uint64_t v44;
  PUOneUpDefaultActionsController *v45;
  PUOneUpActionsController **p_actionsController;
  PUOneUpChromeViewController *v47;
  PUOneUpChromeViewController *chromeViewController;
  PUOneUpBarsController *v49;
  PUOneUpBarsController *barsController;
  PUDoubleTapZoomController *v51;
  PUDoubleTapZoomController *doubleTapZoomController;
  void *v53;
  int v54;
  PUAccessoryVisibilityInteractionController *v55;
  PUAccessoryVisibilityInteractionController *accessoryVisibilityInteractionController;
  PUOneUpAccessoryViewControllersManager *v57;
  PUBrowsingSession *v58;
  void *v59;
  uint64_t v60;
  PUOneUpAccessoryViewControllersManager *accessoryViewControllersManager;
  PUOneUpAccessoryViewControllersManager *v62;
  void *v63;
  uint64_t v64;
  PXFloatingCardPresentationController *cardPresentationController;
  PUOneUpGestureRecognizerCoordinator *v66;
  PUOneUpGestureRecognizerCoordinator *gestureRecognizerCoordinator;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  int v74;
  PUParallaxComputer *v75;
  PUParallaxComputer *parallaxComputer;
  PUParallaxComputer *v77;
  void *v78;
  PUParallaxComputer *v79;
  void *v80;
  double v81;
  PUBrowsingOneUpVisibilityHelper *v82;
  NSMutableSet *v83;
  NSMutableSet *activeVideoTileControllers;
  void *v86;
  objc_super v87;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("browsingSession != nil"));

  }
  v87.receiver = self;
  v87.super_class = (Class)PUOneUpViewController;
  v13 = -[PUOneUpViewController initWithNibName:bundle:](&v87, sel_initWithNibName_bundle_, 0, 0);
  v14 = v13;
  if (v13)
  {
    v13->__options = a4;
    v13->__initialActivity = a5;
    px_dispatch_queue_create_serial();
    v15 = objc_claimAutoreleasedReturnValue();
    preheatAssetsQueue = v14->_preheatAssetsQueue;
    v14->_preheatAssetsQueue = (OS_dispatch_queue *)v15;

    PXRegisterPreferencesObserver();
    -[PUOneUpViewController navigationItem](v14, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_setPreferredLargeTitleDisplayMode:", 2);

    v18 = -[PUOneUpViewControllerSpec initWithOptions:]([PUOneUpViewControllerSpec alloc], "initWithOptions:", a4);
    spec = v14->__spec;
    v14->__spec = v18;

    -[PUViewControllerSpec registerChangeObserver:](v14->__spec, "registerChangeObserver:", v14);
    v14->__needsUpdateSpec = 1;
    objc_msgSend((id)objc_opt_class(), "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringByAppendingString:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    scrubbingIdentifier = v14->_scrubbingIdentifier;
    v14->_scrubbingIdentifier = (NSString *)v23;

    p_browsingSession = &v14->_browsingSession;
    objc_storeStrong((id *)&v14->_browsingSession, a3);
    v14->_presentationOrigin = a6;
    -[PUBrowsingSession viewModel](v14->_browsingSession, "viewModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "registerChangeObserver:", v14);
    -[PUOneUpViewController traitCollection](v14, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHorizontalSizeClass:", objc_msgSend(v27, "horizontalSizeClass"));

    -[PUOneUpViewController _preheatAdjacentAssetsForPhotosDetailsContext](v14, "_preheatAdjacentAssetsForPhotosDetailsContext");
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "allowVisualIntelligence");

    if ((a4 & 0x40000) == 0 && v29)
    {
      v30 = -[PUOneUpVisualImageAnalyzingController initWithBrowsingViewModel:]([PUOneUpVisualImageAnalyzingController alloc], "initWithBrowsingViewModel:", v26);
      visualImageAnalyzingController = v14->_visualImageAnalyzingController;
      v14->_visualImageAnalyzingController = v30;

    }
    v32 = objc_alloc_init(PULoadingIndicatorController);
    loadingIndicatorController = v14->_loadingIndicatorController;
    v14->_loadingIndicatorController = v32;

    v14->__needsUpdateLayout = 1;
    v14->__isPresentedForSecondScreen = (a4 & 2) != 0;
    v14->__prefersCompactLayoutForSplitScreen = (a4 & 0x400) != 0;
    if ((a4 & 2) == 0)
    {
      +[PUAggregateDictionaryTracer sharedTracer](PUAggregateDictionaryTracer, "sharedTracer");
      v34 = objc_claimAutoreleasedReturnValue();
      aggregateDictionaryTracer = v14->_aggregateDictionaryTracer;
      v14->_aggregateDictionaryTracer = (PUAggregateDictionaryTracer *)v34;

      objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
      v36 = objc_claimAutoreleasedReturnValue();
      userEventTracker = v14->_userEventTracker;
      v14->_userEventTracker = (PXUserEventTracker *)v36;

      PUOneUpEventTrackerCreate(v26, a6);
      v38 = objc_claimAutoreleasedReturnValue();
      eventTracker = v14->_eventTracker;
      v14->_eventTracker = (PUOneUpEventTracker *)v38;

      v40 = objc_alloc_init(PUInteractiveSwipeDismissalController);
      interactiveSwipeDismissalController = v14->__interactiveSwipeDismissalController;
      v14->__interactiveSwipeDismissalController = v40;

      -[PUInteractiveDismissalController setDelegate:](v14->__interactiveSwipeDismissalController, "setDelegate:", v14);
      v42 = objc_alloc_init(PUInteractivePinchDismissalController);
      interactivePinchDismissalController = v14->__interactivePinchDismissalController;
      v14->__interactivePinchDismissalController = v42;

      -[PUInteractiveDismissalController setDelegate:](v14->__interactivePinchDismissalController, "setDelegate:", v14);
      if (-[PUOneUpViewController wantsSpotlightStyling](v14, "wantsSpotlightStyling"))
      {
        v44 = 1;
      }
      else if ((a4 & 0x20000) != 0)
      {
        v44 = 2;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v44 = 3;
        else
          v44 = 0;
      }
      v45 = -[PUOneUpDefaultActionsController initWithBrowsingSession:viewController:]([PUOneUpDefaultActionsController alloc], "initWithBrowsingSession:viewController:", v12, v14);
      -[PUOneUpDefaultActionsController setDelegate:](v45, "setDelegate:", v14);
      -[PUOneUpDefaultActionsController setAssetActionManagerSource:](v45, "setAssetActionManagerSource:", v14);
      p_actionsController = &v14->_actionsController;
      objc_storeStrong((id *)&v14->_actionsController, v45);
      if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
      {
        v47 = -[PUOneUpChromeViewController initWithBrowsingSession:actionsController:]([PUOneUpChromeViewController alloc], "initWithBrowsingSession:actionsController:", v12, *p_actionsController);
        chromeViewController = v14->_chromeViewController;
        v14->_chromeViewController = v47;

        -[PUOneUpChromeViewController setDelegate:](v14->_chromeViewController, "setDelegate:", v14);
        -[PUOneUpViewController _invalidateChromeViewController](v14, "_invalidateChromeViewController");
      }
      else
      {
        v49 = -[PUOneUpBarsController initWithStyle:browsingSession:viewController:actionsController:delegate:]([PUOneUpBarsController alloc], "initWithStyle:browsingSession:viewController:actionsController:delegate:", v44, *p_browsingSession, v14, *p_actionsController, v14);
        barsController = v14->__barsController;
        v14->__barsController = v49;

        v14->__needsUpdateBarsController = 1;
        v51 = objc_alloc_init(PUDoubleTapZoomController);
        doubleTapZoomController = v14->__doubleTapZoomController;
        v14->__doubleTapZoomController = v51;

        -[PUDoubleTapZoomController setDelegate:](v14->__doubleTapZoomController, "setDelegate:", v14);
      }
      -[PUOneUpViewController _spec](v14, "_spec");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "allowAccessoryVisibility");

      if (v54)
      {
        v55 = objc_alloc_init(PUAccessoryVisibilityInteractionController);
        accessoryVisibilityInteractionController = v14->__accessoryVisibilityInteractionController;
        v14->__accessoryVisibilityInteractionController = v55;

        -[PUAccessoryVisibilityInteractionController setDelegate:](v14->__accessoryVisibilityInteractionController, "setDelegate:", v14);
        -[PUAccessoryVisibilityInteractionController setBrowsingSession:](v14->__accessoryVisibilityInteractionController, "setBrowsingSession:", v12);
        v57 = [PUOneUpAccessoryViewControllersManager alloc];
        v58 = *p_browsingSession;
        -[PUOneUpViewController _spec](v14, "_spec");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = -[PUOneUpAccessoryViewControllersManager initWithBrowsingSession:spec:](v57, "initWithBrowsingSession:spec:", v58, v59);
        accessoryViewControllersManager = v14->__accessoryViewControllersManager;
        v14->__accessoryViewControllersManager = (PUOneUpAccessoryViewControllersManager *)v60;

        v62 = v14->__accessoryViewControllersManager;
        -[PUOneUpViewController unlockDeviceStatus](v14, "unlockDeviceStatus");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUOneUpAccessoryViewControllersManager setUnlockDeviceStatus:](v62, "setUnlockDeviceStatus:", v63);

        -[PUOneUpAccessoryViewControllersManager setDelegate:](v14->__accessoryViewControllersManager, "setDelegate:", v14);
        v64 = objc_msgSend(objc_alloc(MEMORY[0x1E0D7B440]), "initWithContainerViewController:", v14);
        cardPresentationController = v14->cardPresentationController;
        v14->cardPresentationController = (PXFloatingCardPresentationController *)v64;

        -[PXFloatingCardPresentationController setDelegate:](v14->cardPresentationController, "setDelegate:", v14);
      }
      v66 = objc_alloc_init(PUOneUpGestureRecognizerCoordinator);
      gestureRecognizerCoordinator = v14->__gestureRecognizerCoordinator;
      v14->__gestureRecognizerCoordinator = v66;

      -[PUOneUpGestureRecognizerCoordinator setOneUpBarsController:](v14->__gestureRecognizerCoordinator, "setOneUpBarsController:", v14->__barsController);
      -[PUOneUpGestureRecognizerCoordinator setDoubleTapZoomController:](v14->__gestureRecognizerCoordinator, "setDoubleTapZoomController:", v14->__doubleTapZoomController);
      -[PUOneUpGestureRecognizerCoordinator setBrowsingSession:](v14->__gestureRecognizerCoordinator, "setBrowsingSession:", *p_browsingSession);
      -[PUOneUpGestureRecognizerCoordinator setDelegate:](v14->__gestureRecognizerCoordinator, "setDelegate:", v14);
      -[PUOneUpGestureRecognizerCoordinator touchingGestureRecognizer](v14->__gestureRecognizerCoordinator, "touchingGestureRecognizer");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "addTarget:action:", v14, sel__handleTouchGesture_);

    }
    v69 = a4 & 2;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "addObserver:selector:name:object:", v14, sel__browsingVideoPlayerDidPlayToEndTime_, PUBrowsingVideoPlayerDidPlayToEndTimeNotification, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "addObserver:selector:name:object:", v14, sel__keyboardWillShow_, *MEMORY[0x1E0DC4FE8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "addObserver:selector:name:object:", v14, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "allowParallax");

    if (v74 && !UIAccessibilityIsReduceMotionEnabled())
    {
      v75 = objc_alloc_init(PUParallaxComputer);
      parallaxComputer = v14->__parallaxComputer;
      v14->__parallaxComputer = v75;

      v77 = v14->__parallaxComputer;
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUParallaxComputer setModel:](v77, "setModel:", objc_msgSend(v78, "parallaxModel"));

      v79 = v14->__parallaxComputer;
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "parallaxFactor");
      -[PUParallaxComputer setParallaxFactor:](v79, "setParallaxFactor:", v81 / 100.0);

      -[PUParallaxComputer setAxis:](v14->__parallaxComputer, "setAxis:", 1);
    }
    v82 = -[PUBrowsingOneUpVisibilityHelper initWithBrowsingViewModel:isPresentedForSecondScreen:]([PUBrowsingOneUpVisibilityHelper alloc], "initWithBrowsingViewModel:isPresentedForSecondScreen:", v26, v69 != 0);
    -[PUOneUpViewController setBrowsingOneUpVisibilityHelper:](v14, "setBrowsingOneUpVisibilityHelper:", v82);

    v83 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeVideoTileControllers = v14->_activeVideoTileControllers;
    v14->_activeVideoTileControllers = v83;

    v14->_preferredContentSizeOverride = (CGSize)*MEMORY[0x1E0C9D820];
    v14->__needsUpdatePreferredContentSize = 1;
    -[PUOneUpViewController _updateImageAnalysisInteractionDelegate](v14, "_updateImageAnalysisInteractionDelegate");

  }
  return v14;
}

- (PUOneUpViewController)initWithBrowsingSession:(id)a3
{
  return -[PUOneUpViewController initWithBrowsingSession:options:](self, "initWithBrowsingSession:options:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  PXUnregisterPreferencesObserver();
  -[PUTilingView setDelegate:](self->__tilingView, "setDelegate:", 0);
  -[PUAggregateDictionaryTracer invalidateContext:](self->_aggregateDictionaryTracer, "invalidateContext:", self);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresentedForPreview");

  if (!-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen") && (v5 & 1) == 0)
  {
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterContentProvider:", self);

  }
  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController dealloc](&v7, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = (id)objc_opt_new();
  -[PUOneUpViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  UIView *v5;
  UIView *contentContainerView;
  id v7;
  PUTilingView *v8;
  PUTilingView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUOneUpGestureController *v14;
  void *v15;
  PUOneUpGestureController *v16;
  PUOneUpGestureController *gestureController;
  PUOneUpFeedbackController *v18;
  void *v19;
  void *v20;
  PUOneUpFeedbackController *v21;
  PUOneUpFeedbackController *feedbackController;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  objc_super v48;
  _QWORD v49[5];

  v49[4] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewDidLoad](&v48, sel_viewDidLoad);
  -[PUOneUpViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  objc_msgSend(v3, "bounds");
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v5;

  -[UIView setAutoresizingMask:](self->_contentContainerView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_contentContainerView);
  if (!-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
    -[PUOneUpViewController px_enableImageModulation](self, "px_enableImageModulation");
  if ((-[PUOneUpViewController _options](self, "_options") & 1) == 0)
  {
    v7 = -[PUOneUpViewController _newOneUpLayout](self, "_newOneUpLayout");
    v8 = [PUTilingView alloc];
    objc_msgSend(v3, "bounds");
    v9 = -[PUTilingView initWithFrame:layout:](v8, "initWithFrame:layout:", v7);
    -[PUTilingView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[PUOneUpViewController contentContainerView](self, "contentContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v9);

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configureTilingView:", v9);
    if (!-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
      -[PUTilingView configureDynamicRangeProperties](v9, "configureDynamicRangeProperties");
    -[PUOneUpViewController _setTilingView:](self, "_setTilingView:", v9);
    -[PUOneUpViewController _updateLayoutReferenceSize](self, "_updateLayoutReferenceSize");

  }
  +[PURootSettings sharedInstance](PURootSettings, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addDeferredKeyObserver:", self);

  +[PUIrisSettings sharedInstance](PUIrisSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addDeferredKeyObserver:", self);

  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    v14 = [PUOneUpGestureController alloc];
    -[PUOneUpViewController actionsController](self, "actionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUOneUpGestureController initWithView:actionsController:](v14, "initWithView:actionsController:", v3, v15);
    gestureController = self->_gestureController;
    self->_gestureController = v16;

    -[PUOneUpGestureController setDelegate:](self->_gestureController, "setDelegate:", self);
    v18 = [PUOneUpFeedbackController alloc];
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[PUOneUpFeedbackController initWithViewModel:](v18, "initWithViewModel:", v20);
    feedbackController = self->_feedbackController;
    self->_feedbackController = v21;

  }
  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[PUOneUpViewController view](self, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "willMoveToParentViewController:", self);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "addSubview:", v26);
    v41 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v26, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v44;
    objc_msgSend(v26, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v40;
    objc_msgSend(v26, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topAnchor");
    v47 = v3;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v30;
    objc_msgSend(v26, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 4);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "activateConstraints:", v34);

    v3 = v47;
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController addChildViewController:](self, "addChildViewController:", v35);

    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "didMoveToParentViewController:", self);
  }
  else
  {
    -[PUOneUpViewController navigationController](self, "navigationController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "navigationBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "standardAppearance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setScrollEdgeAppearance:", v38);

    -[PUOneUpViewController navigationController](self, "navigationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "toolbar");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v26, "standardAppearance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setScrollEdgeAppearance:", v36);
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  PUOneUpViewController *v24;
  id v25;
  objc_super v26;

  v3 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillAppear:](&v26, sel_viewWillAppear_);
  -[PUOneUpViewController _updateLayoutReferenceSize](self, "_updateLayoutReferenceSize");
  -[PUOneUpViewController _updateWindowInterfaceOrientation](self, "_updateWindowInterfaceOrientation");
  -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUOneUpViewController _barsController](self, "_barsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateViewControllerView");
  if ((-[PUOneUpViewController isBeingPresented](self, "isBeingPresented") & 1) != 0
    || -[PUOneUpViewController isMovingToParentViewController](self, "isMovingToParentViewController"))
  {
    -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
  }
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
  objc_msgSend(v5, "updateIfNeeded");
  -[PUOneUpViewController _spec](self, "_spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3 & ~objc_msgSend(v6, "shouldDisableNavigationBarsVisibility");

  -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v7);
  objc_msgSend(v5, "invalidateViewControllerView");
  objc_msgSend(v5, "updateIfNeeded");
  -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidateDelegateData");

  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidateDelegateData");

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetViewModelForAssetReference:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "irisPlayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __40__PUOneUpViewController_viewWillAppear___block_invoke;
  v22[3] = &unk_1E58AB790;
  v23 = v11;
  v24 = self;
  v25 = v14;
  v15 = v14;
  v16 = v11;
  objc_msgSend(v16, "performChanges:", v22);
  v17 = -[PUOneUpViewController _initialActivity](self, "_initialActivity");
  if (v17 == 2)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "performSimpleActionWithActionType:", 48);

  }
  else if (v17 == 1)
  {
    self->_actionTypeToPerformInViewDidAppear = 15;
  }
  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "viewControllerWillAppear");

  -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "viewControllerWillAppear");

  objc_msgSend(MEMORY[0x1E0D7B650], "setTipsPresentationDelegate:", self);
  -[PUOneUpViewController _setInitialActivity:](self, "_setInitialActivity:", 0);
  -[PUOneUpViewController userEventTracker](self, "userEventTracker");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "eventSourceWillAppear:sender:", 3, self);

  -[PUOneUpViewController setAppearState:](self, "setAppearState:", 1);
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  -[PUOneUpViewController _invalidateInfoPanelLayoutAnimated:](self, "_invalidateInfoPanelLayoutAnimated:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  PUOneUpViewController *v41;
  id v42;
  BOOL v43;
  BOOL v44;
  uint8_t buf[16];
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewDidAppear:](&v46, sel_viewDidAppear_, a3);
  PLOneUpGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "1Up signpost: 1Up viewController viewDidAppear", buf, 2u);
  }

  -[PUOneUpViewController _xct_beginSignpostingForImageTileImageLoadingAndProcessing](self, "_xct_beginSignpostingForImageTileImageLoadingAndProcessing");
  -[PUOneUpViewController browsingOneUpVisibilityHelper](self, "browsingOneUpVisibilityHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsOneUpVisible:", 1);

  -[PUOneUpViewController visualImageAnalyzingController](self, "visualImageAnalyzingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsEnabled:", 1);

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPresentedForPreview");

  v10 = -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen");
  if (!v10 && (v9 & 1) == 0)
  {
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerContentProvider:", self);

  }
  objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerObserver:", self);

  -[PUOneUpViewController _scheduleTimedChromeAutoHide](self, "_scheduleTimedChromeAutoHide");
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "assetViewModelForCurrentAssetReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "asset");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "playbackStyle") == 5;
  v18 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __39__PUOneUpViewController_viewDidAppear___block_invoke;
  v39[3] = &unk_1E58A2E68;
  v19 = v14;
  v40 = v19;
  v41 = self;
  v43 = v10;
  v44 = v17;
  v20 = v15;
  v42 = v20;
  objc_msgSend(v19, "performChanges:", v39);
  -[PUOneUpViewController _setShouldDisableTransitionsUntilAppeared:](self, "_setShouldDisableTransitionsUntilAppeared:", 0);
  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userStartedViewingCurrentAssetOfBrowsingViewModel:inContext:", v19, self);

  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logViewControllerDidAppear:", self);

  -[PUOneUpViewController setAppearState:](self, "setAppearState:", 2);
  -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
  -[PUOneUpViewController _invalidateUserActivity](self, "_invalidateUserActivity");
  -[PUOneUpViewController _invalidateCachedBoopableItemProvider](self, "_invalidateCachedBoopableItemProvider");
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
  -[PUOneUpViewController editActivityCompletion](self, "editActivityCompletion");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (self->_actionTypeToPerformInViewDidAppear)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "performSimpleActionWithActionType:", self->_actionTypeToPerformInViewDidAppear);

    self->_actionTypeToPerformInViewDidAppear = 0;
    if (v24)
    {
      -[PUOneUpViewController navigationController](self, "navigationController");
      v33 = v18;
      v34 = 3221225472;
      v35 = __39__PUOneUpViewController_viewDidAppear___block_invoke_3;
      v36 = &unk_1E58AB968;
      v37 = (id)objc_claimAutoreleasedReturnValue();
      v38 = v24;
      v26 = v37;
      objc_msgSend(v26, "ppt_performBlockAfterNextNavigationAnimation:", &v33);

LABEL_10:
      -[PUOneUpViewController setEditActivityCompletion:](self, "setEditActivityCompletion:", 0, v33, v34, v35, v36);
    }
  }
  else if (v23)
  {
    goto LABEL_10;
  }
  v27 = -[PUOneUpViewController _isAssetEligibleForTip:](self, "_isAssetEligibleForTip:", v16);
  -[PUOneUpViewController _barsController](self, "_barsController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "barButtonItemToggleDetails");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29 && v27)
    objc_msgSend(MEMORY[0x1E0D7B650], "signalOneUpPhotoOpened");
  +[PUPhotoEditViewController preheatEditDependenciesIfNeeded](PUPhotoEditViewController, "preheatEditDependenciesIfNeeded");
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "privacyController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "viewDidAppearForAuthenticationContext:", self);

  -[PUOneUpViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  PXAppIntentsRegisterViewAnnotationView();

  PXRegisterAppIntentsViewAnnotationDelegate();
}

- (BOOL)_isAssetEligibleForTip:(id)a3
{
  id v3;
  id v4;
  int v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if ((objc_msgSend(v4, "px_isScreenshot") & 1) != 0)
      LOBYTE(v5) = 0;
    else
      v5 = objc_msgSend(v4, "px_isScreenRecording") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillDisappear:](&v9, sel_viewWillDisappear_, a3);
  -[PUOneUpViewController browsingOneUpVisibilityHelper](self, "browsingOneUpVisibilityHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsOneUpVisible:", 0);

  -[PUOneUpViewController visualImageAnalyzingController](self, "visualImageAnalyzingController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsEnabled:", 0);

  -[PUOneUpViewController _cancelTimedChromeAutoHide](self, "_cancelTimedChromeAutoHide");
  -[PUOneUpViewController setAppearState:](self, "setAppearState:", 3);
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
  if (-[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible"))
    -[PUOneUpViewController _dismissTipPopoverAnimated:](self, "_dismissTipPopoverAnimated:", 0);
  objc_msgSend(MEMORY[0x1E0D7B650], "setTipsPresentationDelegate:", 0);
  -[PUOneUpViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserActivity:", 0);

  PXUnregisterAppIntentsViewAnnotationDelegate();
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  PUOneUpViewController *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  uint8_t buf[16];
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewDidDisappear:](&v33, sel_viewDidDisappear_, a3);
  PLOneUpGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEBUG, "1Up signpost: 1Up viewController viewDidDisappear", buf, 2u);
  }

  -[PUOneUpViewController _xct_endSignpostingForImageTileImageLoadingAndProcessing](self, "_xct_endSignpostingForImageTileImageLoadingAndProcessing");
  -[PUOneUpViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen")
      || (isKindOfClass & 1) != 0)
    {
      goto LABEL_10;
    }
  }
  else if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    goto LABEL_10;
  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPresentedForPreview");

  if ((v9 & 1) == 0)
  {
    +[PHAirPlayScreenController sharedInstance](PHAirPlayScreenController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterContentProvider:", self);

  }
LABEL_10:
  objc_msgSend(MEMORY[0x1E0D7CD28], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unregisterObserver:", self);

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController navigationController](self, "navigationController");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[PUOneUpViewController navigationController](self, "navigationController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "topViewController");
    v17 = (PUOneUpViewController *)objc_claimAutoreleasedReturnValue();

    if (v17 != self)
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "viewModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __42__PUOneUpViewController_viewDidDisappear___block_invoke;
      v30[3] = &unk_1E58ABD10;
      v31 = v19;
      v20 = v19;
      objc_msgSend(v20, "performChanges:", v30);

    }
  }
  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userStoppedViewingCurrentAssetOfBrowsingViewModel:inContext:", v13, self);

  -[PUOneUpViewController userEventTracker](self, "userEventTracker");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "eventSourceDidDisappear:sender:", 3, self);

  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "logViewControllerDidDisappear:", self);

  v24 = PXContentPrivacyNavigationStateFromViewController();
  if (v24 == 2)
  {
    -[PUOneUpViewController navigationController](self, "navigationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "viewControllers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count") != 1;

    v24 = 2 * v27;
  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "privacyController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "viewDidDisappearForAuthenticationContext:withNavigationState:", self, v24);

  -[PUOneUpViewController setAppearState:](self, "setAppearState:", 0);
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillLayoutSubviews](&v9, sel_viewWillLayoutSubviews);
  -[PUOneUpViewController _barsController](self, "_barsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  -[PUOneUpViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeAreaInsets");
  -[PUOneUpViewController _setLayoutSafeAreaInsets:](self, "_setLayoutSafeAreaInsets:");

  -[PUOneUpViewController _setPendingViewTransitionSize:](self, "_setPendingViewTransitionSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  -[PUOneUpViewController _updateLayoutReferenceSize](self, "_updateLayoutReferenceSize");
  -[PUOneUpViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  -[PUOneUpViewController _preloadInsetsBasedOffViewWidth](self, "_preloadInsetsBasedOffViewWidth");
  if (v7 != v8)
  {
    -[PUOneUpViewController _setPreloadInsetsBasedOffViewWidth:](self, "_setPreloadInsetsBasedOffViewWidth:", v7);
    -[PUOneUpViewController _invalidatePreloadInsets](self, "_invalidatePreloadInsets");
    -[PUOneUpViewController _updatePreloadInsetsIfNeeded](self, "_updatePreloadInsetsIfNeeded");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_, v4);
  -[PUOneUpViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __50__PUOneUpViewController_traitCollectionDidChange___block_invoke;
  v18 = &unk_1E58ABCA8;
  v19 = v7;
  v8 = v5;
  v20 = v8;
  v9 = v7;
  objc_msgSend(v9, "performChanges:", &v15);
  -[PUOneUpViewController traitCollection](self, "traitCollection", v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  v12 = objc_msgSend(v8, "horizontalSizeClass");
  v13 = objc_msgSend(v4, "horizontalSizeClass");
  if (v11 == 1 && v12 != v13)
  {
    -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
    -[PUOneUpViewController _invalidateAccessoryView](self, "_invalidateAccessoryView");
    -[PUOneUpViewController _setAccessoryVisible:](self, "_setAccessoryVisible:", 0);
  }
  v14 = objc_msgSend(v4, "userInterfaceStyle");
  if (v14 != objc_msgSend(v8, "userInterfaceStyle"))
    -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
  -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (BOOL)wantsSpotlightStyling
{
  void *v2;
  char v3;

  -[PUOneUpViewController _spec](self, "_spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseSpotlightStyling");

  return v3;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
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
  uint64_t v20;
  id v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  PUReviewScreenBarsSnapshot *v50;
  void *v51;
  void *v52;
  PUReviewScreenBarsSnapshot *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  PUReviewScreenBarsSnapshot *v59;
  void *v60;
  void *v61;
  int64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  _QWORD v71[4];
  id v72;
  PUOneUpViewController *v73;
  _QWORD v74[5];
  _QWORD v75[4];
  id v76;
  PUReviewScreenBarsSnapshot *v77;
  id v78;
  id v79;
  PUOneUpViewController *v80;
  _QWORD v81[4];
  PUReviewScreenBarsSnapshot *v82;
  PUOneUpViewController *v83;
  double v84;
  double v85;
  double v86;
  _QWORD v87[4];
  PUReviewScreenBarsSnapshot *v88;
  id v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  _QWORD v100[4];
  id v101;
  objc_super v102;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v102.receiver = self;
  v102.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewWillTransitionToSize:withTransitionCoordinator:](&v102, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[PUOneUpViewController _setPendingViewTransitionSize:](self, "_setPendingViewTransitionSize:", width, height);
  -[PUOneUpViewController _updateLayoutReferenceSize](self, "_updateLayoutReferenceSize");
  -[PUOneUpViewController _updateWindowInterfaceOrientation](self, "_updateWindowInterfaceOrientation");
  v8 = (void *)MEMORY[0x1E0D7B650];
  objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTip:isPresentable:", v9, 0);

  v10 = (void *)MEMORY[0x1E0D7B650];
  objc_msgSend(MEMORY[0x1E0D7B650], "livePhotosTipID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTip:isPresentable:", v11, 0);

  v12 = (void *)MEMORY[0x1E0D7B650];
  objc_msgSend(MEMORY[0x1E0D7B650], "actionsMenuTipID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTip:isPresentable:", v13, 0);

  v14 = (void *)MEMORY[0x1E0D7B650];
  objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTip:isPresentable:", v15, 0);

  v16 = (void *)MEMORY[0x1E0D7B650];
  objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTip:isPresentable:", v17, 0);

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = MEMORY[0x1E0C809B0];
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v100[3] = &unk_1E58ABD10;
  v21 = v19;
  v101 = v21;
  objc_msgSend(v21, "performChanges:", v100);
  -[PUOneUpViewController _spec](self, "_spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldCounterrotateReviewScreenBars");

  if (v23)
  {
    v70 = v7;
    -[PUOneUpViewController _reviewScreenTopBarTileViewController](self, "_reviewScreenTopBarTileViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _reviewScreenControlBarTileViewController](self, "_reviewScreenControlBarTileViewController");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v24;
    objc_msgSend(v24, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "snapshotViewAfterScreenUpdates:", 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v26;
    objc_msgSend(v26, "snapshotViewAfterScreenUpdates:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController view](self, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    v31 = v30;
    v33 = v32;
    v35 = v34;
    v37 = v36;

    v65 = v31;
    UIRectGetCenter();
    v63 = v39;
    v64 = v38;
    -[PUOneUpViewController view](self, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "window");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "_toWindowOrientation");

    -[PUOneUpViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "window");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "_fromWindowOrientation");

    v46 = 0.0;
    v47 = 0.0;
    if (v42 != 1)
    {
      if (v42 == 3)
      {
        v47 = 1.57079633;
      }
      else if (v42 == 4)
      {
        v47 = -1.57079633;
      }
      else
      {
        v47 = 3.14159265;
        if (v42 != 2)
          v47 = 0.0;
      }
    }
    if (v45 != 1)
    {
      switch(v45)
      {
        case 3:
          v46 = 1.57079633;
          break;
        case 4:
          v46 = -1.57079633;
          break;
        case 2:
          v46 = 3.14159265;
          break;
        default:
          v46 = 0.0;
          break;
      }
    }
    v49 = v46 - v47;
    v50 = objc_alloc_init(PUReviewScreenBarsSnapshot);
    -[PUReviewScreenBarsSnapshot addSubview:](v50, "addSubview:", v27);
    -[PUReviewScreenBarsSnapshot addSubview:](v50, "addSubview:", v28);
    -[PUOneUpViewController view](self, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addSubview:", v50);

    v52 = (void *)MEMORY[0x1E0DC3F10];
    v87[0] = v20;
    v87[1] = 3221225472;
    v87[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v87[3] = &unk_1E58A2E90;
    v53 = v50;
    v93 = v65;
    v94 = v33;
    v95 = v35;
    v96 = v37;
    v97 = v64;
    v98 = v63;
    v88 = v53;
    v89 = v27;
    v54 = v25;
    v99 = v46;
    v90 = v54;
    v91 = v28;
    v55 = v66;
    v92 = v55;
    v67 = v28;
    v56 = v27;
    objc_msgSend(v52, "performWithoutAnimation:", v87);
    objc_msgSend(v54, "setHidden:", 1);
    objc_msgSend(v55, "setHidden:", 1);
    v81[0] = v20;
    v81[1] = 3221225472;
    v81[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v81[3] = &unk_1E58A2EB8;
    v84 = v49;
    v85 = width;
    v86 = height;
    v82 = v53;
    v83 = self;
    v75[0] = v20;
    v75[1] = 3221225472;
    v75[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4;
    v75[3] = &unk_1E58A4570;
    v76 = v21;
    v77 = v82;
    v78 = v54;
    v79 = v55;
    v80 = self;
    v57 = v55;
    v58 = v54;
    v59 = v82;
    objc_msgSend(v70, "animateAlongsideTransition:completion:", v81, v75);

    v7 = v70;
    v48 = v69;
  }
  else
  {
    v74[0] = v20;
    v74[1] = 3221225472;
    v74[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
    v74[3] = &unk_1E58A7A08;
    v74[4] = self;
    v71[0] = v20;
    v71[1] = 3221225472;
    v71[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7;
    v71[3] = &unk_1E58A40C0;
    v72 = v21;
    v73 = self;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v74, v71);
    v48 = v72;
  }

  -[PUOneUpViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "window");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(objc_msgSend(v61, "_toWindowOrientation") - 3) <= 1
    && -[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible"))
  {
    v62 = -[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset");

    if (v62 == 1)
      -[PUOneUpEventTracker logInfoPanelRotatedToHorizontalView](self->_eventTracker, "logInfoPanelRotatedToHorizontalView");
  }
  else
  {

  }
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (id)contentScrollView
{
  return 0;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[PUOneUpViewController _updateWindowInterfaceOrientation](self, "_updateWindowInterfaceOrientation");
}

- (void)_updatePrefersHomeIndicatorHidden
{
  void *v3;
  id v4;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _setPrefersHomeIndicatorHidden:](self, "_setPrefersHomeIndicatorHidden:", (objc_msgSend(v4, "isPresentedForPreview") | objc_msgSend(v4, "isChromeVisible")) ^ 1);
}

- (void)_setPrefersHomeIndicatorHidden:(BOOL)a3
{
  if (self->__prefersHomeIndicatorHidden != a3)
  {
    self->__prefersHomeIndicatorHidden = a3;
    -[PUOneUpViewController setNeedsUpdateOfHomeIndicatorAutoHidden](self, "setNeedsUpdateOfHomeIndicatorAutoHidden");
  }
}

- (void)_updateIfNeeded
{
  id v4;

  if (-[PUOneUpViewController _needsUpdate](self, "_needsUpdate"))
  {
    -[PUOneUpViewController _updateSpecIfNeeded](self, "_updateSpecIfNeeded");
    -[PUOneUpViewController _updateAccessoryViewIfNeeded](self, "_updateAccessoryViewIfNeeded");
    -[PUOneUpViewController _updateBarsControllerIfNeeded](self, "_updateBarsControllerIfNeeded");
    -[PUOneUpViewController _updatePreloadInsetsIfNeeded](self, "_updatePreloadInsetsIfNeeded");
    -[PUOneUpViewController _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
    -[PUOneUpViewController _updateEditModeIfNeeded](self, "_updateEditModeIfNeeded");
    -[PUOneUpViewController _updatePreferredContentSizeIfNeeded](self, "_updatePreferredContentSizeIfNeeded");
    -[PUOneUpViewController _updateVideoPlayerIfNeeded](self, "_updateVideoPlayerIfNeeded");
    -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");
    -[PUOneUpViewController _updateUserActivityIfNeeded](self, "_updateUserActivityIfNeeded");
    -[PUOneUpViewController _updateChromeViewControllerIfNeeded](self, "_updateChromeViewControllerIfNeeded");
    -[PUOneUpViewController _updateImageAnalysisActionInfoBottomPositionIfNeeded](self, "_updateImageAnalysisActionInfoBottomPositionIfNeeded");
    if (-[PUOneUpViewController _needsUpdate](self, "_needsUpdate"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 1104, CFSTR("updates still needed after an update cycle"));

    }
  }
}

- (BOOL)_needsUpdate
{
  return -[PUOneUpViewController _needsUpdateSpec](self, "_needsUpdateSpec")
      || -[PUOneUpViewController _needsUpdateBarsController](self, "_needsUpdateBarsController")
      || -[PUOneUpViewController _needsUpdatePreloadInsets](self, "_needsUpdatePreloadInsets")
      || -[PUOneUpViewController _needsUpdateLayout](self, "_needsUpdateLayout")
      || -[PUOneUpViewController _needsUpdateEditMode](self, "_needsUpdateEditMode")
      || -[PUOneUpViewController _needsUpdatePreferredContentSize](self, "_needsUpdatePreferredContentSize")
      || -[PUOneUpViewController _needsUpdateVideoPlayer](self, "_needsUpdateVideoPlayer")
      || -[PUOneUpViewController _needsUpdateTipsPopover](self, "_needsUpdateTipsPopover")
      || -[PUOneUpViewController _needsUpdateUserActivity](self, "_needsUpdateUserActivity")
      || -[PUOneUpViewController _needsUpdateAccessoryView](self, "_needsUpdateAccessoryView")
      || -[PUOneUpViewController needsUpdateChromeViewController](self, "needsUpdateChromeViewController")
      || -[PUOneUpViewController _needsUpdateImageAnalysisActionInfoBottomPosition](self, "_needsUpdateImageAnalysisActionInfoBottomPosition");
}

- (void)_setTilingView:(id)a3
{
  PUTilingView *v5;
  PUTilingView **p_tilingView;
  PUTilingView *tilingView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PUTilingView *v14;

  v5 = (PUTilingView *)a3;
  p_tilingView = &self->__tilingView;
  tilingView = self->__tilingView;
  if (tilingView != v5)
  {
    v14 = v5;
    -[PUTilingView setTileSource:](tilingView, "setTileSource:", 0);
    -[PUTilingView setTileTransitionDelegate:](*p_tilingView, "setTileTransitionDelegate:", 0);
    -[PUTilingView setScrollDelegate:](*p_tilingView, "setScrollDelegate:", 0);
    -[PUTilingView setDelegate:](*p_tilingView, "setDelegate:", 0);
    objc_storeStrong((id *)&self->__tilingView, a3);
    -[PUTilingView setTileSource:](*p_tilingView, "setTileSource:", self);
    -[PUTilingView setTileTransitionDelegate:](*p_tilingView, "setTileTransitionDelegate:", self);
    -[PUTilingView setScrollDelegate:](*p_tilingView, "setScrollDelegate:", self);
    -[PUTilingView setDelegate:](*p_tilingView, "setDelegate:", self);
    -[PUTilingView setAccessibilityIdentifier:](*p_tilingView, "setAccessibilityIdentifier:", CFSTR("OneUpMainPagingView"));
    -[PUTilingView setShowsHorizontalScrollIndicator:](*p_tilingView, "setShowsHorizontalScrollIndicator:", 0);
    -[PUTilingView setShowsVerticalScrollIndicator:](*p_tilingView, "setShowsVerticalScrollIndicator:", 0);
    -[PUTilingView _setAutoScrollEnabled:](*p_tilingView, "_setAutoScrollEnabled:", 0);
    -[PUOneUpViewController _invalidatePreloadInsets](self, "_invalidatePreloadInsets");
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUBackgroundTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUUserTransformTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUBadgeTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUPlayButtonViewReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUProgressIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUPeopleTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PURenderIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUImportStatusIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUBufferingIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PULoadingIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUAccessoryTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUVideoPlaceholderTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUAssetExplorerReviewScreenBadgeTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUSelectionIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUAssetExplorerReviewScreenProgressIndicatorTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUReviewScreenTopBarTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUReviewScreenControlBarTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUReviewScreenScrubberBarTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PULivePhotoVideoPlaybackTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUSyndicationAttributionTileReuseIdentifier"));
    -[PUTilingView registerTileControllerClass:forReuseIdentifier:](*p_tilingView, "registerTileControllerClass:forReuseIdentifier:", objc_opt_class(), CFSTR("PUCropButtonTileReuseIdentifier"));
    -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateDelegateData");

    -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateDelegateData");

    -[PUOneUpViewController _barsController](self, "_barsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidateViewHostingGestureRecognizers");

    -[PUOneUpViewController _gestureRecognizerCoordinator](self, "_gestureRecognizerCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidateViewHostingGestureRecognizers");

    -[PUOneUpViewController _doubleTapZoomController](self, "_doubleTapZoomController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidateViewHostingGestureRecognizers");

    -[PUOneUpViewController _accessoryVisibilityInteractionController](self, "_accessoryVisibilityInteractionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateViewHostingGestureRecognizers");

    -[PUOneUpViewController _configureVitalityController](self, "_configureVitalityController");
    v5 = v14;
  }

}

- (void)_updateLayoutReferenceSize
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  -[PUOneUpViewController _pendingViewTransitionSize](self, "_pendingViewTransitionSize");
  if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[PUOneUpViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v7 = v11;
    v9 = v12;

  }
  else
  {
    -[PUOneUpViewController _pendingViewTransitionSize](self, "_pendingViewTransitionSize");
    v7 = v6;
    v9 = v8;
  }
  -[PUOneUpViewController _setLayoutReferenceSize:](self, "_setLayoutReferenceSize:", v7, v9);
}

- (void)_setLayoutReferenceSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CGFloat v13;
  CGFloat v14;

  height = a3.height;
  width = a3.width;
  if (a3.width != self->__layoutReferenceSize.width || a3.height != self->__layoutReferenceSize.height)
  {
    self->__layoutReferenceSize = a3;
    -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
    -[PUOneUpViewController _barsController](self, "_barsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateViewControllerView");

    -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
    if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __49__PUOneUpViewController__setLayoutReferenceSize___block_invoke;
      v11[3] = &unk_1E58A5BB0;
      v12 = v9;
      v13 = width;
      v14 = height;
      v10 = v9;
      objc_msgSend(v10, "performChanges:", v11);

    }
  }
}

- (void)_updateWindowInterfaceOrientation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[PUOneUpViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isRotating"))
    v4 = objc_msgSend(v6, "_toWindowOrientation");
  else
    v4 = objc_msgSend(v6, "_windowInterfaceOrientation");
  v5 = v4;
  if (v4 || (v5 = objc_msgSend(v6, "_windowInterfaceOrientation")) != 0)
    -[PUOneUpViewController _setWindowInterfaceOrientation:](self, "_setWindowInterfaceOrientation:", v5);

}

- (void)_setWindowInterfaceOrientation:(int64_t)a3
{
  void *v4;
  int v5;
  id v6;

  if (self->__windowInterfaceOrientation != a3)
  {
    self->__windowInterfaceOrientation = a3;
    -[PUOneUpViewController _spec](self, "_spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldDisplayReviewScreenBars");

    if (v5)
      -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
    -[PUOneUpViewController _barsController](self, "_barsController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidateContentGuideInsets");

  }
}

- (void)_setLayoutSafeAreaInsets:(UIEdgeInsets)a3
{
  id v7;

  if (self->__layoutSafeAreaInsets.left != a3.left
    || self->__layoutSafeAreaInsets.top != a3.top
    || self->__layoutSafeAreaInsets.right != a3.right
    || self->__layoutSafeAreaInsets.bottom != a3.bottom)
  {
    self->__layoutSafeAreaInsets = a3;
    -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
    -[PUOneUpViewController _barsController](self, "_barsController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidateContentGuideInsets");

  }
}

- (void)_isPresentedForPreviewDidChange
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  char v15;
  _QWORD v16[4];
  id v17;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresentedForPreview");

  -[PUOneUpViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", v5 ^ 1u);

  v7 = MEMORY[0x1E0C809B0];
  if ((v5 & 1) == 0)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke;
    v16[3] = &unk_1E58ABD10;
    v17 = v9;
    v10 = v9;
    objc_msgSend(v10, "performChanges:", v16);

  }
  -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
  -[PUOneUpViewController _invalidatePreferredContentSize](self, "_invalidatePreferredContentSize");
  -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
  -[PUOneUpViewController _invalidatePreloadInsets](self, "_invalidatePreloadInsets");
  -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
  -[PUOneUpViewController _barsController](self, "_barsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidateViewHostingGestureRecognizers");

  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
  -[PUOneUpViewController px_setNeedsImageModulationIntensityUpdate](self, "px_setNeedsImageModulationIntensityUpdate");
  -[PUOneUpViewController _updatePrefersHomeIndicatorHidden](self, "_updatePrefersHomeIndicatorHidden");
  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke_2;
  v13[3] = &unk_1E58AAD68;
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  v12 = v14;
  objc_msgSend(v12, "performChanges:", v13);

}

- (void)setUnlockDeviceHandlerWithActionType:(id)a3
{
  id v4;
  void *v5;
  id unlockDeviceHandlerWithActionType;
  id v7;

  if (self->_unlockDeviceHandlerWithActionType != a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(v4, "copy");
    unlockDeviceHandlerWithActionType = self->_unlockDeviceHandlerWithActionType;
    self->_unlockDeviceHandlerWithActionType = v5;

    -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnlockDeviceHandlerWithActionType:", v4);

  }
}

- (void)setUnlockDeviceStatus:(id)a3
{
  id v4;
  void *v5;
  id unlockDeviceStatus;
  void *v7;
  id v8;

  if (self->_unlockDeviceStatus != a3)
  {
    v4 = a3;
    v5 = (void *)objc_msgSend(v4, "copy");
    unlockDeviceStatus = self->_unlockDeviceStatus;
    self->_unlockDeviceStatus = v5;

    -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUnlockDeviceStatus:", v4);

    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidateIsDeviceUnlocked");

  }
}

- (void)setAppearState:(int)a3
{
  if (self->_appearState != a3)
  {
    self->_appearState = a3;
    -[PUOneUpViewController _updateMergedVideoProviderEnabled](self, "_updateMergedVideoProviderEnabled");
  }
}

- (void)_updateMergedVideoProviderEnabled
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PUOneUpViewController appearState](self, "appearState") == 2;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergedVideoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsEnabled:", v3);

}

- (void)_setIrisPlaying:(BOOL)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  BOOL v33;

  if (self->__isIrisPlaying != a3)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __41__PUOneUpViewController__setIrisPlaying___block_invoke;
    v31[3] = &unk_1E58AAD68;
    v7 = v5;
    v32 = v7;
    v33 = a3;
    objc_msgSend(v7, "performChanges:", v31);
    self->__isIrisPlaying = a3;
    -[PUOneUpViewController _configureVitalityController](self, "_configureVitalityController");
    if (self->__isIrisPlaying)
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PUShouldAutoHideChrome(v9, objc_msgSend(v10, "chromeAutoHideBehaviorOnLivePhoto"));

      if (v11)
      {
        objc_msgSend(v9, "currentAssetReference");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v6;
        v26 = 3221225472;
        v27 = __41__PUOneUpViewController__setIrisPlaying___block_invoke_2;
        v28 = &unk_1E58ABCA8;
        v29 = v9;
        v30 = v12;
        v13 = v12;
        objc_msgSend(v29, "performChanges:", &v25);

      }
      -[PUOneUpViewController _barsController](self, "_barsController", v25, v26, v27, v28);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "tapGestureRecognizer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pu_cancel");

      -[PUOneUpViewController _doubleTapZoomController](self, "_doubleTapZoomController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleTapGestureRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pu_cancel");

      -[PUOneUpViewController _accessoryVisibilityInteractionController](self, "_accessoryVisibilityInteractionController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "panGestureRecognizer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "pu_cancel");

      -[PUOneUpViewController gestureController](self, "gestureController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "cancelGestures");

      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v21, "lockScrollDuringLivePhotoPlayback");

      if ((_DWORD)v19)
      {
        -[PUOneUpViewController browsingSession](self, "browsingSession");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "viewModel");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "currentAssetTransitionProgress");
        if (PXFloatApproximatelyEqualToFloat())
        {
          -[PUOneUpViewController _tilingView](self, "_tilingView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "px_cancelScrollGesture");

        }
      }

    }
  }
}

- (id)_newOneUpLayout
{
  PUOneUpTilingLayout *v3;
  void *v4;
  void *v5;
  void *v6;
  PUOneUpTilingLayout *v7;
  void *v8;

  v3 = [PUOneUpTilingLayout alloc];
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUSectionedTilingLayout initWithDataSource:](v3, "initWithDataSource:", v6);

  -[PUOneUpTilingLayout setDelegate:](v7, "setDelegate:", self);
  -[PUOneUpViewController _parallaxComputer](self, "_parallaxComputer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpTilingLayout setParallaxComputer:](v7, "setParallaxComputer:", v8);

  -[PUOneUpViewController _updateLayout:](self, "_updateLayout:", v7);
  return v7;
}

- (void)_updateLayout:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
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
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  unsigned int v39;
  _BOOL4 v40;
  uint64_t v41;
  int v42;
  double *v43;
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
  int v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  int v65;
  void *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  int v79;
  uint64_t v80;
  _BOOL8 v81;
  void *v82;
  void *v83;
  _BOOL8 v84;
  void *v85;
  uint64_t v86;
  _BOOL8 v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  unsigned int v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  int64_t v99;
  unsigned int v100;
  unsigned int v101;
  double v102;
  unsigned int v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  unsigned int v112;
  void *v113;
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
  double v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;

  v128 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_67;
  -[PUOneUpViewController _spec](self, "_spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled");
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC49E8];
  v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v10 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v11 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  if (v5)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isPresentedForPreview");

    if ((v14 & 1) != 0)
      goto LABEL_8;
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _layoutReferenceSize](self, "_layoutReferenceSize");
    objc_msgSend(v15, "contentGuideInsetsForViewSize:");
  }
  else
  {
    if (!objc_msgSend(v4, "shouldUseContentGuideInsets"))
      goto LABEL_8;
    -[PUOneUpViewController _barsController](self, "_barsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentGuideInsets");
  }

LABEL_8:
  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "contentDecorationAdditionalInsets");
  v123 = v18;
  v124 = v17;
  v121 = v20;
  v122 = v19;

  -[PUOneUpViewController px_safeAreaInsets](self, "px_safeAreaInsets");
  UIEdgeInsetsMax();
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "viewModel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isPresentedForPreview");

  if ((v31 & 1) != 0)
  {
LABEL_13:
    v118 = v10;
    v119 = v11;
    v116 = v8;
    v117 = v9;
    goto LABEL_14;
  }
  v32 = objc_msgSend(v127, "scaleToFitBehavior");
  switch(v32)
  {
    case 3:
      objc_msgSend(v127, "minimumContentInset");
      UIEdgeInsetsMax();
      v22 = v70;
      v24 = v71;
      v26 = v72;
      v28 = v73;
      v118 = v72;
      v119 = v73;
      v116 = v70;
      v117 = v71;
      break;
    case 2:
      v118 = v26;
      v119 = v28;
      v116 = v22;
      v117 = v24;
      break;
    case 1:
      -[PUOneUpViewController view](self, "view");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "px_peripheryInsets");
      v116 = v34;
      v117 = v35;
      v118 = v36;
      v119 = v37;

      break;
    default:
      goto LABEL_13;
  }
LABEL_14:
  v125 = v7;
  v38 = objc_msgSend(v7, "videoOverlayPlayState");
  v39 = objc_msgSend(v4, "shouldDisplayBadges");
  v40 = v38 == 0;
  if (v38)
    v41 = 0;
  else
    v41 = v39;
  v112 = objc_msgSend(v4, "shouldUseUserTransformTiles");
  v42 = objc_msgSend(v4, "shouldDisplayPlayButtons");
  v43 = (double *)MEMORY[0x1E0C9D820];
  if (v42)
  {
    objc_msgSend(v4, "playButtonSize");
    v114 = v45;
    v115 = v44;
  }
  else
  {
    v114 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v115 = *MEMORY[0x1E0C9D820];
  }
  if (!objc_msgSend(v4, "shouldDisplayProgressIndicators") || v38)
  {
    v110 = v43[1];
    v111 = *v43;
  }
  else
  {
    objc_msgSend(v4, "progressIndicatorSize");
    v110 = v47;
    v111 = v46;
  }
  if (objc_msgSend(v4, "shouldDisplayPeopleRow"))
  {
    objc_msgSend(v4, "peopleRowSize");
    v108 = v49;
    v109 = v48;
  }
  else
  {
    v108 = v43[1];
    v109 = *v43;
  }
  if (objc_msgSend(v4, "shouldDisplayProgressIndicators") && !v38)
  {
    objc_msgSend(v4, "progressIndicatorContentInsets");
    v8 = v50;
    v9 = v51;
    v10 = v52;
    v11 = v53;
  }
  if (objc_msgSend(v4, "shouldDisplayProgressIndicators"))
  {
    objc_msgSend(v4, "renderIndicatorSize");
    v106 = v55;
    v107 = v54;
  }
  else
  {
    v106 = v43[1];
    v107 = *v43;
  }
  objc_msgSend(v4, "traitCollection");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = v24;
  if (!objc_msgSend(v4, "shouldDisplayBufferingIndicators") || v38)
  {
    v102 = *v43;
    v98 = v43[1];
  }
  else
  {
    objc_msgSend(v4, "bufferingIndicatorSize");
    v102 = v56;
    v98 = v57;
  }
  v58 = objc_msgSend(v4, "canDisplayLoadingIndicators");
  objc_msgSend(v4, "secondScreenSize");
  v96 = v60;
  v97 = v59;
  objc_msgSend(v127, "interpageSpacing");
  v62 = v61;
  v103 = objc_msgSend(v4, "shouldPinContentToTop");
  if (objc_msgSend(v4, "shouldDisplayAssetExplorerReviewScreenProgressIndicators"))
  {
    objc_msgSend(v4, "assetExplorerReviewScreenProgressIndicatorSize");
    v104 = v64;
    v105 = v63;
  }
  else
  {
    v104 = v43[1];
    v105 = *v43;
  }
  v101 = objc_msgSend(v4, "shouldDisplayReviewScreenBars");
  v100 = objc_msgSend(v4, "shouldLayoutReviewScreenControlBarVertically");
  v99 = -[PUOneUpViewController _windowInterfaceOrientation](self, "_windowInterfaceOrientation");
  v65 = objc_msgSend(v126, "isAccessoryViewVisible");
  if (!v5)
  {
    v95 = 0;
    v93 = 0.0;
    v94 = 0.0;
    if (!(_DWORD)v41)
      goto LABEL_56;
    goto LABEL_52;
  }
  -[PUOneUpViewController traitCollection](self, "traitCollection");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "userInterfaceStyle");

  if (v67 >= 2)
  {
    if (v67 != 2)
    {
      v95 = 0;
      goto LABEL_51;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "insetContentBorderOpacityDarkMode");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "insetContentBorderOpacityLightMode");
  }
  objc_msgSend(v68, "colorWithAlphaComponent:");
  v95 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_51:
  objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "insetContentCornerRadius");
  v94 = v75;

  objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "insetContentBorderWidth");
  v93 = v77;

  if (!(_DWORD)v41)
    goto LABEL_56;
LABEL_52:
  if (v65)
  {
    -[PUOneUpViewController _spec](self, "_spec");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend(v78, "hideBadgesWhenShowingAccessoryView") ^ 1;

  }
  else
  {
    v79 = 1;
  }
  v41 = v79 & ~v5;
LABEL_56:
  v80 = v58 & v40;
  v92 = objc_msgSend(v4, "shouldDisplayAssetExplorerReviewScreenBadges") & v40;
  v81 = ((objc_msgSend(v4, "shouldDisplaySelectionIndicators") & 1) != 0
      || objc_msgSend(v125, "isInSelectionMode"))
     && v38 == 0;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "importStatusManager");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  if (v83)
    v84 = v38 == 0;
  else
    v84 = 0;

  if (objc_msgSend(v4, "shouldDisplaySyndicationAttribution"))
  {
    objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "showSyndicated1upPillUI") & v40 & v41;

  }
  else
  {
    v86 = 0;
  }
  v87 = v38 != 0;
  v88 = (void *)MEMORY[0x1E0D7B568];
  v89 = v128;
  objc_msgSend(v88, "sharedInstance");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "insetContentCornerRadius");
  objc_msgSend(v89, "setInsetContentCornerRadius:");

  objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "minimumMarginForInsetContent");
  objc_msgSend(v89, "setMinimumMarginForInsetContent:");

  objc_msgSend(v89, "setUseBackgroundTile:", 1);
  objc_msgSend(v89, "setUseBadgeTiles:", v41);
  objc_msgSend(v89, "setUseUserTransformTiles:", v112);
  objc_msgSend(v89, "setContentGuideInsets:", v22, v120, v26, v28);
  objc_msgSend(v89, "setContentSafeInsets:", v116, v117, v118, v119);
  objc_msgSend(v89, "setContentDecorationAdditionalInsets:", v124, v123, v122, v121);
  objc_msgSend(v89, "setPlayButtonSize:", v115, v114);
  objc_msgSend(v89, "setProgressIndicatorSize:", v111, v110);
  objc_msgSend(v89, "setProgressIndicatorContentInsets:", v8, v9, v10, v11);
  objc_msgSend(v89, "setPeopleRowSize:", v109, v108);
  objc_msgSend(v89, "setBufferingIndicatorSize:", v102, v98);
  objc_msgSend(v89, "setRenderIndicatorSize:", v107, v106);
  objc_msgSend(v89, "setCanDisplayLoadingIndicators:", v80);
  objc_msgSend(v89, "setTraitCollection:", v113);
  objc_msgSend(v89, "setDisplaySizeForInsetMatching:", v97, v96);
  objc_msgSend(v89, "setInterpageSpacing:", v62, 0.0);
  objc_msgSend(v89, "setInterSectionSpacing:", v62, 0.0);
  objc_msgSend(v89, "setShouldPinContentToTop:", v103);
  objc_msgSend(v89, "setUseAssetExplorerReviewScreenBadgeTiles:", v92);
  objc_msgSend(v89, "setUseSelectionIndicatorTiles:", v81);
  objc_msgSend(v89, "setUseImportStatusIndicatorTiles:", v84);
  objc_msgSend(v89, "setAssetExplorerReviewScreenProgressIndicatorSize:", v105, v104);
  objc_msgSend(v89, "setUseReviewScreenBars:", v101);
  objc_msgSend(v89, "setUseVerticalReviewScreenControlBarLayout:", v100);
  objc_msgSend(v89, "setWindowInterfaceOrientation:", v99);
  objc_msgSend(v89, "setShouldHideMainContent:", v87);
  objc_msgSend(v89, "setUseSyndicationAttributionTile:", v86);
  objc_msgSend(v89, "setInsetContentBorderColor:", v95);
  objc_msgSend(v89, "setInsetContentCornerRadius:", v94);
  objc_msgSend(v89, "setInsetContentBorderWidth:", v93);

LABEL_67:
}

- (void)_invalidatePreloadInsets
{
  -[PUOneUpViewController _setNeedsUpdatePreloadInsets:](self, "_setNeedsUpdatePreloadInsets:", 1);
}

- (void)_updatePreloadInsetsIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  float v11;
  double v12;
  void *v13;
  id v14;

  if (-[PUOneUpViewController _needsUpdatePreloadInsets](self, "_needsUpdatePreloadInsets"))
  {
    -[PUOneUpViewController _setNeedsUpdatePreloadInsets:](self, "_setNeedsUpdatePreloadInsets:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "browsingSpeedRegime") == 2 || objc_msgSend(v14, "isPresentedForPreview"))
    {
      v5 = *MEMORY[0x1E0DC49E8];
      v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    else
    {
      -[PUOneUpViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      v10 = v9;

      v11 = v10;
      v12 = floorf(v11 * 0.5);
      if (v12 < 100.0)
        v12 = 100.0;
      v6 = -v12;
      v7 = 0.0;
      v4 = -v12;
      v5 = 0.0;
    }
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLoadingInsets:", v5, v4, v7, v6);

  }
}

- (void)_invalidateTipPopovers
{
  -[PUOneUpViewController _setNeedsUpdateTipPopovers:](self, "_setNeedsUpdateTipPopovers:", 1);
}

- (void)_updateTipPopoversIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _BOOL4 v33;
  int v34;
  _BOOL8 v35;
  _BOOL8 v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  _BOOL4 v52;
  int v53;
  _BOOL4 v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL4 v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;

  if (-[PUOneUpViewController _needsUpdateTipsPopover](self, "_needsUpdateTipsPopover"))
  {
    -[PUOneUpViewController _setNeedsUpdateTipPopovers:](self, "_setNeedsUpdateTipPopovers:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "assetViewModelForCurrentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "badgeInfoPromise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "badgeInfo");

    v64 = objc_msgSend(v4, "isChromeVisible");
    v59 = -[PUOneUpViewController _isIrisPlaying](self, "_isIrisPlaying");
    -[PUOneUpViewController traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v11, "userInterfaceIdiom");

    -[PUOneUpViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v13, "_toWindowOrientation");

    if ((objc_msgSend(v4, "isScrolling") & 1) != 0)
      v56 = 1;
    else
      v56 = objc_msgSend(v4, "isScrubbing");
    if (-[PUOneUpViewController appearState](self, "appearState") == 2)
      v55 = objc_msgSend(v4, "isPresentedForPreview");
    else
      v55 = 1;
    v14 = -[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible");
    -[PUOneUpViewController _barsController](self, "_barsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "barButtonItemToggleDetails");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (PXAssetBadgeInfoIsActionable())
      v53 = PXAssetBadgeInfoIsActionableDisabled() ^ 1;
    else
      v53 = 0;
    -[PUOneUpViewController _barsController](self, "_barsController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "barButtonItemActionsMenu");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v18 != 0;

    v60 = (void *)v8;
    if (PXContentSyndicationShouldShowAttributionViewForAsset())
    {
      -[PUOneUpViewController _syndicationPillView](self, "_syndicationPillView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v19 != 0;

    }
    else
    {
      v51 = 0;
    }
    objc_msgSend(v5, "asset");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[PUOneUpViewController _isAssetEligibleForTip:](self, "_isAssetEligibleForTip:", v20);

    v63 = v5;
    objc_msgSend(v5, "visualImageAnalysis");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hasVisualSearchResults");

    v61 = v7;
    v62 = v6;
    if (v7)
    {
      objc_msgSend(v6, "indexPathForAssetReference:", v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = PUTileKindBadge;
      objc_msgSend(v6, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v23, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_msgSend(v27, "isActive");
    }
    else
    {
      v28 = 0;
    }
    -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "cropButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = 0;
    v33 = v57 == 1 || v58 == 1;
    if ((v56 | v55 | (v59 || v14)) == 1)
    {
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
    }
    else
    {
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 0;
      if (v33)
      {
        v34 = !-[PUOneUpViewController _hasShownRelevantTip](self, "_hasShownRelevantTip");
        if (v16)
          v38 = v64 & v34;
        else
          v38 = 0;
        v31 = v38 & v54 & v22;
        if ((v64 & v34) == 1)
        {
          v35 = v52;
          v37 = -[PUOneUpViewController _didPlayCurrentLivePhoto](self, "_didPlayCurrentLivePhoto") & v28 & v53;
          v34 = 1;
          v36 = v51;
        }
        else
        {
          v35 = 0;
          v36 = 0;
          v37 = 0;
        }
      }
    }
    v39 = v34 & ~v64;
    if (v30)
      v40 = v39;
    else
      v40 = 0;
    v41 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTip:isPresentable:", v42, v31);

    v43 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "livePhotosTipID");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setTip:isPresentable:", v44, v37);

    v45 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setTip:isPresentable:", v46, v36);

    v47 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "actionsMenuTipID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setTip:isPresentable:", v48, v35);

    v49 = (void *)MEMORY[0x1E0D7B650];
    objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTip:isPresentable:", v50, v40);

  }
}

- (void)_dismissTipPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  NSString *presentedTipID;
  id tipDismissedCompletion;

  v3 = a3;
  if (-[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible"))
  {
    -[PUOneUpViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
    objc_msgSend(MEMORY[0x1E0D7B650], "setTip:isPresentable:", self->_presentedTipID, 0);
    -[PUOneUpBarsController setPresentedTipID:](self->__barsController, "setPresentedTipID:", 0);
    presentedTipID = self->_presentedTipID;
    self->_presentedTipID = 0;

    tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_tipDismissedCompletion = 0;

    objc_msgSend(MEMORY[0x1E0D7B650], "setTipsPresentationDelegate:", 0);
  }
}

- (void)_invalidateSpec
{
  -[PUOneUpViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 1);
}

- (void)_updateSpecIfNeeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char v19;
  BOOL v20;
  void *v21;
  uint64_t (**v22)(void);
  int v23;
  NSObject *v24;
  __CFString *v25;
  char v26;
  void *v27;
  char v28;
  char v29;
  BOOL v30;
  __CFString *v31;
  void *v32;
  id v33;
  id v34;
  BOOL v35;
  BOOL v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  BOOL v45;
  char v46;
  BOOL v47;
  char v48;
  BOOL v49;
  char v50;
  uint8_t buf[4];
  __CFString *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (-[PUOneUpViewController _needsUpdateSpec](self, "_needsUpdateSpec"))
  {
    -[PUOneUpViewController _setNeedsUpdateSpec:](self, "_setNeedsUpdateSpec:", 0);
    -[PUOneUpViewController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _layoutReferenceSize](self, "_layoutReferenceSize");
    v5 = v4;
    v7 = v6;
    v36 = -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen");
    v8 = -[PUOneUpViewController _prefersCompactLayoutForSplitScreen](self, "_prefersCompactLayoutForSplitScreen");
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "isPresentedForPreview");
    v12 = objc_msgSend(v10, "isChromeVisible");
    -[PUOneUpViewController _secondScreenBrowser](self, "_secondScreenBrowser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 && !-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
    {
      objc_msgSend(v10, "secondScreenSize");
      v14 = v16;
      v15 = v17;
    }
    else
    {
      v14 = *MEMORY[0x1E0C9D820];
      v15 = *(_QWORD *)(MEMORY[0x1E0C9D820] + 8);
    }

    -[PUOneUpViewController _barsController](self, "_barsController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isShowingPlayPauseButton");

    v20 = objc_msgSend(v10, "contentPrivacyState") == 1;
    -[PUOneUpViewController unlockDeviceStatus](self, "unlockDeviceStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[PUOneUpViewController unlockDeviceStatus](self, "unlockDeviceStatus");
      v22 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      v23 = v22[2]();

    }
    else
    {
      v23 = 1;
    }
    PLUIGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = CFSTR("NO");
      if (v23)
        v25 = CFSTR("YES");
      v35 = v20;
      v26 = v19;
      v27 = v3;
      v28 = v12;
      v29 = v11;
      v30 = v8;
      v31 = v25;
      *(_DWORD *)buf = 138412290;
      v52 = v31;
      _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_INFO, "PUOneUpViewController: shouldDisplayPeopleRow: %@", buf, 0xCu);

      v8 = v30;
      v11 = v29;
      v12 = v28;
      v3 = v27;
      v19 = v26;
      v20 = v35;
    }

    -[PUOneUpViewController _spec](self, "_spec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __44__PUOneUpViewController__updateSpecIfNeeded__block_invoke;
    v37[3] = &unk_1E58A2EE0;
    v44 = v11;
    v45 = v36;
    v40 = v14;
    v41 = v15;
    v46 = v12;
    v47 = v20;
    v48 = v19;
    v38 = v32;
    v39 = v3;
    v49 = v8;
    v42 = v5;
    v43 = v7;
    v50 = v23;
    v33 = v3;
    v34 = v32;
    objc_msgSend(v34, "performChanges:", v37);

  }
}

- (void)_invalidatePreferredContentSize
{
  -[PUOneUpViewController _setNeedsUpdatePreferredContentSize:](self, "_setNeedsUpdatePreferredContentSize:", 1);
}

- (void)_updatePreferredContentSizeIfNeeded
{
  double v3;
  double v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  id v25;

  if (-[PUOneUpViewController _needsUpdatePreferredContentSize](self, "_needsUpdatePreferredContentSize"))
  {
    -[PUOneUpViewController _setNeedsUpdatePreferredContentSize:](self, "_setNeedsUpdatePreferredContentSize:", 0);
    -[PUOneUpViewController preferredContentSizeOverride](self, "preferredContentSizeOverride");
    if (v4 == *MEMORY[0x1E0C9D820] && v3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewModel");
      v25 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "currentAssetReference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "asset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v8, "aspectRatio");
        v10 = v9;
      }
      else
      {
        v10 = 1.0;
      }
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bounds");
      v16 = PURectWithAspectRatioFittingRect(1.0, v12, v13, v14, v15);
      v18 = v17;
      v20 = v19;
      v22 = v21;

      PURectWithAspectRatioFittingRect(v10, v16, v18, v20, v22);
      -[PUOneUpViewController setPreferredContentSize:](self, "setPreferredContentSize:", v23, v24);

    }
    else
    {
      -[PUOneUpViewController preferredContentSizeOverride](self, "preferredContentSizeOverride");
      -[PUOneUpViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
  }
}

- (void)_invalidateVideoPlayer
{
  -[PUOneUpViewController _setNeedsUpdateVideoPlayer:](self, "_setNeedsUpdateVideoPlayer:", 1);
}

- (void)_updateVideoPlayerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  if (-[PUOneUpViewController _needsUpdateVideoPlayer](self, "_needsUpdateVideoPlayer"))
  {
    -[PUOneUpViewController _setNeedsUpdateVideoPlayer:](self, "_setNeedsUpdateVideoPlayer:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetViewModelForAssetReference:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isPresentingOverOneUp");
    objc_msgSend(v6, "videoPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) == 0)
    {
      if (objc_msgSend(v7, "canPlayLoopingVideo"))
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __51__PUOneUpViewController__updateVideoPlayerIfNeeded__block_invoke;
        v10[3] = &unk_1E58ABD10;
        v11 = v9;
        objc_msgSend(v11, "performChanges:", v10);

      }
    }

  }
}

- (void)_invalidateBarsControllers
{
  -[PUOneUpViewController _setNeedsUpdateBarsController:](self, "_setNeedsUpdateBarsController:", 1);
}

- (void)_updateBarsControllerIfNeeded
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  PUOneUpViewController *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  _BOOL4 v38;
  unsigned int ShouldShowAirPlayButton;
  unsigned int v40;
  _BOOL4 v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  void *v45;
  id v46;

  if (!-[PUOneUpViewController _needsUpdateBarsController](self, "_needsUpdateBarsController"))
    return;
  -[PUOneUpViewController _setNeedsUpdateBarsController:](self, "_setNeedsUpdateBarsController:", 0);
  -[PUOneUpViewController _spec](self, "_spec");
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PUOneUpViewController _options](self, "_options");
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v46, "shouldPlaceButtonsInNavigationBar");
  v43 = objc_msgSend(v46, "shouldUseCompactTitleView");
  v42 = objc_msgSend(v46, "shouldUseCompactCommentsTitle");
  objc_msgSend(v46, "maximumToolbarHeight");
  v9 = v8;
  objc_msgSend(v46, "maximumAccessoryToolbarHeight");
  v11 = v10;
  v12 = 0;
  if (objc_msgSend(v46, "allowProgrammaticNavBackButton"))
  {
    -[PUOneUpViewController navigationController](self, "navigationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewControllers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (PUOneUpViewController *)objc_claimAutoreleasedReturnValue();
    if (v15 == self)
    {
      -[PUOneUpViewController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "presentingViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v17 != 0;

    }
    else
    {
      v12 = 0;
    }

  }
  v41 = v12;
  v18 = 0;
  v44 = v7;
  if ((objc_msgSend(v5, "isPresentedForPreview") & 1) != 0)
    goto LABEL_11;
  v19 = v46;
  if ((v3 & 0x800) == 0)
  {
    v18 = objc_msgSend(v46, "isContentLocked") ^ 1;
LABEL_11:
    v19 = v46;
  }
  v20 = objc_msgSend(v19, "shouldShowTitleView");
  if ((v3 & 0x1000) != 0)
    v21 = 0;
  else
    v21 = v20;
  v40 = v21;
  ShouldShowAirPlayButton = _ShouldShowAirPlayButton();
  objc_msgSend(v5, "currentAssetReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v23, "accessoryViewTypeForAsset:", v24);

  if (objc_msgSend(v46, "allowTapOnTitle"))
  {
    v27 = objc_msgSend(v6, "titleTapAction") == 2 && v25 == 2;
    v38 = v27;
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(v22, "asset");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v6;
  v29 = v5;
  if (objc_msgSend(v28, "mediaType") == 2)
    v37 = objc_msgSend(v28, "canPlayLoopingVideo") ^ 1;
  else
    v37 = 0;
  v30 = objc_msgSend(v28, "playbackStyle");
  v36 = objc_msgSend(v46, "shouldDisableNavigationBarsVisibility");
  v31 = objc_msgSend(v46, "shouldPlaceScrubberInScrubberBar");
  -[PUOneUpViewController _spec](self, "_spec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "hideScrubberWhenShowingAccessoryView");

  if (v33)
  {
    objc_msgSend(v29, "assetViewModelForAssetReference:", v22);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v18 & ~objc_msgSend(v34, "isAccessoryViewVisible");

  }
  -[PUOneUpViewController _barsController](self, "_barsController");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setShouldShowMuteButton:", v30 == 4);
  objc_msgSend(v35, "setShouldPlaceButtonsInNavigationBar:", v44);
  objc_msgSend(v35, "setShouldUseCompactTitleView:", v43);
  objc_msgSend(v35, "setShouldUseCompactCommentsTitle:", v42);
  objc_msgSend(v35, "setMaximumToolbarHeight:", v9);
  objc_msgSend(v35, "setMaximumAccessoryToolbarHeight:", v11);
  objc_msgSend(v35, "setShouldShowProgrammaticNavBackButton:", v41);
  objc_msgSend(v35, "setShouldShowAirPlayButton:", ShouldShowAirPlayButton);
  objc_msgSend(v35, "setShouldShowScrubber:", v18);
  objc_msgSend(v35, "setShouldShowTitleView:", v40);
  objc_msgSend(v35, "setAllowTapOnTitle:", v38);
  objc_msgSend(v35, "setAllowShowingPlayPauseButton:", v37);
  objc_msgSend(v35, "setDisableShowingNavigationBars:", v36);
  objc_msgSend(v35, "setShouldPlaceScrubberInScrubberBar:", v31);
  objc_msgSend(v35, "setDisableChromeHiding:", (v3 >> 14) & 1);
  objc_msgSend(v35, "setWantsShowInLibraryButton:", (v3 >> 15) & 1);
  objc_msgSend(v35, "setIsInCompactLayoutStyle:", objc_msgSend(v46, "isInCompactLayoutStyle"));

}

- (BOOL)_isDrivingScrubbing
{
  PUOneUpViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionDriverIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "isEqualToString:", v2->_scrubbingIdentifier);

  return (char)v2;
}

- (void)_updateViewModelWithCurrentScrollPosition
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  PUOneUpViewController *v23;
  uint64_t v24;

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v7, "assetsDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v9, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 1753, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[oneUpLayout dataSource] isEqual:assetsDataSource]"));

    }
    objc_msgSend(v5, "indexPathOfCurrentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v5, "transitionProgress");
      v12 = v11;
      objc_msgSend(v8, "assetReferenceAtIndexPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 1759, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetReference != nil"));

      }
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__PUOneUpViewController__updateViewModelWithCurrentScrollPosition__block_invoke;
      v20[3] = &unk_1E58AAA58;
      v21 = v15;
      v22 = v13;
      v24 = v12;
      v23 = self;
      v16 = v13;
      v17 = v15;
      objc_msgSend(v17, "performChanges:", v20);

    }
  }

}

- (void)_invalidateLayout
{
  -[PUOneUpViewController _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 1);
}

- (void)_invalidateChromeViewController
{
  -[PUOneUpViewController setNeedsUpdateChromeViewController:](self, "setNeedsUpdateChromeViewController:", 1);
}

- (void)_invalidateAccessoryView
{
  -[PUOneUpViewController _setNeedsUpdateAccessoryView:](self, "_setNeedsUpdateAccessoryView:", 1);
}

- (void)_updateLayoutIfNeeded
{
  void *v3;
  id v4;

  if (-[PUOneUpViewController _needsUpdateLayout](self, "_needsUpdateLayout"))
  {
    -[PUOneUpViewController _setNeedsUpdateLayout:](self, "_setNeedsUpdateLayout:", 0);
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layout");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController _updateLayout:](self, "_updateLayout:", v4);
  }
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  -[PUOneUpViewController _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isContentLocked");

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", v6);

  v8 = v6 ^ 1;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setUserInteractionEnabled:", v8);

  if ((v8 & 1) != 0)
  {
    -[PUOneUpViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = (void *)MEMORY[0x1E0DC3428];
    v11 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke;
    v24[3] = &unk_1E58AB5D0;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v10, "actionWithHandler:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "privacyController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "authenticationType");

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "wantsContentUnavailableUnlockButtonVisible");

    PXContentLockedPlaceholderConfiguration();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updatedConfigurationForState:", v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v18);

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "viewModel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke_2;
    v22[3] = &unk_1E58ABD10;
    v21 = v20;
    v23 = v21;
    objc_msgSend(v21, "performChanges:", v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

}

- (void)_updateGestureController
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  -[PUOneUpViewController gestureController](self, "gestureController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChromeVisible");

  if (v5)
  {
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentGuideInsets");
    objc_msgSend(v7, "setInteractionInsets:");

  }
  else
  {
    objc_msgSend(v7, "setInteractionInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  }

}

- (void)_setContentUnavailableConfiguration:(id)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController _setContentUnavailableConfiguration:](&v7, sel__setContentUnavailableConfiguration_);
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[PUOneUpViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (a3)
}

- (void)_updateBackgroundTileViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[PUOneUpViewController _backgroundTileViewController](self, "_backgroundTileViewController");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _spec](self, "_spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColorOverride");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundColorOverride");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_msgSend(v3, "shouldDisplayEmptyPlaceholder");
  objc_msgSend(v17, "setBackgroundColorOverride:", v6);
  objc_msgSend(v17, "setShouldDisplayEmptyPlaceholder:", v8);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emptyPlaceholderTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEmptyPlaceholderCustomTitle:", v10);

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emptyPlaceholderSubtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEmptyPlaceholderCustomSubtitle:", v12);

  if (-[PUOneUpViewController wantsSpotlightStyling](self, "wantsSpotlightStyling"))
  {
    -[PUOneUpViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "userInterfaceIdiom"))
      v15 = 8;
    else
      v15 = 18;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setVisualEffect:", v16);

  }
}

- (void)_updateChromeViewControllerIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t ShouldShowAirPlayButton;
  void *v7;
  _BOOL8 v8;
  id v9;

  if (-[PUOneUpViewController needsUpdateChromeViewController](self, "needsUpdateChromeViewController"))
  {
    -[PUOneUpViewController setNeedsUpdateChromeViewController:](self, "setNeedsUpdateChromeViewController:", 0);
    -[PUOneUpViewController _spec](self, "_spec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hideScrubberWhenShowingAccessoryView");
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHideScrubberWhenAccessoryIsVisible:", v4);

    ShouldShowAirPlayButton = _ShouldShowAirPlayButton();
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWantsAirPlayButton:", ShouldShowAirPlayButton);

    v8 = -[PUOneUpViewController _wantsShowInLibraryButtonForAllAssets](self, "_wantsShowInLibraryButtonForAllAssets");
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWantsShowInLibraryButton:", v8);

  }
}

- (UIView)chromeView
{
  void *v2;
  void *v3;

  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (BOOL)_wantsShowInLibraryButtonForAllAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if ((-[PUOneUpViewController _options](self, "_options") & 0x8000) != 0)
    return 1;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "actionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "canPerformAction:onAllAssetReferences:", 39, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateReviewScreenBars
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v11[4];
  char v12;
  char v13;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewScreenBarsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _reviewScreenControlBarTileViewController](self, "_reviewScreenControlBarTileViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBarsModel:", v5);

  -[PUOneUpViewController _reviewScreenTopBarTileViewController](self, "_reviewScreenTopBarTileViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBarsModel:", v5);

  -[PUOneUpViewController _reviewScreenScrubberBarTileViewController](self, "_reviewScreenScrubberBarTileViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBarsModel:", v5);

  -[PUOneUpViewController _spec](self, "_spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v9, "shouldLayoutReviewScreenControlBarVertically");
  v10 = objc_msgSend(v9, "shouldCounterrotateReviewScreenBars");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__PUOneUpViewController__updateReviewScreenBars__block_invoke;
  v11[3] = &__block_descriptor_34_e42_v16__0___PUMutableReviewScreenBarsModel__8l;
  v12 = (char)v8;
  v13 = v10;
  objc_msgSend(v5, "performChanges:", v11);

}

- (void)_invalidateEditMode
{
  -[PUOneUpViewController _setNeedsUpdateEditMode:](self, "_setNeedsUpdateEditMode:", 1);
}

- (void)_updateEditModeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;

  if (-[PUOneUpViewController _needsUpdateEditMode](self, "_needsUpdateEditMode"))
  {
    -[PUOneUpViewController _setNeedsUpdateEditMode:](self, "_setNeedsUpdateEditMode:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "currentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v4, "currentAssetReference");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "assetViewModelForAssetReference:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "isInEditMode");
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = PUTileKindUserTransform;
      objc_msgSend(v5, "dataSourceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v14 = v13;
      else
        v14 = 0;
      v17 = v14;

      v15 = v8 ^ 1u;
    }
    else
    {
      v17 = 0;
      v15 = 1;
    }
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScrollEnabled:", v15);

    objc_msgSend(v17, "setUserInteractionEnabled:", v15);
  }
}

- (void)_invalidateImageAnalysisActionInfoBottomPosition
{
  -[PUOneUpViewController _setNeedsUpdateImageAnalysisActionInfoBottomPosition:](self, "_setNeedsUpdateImageAnalysisActionInfoBottomPosition:", 1);
}

- (void)_updateImageAnalysisActionInfoBottomPositionIfNeeded
{
  void *v3;
  double v4;
  double v5;
  id v6;

  if (-[PUOneUpViewController _needsUpdateImageAnalysisActionInfoBottomPosition](self, "_needsUpdateImageAnalysisActionInfoBottomPosition"))
  {
    -[PUOneUpViewController _setNeedsUpdateImageAnalysisActionInfoBottomPosition:](self, "_setNeedsUpdateImageAnalysisActionInfoBottomPosition:", 0);
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentDecorationAdditionalInsets");
    v5 = v4;

    -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAdditionalActionInfoBottomEdgeInset:", v5);

  }
}

- (void)_scheduleTimedChromeAutoHide
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chromeAutoHideDelay");
  v5 = v4;

  -[PUOneUpViewController _chromeAutoHideTimer](self, "_chromeAutoHideTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v5 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__chromeAutoHideTimerFired_, 0, 0, v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _setChromeAutoHideTimer:](self, "_setChromeAutoHideTimer:", v7);

  }
}

- (void)_cancelTimedChromeAutoHide
{
  void *v3;

  -[PUOneUpViewController _chromeAutoHideTimer](self, "_chromeAutoHideTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[PUOneUpViewController _setChromeAutoHideTimer:](self, "_setChromeAutoHideTimer:", 0);
}

- (void)_chromeAutoHideTimerFired:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  -[PUOneUpViewController _setChromeAutoHideTimer:](self, "_setChromeAutoHideTimer:", 0);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (PUShouldAutoHideChrome(v5, 1))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__PUOneUpViewController__chromeAutoHideTimerFired___block_invoke;
    v6[3] = &unk_1E58ABD10;
    v7 = v5;
    objc_msgSend(v7, "performChanges:", v6);

  }
}

- (void)_hideChromeOnPlayButtonTapWithItemIsNowPlaying:(BOOL)a3 buttonIsOverlayed:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;

  if (a3 && a4)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = PUShouldAutoHideChrome(v6, objc_msgSend(v8, "chromeAutoHideBehaviorOnPlayButton"));

    objc_msgSend(v7, "indexPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController _videoPlayerAtIndexPath:layout:](self, "_videoPlayerAtIndexPath:layout:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (!-[PUOneUpViewController _isSecondScreenBrowserVisible](self, "_isSecondScreenBrowserVisible") || !v13))
    {
      -[PUOneUpViewController _barsController](self, "_barsController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "disableChromeHiding");

      if ((v15 & 1) == 0)
      {
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __90__PUOneUpViewController__hideChromeOnPlayButtonTapWithItemIsNowPlaying_buttonIsOverlayed___block_invoke;
        v16[3] = &unk_1E58ABCA8;
        v17 = v6;
        v18 = v7;
        objc_msgSend(v17, "performChanges:", v16);

      }
    }

  }
}

- (void)_configureAdoptedTileController:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "setDelegate:", self);
    v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_9:
    objc_msgSend(v4, "setDelegate:", self);
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PUOneUpViewController activeVideoTileControllers](self, "activeVideoTileControllers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

    objc_msgSend(v5, "setCanPlayVideo:", -[PUOneUpViewController videoTilesCanPlayVideo](self, "videoTilesCanPlayVideo"));
    objc_msgSend(v5, "setIsOnSecondScreen:", -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"));
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v6 = v4;
  v5 = v6;
LABEL_6:
  objc_msgSend(v6, "setPresentingDelegate:", self);
LABEL_7:
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBrowsingViewModel:", v8);

LABEL_10:
  v9 = -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen");
  v12 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v10 = v12;
  else
    v10 = 0;

  objc_msgSend(v10, "setIsOnPrimaryDisplay:", !v9);
}

- (void)_abandonTileController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "setDelegate:", 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[PUOneUpViewController activeVideoTileControllers](self, "activeVideoTileControllers");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v6);

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_6;
        objc_msgSend(v6, "setPresentingDelegate:", 0);
      }
      objc_msgSend(v6, "setBrowsingViewModel:", 0);
      goto LABEL_6;
    }
    v4 = v6;
    objc_msgSend(v4, "setDelegate:", 0);
    objc_msgSend(v4, "setPresentingDelegate:", 0);
    objc_msgSend(v4, "setBrowsingViewModel:", 0);

  }
LABEL_6:

}

- (void)_browsingVideoPlayerDidPlayToEndTime:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpViewController _shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:](self, "_shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:", v4))
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __62__PUOneUpViewController__browsingVideoPlayerDidPlayToEndTime___block_invoke;
    v8[3] = &unk_1E58ABD10;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v7, "performChanges:", v8);

  }
}

- (void)_invalidateAssetActionManager
{
  PXAssetActionManager *assetActionManager;

  assetActionManager = self->_assetActionManager;
  self->_assetActionManager = 0;

}

- (PXAssetActionManager)assetActionManager
{
  PXAssetActionManager *assetActionManager;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  Class *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  PXAssetActionManager *v34;
  id v35;
  id v37;
  id v38;

  assetActionManager = self->_assetActionManager;
  if (!assetActionManager)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v4, "dataSourceManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0
      || (objc_opt_class(),
          v8 = objc_opt_isKindOfClass(),
          v7,
          objc_msgSend(v4, "dataSourceManager"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          (v8 & 1) != 0))
    {
      objc_msgSend(v7, "photosDataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      v26 = objc_opt_isKindOfClass();

      if ((v26 & 1) == 0)
        goto LABEL_17;
      objc_msgSend(v4, "dataSourceManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dataSourceManagers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v28, "photosDataSource");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }

    }
    if (v9)
    {
      v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B6F8]), "initWithPhotosDataSource:", v9);
      objc_msgSend(v4, "viewModel");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currentAssetReference");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "indexPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "section");
      if (v14 >= objc_msgSend(v9, "numberOfSections"))
      {
        v22 = 0;
LABEL_29:

        goto LABEL_30;
      }
      v37 = v11;
      v38 = v10;
      objc_msgSend(v12, "indexPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "item");
      objc_msgSend(v12, "indexPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v17, "section"));

      if (v16 < v18)
      {
        objc_msgSend(v12, "indexPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "assetReferenceAtIndexPath:", v19);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = -[PUOneUpViewController wantsSpotlightStyling](self, "wantsSpotlightStyling");
        v21 = (Class *)0x1E0D7B6E0;
        if (!v20)
          v21 = (Class *)0x1E0D7B6C0;
        v22 = (void *)objc_msgSend(objc_alloc(*v21), "initWithSelectedObjectReference:dataSourceManager:", v13, v38);
        -[PUOneUpViewController browsingSession](self, "browsingSession");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "actionManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;

        objc_msgSend(v25, "underlyingActionManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v32 = objc_opt_isKindOfClass();

        if ((v32 & 1) != 0)
        {
          objc_msgSend(v25, "underlyingActionManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setAdditionalPropertiesFromActionManager:", v33);

        }
        v11 = v37;
        v10 = v38;
        goto LABEL_29;
      }
      v22 = 0;
      v11 = v37;
      v10 = v38;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
LABEL_17:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      v22 = 0;
LABEL_32:
      objc_msgSend(v22, "setPerformerDelegate:", self);
      v34 = self->_assetActionManager;
      self->_assetActionManager = (PXAssetActionManager *)v22;
      v35 = v22;

      assetActionManager = self->_assetActionManager;
      return assetActionManager;
    }
    v10 = v4;
    objc_msgSend(v10, "viewModel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "currentAssetReference");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v12;

      if (!v11)
      {
        v9 = 0;
        v22 = 0;
        goto LABEL_31;
      }
      objc_msgSend(v10, "importController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      PXCreateImportAssetActionManager();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
    }
    else
    {
      v11 = 0;
      v9 = 0;
      v22 = 0;
    }
    goto LABEL_30;
  }
  return assetActionManager;
}

- (id)_livePhotoBadge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PUTileKindBadge;
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "livePhotoBadgeContainerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)browsingTileViewAnimator
{
  void *v2;
  void *v3;
  id v4;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tileAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_handleZoomOutCurrentAsset
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUOneUpViewController wasChromeVisibleBeforeZoomIn](self, "wasChromeVisibleBeforeZoomIn")
    && (objc_msgSend(v4, "isChromeVisible") & 1) == 0)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__PUOneUpViewController__handleZoomOutCurrentAsset__block_invoke;
    v5[3] = &unk_1E58ABD10;
    v6 = v4;
    objc_msgSend(v6, "performChanges:", v5);

  }
}

- (id)presentationEnvironmentForActionPerformer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
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
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  CGRect v28;

  v4 = a3;
  if (!objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionType");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "sourceItemForActionType:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)MEMORY[0x1E0D7BBE8];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D7BBE8], "popoverPresenterWithViewController:sourceItem:", self, v8);
      v23 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    objc_msgSend(v22, "defaultPresenterWithViewController:", self);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v4, "actionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PUAssetActionTypeForPXAssetActionType(v5);

  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oneUpActionsControllerPopoverSourceViewWithActionType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oneUpActionsControllerPopoverSourceRectIn:actionType:", v8, v6);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v28.origin.x = v11;
  v28.origin.y = v13;
  v28.size.width = v15;
  v28.size.height = v17;
  if (CGRectIsNull(v28))
  {
    objc_msgSend(v8, "bounds");
    v11 = v18;
    v13 = v19;
    v15 = v20;
    v17 = v21;
  }
  v22 = (void *)MEMORY[0x1E0D7BBE8];
  if (!v8)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0D7BBE8], "popoverPresenterWithViewController:sourceView:sourceRect:", self, v8, v11, v13, v15, v17);
  v23 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v26 = (void *)v23;

  return v26;
}

- (void)_keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MaxY;
  double v33;
  double v34;
  CGFloat rect;
  id rect_8;
  CGRect v37;
  CGRect v38;

  rect_8 = a3;
  -[PUOneUpViewController currentFloatingInfoPanelAccessoryViewController](self, "currentFloatingInfoPanelAccessoryViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PUOneUpViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(rect_8, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0DC4E90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v5, "window");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:fromView:", v16, v9, v11, v13, v15);
    rect = v17;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(v5, "safeAreaInsets");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    objc_msgSend(v5, "bounds");
    MaxY = CGRectGetMaxY(v37);
    v38.origin.x = rect;
    v38.origin.y = v19;
    v38.size.width = v21;
    v38.size.height = v23;
    v33 = MaxY - CGRectGetMinY(v38);
    if (v29 >= v33)
      v34 = v29;
    else
      v34 = v33;
    objc_msgSend(v4, "setMaxVisibleContentInsetsWhenInEdit:", v25, v27, v34, v31, *(_QWORD *)&rect);

  }
}

- (BOOL)_shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;

  v4 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetViewModelForAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoPlayer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v4 && objc_msgSend(v6, "lastChromeVisibilityChangeReason") == 4)
  {
    objc_msgSend(v6, "lastChromeVisibilityChangeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_isLocationFromProviderInAccessoryArea:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6 + -0.5;
  v9 = v8 + -0.5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__PUOneUpViewController__isLocationFromProviderInAccessoryArea___block_invoke;
  v13[3] = &unk_1E58A7BF8;
  v15 = &v16;
  v10 = v4;
  v14 = v10;
  objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  v11 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (BOOL)_isLocationFromProviderOverControl:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6 + -0.5;
  v9 = v8 + -0.5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PUOneUpViewController__isLocationFromProviderOverControl___block_invoke;
  v13[3] = &unk_1E58A2F28;
  v16 = v6;
  v17 = v8;
  v10 = v5;
  v14 = v10;
  v15 = &v18;
  objc_msgSend(v10, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (BOOL)_isLocationFromProvider:(id)a3 overTileOfKind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assetsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathForAssetReference:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v12, v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v6, "locationInView:", v13);
      objc_msgSend(v16, "convertPoint:fromView:", v13);
      objc_msgSend(v16, "hitTest:withEvent:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)currentImageAnalysisInteraction
{
  void *v2;
  void *v3;
  void *v4;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAnalysisInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isLocationFromProviderOverInteractiveItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interactiveItemExistsAtLocation:", v4);

  return v6;
}

- (BOOL)_isLocationFromProviderOverActionInfoItem:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "actionInfoItemExistsAtLocation:", v4);

  return v6;
}

- (BOOL)_visualImageHasActiveTextSelectionFromProvider:(id)a3
{
  void *v3;
  char v4;

  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActiveTextSelection");

  return v4;
}

- (BOOL)_isVisualImageHasSubjectLiftedFromProvider:(id)a3
{
  void *v3;
  char v4;

  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "subjectHighlightActive");

  return v4;
}

- (BOOL)_vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  char v12;
  char v13;
  BOOL v14;
  CGPoint v16;
  CGRect v17;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hostView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (objc_msgSend(v5, "isVisualIntelligenceOverlayInitialized"))
    {
      objc_msgSend(v4, "locationInView:", v6);
      v8 = v7;
      v10 = v9;
      if (objc_msgSend(v5, "imageInteractionHasAnalysisAndSubjectLiftingEnabled"))
      {
        objc_msgSend(v5, "assetViewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasVisualAnalysisFailed");

        if ((v12 & 1) == 0)
        {
          if ((objc_msgSend(v5, "isImageSubjectAnalyzingFinished") & 1) == 0
            && (objc_msgSend(v5, "isImageSubjectAnalysisAvailable") & 1) == 0)
          {
            objc_msgSend(v6, "bounds");
            v16.x = v8;
            v16.y = v10;
            v13 = CGRectContainsPoint(v17, v16);
            goto LABEL_12;
          }
          if (objc_msgSend(v5, "isImageSubjectAnalysisAvailable"))
          {
            v13 = objc_msgSend(v5, "imageSubjectExistsAtLocation:", v4);
LABEL_12:
            v14 = v13;
            goto LABEL_10;
          }
        }
      }
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (BOOL)_isLocationFromProviderOverVisualSearch:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visualSearchExistsAtLocation:", v4);

  return v6;
}

- (BOOL)_isLocationFromProviderOverImageSubject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "imageSubjectExistsAtLocation:", v4);

  return v6;
}

- (BOOL)_isLocationFromProviderOverInteractiveItemExcludingImageSubject:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "textExistsAtLocation:", v4) & 1) != 0
    || (objc_msgSend(v5, "dataDetectorExistsAtLocation:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "actionInfoItemExistsAtLocation:", v4);
  }

  return v6;
}

- (void)_handleTouchGesture:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[PUOneUpViewController _updateViewModelWithCurrentScrollPosition](self, "_updateViewModelWithCurrentScrollPosition");
    -[PUOneUpViewController setTouchingGestureRecognizerStateBeginID:](self, "setTouchingGestureRecognizerStateBeginID:", -[PUOneUpViewController touchingGestureRecognizerStateBeginID](self, "touchingGestureRecognizerStateBeginID") + 1);
    -[PUOneUpViewController _beginVKSubjectAnalyzingWithGestureRecognizer:beginID:](self, "_beginVKSubjectAnalyzingWithGestureRecognizer:beginID:", v4, -[PUOneUpViewController touchingGestureRecognizerStateBeginID](self, "touchingGestureRecognizerStateBeginID"));
  }

}

- (void)_beginVKSubjectAnalyzingWithGestureRecognizer:(id)a3 beginID:(unint64_t)a4
{
  id v6;
  void *v7;
  int v8;
  dispatch_time_t v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  id from;
  id location;

  v6 = a3;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsVisualIntelligenceRemoveBackground");

  if (v8)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v6);
    v9 = dispatch_time(0, 150000000);
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__PUOneUpViewController__beginVKSubjectAnalyzingWithGestureRecognizer_beginID___block_invoke;
    block[3] = &unk_1E58A2F50;
    objc_copyWeak(&v12, &location);
    v13[1] = (id)a4;
    objc_copyWeak(v13, &from);
    dispatch_after(v9, v10, block);

    objc_destroyWeak(v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

}

- (void)_presentAlertForUnplayableAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  dispatch_time_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  id location;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;

  v4 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PUOneUpViewController _options](self, "_options");
  objc_msgSend(v4, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "mediaType");

  if ((v7 & 2) == 0 && v9 == 2 && (objc_msgSend(v6, "isPresentedForPreview") & 1) == 0)
  {
    objc_msgSend(v6, "currentAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v4))
    {
      objc_msgSend(v6, "assetViewModelForAssetReference:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "videoPlayer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke;
      v22[3] = &unk_1E58ABD10;
      v23 = v11;
      v14 = v11;
      objc_msgSend(v12, "performChanges:", v22);

      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_2;
      v20[3] = &unk_1E58ABD10;
      v21 = v6;
      objc_msgSend(v21, "performChanges:", v20);
      objc_initWeak(&location, self);
      v15 = dispatch_time(0, 400000000);
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_3;
      block[3] = &unk_1E58AB210;
      v17 = v4;
      objc_copyWeak(&v18, &location);
      dispatch_after(v15, MEMORY[0x1E0C80D38], block);
      objc_destroyWeak(&v18);

      objc_destroyWeak(&location);
    }

  }
}

- (void)_toggleAccessoryVisibility
{
  -[PUOneUpViewController _setAccessoryVisible:](self, "_setAccessoryVisible:", -[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible") ^ 1);
}

- (BOOL)wantsActionsMenu
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  unint64_t v15;
  BOOL v17;
  int v18;

  if (self->_wantsActionsMenu)
    return 1;
  objc_msgSend(MEMORY[0x1E0D7B320], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "actionsMenuLocation");
  v6 = v5 == 1;
  -[PUOneUpViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    v18 = objc_msgSend(v4, "enableActionsMenuOnPad");
  else
    v18 = 0;

  -[PUOneUpViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "userInterfaceIdiom"))
    v9 = 0;
  else
    v9 = objc_msgSend(v4, "enableActionsMenuOnPhone");

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    v14 = 0;
    goto LABEL_16;
  }
  v14 = v13;

  if (v5 != 1 || !v14)
  {
LABEL_16:
    if (v6 && v18 | v9)
    {
      v15 = -[PUOneUpViewController _options](self, "_options");
      v17 = (-[PUOneUpViewController _options](self, "_options") & 8) == 0 && v15 != 0x20000;
      self->_wantsActionsMenu = v17;
    }
    goto LABEL_25;
  }
  if ((objc_msgSend(v14, "px_isRecentlyDeletedSmartAlbum") & 1) == 0)
  {
    v6 = objc_msgSend(v14, "px_isRecoveredSmartAlbum") ^ 1;
    goto LABEL_16;
  }
LABEL_25:

  return self->_wantsActionsMenu;
}

- (BOOL)_isCameraDetailsAccessory
{
  int64_t v3;
  int64_t v4;

  v3 = -[PUOneUpViewController presentationOrigin](self, "presentationOrigin");
  v4 = -[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset");
  return v3 == 37 && v4 == 1;
}

- (void)_updateFloatingInfoPanelIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;

  if (-[PUOneUpViewController isFloatingInfoPanelPresented](self, "isFloatingInfoPanelPresented"))
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAssetReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController uuidOfAssetPresentedInFloatingInfoPanel](self, "uuidOfAssetPresentedInFloatingInfoPanel");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v10)
    {

    }
    else
    {
      v8 = v7;
      v9 = objc_msgSend(v7, "isEqualToString:", v10);

      if ((v9 & 1) == 0)
        -[PUOneUpViewController _updateFloatingInfoPanel](self, "_updateFloatingInfoPanel");
    }

  }
}

- (void)_updateFloatingInfoPanel
{
  -[PUOneUpViewController _dismissFloatingInfoPanelAnimated:](self, "_dismissFloatingInfoPanelAnimated:", 0);
  -[PUOneUpViewController _presentFloatingInfoPanelAnimated:](self, "_presentFloatingInfoPanelAnimated:", 0);
  -[PUOneUpViewController _invalidateInfoPanelLayoutAnimated:](self, "_invalidateInfoPanelLayoutAnimated:", 1);
}

- (void)_presentFloatingInfoPanelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D7B648], "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "hideFloatingInfoPanel") & 1) == 0)
  {
    -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isPresenting");

    if ((v6 & 1) != 0)
      return;
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentAssetReference");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAccessoryViewControllerForAssetReference:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "setContentInsets:changeReason:", 1, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
      -[PUOneUpViewController setCurrentFloatingInfoPanelAccessoryViewController:](self, "setCurrentFloatingInfoPanelAccessoryViewController:", v10);
      objc_msgSend(v14, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController setUuidOfAssetPresentedInFloatingInfoPanel:](self, "setUuidOfAssetPresentedInFloatingInfoPanel:", v12);

      -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentViewController:animated:", v10, v3);

    }
  }

}

- (void)_dismissFloatingInfoPanelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresenting");

  if (v6)
  {
    -[PUOneUpViewController setCurrentFloatingInfoPanelAccessoryViewController:](self, "setCurrentFloatingInfoPanelAccessoryViewController:", 0);
    -[PUOneUpViewController setUuidOfAssetPresentedInFloatingInfoPanel:](self, "setUuidOfAssetPresentedInFloatingInfoPanel:", 0);
    -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissAnimated:", v3);

  }
}

- (BOOL)isFloatingInfoPanelPresented
{
  void *v2;
  char v3;

  -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresenting");

  return v3;
}

- (void)_dimFloatingInfoPanelAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;

  v3 = a3;
  -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresenting");

  if (v6)
  {
    -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dimAnimated:", v3);

  }
}

- (void)_invalidateInfoPanelLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[PUOneUpViewController currentFloatingInfoPanelAccessoryViewController](self, "currentFloatingInfoPanelAccessoryViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresenting");

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
  {
    v7 = v11;
    objc_msgSend(v7, "composition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B7B0]), "initWithPhotosDetailsUIViewController:widgetComposition:", v7, v8);

    -[PUOneUpViewController cardPresentationController](self, "cardPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLayout:animated:", v9, v3);

  }
}

- (BOOL)_prefersFloatingInfoPanel
{
  void *v3;
  char v4;

  -[PUOneUpViewController _spec](self, "_spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersFloatingInfoPanel");

  if (-[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 1)
    return v4;
  else
    return 0;
}

- (void)_updateImageAnalysisInteractionDelegate
{
  id v3;

  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

}

- (void)_updateAccessoryViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;

  if (-[PUOneUpViewController _needsUpdateAccessoryView](self, "_needsUpdateAccessoryView"))
  {
    -[PUOneUpViewController _setNeedsUpdateAccessoryView:](self, "_setNeedsUpdateAccessoryView:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentAssetReference");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel"))
    {
      if (!objc_msgSend(v5, "isAccessoryViewVisible"))
      {
        -[PUOneUpViewController _dismissFloatingInfoPanelAnimated:](self, "_dismissFloatingInfoPanelAnimated:", 1);
        goto LABEL_24;
      }
      objc_msgSend(v20, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "layout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (v6)
          objc_msgSend(v8, "invalidateAccessoryForItemAtIndexPath:withOptions:", v6, 5);
      }
      -[PUOneUpViewController _presentFloatingInfoPanelAnimated:](self, "_presentFloatingInfoPanelAnimated:", 1);

    }
    else
    {
      -[PUOneUpViewController _dismissFloatingInfoPanelAnimated:](self, "_dismissFloatingInfoPanelAnimated:", 1);
      objc_msgSend(MEMORY[0x1E0D7B7C8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "captionWidgetEnableDirectAttachToMaster");

      LODWORD(v9) = objc_msgSend(v5, "isAccessoryViewVisible");
      v11 = objc_msgSend(v5, "isLastAccessoryViewVisibilityChangeReasonUserAction");
      v12 = 5;
      if ((v9 & v10) != 0)
        v12 = 1;
      if (v11)
        v13 = v12;
      else
        v13 = 1;
      -[PUOneUpViewController _spec](self, "_spec");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hideScrubberWhenShowingAccessoryView");

      if (v15)
        -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
      objc_msgSend(v20, "indexPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "layout");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && v6)
        objc_msgSend(v17, "invalidateAccessoryForItemAtIndexPath:withOptions:", v6, v13);
      -[PUOneUpViewController _spec](self, "_spec");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "hideBadgesWhenShowingAccessoryView");

      if (v19)
        -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");

    }
LABEL_24:

  }
}

- (void)_toggleDetailsVisibility
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 1)
  {
    -[PUOneUpViewController _toggleAccessoryVisibility](self, "_toggleAccessoryVisibility");
  }
  else
  {
    PLOneUpGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "couldn't toggle details", v4, 2u);
    }

  }
}

- (void)_toggleCommentsVisibility
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 2)
  {
    -[PUOneUpViewController _toggleAccessoryVisibility](self, "_toggleAccessoryVisibility");
  }
  else
  {
    PLOneUpGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AAB61000, v3, OS_LOG_TYPE_DEFAULT, "couldn't toggle comments", v4, 2u);
    }

  }
}

- (int64_t)_accessoryContentKindForCurrentAsset
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  -[PUOneUpViewController _spec](self, "_spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowAccessoryVisibility");

  if (!v4)
    return 0;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v8))
  {
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (int64_t)_accessoryContentKindForAsset:(id)a3
{
  id v4;
  void *v5;
  int v6;
  int64_t v7;

  v4 = a3;
  -[PUOneUpViewController _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowAccessoryVisibility");

  if (v6)
  {
    if (+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v4))
    {
      v7 = 2;
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_isAccessoryAvailableForCurrentAsset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "accessoryViewTypeForAsset:", v6);

  if (v8)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "canPerformSimpleActionWithActionType:", 13) ^ 1;

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_isAccessoryVisible
{
  void *v2;
  void *v3;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "accessoryViewsDefaultVisibility");
  return (char)v2;
}

- (BOOL)_isTipPopoverVisible
{
  return self->_presentedTipID != 0;
}

- (void)_setAccessoryVisible:(BOOL)a3
{
  -[PUOneUpViewController _setAccessoryVisible:changeReason:](self, "_setAccessoryVisible:changeReason:", a3, 1);
}

- (void)_setAccessoryVisible:(BOOL)a3 changeReason:(int64_t)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  BOOL v16;
  _QWORD v17[4];
  id v18;

  v5 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke;
    v17[3] = &unk_1E58ABD10;
    v18 = v8;
    objc_msgSend(v18, "performChanges:", v17);
    if (-[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 1)
    {
      -[PUOneUpViewController _setHasShownRelevantTip:](self, "_setHasShownRelevantTip:", 1);
      v10 = (void *)MEMORY[0x1E0D7B650];
      objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTipActionPerformed:", v11);

    }
  }
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke_2;
  v13[3] = &unk_1E58AA4F0;
  v16 = v5;
  v14 = v8;
  v15 = a4;
  v12 = v8;
  objc_msgSend(v12, "performChanges:", v13);

}

- (id)_currentAccessoryViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryViewControllerForAssetReference:createIfNeeded:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_requireUnlockedDeviceForAccessoryView
{
  return 0;
}

- (double)px_HDRFocus
{
  void (**v3)(void *, void *, double);
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  _QWORD aBlock[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__PUOneUpViewController_px_HDRFocus__block_invoke;
  aBlock[3] = &unk_1E58A2FA0;
  aBlock[4] = &v15;
  v3 = (void (**)(void *, void *, double))_Block_copy(aBlock);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentAssetTransitionProgress");
  v7 = v6;
  objc_msgSend(v5, "leadingAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v8, (0.5 - v7) * 0.666666687);

  objc_msgSend(v5, "currentAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = fabs(v7);
  v3[2](v3, v9, (v10 + v10) / -3.0 + 1.0);

  objc_msgSend(v5, "trailingAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v3[2](v3, v11, (v7 + 0.5) * 0.666666687);

  v12 = v16[3];
  _Block_object_dispose(&v15, 8);
  return v12;
}

- (double)px_imageModulationIntensity
{
  void *v2;
  void *v3;
  double v4;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPresentedForPreview"))
    v4 = 0.0;
  else
    v4 = 1.0;

  return v4;
}

- (void)_setSecondScreenBrowser:(id)a3
{
  PUOneUpViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  PUOneUpViewController *v17;

  v5 = (PUOneUpViewController *)a3;
  if (self->__secondScreenBrowser != v5)
  {
    v17 = v5;
    objc_storeStrong((id *)&self->__secondScreenBrowser, a3);
    -[PUOneUpViewController _updateActiveVideoTilesCanDisplayVideo](self, "_updateActiveVideoTilesCanDisplayVideo");
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "assetsDataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEmpty");

    if ((v13 & 1) == 0)
    {
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layoutIfNeeded");

      objc_msgSend(v11, "currentAssetReference");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "indexPath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidateVideoPlaceholderForItemAtIndexPath:", v16);

    }
    v5 = v17;
  }

}

- (void)_updateActiveVideoTilesCanDisplayVideo
{
  _BOOL8 v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[PUOneUpViewController videoTilesCanPlayVideo](self, "videoTilesCanPlayVideo");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PUOneUpViewController activeVideoTileControllers](self, "activeVideoTileControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setCanPlayVideo:", v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)videoTilesCanPlayVideo
{
  BOOL v3;
  void *v4;

  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
    return 1;
  -[PUOneUpViewController _secondScreenBrowser](self, "_secondScreenBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 == 0;

  return v3;
}

- (id)_assetReferenceAtIndexPath:(id)a3 layout:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetReferenceAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_currentAssetViewModel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assetViewModelForAssetReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_assetViewModelAtIndexPath:(id)a3 layout:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUOneUpViewController _assetReferenceAtIndexPath:layout:](self, "_assetReferenceAtIndexPath:layout:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetViewModelForAssetReference:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_videoPlayerAtIndexPath:(id)a3 layout:(id)a4
{
  void *v4;
  void *v5;

  -[PUOneUpViewController _assetViewModelAtIndexPath:layout:](self, "_assetViewModelAtIndexPath:layout:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "videoPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)presentationControllerForTipID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  PUOneUpViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v30;
  uint64_t v31;
  __int16 v32;
  PUOneUpViewController *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", v5) & 1) != 0)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "barButtonItemToggleDetails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_21;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0D7B650], "livePhotosTipID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "isEqualToString:", v8);

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v21) & 1) != 0)
    {
      -[PUOneUpViewController _syndicationPillView](self, "_syndicationPillView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
        goto LABEL_21;
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x1E0D7B650], "actionsMenuTipID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isEqualToString:", v23) & 1) == 0)
    {

      goto LABEL_19;
    }
    -[PUOneUpViewController _barsController](self, "_barsController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "barButtonItemActionsMenu");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
LABEL_19:
      objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqualToString:", v26) & 1) != 0)
      {
        -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "cropButton");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          goto LABEL_21;
      }
      else
      {

      }
      PLOneUpGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v30 = 138543618;
        v31 = objc_opt_class();
        v32 = 2048;
        v33 = self;
        _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Failed to present tip view controller", (uint8_t *)&v30, 0x16u);
      }
      goto LABEL_13;
    }
LABEL_21:
    v20 = self;
    goto LABEL_22;
  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = objc_claimAutoreleasedReturnValue();

  -[NSObject assetsDataSource](v11, "assetsDataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject currentAssetReference](v11, "currentAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "indexPathForAssetReference:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = PUTileKindBadge;
  objc_msgSend(v12, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v18, "view"), v19 = (void *)objc_claimAutoreleasedReturnValue(), v19, !v19))
  {

LABEL_13:
    v20 = 0;
    goto LABEL_22;
  }
  v20 = self;

LABEL_22:
  return v20;
}

- (id)sourceItemForTipID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "barButtonItemToggleDetails");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (void *)v8;

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "livePhotosTipID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isEqualToString:", v10);

  if (v11)
  {
    -[PUOneUpViewController _livePhotoBadge](self, "_livePhotoBadge");
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v12;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "isEqualToString:", v13);

  if (v14)
  {
    -[PUOneUpViewController _syndicationPillView](self, "_syndicationPillView");
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "actionsMenuTipID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "isEqualToString:", v16);

  if (v17)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "barButtonItemActionsMenu");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "isEqualToString:", v18);

  if (v19)
  {
    -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cropButton");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  PXAssertGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = 138412290;
    v22 = v4;
    _os_log_error_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "No source item for tip ID: %@", (uint8_t *)&v21, 0xCu);
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (void)prepareTipPopover:(id)a3 tipID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  int v56;
  uint64_t v57;
  __int16 v58;
  PUOneUpViewController *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController _passthroughViews](self, "_passthroughViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPassthroughViews:", v8);

  objc_msgSend(MEMORY[0x1E0D7B650], "infoPanelTipID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToString:", v9);

  if (v10)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "barButtonItemToggleDetails");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v6, "setBarButtonItem:", v12);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "livePhotosTipID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v7, "isEqualToString:", v13);

  if (v14)
  {
    -[PUOneUpViewController _livePhotoBadge](self, "_livePhotoBadge");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
LABEL_17:

      -[PUOneUpBarsController setPresentedTipID:](self->__barsController, "setPresentedTipID:", v7);
      objc_storeStrong((id *)&self->_presentedTipID, a4);
      goto LABEL_18;
    }
    objc_msgSend(v6, "setSourceView:", v12);
    objc_msgSend(v6, "sourceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v12, "superview");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "convertRect:fromCoordinateSpace:", v24, v17, v19, v21, v23);
    objc_msgSend(v6, "setSourceRect:");

LABEL_7:
    objc_msgSend(v6, "setPermittedArrowDirections:", 1);
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v7, "isEqualToString:", v25);

  if (v26)
  {
    -[PUOneUpViewController _syndicationPillView](self, "_syndicationPillView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "setSourceView:", v12);
      objc_msgSend(v6, "sourceView");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      objc_msgSend(v12, "superview");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v36, v29, v31, v33, v35);
      objc_msgSend(v6, "setSourceRect:");

    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "actionsMenuTipID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v7, "isEqualToString:", v37);

  if (v38)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "barButtonItemActionsMenu");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_17;
    objc_msgSend(v6, "setBarButtonItem:", v12);
    objc_msgSend(v6, "popoverLayoutMargins");
    objc_msgSend(v6, "setPopoverLayoutMargins:");
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v7, "isEqualToString:", v40);

  if (v41)
  {
    -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "cropButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "setSourceView:", v12);
      objc_msgSend(v6, "sourceView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "frame");
      v45 = v44;
      v47 = v46;
      v49 = v48;
      v51 = v50;
      objc_msgSend(v12, "superview");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "convertRect:fromCoordinateSpace:", v52, v45, v47, v49, v51);
      objc_msgSend(v6, "setSourceRect:");

      v53 = objc_msgSend(v12, "overrideUserInterfaceStyle");
      objc_msgSend(v6, "traitOverrides");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "setUserInterfaceStyle:", v53);

    }
    goto LABEL_17;
  }
  PLOneUpGetLog();
  v55 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    v56 = 138543874;
    v57 = objc_opt_class();
    v58 = 2048;
    v59 = self;
    v60 = 2112;
    v61 = v7;
    _os_log_impl(&dword_1AAB61000, v55, OS_LOG_TYPE_ERROR, "<%{public}@:%p> Invalid tip ID %@", (uint8_t *)&v56, 0x20u);
  }

LABEL_18:
}

- (void)tipPopoverDidPresentWithTipID:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v9, "isEqualToString:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D7B650], "signalSyndicatedPhotosPresented");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7B650], "quickCropTipID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "isEqualToString:", v6);

    if (v7)
    {
      -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setPresentingTip:", 1);

    }
  }

}

- (void)tipPopoverDidDismissWithTipID:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void (**tipDismissedCompletion)(void);
  id v10;
  NSString *presentedTipID;

  v4 = (void *)MEMORY[0x1E0D7B650];
  v5 = a3;
  objc_msgSend(v4, "quickCropTipID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[PUOneUpViewController _cropButtonTileViewControllerForCurrentAsset](self, "_cropButtonTileViewControllerForCurrentAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPresentingTip:", 0);

  }
  tipDismissedCompletion = (void (**)(void))self->_tipDismissedCompletion;
  if (tipDismissedCompletion)
  {
    tipDismissedCompletion[2]();
    v10 = self->_tipDismissedCompletion;
    self->_tipDismissedCompletion = 0;

  }
  -[PUOneUpBarsController setPresentedTipID:](self->__barsController, "setPresentedTipID:", 0);
  presentedTipID = self->_presentedTipID;
  self->_presentedTipID = 0;

}

- (id)_passthroughViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUOneUpViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toolbar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  v9 = v8;
  if (v4)
    objc_msgSend(v8, "addObject:", v4);
  if (v6)
    objc_msgSend(v9, "addObject:", v6);
  if (v7)
    objc_msgSend(v9, "addObject:", v7);

  return v9;
}

- (id)_syndicationPillView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = PUTileKindSyndicationAttribution;
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "pillView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "superview");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v12, "window");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        v16 = objc_msgSend(v12, "isHidden");

        if ((v16 & 1) == 0)
        {
          v13 = v12;
          goto LABEL_9;
        }
      }
      else
      {

      }
      v13 = 0;
    }
LABEL_9:

    goto LABEL_10;
  }
  v13 = 0;
LABEL_10:

  return v13;
}

- (void)viewControllerSpec:(id)a3 didChange:(id)a4
{
  id v5;

  v5 = a4;
  if (objc_msgSend(v5, "contentLockingChanged"))
    -[PUOneUpViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  if ((objc_msgSend(v5, "shouldPlaceButtonsInNavigationBarChanged") & 1) != 0
    || (objc_msgSend(v5, "shouldUseCompactTitleViewChanged") & 1) != 0
    || (objc_msgSend(v5, "maximumToolbarHeightChanged") & 1) != 0
    || (objc_msgSend(v5, "shouldUseCompactCommentsTitleChanged") & 1) != 0
    || (objc_msgSend(v5, "shouldPlaceScrubberInScrubberBarChanged") & 1) != 0
    || objc_msgSend(v5, "contentLockingChanged"))
  {
    -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
  }
  if ((objc_msgSend(v5, "backgroundColorOverrideChanged") & 1) != 0
    || objc_msgSend(v5, "shouldDisplayEmptyPlaceholderChanged"))
  {
    -[PUOneUpViewController _updateBackgroundTileViewController](self, "_updateBackgroundTileViewController");
  }
  if ((objc_msgSend(v5, "shouldLayoutReviewScreenControlBarVerticallyChanged") & 1) != 0
    || objc_msgSend(v5, "shouldCounterrotateReviewScreenBarsChanged"))
  {
    -[PUOneUpViewController _updateReviewScreenBars](self, "_updateReviewScreenBars");
  }
  if (-[PUOneUpViewController _isLayoutAffectedBySpecChange:](self, "_isLayoutAffectedBySpecChange:", v5))
    -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
  if (objc_msgSend(v5, "hideScrubberWhenShowingAccessoryView"))
    -[PUOneUpViewController _invalidateChromeViewController](self, "_invalidateChromeViewController");
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (BOOL)_isLayoutAffectedBySpecChange:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "shouldUseContentGuideInsetsChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldUseUserTransformTilesChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldDisplayBadgesChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldDisplayAssetExplorerReviewScreenBadgesChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldDisplayPlayButtonsChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldDisplayProgressIndicatorsChanged") & 1) != 0
    || (objc_msgSend(v3, "progressIndicatorSizeChanged") & 1) != 0
    || (objc_msgSend(v3, "progressIndicatorContentInsetsChanged") & 1) != 0
    || (objc_msgSend(v3, "bufferingIndicatorSizeChanged") & 1) != 0
    || (objc_msgSend(v3, "renderIndicatorSizeChanged") & 1) != 0
    || (objc_msgSend(v3, "canDisplayLoadingIndicatorsChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldUseCompactCommentsTitleChanged") & 1) != 0
    || (objc_msgSend(v3, "tileInitialContentModeChanged") & 1) != 0
    || (objc_msgSend(v3, "traitCollectionChanged") & 1) != 0
    || (objc_msgSend(v3, "shouldPinContentToTopChanged") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "shouldLayoutReviewScreenControlBarVerticallyChanged");
  }

  return v4;
}

- (BOOL)px_determinesPreferredStatusBarHidden
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  char v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUOneUpViewController;
  if (-[PUOneUpViewController prefersStatusBarHidden](&v7, sel_prefersStatusBarHidden))
    return 1;
  -[PUOneUpViewController _barsController](self, "_barsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "prefersStatusBarHidden") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "prefersStatusBarHidden");

  }
  return v3;
}

- (BOOL)pu_wantsNavigationBarVisible
{
  void *v2;
  char v3;

  -[PUOneUpViewController _barsController](self, "_barsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsNavigationBarVisible");

  return v3;
}

- (BOOL)pu_wantsToolbarVisible
{
  void *v4;
  char v5;

  if ((objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled") & 1) != 0)
    return 0;
  -[PUOneUpViewController _barsController](self, "_barsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wantsToolbarVisible");

  return v5;
}

- (BOOL)pu_wantsTabBarVisible
{
  return 0;
}

- (int64_t)pu_preferredBarStyle
{
  void *v2;
  int64_t v3;

  -[PUOneUpViewController _barsController](self, "_barsController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "preferredBarStyle");

  return v3;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled") ^ 1;
}

- (BOOL)oneUpActionsControllerDismissPresentedViewController:(id)a3
{
  _BOOL4 v4;

  v4 = -[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible", a3);
  if (v4)
  {
    -[PUOneUpViewController _dismissTipPopoverAnimated:](self, "_dismissTipPopoverAnimated:", 1);
    -[PUOneUpViewController _setHasShownRelevantTip:](self, "_setHasShownRelevantTip:", 1);
    -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
    -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");
  }
  return v4;
}

- (BOOL)oneUpActionsControllerShouldAnimateViewControllerPresentation:(id)a3
{
  return -[PUOneUpViewController _initialActivity](self, "_initialActivity", a3) == 0;
}

- (void)oneUpActionsControllerToggleChromeVisibility:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PUOneUpViewController_oneUpActionsControllerToggleChromeVisibility___block_invoke;
  v6[3] = &unk_1E58ABD10;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "performChanges:", v6);

}

- (void)oneUpActionsController:(id)a3 zoomAtLocationProvider:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[PUOneUpViewController _userTransformTileControllerAtLocationFromProvider:](self, "_userTransformTileControllerAtLocationFromProvider:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isZoomedIn"))
  {
    -[PUOneUpViewController _handleZoomOutCurrentAsset](self, "_handleZoomOutCurrentAsset");
    objc_msgSend(v5, "zoomOut:", 1);
  }
  else
  {
    objc_msgSend(v5, "zoomInOnLocationFromProvider:", v6);
  }

}

- (id)_userTransformTileControllerAtLocationFromProvider:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__53200;
  v15 = __Block_byref_object_dispose__53201;
  v16 = 0;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "locationInView:", v5);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__PUOneUpViewController__userTransformTileControllerAtLocationFromProvider___block_invoke;
    v10[3] = &unk_1E58A2FC8;
    v10[4] = &v11;
    objc_msgSend(v5, "enumeratePresentedTileControllersInRect:usingBlock:", v10, v6 + -1.0, v7 + -1.0, 2.0, 2.0);
  }
  v8 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (double)oneUpActionsControllerBottomPaddingForPresentingToast:(id)a3
{
  return 180.0;
}

- (BOOL)oneUpActionsControllerPrefersInclusionAfterRemoval:(id)a3 forActionType:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a4 != 40)
    return 0;
  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pxAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = objc_msgSend(v8, "px_isFavoritesSmartAlbum");
  return (char)v7;
}

- (BOOL)oneUpActionsControllerIsDetailsAccessoryAvailable:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[PUOneUpViewController _isDetailsAccessoryAvailableForAssetReference:](self, "_isDetailsAccessoryAvailableForAssetReference:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)setAppearanceTransitionAnimationsDisabled:(BOOL)a3
{
  if (self->_appearanceTransitionAnimationsDisabled != a3)
  {
    self->_appearanceTransitionAnimationsDisabled = a3;
    if (a3)
      -[PUOneUpViewController _setShouldDisableTransitionsUntilAppeared:](self, "_setShouldDisableTransitionsUntilAppeared:", 1);
  }
}

- (void)createMenuActionControllerForManagerIfNeeded:(id)a3 withPresentingViewController:(id)a4 regionOfInterestProvider:(id)a5
{
  id v8;
  id v9;
  PUMenuActionController *menuActionController;
  PUMenuActionController *v11;
  PUMenuActionController *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  menuActionController = self->_menuActionController;
  if (!menuActionController)
  {
    v11 = objc_alloc_init(PUMenuActionController);
    v12 = self->_menuActionController;
    self->_menuActionController = v11;

    -[PUMenuActionController setDelegate:](self->_menuActionController, "setDelegate:", self);
    menuActionController = self->_menuActionController;
  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUMenuActionController setBrowsingSession:](menuActionController, "setBrowsingSession:", v13);

  -[PUMenuActionController setPresentingViewController:](self->_menuActionController, "setPresentingViewController:", v8);
  -[PUMenuActionController setRegionOfInterestProvider:](self->_menuActionController, "setRegionOfInterestProvider:", v9);
  -[PUMenuActionController setPhotosUICoreActionManager:](self->_menuActionController, "setPhotosUICoreActionManager:", v15);
  -[PUMenuActionController actions](self->_menuActionController, "actions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController px_setPreviewActionMenus:](self, "px_setPreviewActionMenus:", v14);

}

- (BOOL)menuActionControllerPreventRevealInMomentAction:(id)a3
{
  return (LOBYTE(self->__options) >> 4) & 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  void *v17;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  objc_super v31;

  v6 = a4;
  if (sel__arrowKey_ == a3)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetViewModelForCurrentAssetReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isInEditMode");

    if ((v10 & 1) != 0)
      goto LABEL_34;
    goto LABEL_32;
  }
  if (sel_toggleInspector_ == a3)
  {
    if (!-[PUOneUpViewController _isAccessoryAvailableForCurrentAsset](self, "_isAccessoryAvailableForCurrentAsset"))
      goto LABEL_34;
    goto LABEL_32;
  }
  if (sel_togglePlayback_ == a3)
  {
    -[PUOneUpViewController _barsController](self, "_barsController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "allowShowingPlayPauseButton");
    goto LABEL_31;
  }
  if (sel_toggleEditor_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 15;
LABEL_30:
    v12 = objc_msgSend(v13, "canPerformSimpleActionWithActionType:", v14);
LABEL_31:
    v15 = v12;

    if ((v15 & 1) != 0)
      goto LABEL_32;
LABEL_34:
    v16 = 0;
    goto LABEL_35;
  }
  if (sel_toggleViewer_ == a3)
  {
    -[PUOneUpViewController presentedViewController](self, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (sel_rotateAssetsCounterclockwise_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "canPerformSimpleActionWithActionType:", 13);

    if ((v20 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 25;
    goto LABEL_30;
  }
  if (sel_rotateAssetsClockwise_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 26;
    goto LABEL_30;
  }
  if (sel_shareAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 31;
    goto LABEL_30;
  }
  if (sel_trashAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "canPerformSimpleActionWithActionType:", 1);

    if ((v22 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "canPerformSimpleActionWithActionType:", 10);

    if ((v24 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "canPerformSimpleActionWithActionType:", 8);

    if ((v26 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 54;
    goto LABEL_30;
  }
  if (sel_trashAssetsWithoutConfirmation_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "canPerformSimpleActionWithActionType:", 9);

    if ((v28 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "canPerformSimpleActionWithActionType:", 10);

    if ((v30 & 1) != 0)
      goto LABEL_32;
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 55;
    goto LABEL_30;
  }
  if (sel_hideAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 36;
    goto LABEL_30;
  }
  if (sel_favoriteAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 40;
    goto LABEL_30;
  }
  if (sel_duplicateAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 37;
    goto LABEL_30;
  }
  if (sel_addAssetsToAlbum_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 59;
    goto LABEL_30;
  }
  if (sel_addAssetsToLastUsedAlbum_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 60;
    goto LABEL_30;
  }
  if (sel_printAssets_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 30;
    goto LABEL_30;
  }
  if (sel_copy_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 29;
    goto LABEL_30;
  }
  if (sel_copyAdjustments_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 18;
    goto LABEL_30;
  }
  if (sel_copyAdjustmentsSkippingOptions_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 19;
    goto LABEL_30;
  }
  if (sel_pasteAdjustments_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 20;
    goto LABEL_30;
  }
  if (sel_revertAdjustments_ == a3)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
    v14 = 21;
    goto LABEL_30;
  }
  v31.receiver = self;
  v31.super_class = (Class)PUOneUpViewController;
  if (!-[PUOneUpViewController canPerformAction:withSender:](&v31, sel_canPerformAction_withSender_, a3, v6))
    goto LABEL_34;
LABEL_32:
  v16 = -[PUOneUpViewController appearState](self, "appearState") == 2;
LABEL_35:

  return v16;
}

- (void)validateCommand:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  if ((char *)objc_msgSend(v17, "action") == sel_toggleViewer_)
  {
    objc_msgSend(v17, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = CFSTR("MENU_ITEM_TITLE_CLOSE_VIEWER");
LABEL_12:
      PULocalizedString(v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v9 = (void *)v8;
      objc_msgSend(v17, "setDiscoverabilityTitle:", v8);
LABEL_26:

      goto LABEL_27;
    }
  }
  if ((char *)objc_msgSend(v17, "action") == sel_toggleInspector_)
  {
    -[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible");
    goto LABEL_14;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_togglePlayback_)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "videoPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isPlaybackDesired");
LABEL_24:
    PXLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDiscoverabilityTitle:", v14);

LABEL_25:
    goto LABEL_26;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_hideAssets_)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isHidden");
    goto LABEL_24;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_addAssetsToLastUsedAlbum_)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v13, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7B178], "commandTitleWithPhotoLibrary:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDiscoverabilityTitle:", v10);
    goto LABEL_25;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_favoriteAssets_)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "isFavorite");
    goto LABEL_24;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_rotateAssetsCounterclockwise_)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "canPerformSimpleActionWithActionType:", 13);

    if (!v16)
    {
      v7 = CFSTR("MENU_ITEM_TITLE_ROTATE_COUNTERCLOCKWISE");
      goto LABEL_12;
    }
LABEL_14:
    PXLocalizedString();
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if ((char *)objc_msgSend(v17, "action") == sel_trashAssetsWithoutConfirmation_)
  {
    -[PUOneUpViewController actionsController](self, "actionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "canPerformSimpleActionWithActionType:", 8);

    goto LABEL_14;
  }
LABEL_27:

}

- (void)togglePlayback:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "togglePlayback");

}

- (void)toggleViewer:(id)a3
{
  -[PUOneUpViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)toggleEditor:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 15);

}

- (void)rotateAssetsCounterclockwise:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id v8;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformSimpleActionWithActionType:", 13);

  -[PUOneUpViewController actionsController](self, "actionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v5)
    v7 = 13;
  else
    v7 = 25;
  objc_msgSend(v6, "performSimpleActionWithActionType:", v7);

}

- (void)rotateAssetsClockwise:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 26);

}

- (void)autoEnhanceAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 17);

}

- (void)copyAdjustments:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 18);

}

- (void)copyAdjustmentsSkippingOptions:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 19);

}

- (void)pasteAdjustments:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 20);

}

- (void)revertAdjustments:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 21);

}

- (void)shareAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 31);

}

- (void)trashAssets:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  id v10;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformSimpleActionWithActionType:", 1);

  -[PUOneUpViewController actionsController](self, "actionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6;
  if (v5)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v6, "canPerformSimpleActionWithActionType:", 8);

    -[PUOneUpViewController actionsController](self, "actionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;
    if (v8)
    {
      v7 = 8;
    }
    else
    {
      v9 = objc_msgSend(v6, "canPerformSimpleActionWithActionType:", 54);

      -[PUOneUpViewController actionsController](self, "actionsController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      if (v9)
        v7 = 54;
      else
        v7 = 10;
    }
  }
  objc_msgSend(v6, "performSimpleActionWithActionType:", v7);

}

- (void)trashAssetsWithoutConfirmation:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canPerformSimpleActionWithActionType:", 9);

  -[PUOneUpViewController actionsController](self, "actionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if (v5)
  {
    v7 = 9;
  }
  else
  {
    v8 = objc_msgSend(v6, "canPerformSimpleActionWithActionType:", 55);

    -[PUOneUpViewController actionsController](self, "actionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v6;
    if (v8)
      v7 = 55;
    else
      v7 = 10;
  }
  objc_msgSend(v6, "performSimpleActionWithActionType:", v7);

}

- (void)restoreAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 13);

}

- (void)restoreAssetsWithoutConfirmation:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 14);

}

- (void)deleteAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 10);

}

- (void)hideAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 36);

}

- (void)favoriteAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performToggleFavoriteAction");

}

- (void)duplicateAssets:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (objc_msgSend(v6, "assetCollection"), (v7 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v8 = (void *)v7,
        objc_msgSend(v6, "asset"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v6, "assetCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v10;
    objc_msgSend(v6, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v13 = objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController actionsController](self, "actionsController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performDuplicateActionWithAssetsByAssetCollection:", v13);

  }
  else
  {
    PLOneUpGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_FAULT, "Attempted to duplicate assets but there is no current asset reference", v15, 2u);
    }
  }

}

- (void)addAssetsToAlbum:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 59);

}

- (void)addAssetsToLastUsedAlbum:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 60);

}

- (void)printAssets:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 30);

}

- (void)copy:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 29);

}

- (BOOL)_canAdvertiseKeyCommands
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresentingOverOneUp");

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetViewModelForCurrentAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInEditMode");

  return (v5 | v9) ^ 1;
}

- (id)keyCommands
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  const __CFString *v25;
  char **v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!-[PUOneUpViewController _canAdvertiseKeyCommands](self, "_canAdvertiseKeyCommands"))
    return 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E28], 0, sel__arrowKey_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E10], 0, sel__arrowKey_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "setWantsPriorityOverSystemBehavior:", 1, (_QWORD)v29);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4E30], 0x100000, sel_toggleViewer_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("["), 0x100000, sel_toggleViewer_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_toggleViewer_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13);

  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v17 = v16;
  else
    v17 = 0;

  v19 = objc_msgSend(v17, "isSpatialMedia");
  if ((v19 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("a"), 0, sel__editAdjust_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v20);

    v21 = v16;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      v22 = v21;
    else
      v22 = 0;

    objc_msgSend(v22, "fetchSmartStyleExtendedProperties");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_msgSend(v23, "originallySmartStyleable");
    if (v24)
      v25 = CFSTR("s");
    else
      v25 = CFSTR("f");
    v26 = &selRef__editStyles_;
    if (!v24)
      v26 = &selRef__editFilter_;
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", v25, 0, *v26, (_QWORD)v29);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("c"), 0, sel__editCrop_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v28);

  }
  return v6;
}

- (void)_arrowKey:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a3;
  -[PUOneUpViewController viewIfLoaded](self, "viewIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
    objc_msgSend(v12, "input");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DC4E28]);

    if (v8)
    {
      -[PUOneUpViewController actionsController](self, "actionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == 1)
      {
LABEL_4:
        objc_msgSend(v9, "jumpToPreviousAsset");
LABEL_8:

        goto LABEL_9;
      }
LABEL_7:
      objc_msgSend(v9, "jumpToNextAsset");
      goto LABEL_8;
    }
    objc_msgSend(v12, "input");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0DC4E10]);

    if (v11)
    {
      -[PUOneUpViewController actionsController](self, "actionsController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 != 1)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
LABEL_9:

}

- (void)_editAdjust:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 16);

}

- (void)_editFilter:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 22);

}

- (void)_editStyles:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 23);

}

- (void)_editCrop:(id)a3
{
  id v3;

  -[PUOneUpViewController actionsController](self, "actionsController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSimpleActionWithActionType:", 24);

}

- (id)tilingViewControllerTransition:(id)a3 tilingViewToTransferToEndPoint:(id)a4
{
  id v6;
  void *v7;
  void *v9;

  v6 = a4;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 3464, CFSTR("no tiling view to transfer to %@"), v6);

  }
  return v7;
}

- (void)tilingViewControllerTransition:(id)a3 abandonTilingView:(id)a4 toEndPoint:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v8 = a4;
  v9 = a5;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 != v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 3469, CFSTR("tiling view %@ to abandon to %@ isn't the current tiling view %@"), v8, v9, v12);

  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__PUOneUpViewController_tilingViewControllerTransition_abandonTilingView_toEndPoint___block_invoke;
  v13[3] = &unk_1E58A2FF0;
  v13[4] = self;
  objc_msgSend(v8, "enumerateAllTileControllersUsingBlock:", v13);
  -[PUOneUpViewController _setTilingView:](self, "_setTilingView:", 0);

}

- (void)tilingViewControllerTransition:(id)a3 adoptTilingView:(id)a4 fromEndPoint:(id)a5 isCancelingTransition:(BOOL)a6 animationSetupCompletionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  PUTilingView *tilingView;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  PUTilingLayoutTransitionContext *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[5];

  v8 = a6;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 3479, CFSTR("adopting tiling %@ from %@ will override current tiling view %@"), v12, v13, v31);

  }
  -[PUOneUpViewController _setTilingView:](self, "_setTilingView:", v12);
  tilingView = self->__tilingView;
  v17 = MEMORY[0x1E0C809B0];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke;
  v37[3] = &unk_1E58A2FF0;
  v37[4] = self;
  -[PUTilingView enumerateAllTileControllersUsingBlock:](tilingView, "enumerateAllTileControllersUsingBlock:", v37);
  objc_msgSend(v12, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v14;
  v33 = v13;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "assetsDataSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "assetReference");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "assetReferenceForAssetReference:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "viewModel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = v17;
    v34[1] = 3221225472;
    v34[2] = __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke_2;
    v34[3] = &unk_1E58ABCA8;
    v35 = v26;
    v36 = v24;
    v27 = v26;
    objc_msgSend(v27, "performChanges:", v34);

  }
  v28 = -[PUOneUpViewController _newOneUpLayout](self, "_newOneUpLayout");
  v29 = objc_alloc_init(PUTilingLayoutTransitionContext);
  -[PUTilingLayoutTransitionContext setIsViewControllerTransition:](v29, "setIsViewControllerTransition:", 1);
  -[PUTilingLayoutTransitionContext setCancelingTransition:](v29, "setCancelingTransition:", v8);
  objc_msgSend(v12, "transitionToLayout:withContext:animationSetupCompletionHandler:", v28, v29, v32);

  objc_msgSend(v12, "layoutIfNeeded");
}

- (double)tilingViewControllerTransitionProgressAtWhichChromeIsFullyFadedOut:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled", a3);
  result = 1.0;
  if (v3)
    return 0.25;
  return result;
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  void *v18;
  id v19;
  void *v20;
  PUTilingLayoutTransitionContext *v21;
  void *v22;
  void *v23;
  char v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  char v30;
  char v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void (**v48)(void);
  void *v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id location;
  _QWORD aBlock[4];
  id v55;
  PUOneUpViewController *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  PUOneUpViewController *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t *v66;
  char v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  char v83;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "currentAssetDidChange"))
  {
    -[PUOneUpViewController _invalidateAssetActionManager](self, "_invalidateAssetActionManager");
    -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
    -[PUOneUpViewController _invalidateChromeViewController](self, "_invalidateChromeViewController");
  }
  if (objc_msgSend(v7, "isPresentedForPreviewDidChange"))
    -[PUOneUpViewController _isPresentedForPreviewDidChange](self, "_isPresentedForPreviewDidChange");
  if (objc_msgSend(v7, "imageAnalysisInteractionDidChange"))
  {
    -[PUOneUpViewController _invalidateImageAnalysisActionInfoBottomPosition](self, "_invalidateImageAnalysisActionInfoBottomPosition");
    -[PUOneUpViewController _updateImageAnalysisInteractionDelegate](self, "_updateImageAnalysisInteractionDelegate");
  }
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "layout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_opt_class();
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
    }
    v12 = v11;

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetsDataSource");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "currentAssetReference");
    v15 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v15;
    if ((objc_msgSend(v7, "assetsDataSourceDidChange") & 1) != 0
      || (objc_msgSend(v12, "dataSource"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "isEqual:", v49),
          v16,
          (v17 & 1) == 0))
    {
      v19 = -[PUOneUpViewController _newOneUpLayout](self, "_newOneUpLayout");

      objc_msgSend(v6, "assetViewModelForAssetReference:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v20, "isUpdatingDisplayedContent"))
      {
        v21 = objc_alloc_init(PUTilingLayoutTransitionContext);
        -[PUTilingLayoutTransitionContext setIsUpdatingDisplayedContent:](v21, "setIsUpdatingDisplayedContent:", 1);
        objc_msgSend(v20, "displayedContentUpdateGroup");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUTilingLayoutTransitionContext setDisplayedContentUpdateGroup:](v21, "setDisplayedContentUpdateGroup:", v22);

      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v9, "transitionToLayout:withContext:animationSetupCompletionHandler:", v19, v21, 0);
      v18 = v9;
      objc_msgSend(v9, "layoutIfNeeded");
      -[PUOneUpViewController _preheatAdjacentAssetsForPhotosDetailsContext](self, "_preheatAdjacentAssetsForPhotosDetailsContext");

    }
    else
    {
      v18 = v9;
      v19 = v12;
    }
    objc_msgSend(v7, "assetViewModelChangesByAssetReference");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = 0;
    v81 = &v80;
    v82 = 0x2020000000;
    v83 = 0;
    v76 = 0;
    v77 = &v76;
    v78 = 0x2020000000;
    v79 = 0;
    v72 = 0;
    v73 = &v72;
    v74 = 0x2020000000;
    v75 = 0;
    v68 = 0;
    v69 = &v68;
    v70 = 0x2020000000;
    v71 = 0;
    v24 = objc_msgSend(v6, "accessoryViewsDefaultVisibility");
    v25 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke;
    v57[3] = &unk_1E58A3018;
    v26 = v6;
    v58 = v26;
    v67 = v24;
    v46 = v19;
    v59 = v46;
    v63 = &v68;
    v27 = v18;
    v60 = v27;
    v45 = v47;
    v61 = v45;
    v62 = self;
    v64 = &v76;
    v65 = &v72;
    v66 = &v80;
    objc_msgSend(v23, "enumerateKeysAndObjectsUsingBlock:", v57);
    v44 = v23;
    aBlock[0] = v25;
    aBlock[1] = 3221225472;
    aBlock[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_3;
    aBlock[3] = &unk_1E58ABCA8;
    v28 = v26;
    v55 = v28;
    v56 = self;
    v48 = (void (**)(void))_Block_copy(aBlock);
    if (*((_BYTE *)v77 + 24))
    {
      v29 = v46;
      v9 = v18;
      -[PUOneUpViewController setWasChromeVisibleBeforeZoomIn:](self, "setWasChromeVisibleBeforeZoomIn:", objc_msgSend(v28, "isChromeVisible"));
LABEL_21:
      v48[2]();
      goto LABEL_24;
    }
    v9 = v18;
    v29 = v46;
    if (*((_BYTE *)v73 + 24))
    {
      -[PUOneUpViewController _handleZoomOutCurrentAsset](self, "_handleZoomOutCurrentAsset");
    }
    else if (*((_BYTE *)v81 + 24))
    {
      goto LABEL_21;
    }
LABEL_24:
    if (*((_BYTE *)v69 + 24))
      -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
    if (-[PUOneUpViewController _isDrivingScrubbing](self, "_isDrivingScrubbing"))
      goto LABEL_39;
    if ((objc_msgSend(v7, "currentAssetDidChange") & 1) != 0)
    {
      if (!v29)
      {
LABEL_39:
        if (objc_msgSend(v7, "chromeVisibilityDidChange"))
        {
          -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
          -[PUOneUpViewController _updatePrefersHomeIndicatorHidden](self, "_updatePrefersHomeIndicatorHidden");
          -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
          -[PUOneUpViewController _updateGestureController](self, "_updateGestureController");
        }
        if (objc_msgSend(v7, "isInteractingWithVideoScrubberDidChange"))
          -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
        if (objc_msgSend(v7, "secondScreenSizeDidChange")
          && !-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
        {
          -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
        }
        if (objc_msgSend(v7, "currentAssetDidChange"))
        {
          -[PUOneUpViewController _invalidateEditMode](self, "_invalidateEditMode");
          -[PUOneUpViewController _invalidatePreferredContentSize](self, "_invalidatePreferredContentSize");
          -[PUOneUpViewController _invalidateVideoPlayer](self, "_invalidateVideoPlayer");
          -[PUOneUpViewController _invalidateUserActivity](self, "_invalidateUserActivity");
          -[PUOneUpViewController _invalidateCachedBoopableItemProvider](self, "_invalidateCachedBoopableItemProvider");
          if (-[PUOneUpViewController isFloatingInfoPanelPresented](self, "isFloatingInfoPanelPresented"))
          {
            if (objc_msgSend(v7, "currentAssetTransitionProgressDidChange"))
            {
              -[PUOneUpViewController _dimFloatingInfoPanelAnimated:](self, "_dimFloatingInfoPanelAnimated:", 1);
              objc_initWeak(&location, self);
              objc_msgSend(MEMORY[0x1E0D7CD68], "sharedScheduler");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_5;
              v51[3] = &unk_1E58AB2F8;
              objc_copyWeak(&v52, &location);
              objc_msgSend(v42, "dispatchOnMainThreadWhenNotScrolling:", v51);

              objc_destroyWeak(&v52);
              objc_destroyWeak(&location);
            }
            else if (!-[PUOneUpViewController _isDrivingScrubbing](self, "_isDrivingScrubbing"))
            {
              -[PUOneUpViewController _updateFloatingInfoPanelIfNeeded](self, "_updateFloatingInfoPanelIfNeeded");
            }
          }
          -[PUOneUpViewController _setDidPlayCurrentLivePhoto:](self, "_setDidPlayCurrentLivePhoto:", 0);
          if (objc_msgSend(v28, "browsingSpeedRegime") <= 0)
            -[PUOneUpViewController _preheatAdjacentAssetsForPhotosDetailsContext](self, "_preheatAdjacentAssetsForPhotosDetailsContext");
        }
        if (objc_msgSend(v7, "presentingOverOneUpDidChange"))
          -[PUOneUpViewController _invalidateVideoPlayer](self, "_invalidateVideoPlayer");
        if (objc_msgSend(v7, "browsingSpeedRegimeDidChange"))
          -[PUOneUpViewController _invalidatePreloadInsets](self, "_invalidatePreloadInsets");
        if ((objc_msgSend(v7, "currentAssetDidChange") & 1) != 0
          || objc_msgSend(v7, "currentAssetTransitionProgressDidChange"))
        {
          -[PUOneUpViewController px_setNeedsHDRFocusUpdate](self, "px_setNeedsHDRFocusUpdate");
        }
        if (objc_msgSend(v7, "reviewScreenBarsModelDidChange"))
          -[PUOneUpViewController _updateReviewScreenBars](self, "_updateReviewScreenBars");
        if ((objc_msgSend(v7, "videoOverlayPlayStateDidChange") & 1) != 0
          || objc_msgSend(v7, "isScrubbingActivationDidChange"))
        {
          -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");
        }
        if (objc_msgSend(v7, "isScrubbingDidChange"))
        {
          -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v43, "isAccessoryViewVisible")
            && -[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel"))
          {
            if (objc_msgSend(v28, "isScrubbing"))
            {
              -[PUOneUpViewController _dismissFloatingInfoPanelAnimated:](self, "_dismissFloatingInfoPanelAnimated:", 1);
            }
            else
            {
              -[PUOneUpViewController _presentFloatingInfoPanelAnimated:](self, "_presentFloatingInfoPanelAnimated:", 1);
              -[PUOneUpViewController _invalidateInfoPanelLayoutAnimated:](self, "_invalidateInfoPanelLayoutAnimated:", 1);
            }
          }
          if (-[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible"))
            -[PUOneUpViewController _setHasShownRelevantTip:](self, "_setHasShownRelevantTip:", 1);
          -[PUOneUpViewController _invalidateUserActivity](self, "_invalidateUserActivity");
          -[PUOneUpViewController _invalidateCachedBoopableItemProvider](self, "_invalidateCachedBoopableItemProvider");
          -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");

        }
        if (objc_msgSend(v7, "contentPrivacyStateDidChange"))
        {
          -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec");
          -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
          if (objc_msgSend(v28, "contentPrivacyState") == 1)
            -[PUOneUpViewController _dismissFloatingInfoPanelAnimated:](self, "_dismissFloatingInfoPanelAnimated:", 0);
        }
        if ((objc_msgSend(v7, "systemAuthenticationTypeDidChange") & 1) != 0
          || objc_msgSend(v7, "wantsContentUnavailableUnlockButtonVisibleDidChange"))
        {
          -[PUOneUpViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
        }
        if (objc_msgSend(v7, "isInSelectionModeDidChange"))
          -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout");

        _Block_object_dispose(&v68, 8);
        _Block_object_dispose(&v72, 8);
        _Block_object_dispose(&v76, 8);
        _Block_object_dispose(&v80, 8);

        goto LABEL_86;
      }
    }
    else
    {
      v30 = objc_msgSend(v7, "currentAssetTransitionProgressDidChange");
      if (v29)
        v31 = v30;
      else
        v31 = 0;
      if ((v31 & 1) == 0)
        goto LABEL_39;
    }
    v50 = v28;
    objc_msgSend(v28, "currentAssetReference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "indexPathForAssetReference:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v50, "currentAssetTransitionProgress");
      objc_msgSend(v29, "visibleRectForItemAtIndexPath:transitionProgress:", v33);
      v35 = v34;
      v37 = v36;
      objc_msgSend(v29, "coordinateSystem");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "contentCoordinateSystem");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (PUCanConvertFromCoordinateSystemToCoordinateSystem(v38, v39))
      {
        v40 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v38, v39, v35, v37);
        objc_msgSend(v27, "setContentOffset:animated:", objc_msgSend(v50, "assetChangesShouldAnimate"), v40, v41);
        objc_msgSend(v27, "px_cancelScrollGesture");
      }

      v29 = v46;
    }

    v28 = v50;
    goto LABEL_39;
  }
LABEL_86:
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)_preheatAdjacentAssetsForPhotosDetailsContext
{
  NSObject *preheatAssetsQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  preheatAssetsQueue = self->_preheatAssetsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke;
  v4[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v5, &location);
  dispatch_async(preheatAssetsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)_assetsToPrefetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForAssetReference:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v7)
  {
    -[PUOneUpViewController _assetsToPrefetchUsingDataSource:startingAt:count:reverseDirection:](self, "_assetsToPrefetchUsingDataSource:startingAt:count:reverseDirection:", v5, v7, 3, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _assetsToPrefetchUsingDataSource:startingAt:count:reverseDirection:](self, "_assetsToPrefetchUsingDataSource:startingAt:count:reverseDirection:", v5, v7, 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v9);
    objc_msgSend(v8, "addObjectsFromArray:", v10);

  }
  return v8;
}

- (id)_assetsToPrefetchUsingDataSource:(id)a3 startingAt:(id)a4 count:(int64_t)a5 reverseDirection:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  _QWORD *v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[3];
  int v26;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__53200;
  v23 = __Block_byref_object_dispose__53201;
  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a5);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__PUOneUpViewController__assetsToPrefetchUsingDataSource_startingAt_count_reverseDirection___block_invoke;
  v14[3] = &unk_1E58A3068;
  v11 = v9;
  v15 = v11;
  v16 = &v19;
  v17 = v25;
  v18 = a5;
  objc_msgSend(v11, "enumerateIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v10, v6, v14);
  v12 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(v25, 8);

  return v12;
}

- (void)_handleDeferredProcessingFinishedForAssetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUOneUpViewController ppt_deferredProcessingCompletionBlock](self, "ppt_deferredProcessingCompletionBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUOneUpViewController ppt_assetUUIDNeedsDeferredProcessingFinishNotification](self, "ppt_assetUUIDNeedsDeferredProcessingFinishNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if (v7)
    {
      -[PUOneUpViewController setPpt_deferredProcessingCompletionBlock:](self, "setPpt_deferredProcessingCompletionBlock:", 0);
      -[PUOneUpViewController ppt_deferredProcessingWaitTimer](self, "ppt_deferredProcessingWaitTimer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "invalidate");

      -[PUOneUpViewController setPpt_deferredProcessingWaitTimer:](self, "setPpt_deferredProcessingWaitTimer:", 0);
      -[PUOneUpViewController setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:](self, "setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:", 0);
      PLOneUpGetLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v4;
        _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEBUG, "Deferred Processing: Notify DP is done and final image is loaded/displayed (asset: %@).", buf, 0xCu);
      }

      v10 = v5;
      px_dispatch_on_main_queue();

    }
  }

}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[PUOneUpViewController _invalidateInfoPanelLayoutAnimated:](self, "_invalidateInfoPanelLayoutAnimated:", 1);
}

- (NSString)authenticationTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pxAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_isHiddenSmartAlbum");
  objc_msgSend(v6, "px_isRecentlyDeletedSmartAlbum");
  objc_msgSend(v6, "px_isRecoveredSmartAlbum");
  PXLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)passcodeAuthenticationReason
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pxAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_isHiddenSmartAlbum");
  objc_msgSend(v6, "px_isRecentlyDeletedSmartAlbum");
  objc_msgSend(v6, "px_isRecoveredSmartAlbum");
  PXLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)_allowsShowingVisualIntelligenceForAsset:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  unsigned int v10;
  BOOL v11;

  v4 = a3;
  v5 = -[PUOneUpViewController presentationOrigin](self, "presentationOrigin");
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowsVisualIntelligenceInVideoFrame");

  v8 = objc_msgSend(MEMORY[0x1E0D7BC00], "canRequestVKImageAnalysisForAsset:", v4);
  if ((v8 & 1) == 0 && v7)
    v8 = objc_msgSend(v4, "mediaType") == 2;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "allowVisualIntelligence"))
  {
    v10 = v8 & ~-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen");
    if (v5 == 17)
      v11 = 0;
    else
      v11 = v10;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_allowsVisualLookupInInfoPanelMode
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  BOOL v10;
  BOOL v11;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVisualIntelligenceVisualLookupInfoPanelMode");

  if (!v4)
    return 0;
  -[PUOneUpViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  if (v6)
    v10 = v9 == 1;
  else
    v10 = 1;
  v11 = v10;

  return v11;
}

- (id)tilingView:(id)a3 tileControllerWithIndexPath:(id)a4 kind:(id)a5 dataSource:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  PUOneUpViewController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  objc_class *v97;
  void *v98;
  objc_class *v99;
  void *v100;
  PUOneUpViewController *v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v113;
  _QWORD v114[4];
  id v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  id v121;
  void *v122;
  _QWORD v123[4];
  id v124;
  id v125;
  id v126;
  void *v127;
  _QWORD v128[4];
  id v129;
  id location[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "assetsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqual:", v16) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4034, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dataSource isEqual:assetsDataSource]"));

  }
  v113 = v11;
  if (!objc_msgSend(v12, "isEqualToString:", CFSTR("PUTileKindItemContent")))
  {
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindUserTransform))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUUserTransformTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v27);
      v28 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAssetViewModel:", v29);
      objc_msgSend(v26, "setBrowsingViewModel:", v15);
LABEL_12:

      v16 = v28;
LABEL_13:

      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindPlayButton))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v27);
      v28 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUPlayButtonViewReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setBrowsingViewModel:", v15);
      v30 = v26;
LABEL_11:
      objc_msgSend(v30, "setAssetViewModel:", v29);
      goto LABEL_12;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindBackground))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUBackgroundTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setViewModel:", v15);
      -[PUOneUpViewController _setBackgroundTileViewController:](self, "_setBackgroundTileViewController:", v26);
      -[PUOneUpViewController _updateBackgroundTileViewController](self, "_updateBackgroundTileViewController");
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindBadge))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v27);
      v28 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUBadgeTileReuseIdentifier"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v30;
      goto LABEL_11;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindAssetExplorerReviewScreenBadge))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v33 = v16;
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "actionManager");
      v109 = v10;
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v109, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUAssetExplorerReviewScreenBadgeTileReuseIdentifier"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v123[0] = MEMORY[0x1E0C809B0];
      v123[1] = 3221225472;
      v123[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_2;
      v123[3] = &unk_1E58A9AE0;
      v37 = v36;
      v124 = v37;
      v125 = v15;
      v126 = v32;
      v127 = v35;
      v38 = v35;
      v27 = v32;
      objc_msgSend(v37, "performChanges:", v123);
      v39 = v15;
      v40 = v127;
      v41 = v37;

      v15 = v39;
      v26 = v41;
      v16 = v33;

      v42 = v124;
LABEL_24:

      v10 = v109;
      goto LABEL_13;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindSelectionIndicator))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v44 = v16;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "actionManager");
      v109 = v10;
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v109, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUSelectionIndicatorTileReuseIdentifier"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v118[0] = MEMORY[0x1E0C809B0];
      v118[1] = 3221225472;
      v118[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_3;
      v118[3] = &unk_1E58A9AE0;
      v48 = v47;
      v119 = v48;
      v120 = v15;
      v121 = v43;
      v122 = v46;
      v38 = v46;
      v27 = v43;
      objc_msgSend(v48, "performChanges:", v118);
      v49 = v15;
      v50 = v122;
      v51 = v48;

      v15 = v49;
      v26 = v51;
      v16 = v44;

      v42 = v119;
      goto LABEL_24;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindAssetExplorerReviewScreenProgressIndicator))
    {
      objc_msgSend(v16, "assetAtIndexPath:", v11);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetSharedViewModelForAsset:", v110);
      v52 = v16;
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "assetReferenceAtIndexPath:", v11);
      v54 = v10;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v55);
      v102 = v13;
      v56 = v15;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "videoPlayer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUAssetExplorerReviewScreenProgressIndicatorTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAssetSharedViewModel:", v53);
      objc_msgSend(v26, "setVideoPlayer:", v58);

      v15 = v56;
      v13 = v102;

      v10 = v54;
      v16 = v52;

      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindReviewScreenTopBar))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUReviewScreenTopBarTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _setReviewScreenTopBarTileViewController:](self, "_setReviewScreenTopBarTileViewController:", v26);
LABEL_33:
      objc_msgSend(v26, "setBrowsingViewModel:", v15);
      -[PUOneUpViewController _updateReviewScreenBars](self, "_updateReviewScreenBars");
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindReviewScreenControlBar))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUReviewScreenControlBarTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _setReviewScreenControlBarTileViewController:](self, "_setReviewScreenControlBarTileViewController:", v26);
      goto LABEL_33;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindReviewScreenScrubberBar))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUReviewScreenScrubberBarTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController _setReviewScreenScrubberBarTileViewController:](self, "_setReviewScreenScrubberBarTileViewController:", v26);
      goto LABEL_33;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindProgressIndicator))
    {
      objc_msgSend(v16, "assetAtIndexPath:", v11);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetSharedViewModelForAsset:");
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v11;
      v62 = (void *)v60;
      v107 = v16;
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v61);
      v63 = v15;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "assetViewModelForAssetReference:", v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUProgressIndicatorTileReuseIdentifier"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setAssetViewModel:", v65);
      v111 = v63;
      objc_msgSend(v66, "setBrowsingViewModel:", v63);
      objc_msgSend(v66, "setAssetSharedViewModel:", v62);
      objc_initWeak(location, self);
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_4;
      v116[3] = &unk_1E58A3090;
      objc_copyWeak(&v117, location);
      v26 = v66;
      objc_msgSend(v66, "setErrorPresenter:", v116);
      objc_destroyWeak(&v117);
      objc_destroyWeak(location);

LABEL_36:
      v16 = v107;
      v15 = v111;
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindPeople))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUPeopleTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "assetAtIndexPath:", v11);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDisplayAsset:", v27);
      objc_msgSend(v26, "setPeopleDelegate:", self);
      goto LABEL_13;
    }
    v105 = v12;
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindRenderIndicator))
    {
      objc_msgSend(v16, "assetAtIndexPath:", v11);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetSharedViewModelForAsset:", v67);
      v68 = v16;
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PURenderIndicatorTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAssetSharedViewModel:", v69);
      -[PUOneUpViewController undoManager](self, "undoManager");
      v70 = v10;
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUndoManager:", v71);

      v10 = v70;
      v16 = v68;

      v12 = v105;
      goto LABEL_14;
    }
    v107 = v16;
    v111 = v15;
    v101 = self;
    v103 = v13;
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindImportStatusIndicator))
    {
      v72 = v16;
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUImportStatusIndicatorTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAssetViewModel:", v74);
LABEL_43:

      v16 = v72;
      v13 = v103;
      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindBufferingIndicator))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUBufferingIndicatorTileReuseIdentifier"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setAssetViewModel:", v76);
      -[PUOneUpViewController browsingSession](v101, "browsingSession");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "mergedVideoProvider");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setMergedVideoProvider:", v79);

      objc_msgSend(v77, "setBrowsingViewModel:", v111);
      objc_initWeak(location, v101);
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_5;
      v114[3] = &unk_1E58A30B8;
      objc_copyWeak(&v115, location);
      v26 = v77;
      objc_msgSend(v77, "setErrorAlertControllerDisplayer:", v114);
      objc_destroyWeak(&v115);
      objc_destroyWeak(location);

LABEL_46:
      v13 = v103;
      self = v101;
      goto LABEL_36;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindLoadingIndicator))
    {
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = v10;
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PULoadingIndicatorTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController loadingIndicatorController](self, "loadingIndicatorController");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setStyle:", objc_msgSend(v83, "loadingIndicatorStyleForAssetViewModel:", v81));

      v10 = v82;
      v15 = v111;

      v16 = v107;
LABEL_49:

      goto LABEL_14;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindAccessory))
    {
      v72 = v16;
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUAccessoryTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setAssetViewModel:", v74);
      objc_msgSend(v26, "setAssetReference:", v73);
      goto LABEL_43;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindVideoPlaceholder))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUVideoPlaceholderTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    if (objc_msgSend(v12, "isEqualToString:", PUTileKindLivePhotoVideoPlaybackOverlay))
    {
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PULivePhotoVideoPlaybackTileReuseIdentifier"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setBrowsingViewModel:", v15);
      -[PUOneUpViewController browsingSession](v101, "browsingSession");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "mergedVideoProvider");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setMergedVideoProvider:", v86);

      objc_msgSend(v84, "setIsPresentedForSecondScreen:", -[PUOneUpViewController _isPresentedForSecondScreen](v101, "_isPresentedForSecondScreen"));
      v26 = v84;
      objc_msgSend(v84, "setDelegate:", v101);
      -[PUOneUpViewController _tilingView](v101, "_tilingView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "window");
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v88)
      {
        objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "windows");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "firstObject");
        v88 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v88, "px_imageModulationManager");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setImageModulationManager:", v91);

      goto LABEL_46;
    }
    if (!objc_msgSend(v12, "isEqualToString:", PUTileKindSyndicationAttribution))
    {
      if ((objc_msgSend(v12, "isEqualToString:", PUTileKindCropButton) & 1) == 0)
      {
        -[PUOneUpViewController _configureAdoptedTileController:](self, "_configureAdoptedTileController:", 0);
        goto LABEL_65;
      }
      objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "assetViewModelForAssetReference:", v80);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUCropButtonTileReuseIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDelegate:", self);
      objc_msgSend(v26, "setAssetViewModel:", v94);
      objc_msgSend(v26, "setBrowsingViewModel:", v15);

      v16 = v107;
      goto LABEL_49;
    }
    objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "assetViewModelForAssetReference:", v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dequeueTileControllerWithReuseIdentifier:", CFSTR("PUSyndicationAttributionTileReuseIdentifier"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_61:
        objc_msgSend(v26, "setAssetViewModel:", v93);
        objc_msgSend(v26, "setDelegate:", self);

        v13 = v103;
        goto LABEL_36;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = (objc_class *)objc_opt_class();
      NSStringFromClass(v99);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "px_descriptionForAssertionMessage");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4236, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[tilingView dequeueTileControllerWithReuseIdentifier:PUSyndicationAttributionTileReuseIdentifier]"), v98, v100);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (objc_class *)objc_opt_class();
      NSStringFromClass(v97);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4236, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[tilingView dequeueTileControllerWithReuseIdentifier:PUSyndicationAttributionTileReuseIdentifier]"), v98);
    }

    goto LABEL_61;
  }
  v17 = self;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentTileProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v106 = v16;
  objc_msgSend(v16, "assetReferenceAtIndexPath:", v11);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v15;
  v22 = (void *)v20;
  v108 = v21;
  objc_msgSend(v21, "assetViewModelForAssetReference:", v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "asset");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "tileControllerForAsset:viewModel:tilingView:", v24, v23, v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isUpdatingDisplayedContent"))
  {
    objc_initWeak(location, v23);
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke;
    v128[3] = &unk_1E58AA420;
    objc_copyWeak(&v129, location);
    objc_msgSend(v25, "notifyWhenReadyForDisplayWithTimeOut:completionHandler:", v128, 3.0);
    objc_destroyWeak(&v129);
    objc_destroyWeak(location);
  }

  v16 = v106;
  v15 = v108;
  self = v17;
  v26 = v25;
LABEL_14:
  -[PUOneUpViewController _configureAdoptedTileController:](self, "_configureAdoptedTileController:", v26);
  if (!v26)
  {
LABEL_65:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tileController != nil"));

    v26 = 0;
  }

  return v26;
}

- (void)presentErrorFromLoadingIndicator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  PUOneUpLoadingErrorPresentationController *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  if (v4)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewModel");
    v6 = objc_claimAutoreleasedReturnValue();

    -[NSObject assetViewModelForCurrentAssetReference](v6, "assetViewModelForCurrentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PUOneUpLoadingErrorPresentationController initWithError:forAsset:]([PUOneUpLoadingErrorPresentationController alloc], "initWithError:forAsset:", v4, v8);
    -[PUErrorPresentationController setRadarComponentID:name:version:](v9, "setRadarComponentID:name:version:", CFSTR("512768"), CFSTR("Photos Backend (New Bugs)"), CFSTR("all"));
    -[PUErrorPresentationController alertControllerWithCompletion:](v9, "alertControllerWithCompletion:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Attempted to present an error from the loading indicator, but the error was nil. Skipping.", v11, 2u);
    }
  }

}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForTransitionFromLayout:(id)a4 toLayout:(id)a5 withContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentAssetReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUTileTransitionCoordinator browsingTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:](PUTileTransitionCoordinator, "browsingTileTransitionCoordinatorForTransitionFromLayout:toLayout:withTilingView:anchorAssetReference:context:", v12, v11, v13, v16, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)tilingView:(id)a3 dataSourceConverterForTransitionFromLayout:(id)a4 toLayout:(id)a5
{
  return +[PUOneUpAssetsDataSourceConverter defaultConverter](PUOneUpAssetsDataSourceConverter, "defaultConverter", a3, a4, a5);
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForChangeFromFrame:(CGRect)a4 toFrame:(CGRect)a5 duration:(double)a6
{
  void *v6;

  if (a6 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForFrameChangeWithTileCrossFade:tilingView:", 0, a3, a6, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForReattachedTileControllers:(id)a4 context:(id)a5
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a5;
  if ((objc_msgSend(v7, "isTransitioningOverOneUp") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForReattachedTileControllers:context:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForReattachedTileControllers:context:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)tilingView:(id)a3 tileTransitionCoordinatorForLayoutInvalidationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[PUOneUpViewController _shouldDisableTransitionsUntilAppeared](self, "_shouldDisableTransitionsUntilAppeared"))
  {
    v8 = 0;
  }
  else
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUTileTransitionCoordinator defaultTileTransitionCoordinatorForLayoutInvalidationContext:layout:tilingView:viewModel:](PUTileTransitionCoordinator, "defaultTileTransitionCoordinatorForLayoutInvalidationContext:layout:tilingView:viewModel:", v7, v11, v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)tilingViewCanBypass20069585Check:(id)a3
{
  void *v3;
  char v4;

  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInEditMode");

  return v4;
}

- (void)pushPeopleViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PUOneUpViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", 0, 1);

  -[PUOneUpViewController navigationController](self, "navigationController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v4, 1);

}

- (void)presentPeopleViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PUOneUpViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (id)tilingView:(id)a3 scrollInfoWithLayout:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmpty");

  if ((v9 & 1) != 0)
    +[PUTilingScrollInfo scrollInfoWithScrollDirections:](PUTilingScrollInfo, "scrollInfoWithScrollDirections:", 0);
  else
    objc_msgSend(v5, "preferredScrollInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGPoint)tilingView:(id)a3 initialVisibleOriginWithLayout:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGPoint result;

  v6 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewModel");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8, "assetsDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "isEqual:", v9);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[[layout dataSource] isEqual:assetsDataSource]"));

  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "indexPathForAssetReference:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 || (objc_msgSend(v9, "firstItemIndexPath"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v6, "visibleRectForScrollingToItemAtIndexPath:scrollPosition:", v14, 0);
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  }

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v11;
  if (v4 == v11)
  {
    if (UIAccessibilityIsVoiceOverRunning())
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isScrolling");

    }
    else
    {
      v8 = 0;
    }
    if ((objc_msgSend(v11, "isDragging") & 1) != 0 || (v8 & 1) != 0)
    {
      if (!-[PUOneUpViewController _isDrivingScrubbing](self, "_isDrivingScrubbing"))
      {
LABEL_13:
        objc_msgSend(v11, "is_scrollViewDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "scrollViewDidScroll:", v11);

        v5 = v11;
        goto LABEL_14;
      }
    }
    else
    {
      v9 = objc_msgSend(v11, "isDecelerating");
      if (!-[PUOneUpViewController _isDrivingScrubbing](self, "_isDrivingScrubbing")
        || (v9 & 1) == 0 && !objc_msgSend(v11, "pu_isPerformingScrollTest"))
      {
        goto LABEL_13;
      }
    }
    -[PUOneUpViewController _updateViewModelWithCurrentScrollPosition](self, "_updateViewModelWithCurrentScrollPosition");
    goto LABEL_13;
  }
LABEL_14:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUOneUpViewController _updateViewModelWithCurrentScrollPosition](self, "_updateViewModelWithCurrentScrollPosition");
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__PUOneUpViewController_scrollViewWillBeginDragging___block_invoke;
    v10[3] = &unk_1E58ABD10;
    v11 = v7;
    v8 = v7;
    objc_msgSend(v8, "performChanges:", v10);
    if (-[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible"))
    {
      -[PUOneUpViewController _setHasShownRelevantTip:](self, "_setHasShownRelevantTip:", 1);
      -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
      -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");
    }
    objc_msgSend(v4, "is_scrollViewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollViewWillBeginDragging:", v4);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10 = v12;
  if (v9 == v12)
  {
    objc_msgSend(v12, "is_scrollViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

    v10 = v12;
  }

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v6 = a3;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
  {
    if (!v4)
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__PUOneUpViewController_scrollViewDidEndDragging_willDecelerate___block_invoke;
      v12[3] = &unk_1E58ABD10;
      v13 = v9;
      v10 = v9;
      objc_msgSend(v10, "performChanges:", v12);

    }
    objc_msgSend(v6, "is_scrollViewDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scrollViewDidEndDragging:willDecelerate:", v6, v4);

  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__PUOneUpViewController_scrollViewDidEndDecelerating___block_invoke;
    v10[3] = &unk_1E58ABD10;
    v8 = v7;
    v11 = v8;
    objc_msgSend(v8, "performChanges:", v10);
    if (-[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible")
      && -[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 1)
    {
      -[PUOneUpEventTracker logInfoPanelShownAndSwipeToNewAsset](self->_eventTracker, "logInfoPanelShownAndSwipeToNewAsset");
    }
    objc_msgSend(v4, "is_scrollViewDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scrollViewDidEndDecelerating:", v4);

  }
}

- (BOOL)analysisInteractionAllowedForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  BOOL v13;

  objc_msgSend(a3, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUOneUpViewController _allowsShowingVisualIntelligenceForAsset:](self, "_allowsShowingVisualIntelligenceForAsset:", v5))
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentAssetReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "asset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    v11 = v9;
    if (v10 == v11)
    {
      v13 = 1;
    }
    else
    {
      v12 = objc_msgSend(v10, "isContentEqualTo:", v11);
      if (!v12)
        v12 = objc_msgSend(v11, "isContentEqualTo:", v10);
      v13 = v12 == 2;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)contentViewForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v8, CFSTR("PUTileKindItemContent"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "viewIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)showDetailsViewForImageAnalysisInteraction:(id)a3
{
  if (!-[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible", a3))
    -[PUOneUpViewController _toggleDetailsVisibility](self, "_toggleDetailsVisibility");
}

- (void)imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = v3;
  if (imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange__onceToken != -1)
  {
    dispatch_once(&imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange__onceToken, &__block_literal_global_53123);
    v3 = v4;
  }
  if (objc_msgSend(v3, "isDrivingLivePhotoPlayback"))
    objc_msgSend((id)analysisControllers, "addObject:", v4);
  else
    objc_msgSend((id)analysisControllers, "removeObject:", v4);

}

- (id)textsToHighlightForImageAnalysisInteraction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[PUOneUpViewController textsToHighlight](self, "textsToHighlight", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PUOneUpViewController assetUUIDsAllowedToHighlightText](self, "assetUUIDsAllowedToHighlightText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewModel");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v7, "currentAssetReference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "asset");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = objc_msgSend(v5, "containsObject:", v10);

      if ((v7 & 1) == 0)
      {

        v4 = (void *)MEMORY[0x1E0C9AA60];
      }

    }
  }
  return v4;
}

- (BOOL)imageAnalysisInteractionShouldHighlightSubjectWhenAccessoryIsVisible:(id)a3
{
  return -[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset", a3) == 1;
}

- (void)imageAnalysisInteractionSubjectInteractionInProgressDidChange:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "isSubjectInteractionInProgress"))
  {
    -[PUOneUpViewController gestureController](self, "gestureController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelGestures");

  }
}

- (double)layout:(id)a3 aspectRatioForItemAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  int v14;
  void *v16;

  v7 = a4;
  objc_msgSend(a3, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "aspectRatio");
  v11 = *(double *)&v10;
  v12 = (v10 & 0x7FFFFFFFFFFFFFFFuLL) - 1 < 0xFFFFFFFFFFFFFLL;
  v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF;
  if (v10 >= 0)
  {
    v13 = 0;
    v12 = 0;
  }
  if ((v10 & 0x7FFFFFFFFFFFFFFFLL) == 0)
    v12 = 1;
  v14 = (v10 & 0x7FFFFFFFFFFFFFFFLL) == 0x7FF0000000000000 || v12;
  if ((v10 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FF0000000000000)
    v14 = 1;
  if ((v14 | v13) == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4518, CFSTR("Asset:%@ must provide a valid aspect ratio, got:%f."), v9, *(_QWORD *)&v11);

  }
  return v11;
}

- (CGSize)layout:(id)a3 pixelSizeForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = a4;
  objc_msgSend(a3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (double)(unint64_t)objc_msgSend(v7, "pixelWidth");
  v9 = (double)(unint64_t)objc_msgSend(v7, "pixelHeight");

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (UIEdgeInsets)layout:(id)a3 insetsWhenScaledToFitForItemAtIndexPath:(id)a4 inViewportSize:(CGSize)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
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
  objc_class *v37;
  void *v38;
  objc_class *v39;
  void *v40;
  UIEdgeInsets result;

  v8 = a3;
  v9 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dataSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (objc_class *)objc_opt_class();
    NSStringFromClass(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4531, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout.dataSource"), v38, v40);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (objc_class *)objc_opt_class();
    NSStringFromClass(v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4531, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout.dataSource"), v38);
  }

LABEL_3:
  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _layoutReferenceSize](self, "_layoutReferenceSize");
    objc_msgSend(v13, "contentGuideInsetsForViewSize:");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(v12, "assetReferenceAtIndexPath:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetViewModelForAssetReference:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "isAccessoryViewVisible")
      && !-[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel"))
    {
      objc_msgSend(v23, "accessoryViewVisibilityFraction");
      PXEdgeInsetsByLinearlyInterpolatingInsets();
      v15 = v24;
      v17 = v25;
      v19 = v26;
      v21 = v27;
    }

  }
  else
  {
    objc_msgSend(v12, "assetAtIndexPath:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visibleRect");
    if ((PXSizeIsEmpty() & 1) != 0
      || (PXSizeGetAspectRatio(), objc_msgSend(v22, "aspectRatio"), !PXFloatEqualToFloatWithTolerance()))
    {
      objc_msgSend(v8, "contentSafeInsets");
      v15 = v28;
      v17 = v29;
      v19 = v30;
      v21 = v31;
    }
    else
    {
      v15 = *MEMORY[0x1E0DC49E8];
      v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v19 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v21 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
  }

  v32 = v15;
  v33 = v17;
  v34 = v19;
  v35 = v21;
  result.right = v35;
  result.bottom = v34;
  result.left = v33;
  result.top = v32;
  return result;
}

- (BOOL)layout:(id)a3 canApplyInsetStylingToItemAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isChromeVisible");

  return v6;
}

- (CGSize)layout:(id)a3 badgeSizeForItemAtIndexPath:(id)a4 contentWidth:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v8 = a4;
  objc_msgSend(a3, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetReferenceAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetViewModelForAssetReference:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUBadgeTileViewController badgeTileSizeForAssetViewModel:contentWidth:](PUBadgeTileViewController, "badgeTileSizeForAssetViewModel:contentWidth:", v13, a5);
  v15 = v14;
  v17 = v16;

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (double)layout:(id)a3 leadingBadgesWidthForItemAtIndexPath:(id)a4 contentWidth:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v8 = a4;
  objc_msgSend(a3, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetReferenceAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetViewModelForAssetReference:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUBadgeTileViewController leadingBadgesSizeForAssetViewModel:contentWidth:](PUBadgeTileViewController, "leadingBadgesSizeForAssetViewModel:contentWidth:", v13, a5);
  v15 = v14;

  return v15;
}

- (CGSize)layout:(id)a3 assetExplorerReviewScreenBadgeSizeForItemAtIndexPath:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[PUAssetExplorerReviewScreenBadgeTileViewController badgeTileSize](PUAssetExplorerReviewScreenBadgeTileViewController, "badgeTileSize", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)layout:(id)a3 shouldShowPlayButtonForItemAtIndexPath:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetAtIndexPath:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v9, "playbackStyle") == 4;

  }
  return v7;
}

- (BOOL)layout:(id)a3 shouldShowCropButtonForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  char v16;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController _spec](self, "_spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "shouldShowCropButton");

  if (v9)
  {
    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v11;

      if (v12)
      {
        +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "enableSpatialMediaEditing");

        v15 = objc_msgSend(v12, "mediaType") == 1 || objc_msgSend(v12, "mediaType") == 2;
        v18 = objc_msgSend(v12, "isCloudSharedAsset");
        v19 = v15 & ((v18 | objc_msgSend(v12, "isAnimatedGIF")) ^ 1);
        if ((v14 & 1) != 0)
          v20 = 1;
        else
          v20 = objc_msgSend(v12, "isSpatialMedia") ^ 1;
        v21 = v19 & v20;
        v22 = objc_msgSend(v12, "canPerformEditOperation:", 2);
        v16 = 0;
        if (v21 == 1 && v22)
          v16 = objc_msgSend(MEMORY[0x1E0D7CB58], "canPerformEditOnAsset:", v12);
        goto LABEL_10;
      }
    }
    else
    {

      v12 = 0;
    }
    v16 = 0;
LABEL_10:

    goto LABEL_11;
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (BOOL)layoutShouldShowReviewScreenScrubberBar:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackStyle") == 4;

  return v7;
}

- (double)alphaForReviewScreenBarsInLayout:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  double result;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isChromeVisible");

  result = 0.0;
  if (v5)
    return 1.0;
  return result;
}

- (BOOL)layout:(id)a3 shouldMoveProgressIndicatorForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _spec](self, "_spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "shouldDisplaySelectionIndicators") & 1) != 0)
  {
    v11 = 1;
LABEL_7:

    goto LABEL_8;
  }
  v12 = objc_msgSend(v9, "isInSelectionMode");

  if ((v12 & 1) == 0)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "importStatusManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v11 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetReferenceAtIndexPath:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "assetViewModelForAssetReference:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v18, "importState") != 0;
    goto LABEL_7;
  }
  v11 = 1;
LABEL_8:

  return v11;
}

- (BOOL)layout:(id)a3 shouldShowPeopleRowForItemAtIndexPath:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  if ((PLIsMobileSlideShow() & 1) == 0 && !PLIsCamera())
  {
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v7, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4689, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout.dataSource"), v18);
LABEL_10:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4689, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout.dataSource"), v18, v20);

    goto LABEL_10;
  }
LABEL_5:
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetReferenceAtIndexPath:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetViewModelForAssetReference:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "isAccessoryViewVisible");
LABEL_7:

  return v14;
}

- (BOOL)layout:(id)a3 shouldMovePeopleRowForItemAtIndexPath:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;

  v7 = a4;
  objc_msgSend(a3, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4696, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout.dataSource"), v17);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 4696, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout.dataSource"), v17, v19);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v8, "assetAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "assetSharedViewModelForAsset:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = +[PURenderIndicatorTileViewController wantsRenderViewForTypeOfProcessingNeeded:](PURenderIndicatorTileViewController, "wantsRenderViewForTypeOfProcessingNeeded:", objc_msgSend(v12, "deferredProcessingNeeded"));

  return v13;
}

- (BOOL)layout:(id)a3 shouldShowBufferingIndicatorForItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  objc_msgSend(a3, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = +[PUBufferingIndicatorTileViewController canShowBufferingIndicatorTileForAsset:](PUBufferingIndicatorTileViewController, "canShowBufferingIndicatorTileForAsset:", v7);
  return (char)v5;
}

- (CGSize)layout:(id)a3 loadingIndicatorSizeForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v6 = a4;
  objc_msgSend(a3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetReferenceAtIndexPath:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assetViewModelForAssetReference:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController loadingIndicatorController](self, "loadingIndicatorController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "loadingIndicatorStyleForAssetViewModel:", v11);

  if (v13)
  {
    +[PULoadingIndicatorTileViewController loadingIndicatorTileSizeForStyle:](PULoadingIndicatorTileViewController, "loadingIndicatorTileSizeForStyle:", v13);
    v15 = v14;
    v17 = v16;
  }
  else
  {
    v15 = *MEMORY[0x1E0C9D820];
    v17 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)layout:(id)a3 modelTileTransformForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewModel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetsDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "assetReferenceAtIndexPath:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 != v13)
    {
      objc_msgSend(v13, "assetReferenceForAssetReference:", v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    if (v14)
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "assetViewModelForAssetReference:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "modelTileTransform");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isAccessoryViewVisible")
        && !-[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel"))
      {
        objc_msgSend(v18, "accessoryViewVisibilityFraction");
        objc_msgSend(v19, "scale");
        PXFloatByLinearlyInterpolatingFloats();
        v21 = v20;
        objc_msgSend(v19, "normalizedTranslation");
        PXPointByLinearlyInterpolatingPoints();
        v24 = objc_msgSend(v19, "copyWithScale:normalizedTranslation:", v21, v22, v23);

        v19 = (void *)v24;
      }

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    objc_msgSend(v19, "scale");
    if (v25 < 1.0)
    {

      v19 = 0;
    }
  }

  return v19;
}

- (CGPoint)layout:(id)a3 contentOffsetForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v6 = a3;
  v7 = a4;
  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[PUOneUpViewController _assetViewModelAtIndexPath:layout:](self, "_assetViewModelAtIndexPath:layout:", v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v8 = v11;
    v9 = v12;

  }
  v13 = v8;
  v14 = v9;
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)layout:(id)a3 shouldShowAccessoryForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    -[PUOneUpViewController _assetViewModelAtIndexPath:layout:](self, "_assetViewModelAtIndexPath:layout:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isAccessoryViewVisible"))
      v8 = !-[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel");
    else
      LOBYTE(v8) = 0;

  }
  return v8;
}

- (BOOL)layout:(id)a3 isShowingInfoPanelForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;
  int64_t v12;
  char v13;
  char v14;

  v6 = a3;
  v7 = a4;
  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    v8 = 0;
  }
  else
  {
    -[PUOneUpViewController _assetViewModelAtIndexPath:layout:](self, "_assetViewModelAtIndexPath:layout:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel");
    objc_msgSend(v9, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PUOneUpViewController _accessoryContentKindForAsset:](self, "_accessoryContentKindForAsset:", v11);

    v13 = objc_msgSend(v9, "isAccessoryViewVisible");
    if (v12 == 1)
      v14 = v13;
    else
      v14 = 0;
    v8 = v14 & v10;

  }
  return v8;
}

- (double)layout:(id)a3 minimumVisibleContentHeightForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v6 = a3;
  v7 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minimumVisibleContentHeight");
  v10 = v9;

  if ((objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled") & 1) == 0)
  {
    -[PUOneUpViewController _assetReferenceAtIndexPath:layout:](self, "_assetReferenceAtIndexPath:layout:", v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v12))
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "minimumVisibleCommentedContentHeight");
      v10 = v14;

    }
  }

  return v10;
}

- (double)layout:(id)a3 minimumVisibleAccessoryHeightForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  int v18;
  double AspectRatio;
  double v20;
  double v21;
  double v22;
  double MaxY;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "visibleRect");
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  MinY = CGRectGetMinY(v31);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryInitialTopPosition");
  v15 = v14;
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  v16 = CGRectGetHeight(v32);

  -[PUOneUpViewController _spec](self, "_spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "prefersSquareImageInDetails");

  if (v18)
  {
    AspectRatio = PURectGetAspectRatio(x, y, width, height);
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v20 = CGRectGetMinY(v33);
    v21 = 0.0;
    if (AspectRatio <= 1.0)
    {
      v34.origin.x = x;
      v34.origin.y = y;
      v34.size.width = width;
      v34.size.height = height;
      v21 = CGRectGetWidth(v34);
    }
    v22 = v20 + v21;
  }
  else
  {
    v22 = MinY + v15 * v16;
  }
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  MaxY = CGRectGetMaxY(v35);
  objc_msgSend(v7, "contentGuideInsets");
  v25 = MaxY - v24 - v22;
  -[PUOneUpViewController _assetReferenceAtIndexPath:layout:](self, "_assetReferenceAtIndexPath:layout:", v6, v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "accessoryViewControllerForAssetReference:", v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "preferredContentSize");
  if (v25 >= v29)
    v25 = v29;

  return v25;
}

- (double)layout:(id)a3 minimumItemHeightNeededInAccessoryForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double Height;
  double v22;
  double v23;
  CGRect v25;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "visibleRect");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PUOneUpViewController _assetReferenceAtIndexPath:layout:](self, "_assetReferenceAtIndexPath:layout:", v7, v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "accessoryViewControllerForAssetReference:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "preferredContentSize");
    v20 = v19;
  }
  else
  {
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v25.origin.x = v9;
  v25.origin.y = v11;
  v25.size.width = v13;
  v25.size.height = v15;
  Height = CGRectGetHeight(v25);
  objc_msgSend(v6, "contentGuideInsets");
  if (Height - v22 - v20 >= 0.0)
    v23 = Height - v22 - v20;
  else
    v23 = 0.0;

  return v23;
}

- (BOOL)layout:(id)a3 shouldUseSquareImageInAccessoryForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController _spec](self, "_spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "prefersSquareImageInDetails");

  if (v9)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modelTileTransform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasUserZoomedIn");

    if (!objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled")
      || (objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "enableSideCommentsInLandscape"),
          v13,
          (v14 & 1) == 0))
    {
      -[PUOneUpViewController _assetReferenceAtIndexPath:layout:](self, "_assetReferenceAtIndexPath:layout:", v7, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "asset");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 |= +[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v16);

    }
    v17 = v12 ^ 1;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController preferredContentSizeDidChangeForChildContentContainer:](&v10, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "conformsToProtocol:", &unk_1EEC71B08))
  {
    -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetReferenceForAccessoryViewController:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "indexPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[PUOneUpViewController _tilingView](self, "_tilingView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layout");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "invalidateAccessoryForItemAtIndexPath:withOptions:", v7, 2);
    }

  }
}

- (CGPoint)layout:(id)a3 accessoryOffsetForItemAtIndexPath:(id)a4
{
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  -[PUOneUpViewController _assetViewModelAtIndexPath:layout:](self, "_assetViewModelAtIndexPath:layout:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v7 = v6;
  objc_msgSend(v5, "preferredContentOffset");
  v9 = v8;
  if (layout_accessoryOffsetForItemAtIndexPath__onceToken != -1)
    dispatch_once(&layout_accessoryOffsetForItemAtIndexPath__onceToken, &__block_literal_global_574);
  objc_msgSend((id)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter, "setInputValue:", v7 - v9);
  objc_msgSend((id)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter, "outputValue");
  v11 = v10;

  v12 = v4;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)layout:(id)a3 shouldShowVideoPlaceholderForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  if (-[PUOneUpViewController _isSecondScreenBrowserVisible](self, "_isSecondScreenBrowserVisible"))
  {
    -[PUOneUpViewController _videoPlayerAtIndexPath:layout:](self, "_videoPlayerAtIndexPath:layout:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isPlaybackDesired");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)layout:(id)a3 shouldInitiallyZoomToFillForItemAtIndexPath:(id)a4 contentSize:(CGSize)a5 viewportSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  char v20;
  void *v21;
  char v22;
  BOOL v23;
  void *v24;
  uint64_t v25;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v12 = a4;
  objc_msgSend(a3, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetReferenceAtIndexPath:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
  {
    objc_msgSend(v16, "assetViewModelForAssetReference:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v16, "isFillScreenModeEnabled")
      || (objc_msgSend(v17, "isUserTransformingTile") & 1) != 0
      || (objc_msgSend(v17, "modelTileTransform"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "hasUserInput"),
          v18,
          v19))
    {
      v20 = objc_msgSend(v16, "isPresentedForPreview");
LABEL_13:
      v23 = v20;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  objc_msgSend(v14, "asset");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "mediaType") != 2)
  {

LABEL_10:
    objc_msgSend(MEMORY[0x1E0D7B648], "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _spec](self, "_spec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "tileInitialContentMode");

    if (v25 != 2)
    {
      if (v25)
      {
        v23 = 0;
        goto LABEL_16;
      }
      v20 = objc_msgSend(v17, "shouldInitiallyZoomContentWithSize:toFillViewWithSize:", v9, v8, width, height);
      goto LABEL_13;
    }
LABEL_14:
    v23 = 1;
    goto LABEL_16;
  }
  v22 = objc_msgSend(v16, "isPresentedForPreview");

  if ((v22 & 1) != 0)
    goto LABEL_10;
  v23 = 0;
LABEL_17:

  return v23;
}

- (CGRect)layout:(id)a3 bestSquareRectForItemAtIndexPath:(id)a4
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v17;
  CGFloat v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int16 v29[8];
  uint8_t buf[16];
  CGRect v31;
  CGRect v32;
  CGRect result;

  v6 = *MEMORY[0x1E0D7D078];
  v5 = *(double *)(MEMORY[0x1E0D7D078] + 8);
  v8 = *(double *)(MEMORY[0x1E0D7D078] + 16);
  v7 = *(double *)(MEMORY[0x1E0D7D078] + 24);
  v9 = a4;
  objc_msgSend(a3, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetReferenceAtIndexPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v12, "bestCropRectForAspectRatio:verticalContentMode:cropMode:", 0, 2, 1.0),
          x = v31.origin.x,
          y = v31.origin.y,
          width = v31.size.width,
          height = v31.size.height,
          !CGRectIsEmpty(v31)))
    {
      v7 = height;
      v8 = width;
      v5 = y;
      v6 = x;
    }
    else
    {
      PLOneUpGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "Can't get a non-empty bestSquareRect by bestCropRectForAspectRatio:bestCropRectForAspectRatio:...", buf, 2u);
      }

      v18 = (double)(unint64_t)objc_msgSend(v12, "pixelWidth");
      v19 = objc_msgSend(v12, "pixelHeight");
      v32.origin.x = 0.0;
      v32.origin.y = 0.0;
      v32.size.width = v18;
      v32.size.height = (double)v19;
      if (!CGRectIsEmpty(v32))
      {
        PXRectWithAspectRatioFittingRect();
        PXRectNormalize();
        v6 = v20;
        v5 = v21;
        v8 = v22;
        v7 = v23;
      }
    }
  }
  else
  {
    PXAssertGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v29[0] = 0;
      _os_log_error_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_ERROR, "asset of assetReference is nil for bestSquareRectForItemAtIndexPath:", (uint8_t *)v29, 2u);
    }

  }
  v25 = v6;
  v26 = v5;
  v27 = v8;
  v28 = v7;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (BOOL)layout:(id)a3 shouldShowAttributionViewForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v14;

  v6 = a4;
  objc_msgSend(a3, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetReferenceAtIndexPath:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetViewModelForAssetReference:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "fetchAssetSyndicationState");
  v14 = v12 == 4 || (v12 & 0xFFFFFFFFFFFFFFFELL) == 2;

  return v14;
}

- (id)interactiveDismissalControllerDesignatedTileController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v8, CFSTR("PUTileKindItemContent"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)interactiveDismissalController:(id)a3 canBeginDismissalAtLocationFromProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  char v10;
  id v11;
  BOOL v12;
  int v13;
  void *v14;
  void *v15;
  void *v17;

  v6 = a4;
  v7 = a3;
  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isInEditMode") & 1) != 0)
  {
    v9 = 0;
LABEL_3:

    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, "isAccessoryViewVisible");

  if ((v10 & 1) == 0
    && !-[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v6)&& !-[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v6)&& !-[PUOneUpViewController _isIrisPlaying](self, "_isIrisPlaying"))
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "viewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v17, "isInSelectionMode") ^ 1;

    goto LABEL_3;
  }
  v9 = 0;
LABEL_9:
  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12 = v11 == v7;
  if (v11 == v7)
    LOBYTE(v13) = 0;
  else
    LOBYTE(v13) = v9;
  if (v12 && v9)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modelTileTransform");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "hasUserZoomedIn") ^ 1;

  }
  return v13;
}

- (void)interactiveDismissalControllerChangedIsHandlingDismissalInteraction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __93__PUOneUpViewController_interactiveDismissalControllerChangedIsHandlingDismissalInteraction___block_invoke;
  v11 = &unk_1E58ABCA8;
  v12 = v5;
  v13 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(v7, "performChanges:", &v8);
  -[PUOneUpViewController _updateChromeViewControllerDismissalProgress](self, "_updateChromeViewControllerDismissalProgress", v8, v9, v10, v11);

}

- (void)_updateChromeViewControllerDismissalProgress
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissalInteractionProgress");
  v5 = v4;

  -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissalInteractionProgress");
  v8 = v7;

  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHandlingDismissalInteraction") & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isHandlingDismissalInteraction");

  }
  if (v5 < v8)
    v5 = v8;

  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updateDismissalStateWithIsInteractivelyDismissing:dismissalProgress:", v10, v5);

}

- (id)barsControllerViewHostingGestureRecognizers:(id)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresentedForPreview");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)barsControllerContentGuideInsetsDidChange:(id)a3
{
  -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout", a3);
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)oneUpBarsControllerDidChangeShowingPlayPauseButton:(id)a3
{
  -[PUOneUpViewController _invalidateSpec](self, "_invalidateSpec", a3);
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)oneUpBarsController:(id)a3 didTapPlayPauseButton:(BOOL)a4
{
  -[PUOneUpViewController _hideChromeOnPlayButtonTapWithItemIsNowPlaying:buttonIsOverlayed:](self, "_hideChromeOnPlayButtonTapWithItemIsNowPlaying:buttonIsOverlayed:", a4, 0);
}

- (void)oneUpBarsControllerDidTapTitle:(id)a3
{
  void (**v4)(void *, uint64_t);
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PUOneUpViewController_oneUpBarsControllerDidTapTitle___block_invoke;
  aBlock[3] = &unk_1E58A9910;
  aBlock[4] = self;
  v4 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void (**)(void *, uint64_t), _QWORD))v6)[2](v6, v4, 0);

  }
  else
  {
    v4[2](v4, 1);
  }

}

- (BOOL)oneUpBarsController:(id)a3 isDetailsAccessoryAvailableForAssetReference:(id)a4
{
  return -[PUOneUpViewController _isDetailsAccessoryAvailableForAssetReference:](self, "_isDetailsAccessoryAvailableForAssetReference:", a4);
}

- (BOOL)_isDetailsAccessoryAvailableForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "accessoryViewTypeForAsset:", v6) != 0;
  return (char)v4;
}

- (BOOL)oneUpBarsController:(id)a3 canShowCommentsForAsset:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  -[PUOneUpViewController _spec](self, "_spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "allowAccessoryVisibility"))
    v7 = +[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v5);
  else
    v7 = 0;

  return v7;
}

- (BOOL)oneUpBarsController:(id)a3 shouldTapBeginAtLocationFromProvider:(id)a4
{
  id v5;
  NSString *presentedTipID;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  BOOL v14;

  v5 = a4;
  presentedTipID = self->_presentedTipID;
  objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(presentedTipID) = -[NSString isEqualToString:](presentedTipID, "isEqualToString:", v7);

  if ((_DWORD)presentedTipID
    && -[PUOneUpViewController _isLocationFromProvider:overTileOfKind:](self, "_isLocationFromProvider:overTileOfKind:", v5, PUTileKindSyndicationAttribution))
  {
    objc_msgSend(MEMORY[0x1E0D7B650], "syndicatedPhotosTipID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _handleSuggestedActionCompletedForTip:completion:](self, "_handleSuggestedActionCompletedForTip:completion:", v8, 0);

  }
  if (-[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5)|| -[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5))
  {
    v9 = 0;
  }
  else
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isInEditMode") ^ 1;

  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "allowVisualIntelligence");

  if (!v12)
  {
    LOBYTE(v13) = v9;
    goto LABEL_18;
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "allowsVisualIntelligenceVisualLookupInfoPanelMode"))
  {

    if (!v9)
    {
LABEL_17:
      LOBYTE(v13) = 0;
      goto LABEL_18;
    }
LABEL_15:
    if (!-[PUOneUpViewController _isLocationFromProviderOverActionInfoItem:](self, "_isLocationFromProviderOverActionInfoItem:", v5)&& !-[PUOneUpViewController _visualImageHasActiveTextSelectionFromProvider:](self, "_visualImageHasActiveTextSelectionFromProvider:", v5))
    {
      LODWORD(v13) = !-[PUOneUpViewController _isVisualImageHasSubjectLiftedFromProvider:](self, "_isVisualImageHasSubjectLiftedFromProvider:", v5);
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v14 = -[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible");

  LOBYTE(v13) = 0;
  if (!v14 && ((v9 ^ 1) & 1) == 0)
    goto LABEL_15;
LABEL_18:

  return (char)v13;
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideToolbarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:", v5);

  return v7;
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideNavigationBarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5;
  void *v6;
  int v7;
  _BOOL4 v8;

  v5 = a4;
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:", v5);

  if (v7)
    v8 = !-[PUOneUpViewController _isCurrentAssetAndInEditModeForAssetReference:](self, "_isCurrentAssetAndInEditModeForAssetReference:", v5);
  else
    LOBYTE(v8) = 0;

  return v8;
}

- (BOOL)oneUpBarsController:(id)a3 shouldHideStatusBarWhenShowingAccessoryViewForAssetReference:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  BOOL v10;

  v5 = a4;
  -[PUOneUpViewController _spec](self, "_spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hideStatusBarWhenShowingAccessoryView");

  if (v7)
  {
    objc_msgSend(v5, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v8);

    v10 = !v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)oneUpBarsControllerWillPresentActionsMenu:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D7B650];
  v6 = a4;
  objc_msgSend(v5, "actionsMenuTipID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _handleSuggestedActionCompletedForTip:completion:](self, "_handleSuggestedActionCompletedForTip:completion:", v7, v6);

}

- (BOOL)_isCurrentAssetAndInEditModeForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  char v12;
  void *v13;

  v4 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

    goto LABEL_5;
  }
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", v9);

  if ((v11 & 1) != 0)
  {
LABEL_5:
    objc_msgSend(v6, "assetViewModelForAssetReference:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "isInEditMode");

    goto LABEL_6;
  }
  v12 = 0;
LABEL_6:

  return v12;
}

- (void)userTransformTileViewController:(id)a3 didChangeIsUserInteracting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[PUOneUpViewController gestureController](self, "gestureController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelGestures");

  }
  objc_msgSend(v6, "assetViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__PUOneUpViewController_userTransformTileViewController_didChangeIsUserInteracting___block_invoke;
  v10[3] = &unk_1E58AAD68;
  v11 = v8;
  v12 = v4;
  v9 = v8;
  objc_msgSend(v9, "performChanges:", v10);

}

- (BOOL)userTransformTileViewController:(id)a3 shouldReceiveTouchAtLocationFromProvider:(id)a4
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  _BOOL4 v10;

  v5 = a4;
  if (-[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5))
  {
    goto LABEL_5;
  }
  if (-[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5))
    goto LABEL_5;
  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInEditMode");

  if ((v7 & 1) != 0
    || (-[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isAccessoryViewVisible"),
        v8,
        (v9 & 1) != 0))
  {
LABEL_5:
    LOBYTE(v10) = 0;
  }
  else
  {
    v10 = !-[PUOneUpViewController _isLocationFromProviderOverVisualSearch:](self, "_isLocationFromProviderOverVisualSearch:", v5);
  }

  return v10;
}

- (BOOL)ppt_imageTileViewControllerShouldSignalDeferredProcessingDoneAndFinalImageDisplayed:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(a3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;

  -[PUOneUpViewController _layoutReferenceSize](self, "_layoutReferenceSize");
  v10 = v9;
  v12 = v11;
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  return v8 + 3.0 >= v12 * *(double *)&PUMainScreenScale_screenScale
      || v6 + 3.0 >= v10 * *(double *)&PUMainScreenScale_screenScale;
}

- (void)imageTileViewController:(id)a3 didDisplayFullQualityImageWithDeferredProcessingFinished:(BOOL)a4
{
  _BOOL4 v4;

  v4 = a4;
  -[PUOneUpViewController _xct_endSignpostingForImageFullQuality](self, "_xct_endSignpostingForImageFullQuality", a3);
  if (v4)
    -[PUOneUpViewController _xct_endSignpostingForImageDeferredProcessing](self, "_xct_endSignpostingForImageDeferredProcessing");
}

- (void)playButtonTileViewControllerDidTapButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  PUOneUpViewController *v11;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetViewModelForCurrentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__PUOneUpViewController_playButtonTileViewControllerDidTapButton___block_invoke;
  v9[3] = &unk_1E58ABCA8;
  v10 = v7;
  v11 = self;
  v8 = v7;
  objc_msgSend(v8, "performChanges:", v9);

}

- (double)playButtonTileViewController:(id)a3 delayForButtonAnimation:(BOOL)a4
{
  double v4;
  void *v6;
  void *v7;
  void *v8;
  double v9;

  v4 = 0.0;
  if (a4)
  {
    objc_msgSend(a3, "assetViewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "videoPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isAtEnd")
      && -[PUOneUpViewController _shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:](self, "_shouldMakeChromeVisibleWhenVideoPlayerPlaysToEndTime:", v7))
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chromeDefaultAnimationDuration");
      v4 = v9 + 0.3;

    }
  }
  return v4;
}

- (BOOL)playButtonTileViewControllerShouldShowPauseButton:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reviewScreenBarsModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)playButtonTileViewControllerShouldShowPlayButtonWhileActivated:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reviewScreenBarsModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "shouldEnableActionType:onAsset:inAssetCollection:", 50, v11, v12);

  if ((v15 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v17, "shouldEnableActionType:onAsset:inAssetCollection:", 51, v11, v12);

  }
  return v7;
}

- (void)_handleSuggestedActionCompletedForTip:(id)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  id tipDismissedCompletion;
  id v9;

  v9 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[NSString isEqualToString:](self->_presentedTipID, "isEqualToString:", v9))
  {
    -[PUOneUpViewController _setHasShownRelevantTip:](self, "_setHasShownRelevantTip:", 1);
    objc_msgSend(MEMORY[0x1E0D7B650], "setTipActionPerformed:", v9);
    v7 = _Block_copy(v6);
    tipDismissedCompletion = self->_tipDismissedCompletion;
    self->_tipDismissedCompletion = v7;

  }
  else if (v6)
  {
    v6[2](v6);
  }

}

- (void)_dismissAnyPresentedTip
{
  if (-[PUOneUpViewController _isTipPopoverVisible](self, "_isTipPopoverVisible"))
    objc_msgSend(MEMORY[0x1E0D7B650], "setTip:isPresentable:", self->_presentedTipID, 0);
}

- (void)dismissPresentedViewController:(id)a3 presentMenuWithCompletion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0D7B650];
  v6 = a4;
  objc_msgSend(v5, "livePhotosTipID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _handleSuggestedActionCompletedForTip:completion:](self, "_handleSuggestedActionCompletedForTip:completion:", v7, v6);

}

- (void)badgeVisibilityDidChange:(id)a3
{
  -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers", a3);
  -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");
}

- (void)badgeTileViewController:(id)a3 presentViewController:(id)a4
{
  -[PUOneUpViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", a4, 1, 0);
}

- (id)contentViewControllerForAirPlayController:(id)a3
{
  PUOneUpViewController *v4;
  void *v5;

  -[PUOneUpViewController _secondScreenBrowser](self, "_secondScreenBrowser", a3);
  v4 = (PUOneUpViewController *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PUOneUpViewController initWithBrowsingSession:options:]([PUOneUpViewController alloc], "initWithBrowsingSession:options:", v5, 514);
    -[PUOneUpViewController _setMainOneUpForSecondScreenBrowser:](v4, "_setMainOneUpForSecondScreenBrowser:", self);
    -[PUOneUpViewController _setSecondScreenBrowser:](self, "_setSecondScreenBrowser:", v4);

  }
  return v4;
}

- (BOOL)wantsContentVisibleAfterUnregisteringWithAirPlayController:(id)a3
{
  return (-[PUOneUpViewController _options](self, "_options", a3) >> 2) & 1;
}

- (void)airPlayControllerScreenAvailabilityChanged:(id)a3
{
  if (!objc_msgSend(a3, "screenAvailability"))
    -[PUOneUpViewController _setSecondScreenBrowser:](self, "_setSecondScreenBrowser:", 0);
  -[PUOneUpViewController _invalidateBarsControllers](self, "_invalidateBarsControllers");
  -[PUOneUpViewController _updateBarsControllerIfNeeded](self, "_updateBarsControllerIfNeeded");
  -[PUOneUpViewController _invalidateChromeViewController](self, "_invalidateChromeViewController");
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (BOOL)_isSecondScreenBrowserVisible
{
  BOOL v3;
  void *v4;

  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
    return 0;
  -[PUOneUpViewController _secondScreenBrowser](self, "_secondScreenBrowser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4 != 0;

  return v3;
}

- (BOOL)oneUpGestureRecognizerCoordinator:(id)a3 shouldAllowIrisGestureAtLocationFromProvider:(id)a4
{
  id v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;

  v5 = a4;
  if (-[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5))
  {
    v6 = 0;
  }
  else
  {
    v6 = !-[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5);
  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "allowVisualIntelligence")
    || !-[PUOneUpViewController _isLocationFromProvider:overTileOfKind:](self, "_isLocationFromProvider:overTileOfKind:", v5, CFSTR("PUTileKindItemContent")))
  {
    goto LABEL_15;
  }
  if ((objc_msgSend(v7, "allowsVisualIntelligenceRemoveBackground") & 1) == 0)
  {
    if (!v6)
    {
LABEL_12:
      LOBYTE(v6) = 0;
      goto LABEL_15;
    }
LABEL_14:
    v6 = !-[PUOneUpViewController _isLocationFromProviderOverInteractiveItem:](self, "_isLocationFromProviderOverInteractiveItem:", v5);
    goto LABEL_15;
  }
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUOneUpViewController _allowsShowingVisualIntelligenceForAsset:](self, "_allowsShowingVisualIntelligenceForAsset:", v11);

  if (!v12)
  {
    if (!v6)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (v6)
  {
    if (!-[PUOneUpViewController _vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:](self, "_vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:", v5))goto LABEL_14;
    goto LABEL_12;
  }
LABEL_15:

  return v6;
}

- (BOOL)oneUpGestureController:(id)a3 canBeginGestureAt:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  _BOOL4 v10;

  v5 = a4;
  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldAllowGestureToBeginAt:", v5);

  if (!v7
    || -[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5)|| -[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5)|| (-[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isInEditMode"), v8, (v9 & 1) != 0)|| -[PUOneUpViewController _isLocationFromProviderOverActionInfoItem:](self, "_isLocationFromProviderOverActionInfoItem:", v5)|| -[PUOneUpViewController _visualImageHasActiveTextSelectionFromProvider:](self, "_visualImageHasActiveTextSelectionFromProvider:", v5))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    v10 = !-[PUOneUpViewController _isVisualImageHasSubjectLiftedFromProvider:](self, "_isVisualImageHasSubjectLiftedFromProvider:", v5);
  }

  return v10;
}

- (BOOL)oneUpGestureController:(id)a3 canDoubleTapToZoomAtPoint:(id)a4
{
  _BOOL4 v5;

  v5 = -[PUOneUpViewController _isLocationFromProvider:overTileOfKind:](self, "_isLocationFromProvider:overTileOfKind:", a4, CFSTR("PUTileKindItemContent"));
  if (v5)
  {
    if (-[PUOneUpViewController _prefersFloatingInfoPanel](self, "_prefersFloatingInfoPanel"))
      LOBYTE(v5) = 1;
    else
      LOBYTE(v5) = !-[PUOneUpViewController _isAccessoryVisible](self, "_isAccessoryVisible");
  }
  return v5;
}

- (BOOL)oneUpGestureController:(id)a3 canTapToToggleChromeAtPoint:(id)a4
{
  id v5;
  int v6;
  void *v7;

  v5 = a4;
  if (-[PUOneUpViewController _isVisualImageHasSubjectLiftedFromProvider:](self, "_isVisualImageHasSubjectLiftedFromProvider:", v5)|| -[PUOneUpViewController _isLocationFromProviderOverVisualSearch:](self, "_isLocationFromProviderOverVisualSearch:", v5))
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isAccessoryViewVisible") ^ 1;

  }
  return v6;
}

- (BOOL)doubleTapZoomController:(id)a3 canDoubleTapBeginAtLocationFromProvider:(id)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  int v10;
  void *v11;

  v5 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "doubleTapZoomAreaExcludesBars");

  if (v7
    && (-[PUOneUpViewController _barsController](self, "_barsController"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isLocationFromProviderInBarsArea:", v5),
        v8,
        (v9 & 1) != 0)
    || -[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v5)|| -[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v5))
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "isInEditMode") ^ 1;

  }
  return v10;
}

- (BOOL)accessoryVisibilityInteractionController:(id)a3 canBeginAtLocationFromProvider:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  char v13;
  BOOL v14;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentAssetReference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "accessoryViewTypeForAsset:", v9);

  objc_msgSend(v6, "assetViewModelForAssetReference:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isInEditMode") ^ 1;

  if (v10 == 3)
    v13 = v12;
  else
    v13 = 1;
  if (v10)
    v14 = v13;
  else
    v14 = 0;

  return v14;
}

- (void)accessoryVisibilityInteractionControllerDidEnd:(id)a3
{
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[5];

  v4 = -[PUOneUpViewController _shouldShowAccessoryAfterUnlock](self, "_shouldShowAccessoryAfterUnlock", a3);
  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    -[PUOneUpViewController _setShouldShowAccessoryAfterUnlock:](self, "_setShouldShowAccessoryAfterUnlock:", 0);
    aBlock[0] = v5;
    aBlock[1] = 3221225472;
    aBlock[2] = __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke;
    aBlock[3] = &unk_1E58A9910;
    aBlock[4] = self;
    v6 = _Block_copy(aBlock);
    -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD))v8)[2](v8, v6, 0);

    }
  }
  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke_2;
  v10[3] = &unk_1E58ABD10;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  objc_msgSend(v9, "performChanges:", v10);

}

- (BOOL)accessoryVisibilityInteractionController:(id)a3 isLocationFromProviderInAccessoryContent:(id)a4
{
  return -[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", a4);
}

- (void)accessoryVisibilityInteractionController:(id)a3 setAccessoryVisible:(BOOL)a4 changeReason:(int64_t)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t (**v14)(void);
  char v15;
  _QWORD v16[4];
  id v17;

  v5 = a4;
  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "photoBrowserChromeVisibleBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelTileTransform");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasUserZoomedIn");

    if (v13)
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __99__PUOneUpViewController_accessoryVisibilityInteractionController_setAccessoryVisible_changeReason___block_invoke;
      v16[3] = &unk_1E58ABD10;
      v17 = v11;
      objc_msgSend(v17, "performChanges:", v16);

LABEL_11:
      return;
    }
    if (v5)
    {
      if (-[PUOneUpViewController _shouldShowAccessoryAfterUnlock](self, "_shouldShowAccessoryAfterUnlock")
        || -[PUOneUpViewController _requireUnlockedDeviceForAccessoryView](self, "_requireUnlockedDeviceForAccessoryView")&& (-[PUOneUpViewController unlockDeviceStatus](self, "unlockDeviceStatus"), v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(), v15 = v14[2](), v14, (v15 & 1) == 0))
      {
        -[PUOneUpViewController _setShouldShowAccessoryAfterUnlock:](self, "_setShouldShowAccessoryAfterUnlock:", 1);
        goto LABEL_11;
      }
    }
    else
    {
      -[PUOneUpViewController _setShouldShowAccessoryAfterUnlock:](self, "_setShouldShowAccessoryAfterUnlock:", 0);
    }
    -[PUOneUpViewController _setAccessoryVisible:changeReason:](self, "_setAccessoryVisible:changeReason:", v5, 2);
    goto LABEL_11;
  }
}

- (id)overOneUpPresentationSessionCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  PUOverOneUpPresentationSession *v5;
  PUOneUpActivitySharingActionPerformer *v6;
  void *v7;
  PUOneUpActivitySharingActionPerformer *v8;
  void *v9;

  v3 = a3;
  -[PUOneUpViewController _overOneUpPresentationSession](self, "_overOneUpPresentationSession");
  v5 = (PUOverOneUpPresentationSession *)objc_claimAutoreleasedReturnValue();
  if (!v5 && v3)
  {
    v6 = [PUOneUpActivitySharingActionPerformer alloc];
    -[PUOneUpViewController actionsController](self, "actionsController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUOneUpActivitySharingActionPerformer initWithActionsController:](v6, "initWithActionsController:", v7);

    v5 = -[PUOverOneUpPresentationSession initWithActivitySharingActionPerformer:]([PUOverOneUpPresentationSession alloc], "initWithActivitySharingActionPerformer:", v8);
    -[PUOverOneUpPresentationSession setDelegate:](v5, "setDelegate:", self);
    -[PUOneUpViewController _barsController](self, "_barsController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOverOneUpPresentationSession setBarsDelegate:](v5, "setBarsDelegate:", v9);

    -[PUOneUpViewController _setOverOneUpPresentationSession:](self, "_setOverOneUpPresentationSession:", v5);
  }
  return v5;
}

- (id)overOneUpPresentationSessionCurrentTileController:(id)a3
{
  return -[PUOneUpViewController _presentedTileControllerForCurrentIndexPathWithKind:](self, "_presentedTileControllerForCurrentIndexPathWithKind:", CFSTR("PUTileKindItemContent"));
}

- (id)_presentedTileControllerForCurrentIndexPathWithKind:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexPathForAssetReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _presentedTileControllerForIndexPath:kind:](self, "_presentedTileControllerForIndexPath:kind:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_presentedTileControllerForIndexPath:(id)a3 kind:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assetsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v7, v6, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)overOneUpPresentationSessionBrowserViewModel:(id)a3
{
  void *v3;
  void *v4;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)overOneUpPresentationSessionPresentingViewControllerIsReady:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;

  -[PUOneUpViewController parentViewController](self, "parentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 || (-[PUOneUpViewController isBeingDismissed](self, "isBeingDismissed") & 1) != 0)
    return 0;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6 != 0;

  return v5;
}

- (void)overOneUpPresentationSession:(id)a3 didPresent:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PUOneUpViewController browsingSession](self, "browsingSession", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__PUOneUpViewController_overOneUpPresentationSession_didPresent___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performChanges:", v7);

}

- (void)overOneUpPresentationSessionDidFinish:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  -[PUOneUpViewController _setOverOneUpPresentationSession:](self, "_setOverOneUpPresentationSession:", 0);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__PUOneUpViewController_overOneUpPresentationSessionDidFinish___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performChanges:", v7);

}

- (id)_currentContentTileController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v7, CFSTR("PUTileKindItemContent"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_contentTileControllerForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "indexPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dataSourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v6, CFSTR("PUTileKindItemContent"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_trailingContentTileController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _contentTileControllerForAssetReference:](self, "_contentTileControllerForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_leadingContentTileController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _contentTileControllerForAssetReference:](self, "_contentTileControllerForAssetReference:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_currentPlaceholderSnapshotViewForTileController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (!a3)
    return 0;
  -[PUOneUpViewController _currentFrameForTileController:](self, "_currentFrameForTileController:");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v3, v4, v5, v6);
}

- (CGRect)_currentFrameForTileController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
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
  CGRect result;

  if (a3)
  {
    v4 = a3;
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationLayoutInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "coordinateSystem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentCoordinateSystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v15, v16, v8, v10);
    v19 = v18;

    -[PUOneUpViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "convertRect:fromView:", v5, v17, v19, v12, v14);
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v28 = v27;

  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v28 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v29 = v22;
  v30 = v24;
  v31 = v26;
  v32 = v28;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (NSArray)_tileKindsToHide
{
  NSArray *tileKindsToHide;
  NSArray *v4;
  NSArray *v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  tileKindsToHide = self->__tileKindsToHide;
  if (!tileKindsToHide)
  {
    v7[0] = PUTileKindBadge;
    v7[1] = PUTileKindAccessory;
    v7[2] = PUTileKindPlayButton;
    v7[3] = PUTileKindProgressIndicator;
    v7[4] = PUTileKindBufferingIndicator;
    v7[5] = PUTileKindLoadingIndicator;
    v7[6] = PUTileKindAssetExplorerReviewScreenBadge;
    v7[7] = PUTileKindAssetExplorerReviewScreenProgressIndicator;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 8);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->__tileKindsToHide;
    self->__tileKindsToHide = v4;

    tileKindsToHide = self->__tileKindsToHide;
  }
  return tileKindsToHide;
}

- (void)_hideOverlays
{
  PUOneUpViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  PUOneUpViewController *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v2 = self;
  v39 = *MEMORY[0x1E0C80C00];
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _tilingView](v2, "_tilingView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v28 = v4;
    objc_msgSend(v4, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v7;
    objc_msgSend(v7, "dataSourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[PUOneUpViewController _tileKindsToHide](v2, "_tileKindsToHide");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v26 = v2;
      v14 = 0;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          v17 = v14;
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(v6, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v8, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14 && (objc_msgSend(v14, "isDetached") & 1) == 0)
            objc_msgSend(v10, "addObject:", v14);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);

      v2 = v26;
    }

    -[PUOneUpViewController _setHiddenTilesController:](v2, "_setHiddenTilesController:", v10);
    objc_msgSend(v6, "detachTileControllers:", v10);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v10;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v30 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(v23, "presentationLayoutInfo");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "layoutInfoWithAlpha:", 0.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v23, "applyLayoutInfo:", v25);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v20);
    }

    v4 = v28;
  }

}

- (void)_unhideOverlays
{
  void *v3;
  id v4;

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _hiddenTilesController](self, "_hiddenTilesController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "reattachTileControllers:withContext:", v3, 0);
    -[PUOneUpViewController _setHiddenTilesController:](self, "_setHiddenTilesController:", 0);
    objc_msgSend(v4, "layoutIfNeeded");
  }

}

- (void)_willBeginTransition
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PUOneUpViewController _accessoryContentKindForCurrentAsset](self, "_accessoryContentKindForCurrentAsset") == 1)
    -[PUOneUpViewController _setAccessoryVisible:](self, "_setAccessoryVisible:", 0);
  -[PUOneUpViewController _hideOverlays](self, "_hideOverlays");
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "detachTileControllers:", v6);

    objc_msgSend(v5, "presentationLayoutInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutInfoWithAlpha:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyLayoutInfo:", v8);

  }
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)_didEndTransition
{
  void *v3;
  void *v4;
  PUTileReattachmentContext *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpViewController _unhideOverlays](self, "_unhideOverlays");
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isDetached"))
  {
    v5 = objc_alloc_init(PUTileReattachmentContext);
    -[PUTileReattachmentContext setTransitioningOverOneUp:](v5, "setTransitioningOverOneUp:", 1);
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reattachTileControllers:withContext:", v6, v5);

  }
  objc_msgSend(v3, "layoutIfNeeded");

}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4
{
  -[PUOneUpViewController oneUpAssetTransition:requestTransitionContextWithCompletion:options:](self, "oneUpAssetTransition:requestTransitionContextWithCompletion:options:", a3, a4, 0);
}

- (void)oneUpAssetTransition:(id)a3 requestTransitionContextWithCompletion:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  objc_class *v54;
  void *v55;
  objc_class *v56;
  void *v57;
  void *v58;
  void (**v59)(_QWORD, _QWORD);
  void *v60;
  void *v61;
  void *v62;
  char v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;

  v63 = a5;
  v8 = a3;
  v9 = a4;
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "currentAssetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = v12;
  objc_msgSend(v12, "asset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void (**)(_QWORD, _QWORD))v9;
  v14 = objc_msgSend(v13, "playbackStyle") == 4 || objc_msgSend(v13, "playbackStyle") == 5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = v62;
  v61 = v13;
  if ((v63 & 2) != 0 && v14)
  {
    v17 = v62;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_8:
        objc_msgSend(v17, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "snapshotViewAfterScreenUpdates:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v66[0] = v15;
        v66[1] = 3221225472;
        v66[2] = __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke;
        v66[3] = &unk_1E58A4F78;
        v67 = v19;
        v68 = v13;
        v20 = v19;
        +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:](PUAssetTransitionInfo, "assetTransitionInfoWithConfigurationBlock:", v66);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (objc_class *)objc_opt_class();
      NSStringFromClass(v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 5776, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("tileController"), v55, v57);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (objc_class *)objc_opt_class();
      NSStringFromClass(v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 5776, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("tileController"), v55);
    }

    v13 = v61;
    goto LABEL_8;
  }
  objc_msgSend(v62, "generateAssetTransitionInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "toViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v22, "oneUpAssetTransition:adjustTransitionInfo:", v8, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        v25 = v23;

        v21 = v25;
      }

    }
  }
  v60 = v8;
  objc_msgSend(v21, "snapshotView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    -[PUOneUpViewController _currentFrameForTileController:](self, "_currentFrameForTileController:", v62);
    objc_msgSend(v26, "setFrame:");
    objc_msgSend(v26, "setContentMode:", 2);
    objc_msgSend(v26, "setClipsToBounds:", 1);
    objc_msgSend(v62, "layoutInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "cornerRadius");
    v29 = v28;
    objc_msgSend(v26, "layer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCornerRadius:", v29);

    objc_msgSend(v62, "layoutInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "cornerCurve");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCornerCurve:", v32);

    v34 = v26;
  }
  else
  {
    -[PUOneUpViewController _currentPlaceholderSnapshotViewForTileController:](self, "_currentPlaceholderSnapshotViewForTileController:", v62);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "image");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setImage:", v35);
    objc_msgSend(v34, "setClipsToBounds:", 1);
    objc_msgSend(v62, "layoutInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "cornerRadius");
    v38 = v37;
    objc_msgSend(v34, "layer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCornerRadius:", v38);

    objc_msgSend(v62, "layoutInfo");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "cornerCurve");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerCurve:", v41);

    objc_msgSend(v34, "setContentMode:", 2);
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "shouldDisplayHDR"))
      v44 = 2;
    else
      v44 = 0;
    v16 = v62;
    objc_msgSend(v34, "setPreferredImageDynamicRange:", v44);

  }
  objc_msgSend(v21, "imageLayerModulator");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v15;
  v64[1] = 3221225472;
  v64[2] = __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke_2;
  v64[3] = &unk_1E58A9E78;
  v46 = v34;
  v65 = v46;
  objc_msgSend(v45, "performChanges:", v64);

  if ((v63 & 1) != 0)
  {
    -[PUOneUpViewController _trailingContentTileController](self, "_trailingContentTileController");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "generateAssetTransitionInfo");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _leadingContentTileController](self, "_leadingContentTileController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "generateAssetTransitionInfo");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController view](self, "view");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:trailingAssetTransitionInfo:leadingAssetTransitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:trailingAssetTransitionInfo:leadingAssetTransitionInfo:", 0, v52, v46, v21, v49, v51);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = v62;
  }
  else
  {
    -[PUOneUpViewController view](self, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUOneUpAssetTransitionContext oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:](PUOneUpAssetTransitionContext, "oneUpAssetTransitionContextWithContainerView:fromView:snapshotView:transitionInfo:", 0, v47, v46, v21);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v59)
    ((void (**)(_QWORD, void *))v59)[2](v59, v48);

}

- (id)createAssetTransitionInfo
{
  void *v2;
  void *v3;

  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateAssetTransitionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)oneUpAssetTransition:(id)a3 animateTransitionWithContext:(id)a4 duration:(double)a5 completion:(id)a6
{
  id v9;
  id v10;
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
  uint64_t v22;
  void *v23;
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
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  CGFloat v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  CGFloat v81;
  uint64_t v82;
  CGFloat v83;
  CGFloat v84;
  double matched;
  __int128 v86;
  void *v87;
  PUOneUpViewController *v88;
  id v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  double v99;
  double v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  id v112;
  void *v113;
  id v114;
  uint64_t v115;
  id v116;
  void *v117;
  id v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  double v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  double v128;
  void *v129;
  CGFloat v130;
  CGFloat v131;
  BOOL v132;
  CGFloat v133;
  void *v134;
  CGFloat v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  CGFloat v146;
  id v147;
  _QWORD v148[4];
  id v149;
  id v150;
  id v151;
  id v152;
  id v153;
  id v154;
  id v155;
  _QWORD v156[4];
  id v157;
  id v158;
  id v159;
  id v160;
  id v161;
  PUOneUpViewController *v162;
  CGFloat v163;
  CGFloat v164;
  CGFloat v165;
  CGFloat v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  BOOL v170;
  _QWORD v171[4];
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;

  v9 = a4;
  v10 = a6;
  objc_msgSend(v9, "executedAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController undoManager](self, "undoManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerWithUndoManager:", v12);

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v124 = a5;
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "viewModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "assetsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v18;
    objc_msgSend(v18, "currentAssetReference");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v19;
    objc_msgSend(v19, "indexPathForAssetReference:");
    v143 = v16;
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutInfoForTileWithIndexPath:kind:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fromView");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "snapshotView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v138 = (void *)v22;
    objc_msgSend(v21, "convertRect:fromView:", v22);
    v128 = v24;
    v26 = v25;
    v125 = v25;
    v28 = v27;
    v30 = v29;
    objc_msgSend(v23, "setFrame:");
    objc_msgSend(v21, "addSubview:", v23);
    objc_msgSend(v20, "frame");
    v32 = v31;
    v133 = v33;
    v135 = v31;
    v34 = v33;
    v36 = v35;
    v130 = v37;
    v131 = v35;
    v38 = v37;
    objc_msgSend(v20, "coordinateSystem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentCoordinateSystem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v39, v40, v32, v34);
    v43 = v42;

    -[PUOneUpViewController view](self, "view");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "convertRect:fromView:", v13, v41, v43, v36, v38);
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;

    -[PUOneUpViewController view](self, "view");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromView:", v53, v46, v48, v50, v52);
    v146 = v54;
    v126 = v56;
    v127 = v55;
    v58 = v57;

    -[PUOneUpViewController view](self, "view");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v21;
    objc_msgSend(v21, "convertRect:toView:", v59, v26, v28, v128, v30);
    v61 = v60;
    v63 = v62;
    v65 = v64;
    v67 = v66;

    -[PUOneUpViewController view](self, "view");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromView:", v68, v61, v63, v65, v67);
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;

    objc_msgSend(v13, "contentCoordinateSystem");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "coordinateSystem");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v77, v78, v70, v72);
    v81 = v80;

    v137 = v23;
    v82 = objc_msgSend(v23, "contentMode");
    v180 = 0u;
    v181 = 0u;
    v179 = 0u;
    v83 = v30;
    v84 = v58;
    PUAffineTransformToMatchRect((uint64_t)&v179, v125, v28, v128, v83, v146, v127, v126, v58);
    v177 = 0u;
    v178 = 0u;
    v176 = 0u;
    matched = PUAffineTransformToMatchRect((uint64_t)&v176, v135, v133, v131, v130, v79, v81, v74, v76);
    v144 = v10;
    v132 = v82 == 2;
    if (v82 == 2)
    {
      PXRectGetCenter();
      v86 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      v173 = *MEMORY[0x1E0C9BAA8];
      v174 = v86;
      v175 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v98 = v20;
      v95 = v74;
      v97 = v76;
    }
    else
    {
      objc_msgSend(v20, "center", matched);
      v91 = v90;
      v93 = v92;
      objc_msgSend(v20, "size");
      v95 = v94;
      v97 = v96;
      v173 = v176;
      v174 = v177;
      v175 = v178;
      v98 = v20;
      v99 = v91;
      v100 = v93;
    }
    objc_msgSend(v98, "layoutInfoWithCenter:size:transform:", &v173, v99, v100, v95, v97);
    v101 = objc_claimAutoreleasedReturnValue();
    v102 = v20;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "addObject:", v14);
    -[PUOneUpViewController _backgroundTileViewController](self, "_backgroundTileViewController");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (v104 && objc_msgSend(v9, "shouldHideBackground"))
      objc_msgSend(v103, "addObject:", v104);
    if (objc_msgSend(v103, "count"))
      objc_msgSend(v13, "detachTileControllers:", v103);
    v136 = (void *)v101;
    objc_msgSend(v14, "applyLayoutInfo:", v101);
    if (objc_msgSend(v9, "shouldHideBackground"))
    {
      objc_msgSend(v104, "presentationLayoutInfo");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "layoutInfoWithAlpha:", 0.0);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v104, "applyLayoutInfo:", v106);
    }
    v134 = v104;
    v107 = v13;
    -[PUOneUpViewController _hideOverlays](self, "_hideOverlays");
    objc_msgSend(v9, "transitionInfo");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    v110 = MEMORY[0x1E0C809B0];
    if (v108)
    {
      if ((objc_msgSend(v108, "allowAutoPlay") & 1) == 0)
      {
        objc_msgSend(v145, "assetViewModelForCurrentAssetReference");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "videoPlayer");
        v171[0] = v110;
        v171[1] = 3221225472;
        v171[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke;
        v171[3] = &unk_1E58ABD10;
        v172 = (id)objc_claimAutoreleasedReturnValue();
        v112 = v172;
        objc_msgSend(v112, "performChanges:", v171);

      }
      objc_msgSend(v14, "adoptAssetTransitionInfo:", v109);
    }
    +[PUInterfaceManager beginDisablingUserInteractionForReason:](PUInterfaceManager, "beginDisablingUserInteractionForReason:", 10);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startSuppressingAnimatedUpdatesWithReason:", CFSTR("one-up transition"));
    objc_msgSend(v14, "viewControllerTransitionWillBegin");
    v129 = (void *)MEMORY[0x1E0DC3F10];
    v156[0] = v110;
    v156[1] = 3221225472;
    v156[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2;
    v156[3] = &unk_1E58A3120;
    v157 = v9;
    v158 = v145;
    v170 = v132;
    v159 = v137;
    v163 = v146;
    v164 = v127;
    v165 = v126;
    v166 = v84;
    v167 = v179;
    v168 = v180;
    v169 = v181;
    v114 = v14;
    v115 = v110;
    v116 = v114;
    v160 = v114;
    v161 = v102;
    v162 = self;
    v147 = v9;
    v148[0] = v115;
    v148[1] = 3221225472;
    v148[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_4;
    v148[3] = &unk_1E58A3148;
    v117 = v107;
    v149 = v107;
    v150 = v103;
    v151 = v159;
    v152 = v138;
    v153 = v116;
    v154 = v113;
    v10 = v144;
    v155 = v144;
    v118 = v113;
    v119 = v138;
    v120 = v159;
    v121 = v103;
    v122 = v102;
    v123 = v145;
    objc_msgSend(v129, "animateWithDuration:animations:completion:", v156, v148, v124);

    v13 = v117;
    v9 = v147;

  }
  else
  {
    -[PUOneUpViewController navigationController](self, "navigationController");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "topViewController");
    v88 = (PUOneUpViewController *)objc_claimAutoreleasedReturnValue();

    if (v88 == self)
      v89 = (id)objc_msgSend(v87, "popViewControllerAnimated:", 0);
    if (v10)
      (*((void (**)(id, BOOL))v10 + 2))(v10, v88 == self);

  }
}

- (void)irisImageTileViewControllerDidBeginHinting:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUOneUpViewController _barsController](self, "_barsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tapGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pu_cancel");

  -[PUOneUpViewController _doubleTapZoomController](self, "_doubleTapZoomController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleTapGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_cancel");

}

- (void)irisImageTileViewControllerDidBeginPlaying:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "assetViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "irisPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "currentPlaybackStyle") == 1)
  {
    -[PUOneUpViewController _setIrisPlaying:](self, "_setIrisPlaying:", 1);
    objc_msgSend(v10, "asset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userWillPlayAssetInOneUp:", v7);

    -[PUOneUpViewController eventTracker](self, "eventTracker");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logUserWillPlayLivePhoto:", v7);

  }
}

- (void)irisImageTileViewControllerDidEndPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PUOneUpViewController _setIrisPlaying:](self, "_setIrisPlaying:", 0);
  -[PUOneUpViewController _setDidPlayCurrentLivePhoto:](self, "_setDidPlayCurrentLivePhoto:", 1);
  objc_msgSend(v4, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidPlayAssetInOneUp:", v7);

  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "logUserDidPlayLivePhoto:", v7);

  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)irisImageTileViewControllerDidEndVitality:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "asset");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vitalityPlayedForAssetInOneUp:", v6);

  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logVitalityDidEndForLivePhoto:", v6);

}

- (id)irisImageTileViewController:(id)a3 delegateForGestureRecognizer:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[PUOneUpViewController _gestureRecognizerCoordinator](self, "_gestureRecognizerCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addIrisGestureRecognizer:", v5);

  return -[PUOneUpViewController _gestureRecognizerCoordinator](self, "_gestureRecognizerCoordinator");
}

- (id)accessoryTileViewControllerAccessoryViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "assetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryViewControllerForAssetReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessoryTileViewControllerWillHideToolbarWhenShowingAccessoryView:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a3, "assetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideToolbarWhenShowingAccessoryViewControllerForAssetReference:", v4);

  return v6;
}

- (BOOL)accessoryTileViewControllerWillHideNavigationBarWhenShowingAccessoryView:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _BOOL4 v7;

  objc_msgSend(a3, "assetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHideNavigationBarWhenShowingAccessoryViewControllerForAssetReference:", v4);

  if (v6)
    v7 = !-[PUOneUpViewController _isCurrentAssetAndInEditModeForAssetReference:](self, "_isCurrentAssetAndInEditModeForAssetReference:", v4);
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (BOOL)accessoryTileViewControllerShouldUseSquareImageWhenShowingAccessoryView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[PUOneUpViewController _spec](self, "_spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prefersSquareImageInDetails");

  if (v6)
  {
    if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled")
      && (objc_msgSend(MEMORY[0x1E0D7B568], "sharedInstance"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "enableSideCommentsInLandscape"),
          v7,
          (v8 & 1) != 0))
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      objc_msgSend(v4, "assetReference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = !+[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v11);

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)oneUpAccessoryViewControllersManager:(id)a3 preventRevealInMomentActionForAssetReference:(id)a4
{
  return (-[PUOneUpViewController _options](self, "_options", a3, a4) >> 4) & 1;
}

- (BOOL)oneUpAccessoryViewControllersManagerRequestAccessoryDismissal:(id)a3
{
  -[PUOneUpViewController _setAccessoryVisible:](self, "_setAccessoryVisible:", 0);
  return 1;
}

- (void)oneUpAccessoryViewControllersManagerInvalidateAccessoryLayout:(id)a3
{
  -[PUOneUpViewController _invalidateInfoPanelLayoutAnimated:](self, "_invalidateInfoPanelLayoutAnimated:", 0);
}

- (void)navigateToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  PLOneUpGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("YES");
    if (!v10)
      v12 = CFSTR("NO");
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v12;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Navigating to assetDisplayDescriptor: %@, completionHandler?: %@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    if (-[PUOneUpViewController _canAttemptNavigationToAssetDisplayDescriptor:](self, "_canAttemptNavigationToAssetDisplayDescriptor:", v8))
    {
      -[PUOneUpViewController _performNavigationToAssetDisplayDescriptor:beforeDate:completionHandler:](self, "_performNavigationToAssetDisplayDescriptor:beforeDate:completionHandler:", v8, v9, v10);
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PUAssetDisplayDescriptorNavigationErrorDomain"), 1, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0, v13);

    }
  }
  else if (v10)
  {
    v10[2](v10, 1, 0);
  }

}

- (BOOL)_canAttemptNavigationToAssetDisplayDescriptor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController browsingSession](self, "browsingSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "assetsDataSource is unexpectedly nil. browsingSession: %@, viewModel: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  objc_msgSend(v4, "assetReference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "couldAssetReferenceAppear:", v12);
  PLOneUpGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_DEFAULT, "Can attempt navigation? %@, assetReference?: %@", (uint8_t *)&v18, 0x16u);

  }
  return v13;
}

- (void)_performNavigationToAssetDisplayDescriptor:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  PUAssetDisplayDescriptorNavigationRequest *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  PUAssetDisplayDescriptorNavigationRequest *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  PUAssetDisplayDescriptorNavigationRequest *v26;
  PUOneUpViewController *v27;
  id v28;
  double v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34[2];
  id location;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6149, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("beforeDate != nil"));

  }
  v12 = objc_alloc_init(PUAssetDisplayDescriptorNavigationRequest);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v13, "timeIntervalSinceReferenceDate");
  v17 = v15 - v16;
  objc_initWeak(&location, self);
  v18 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke;
  v30[3] = &unk_1E58A3170;
  v34[1] = *(id *)&v17;
  v19 = v10;
  v31 = v19;
  v20 = v13;
  v32 = v20;
  objc_copyWeak(v34, &location);
  v21 = v11;
  v33 = v21;
  -[PUAssetDisplayDescriptorNavigationRequest setCompletionHandler:](v12, "setCompletionHandler:", v30);
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_612;
  v25[3] = &unk_1E58AAA58;
  v22 = v12;
  v26 = v22;
  v27 = self;
  v23 = v9;
  v28 = v23;
  v29 = v17;
  -[PUAssetDisplayDescriptorNavigationRequest performChanges:](v22, "performChanges:", v25);

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);

}

- (void)_notifyTileIsReadyWithTimeOut:(double)a3 completionHandler:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  double v9;
  NSObject *v10;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, _QWORD))a4;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = fmin(a3, 0.5);
  PLOneUpGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134218242;
    v13 = v9;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Notifying tile is ready. maxTimeOut: %f, contentTileController: %@", (uint8_t *)&v12, 0x16u);
  }

  if (v9 <= 0.0 || v8 == 0)
  {
    if (v6)
      v6[2](v6, 0);
  }
  else
  {
    objc_msgSend(v8, "notifyWhenReadyForDisplayWithTimeOut:completionHandler:", v6, v9);
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__PUOneUpViewController_settings_changedValueForKey___block_invoke;
  v11[3] = &unk_1E58A3198;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "enumerateAllTileControllersUsingBlock:", v11);

}

- (void)purgeIfPossible
{
  void *v3;
  id v4;

  -[PUOneUpViewController _currentAccessoryViewController](self, "_currentAccessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EECC2E50))
  {
    -[PUOneUpViewController _currentAccessoryViewController](self, "_currentAccessoryViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  objc_msgSend(v4, "purgeIfPossible");
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  char v5;

  v3 = a3;
  -[PUOneUpViewController presentedViewController](self, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "prepareForDismissingForced:", v3);
  else
    v5 = 1;

  return v5;
}

- (CGRect)ppt_scrollableBoundsForTesting
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
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
  CGRect result;

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;

  -[PUOneUpViewController navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "toolbar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  objc_msgSend(v3, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v12, "convertRect:toView:", 0);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  objc_msgSend(v3, "adjustedContentInset");
  v23 = v7 + v22;
  v25 = v11 + v24;
  v26 = v14 + v21 + 24.0;
  v27 = v16 + v23;
  v28 = v18 - (v21 + 24.0 + v21 + 24.0);
  v29 = v20 - (v23 + v25);

  v30 = v26;
  v31 = v27;
  v32 = v28;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (UIView)ppt_scrubberView
{
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0D7B568], "isOneUpRefreshEnabled"))
    -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  else
    -[PUOneUpViewController _barsController](self, "_barsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ppt_scrubberView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v4;
}

- (PUOverOneUpPresentationSession)ppt_overOneUpPresentationSession
{
  return (PUOverOneUpPresentationSession *)-[PUOneUpViewController overOneUpPresentationSessionCreateIfNeeded:](self, "overOneUpPresentationSessionCreateIfNeeded:", 1);
}

- (void)ppt_playCurrentLivePhotoWithCompletionHandler:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6300, CFSTR("unexpected class %@"), v5);

  }
  objc_msgSend(v5, "ppt_playLivePhotoWithCompletionHandler:", v7);

}

- (void)ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout:(double)a3 handler:(id)a4
{
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id location[5];
  void (**v25)(id, uint64_t);
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, uint64_t))a4;
  if (v7)
  {
    -[PUOneUpViewController _tilingView](self, "_tilingView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutIfNeeded");

    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "currentAssetReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "asset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(v12, "needsDeferredProcessing");
    else
      v13 = 1;
    if (fmin(a3, 60.0) <= 0.0)
    {
      v7[2](v7, 1);
      PLOneUpGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Deferred Processing: zero timeout is not allowed.", buf, 2u);
      }

      goto LABEL_16;
    }
    -[PUOneUpViewController ppt_deferredProcessingCompletionBlock](self, "ppt_deferredProcessingCompletionBlock");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6316, CFSTR("Should not request notification, when a request is already on going"));

      if ((v13 & 1) != 0)
        goto LABEL_8;
    }
    else if ((v13 & 1) != 0)
    {
LABEL_8:
      -[PUOneUpViewController setPpt_deferredProcessingCompletionBlock:](self, "setPpt_deferredProcessingCompletionBlock:", v7);
      objc_msgSend(v12, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:](self, "setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:", v15);

      objc_initWeak(location, self);
      v16 = (void *)MEMORY[0x1E0C99E88];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_2;
      v22[3] = &unk_1E58AB2F8;
      objc_copyWeak(&v23, location);
      objc_msgSend(v16, "pu_scheduledTimerWithTimeInterval:repeats:block:", 0, v22, a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController setPpt_deferredProcessingWaitTimer:](self, "setPpt_deferredProcessingWaitTimer:", v17);

      PLOneUpGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v12, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v19;
        _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEBUG, "Deferred Processing (PPT): ===> DP callback installed for %@", buf, 0xCu);

      }
      objc_destroyWeak(&v23);
      objc_destroyWeak(location);
      goto LABEL_16;
    }
    location[1] = (id)MEMORY[0x1E0C809B0];
    location[2] = (id)3221225472;
    location[3] = __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke;
    location[4] = &unk_1E58ABAC8;
    v25 = v7;
    px_dispatch_on_main_queue();

LABEL_16:
  }

}

- (void)ppt_notifyWhenVKAnalysisIsReadyWithTimeout:(double)a3 handler:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "ppt_notifyWhenVKAnalysisIsReadyWithTimeout:completionHandler:", v8, a3);
  }
  else if (v8)
  {
    v8[2](v8, 0);
  }

}

- (id)pu_debugCurrentAsset
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAssetReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pu_debugCurrentViewModel
{
  void *v2;
  void *v3;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pu_debugCurrentPrivacyController
{
  void *v2;
  void *v3;

  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)pu_debugRows
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "assetViewModelForCurrentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1E0D83010];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__PUOneUpViewController_pu_debugRows__block_invoke;
    v23[3] = &unk_1E58A7F10;
    v24 = v8;
    objc_msgSend(v10, "pu_rowWithTitle:output:", CFSTR("Print Video Information"), v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  objc_msgSend(v6, "asset");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_8;
  }
  v13 = v12;

  if (v13)
  {
    objc_msgSend(v13, "px_coreDataBrowserURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D83010];
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __37__PUOneUpViewController_pu_debugRows__block_invoke_2;
    v21 = &unk_1E58A8568;
    v22 = v14;
    v12 = v14;
    objc_msgSend(v15, "pu_rowWithTitle:action:", CFSTR("Core Data Browser"), &v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16, v18, v19, v20, v21);

LABEL_8:
  }

  return v3;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PUPointDisplayLocationProvider *v16;
  void *v17;
  void *v18;
  id v19;
  char isKindOfClass;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  id (*v27)(uint64_t);
  void *v28;
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v32.receiver = self;
  v32.super_class = (Class)PUOneUpViewController;
  -[PUOneUpViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v32, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, v7, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[PUOneUpViewController _accessoryViewControllersManager](self, "_accessoryViewControllersManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessoryViewControllerForAssetReference:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v7, x, y);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v15);

  }
  v16 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v7, x, y);
  if (!-[PUOneUpViewController _isLocationFromProviderInAccessoryArea:](self, "_isLocationFromProviderInAccessoryArea:", v16))
  {
    objc_msgSend(v10, "asset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0D7B2E8]);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v21 = MEMORY[0x1E0C809B0];
    if ((isKindOfClass & 1) != 0)
    {
      v22 = *MEMORY[0x1E0D7C328];
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
      v30[3] = &unk_1E58A7F10;
      v31 = v17;
      objc_msgSend(v19, "registerItemForIdentifier:loadHandler:", v22, v30);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = *MEMORY[0x1E0D7C330];
      v25 = v21;
      v26 = 3221225472;
      v27 = __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2;
      v28 = &unk_1E58A7F10;
      v29 = v18;
      objc_msgSend(v19, "registerItemForIdentifier:loadHandler:", v23, &v25);

    }
    objc_msgSend(v12, "addObject:", v19, v25, v26, v27, v28);

  }
  return v12;
}

- (BOOL)oneUpChromeViewControllerIsDeviceUnlocked:(id)a3
{
  void *v4;
  uint64_t (**v5)(void);
  char v6;

  -[PUOneUpViewController unlockDeviceStatus](self, "unlockDeviceStatus", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[PUOneUpViewController unlockDeviceStatus](self, "unlockDeviceStatus");
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v6 = v5[2]();

  return v6;
}

- (void)oneUpChromeViewControllerRequestDeviceUnlock:(id)a3 for:(unint64_t)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  _QWORD v9[4];
  id v10[2];
  id location;

  v6 = a3;
  -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_initWeak(&location, self);
    -[PUOneUpViewController unlockDeviceHandlerWithActionType](self, "unlockDeviceHandlerWithActionType");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __74__PUOneUpViewController_oneUpChromeViewControllerRequestDeviceUnlock_for___block_invoke;
    v9[3] = &unk_1E58A31C0;
    objc_copyWeak(v10, &location);
    v10[1] = (id)a4;
    ((void (**)(_QWORD, _QWORD *, unint64_t))v8)[2](v8, v9, a4);

    objc_destroyWeak(v10);
    objc_destroyWeak(&location);
  }

}

- (void)_handleUnlockDeviceForActionType:(unint64_t)a3 success:(BOOL)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      PXUnlockDeviceActionTypeDescription();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Failed to unlock device to perform action: %@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[PUOneUpViewController chromeViewController](self, "chromeViewController", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateIsDeviceUnlocked");

  -[PUOneUpViewController chromeViewController](self, "chromeViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateIsDeviceUnlockedIfNeeded");

}

- (void)oneUpChromeViewControllerContentDecorationAdditionalInsetsDidChange:(id)a3
{
  -[PUOneUpViewController _invalidateLayout](self, "_invalidateLayout", a3);
  -[PUOneUpViewController _invalidateImageAnalysisActionInfoBottomPosition](self, "_invalidateImageAnalysisActionInfoBottomPosition");
  -[PUOneUpViewController _updateIfNeeded](self, "_updateIfNeeded");
}

- (id)oneUpChromeViewControllerFullSizeOneUpHostingView:(id)a3
{
  void *v3;
  void *v4;

  -[PUOneUpViewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)additionalContextMenuActionsForAttributionTileViewController:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PUOneUpViewController createMenuActionControllerForManagerIfNeeded:withPresentingViewController:regionOfInterestProvider:](self, "createMenuActionControllerForManagerIfNeeded:withPresentingViewController:regionOfInterestProvider:", 0, self, 0);
  -[PUOneUpViewController menuActionController](self, "menuActionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contextMenuActionIfAvailableForActionType:", 54);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "px_descriptionForAssertionMessage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6505, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("removeSuggestionMenuElement"), v14, v15);

    }
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") & 0xFFFFFFFFFFFFFFFDLL);
    v16[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v9;

  return v10;
}

- (void)cropButtonTileViewController:(id)a3 didSelectAspectRatio:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  PUQuickCropContext *v20;
  void *v21;
  id v22;

  height = a4.height;
  width = a4.width;
  -[PUOneUpViewController browsingSession](self, "browsingSession", a3);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D7B650], "signalDidQuickCrop");
    objc_msgSend(v7, "assetViewModelForAssetReference:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelTileTransform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (double)(unint64_t)objc_msgSend(v11, "pixelWidth");
    objc_msgSend(v8, "asset");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (double)(unint64_t)objc_msgSend(v13, "pixelHeight");

    -[PUOneUpViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;

    v20 = -[PUQuickCropContext initWithTileTransform:renderedImageSize:boundingSize:selectedAspectRatio:]([PUQuickCropContext alloc], "initWithTileTransform:renderedImageSize:boundingSize:selectedAspectRatio:", v10, v12, v14, v17, v19, width, height);
    -[PUOneUpViewController actionsController](self, "actionsController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "performQuickCropActionWithContext:", v20);

  }
}

- (double)livePhotoVideoPlaybackTileViewControllerExtraMinimumTouchDuration:(id)a3 locationProvider:(id)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;

  v5 = a4;
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowVisualIntelligence");

  v8 = 0.0;
  if (v7
    && -[PUOneUpViewController _isLocationFromProviderOverImageSubject:](self, "_isLocationFromProviderOverImageSubject:", v5))
  {
    if (-[PUOneUpViewController _isLocationFromProviderOverInteractiveItemExcludingImageSubject:](self, "_isLocationFromProviderOverInteractiveItemExcludingImageSubject:", v5))
    {
      v8 = 0.0;
    }
    else
    {
      v8 = 0.4;
    }
  }

  return v8;
}

- (BOOL)livePhotoVideoPlaybackTileViewControllerCanBeginPlaying:(id)a3 locationProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  PUPointDisplayLocationProvider *v24;

  v6 = a3;
  v7 = a4;
  -[PUOneUpViewController _interactivePinchDismissalController](self, "_interactivePinchDismissalController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isHandlingDismissalInteraction") & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    -[PUOneUpViewController _interactiveSwipeDismissalController](self, "_interactiveSwipeDismissalController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "isHandlingDismissalInteraction") ^ 1;

  }
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "allowVisualIntelligence"))
  {
    v12 = -[PUOneUpViewController _isLocationFromProvider:overTileOfKind:](self, "_isLocationFromProvider:overTileOfKind:", v7, CFSTR("PUTileKindItemContent"));

    if (v12)
    {
      +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "allowsVisualIntelligenceRemoveBackground");

      if (v14)
      {
        if (!v9
          || -[PUOneUpViewController _vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:](self, "_vkImageOverlayAllowsVKCToHandleLongPressGestureFromProvider:", v7))
        {
          goto LABEL_16;
        }
LABEL_15:
        if (-[PUOneUpViewController _isLocationFromProviderOverInteractiveItem:](self, "_isLocationFromProviderOverInteractiveItem:", v7))
        {
          goto LABEL_16;
        }
LABEL_17:
        v15 = !-[PUOneUpViewController _isLocationFromProviderOverControl:](self, "_isLocationFromProviderOverControl:", v7);
        goto LABEL_18;
      }
      if (v9)
        goto LABEL_15;
    }
    else if (v9)
    {
      goto LABEL_17;
    }
  }
  else
  {

    if ((v9 & 1) != 0)
      goto LABEL_17;
  }
LABEL_16:
  v15 = 0;
LABEL_18:
  objc_msgSend(v6, "browsingViewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "currentAssetReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "pxAssetReference");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "asset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = PXContentSyndicationShouldShowAttributionViewForAsset() ^ 1;
  LOBYTE(v20) = v19 & v15;
  if ((v19 & 1) == 0 && v15)
    LODWORD(v20) = !-[PUOneUpViewController _isLocationFromProviderOverSyndicationAttributionPill:](self, "_isLocationFromProviderOverSyndicationAttributionPill:", v7);
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationInView:", v21);
  v24 = -[PUPointDisplayLocationProvider initWithPoint:inCoordinateSpace:]([PUPointDisplayLocationProvider alloc], "initWithPoint:inCoordinateSpace:", v21, v22, v23);
  -[PUOneUpViewController setLastLivePhotoGestureLocationProvider:](self, "setLastLivePhotoGestureLocationProvider:", v24);

  return (char)v20;
}

- (id)livePhotoVideoPlaybackTileViewControllerDisplayTileTransform:(id)a3
{
  void *v4;
  void *v5;
  PUOneUpViewController *v6;
  PUOneUpViewController *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a3, "browsingViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen"))
  {
    -[PUOneUpViewController _mainOneUpForSecondScreenBrowser](self, "_mainOneUpForSecondScreenBrowser");
    v6 = (PUOneUpViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = self;
  }
  v7 = v6;
  -[PUOneUpViewController _tilingView](v6, "_tilingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PUTileKindUserTransform;
  objc_msgSend(v5, "dataSourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "displayTileTransform");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)livePhotoVideoPlaybackTileViewControllerCurrentImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "browsingViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSourceIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v7, CFSTR("PUTileKindItemContent"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (CGImage)livePhotoVideoPlaybackTileViewControllerCurrentGainMapImage:(id)a3 outGainMapAvailable:(BOOL *)a4 outGainMapValue:(float *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  CGImage *v15;
  int v16;
  int v17;
  char v18;

  objc_msgSend(a3, "browsingViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataSourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v11, CFSTR("PUTileKindItemContent"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    v15 = 0;
    v17 = 0;
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = v13;
  v15 = (CGImage *)objc_msgSend(v14, "gainMapImage");
  objc_msgSend(v14, "gainMapValue");
  v17 = v16;
  v18 = objc_msgSend(v14, "gainMapImageIsAvailable");

  if (a4)
LABEL_5:
    *a4 = v18;
LABEL_6:
  if (a5)
    *(_DWORD *)a5 = v17;

  return v15;
}

- (void)livePhotoVideoPlaybackTileViewControllerWillBeginPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double Current;
  double v10;
  double v11;
  void *v12;
  id v13;

  v4 = a3;
  -[PUOneUpViewController _setIrisPlaying:](self, "_setIrisPlaying:", 1);
  objc_msgSend(v4, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userWillPlayAssetInOneUp:", v13);

  -[PUOneUpViewController _currentAssetViewModel](self, "_currentAssetViewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v8, "focusValueAtZeroTimestamp");
  v11 = Current - v10;
  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "logUserWillPlayLivePhoto:firstTimeWaitDuration:", v13, v11);

  objc_msgSend(v8, "setFocusValueAtZeroTimestamp:", -1.0);
  -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
  -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");

}

- (void)livePhotoVideoPlaybackTileViewControllerDidEndPlaying:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v4 = a3;
  -[PUOneUpViewController _setIrisPlaying:](self, "_setIrisPlaying:", 0);
  -[PUOneUpViewController _setDidPlayCurrentLivePhoto:](self, "_setDidPlayCurrentLivePhoto:", 1);
  objc_msgSend(v4, "browsingViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[PUOneUpViewController aggregateDictionaryTracer](self, "aggregateDictionaryTracer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDidPlayAssetInOneUp:", v12);

  -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController lastLivePhotoGestureLocationProvider](self, "lastLivePhotoGestureLocationProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "imageSubjectExistsAtLocation:", v9);

  -[PUOneUpViewController eventTracker](self, "eventTracker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "logUserDidPlayLivePhoto:pressOnSubject:", v12, v10);

  -[PUOneUpViewController _invalidateTipPopovers](self, "_invalidateTipPopovers");
  -[PUOneUpViewController _updateTipPopoversIfNeeded](self, "_updateTipPopoversIfNeeded");
  -[PUOneUpViewController setLastLivePhotoGestureLocationProvider:](self, "setLastLivePhotoGestureLocationProvider:", 0);

}

- (void)_configureVitalityController
{
  uint64_t IsVideoAutoplayEnabled;
  void *v4;
  id v5;

  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCanDriveVitality:", -[PUOneUpViewController _isPresentedForSecondScreen](self, "_isPresentedForSecondScreen") ^ 1);
  if (-[PUOneUpViewController _isIrisPlaying](self, "_isIrisPlaying"))
    IsVideoAutoplayEnabled = 0;
  else
    IsVideoAutoplayEnabled = PXPreferencesIsVideoAutoplayEnabled();
  objc_msgSend(v5, "is_vitalityController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", IsVideoAutoplayEnabled);

}

- (BOOL)_isLocationFromProviderOverSyndicationAttributionPill:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  char v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  -[PUOneUpViewController _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6 + -0.5;
  v9 = v8 + -0.5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PUOneUpViewController__isLocationFromProviderOverSyndicationAttributionPill___block_invoke;
  v13[3] = &unk_1E58A2F28;
  v16 = v6;
  v17 = v8;
  v10 = v5;
  v14 = v10;
  v15 = &v18;
  objc_msgSend(v10, "enumeratePresentedTileControllersInRect:usingBlock:", v13, v7, v9, 1.0, 1.0);
  v11 = *((_BYTE *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)_informVKCOverlayToKickOffSubjectAnalyzing
{
  void *v3;
  int v4;
  id v5;

  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVisualIntelligenceRemoveBackground");

  if (v4)
  {
    -[PUOneUpViewController currentImageAnalysisInteraction](self, "currentImageAnalysisInteraction");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginImageSubjectAnalysisIfNecessary");

  }
}

- (id)_userTransformTileViewControllerForCurrentAsset
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PUOneUpViewController _presentedTileControllerForCurrentIndexPathWithKind:](self, "_presentedTileControllerForCurrentIndexPathWithKind:", PUTileKindUserTransform);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6688, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindUserTransform]"), v8, v9);

    }
  }
  return v4;
}

- (id)_cropButtonTileViewControllerForCurrentAsset
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;

  -[PUOneUpViewController _presentedTileControllerForCurrentIndexPathWithKind:](self, "_presentedTileControllerForCurrentIndexPathWithKind:", PUTileKindCropButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "px_descriptionForAssertionMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6692, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[self _presentedTileControllerForCurrentIndexPathWithKind:PUTileKindCropButton]"), v8, v9);

    }
  }
  return v4;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 7
    && (objc_msgSend(v4, "asset"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUOneUpViewController _assetDisplayDescriptorForAsset:](self, "_assetDisplayDescriptorForAsset:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v8) = -[PUOneUpViewController _canAttemptNavigationToAssetDisplayDescriptor:](self, "_canAttemptNavigationToAssetDisplayDescriptor:", v7);
    v8 = v8;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a5;
  objc_msgSend(a3, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _assetDisplayDescriptorForAsset:](self, "_assetDisplayDescriptorForAsset:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0D7B1B0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultNavigationTimeoutDuration");
  objc_msgSend(v10, "dateWithTimeIntervalSinceNow:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PUOneUpViewController_navigateToDestination_options_completionHandler___block_invoke;
  v14[3] = &unk_1E58AA6A8;
  v15 = v7;
  v13 = v7;
  -[PUOneUpViewController navigateToAssetDisplayDescriptor:beforeDate:completionHandler:](self, "navigateToAssetDisplayDescriptor:beforeDate:completionHandler:", v9, v12, v14);

}

- (id)_assetDisplayDescriptorForAsset:(id)a3
{
  id v3;
  PUAssetReference *v4;
  void *v5;

  v3 = a3;
  v4 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:]([PUAssetReference alloc], "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v3, 0, 0, 0);

  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadingStatusManager:(id)a3 didUpdateLoadingStatus:(id)a4 forItemIdentifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  PUEditingErrorPresentationController *v16;
  id v17;
  void *v18;
  PUEditingErrorPresentationController *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a5;
  v8 = a4;
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentAssetReference");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "asset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v12, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v23, "isEqual:", v14);

    if (v15)
    {
      v16 = [PUEditingErrorPresentationController alloc];
      v17 = v12;
      v18 = v17;
      if (v17)
      {
        if ((objc_msgSend(v17, "conformsToProtocol:", &unk_1EEC2D840) & 1) != 0)
        {
LABEL_5:
          v19 = -[PUEditingErrorPresentationController initWithError:forAsset:](v16, "initWithError:forAsset:", v13, v18);

          -[PUErrorPresentationController alertControllerWithCompletion:](v19, "alertControllerWithCompletion:", &__block_literal_global_816);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUOneUpViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v20, 1, 0);

          goto LABEL_6;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "px_descriptionForAssertionMessage");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6725, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("asset"), CFSTR("PUEditableAsset"), v22);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6725, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("asset"), CFSTR("PUEditableAsset"));
      }

      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)_invalidateUserActivity
{
  -[PUOneUpViewController _setNeedsUpdateUserActivity:](self, "_setNeedsUpdateUserActivity:", 1);
}

- (void)_updateUserActivityIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  if (-[PUOneUpViewController _needsUpdateUserActivity](self, "_needsUpdateUserActivity"))
  {
    -[PUOneUpViewController _setNeedsUpdateUserActivity:](self, "_setNeedsUpdateUserActivity:", 0);
    -[PUOneUpViewController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "isScrubbing") & 1) == 0)
    {
      objc_msgSend(v4, "currentAssetReference");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "asset");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        objc_msgSend(v6, "creationDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "timeIntervalSinceNow");
        v10 = v9;
        if (objc_msgSend(MEMORY[0x1E0CA5920], "px_allowsDonationsForCurrentProcess"))
        {
          v11 = v10 <= 0.0 && v10 >= -86400.0;
          if ((-[PUOneUpViewController _options](self, "_options") & 0x2000) != 0)
            v11 = 0;
        }
        else
        {
          v11 = 0;
        }
        v12 = (void *)MEMORY[0x1E0CA5920];
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke_2;
        v13[3] = &unk_1E58A3268;
        v13[4] = self;
        v14 = v7;
        v16 = v11;
        v15 = v5;
        objc_msgSend(v12, "px_requestActivityWithActivityType:titleProvider:completionBlock:", CFSTR("com.apple.mobileslideshow.oneUp"), &__block_literal_global_824, v13);

      }
    }

  }
}

- (UIActivityItemsConfigurationReading)activityItemsConfiguration
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (activityItemsConfiguration_onceToken != -1)
    dispatch_once(&activityItemsConfiguration_onceToken, &__block_literal_global_837);
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "contentPrivacyState") != 1)
  {
    objc_msgSend(v4, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;

      if (v9)
      {
        -[PUOneUpViewController boopableItemsProvider](self, "boopableItemsProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          v11 = (void *)activityItemsConfiguration_boopLog;
          if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            objc_msgSend(v9, "uuid");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v24 = v13;
            _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "Creating boopable item provider for 1up asset %{public}@", buf, 0xCu);

          }
          v14 = objc_alloc_init(MEMORY[0x1E0D7B238]);
          -[PUOneUpViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", v14);

          v22 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUOneUpViewController boopableItemsProvider](self, "boopableItemsProvider");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAssets:", v15);

          objc_msgSend(MEMORY[0x1E0D7CD30], "defaultManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "imageProviderForAsset:", v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[PUOneUpViewController boopableItemsProvider](self, "boopableItemsProvider");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setImagePreviewMediaProvider:", v18);

        }
        -[PUOneUpViewController boopableItemsProvider](self, "boopableItemsProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {

    }
    v20 = activityItemsConfiguration_boopLog;
    if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = 0;
      _os_log_error_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_ERROR, "Couldn't create an 1up boopable item provider because the current asset is not a PHAsset: %@", buf, 0xCu);
    }
    v9 = 0;
    v6 = 0;
    goto LABEL_19;
  }
  v5 = activityItemsConfiguration_boopLog;
  if (os_log_type_enabled((os_log_t)activityItemsConfiguration_boopLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Couldn't create an 1up boopable item provider because 1up is currently locked", buf, 2u);
  }
  v6 = 0;
LABEL_20:

  return (UIActivityItemsConfigurationReading *)v6;
}

- (void)_invalidateCachedBoopableItemProvider
{
  -[PUOneUpViewController setBoopableItemsProvider:](self, "setBoopableItemsProvider:", 0);
}

- (void)_xct_beginSignpostingForImageTileImageLoadingAndProcessing
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;
  uint8_t buf[16];

  -[PUOneUpViewController _xct_endSignpostingForImageTileImageLoadingAndProcessing](self, "_xct_endSignpostingForImageTileImageLoadingAndProcessing");
  PLOneUpGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", ", buf, 2u);
    }
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", ", buf, 2u);
    }
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp start.", buf, 2u);
    }

    if (objc_msgSend(v4, "isDisplayingFullQualityImage"))
    {
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", ", buf, 2u);
      }
      PLOneUpGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop.", buf, 2u);
      }
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99E88];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke;
      v20[3] = &unk_1E58AA0F8;
      v21 = v3;
      objc_msgSend(v11, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, 3.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController setXct_waitForFullQualityImageTimer:](self, "setXct_waitForFullQualityImageTimer:", v12);

      v6 = v21;
    }

    if (!objc_msgSend(v4, "isDeferredProcessingFinished"))
    {
      v13 = (void *)MEMORY[0x1E0C99E88];
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke_843;
      v18 = &unk_1E58AA0F8;
      v19 = v3;
      objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v15, 3.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUOneUpViewController setXct_waitForDeferredProcessingTimer:](self, "setXct_waitForDeferredProcessingTimer:", v14, v15, v16, v17, v18);

      v7 = v19;
      goto LABEL_23;
    }
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", ", buf, 2u);
    }
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v8 = "1Up signpost: timeToSharp (+ Deferred Processing done) stop.";
      v9 = v7;
      v10 = OS_LOG_TYPE_DEBUG;
      goto LABEL_21;
    }
  }
  else
  {
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "1Up signpost: no contentTileController or not image tile when 1Up did appear";
      v9 = v7;
      v10 = OS_LOG_TYPE_ERROR;
LABEL_21:
      _os_log_impl(&dword_1AAB61000, v9, v10, v8, buf, 2u);
    }
  }
LABEL_23:

}

- (void)_xct_endSignpostingForImageTileImageLoadingAndProcessing
{
  -[PUOneUpViewController _xct_endSignpostingForImageFullQuality](self, "_xct_endSignpostingForImageFullQuality");
  -[PUOneUpViewController _xct_endSignpostingForImageDeferredProcessing](self, "_xct_endSignpostingForImageDeferredProcessing");
}

- (void)_xct_endSignpostingForImageFullQuality
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[PUOneUpViewController xct_waitForFullQualityImageTimer](self, "xct_waitForFullQualityImageTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    -[PUOneUpViewController xct_waitForFullQualityImageTimer](self, "xct_waitForFullQualityImageTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", ", buf, 2u);
    }

    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop. (forced to end)", v8, 2u);
    }

  }
  -[PUOneUpViewController setXct_waitForFullQualityImageTimer:](self, "setXct_waitForFullQualityImageTimer:", 0);
}

- (void)_xct_endSignpostingForImageDeferredProcessing
{
  void *v3;
  int v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  -[PUOneUpViewController xct_waitForDeferredProcessingTimer](self, "xct_waitForDeferredProcessingTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    -[PUOneUpViewController xct_waitForDeferredProcessingTimer](self, "xct_waitForDeferredProcessingTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    PLOneUpGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", ", buf, 2u);
    }

    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp (+ Deferred Processing done) stop. (forced to end)", v8, 2u);
    }

  }
  -[PUOneUpViewController setXct_waitForDeferredProcessingTimer:](self, "setXct_waitForDeferredProcessingTimer:", 0);
}

- (BOOL)xct_isCurrentImageFullQuality
{
  void *v2;
  char v3;

  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "isDisplayingFullQualityImage");
  else
    v3 = 0;

  return v3;
}

- (BOOL)xct_isCurrentImageDeferredProcessingFinished
{
  void *v2;
  char v3;

  -[PUOneUpViewController _currentContentTileController](self, "_currentContentTileController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = objc_msgSend(v2, "isDeferredProcessingFinished");
  else
    v3 = 0;

  return v3;
}

- (void)appIntentsEnumerateAssetCollections:(id)a3 completionHandler:(id)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(id, id, uint64_t);

  v16 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6952, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetCollectionHandler"));

    if (v7)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v13)
      v16[2](v16, v13, 1);
  }
  else
  {

    v13 = 0;
  }
  v7[2](v7);

}

- (void)appIntentsEnumerateAssets:(id)a3 completionHandler:(id)a4
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(id, id, uint64_t);

  v16 = (void (**)(id, id, uint64_t))a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6965, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetHandler"));

    if (v7)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpViewController.m"), 6966, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_10;
LABEL_3:
  -[PUOneUpViewController browsingSession](self, "browsingSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentAssetReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v11;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;

    if (v13)
      v16[2](v16, v13, 1);
  }
  else
  {

    v13 = 0;
  }
  v7[2](v7);

}

- (PXFloatingCardPresentationController)cardPresentationController
{
  return self->cardPresentationController;
}

- (void)setCardPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->cardPresentationController, a3);
}

- (PUOneUpActionsController)actionsController
{
  return self->_actionsController;
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (id)unlockDeviceStatus
{
  return self->_unlockDeviceStatus;
}

- (id)unlockDeviceHandlerWithActionType
{
  return self->_unlockDeviceHandlerWithActionType;
}

- (id)editActivityCompletion
{
  return self->_editActivityCompletion;
}

- (void)setEditActivityCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1072);
}

- (unint64_t)_options
{
  return self->__options;
}

- (OS_dispatch_queue)preheatAssetsQueue
{
  return self->_preheatAssetsQueue;
}

- (BOOL)_needsUpdateSpec
{
  return self->__needsUpdateSpec;
}

- (void)_setNeedsUpdateSpec:(BOOL)a3
{
  self->__needsUpdateSpec = a3;
}

- (BOOL)_needsUpdateBarsController
{
  return self->__needsUpdateBarsController;
}

- (void)_setNeedsUpdateBarsController:(BOOL)a3
{
  self->__needsUpdateBarsController = a3;
}

- (BOOL)_needsUpdatePreloadInsets
{
  return self->__needsUpdatePreloadInsets;
}

- (void)_setNeedsUpdatePreloadInsets:(BOOL)a3
{
  self->__needsUpdatePreloadInsets = a3;
}

- (BOOL)_needsUpdateLayout
{
  return self->__needsUpdateLayout;
}

- (void)_setNeedsUpdateLayout:(BOOL)a3
{
  self->__needsUpdateLayout = a3;
}

- (BOOL)_needsUpdateEditMode
{
  return self->__needsUpdateEditMode;
}

- (void)_setNeedsUpdateEditMode:(BOOL)a3
{
  self->__needsUpdateEditMode = a3;
}

- (BOOL)_needsUpdateImageAnalysisActionInfoBottomPosition
{
  return self->__needsUpdateImageAnalysisActionInfoBottomPosition;
}

- (void)_setNeedsUpdateImageAnalysisActionInfoBottomPosition:(BOOL)a3
{
  self->__needsUpdateImageAnalysisActionInfoBottomPosition = a3;
}

- (BOOL)needsUpdateChromeViewController
{
  return self->_needsUpdateChromeViewController;
}

- (void)setNeedsUpdateChromeViewController:(BOOL)a3
{
  self->_needsUpdateChromeViewController = a3;
}

- (BOOL)_needsUpdatePreferredContentSize
{
  return self->__needsUpdatePreferredContentSize;
}

- (void)_setNeedsUpdatePreferredContentSize:(BOOL)a3
{
  self->__needsUpdatePreferredContentSize = a3;
}

- (BOOL)_needsUpdateVideoPlayer
{
  return self->__needsUpdateVideoPlayer;
}

- (void)_setNeedsUpdateVideoPlayer:(BOOL)a3
{
  self->__needsUpdateVideoPlayer = a3;
}

- (BOOL)_needsUpdateUserActivity
{
  return self->__needsUpdateUserActivity;
}

- (void)_setNeedsUpdateUserActivity:(BOOL)a3
{
  self->__needsUpdateUserActivity = a3;
}

- (BOOL)_needsUpdateAccessoryView
{
  return self->__needsUpdateAccessoryView;
}

- (void)_setNeedsUpdateAccessoryView:(BOOL)a3
{
  self->__needsUpdateAccessoryView = a3;
}

- (BOOL)_needsUpdateTipsPopover
{
  return self->__needsUpdateTipsPopover;
}

- (void)_setNeedsUpdateTipPopovers:(BOOL)a3
{
  self->__needsUpdateTipsPopover = a3;
}

- (BOOL)_hasShownRelevantTip
{
  return self->__hasShownRelevantTip;
}

- (void)_setHasShownRelevantTip:(BOOL)a3
{
  self->__hasShownRelevantTip = a3;
}

- (PUOneUpViewControllerSpec)_spec
{
  return self->__spec;
}

- (CGSize)_layoutReferenceSize
{
  double width;
  double height;
  CGSize result;

  width = self->__layoutReferenceSize.width;
  height = self->__layoutReferenceSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)_layoutSafeAreaInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->__layoutSafeAreaInsets.top;
  left = self->__layoutSafeAreaInsets.left;
  bottom = self->__layoutSafeAreaInsets.bottom;
  right = self->__layoutSafeAreaInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int)appearState
{
  return self->_appearState;
}

- (PUTilingView)_tilingView
{
  return self->__tilingView;
}

- (PUOneUpBarsController)_barsController
{
  return self->__barsController;
}

- (PUOneUpChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (PUOneUpGestureController)gestureController
{
  return self->_gestureController;
}

- (PUOneUpFeedbackController)feedbackController
{
  return self->_feedbackController;
}

- (PUInteractiveSwipeDismissalController)_interactiveSwipeDismissalController
{
  return self->__interactiveSwipeDismissalController;
}

- (PUInteractivePinchDismissalController)_interactivePinchDismissalController
{
  return self->__interactivePinchDismissalController;
}

- (PUDoubleTapZoomController)_doubleTapZoomController
{
  return self->__doubleTapZoomController;
}

- (PUOneUpGestureRecognizerCoordinator)_gestureRecognizerCoordinator
{
  return self->__gestureRecognizerCoordinator;
}

- (PUBrowsingBackgroundTileViewController)_backgroundTileViewController
{
  return self->__backgroundTileViewController;
}

- (void)_setBackgroundTileViewController:(id)a3
{
  objc_storeStrong((id *)&self->__backgroundTileViewController, a3);
}

- (PUReviewScreenScrubberBarTileViewController)_reviewScreenScrubberBarTileViewController
{
  return self->__reviewScreenScrubberBarTileViewController;
}

- (void)_setReviewScreenScrubberBarTileViewController:(id)a3
{
  objc_storeStrong((id *)&self->__reviewScreenScrubberBarTileViewController, a3);
}

- (PUReviewScreenControlBarTileViewController)_reviewScreenControlBarTileViewController
{
  return self->__reviewScreenControlBarTileViewController;
}

- (void)_setReviewScreenControlBarTileViewController:(id)a3
{
  objc_storeStrong((id *)&self->__reviewScreenControlBarTileViewController, a3);
}

- (PUReviewScreenTopBarTileViewController)_reviewScreenTopBarTileViewController
{
  return self->__reviewScreenTopBarTileViewController;
}

- (void)_setReviewScreenTopBarTileViewController:(id)a3
{
  objc_storeStrong((id *)&self->__reviewScreenTopBarTileViewController, a3);
}

- (int64_t)_windowInterfaceOrientation
{
  return self->__windowInterfaceOrientation;
}

- (PUOneUpViewController)_secondScreenBrowser
{
  return self->__secondScreenBrowser;
}

- (PUOneUpViewController)_mainOneUpForSecondScreenBrowser
{
  return (PUOneUpViewController *)objc_loadWeakRetained((id *)&self->__mainOneUpForSecondScreenBrowser);
}

- (void)_setMainOneUpForSecondScreenBrowser:(id)a3
{
  objc_storeWeak((id *)&self->__mainOneUpForSecondScreenBrowser, a3);
}

- (BOOL)_isPresentedForSecondScreen
{
  return self->__isPresentedForSecondScreen;
}

- (BOOL)_prefersCompactLayoutForSplitScreen
{
  return self->__prefersCompactLayoutForSplitScreen;
}

- (NSTimer)_chromeAutoHideTimer
{
  return self->__chromeAutoHideTimer;
}

- (void)_setChromeAutoHideTimer:(id)a3
{
  objc_storeStrong((id *)&self->__chromeAutoHideTimer, a3);
}

- (NSArray)_hiddenTilesController
{
  return self->__hiddenTilesController;
}

- (void)_setHiddenTilesController:(id)a3
{
  objc_storeStrong((id *)&self->__hiddenTilesController, a3);
}

- (void)_setTileKindsToHide:(id)a3
{
  objc_storeStrong((id *)&self->__tileKindsToHide, a3);
}

- (PUOverOneUpPresentationSession)_overOneUpPresentationSession
{
  return self->__overOneUpPresentationSession;
}

- (void)_setOverOneUpPresentationSession:(id)a3
{
  objc_storeStrong((id *)&self->__overOneUpPresentationSession, a3);
}

- (unint64_t)_initialActivity
{
  return self->__initialActivity;
}

- (void)_setInitialActivity:(unint64_t)a3
{
  self->__initialActivity = a3;
}

- (CGSize)_pendingViewTransitionSize
{
  double width;
  double height;
  CGSize result;

  width = self->__pendingViewTransitionSize.width;
  height = self->__pendingViewTransitionSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setPendingViewTransitionSize:(CGSize)a3
{
  self->__pendingViewTransitionSize = a3;
}

- (double)_preloadInsetsBasedOffViewWidth
{
  return self->__preloadInsetsBasedOffViewWidth;
}

- (void)_setPreloadInsetsBasedOffViewWidth:(double)a3
{
  self->__preloadInsetsBasedOffViewWidth = a3;
}

- (BOOL)_isIrisPlaying
{
  return self->__isIrisPlaying;
}

- (BOOL)_shouldDisableTransitionsUntilAppeared
{
  return self->__shouldDisableTransitionsUntilAppeared;
}

- (void)_setShouldDisableTransitionsUntilAppeared:(BOOL)a3
{
  self->__shouldDisableTransitionsUntilAppeared = a3;
}

- (PUParallaxComputer)_parallaxComputer
{
  return self->__parallaxComputer;
}

- (PUOneUpAccessoryViewControllersManager)_accessoryViewControllersManager
{
  return self->__accessoryViewControllersManager;
}

- (PUAccessoryVisibilityInteractionController)_accessoryVisibilityInteractionController
{
  return self->__accessoryVisibilityInteractionController;
}

- (BOOL)_shouldShowAccessoryAfterUnlock
{
  return self->__shouldShowAccessoryAfterUnlock;
}

- (void)_setShouldShowAccessoryAfterUnlock:(BOOL)a3
{
  self->__shouldShowAccessoryAfterUnlock = a3;
}

- (PULoadingIndicatorController)loadingIndicatorController
{
  return self->_loadingIndicatorController;
}

- (PUAggregateDictionaryTracer)aggregateDictionaryTracer
{
  return self->_aggregateDictionaryTracer;
}

- (PXUserEventTracker)userEventTracker
{
  return self->_userEventTracker;
}

- (PUOneUpEventTracker)eventTracker
{
  return self->_eventTracker;
}

- (BOOL)_didPlayCurrentLivePhoto
{
  return self->__didPlayCurrentLivePhoto;
}

- (void)_setDidPlayCurrentLivePhoto:(BOOL)a3
{
  self->__didPlayCurrentLivePhoto = a3;
}

- (NSUserActivity)siriActionActivity
{
  return self->_siriActionActivity;
}

- (void)setSiriActionActivity:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionActivity, a3);
}

- (PXBoopableItemsProvider)boopableItemsProvider
{
  return self->_boopableItemsProvider;
}

- (void)setBoopableItemsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_boopableItemsProvider, a3);
}

- (BOOL)_prefersHomeIndicatorHidden
{
  return self->__prefersHomeIndicatorHidden;
}

- (PUBrowsingOneUpVisibilityHelper)browsingOneUpVisibilityHelper
{
  return self->_browsingOneUpVisibilityHelper;
}

- (void)setBrowsingOneUpVisibilityHelper:(id)a3
{
  objc_storeStrong((id *)&self->_browsingOneUpVisibilityHelper, a3);
}

- (NSMutableSet)activeVideoTileControllers
{
  return self->_activeVideoTileControllers;
}

- (NSString)presentedTipID
{
  return self->_presentedTipID;
}

- (void)setPresentedTipID:(id)a3
{
  objc_storeStrong((id *)&self->_presentedTipID, a3);
}

- (id)tipDismissedCompletion
{
  return self->_tipDismissedCompletion;
}

- (void)setTipDismissedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (int64_t)detailsBecameVisibleSignPost
{
  return self->_detailsBecameVisibleSignPost;
}

- (void)setDetailsBecameVisibleSignPost:(int64_t)a3
{
  self->_detailsBecameVisibleSignPost = a3;
}

- (PUOneUpVisualImageAnalyzingController)visualImageAnalyzingController
{
  return self->_visualImageAnalyzingController;
}

- (PUAccessoryContentViewController)currentFloatingInfoPanelAccessoryViewController
{
  return (PUAccessoryContentViewController *)objc_loadWeakRetained((id *)&self->_currentFloatingInfoPanelAccessoryViewController);
}

- (void)setCurrentFloatingInfoPanelAccessoryViewController:(id)a3
{
  objc_storeWeak((id *)&self->_currentFloatingInfoPanelAccessoryViewController, a3);
}

- (NSString)uuidOfAssetPresentedInFloatingInfoPanel
{
  return self->_uuidOfAssetPresentedInFloatingInfoPanel;
}

- (void)setUuidOfAssetPresentedInFloatingInfoPanel:(id)a3
{
  objc_storeStrong((id *)&self->_uuidOfAssetPresentedInFloatingInfoPanel, a3);
}

- (unint64_t)touchingGestureRecognizerStateBeginID
{
  return self->_touchingGestureRecognizerStateBeginID;
}

- (void)setTouchingGestureRecognizerStateBeginID:(unint64_t)a3
{
  self->_touchingGestureRecognizerStateBeginID = a3;
}

- (PUDisplayLocationProvider)lastLivePhotoGestureLocationProvider
{
  return self->_lastLivePhotoGestureLocationProvider;
}

- (void)setLastLivePhotoGestureLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_lastLivePhotoGestureLocationProvider, a3);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (BOOL)wasChromeVisibleBeforeZoomIn
{
  return self->_wasChromeVisibleBeforeZoomIn;
}

- (void)setWasChromeVisibleBeforeZoomIn:(BOOL)a3
{
  self->_wasChromeVisibleBeforeZoomIn = a3;
}

- (NSString)ppt_assetUUIDNeedsDeferredProcessingFinishNotification
{
  return self->_ppt_assetUUIDNeedsDeferredProcessingFinishNotification;
}

- (void)setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:(id)a3
{
  objc_storeStrong((id *)&self->_ppt_assetUUIDNeedsDeferredProcessingFinishNotification, a3);
}

- (NSTimer)ppt_deferredProcessingWaitTimer
{
  return self->_ppt_deferredProcessingWaitTimer;
}

- (void)setPpt_deferredProcessingWaitTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ppt_deferredProcessingWaitTimer, a3);
}

- (id)ppt_deferredProcessingCompletionBlock
{
  return self->_ppt_deferredProcessingCompletionBlock;
}

- (void)setPpt_deferredProcessingCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1456);
}

- (NSTimer)xct_waitForFullQualityImageTimer
{
  return self->_xct_waitForFullQualityImageTimer;
}

- (void)setXct_waitForFullQualityImageTimer:(id)a3
{
  objc_storeStrong((id *)&self->_xct_waitForFullQualityImageTimer, a3);
}

- (NSTimer)xct_waitForDeferredProcessingTimer
{
  return self->_xct_waitForDeferredProcessingTimer;
}

- (void)setXct_waitForDeferredProcessingTimer:(id)a3
{
  objc_storeStrong((id *)&self->_xct_waitForDeferredProcessingTimer, a3);
}

- (BOOL)appearanceTransitionAnimationsDisabled
{
  return self->_appearanceTransitionAnimationsDisabled;
}

- (BOOL)allowsPreviewActions
{
  return self->_allowsPreviewActions;
}

- (void)setAllowsPreviewActions:(BOOL)a3
{
  self->_allowsPreviewActions = a3;
}

- (int64_t)presentationOrigin
{
  return self->_presentationOrigin;
}

- (PUMenuActionController)menuActionController
{
  return self->_menuActionController;
}

- (NSArray)textsToHighlight
{
  return self->_textsToHighlight;
}

- (void)setTextsToHighlight:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (NSArray)assetUUIDsAllowedToHighlightText
{
  return self->_assetUUIDsAllowedToHighlightText;
}

- (void)setAssetUUIDsAllowedToHighlightText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1496);
}

- (CGSize)preferredContentSizeOverride
{
  double width;
  double height;
  CGSize result;

  width = self->_preferredContentSizeOverride.width;
  height = self->_preferredContentSizeOverride.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPreferredContentSizeOverride:(CGSize)a3
{
  self->_preferredContentSizeOverride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUUIDsAllowedToHighlightText, 0);
  objc_storeStrong((id *)&self->_textsToHighlight, 0);
  objc_storeStrong((id *)&self->_xct_waitForDeferredProcessingTimer, 0);
  objc_storeStrong((id *)&self->_xct_waitForFullQualityImageTimer, 0);
  objc_storeStrong(&self->_ppt_deferredProcessingCompletionBlock, 0);
  objc_storeStrong((id *)&self->_ppt_deferredProcessingWaitTimer, 0);
  objc_storeStrong((id *)&self->_ppt_assetUUIDNeedsDeferredProcessingFinishNotification, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_lastLivePhotoGestureLocationProvider, 0);
  objc_storeStrong((id *)&self->_uuidOfAssetPresentedInFloatingInfoPanel, 0);
  objc_destroyWeak((id *)&self->_currentFloatingInfoPanelAccessoryViewController);
  objc_storeStrong((id *)&self->_visualImageAnalyzingController, 0);
  objc_storeStrong(&self->_tipDismissedCompletion, 0);
  objc_storeStrong((id *)&self->_presentedTipID, 0);
  objc_storeStrong((id *)&self->_activeVideoTileControllers, 0);
  objc_storeStrong((id *)&self->_browsingOneUpVisibilityHelper, 0);
  objc_storeStrong((id *)&self->_boopableItemsProvider, 0);
  objc_storeStrong((id *)&self->_siriActionActivity, 0);
  objc_storeStrong((id *)&self->_eventTracker, 0);
  objc_storeStrong((id *)&self->_userEventTracker, 0);
  objc_storeStrong((id *)&self->_aggregateDictionaryTracer, 0);
  objc_storeStrong((id *)&self->_loadingIndicatorController, 0);
  objc_storeStrong((id *)&self->__accessoryVisibilityInteractionController, 0);
  objc_storeStrong((id *)&self->__accessoryViewControllersManager, 0);
  objc_storeStrong((id *)&self->__parallaxComputer, 0);
  objc_storeStrong((id *)&self->__overOneUpPresentationSession, 0);
  objc_storeStrong((id *)&self->__tileKindsToHide, 0);
  objc_storeStrong((id *)&self->__hiddenTilesController, 0);
  objc_storeStrong((id *)&self->__chromeAutoHideTimer, 0);
  objc_destroyWeak((id *)&self->__mainOneUpForSecondScreenBrowser);
  objc_storeStrong((id *)&self->__secondScreenBrowser, 0);
  objc_storeStrong((id *)&self->__reviewScreenTopBarTileViewController, 0);
  objc_storeStrong((id *)&self->__reviewScreenControlBarTileViewController, 0);
  objc_storeStrong((id *)&self->__reviewScreenScrubberBarTileViewController, 0);
  objc_storeStrong((id *)&self->__backgroundTileViewController, 0);
  objc_storeStrong((id *)&self->__gestureRecognizerCoordinator, 0);
  objc_storeStrong((id *)&self->__doubleTapZoomController, 0);
  objc_storeStrong((id *)&self->__interactivePinchDismissalController, 0);
  objc_storeStrong((id *)&self->__interactiveSwipeDismissalController, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_gestureController, 0);
  objc_storeStrong((id *)&self->_chromeViewController, 0);
  objc_storeStrong((id *)&self->__barsController, 0);
  objc_storeStrong((id *)&self->__tilingView, 0);
  objc_storeStrong((id *)&self->__spec, 0);
  objc_storeStrong((id *)&self->_preheatAssetsQueue, 0);
  objc_storeStrong(&self->_editActivityCompletion, 0);
  objc_storeStrong(&self->_unlockDeviceHandlerWithActionType, 0);
  objc_storeStrong(&self->_unlockDeviceStatus, 0);
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_actionsController, 0);
  objc_storeStrong((id *)&self->_assetActionManager, 0);
  objc_storeStrong((id *)&self->cardPresentationController, 0);
  objc_storeStrong((id *)&self->_menuActionController, 0);
  objc_storeStrong((id *)&self->_scrubbingIdentifier, 0);
}

void __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharp", ", buf, 2u);
  }
  PLOneUpGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp stop. (time's up)", v6, 2u);
  }

}

void __83__PUOneUpViewController__xct_beginSignpostingForImageTileImageLoadingAndProcessing__block_invoke_843(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "timeToSharpAndDeferredProcessingFinished", ", buf, 2u);
  }
  PLOneUpGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "1Up signpost: timeToSharp (+ Deferred Processing done) stop. (time's up)", v6, 2u);
  }

}

void __51__PUOneUpViewController_activityItemsConfiguration__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "BoopActivityItems");
  v1 = (void *)activityItemsConfiguration_boopLog;
  activityItemsConfiguration_boopLog = (uint64_t)v0;

}

void __52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
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
  id v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[6];

  v27[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "browsingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentAssetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(v3, "setEligibleForSearch:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v3, "_setEligibleForPrediction:", *(unsigned __int8 *)(a1 + 56));
    objc_msgSend(v3, "setEligibleForHandoff:", 0);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    objc_msgSend(v3, "setRequiredUserInfoKeys:", v8);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v3, "px_setPersistentIdentifierFromAsset:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 48), "assetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v9;
      v10 = v9;
      v26[0] = CFSTR("selectedUUIDs");
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v11;
      v26[1] = CFSTR("collectionType");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "assetCollectionType"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v12;
      v26[2] = CFSTR("collectionSubtype");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "assetCollectionSubtype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27[2] = v13;
      v26[3] = CFSTR("albumUUID");
      objc_msgSend(v10, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27[3] = v14;
      v26[4] = CFSTR("timestamp");
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[4] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUserInfo:", v16);

      if (!PLIsMobileSlideShow())
      {
        v9 = v21;
        goto LABEL_10;
      }
      objc_msgSend(*(id *)(a1 + 32), "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "window");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "windowScene");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setUserActivity:", v3);

      v9 = v21;
    }
    else
    {
      v23 = CFSTR("selectedUUIDs");
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUserInfo:", v18);
    }

LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "setSiriActionActivity:", v3);
    objc_msgSend(v3, "becomeCurrent");

  }
}

NSString *__52__PUOneUpViewController__updateUserActivityIfNeeded__block_invoke()
{
  return +[PUOneUpViewController oneUpActivityTitle](PUOneUpViewController, "oneUpActivityTitle");
}

uint64_t __73__PUOneUpViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    v3 = 1;
  else
    v3 = 2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v2, v3);
}

void __79__PUOneUpViewController__isLocationFromProviderOverSyndicationAttributionPill___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "reuseIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PUSyndicationAttributionTileReuseIdentifier"));

  v8 = v11;
  if (v7)
  {
    objc_msgSend(v11, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v9, "hitTest:withEvent:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v10 != v9)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;

    v8 = v11;
  }

}

void __74__PUOneUpViewController_oneUpChromeViewControllerRequestDeviceUnlock_for___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUnlockDeviceForActionType:success:", *(_QWORD *)(a1 + 40), a2);

}

id __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __79__PUOneUpViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __37__PUOneUpViewController_pu_debugRows__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D75130], "debugDescriptionForPlayerItem:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Video Playback Information\n\n%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __37__PUOneUpViewController_pu_debugRows__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);

}

uint64_t __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "ppt_deferredProcessingCompletionBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setPpt_deferredProcessingCompletionBlock:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setPpt_deferredProcessingWaitTimer:", 0);

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "setPpt_assetUUIDNeedsDeferredProcessingFinishNotification:", 0);

  PLOneUpGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEBUG, "Deferred Processing (PPT): !!! time out. Has to debug why this happens.", buf, 2u);
  }

  if (v3)
  {
    v8 = v3;
    px_dispatch_on_main_queue();

  }
}

uint64_t __105__PUOneUpViewController_ppt_notifyWhenDeferredProcessingIsDoneAndFinalImageDisplayedWithTimeout_handler___block_invoke_628(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __53__PUOneUpViewController_settings_changedValueForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EED7AD88))
    objc_msgSend(v3, "settings:changedValueForKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  double v5;
  NSObject *v6;
  double v7;
  NSObject *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  double v18;
  const __CFString *v19;
  double v20;
  double v21;
  id WeakRetained;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  double v28;
  id v29;
  char v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = COERCE_DOUBLE(a3);
  PLOneUpGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(double *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v32 = v7;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Completed navigationRequest with timeOut: %f", buf, 0xCu);
  }

  if ((a2 & 1) == 0)
  {
    PLOneUpGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v5;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Navigation unsuccessful: %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v12 = v11;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v14 = v12 - v13;
  if (v10 >= v14)
    v15 = v14;
  else
    v15 = v10;
  PLOneUpGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v18 = v17;
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v19 = CFSTR("NO");
    v21 = v18 - v20;
    if (v15 < 0.0)
      v19 = CFSTR("YES");
    *(_DWORD *)buf = 134218242;
    v32 = v21;
    v33 = 2112;
    v34 = v19;
    _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Navigation request took %f seconds to complete. Timed Out: %@.", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_610;
  v26[3] = &unk_1E58A9000;
  v27 = v9;
  v23 = *(id *)(a1 + 48);
  v30 = a2;
  v28 = v5;
  v29 = v23;
  v24 = *(id *)&v5;
  v25 = v9;
  objc_msgSend(WeakRetained, "_notifyTileIsReadyWithTimeOut:completionHandler:", v26, v15);

}

uint64_t __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_612(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "browsingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewModel:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "assetReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTargetAssetReference:", v6);

  objc_msgSend(*(id *)(a1 + 48), "modifiedAfterDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "modifiedAfterDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTargetModificationDate:", v9);

  }
  v10 = *(void **)(a1 + 48);
  if (v10)
  {
    objc_msgSend(v10, "videoSeekTime");
    if ((v18 & 0x100000000) != 0)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(void **)(a1 + 48);
      if (v12)
      {
        objc_msgSend(v12, "videoSeekTime");
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
      }
      objc_msgSend(v11, "setTargetSeekTime:", &v14);
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
  }
  return objc_msgSend(*(id *)(a1 + 32), "setTimeOut:", *(double *)(a1 + 56), v14, v15, v16, v17, v18, v19);
}

uint64_t __97__PUOneUpViewController__performNavigationToAssetDisplayDescriptor_beforeDate_completionHandler___block_invoke_610(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLOneUpGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v9 = 134217984;
    v10 = v6;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "Tile readiness notification took %f.", (uint8_t *)&v9, 0xCu);

  }
  if ((a2 & 1) == 0)
  {
    PLOneUpGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Tile readiness notification failed.", (uint8_t *)&v9, 2u);
    }

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 1, CFSTR("Starting 1-Up asset transition"));
}

void __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(void);
  void *v4;
  __int128 v5;
  _OWORD v6[3];
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "animationBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "animationBlock");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
  v4 = *(void **)(a1 + 40);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_3;
  v7[3] = &unk_1E58ABD10;
  v8 = v4;
  objc_msgSend(v8, "performChanges:", v7);
  if (*(_BYTE *)(a1 + 160))
  {
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  else
  {
    v5 = *(_OWORD *)(a1 + 128);
    v6[0] = *(_OWORD *)(a1 + 112);
    v6[1] = v5;
    v6[2] = *(_OWORD *)(a1 + 144);
    objc_msgSend(*(id *)(a1 + 48), "setTransform:", v6);
  }
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 56), "applyLayoutInfo:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 72), "_unhideOverlays");

}

void __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  PUTileReattachmentContext *v5;

  v5 = objc_alloc_init(PUTileReattachmentContext);
  -[PUTileReattachmentContext setTransitioningOverOneUp:](v5, "setTransitioningOverOneUp:", 1);
  objc_msgSend(*(id *)(a1 + 32), "reattachTileControllers:withContext:", *(_QWORD *)(a1 + 40), v5);
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "stopSuppressingAnimatedUpdatesWithReason:", CFSTR("one-up transition"));
  objc_msgSend(*(id *)(a1 + 64), "viewControllerTransitionDidEnd");
  +[PUInterfaceManager endDisablingUserInteraction:](PUInterfaceManager, "endDisablingUserInteraction:", *(_QWORD *)(a1 + 72));
  v4 = *(_QWORD *)(a1 + 80);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);

}

uint64_t __95__PUOneUpViewController_oneUpAssetTransition_animateTransitionWithContext_duration_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 1, 5);
}

void __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setSnapshotView:", v3);
  objc_msgSend(v4, "setAsset:", *(_QWORD *)(a1 + 40));

}

void __93__PUOneUpViewController_oneUpAssetTransition_requestTransitionContextWithCompletion_options___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayer:", v4);

}

uint64_t __63__PUOneUpViewController_overOneUpPresentationSessionDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPresentingOverOneUp:", 0);
}

uint64_t __65__PUOneUpViewController_overOneUpPresentationSession_didPresent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPresentingOverOneUp:", 1);
}

uint64_t __99__PUOneUpViewController_accessoryVisibilityInteractionController_setAccessoryVisible_changeReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsResetVisualImageInteraction:reason:", 1, 1);
}

uint64_t __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_setAccessoryVisible:", 1);
  return result;
}

uint64_t __72__PUOneUpViewController_accessoryVisibilityInteractionControllerDidEnd___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsResetVisualImageInteraction:reason:", 1, 2);
}

uint64_t __66__PUOneUpViewController_playButtonTileViewControllerDidTapButton___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isPlaybackDesired");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setDesiredPlayState:reason:", 2, CFSTR("Play button tile was tapped"));
  }
  else
  {
    if (objc_msgSend(v3, "isAtEnd"))
      objc_msgSend(*(id *)(a1 + 32), "rewindExistingPlayer");
    objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 4, CFSTR("Play button tile was tapped"));
    objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_hideChromeOnPlayButtonTapWithItemIsNowPlaying:buttonIsOverlayed:", v2 ^ 1u, 1);
}

uint64_t __84__PUOneUpViewController_userTransformTileViewController_didChangeIsUserInteracting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUserTransformingTile:", *(unsigned __int8 *)(a1 + 40));
}

void __56__PUOneUpViewController_oneUpBarsControllerDidTapTitle___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a2)
  {
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "titleTapAction");

    if (v4 == 2)
    {
      objc_msgSend(*(id *)(a1 + 32), "_toggleDetailsVisibility");
    }
    else if (v4 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "browsingSession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentAssetReference");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_accessoryViewControllersManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accessoryViewControllerForAssetReference:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v8, 1);

    }
  }
}

uint64_t __93__PUOneUpViewController_interactiveDismissalControllerChangedIsHandlingDismissalInteraction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsBeingDismissed:", objc_msgSend(*(id *)(a1 + 40), "isHandlingDismissalInteraction"));
}

void __66__PUOneUpViewController_layout_accessoryOffsetForItemAtIndexPath___block_invoke()
{
  void *v0;
  void *v1;

  +[PUSoftClampValueFilter scrollViewFilter](PUSoftClampValueFilter, "scrollViewFilter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setMinimumValue:", 0.0);
  objc_msgSend(v0, "setMaximumValue:", INFINITY);
  v1 = (void *)layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter;
  layout_accessoryOffsetForItemAtIndexPath__verticalOffsetFilter = (uint64_t)v0;

}

void __85__PUOneUpViewController_imageAnalysisInteractionIsDrivingLivePhotoPlaybackDidChange___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)analysisControllers;
  analysisControllers = v0;

}

uint64_t __54__PUOneUpViewController_scrollViewDidEndDecelerating___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrolling:", 0);
}

uint64_t __65__PUOneUpViewController_scrollViewDidEndDragging_willDecelerate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrolling:", 0);
}

uint64_t __53__PUOneUpViewController_scrollViewWillBeginDragging___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsScrolling:", 1);
}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didUpdateDisplayedContent");

}

uint64_t __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingViewModel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAssetReference:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setActionManager:", *(_QWORD *)(a1 + 56));
}

uint64_t __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBrowsingViewModel:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAssetReference:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setActionManager:", *(_QWORD *)(a1 + 56));
}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentErrorFromLoadingIndicator:", v3);

}

void __80__PUOneUpViewController_tilingView_tileControllerWithIndexPath_kind_dataSource___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a2, a3, 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  PULocalizedString(CFSTR("PUPHOTOBROWSER_FAILURE_OK_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v6);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v8, 1, 0);

}

uint64_t __71__PUOneUpViewController__handleDeferredProcessingFinishedForAssetUUID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __92__PUOneUpViewController__assetsToPrefetchUsingDataSource_startingAt_count_reverseDirection___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "assetAtIndexPath:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v6);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 <= (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a3 = 1;

}

void __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  uint64_t *v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__53200;
  v13 = __Block_byref_object_dispose__53201;
  v14 = 0;
  v3 = MEMORY[0x1E0C809B0];
  v4 = 3221225472;
  v5 = __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke_2;
  v6 = &unk_1E58A3040;
  v7 = &v9;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_sync(MEMORY[0x1E0C80D38], &v3);
  v1 = (void *)MEMORY[0x1E0D7B7A0];
  objc_msgSend((id)v10[5], "allObjects", v3, v4, v5, v6, v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "photosDetailsContextPreheatForAssets:", v2);

  objc_destroyWeak(&v8);
  _Block_object_dispose(&v9, 8);

}

void __70__PUOneUpViewController__preheatAdjacentAssetsForPhotosDetailsContext__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_assetsToPrefetch");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _BOOL4 v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  BOOL v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  char v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v68 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
  if (v68)
  {
    v67 = *(_QWORD *)v73;
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v66 = v6;
    do
    {
      for (i = 0; i != v68; ++i)
      {
        if (*(_QWORD *)v73 != v67)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "focusValueChanged"))
        {
          objc_msgSend(v11, "focusValue");
          if (fabs(v12) >= 1.0)
          {
            objc_msgSend(v11, "modelTileTransform");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13 || *(unsigned __int8 *)(a1 + 104) != objc_msgSend(v11, "isAccessoryViewVisible"))
            {

LABEL_15:
              v69[0] = MEMORY[0x1E0C809B0];
              v69[1] = 3221225472;
              v69[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_2;
              v69[3] = &unk_1E58AAD68;
              v70 = v11;
              v71 = *(_BYTE *)(a1 + 104);
              objc_msgSend(v70, "performChanges:", v69);

              goto LABEL_16;
            }
            if (!*(_BYTE *)(a1 + 104))
            {
              objc_msgSend(v11, "contentOffset");
              if (v15 != v7 || v14 != v8)
                goto LABEL_15;
            }
          }
        }
LABEL_16:
        if (objc_msgSend(v10, "badgeInfoChanged"))
        {
          objc_msgSend(v5, "indexPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "invalidateBadgeSizeForItemAtIndexPath:", v16);

        }
        if (objc_msgSend(v10, "modelTileTransformChanged"))
        {
          objc_msgSend(v5, "indexPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "invalidateModelTileTransformForItemAtIndexPath:", v17);
          objc_msgSend(v11, "modelTileTransform");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "hasUserZoomedIn"))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
            if (objc_msgSend(v18, "hasUserZoomedIn"))
            {
              +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "allowFullsizeJPEGDisplay");

              v6 = v66;
              if (v20)
              {
                v21 = *(void **)(a1 + 48);
                objc_msgSend(v5, "dataSourceIdentifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v17, CFSTR("PUTileKindItemContent"), v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();

                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  objc_msgSend(v23, "setShouldUseFullSizeImageData:", 1);

                v6 = v66;
              }
            }
          }

        }
        if (objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 56))
          && (objc_msgSend(*(id *)(a1 + 32), "isAnimatingPresentationSize") & 1) == 0
          && objc_msgSend(*(id *)(a1 + 64), "appearState") == 2)
        {
          if (objc_msgSend(v10, "isZoomedInChanged"))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v11, "isZoomedIn");
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v11, "isZoomedIn") ^ 1;
          }
          if (objc_msgSend(v11, "isZoomedIn")
            && objc_msgSend(v11, "isUserTransformingTile"))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
          }
        }
        if (objc_msgSend(v10, "contentOffsetChanged"))
        {
          v24 = objc_msgSend(v11, "lastContentOffsetChangeReason");
          v25 = (objc_msgSend(v11, "isLastAccessoryViewVisibilityChangeReasonUserAction") & 1) != 0
             || objc_msgSend(v11, "lastAccessoryViewVisibilityChangeReason") == 3;
          objc_msgSend(v11, "focusValue");
          if (fabs(v26) < 1.0 && (v24 == 3 || v24 == 1 && v25))
          {
            objc_msgSend(v11, "contentOffsetOverrideFactor");
            if (v27 < 1.0)
              v28 = 2;
            else
              v28 = 0;
          }
          else
          {
            v28 = 0;
          }
          objc_msgSend(v5, "indexPath");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "invalidateContentOffsetForItemAtIndexPath:withOptions:", v29, v28);

        }
        if (objc_msgSend(v10, "accessoryViewVisibilityChanged"))
        {
          objc_msgSend(v5, "indexPath");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "asset");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = +[PUCommentsViewController canShowCommentsForAsset:](PUCommentsViewController, "canShowCommentsForAsset:", v31);

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0D7B7C8], "sharedInstance");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "captionWidgetEnableDirectAttachToMaster");

            LODWORD(v33) = objc_msgSend(v11, "isAccessoryViewVisible");
            v35 = objc_msgSend(v11, "isLastAccessoryViewVisibilityChangeReasonUserAction");
            v36 = 5;
            if ((v33 & v34) != 0)
              v36 = 1;
            if (v35)
              v37 = v36;
            else
              v37 = 1;
          }
          else
          {
            v37 = 0;
          }
          objc_msgSend(*(id *)(a1 + 40), "invalidateAccessoryForItemAtIndexPath:withOptions:", v30, v37);
          objc_msgSend(*(id *)(a1 + 64), "_invalidateAccessoryView");
          objc_msgSend(*(id *)(a1 + 64), "_invalidateTipPopovers");

        }
        if (objc_msgSend(v10, "isVisualSearchCardShowingChanged")
          && objc_msgSend(*(id *)(a1 + 64), "_prefersFloatingInfoPanel")
          && objc_msgSend(v11, "isAccessoryViewVisible"))
        {
          v38 = objc_msgSend(v11, "isVisualSearchCardShowing");
          v39 = *(void **)(a1 + 64);
          if (v38)
            objc_msgSend(v39, "_dismissFloatingInfoPanelAnimated:", 1);
          else
            objc_msgSend(v39, "_presentFloatingInfoPanelAnimated:", 1);
        }
        if (objc_msgSend(v10, "visualImageAnalysisChanged"))
          objc_msgSend(*(id *)(a1 + 64), "_invalidateTipPopovers");
        objc_msgSend(v10, "videoPlayerChange");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "desiredPlayStateDidChange");

        if (v41)
        {
          objc_msgSend(v5, "indexPath");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "invalidateVideoPlaceholderForItemAtIndexPath:", v42);

        }
        objc_msgSend(v10, "videoPlayerChange");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v43, "playStateDidChange"))
        {

        }
        else
        {
          objc_msgSend(v10, "videoPlayerChange");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "isPlayableDidChange");

          if (!v45)
            goto LABEL_73;
        }
        objc_msgSend(v11, "videoPlayer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "playState") != 5)
          goto LABEL_72;
        objc_msgSend(v11, "videoPlayer");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "isPlayable"))
        {

LABEL_72:
          goto LABEL_73;
        }
        objc_msgSend(v11, "videoPlayer");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = objc_msgSend(v54, "desiredPlayState");

        if (v55 == 1)
          objc_msgSend(*(id *)(a1 + 64), "_presentAlertForUnplayableAssetReference:", v5);
LABEL_73:
        objc_msgSend(v10, "videoPlayerChange");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v48, "isActivatedDidChange");

        if (v49)
          objc_msgSend(*(id *)(a1 + 64), "_invalidateBarsControllers");
        if (objc_msgSend(v10, "isInEditModeChanged"))
        {
          objc_msgSend(*(id *)(a1 + 64), "_invalidateBarsControllers");
          objc_msgSend(*(id *)(a1 + 64), "_invalidateEditMode");
        }
        if (objc_msgSend(v10, "saveStateChanged"))
        {
          objc_msgSend(*(id *)(a1 + 32), "currentAssetReference");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "isEqual:", v50))
          {
            v51 = objc_msgSend(*(id *)(a1 + 64), "_isPresentedForSecondScreen");

            if ((v51 & 1) != 0)
              goto LABEL_90;
            objc_msgSend(*(id *)(a1 + 32), "assetViewModelForAssetReference:", v5);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 64), "_currentContentTileController");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if (v52)
            {
              v53 = objc_msgSend(v50, "saveState");
              objc_msgSend(v52, "setShouldPreserveCurrentContent:", v53 == 1);
              if ((unint64_t)(v53 - 2) >= 3)
              {
                v56 = v53 == 1;
                v6 = v66;
                if (v56)
                  objc_msgSend(v50, "willUpdateDisplayedContent");
              }
              else
              {
                objc_msgSend(v50, "didUpdateDisplayedContent");
                v6 = v66;
              }
            }

          }
        }
LABEL_90:
        if (objc_msgSend(v10, "importStateChanged"))
        {
          v57 = *(void **)(a1 + 40);
          objc_msgSend(v5, "indexPath");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "invalidateProgressIndicatorForItemAtIndexPath:", v58);

        }
        objc_msgSend(*(id *)(a1 + 64), "loadingIndicatorController");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "shouldInvalidateLoadingIndicatorForAssetViewModelChange:", v10);

        if (v60)
        {
          v61 = *(void **)(a1 + 40);
          objc_msgSend(v5, "indexPath");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "invalidateLoadingIndicatorForItemAtIndexPath:", v62);

        }
        if (objc_msgSend(v10, "PPT_isDeferredProcessingDoneAndFinalImageDisplayedChanged"))
        {
          v63 = *(void **)(a1 + 64);
          objc_msgSend(v5, "asset");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "uuid");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "_handleDeferredProcessingFinishedForAssetUUID:", v65);

        }
      }
      v68 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v72, v76, 16);
    }
    while (v68);
  }

}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _BOOL4 v4;
  char v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isChromeVisible"))
  {
    v2 = *(void **)(a1 + 32);
    +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = PUShouldAutoHideChrome(v2, objc_msgSend(v3, "chromeAutoHideBehaviorOnZoom"));

    if ((objc_msgSend(*(id *)(a1 + 40), "_options") & 0x4000) == 0)
    {
      v5 = objc_msgSend(*(id *)(a1 + 32), "isInSelectionMode");
      if (v4 && (v5 & 1) == 0 && !objc_msgSend(*(id *)(a1 + 32), "videoOverlayPlayState"))
      {
        v6 = *(void **)(a1 + 32);
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __45__PUOneUpViewController_viewModel_didChange___block_invoke_4;
        v7[3] = &unk_1E58ABD10;
        v8 = v6;
        objc_msgSend(v8, "performChanges:", v7);

      }
    }
  }
}

void __45__PUOneUpViewController_viewModel_didChange___block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateFloatingInfoPanelIfNeeded");

}

uint64_t __45__PUOneUpViewController_viewModel_didChange___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 0, 2);
}

uint64_t __45__PUOneUpViewController_viewModel_didChange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewVisible:", *(unsigned __int8 *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "resetContentOffset");
  return result;
}

uint64_t __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureAdoptedTileController:", a2);
}

uint64_t __139__PUOneUpViewController_tilingViewControllerTransition_adoptTilingView_fromEndPoint_isCancelingTransition_animationSetupCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", *(_QWORD *)(a1 + 40), CFSTR("OneUp Presentation"), 0, 0.0);
}

uint64_t __85__PUOneUpViewController_tilingViewControllerTransition_abandonTilingView_toEndPoint___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_abandonTileController:", a2);
}

void __76__PUOneUpViewController__userTransformTileControllerAtLocationFromProvider___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __70__PUOneUpViewController_oneUpActionsControllerToggleChromeVisibility___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", objc_msgSend(*(id *)(a1 + 32), "isChromeVisible") ^ 1, 1);
}

void __36__PUOneUpViewController_px_HDRFocus__block_invoke(uint64_t a1, void *a2, double a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;

  if (a2)
  {
    v5 = (void *)MEMORY[0x1E0D7B500];
    objc_msgSend(a2, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "HDRValueForAsset:", v6);
    v8 = v7;

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(double *)(v9 + 24);
    if (v10 < v8 * a3)
      v10 = v8 * a3;
    *(double *)(v9 + 24) = v10;
  }
}

uint64_t __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", 1);
}

uint64_t __59__PUOneUpViewController__setAccessoryVisible_changeReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAccessoryViewsDefaultVisibility:changeReason:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "videoPlayer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDesiredPlayState:reason:", 1, CFSTR("Pausing to display alert for unplayable asset"));

}

uint64_t __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 1, 4);
}

void __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = (void *)MEMORY[0x1E0D7B1F8];
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_4;
  v4[3] = &unk_1E58A2F78;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  objc_msgSend(v2, "presentAlertForAsset:type:alertControllerPresenter:completionHandler:", v3, 1, v4, 0);

  objc_destroyWeak(&v5);
}

uint64_t __66__PUOneUpViewController__presentAlertForUnplayableAssetReference___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v3, 1, 0);

  return 1;
}

void __79__PUOneUpViewController__beginVKSubjectAnalyzingWithGestureRecognizer_beginID___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  uint64_t v4;
  id v5;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "touchingGestureRecognizerStateBeginID") == *(_QWORD *)(a1 + 48))
  {
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = objc_msgSend(v3, "state");

    if (v4 != 1)
      return;
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v5, "_informVKCOverlayToKickOffSubjectAnalyzing");

    WeakRetained = objc_loadWeakRetained(v2);
    objc_msgSend(WeakRetained, "_dismissAnyPresentedTip");
  }

}

void __60__PUOneUpViewController__isLocationFromProviderOverControl___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v11;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v11, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v8, "hitTest:withEvent:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
    else if (v9 && v9 != v8)
    {
      objc_msgSend(v11, "reuseIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("PUProgressIndicatorTileReuseIdentifier")) & 1) != 0
        || objc_msgSend(v10, "isEqualToString:", CFSTR("PUSyndicationAttributionTileReuseIdentifier")))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a4 = 1;
      }

    }
    v7 = v11;
  }

}

void __64__PUOneUpViewController__isLocationFromProviderInAccessoryArea___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  char v8;
  char v9;
  void *v10;
  char isKindOfClass;
  int v12;
  id v13;

  v13 = a2;
  objc_msgSend(a3, "tileKind");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PUTileKindItemContent"));

  if ((v8 & 1) != 0)
  {
    v9 = 0;
    v10 = v13;
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
    *a4 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v10 = v13;
  if ((isKindOfClass & 1) != 0)
  {
    v12 = objc_msgSend(v13, "isLocationFromProviderInContentArea:", *(_QWORD *)(a1 + 32));
    v10 = v13;
    if (v12)
    {
      v9 = 1;
      goto LABEL_6;
    }
  }
LABEL_7:

}

uint64_t __51__PUOneUpViewController__handleZoomOutCurrentAsset__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 1, 2);
}

uint64_t __62__PUOneUpViewController__browsingVideoPlayerDidPlayToEndTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", 1);
}

uint64_t __90__PUOneUpViewController__hideChromeOnPlayButtonTapWithItemIsNowPlaying_buttonIsOverlayed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:context:", 0, 4, *(_QWORD *)(a1 + 40));
}

uint64_t __51__PUOneUpViewController__chromeAutoHideTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 0, 3);
}

void __48__PUOneUpViewController__updateReviewScreenBars__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUseVerticalControlLayout:", v3);
  objc_msgSend(v4, "setShouldBarsCounterrotate:", *(unsigned __int8 *)(a1 + 33));

}

void __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "browsingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privacyController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "performUserAuthenticationIfNeededFromContext:", v4);

}

uint64_t __74__PUOneUpViewController__updateContentUnavailableConfigurationUsingState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:", 1, 7);
}

uint64_t __66__PUOneUpViewController__updateViewModelWithCurrentScrollPosition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAssetReference:transitionProgress:transitionDriverIdentifier:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 968), 0, *(double *)(a1 + 56));
}

uint64_t __51__PUOneUpViewController__updateVideoPlayerIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 3, CFSTR("1-Up view controller triggering looping video playback"));
}

uint64_t __44__PUOneUpViewController__updateSpecIfNeeded__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentedForPreview:", *(unsigned __int8 *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setPresentedForSecondScreen:", *(unsigned __int8 *)(a1 + 81));
  objc_msgSend(*(id *)(a1 + 32), "setSecondScreenSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:", *(unsigned __int8 *)(a1 + 82));
  objc_msgSend(*(id *)(a1 + 32), "setContentLocked:", *(unsigned __int8 *)(a1 + 83));
  objc_msgSend(*(id *)(a1 + 32), "setShowingPlayPauseButtonInBars:", *(unsigned __int8 *)(a1 + 84));
  objc_msgSend(*(id *)(a1 + 32), "setTraitCollection:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setPrefersCompactLayoutForSplitScreen:", *(unsigned __int8 *)(a1 + 85));
  if (*(double *)(a1 + 64) != *MEMORY[0x1E0C9D820] || *(double *)(a1 + 72) != *(double *)(MEMORY[0x1E0C9D820] + 8))
    objc_msgSend(*(id *)(a1 + 32), "setLayoutReferenceSize:");
  return objc_msgSend(*(id *)(a1 + 32), "setShouldDisplayPeopleRow:", *(unsigned __int8 *)(a1 + 86));
}

uint64_t __41__PUOneUpViewController__setIrisPlaying___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsIrisPlaying:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __41__PUOneUpViewController__setIrisPlaying___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setChromeVisible:changeReason:context:", 0, 6, *(_QWORD *)(a1 + 40));
}

uint64_t __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 1);
}

uint64_t __56__PUOneUpViewController__isPresentedForPreviewDidChange__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsPresentedForPreview:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __49__PUOneUpViewController__setLayoutReferenceSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSecondScreenSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentationSize:", 1);
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 104), *(double *)(a1 + 112));
  objc_msgSend(*(id *)(a1 + 48), "bounds");
  objc_msgSend(*(id *)(a1 + 40), "setBounds:");
  objc_msgSend(*(id *)(a1 + 48), "center");
  objc_msgSend(*(id *)(a1 + 40), "setCenter:");
  CGAffineTransformMakeRotation(&v8, -*(double *)(a1 + 120));
  v2 = *(void **)(a1 + 40);
  v7 = v8;
  objc_msgSend(v2, "setTransform:", &v7);
  objc_msgSend(*(id *)(a1 + 64), "bounds");
  objc_msgSend(*(id *)(a1 + 56), "setBounds:");
  objc_msgSend(*(id *)(a1 + 64), "center");
  objc_msgSend(*(id *)(a1 + 56), "setCenter:");
  CGAffineTransformMakeRotation(&v6, -*(double *)(a1 + 120));
  v3 = *(void **)(a1 + 56);
  v5 = v6;
  return objc_msgSend(v3, "setTransform:", &v5);
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setZRotation:", *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56) * 0.5, *(double *)(a1 + 64) * 0.5);
  return objc_msgSend(*(id *)(a1 + 40), "_invalidateInfoPanelLayoutAnimated:", 1);
}

void __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
  v3[3] = &unk_1E58ABD10;
  v4 = v2;
  objc_msgSend(v4, "performChanges:", v3);
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 48), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 56), "setHidden:", 0);
  objc_msgSend(*(id *)(a1 + 64), "_invalidateTipPopovers");
  objc_msgSend(*(id *)(a1 + 64), "_updateTipPopoversIfNeeded");

}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateInfoPanelLayoutAnimated:", 1);
}

void __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8;
  v4[3] = &unk_1E58ABD10;
  v5 = v2;
  objc_msgSend(v5, "performChanges:", v4);
  objc_msgSend(*(id *)(a1 + 40), "_barsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateContentGuideInsets");

  objc_msgSend(*(id *)(a1 + 40), "_invalidateTipPopovers");
  objc_msgSend(*(id *)(a1 + 40), "_invalidateLayout");
  objc_msgSend(*(id *)(a1 + 40), "_updateTipPopoversIfNeeded");

}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentationSize:", 0);
}

uint64_t __76__PUOneUpViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentationSize:", 0);
}

uint64_t __50__PUOneUpViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setHorizontalSizeClass:", PXUserInterfaceSizeClassFromUITraitCollection());
}

uint64_t __42__PUOneUpViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowed:forReason:", 0, CFSTR("OneUpVisibility"));
}

void __39__PUOneUpViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentationSize:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldAutoplayOnAppear") && !*(_BYTE *)(a1 + 56))
  {

    goto LABEL_6;
  }
  v3 = *(unsigned __int8 *)(a1 + 57);

  if (v3)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "videoPlayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__PUOneUpViewController_viewDidAppear___block_invoke_2;
    v7[3] = &unk_1E58ABD10;
    v8 = v4;
    v5 = v4;
    objc_msgSend(v5, "performChanges:", v7);
    objc_msgSend(*(id *)(a1 + 48), "irisPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playPreviewHintWhenReady");

  }
}

void __39__PUOneUpViewController_viewDidAppear___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "px_descendantViewControllerWithClass:", objc_opt_class());
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ppt_setEditIsReadyNotificationBlock:", *(_QWORD *)(a1 + 40));

}

uint64_t __39__PUOneUpViewController_viewDidAppear___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDesiredPlayState:reason:", 4, CFSTR("1-Up configured to auto-play on appearance."));
}

void __40__PUOneUpViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id *v5;
  id v6;
  uint64_t *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "setVideoContentAllowed:forReason:", 1, CFSTR("OneUpVisibility"));
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingPresentationSize:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "shouldAutoplayOnAppear"))
  {

    goto LABEL_5;
  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "_isPresentedForSecondScreen");

  if ((v3 & 1) != 0)
  {
LABEL_5:
    v8 = *(void **)(a1 + 48);
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __40__PUOneUpViewController_viewWillAppear___block_invoke_3;
    v12 = &unk_1E58ABD10;
    v5 = &v13;
    v6 = v8;
    v13 = v6;
    v7 = &v9;
    goto LABEL_6;
  }
  v4 = *(void **)(a1 + 48);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __40__PUOneUpViewController_viewWillAppear___block_invoke_2;
  v17 = &unk_1E58ABD10;
  v5 = &v18;
  v6 = v4;
  v18 = v6;
  v7 = &v14;
LABEL_6:
  objc_msgSend(v6, "performChanges:", v7, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);

}

void __40__PUOneUpViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "player");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "prepareForHintWhenReady");

}

uint64_t __40__PUOneUpViewController_viewWillAppear___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setActivated:", 0);
}

+ (NSString)oneUpActivityTitle
{
  if (oneUpActivityTitle_onceToken != -1)
    dispatch_once(&oneUpActivityTitle_onceToken, &__block_literal_global_817);
  return (NSString *)(id)oneUpActivityTitle_oneUpActivityTitle;
}

void __43__PUOneUpViewController_oneUpActivityTitle__block_invoke()
{
  uint64_t v0;
  void *v1;

  px_deferredLocalizedStringWithFormat();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)oneUpActivityTitle_oneUpActivityTitle;
  oneUpActivityTitle_oneUpActivityTitle = v0;

}

@end
