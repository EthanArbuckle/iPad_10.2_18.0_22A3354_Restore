@implementation TUIFeedViewController

- (TUIFeedViewController)initWithFeedContent:(id)a3 manager:(id)a4 factory:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIFeedViewController *v12;
  id v13;
  NSObject *v14;
  TUIVisibilityController *visibilityController;
  void *v16;
  uint64_t v17;
  TUIFeedViewState *restoreViewState;
  TUIFeedLayoutController *v19;
  TUIFeedView *feedView;
  double v21;
  TUIFeedAutoScrollController *v22;
  NSHashTable *heightLayoutConditions;
  _TUIFeedViewControllerQueueContext *v24;
  TUIFeedAutoScrollController *autoScrollController;
  TUIHostingController *v26;
  TUIRenderReferenceOverrideProvider *renderOverrideProvider;
  TUILinkEntityController *v28;
  void *v29;
  TUILinkEntityController *v30;
  TUIImpressionController *impressionController;
  void *v32;
  void *v33;
  void *v34;
  TUIRenderReferenceOverrideProvider *v35;
  void *uniqueIdentifier;
  void *v37;
  id v38;
  uint8_t buf[4];
  TUIVisibilityController *v41;
  __int16 v42;
  TUIFeedViewController *v43;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[TUIFeedViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v12)
  {
    v12->_visibilityController = (TUIVisibilityController *)TUIFeedIdentifierGenerate();
    v13 = TUIDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      visibilityController = v12->_visibilityController;
      *(_DWORD *)buf = 134218242;
      v41 = visibilityController;
      v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "[fid:%lu] created view controller %@", buf, 0x16u);
    }

    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_hiddenPriority, a3);
    v12->_contentNeedsUpdate = v9 != 0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v12->_hiddenPriority, "currentStackName"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "instanceForObserver:", v12));
    restoreViewState = v12->_restoreViewState;
    v12->_restoreViewState = (TUIFeedViewState *)v17;

    *(_DWORD *)&v12->_viewDidDisappearWasCalled = 1061158912;
    v12->_visiblePriority = 0.25;
    *((_BYTE *)&v12->_flags + 2) = 1;
    v12->_viewTransitionSyncTimeoutDuration = 1.0;
    v12->_contextMenuConfigurationProvider = (TUIContextMenuConfigurationProviding *)0x3FF0000000000000;
    v12->_liveResizeOptions = 1;
    objc_storeStrong((id *)&v12->_templateFactory, a4);
    objc_storeStrong((id *)&v12->_triggerStateManager, a5);
    v19 = -[TUIFeedLayoutController initWithFeedId:environment:factory:manager:renderMode:]([TUIFeedLayoutController alloc], "initWithFeedId:environment:factory:manager:renderMode:", v12->_visibilityController, 0, v12->_triggerStateManager, v10, 0);
    feedView = v12->_feedView;
    v12->_feedView = (TUIFeedView *)v19;

    *(float *)&v21 = v12->_visiblePriority;
    -[TUIFeedView setPriority:](v12->_feedView, "setPriority:", v21);
    -[TUIFeedView setDelegate:](v12->_feedView, "setDelegate:", v12);
    -[TUIFeedView setActionHandlerDelegate:](v12->_feedView, "setActionHandlerDelegate:", v12);
    v22 = -[TUIFeedAutoScrollController initWithDelegate:]([TUIFeedAutoScrollController alloc], "initWithDelegate:", v12);
    heightLayoutConditions = v12->_heightLayoutConditions;
    v12->_heightLayoutConditions = (NSHashTable *)v22;

    v24 = objc_alloc_init(_TUIFeedViewControllerQueueContext);
    autoScrollController = v12->_autoScrollController;
    v12->_autoScrollController = (TUIFeedAutoScrollController *)v24;

    v26 = -[TUIHostingController initWithFeedId:delegate:viewController:manager:]([TUIHostingController alloc], "initWithFeedId:delegate:viewController:manager:", v12->_visibilityController, v12, v12, v12->_templateFactory);
    renderOverrideProvider = v12->_renderOverrideProvider;
    v12->_renderOverrideProvider = (TUIRenderReferenceOverrideProvider *)v26;

    v28 = [TUILinkEntityController alloc];
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVisibilityController sharedQueue](TUIVisibilityController, "sharedQueue"));
    v30 = -[TUILinkEntityController initWithFeedId:queue:viewResolver:](v28, "initWithFeedId:queue:viewResolver:", v12->_visibilityController, v29, v12);
    impressionController = v12->_impressionController;
    v12->_impressionController = (TUIImpressionController *)v30;

    *(CGSize *)&v12->_savedContentOffset.y = CGSizeZero;
    *(CGPoint *)&v12->_debugDelegate = CGPointZero;
    -[TUIFeedViewController _setupControllers](v12, "_setupControllers");
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    LODWORD(v29) = objc_msgSend(v32, "BOOLForKey:", CFSTR("TUIRecordStats"));

    if ((_DWORD)v29)
      -[TUIFeedView setStatsMode:](v12->_feedView, "setStatsMode:", 31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", v12, "setNeedsEnvironmentUpdate", kAXSApplicationAccessibilityEnabledNotification, 0);
    objc_msgSend(v33, "addObserver:selector:name:object:", v12, "_applicationWillEnterForegroundNotification:", UIApplicationWillEnterForegroundNotification, 0);
    objc_msgSend(v33, "addObserver:selector:name:object:", v12, "setNeedsEnvironmentUpdate", NSCurrentLocaleDidChangeNotification, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v34, "addObserver:forKeyPath:options:context:", v12, CFSTR("TUIForceFallbackFont"), 0, off_2C9BE0);

    v35 = objc_alloc_init(TUIRenderReferenceOverrideProvider);
    uniqueIdentifier = (void *)v12->_feedId.uniqueIdentifier;
    v12->_feedId.uniqueIdentifier = (unint64_t)v35;

    objc_msgSend((id)v12->_feedId.uniqueIdentifier, "setDelegate:", v12);
    -[TUIFeedViewController setContainmentSupport:](v12, "setContainmentSupport:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection tui_allAPITraits](UITraitCollection, "tui_allAPITraits"));
    v38 = -[TUIFeedViewController registerForTraitChanges:withTarget:action:](v12, "registerForTraitChanges:withTarget:action:", v37, v12, "tui_traitCollectionDidChange:previousTraitCollection:");

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[TUIFeedViewController _teardownControllers](self, "_teardownControllers");
  -[TUIFeedView teardown](self->_feedView, "teardown");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("TUIForceFallbackFont"), off_2C9BE0);

  v5.receiver = self;
  v5.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController dealloc](&v5, "dealloc");
}

- (void)setLiveResizeOptions:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  *(_QWORD *)&self->_viewAppearingingSyncTimeoutDuration = a3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;
  _QWORD v7[5];

  if (off_2C9BE0 == a6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10BB94;
    v7[3] = &unk_23D938;
    v7[4] = self;
    TUIDispatchAsyncViaRunLoop((uint64_t)v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)TUIFeedViewController;
    -[TUIFeedViewController observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_content);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_content, obj);
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector(obj, "feedViewController:willTransitionToContentHeight:") & 1;
    if ((objc_opt_respondsToSelector(obj, "feedViewController:willTransitionToLayoutState:") & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFD | v6;
    if ((objc_opt_respondsToSelector(obj, "feedViewController:didTransitionToLayoutState:") & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xFB | v7;
    if ((objc_opt_respondsToSelector(obj, "feedViewControllerAllContentReady:") & 1) != 0)
      v8 = 8;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xF7 | v8;
    if ((objc_opt_respondsToSelector(obj, "feedViewControllerInitialContentReady:") & 1) != 0)
      v9 = 16;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xEF | v9;
    if ((objc_opt_respondsToSelector(obj, "feedViewControllerIsConsideredVisible:") & 1) != 0)
      v10 = 32;
    else
      v10 = 0;
    *(_BYTE *)&self->_delegateFlags = *(_BYTE *)&self->_delegateFlags & 0xDF | v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v12 = objc_msgSend(v11, "BOOLForKey:", CFSTR("TUIRecordStats"));

    if ((v12 & 1) == 0 && (objc_opt_respondsToSelector(obj, "statsModeForFeedViewController:") & 1) != 0)
      -[TUIFeedView setStatsMode:](self->_feedView, "setStatsMode:", objc_msgSend(obj, "statsModeForFeedViewController:", self));
    if ((objc_opt_respondsToSelector(obj, "feedViewControllerInteractionBuilder:") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "feedViewControllerInteractionBuilder:", self));
      objc_storeWeak((id *)&self->_interactionBuilder, v13);

    }
    else
    {
      objc_storeWeak((id *)&self->_interactionBuilder, 0);
    }
    v5 = obj;
  }

}

- (TUIInteractionBuilding)interactionBuilder
{
  return (TUIInteractionBuilding *)objc_loadWeakRetained((id *)&self->_interactionBuilder);
}

- (TUIFeedViewControllerDelegate)delegate
{
  return (TUIFeedViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_content);
}

- (void)_setupControllers
{
  TUIVisibilityController *v3;
  void *v4;
  TUIEmbeddedScrollViewCoordinator *v5;
  TUIEmbeddedScrollViewCoordinator *embeddedScrollViewCoordinator;
  TUIAuxiliaryViewState *v7;
  TUIAuxiliaryViewState *auxiliaryViewState;
  TUIVisibilityTracker *v9;
  TUIVisibilityTracker *impressionTracker;
  TUIImpressionController *v11;
  TUIAuxiliaryViewState *v12;
  void *v13;
  TUIImpressionController *v14;
  void *options;
  TUITriggerStateManager *v16;
  TUIDropController *dropController;
  TUIImagePrefetchController *v18;
  void *v19;
  TUILinkEntityController *v20;
  TUILinkEntityController *linkEntityController;
  TUIDropController *v22;
  TUIImagePrefetchController *imagePrefetchController;
  TUIEmbeddedScrollViewCoordinator *v24;
  TUIPagedScrollableControlling *pagedScrollableController;

  v3 = [TUIVisibilityController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVisibilityController sharedQueue](TUIVisibilityController, "sharedQueue"));
  v5 = -[TUIVisibilityController initWithRootProvider:queue:](v3, "initWithRootProvider:queue:", self, v4);
  embeddedScrollViewCoordinator = self->_embeddedScrollViewCoordinator;
  self->_embeddedScrollViewCoordinator = v5;

  v7 = (TUIAuxiliaryViewState *)-[TUIEmbeddedScrollViewCoordinator newTrackerWithDefaultThreshold:block:](self->_embeddedScrollViewCoordinator, "newTrackerWithDefaultThreshold:block:", &stru_241980, 0.5);
  auxiliaryViewState = self->_auxiliaryViewState;
  self->_auxiliaryViewState = v7;

  v9 = (TUIVisibilityTracker *)-[TUIEmbeddedScrollViewCoordinator newTrackerWithDefaultThreshold:block:](self->_embeddedScrollViewCoordinator, "newTrackerWithDefaultThreshold:block:", &stru_2419A0, 0.0);
  impressionTracker = self->_impressionTracker;
  self->_impressionTracker = v9;

  v11 = [TUIImpressionController alloc];
  v12 = self->_auxiliaryViewState;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUIVisibilityController sharedQueue](TUIVisibilityController, "sharedQueue"));
  v14 = -[TUIImpressionController initWithFeedId:delegate:tracker:queue:](v11, "initWithFeedId:delegate:tracker:queue:", self->_visibilityController, self, v12, v13);
  options = (void *)self->_options;
  self->_options = (unint64_t)v14;

  -[TUIImpressionController attachToTracker:](self->_impressionController, "attachToTracker:", self->_impressionTracker);
  v16 = objc_alloc_init(TUITriggerStateManager);
  dropController = self->_dropController;
  self->_dropController = (TUIDropController *)v16;

  v18 = [TUIImagePrefetchController alloc];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory resourceLoader](self->_templateFactory, "resourceLoader"));
  v20 = -[TUIImagePrefetchController initWithResourceLoader:](v18, "initWithResourceLoader:", v19);
  linkEntityController = self->_linkEntityController;
  self->_linkEntityController = v20;

  -[TUILinkEntityController setDelegate:](self->_linkEntityController, "setDelegate:", self);
  v22 = objc_alloc_init(TUIDropController);
  imagePrefetchController = self->_imagePrefetchController;
  self->_imagePrefetchController = (TUIImagePrefetchController *)v22;

  -[TUIImagePrefetchController setActionHandlerDelegate:](self->_imagePrefetchController, "setActionHandlerDelegate:", self);
  v24 = objc_alloc_init(TUIEmbeddedScrollViewCoordinator);
  pagedScrollableController = self->_pagedScrollableController;
  self->_pagedScrollableController = (TUIPagedScrollableControlling *)v24;

}

- (void)_teardownControllers
{
  void *options;
  TUIEmbeddedScrollViewCoordinator *embeddedScrollViewCoordinator;
  TUIDropController *dropController;
  TUILinkEntityController *linkEntityController;
  TUIImagePrefetchController *imagePrefetchController;
  TUIPagedScrollableControlling *pagedScrollableController;

  -[TUIImpressionController detachFromTracker](self->_impressionController, "detachFromTracker");
  objc_msgSend((id)self->_options, "teardown");
  options = (void *)self->_options;
  self->_options = 0;

  -[TUIEmbeddedScrollViewCoordinator removeTracker:](self->_embeddedScrollViewCoordinator, "removeTracker:", self->_auxiliaryViewState);
  -[TUIEmbeddedScrollViewCoordinator removeTracker:](self->_embeddedScrollViewCoordinator, "removeTracker:", self->_impressionTracker);
  embeddedScrollViewCoordinator = self->_embeddedScrollViewCoordinator;
  self->_embeddedScrollViewCoordinator = 0;

  dropController = self->_dropController;
  self->_dropController = 0;

  -[TUILinkEntityController setDelegate:](self->_linkEntityController, "setDelegate:", 0);
  linkEntityController = self->_linkEntityController;
  self->_linkEntityController = 0;

  -[TUIImagePrefetchController setActionHandlerDelegate:](self->_imagePrefetchController, "setActionHandlerDelegate:", 0);
  imagePrefetchController = self->_imagePrefetchController;
  self->_imagePrefetchController = 0;

  pagedScrollableController = self->_pagedScrollableController;
  self->_pagedScrollableController = 0;

}

- (void)clearVisibleOverride
{
  TUIMutableViewState *savedViewState;

  savedViewState = self->_savedViewState;
  self->_savedViewState = 0;

  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded", a3));
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)visibleOverrideVisible:(BOOL)a3
{
  TUIMutableViewState *v4;
  TUIMutableViewState *savedViewState;

  v4 = (TUIMutableViewState *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", a3));
  savedViewState = self->_savedViewState;
  self->_savedViewState = v4;

  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
}

- (BOOL)isContentVisible
{
  TUIMutableViewState *savedViewState;
  unsigned int v5;
  void *v6;
  void *v7;
  BOOL v8;

  savedViewState = self->_savedViewState;
  if (savedViewState)
    return -[TUIMutableViewState BOOLValue](savedViewState, "BOOLValue");
  v5 = -[TUIFeedViewController _appearState](self, "_appearState");
  if (v5 == 1)
    return 1;
  if (v5 != 2)
    return 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = v7 != 0;

  return v8;
}

- (TUIVideoPlayerManager)videoPlayerManager
{
  return (TUIVideoPlayerManager *)-[TUITemplateFactory videoPlayerManager](self->_templateFactory, "videoPlayerManager");
}

- (UINavigationBar)hostingNavigationBar
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationBar"));

  return (UINavigationBar *)v3;
}

- (void)_updatePriority
{
  int v3;
  int v4;
  double v5;

  if (-[TUIFeedViewController isContentVisible](self, "isContentVisible"))
    -[TUIFeedViewController visiblePriority](self, "visiblePriority");
  else
    -[TUIFeedViewController hiddenPriority](self, "hiddenPriority");
  v4 = v3;
  -[TUIFeedView setPriority:](self->_feedView, "setPriority:");
  LODWORD(v5) = v4;
  -[TUILinkEntityController setPriority:](self->_linkEntityController, "setPriority:", v5);
}

- (TUIViewRegistry)registry
{
  return (TUIViewRegistry *)-[TUITemplateFactory viewRegistry](self->_templateFactory, "viewRegistry");
}

- (void)_updateEnvironment
{
  TUIEnvironment *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  TUIEnvironment *v10;
  TUIEnvironment *environment;
  TUIRenderReferenceOverrideProvider *renderOverrideProvider;
  void *v13;
  id WeakRetained;

  v3 = [TUIEnvironment alloc];
  -[TUIFeedViewController _viewSize](self, "_viewSize");
  v5 = v4;
  v7 = v6;
  -[TUIFeedViewController _windowSize](self, "_windowSize");
  v10 = -[TUIEnvironment initWithViewController:viewSize:windowSize:](v3, "initWithViewController:viewSize:windowSize:", self, v5, v7, v8, v9);
  environment = self->_environment;
  self->_environment = v10;

  renderOverrideProvider = self->_renderOverrideProvider;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEnvironment traitCollection](self->_environment, "traitCollection"));
  -[TUIRenderReferenceOverrideProvider updateTraitCollection:](renderOverrideProvider, "updateTraitCollection:", v13);

  WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  if ((objc_opt_respondsToSelector(WeakRetained, "feedViewController:customizeEnvironment:") & 1) != 0)
    objc_msgSend(WeakRetained, "feedViewController:customizeEnvironment:", self, self->_environment);

}

- (void)setNeedsEnvironmentUpdate
{
  id v2;

  self->_environmentNeedsUpdate = 1;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v2, "setNeedsLayout");

}

- (void)_setupFeedView
{
  void *v3;
  void *v4;
  TUIFeedView *v5;
  void *v6;
  TUISyncLayoutController *v7;
  TUISyncLayoutController *syncLayoutController;
  double v9;
  TUIRenderReferenceOverrideProvider *renderOverrideProvider;
  void *v11;
  void *v12;
  TUISyncLayoutController *v13;
  void *v14;
  void *v15;
  TUISyncLayoutController *v16;
  void *v17;
  void *v18;
  TUIViewVisibilityController *v19;
  void *v20;
  TUIHostingController *v21;
  TUIHostingController *hostingController;
  TUIPagedScrollableController *v23;
  TUIFeedViewControllerDelegate *delegate;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  unsigned int v29;
  TUIFeedOverlayDebugView *v30;
  _TUIFeedViewControllerQueueContext *queueContext;
  void *v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  TUIAuxiliaryViewState *v37;
  TUIFeedOverlayDebugView *overlayDebugView;
  id v39;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView updateController](self->_feedView, "updateController"));
  v39 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "registerDelegate:", self));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "first"));
  v5 = [TUIFeedView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
  objc_msgSend(v6, "bounds");
  v7 = -[TUIFeedView initWithFrame:](v5, "initWithFrame:");
  syncLayoutController = self->_syncLayoutController;
  self->_syncLayoutController = v7;

  v9 = NAN;
  if (self->_liveResizeOptions == 1)
    v9 = 2.0;
  -[TUISyncLayoutController setContentHeightFactorForScrollingGuess:](self->_syncLayoutController, "setContentHeightFactorForScrollingGuess:", v9);
  -[TUISyncLayoutController setAutoresizingMask:](self->_syncLayoutController, "setAutoresizingMask:", 18);
  -[TUISyncLayoutController setViewFactory:](self->_syncLayoutController, "setViewFactory:", self->_feedContentLayoutStackNameInstance);
  -[TUISyncLayoutController setCurrentViewState:](self->_syncLayoutController, "setCurrentViewState:", self->_keyboardSupport);
  renderOverrideProvider = self->_renderOverrideProvider;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "second"));
  -[TUIRenderReferenceOverrideProvider updateHostingMap:](renderOverrideProvider, "updateHostingMap:", v11);

  -[TUISyncLayoutController reloadWithRenderModel:](self->_syncLayoutController, "reloadWithRenderModel:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TUISyncLayoutController setBackgroundColor:](self->_syncLayoutController, "setBackgroundColor:", v12);

  v13 = self->_syncLayoutController;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[TUIDragController sharedInstance](TUIDragController, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dragInteractionWithActionHandlerDelegate:dragDelegate:", self, self));
  -[TUISyncLayoutController addInteraction:](v13, "addInteraction:", v15);

  v16 = self->_syncLayoutController;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIImagePrefetchController dropInteraction](self->_imagePrefetchController, "dropInteraction"));
  -[TUISyncLayoutController addInteraction:](v16, "addInteraction:", v17);

  -[TUISyncLayoutController setDelegate:](self->_syncLayoutController, "setDelegate:", self);
  -[TUISyncLayoutController setSubviewsDelegate:](self->_syncLayoutController, "setSubviewsDelegate:", self);
  -[TUISyncLayoutController setRectScrollingDelegate:](self->_syncLayoutController, "setRectScrollingDelegate:", self);
  -[TUISyncLayoutController setScrollingDelegate:](self->_syncLayoutController, "setScrollingDelegate:", self);
  -[TUISyncLayoutController setControllerHost:](self->_syncLayoutController, "setControllerHost:", self);
  -[TUISyncLayoutController setAlwaysBounceVertical:](self->_syncLayoutController, "setAlwaysBounceVertical:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
  objc_msgSend(v18, "addSubview:", self->_syncLayoutController);

  -[TUIFeedViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", self->_syncLayoutController, 5);
  v19 = [TUIViewVisibilityController alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
  v21 = -[TUIViewVisibilityController initWithView:scrollView:](v19, "initWithView:scrollView:", v20, self->_syncLayoutController);
  hostingController = self->_hostingController;
  self->_hostingController = v21;

  v23 = objc_alloc_init(TUIPagedScrollableController);
  delegate = self->_delegate;
  self->_delegate = (TUIFeedViewControllerDelegate *)v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView auxiliaryUpdateController](self->_feedView, "auxiliaryUpdateController"));
  v26 = objc_msgSend(v25, "registerDelegate:", self);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v27, "BOOLForKey:", CFSTR("TUIEnableDebugMenu")))
  {

LABEL_6:
    v30 = objc_alloc_init(TUIFeedOverlayDebugView);
    queueContext = self->_queueContext;
    self->_queueContext = (_TUIFeedViewControllerQueueContext *)v30;

    -[_TUIFeedViewControllerQueueContext setDelegate:](self->_queueContext, "setDelegate:", self);
    -[_TUIFeedViewControllerQueueContext setTranslatesAutoresizingMaskIntoConstraints:](self->_queueContext, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    -[_TUIFeedViewControllerQueueContext setAutoresizingMask:](self->_queueContext, "setAutoresizingMask:", 18);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v32, "bounds");
    v34 = v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v35, "bounds");
    -[_TUIFeedViewControllerQueueContext setFrame:](self->_queueContext, "setFrame:", 0.0, 48.0, v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v36, "addSubview:", self->_queueContext);

    goto LABEL_7;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v29 = objc_msgSend(v28, "BOOLForKey:", CFSTR("TUIReportErrors"));

  if (v29)
    goto LABEL_6;
LABEL_7:
  v37 = -[TUIAuxiliaryViewState initWithSearchControllerDelegate:hostingController:viewVisibilityController:]([TUIAuxiliaryViewState alloc], "initWithSearchControllerDelegate:hostingController:viewVisibilityController:", self, self->_renderOverrideProvider, self->_hostingController);
  overlayDebugView = self->_overlayDebugView;
  self->_overlayDebugView = (TUIFeedOverlayDebugView *)v37;

}

- (void)_teardownFeedView
{
  TUIFeedOverlayDebugView *overlayDebugView;
  TUIHostingController *hostingController;
  TUIKeyboardAvoidingSupport *v5;
  TUIKeyboardAvoidingSupport *keyboardSupport;
  TUISyncLayoutController *syncLayoutController;
  _TUIFeedViewControllerQueueContext *queueContext;
  TUIFeedViewControllerDelegate *delegate;
  void *v10;
  id v11;

  -[TUIFeedViewController setContentScrollView:forEdge:](self, "setContentScrollView:forEdge:", 0, 5);
  overlayDebugView = self->_overlayDebugView;
  self->_overlayDebugView = 0;

  hostingController = self->_hostingController;
  self->_hostingController = 0;

  -[TUISyncLayoutController saveViewStateForVisibleViews](self->_syncLayoutController, "saveViewStateForVisibleViews");
  v5 = (TUIKeyboardAvoidingSupport *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController currentViewState](self->_syncLayoutController, "currentViewState"));
  keyboardSupport = self->_keyboardSupport;
  self->_keyboardSupport = v5;

  -[TUISyncLayoutController removeFromSuperview](self->_syncLayoutController, "removeFromSuperview");
  syncLayoutController = self->_syncLayoutController;
  self->_syncLayoutController = 0;

  -[TUIRenderReferenceOverrideProvider updateHostingMap:](self->_renderOverrideProvider, "updateHostingMap:", 0);
  -[_TUIFeedViewControllerQueueContext removeFromSuperview](self->_queueContext, "removeFromSuperview");
  queueContext = self->_queueContext;
  self->_queueContext = 0;

  delegate = self->_delegate;
  self->_delegate = 0;

  -[TUIDynamicInstance clearPool](self->_feedContentLayoutStackNameInstance, "clearPool");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView updateController](self->_feedView, "updateController"));
  objc_msgSend(v10, "unregisterDelegate:", self);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView auxiliaryUpdateController](self->_feedView, "auxiliaryUpdateController"));
  objc_msgSend(v11, "unregisterDelegate:", self);

}

- (void)_setContentNeedsUpdate
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_contentNeedsUpdate)
  {
    self->_contentNeedsUpdate = 1;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v4 = *(_QWORD *)&self->_hiddenPriority;
    self->_contentNeedsUpdate = v4 != 0;
    os_unfair_lock_unlock(p_lock);
    if (v4)
    {
      if (+[NSThread isMainThread](NSThread, "isMainThread"))
      {
        v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
        objc_msgSend(v5, "setNeedsLayout");

      }
      else
      {
        v6[0] = _NSConcreteStackBlock;
        v6[1] = 3221225472;
        v6[2] = sub_10CCF0;
        v6[3] = &unk_23D938;
        v6[4] = self;
        TUIDispatchAsyncViaRunLoop((uint64_t)v6);
      }
    }
  }
}

- (void)setContentNeedsUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUIFeedViewController _setContentNeedsUpdate](self, "_setContentNeedsUpdate");
}

- (void)viewDidLoad
{
  TUIViewFactory *v3;
  void *v4;
  TUIDynamicInstance *v5;
  TUIDynamicInstance *feedContentLayoutStackNameInstance;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewDidLoad](&v17, "viewDidLoad");
  +[TUIButtonBox setupSize](TUIButtonBox, "setupSize");
  +[TUIToggleBox setupSize](TUIToggleBox, "setupSize");
  if (!self->_feedContentLayoutStackNameInstance)
  {
    v3 = [TUIViewFactory alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory viewRegistry](self->_templateFactory, "viewRegistry"));
    v5 = -[TUIViewFactory initWithRegistry:](v3, "initWithRegistry:", v4);
    feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
    self->_feedContentLayoutStackNameInstance = v5;

  }
  if (!self->_environment)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController parentViewController](self, "parentViewController"));
    if (v7)
    {
      v8 = *((unsigned __int8 *)&self->_flags + 2);

      if (v8)
      {
        self->_environmentNeedsUpdate = 1;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
        objc_msgSend(v9, "setNeedsLayout");

      }
    }
  }
  if (self->_environmentNeedsUpdate || self->_environment)
    -[TUIFeedViewController _setContentNeedsUpdate](self, "_setContentNeedsUpdate");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController suspendedViewState](self, "suspendedViewState"));
  if (v12)
    v13 = -[TUIFeedViewController resumeAndRebuildForReason:](self, "resumeAndRebuildForReason:", CFSTR("view loaded"));
  else
    -[TUIFeedViewController _setupFeedView](self, "_setupFeedView");
  LODWORD(v14) = *(_DWORD *)&self->_viewDidDisappearWasCalled;
  -[TUIFeedView setPriority:](self->_feedView, "setPriority:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationController](self, "navigationController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "navigationBar"));
  objc_msgSend(v16, "setPrefersLargeTitles:", 1);

}

- (void)didReceiveMemoryWarning
{
  unsigned int v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController didReceiveMemoryWarning](&v6, "didReceiveMemoryWarning");
  v3 = -[TUIFeedViewController _appearState](self, "_appearState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  if (v5 || v3 == 1)
  {

  }
  else
  {

    if (v3 != 2)
    {
      -[TUIFeedViewController suspendAndTeardownForReason:](self, "suspendAndTeardownForReason:", CFSTR("memory pressure: view not in window & VC is not appearing nor appeared"));
      -[TUIFeedViewController setSuspendedDueToMemoryPressure:](self, "setSuspendedDueToMemoryPressure:", 1);
    }
  }
}

- (id)_captureFeedViewState
{
  TUIMutableFeedViewState *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(TUIMutableFeedViewState);
  -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
  v5 = v4;
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController renderModel](self->_syncLayoutController, "renderModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "anchorSet"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "scrollAnchorWithScrollView:offset:", self->_syncLayoutController, v5, v7));
  -[TUIFeedViewState setFeedScrollAnchor:](v3, "setFeedScrollAnchor:", v10);

  return v3;
}

- (BOOL)_didSizeChangeComparedToEnvironment
{
  void *v3;
  TUIEnvironment *environment;
  double v5;
  double width;
  double v7;
  double height;
  BOOL v9;
  double v10;
  BOOL v11;
  double v12;
  BOOL v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v3)
  {
    environment = self->_environment;
    if (environment)
    {
      -[TUIEnvironment viewSize](environment, "viewSize");
      width = v5;
      height = v7;
    }
    else
    {
      width = CGSizeZero.width;
      height = CGSizeZero.height;
    }
    objc_msgSend(v3, "bounds");
    v11 = self->_environment == 0;
    v13 = width != v12 || self->_environment == 0;
    if (height != v10)
      v11 = 1;
    if (((uint64_t)self->_viewVisibilityController & 1) != 0)
      v11 = 0;
    v9 = v13 || v11;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)viewWillLayoutSubviews
{
  unsigned int v3;
  void *v4;
  _BOOL4 needUpdate;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  TUIVisibilityController *visibilityController;
  _BOOL8 v17;
  uint64_t v18;
  _BOOL8 v19;
  TUIFeedView *feedView;
  id v21;
  NSObject *v22;
  TUIVisibilityController *v23;
  TUIFeedView *v24;
  double v25;
  double v26;
  unsigned __int8 v27;
  objc_super v28;
  uint8_t buf[4];
  TUIVisibilityController *v30;
  __int16 v31;
  TUIFeedView *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  _BOOL8 v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  TUIFeedView *v40;

  -[TUIRenderReferenceOverrideProvider beginLayout](self->_renderOverrideProvider, "beginLayout");
  -[TUIFeedViewController _updateHeightLayoutConditions](self, "_updateHeightLayoutConditions");
  v3 = -[TUIFeedViewController _didSizeChangeComparedToEnvironment](self, "_didSizeChangeComparedToEnvironment");
  if (!self->_auxiliaryRenderModel
    && !-[TUIFeedViewController avoidSyncTransactionInViewWillAppear](self, "avoidSyncTransactionInViewWillAppear"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
    if (v4)
    {
      needUpdate = self->_pendingViewAppearingTransition.needUpdate;

      if (needUpdate)
        -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingViewAppearingTransition.duration > 0.0, 0, 0, 1, 4);
    }
  }
  self->_pendingViewAppearingTransition.needUpdate = 0;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    if (v7
      || self->_auxiliaryRenderModel
      || +[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
    {

    }
    else
    {
      v27 = -[TUIFeedViewController avoidSyncTransactionInViewWillAppear](self, "avoidSyncTransactionInViewWillAppear");

      if ((v27 & 1) == 0)
        -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", 0, 0, 1, 1, 4, 0.0, self->_viewTransitionSyncTimeoutDuration);
    }
    v8 = objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
      v12 = v11;
      if (v11 && !self->_auxiliaryRenderModel)
      {
        +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
        v26 = v25;

        if (v26 == 0.0)
        {
          self->_needsVisibleStateUpdate = 1;
          -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", 0, 0, 1, 0, 4, 0.0, *(double *)&self->_contextMenuConfigurationProvider);
        }
      }
      else
      {

      }
    }
  }
  if (self->_auxiliaryRenderModel
    || (*(_BYTE *)&self->_flags & 1) != 0
    || (!self->_environment ? (v13 = 1) : (v13 = v3), v13 == 1))
  {
    v14 = TUILayoutLog();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      visibilityController = self->_visibilityController;
      v17 = self->_auxiliaryRenderModel != 0;
      v18 = *(_BYTE *)&self->_flags & 1;
      v19 = self->_environment != 0;
      feedView = self->_feedView;
      *(_DWORD *)buf = 134219266;
      v30 = visibilityController;
      v31 = 2048;
      v32 = (TUIFeedView *)v17;
      v33 = 2048;
      v34 = v18;
      v35 = 2048;
      v36 = v19;
      v37 = 2048;
      v38 = v3;
      v39 = 2112;
      v40 = feedView;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillLayoutSubviews start sync layout: wasSync=%ld, force=%ld, hasEnv=%ld, changedSize=%ld, FeedLayoutController=%@", buf, 0x3Eu);
    }

    -[TUIFeedViewController _layoutFeedIgnoringWindow:](self, "_layoutFeedIgnoringWindow:", self->_auxiliaryRenderModel != 0);
  }
  else
  {
    v21 = TUILayoutLog();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = self->_visibilityController;
      v24 = self->_feedView;
      *(_DWORD *)buf = 134218242;
      v30 = v23;
      v31 = 2112;
      v32 = v24;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "[fid:%lu] viewWillLayoutSubviews start async layout: FeedLayoutController=%@", buf, 0x16u);
    }

    -[TUIFeedViewController layoutIfNeeded](self, "layoutIfNeeded");
  }
  *(_BYTE *)&self->_flags &= ~1u;
  v28.receiver = self;
  v28.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewWillLayoutSubviews](&v28, "viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  if (self->_needsVisibleStateUpdate)
  {
    -[TUISyncLayoutController restoreViewStateForVisibleViews](self->_syncLayoutController, "restoreViewStateForVisibleViews");
    self->_needsVisibleStateUpdate = 0;
  }
  -[TUIRenderReferenceOverrideProvider endLayout](self->_renderOverrideProvider, "endLayout");
  -[TUIHostingController updateView](self->_hostingController, "updateView");
  -[TUIHostingController updatePopoverLayout](self->_hostingController, "updatePopoverLayout");
  v3.receiver = self;
  v3.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
}

- (id)_renderModel
{
  return -[TUISyncLayoutController renderModel](self->_syncLayoutController, "renderModel");
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_syncLayoutController;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  double v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v12, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, v6);
  self->_needsVisibleStateUpdate = 1;
  -[TUIFeedViewController setNeedsEnvironmentUpdate](self, "setNeedsEnvironmentUpdate");
  ++self->_pendingCoordinatedTransition.needUpdate;
  objc_msgSend(v6, "transitionDuration");
  self->_pendingCoordinatedTransition.duration = v7;
  v8 = objc_opt_respondsToSelector(v6, "timingParameters");
  if ((v8 & 1) != 0)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timingParameters"));
  else
    v9 = 0;
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, v9);
  if ((v8 & 1) != 0)

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory imageResourceCache](self->_templateFactory, "imageResourceCache"));
  objc_msgSend(v10, "deferLoadsBegin");

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10D728;
  v11[3] = &unk_241900;
  v11[4] = self;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v11);

}

- (void)tui_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  self->_needsVisibleStateUpdate = 1;
  -[TUIFeedViewController setNeedsEnvironmentUpdate](self, "setNeedsEnvironmentUpdate", a3, a4);
}

- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timeout:(double)a5 flags:(unint64_t)a6
{
  -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", a3, 0, 0, 0, a6, a4, a5);
}

- (void)_createSyncTransactionWithOptions:(id)a3
{
  TUIRenderModelAuxiliary *v4;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIFeedViewState *v6;
  TUIFeedViewState *suspendedViewState;
  id v8;

  if (!self->_auxiliaryRenderModel)
  {
    v4 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(+[TUITransaction transactionWithOptions:](TUITransaction, "transactionWithOptions:", a3));
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = v4;

    v6 = (TUIFeedViewState *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _captureFeedViewState](self, "_captureFeedViewState"));
    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = v6;

    v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
    objc_msgSend(v8, "scheduleSyncTransaction:", self->_auxiliaryRenderModel);

  }
}

- (void)_createSyncTransactionIfNeededAnimated:(BOOL)a3 duration:(double)a4 timingParameters:(id)a5 timeout:(double)a6 isLayingOutFeed:(BOOL)a7 ignoreWindow:(BOOL)a8 flags:(unint64_t)a9
{
  _BOOL8 v14;
  id v16;
  void *v17;
  void *v18;
  TUIMutableTransactionOptions *v19;
  TUIRenderModelAuxiliary *v20;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIFeedViewState *v22;
  TUIFeedViewState *suspendedViewState;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  TUIVisibilityController *visibilityController;
  void *v29;
  int v30;
  TUIVisibilityController *v31;
  __int16 v32;
  void *v33;

  v14 = a3;
  v16 = a5;
  if (!self->_auxiliaryRenderModel)
  {
    if (a8
      || (v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded")),
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window")),
          v18,
          v17,
          v18))
    {
      v19 = objc_alloc_init(TUIMutableTransactionOptions);
      -[TUITransactionOptions setAnimate:](v19, "setAnimate:", v14);
      -[TUITransactionOptions setDuration:](v19, "setDuration:", a4);
      -[TUITransactionOptions setSyncTimeout:](v19, "setSyncTimeout:", a6);
      -[TUITransactionOptions setFlags:](v19, "setFlags:", a9);
      -[TUITransactionOptions setTimingProvider:](v19, "setTimingProvider:", v16);
      v20 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(+[TUITransaction transactionWithOptions:](TUITransaction, "transactionWithOptions:", v19));
      auxiliaryRenderModel = self->_auxiliaryRenderModel;
      self->_auxiliaryRenderModel = v20;

      v22 = (TUIFeedViewState *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _captureFeedViewState](self, "_captureFeedViewState"));
      suspendedViewState = self->_suspendedViewState;
      self->_suspendedViewState = v22;

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
      objc_msgSend(v24, "scheduleSyncTransaction:", self->_auxiliaryRenderModel);

      if (!a7)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
        objc_msgSend(v25, "setNeedsLayout");

      }
      v26 = TUITransactionLog();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        visibilityController = self->_visibilityController;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](self->_auxiliaryRenderModel, "tx"));
        v30 = 134218242;
        v31 = visibilityController;
        v32 = 2114;
        v33 = v29;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "[fid:%lu] _createSyncTransactionIfNeededAnimated:... syncTransaction=%{public}@", (uint8_t *)&v30, 0x16u);

      }
    }
  }

}

- (void)feedLayoutController:(id)a3 applyUpdatesFromTransactionGroup:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  TUIRenderModelAuxiliary *v8;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  id v10;
  NSObject *v11;
  TUIVisibilityController *visibilityController;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  TUIRenderModelAuxiliary *v23;
  _QWORD v24[5];
  TUIRenderModelAuxiliary *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  TUIVisibilityController *v30;
  __int16 v31;
  void *v32;

  v5 = a4;
  if ((objc_msgSend(v5, "flags") & 1) != 0)
  {
    -[TUIRenderReferenceOverrideProvider beginViewUpdates](self->_renderOverrideProvider, "beginViewUpdates");
    objc_msgSend(v5, "applyUpdates");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v6, "layoutIfNeeded");

    -[TUIRenderReferenceOverrideProvider endViewUpdatesNotifyDelegate:](self->_renderOverrideProvider, "endViewUpdatesNotifyDelegate:", 0);
    if (-[TUIRenderReferenceOverrideProvider geometryUpdatedFlag](self->_renderOverrideProvider, "geometryUpdatedFlag"))
    {
      objc_msgSend(v5, "addNotifyWhenAppliedDeferral");
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "options"));
      -[TUIFeedViewController _createSyncTransactionWithOptions:](self, "_createSyncTransactionWithOptions:", v7);

      -[TUIFeedViewController _updateHostingGeometryMapWithTransaction:](self, "_updateHostingGeometryMapWithTransaction:", self->_auxiliaryRenderModel);
      v8 = self->_auxiliaryRenderModel;
      auxiliaryRenderModel = self->_auxiliaryRenderModel;
      self->_auxiliaryRenderModel = 0;

      -[TUIRenderModelAuxiliary commit](v8, "commit");
      v10 = TUITransactionLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        visibilityController = self->_visibilityController;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](v8, "tx"));
        *(_DWORD *)buf = 134218242;
        v30 = visibilityController;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "[fid:%lu] scheduled sync transaction for hosting geometry update: %@", buf, 0x16u);

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _effectiveSyncLayoutController](self, "_effectiveSyncLayoutController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary options](v8, "options"));
      objc_msgSend(v15, "syncTimeout");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](v8, "tx"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "syncAssertionWithTimeout:transaction:feedId:", v18, self->_visibilityController, v17));

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](v8, "tx"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10DD48;
      v27[3] = &unk_23D938;
      v28 = v5;
      objc_msgSend(v20, "notifyWhenAppliedWithBlock:", v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10DD50;
      v24[3] = &unk_23E2C8;
      v24[4] = self;
      v25 = v8;
      v26 = v19;
      v22 = v19;
      v23 = v8;
      objc_msgSend(v21, "waitForSyncTransaction:completion:", v23, v24);

    }
  }
  else
  {
    objc_msgSend(v5, "applyUpdates");
  }

}

- (void)_waitForSyncTransactionCompletion:(id)a3
{
  void (**v4)(void);
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIRenderModelAuxiliary *v6;
  void *v7;
  void (**v8)(void);

  v4 = (void (**)(void))a3;
  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (auxiliaryRenderModel)
  {
    self->_auxiliaryRenderModel = 0;
    v8 = v4;
    v6 = auxiliaryRenderModel;

    -[TUIRenderModelAuxiliary commit](v6, "commit");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
    objc_msgSend(v7, "waitForSyncTransaction:completion:", v6, v8);

LABEL_5:
    v4 = v8;
    goto LABEL_6;
  }
  if (v4)
  {
    v8 = v4;
    v4[2]();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_waitForSyncTransaction
{
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIRenderModelAuxiliary *v4;
  TUIRenderModelAuxiliary *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  TUIRenderModelAuxiliary *v14;
  TUIFeedViewState *suspendedViewState;
  _QWORD v16[5];
  TUIRenderModelAuxiliary *v17;
  id v18;

  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (auxiliaryRenderModel)
  {
    v4 = auxiliaryRenderModel;
    v5 = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = 0;

    -[TUIRenderModelAuxiliary commit](v4, "commit");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _effectiveSyncLayoutController](self, "_effectiveSyncLayoutController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary options](v4, "options"));
    objc_msgSend(v7, "syncTimeout");
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](v4, "tx"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "syncAssertionWithTimeout:transaction:feedId:", v10, self->_visibilityController, v9));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10E020;
    v16[3] = &unk_23E2C8;
    v16[4] = self;
    v17 = v4;
    v18 = v11;
    v13 = v11;
    v14 = v4;
    objc_msgSend(v12, "waitForSyncTransaction:completion:", v14, v16);

    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = 0;

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  char v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_needsVisibleStateUpdate = 1;
  ++self->_pendingCoordinatedTransition.needUpdate;
  objc_msgSend(v7, "transitionDuration");
  self->_pendingCoordinatedTransition.duration = v8;
  v9 = objc_opt_respondsToSelector(v7, "timingParameters");
  if ((v9 & 1) != 0)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "timingParameters"));
  else
    v10 = 0;
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, v10);
  if ((v9 & 1) != 0)

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUITemplateFactory imageResourceCache](self->_templateFactory, "imageResourceCache"));
  objc_msgSend(v11, "deferLoadsBegin");

  v12[4] = self;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10E250;
  v13[3] = &unk_241900;
  v13[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10E3CC;
  v12[3] = &unk_241900;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v12);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  void *heightGuessForScrollingOption;
  TUIKeyboardAvoidingSupport *v7;
  void *v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  if (!-[TUIFeedViewController avoidSyncTransactionInViewWillAppear](self, "avoidSyncTransactionInViewWillAppear"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));

    if (v4)
    {
      self->_pendingViewAppearingTransition.needUpdate = 1;
      +[UIView inheritedAnimationDuration](UIView, "inheritedAnimationDuration");
      self->_pendingViewAppearingTransition.duration = v5;
    }
  }
  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
  heightGuessForScrollingOption = (void *)self->_heightGuessForScrollingOption;
  if (!heightGuessForScrollingOption)
  {
    v7 = -[TUIKeyboardAvoidingSupport initWithViewController:]([TUIKeyboardAvoidingSupport alloc], "initWithViewController:", self);
    v8 = (void *)self->_heightGuessForScrollingOption;
    self->_heightGuessForScrollingOption = (unint64_t)v7;

    heightGuessForScrollingOption = (void *)self->_heightGuessForScrollingOption;
  }
  objc_msgSend(heightGuessForScrollingOption, "registerForNotifications");
  objc_msgSend((id)self->_heightGuessForScrollingOption, "setViewIsDisappearing:", 0);
  v9 = -[TUIFeedViewController resumeAndRebuildForReason:](self, "resumeAndRebuildForReason:", CFSTR("view appearing"));
  -[TUIFeedViewController setSuspendedDueToMemoryPressure:](self, "setSuspendedDueToMemoryPressure:", 0);
  -[TUIFeedView statRecordViewWillAppear](self->_feedView, "statRecordViewWillAppear");
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  TUIDropController *dropController;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewDidAppear:](&v12, "viewDidAppear:", a3);
  self->_pendingViewAppearingTransition.needUpdate = 0;
  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
  -[TUIEmbeddedScrollViewCoordinator updateVisible](self->_embeddedScrollViewCoordinator, "updateVisible");
  if (-[TUIFeedViewController suspendedDueToMemoryPressure](self, "suspendedDueToMemoryPressure"))
  {
    v4 = -[TUIFeedViewController resumeAndRebuildForReason:](self, "resumeAndRebuildForReason:", CFSTR("view appeared: recovering from suspend caused by memory pressure"));
    -[TUIFeedViewController setSuspendedDueToMemoryPressure:](self, "setSuspendedDueToMemoryPressure:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationItem](self, "navigationItem"));
  if ((objc_opt_respondsToSelector(WeakRetained, "feedViewControllerNavigationBarItem:") & 1) != 0)
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "feedViewControllerNavigationBarItem:", self));

    v6 = (void *)v7;
  }
  -[TUIFeedOverlayDebugView configureSearchControllerIfNeededForNavigationItem:](self->_overlayDebugView, "configureSearchControllerIfNeededForNavigationItem:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView anchorSet](self->_feedView, "anchorSet"));
  if (v8)
  {
    dropController = self->_dropController;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "computeTriggerStatesInScrollView:axis:", v10, 2));
    -[TUIDropController updateTriggerStatesWithNewStates:updateEvent:](dropController, "updateTriggerStatesWithNewStates:updateEvent:", v11, 0);

  }
  self->_updateEnvironmentOnViewLoad = 0;

}

- (TUISearchController)searchController
{
  return (TUISearchController *)-[TUIFeedOverlayDebugView searchController](self->_overlayDebugView, "searchController");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  objc_msgSend((id)self->_heightGuessForScrollingOption, "setViewIsDisappearing:", 1);
  objc_msgSend((id)self->_heightGuessForScrollingOption, "unregisterForNotifications");
  v5.receiver = self;
  v5.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  TUIDropController *dropController;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewDidDisappear:](&v8, "viewDidDisappear:", a3);
  -[TUIEmbeddedScrollViewCoordinator updateVisible](self->_embeddedScrollViewCoordinator, "updateVisible");
  -[TUIFeedViewController _updatePriority](self, "_updatePriority");
  -[NSHashTable invalidatePendingScrolls](self->_heightLayoutConditions, "invalidatePendingScrolls");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView anchorSet](self->_feedView, "anchorSet"));
  v5 = v4;
  if (v4)
  {
    dropController = self->_dropController;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedNotVisibleTriggerStatesForAxis:", 2));
    -[TUIDropController updateTriggerStatesWithNewStates:updateEvent:](dropController, "updateTriggerStatesWithNewStates:updateEvent:", v7, 1);

  }
  self->_updateEnvironmentOnViewLoad = 1;

}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  if (a3)
    -[TUIFeedViewController setNeedsEnvironmentUpdate](self, "setNeedsEnvironmentUpdate");
}

- (TUIFeedContent)content
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = *(id *)&self->_hiddenPriority;
  os_unfair_lock_unlock(p_lock);
  return (TUIFeedContent *)v4;
}

- (void)setContent:(id)a3
{
  id v5;
  void *v6;
  TUIFeedViewState *v7;
  TUIFeedViewState *restoreViewState;
  id v9;

  v9 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = *(id *)&self->_hiddenPriority;
  os_unfair_lock_unlock(&self->_lock);
  if ((objc_msgSend(v5, "isEqual:", v9) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_storeStrong((id *)&self->_hiddenPriority, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_hiddenPriority, "currentStackName"));
    v7 = (TUIFeedViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "instanceForObserver:", self));
    restoreViewState = self->_restoreViewState;
    self->_restoreViewState = v7;

    os_unfair_lock_unlock(&self->_lock);
    -[TUIFeedViewController _setContentNeedsUpdate](self, "_setContentNeedsUpdate");
  }

}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[TUISyncLayoutController showsVerticalScrollIndicator](self->_syncLayoutController, "showsVerticalScrollIndicator") != a3)
  {
    *((_BYTE *)&self->_flags + 3) = v3;
    -[TUISyncLayoutController setShowsVerticalScrollIndicator:](self->_syncLayoutController, "setShowsVerticalScrollIndicator:", v3);
  }
}

- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _effectiveSyncLayoutController](self, "_effectiveSyncLayoutController"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "syncAssertionWithTimeout:transaction:feedId:", 0, self->_visibilityController, a6));

  -[TUIFeedViewController _synchronouslyUpdateContent:environment:andWaitForEntry:timeout:assertion:completion:](self, "_synchronouslyUpdateContent:environment:andWaitForEntry:timeout:assertion:completion:", v12, v11, v10, v14, 0, a6);
}

- (void)synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 completion:(id)a7
{
  -[TUIFeedViewController _synchronouslyUpdateContent:environment:andWaitForEntry:timeout:assertion:completion:](self, "_synchronouslyUpdateContent:environment:andWaitForEntry:timeout:assertion:completion:", a3, a4, a5, 0, a7, a6);
}

- (void)_synchronouslyUpdateContent:(id)a3 environment:(id)a4 andWaitForEntry:(id)a5 timeout:(double)a6 assertion:(id)a7 completion:(id)a8
{
  id v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  TUIFeedViewState *v22;
  TUIFeedViewState *restoreViewState;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIRenderModelAuxiliary *v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  id v33;
  TUIVisibilityController *visibilityController;
  void *v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  TUIRenderModelAuxiliary *v39;
  TUIRenderModelAuxiliary *v40;
  _QWORD v41[5];
  TUIRenderModelAuxiliary *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  TUIVisibilityController *v47;
  __int16 v48;
  void *v49;

  v15 = a3;
  v16 = a4;
  v17 = (unint64_t)a7;
  v18 = (unint64_t)a8;
  v19 = *(void **)&self->_hiddenPriority;
  *(_QWORD *)&self->_hiddenPriority = 0;
  v20 = a5;

  -[TUIFeedViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_hiddenPriority, a3);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&self->_hiddenPriority, "currentStackName"));
  v22 = (TUIFeedViewState *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "instanceForObserver:", self));
  restoreViewState = self->_restoreViewState;
  self->_restoreViewState = v22;

  self->_contentNeedsUpdate = 0;
  os_unfair_lock_unlock(&self->_lock);
  auxiliaryRenderModel = self->_auxiliaryRenderModel;
  if (!auxiliaryRenderModel)
  {
    -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", 0, 0, 0, 1, 0, 0.0, a6);
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
  }
  v25 = auxiliaryRenderModel;
  v26 = TUITransactionLog();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    v40 = v25;
    v28 = v20;
    v29 = a4;
    v30 = v18;
    v31 = v17;
    v32 = v16;
    v33 = v15;
    visibilityController = self->_visibilityController;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](self->_auxiliaryRenderModel, "tx"));
    *(_DWORD *)buf = 134218242;
    v47 = visibilityController;
    v15 = v33;
    v16 = v32;
    v17 = v31;
    v18 = v30;
    a4 = v29;
    v20 = v28;
    v25 = v40;
    v48 = 2114;
    v49 = v35;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "[fid:%lu] _synchronouslyUpdateContent:... syncTransaction=%{public}@", buf, 0x16u);

  }
  -[TUIRenderReferenceOverrideProvider reset](self->_renderOverrideProvider, "reset");
  if (v16)
    objc_storeStrong((id *)&self->_environment, a4);
  else
    -[TUIFeedViewController _updateEnvironment](self, "_updateEnvironment");
  -[TUIFeedView updateWithContent:layoutUpToEntry:environment:transaction:](self->_feedView, "updateWithContent:layoutUpToEntry:environment:transaction:", v15, v20, self->_environment, v25);

  if (v17 | v18)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10EE4C;
    v43[3] = &unk_23E580;
    v44 = (id)v17;
    v45 = (id)v18;
    v36 = objc_retainBlock(v43);
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TUIRenderModelAuxiliary tx](v25, "tx"));
    v38 = v37;
    if (v37)
      objc_msgSend(v37, "notifyWhenAppliedWithBlock:", v36);
    else
      ((void (*)(_QWORD *))v36[2])(v36);

  }
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10EE88;
  v41[3] = &unk_23D7D0;
  v41[4] = self;
  v42 = v25;
  v39 = v25;
  -[TUIFeedViewController _waitForSyncTransactionCompletion:](self, "_waitForSyncTransactionCompletion:", v41);

}

- (void)finalizeSynchronousTransaction:(id)a3
{
  TUIFeedView *feedView;
  id v5;
  void *v6;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  TUIFeedViewState *suspendedViewState;

  if (a3)
  {
    feedView = self->_feedView;
    v5 = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](feedView, "transactionCoordinator"));
    objc_msgSend(v6, "finalizeSyncTransaction:", v5);

    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    self->_auxiliaryRenderModel = 0;

    suspendedViewState = self->_suspendedViewState;
    self->_suspendedViewState = 0;

  }
}

- (void)_updateLayoutIfNeededIgnoringWindow:(BOOL)a3
{
  unsigned __int8 v5;
  _BOOL4 contentNeedsUpdate;
  double v7;
  double v8;
  TUISyncLayoutController *syncLayoutController;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  TUIFeedViewState *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;

  if (!self->_pauseEnvironmentUpdates
    && self->_environment
    && -[TUIFeedViewController _didSizeChangeComparedToEnvironment](self, "_didSizeChangeComparedToEnvironment"))
  {
    self->_environmentNeedsUpdate = 1;
  }
  v5 = -[TUIFeedViewController _shouldDisableLayoutDueToAppBeingBackgrounded](self, "_shouldDisableLayoutDueToAppBeingBackgrounded");
  if (self->_environmentNeedsUpdate && !self->_pauseEnvironmentUpdates)
  {
    if ((v5 & 1) != 0)
      goto LABEL_11;
    if (a3
      || (v30 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded")),
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "window")),
          v31,
          v30,
          v31))
    {
      self->_environmentNeedsUpdate = 0;
      -[TUIFeedViewController _updateEnvironment](self, "_updateEnvironment");
      v32 = self->_suspendedViewState;
      if (!v32)
      {
        if ((-[TUISyncLayoutController isDragging](self->_syncLayoutController, "isDragging") & 1) != 0
          || (-[TUISyncLayoutController isTracking](self->_syncLayoutController, "isTracking") & 1) != 0
          || (-[TUISyncLayoutController isDecelerating](self->_syncLayoutController, "isDecelerating") & 1) != 0
          || (-[TUISyncLayoutController _isAnimatingScroll](self->_syncLayoutController, "_isAnimatingScroll") & 1) != 0)
        {
          v32 = 0;
        }
        else
        {
          v32 = (TUIFeedViewState *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _captureFeedViewState](self, "_captureFeedViewState"));
        }
      }
      -[TUIFeedViewController _updateHostingGeometryMapIfNeededWithTransaction:](self, "_updateHostingGeometryMapIfNeededWithTransaction:", self->_auxiliaryRenderModel);
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController layoutController](self, "layoutController"));
      objc_msgSend(v33, "updateWithEnvironment:state:withTransaction:", self->_environment, v32, self->_auxiliaryRenderModel);

    }
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_11;
  }
  os_unfair_lock_lock(&self->_lock);
  contentNeedsUpdate = self->_contentNeedsUpdate;
  self->_contentNeedsUpdate = 0;
  os_unfair_lock_unlock(&self->_lock);
  if (contentNeedsUpdate)
    -[TUIFeedViewController _loadFeed](self, "_loadFeed");
LABEL_11:
  -[TUIFeedViewController _viewSize](self, "_viewSize");
  v36 = v8;
  v37 = v7;
  syncLayoutController = self->_syncLayoutController;
  -[TUISyncLayoutController contentOffset](syncLayoutController, "contentOffset");
  v34 = v11;
  v35 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "contentInset");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[TUISyncLayoutController safeAreaInsets](self->_syncLayoutController, "safeAreaInsets");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController tabBarController](self, "tabBarController"));
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v29 != 0, v37, v36, v35, v34, v14, v16, v18, v20, v22, v24, v26, v28);

  if (self->_needsVisibleStateUpdate)
    -[TUISyncLayoutController saveViewStateForVisibleViews](self->_syncLayoutController, "saveViewStateForVisibleViews");
}

- (void)layoutIfNeeded
{
  -[TUIFeedViewController _updateLayoutIfNeededIgnoringWindow:](self, "_updateLayoutIfNeededIgnoringWindow:", 0);
}

- (void)_layoutFeed
{
  -[TUIFeedViewController _layoutFeedIgnoringWindow:](self, "_layoutFeedIgnoringWindow:", 0);
}

- (void)_layoutFeedIgnoringWindow:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t needUpdate;

  v3 = a3;
  if (!self->_auxiliaryRenderModel)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
    if (v5)
    {
      needUpdate = self->_pendingCoordinatedTransition.needUpdate;

      if (needUpdate)
        -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingCoordinatedTransition.duration > 0.0, self->_pendingCoordinatedTransitionTimingProvider, 1, 0, 6);
    }
  }
  -[TUIFeedViewController _updateLayoutIfNeededIgnoringWindow:](self, "_updateLayoutIfNeededIgnoringWindow:", v3);
  -[TUIFeedViewController _waitForSyncTransaction](self, "_waitForSyncTransaction");
}

- (void)_updateHostingGeometryMapWithTransaction:(id)a3
{
  TUIFeedView *feedView;
  TUIRenderReferenceOverrideProvider *renderOverrideProvider;
  id v6;
  id v7;

  feedView = self->_feedView;
  renderOverrideProvider = self->_renderOverrideProvider;
  v6 = a3;
  v7 = -[TUIRenderReferenceOverrideProvider newGeometryMap](renderOverrideProvider, "newGeometryMap");
  -[TUIFeedView updateHostingGeometryMap:withTransaction:](feedView, "updateHostingGeometryMap:withTransaction:", v7, v6);

  -[TUIRenderReferenceOverrideProvider resetGeometryUpdatedFlag](self->_renderOverrideProvider, "resetGeometryUpdatedFlag");
}

- (void)_updateHostingGeometryMapIfNeededWithTransaction:(id)a3
{
  TUIFeedView *feedView;
  id v5;
  id v6;

  v6 = a3;
  if (-[TUIRenderReferenceOverrideProvider geometryUpdatedFlag](self->_renderOverrideProvider, "geometryUpdatedFlag"))
  {
    feedView = self->_feedView;
    v5 = -[TUIRenderReferenceOverrideProvider newGeometryMap](self->_renderOverrideProvider, "newGeometryMap");
    -[TUIFeedView updateHostingGeometryMap:withTransaction:](feedView, "updateHostingGeometryMap:withTransaction:", v5, v6);

    -[TUIRenderReferenceOverrideProvider resetGeometryUpdatedFlag](self->_renderOverrideProvider, "resetGeometryUpdatedFlag");
  }

}

- (void)flushPendingTransactionsWithTimeout:(double)a3
{
  id v4;
  NSObject *v5;

  if (self->_auxiliaryRenderModel)
  {
    v4 = TUIDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_17EBC4((uint64_t)self, v5);

  }
  else
  {
    -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", 0, 0, 0, 1, 8, 0.0, a3);
  }
  -[TUIFeedViewController _layoutFeedIgnoringWindow:](self, "_layoutFeedIgnoringWindow:", 1);
}

- (void)flushPendingTransactionsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[TUIFeedViewController _updateLayoutIfNeededIgnoringWindow:](self, "_updateLayoutIfNeededIgnoringWindow:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransactionOptions noAnimationOptions](TUIMutableTransactionOptions, "noAnimationOptions"));
  objc_msgSend(v4, "setFlags:", 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUITransaction transactionWithOptions:](TUITransaction, "transactionWithOptions:", v4));
  if (v7)
    objc_msgSend(v5, "addCompletion:queue:", v7, &_dispatch_main_q);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
  objc_msgSend(v6, "scheduleLayoutUpdateWithTransaction:block:", v5, &stru_2419C0);

}

- (void)pauseUpdates
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
  objc_msgSend(v2, "pauseUpdates");

}

- (void)resumeUpdates
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
  objc_msgSend(v2, "resumeUpdates");

}

- (void)pauseEnvironmentUpdates
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  ++self->_pauseEnvironmentUpdates;
}

- (void)resumeEnvironmentUpdates
{
  unint64_t v3;
  id v4;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v3 = self->_pauseEnvironmentUpdates - 1;
  self->_pauseEnvironmentUpdates = v3;
  if (!v3)
  {
    -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", 0, 0, 1, 0, 6, 0.0, *(double *)&self->_contextMenuConfigurationProvider);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)suspendAndTeardownForReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  TUIVisibilityController *visibilityController;
  CGFloat v8;
  CGFloat v9;
  TUIFeedDebugDelegate *v10;
  CGFloat v11;
  void *v12;
  TUIEnvironment *environment;
  int v14;
  TUIVisibilityController *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  v5 = TUIDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    visibilityController = self->_visibilityController;
    v14 = 134218242;
    v15 = visibilityController;
    v16 = 2114;
    v17 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[fid:%lu] suspend and teardown for reason: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  if (-[TUIFeedViewController runningInExtension](self, "runningInExtension"))
  {
    -[TUISyncLayoutController contentSize](self->_syncLayoutController, "contentSize");
    self->_savedContentOffset.y = v8;
    self->_savedContentSize.width = v9;
    -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
    self->_debugDelegate = v10;
    self->_savedContentOffset.x = v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _captureFeedViewState](self, "_captureFeedViewState"));
  -[TUIFeedViewController setSuspendedViewState:](self, "setSuspendedViewState:", v12);

  -[TUIFeedViewController _teardownFeedView](self, "_teardownFeedView");
  -[TUIFeedViewController _teardownControllers](self, "_teardownControllers");
  environment = self->_environment;
  self->_environment = 0;

  -[TUIFeedView suspendAndTeardownWithTransaction:](self->_feedView, "suspendAndTeardownWithTransaction:", self->_auxiliaryRenderModel);
}

- (void)clearSuspendedViewState
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController suspendedViewState](self, "suspendedViewState"));
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setFeedScrollAnchor:", 0);
  -[TUIFeedViewController setSuspendedViewState:](self, "setSuspendedViewState:", v4);

}

- (id)resumeAndRebuildForReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  TUIVisibilityController *visibilityController;
  TUIRenderModelAuxiliary *v8;
  void *v11;
  TUIRenderModelAuxiliary *auxiliaryRenderModel;
  void *v13;
  _BOOL4 needUpdate;
  TUIRenderModelAuxiliary *v15;
  TUIFeedView *feedView;
  TUIEnvironment *environment;
  void *v18;
  int v20;
  TUIVisibilityController *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = TUIDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    visibilityController = self->_visibilityController;
    v20 = 134218242;
    v21 = visibilityController;
    v22 = 2114;
    v23 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "[fid:%lu] resume and rebuild for reason: %{public}@", (uint8_t *)&v20, 0x16u);
  }

  v8 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController suspendedViewState](self, "suspendedViewState"));
  if (v8)
  {
    -[TUIFeedViewController _setupControllers](self, "_setupControllers");
    -[TUIFeedViewController _setupFeedView](self, "_setupFeedView");
    if (-[TUIFeedViewController runningInExtension](self, "runningInExtension"))
    {
      if ((*(double *)&self->_debugDelegate != CGPointZero.x || self->_savedContentOffset.x != CGPointZero.y)
        && (self->_savedContentOffset.y != CGSizeZero.width || self->_savedContentSize.width != CGSizeZero.height))
      {
        -[TUISyncLayoutController setContentSize:](self->_syncLayoutController, "setContentSize:");
        -[TUISyncLayoutController setContentOffset:animated:](self->_syncLayoutController, "setContentOffset:animated:", 0, *(double *)&self->_debugDelegate, self->_savedContentOffset.x);
      }
    }
    *(_BYTE *)&self->_flags |= 1u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    objc_msgSend(v11, "setNeedsLayout");

    -[TUIFeedViewController _updateEnvironment](self, "_updateEnvironment");
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    if (auxiliaryRenderModel)
      goto LABEL_20;
    if (!-[TUIFeedViewController avoidSyncTransactionInViewWillAppear](self, "avoidSyncTransactionInViewWillAppear"))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
      if (v13)
      {
        needUpdate = self->_pendingViewAppearingTransition.needUpdate;

        if (needUpdate)
        {
          self->_pendingViewAppearingTransition.needUpdate = 0;
          -[TUIFeedViewController _createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:](self, "_createSyncTransactionIfNeededAnimated:duration:timingParameters:timeout:isLayingOutFeed:ignoreWindow:flags:", self->_pendingViewAppearingTransition.duration > 0.0, 0, 0, 1, 4);
        }
      }
    }
    auxiliaryRenderModel = self->_auxiliaryRenderModel;
    if (auxiliaryRenderModel)
LABEL_20:
      v15 = auxiliaryRenderModel;
    else
      v15 = (TUIRenderModelAuxiliary *)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
    v8 = v15;
    feedView = self->_feedView;
    environment = self->_environment;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController suspendedViewState](self, "suspendedViewState"));
    -[TUIFeedView resumeAndRebuildWithEnvironment:state:transaction:](feedView, "resumeAndRebuildWithEnvironment:state:transaction:", environment, v18, v8);

    -[TUIFeedViewController setSuspendedViewState:](self, "setSuspendedViewState:", 0);
    -[TUIFeedViewController visibilityProviderIsVisible](self, "visibilityProviderIsVisible");
  }

  return v8;
}

- (id)suspendUpdatesUntilContentExceedsHeightWithCompletion:(id)a3
{
  id v4;
  TUIFeedHeightLayoutCondition *v5;
  void *v6;
  TUIFeedHeightLayoutCondition *v7;
  TUIViewFactory *viewFactory;
  TUIViewFactory *v9;
  TUIViewFactory *v10;

  v4 = a3;
  v5 = [TUIFeedHeightLayoutCondition alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  v7 = -[TUIFeedHeightLayoutCondition initWithView:completion:](v5, "initWithView:completion:", v6, v4);

  -[TUIFeedView suspendUpdatesUntilMeetingLayoutCondition:](self->_feedView, "suspendUpdatesUntilMeetingLayoutCondition:", v7);
  viewFactory = self->_viewFactory;
  if (!viewFactory)
  {
    v9 = (TUIViewFactory *)objc_claimAutoreleasedReturnValue(+[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 517));
    v10 = self->_viewFactory;
    self->_viewFactory = v9;

    viewFactory = self->_viewFactory;
  }
  -[TUIViewFactory addObject:](viewFactory, "addObject:", v7);
  return v7;
}

- (void)_updateHeightLayoutConditions
{
  void *v3;
  TUIViewFactory *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v3)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_viewFactory;
    v5 = -[TUIViewFactory countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "updateWithView:", v3, (_QWORD)v9);
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = -[TUIViewFactory countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (id)suspendUpdates
{
  TUIFeedSuspendLayoutUpdateCondition *v3;

  v3 = -[TUIFeedBaseLayoutCondition initWithCompletion:]([TUIFeedSuspendLayoutUpdateCondition alloc], "initWithCompletion:", 0);
  -[TUIFeedView suspendUpdatesUntilMeetingLayoutCondition:](self->_feedView, "suspendUpdatesUntilMeetingLayoutCondition:", v3);
  return v3;
}

- (void)suspendUpdatesUntilEndOfTransaction:(id)a3
{
  id v4;
  TUIFeedSuspendLayoutUpdateCondition *v5;
  void *v6;
  TUIFeedSuspendLayoutUpdateCondition *v7;
  _QWORD v8[4];
  TUIFeedSuspendLayoutUpdateCondition *v9;

  v4 = a3;
  v5 = -[TUIFeedBaseLayoutCondition initWithCompletion:]([TUIFeedSuspendLayoutUpdateCondition alloc], "initWithCompletion:", 0);
  if (!v4)
    v4 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIFeedView suspendUpdatesUntilMeetingLayoutCondition:](self->_feedView, "suspendUpdatesUntilMeetingLayoutCondition:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10FE30;
  v8[3] = &unk_23E688;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "scheduleLayoutUpdateWithTransaction:block:", v4, v8);

}

- (id)suspendLayout
{
  TUIFeedSuspendLayoutCondition *v3;

  v3 = -[TUIFeedBaseLayoutCondition initWithCompletion:]([TUIFeedSuspendLayoutCondition alloc], "initWithCompletion:", 0);
  -[TUIFeedView suspendLayoutsUntilMeetingLayoutCondition:](self->_feedView, "suspendLayoutsUntilMeetingLayoutCondition:", v3);
  return v3;
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;

  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v4, "updateVisibleBounds");

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;

  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v4, "updateVisibleBounds");

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;

  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v5, "updateVisibleBounds");

}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  TUIDropController *dropController;
  void *v8;
  void *v9;
  TUIFeedViewController *v10;
  TUISyncLayoutController *syncLayoutController;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id WeakRetained;
  TUILinkEntityController *linkEntityController;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  id v50;

  v50 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v4, "updateVisibleBounds");

  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController);
  -[NSHashTable invalidatePendingScrolls](self->_heightLayoutConditions, "invalidatePendingScrolls");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView anchorSet](self->_feedView, "anchorSet"));
  v6 = v5;
  if (v5)
  {
    dropController = self->_dropController;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "computeTriggerStatesInScrollView:axis:", v50, 2));
    -[TUIDropController updateTriggerStatesWithNewStates:updateEvent:](dropController, "updateTriggerStatesWithNewStates:updateEvent:", v8, 3);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationController](self, "navigationController"));
  v10 = (TUIFeedViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topViewController"));

  if (v10 == self)
    -[TUIFeedViewController updateNavigationBarOpacity](self, "updateNavigationBarOpacity");
  syncLayoutController = self->_syncLayoutController;
  -[TUIFeedViewController _viewSize](self, "_viewSize");
  v48 = v13;
  v49 = v12;
  objc_msgSend(v50, "contentOffset");
  v46 = v15;
  v47 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v16, "contentInset");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(v50, "safeAreaInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController tabBarController](self, "tabBarController"));
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v33 != 0, v49, v48, v47, v46, v18, v20, v22, v24, v26, v28, v30, v32);

  WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  if ((objc_opt_respondsToSelector(WeakRetained, "feedViewControllerDidScroll:") & 1) != 0)
    objc_msgSend(WeakRetained, "feedViewControllerDidScroll:", self);
  linkEntityController = self->_linkEntityController;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController renderModel](self->_syncLayoutController, "renderModel"));
  -[TUISyncLayoutController visibleBounds](self->_syncLayoutController, "visibleBounds");
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController currentViewState](self->_syncLayoutController, "currentViewState"));
  -[TUILinkEntityController updatePrioritiesForRenderModel:visibleRect:viewState:](linkEntityController, "updatePrioritiesForRenderModel:visibleRect:viewState:", v36, v45, v38, v40, v42, v44);

}

- (void)viewSafeAreaInsetsDidChange
{
  TUISyncLayoutController *syncLayoutController;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)TUIFeedViewController;
  -[TUIFeedViewController viewSafeAreaInsetsDidChange](&v30, "viewSafeAreaInsetsDidChange");
  syncLayoutController = self->_syncLayoutController;
  -[TUIFeedViewController _viewSize](self, "_viewSize");
  v28 = v5;
  v29 = v4;
  -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
  v26 = v7;
  v27 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v8, "contentInset");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[TUISyncLayoutController safeAreaInsets](self->_syncLayoutController, "safeAreaInsets");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController tabBarController](self, "tabBarController"));
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v25 != 0, v29, v28, v27, v26, v10, v12, v14, v16, v18, v20, v22, v24);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  -[_TUIFeedViewControllerQueueContext setNeedsLayout](self->_queueContext, "setNeedsLayout");
  -[_TUIFeedViewControllerQueueContext layoutIfNeeded](self->_queueContext, "layoutIfNeeded");
}

- (void)setNavBarBackgroundOpacity:(double)a3 manualScrollEdgeAppearanceEnabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  objc_msgSend(v8, "_setTitleOpacity:", a3);

  if (v4)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "_setManualScrollEdgeAppearanceEnabled:", 1);

    v10 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v10, "_setManualScrollEdgeAppearanceProgress:", a3);

  }
}

- (BOOL)runningInExtension
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController extensionContext](self, "extensionContext"));
  v3 = v2 != 0;

  return v3;
}

- (CGSize)_viewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)_windowSize
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow"));
  v6 = v5;

  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (BOOL)_shouldDisableLayoutDueToAppBeingBackgrounded
{
  char v3;
  TUIFeedViewController *v4;
  TUIFeedViewController *v5;
  TUIFeedViewController *v6;
  void *v7;
  void *v8;
  TUIFeedViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[TUIFeedViewController runningInExtension](self, "runningInExtension"))
    return 0;
  v4 = self;
  v5 = v4;
  do
  {
    v6 = v4;
    v4 = v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController parentViewController](v4, "parentViewController"));
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (TUIFeedViewController *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController presentingViewController](v4, "presentingViewController"));
    v5 = v9;

  }
  while (v5);
  if (v4)
  {
    while (1)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](v4, "viewIfLoaded"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
      if (v11)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController presentedViewController](v4, "presentedViewController"));

      if (v12)
      {
        v13 = objc_claimAutoreleasedReturnValue(-[TUIFeedViewController presentedViewController](v4, "presentedViewController"));

        v4 = (TUIFeedViewController *)v13;
        if (v13)
          continue;
      }
      goto LABEL_14;
    }

  }
LABEL_14:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](v4, "viewIfLoaded"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "window"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "windowScene"));

  if (v16)
  {
    if (objc_msgSend(v16, "activationState"))
      v3 = objc_msgSend(v16, "activationState") != (char *)&dword_0 + 1;
    else
      v3 = 0;
  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)_loadFeed
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController layoutController](self, "layoutController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
  objc_msgSend(v4, "updateWithContent:transaction:", v3, 0);

}

- (id)_renderModelForIndexPath:(id)a3
{
  return -[TUIFeedViewController _renderModelForSection:](self, "_renderModelForSection:", objc_msgSend(a3, "section"));
}

- (id)_renderModelForSection:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _renderModel](self, "_renderModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    v9 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", a3));

    if (objc_msgSend(v8, "kind") == (char *)&dword_4 + 3)
      v9 = v8;
    else
      v9 = 0;

  }
  return v9;
}

- (BOOL)_handleNativePressAction:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  TUIVisibilityController *visibilityController;
  int v12;
  TUIVisibilityController *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = TUIDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    visibilityController = self->_visibilityController;
    v12 = 134218498;
    v13 = visibilityController;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_debug_impl(&dword_0, v9, OS_LOG_TYPE_DEBUG, "[fid:%lu] handling press: %@ with arguments: %@", (uint8_t *)&v12, 0x20u);
  }

  return 0;
}

- (void)_updateDatesCollectorInitialResourcesRenderedDate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController layoutController](self, "layoutController"));
  objc_msgSend(v2, "statRecordInitialResourcesRenderedDate");

}

- (UIEdgeInsets)contentInsetsForScrollingToRectWithContentInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  char v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "feedViewController:contentInsetsForScrollingToRectWithContentInsets:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController delegate](self, "delegate"));
    objc_msgSend(v10, "feedViewController:contentInsetsForScrollingToRectWithContentInsets:", self, top, left, bottom, right);
    top = v11;
    left = v12;
    bottom = v13;
    right = v14;

  }
  v15 = top;
  v16 = left;
  v17 = bottom;
  v18 = right;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (void)didScrollToQuery:(id)a3
{
  -[NSHashTable invalidateQuery:](self->_heightLayoutConditions, "invalidateQuery:", a3);
}

- (void)updateHostingMap:(id)a3 controller:(id)a4
{
  TUIFeedView *feedView;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  feedView = self->_feedView;
  v7 = a4;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView updateController](feedView, "updateController"));

  if (v8 == v7)
    -[TUIRenderReferenceOverrideProvider updateHostingMap:](self->_renderOverrideProvider, "updateHostingMap:", v9);

}

- (void)applyUpdate:(id)a3 controller:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  id updated;
  NSObject *v12;
  id v13;
  void *v14;
  id WeakRetained;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  TUIDropController *dropController;
  void *v45;
  void *v46;
  TUILinkEntityController *linkEntityController;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  unsigned __int8 v59;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  v10 = a4;
  updated = TUIViewUpdateLog();
  v12 = objc_claimAutoreleasedReturnValue(updated);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_17EC44((uint64_t)self, v8, v12);

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v13 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedView updateController](self->_feedView, "updateController"));

  if (v13 != v10)
    goto LABEL_4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
  -[_TUIFeedViewControllerQueueContext setRenderModel:](self->_queueContext, "setRenderModel:", v14);

  WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "content"));
  if (!v16)
    goto LABEL_15;
  v17 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "sections"));
  if (objc_msgSend(v19, "count"))
  {

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "info"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("TUIRenderInfoKeyIsFinal")));
    v59 = objc_msgSend(v22, "BOOLValue");

    if ((v59 & 1) == 0)
      goto LABEL_16;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
  objc_msgSend(v23, "size");
  v25 = v24;
  v27 = v26;

  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "from"));
  if (!v28
    || (v29 = (void *)v28,
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "from")),
        objc_msgSend(v30, "size"),
        v32 = v31,
        v34 = v33,
        v30,
        v29,
        v32 != v25)
    || v34 != v27)
  {
    if ((*(_BYTE *)&self->_delegateFlags & 1) != 0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_content);
      objc_msgSend(WeakRetained, "feedViewController:willTransitionToContentHeight:", self, v27);
LABEL_15:

    }
  }
LABEL_16:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
  v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "content"));
  if (v36)
  {
    v37 = (void *)v36;
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "info"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("TUIRenderInfoKeyIsFinal")));
    v41 = objc_msgSend(v40, "BOOLValue");

    if (v41)
      -[TUISyncLayoutController setContentHeightFactorForScrollingGuess:](self->_syncLayoutController, "setContentHeightFactorForScrollingGuess:", NAN);
    if (!v8)
      goto LABEL_4;
  }
  else
  {

    if (!v8)
      goto LABEL_4;
  }
  if (!self->_syncLayoutController)
  {
LABEL_4:
    if (v9)
      v9[2](v9);
    goto LABEL_29;
  }
  -[TUIRenderReferenceOverrideProvider beginViewUpdates](self->_renderOverrideProvider, "beginViewUpdates");
  objc_msgSend(v8, "applyToFeedView:completion:", self->_syncLayoutController, v9);
  -[TUIRenderReferenceOverrideProvider endViewUpdates](self->_renderOverrideProvider, "endViewUpdates");
  if (-[TUIFeedViewController isContentVisible](self, "isContentVisible") && !self->_updateEnvironmentOnViewLoad)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "to"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "anchorSet"));

    if (v43)
    {
      dropController = self->_dropController;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "computeTriggerStatesInScrollView:axis:", v45, 2));
      -[TUIDropController updateTriggerStatesWithNewStates:updateEvent:](dropController, "updateTriggerStatesWithNewStates:updateEvent:", v46, 2);

    }
  }
  -[NSHashTable attemptPendingScrolls](self->_heightLayoutConditions, "attemptPendingScrolls");
  linkEntityController = self->_linkEntityController;
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _renderModel](self, "_renderModel"));
  -[TUISyncLayoutController visibleBounds](self->_syncLayoutController, "visibleBounds");
  v50 = v49;
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController currentViewState](self->_syncLayoutController, "currentViewState"));
  -[TUILinkEntityController updatePrioritiesForRenderModel:visibleRect:viewState:](linkEntityController, "updatePrioritiesForRenderModel:visibleRect:viewState:", v48, v57, v50, v52, v54, v56);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v58, "updateSections");

LABEL_29:
}

- (void)applyUpdate:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_110EF8;
  v4[3] = &unk_23D7D0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  TUIDispatchAsyncViaRunLoop((uint64_t)v4);

}

- (void)_updateNavigationBarItems
{
  void *v3;
  uint64_t v4;
  TUIFeedOverlayDebugView *overlayDebugView;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_content);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationItem](self, "navigationItem"));
  if ((objc_opt_respondsToSelector(WeakRetained, "feedViewControllerNavigationBarItem:") & 1) != 0)
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "feedViewControllerNavigationBarItem:", self));

    v3 = (void *)v4;
  }
  -[TUIFeedOverlayDebugView updateWithRenderModel:factory:triggerManager:promoteAccessory:](self->_overlayDebugView, "updateWithRenderModel:factory:triggerManager:promoteAccessory:", self->_visibleOverride, self, self->_dropController, -[TUIFeedViewController shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility](self, "shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility"));
  self->_updatingNavigationBarItems = 1;
  overlayDebugView = self->_overlayDebugView;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController feedView](self, "feedView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController extraLeftItems](self, "extraLeftItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController extraRightItems](self, "extraRightItems"));
  v9 = -[TUIFeedOverlayDebugView configureNavigationItem:scrollView:extraLeftItems:extraRightItems:](overlayDebugView, "configureNavigationItem:scrollView:extraLeftItems:extraRightItems:", v3, v6, v7, v8);

  -[TUIFeedViewController updateNavigationBarOpacity](self, "updateNavigationBarOpacity");
  if ((objc_opt_respondsToSelector(WeakRetained, "navigationBarItemsDidUpdate:hasItems:") & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarItemsDidUpdate:hasItems:", self, v9);
  self->_updatingNavigationBarItems = 0;

}

- (void)updateNavigationBarOpacity
{
  TUIFeedOverlayDebugView *overlayDebugView;
  TUIDropController *dropController;
  void *v5;
  void *v6;
  double v7;
  double v8;

  overlayDebugView = self->_overlayDebugView;
  if (overlayDebugView)
  {
    dropController = self->_dropController;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView anchorSet](self->_feedView, "anchorSet"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
    -[TUIFeedOverlayDebugView navigationBarBackgroundOpacity:anchors:scrollView:](overlayDebugView, "navigationBarBackgroundOpacity:anchors:scrollView:", dropController, v5, v6);
    v8 = v7;

    -[TUIFeedViewController setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:](self, "setNavBarBackgroundOpacity:manualScrollEdgeAppearanceEnabled:", 1, v8);
  }
}

- (void)_updateNavigationItemTriggerObservanceForCurrentRenderModel:(id)a3 previous:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  if (v7)
    -[TUIFeedViewController _removeTriggerObservationForRenderModel:](self, "_removeTriggerObservationForRenderModel:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "triggers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[TUIDropController addObserver:forTrigger:](self->_dropController, "addObserver:forTrigger:", self, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_removeTriggerObservationForRenderModel:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "triggers", 0));
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
        -[TUIDropController removeObserver:forTrigger:](self->_dropController, "removeObserver:forTrigger:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)handleTrigger:(id)a3 didChangeState:(unint64_t)a4 updateEvent:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  if (a5 <= 3 && a5 != 2 && !self->_updatingNavigationBarItems)
  {
    v8 = v7;
    -[TUIFeedViewController _updateNavigationBarItems](self, "_updateNavigationBarItems");
    v7 = v8;
  }

}

- (void)feedLayoutController:(id)a3 updateStats:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[TUISyncLayoutController setStats:](self->_syncLayoutController, "setStats:", v5);

}

- (void)feedLayoutControllerAllContentReady:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 8) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    objc_msgSend(WeakRetained, "feedViewControllerAllContentReady:", self);

  }
}

- (void)feedLayoutControllerInitialContentReady:(id)a3
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 0x10) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    objc_msgSend(WeakRetained, "feedViewControllerInitialContentReady:", self);

  }
}

- (void)feedLayoutController:(id)a3 axModelSections:(id)a4 renderModelCollection:(id)a5 renderModelSections:(id)a6
{
  TUIAXModel *v10;
  TUIAXEvaluationContext *v11;
  TUIAXElement *v12;
  void *v13;
  TUIAXElement *v14;
  TUIAXElement *topLevelAXElement;
  NSMutableDictionary *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  double x;
  double y;
  double width;
  double height;
  char *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  TUIAXElement *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  TUIAXEvaluationContext *v46;
  double v47;
  void *v48;
  id v49;
  double v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  TUIAXElement *v59;
  void *v60;
  TUIAXElement *v61;
  void *v62;
  void *v63;
  id v64;
  TUIFeedViewController *v65;
  NSMutableArray *v66;
  id v67;
  id v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  TUIAXElement *v74;
  _BYTE v75[128];
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v64 = a3;
  v68 = a4;
  v67 = a5;
  v69 = a6;
  if (!self->_topLevelAXElement)
  {
    v10 = objc_opt_new(TUIAXModel);
    v11 = objc_opt_new(TUIAXEvaluationContext);
    -[TUIAXEvaluationContext setScreenOffsetProvider:](v11, "setScreenOffsetProvider:", self);
    -[TUIAXEvaluationContext setSectionOffset:](v11, "setSectionOffset:", CGPointZero.x, CGPointZero.y);
    v12 = [TUIAXElement alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
    v14 = -[TUIAXElement initWithEvaluationContext:accessibilityContainer:](v12, "initWithEvaluationContext:accessibilityContainer:", v11, v13);
    topLevelAXElement = self->_topLevelAXElement;
    self->_topLevelAXElement = v14;

    -[TUIAXElement updateWithAXModel:](self->_topLevelAXElement, "updateWithAXModel:", v10);
  }
  v16 = objc_opt_new(NSMutableDictionary);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v65 = self;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityElements](self->_topLevelAXElement, "accessibilityElements"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v71 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)i);
        v23 = objc_opt_class(TUIAXElement);
        v24 = TUIDynamicCast(v23, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "context"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "sectionIndex")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v25, v27);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    }
    while (v19);
  }

  v28 = v68;
  v29 = (char *)objc_msgSend(v68, "count");
  v66 = objc_opt_new(NSMutableArray);
  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  if (v29)
  {
    v34 = 0;
    v35 = CGPointZero.y;
    do
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", v36));

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v34));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v34));
      v40 = (TUIAXElement *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", v39));

      if ((objc_msgSend(v38, "hidden") & 1) == 0)
      {
        if (v40)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v40, "context"));
          objc_msgSend(v41, "setSectionOffset:", CGPointZero.x, v35);

          objc_msgSend(v67, "size");
          v43 = v42;
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v40, "context"));
          objc_msgSend(v44, "setTotalContentHeight:", v43);

          v45 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement context](v40, "context"));
          objc_msgSend(v45, "setRenderModelSection:", v37);

          -[TUIAXElement updateWithAXModel:](v40, "updateWithAXModel:", v38);
        }
        else
        {
          v46 = objc_opt_new(TUIAXEvaluationContext);
          -[TUIAXEvaluationContext setScreenOffsetProvider:](v46, "setScreenOffsetProvider:", v65);
          -[TUIAXEvaluationContext setSectionOffset:](v46, "setSectionOffset:", CGPointZero.x, v35);
          objc_msgSend(v67, "size");
          -[TUIAXEvaluationContext setTotalContentHeight:](v46, "setTotalContentHeight:", v47);
          -[TUIAXEvaluationContext setSectionIndex:](v46, "setSectionIndex:", v34);
          -[TUIAXEvaluationContext setRenderModelSection:](v46, "setRenderModelSection:", v37);
          v40 = -[TUIAXElement initWithEvaluationContext:accessibilityContainer:]([TUIAXElement alloc], "initWithEvaluationContext:accessibilityContainer:", v46, v65->_topLevelAXElement);
          -[TUIAXElement updateWithAXModel:](v40, "updateWithAXModel:", v38);

        }
        if (-[TUIAXElement isAccessibilityElement](v40, "isAccessibilityElement")
          || (v48 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement accessibilityElements](v40, "accessibilityElements")),
              v49 = objc_msgSend(v48, "count"),
              v48,
              v49))
        {
          -[NSMutableArray addObject:](v66, "addObject:", v40);
        }
        objc_msgSend(v38, "accessibilityFrameRelativeToScrollAncestor");
        v79 = CGRectOffset(v76, CGPointZero.x, v35);
        v77.origin.x = x;
        v77.origin.y = y;
        v77.size.width = width;
        v77.size.height = height;
        v78 = CGRectUnion(v77, v79);
        x = v78.origin.x;
        y = v78.origin.y;
        width = v78.size.width;
        height = v78.size.height;
        objc_msgSend(v37, "frame");
        v35 = v35 + v50;
        v28 = v68;
      }

      ++v34;
    }
    while (v29 != v34);
  }
  v51 = -[NSMutableArray copy](v66, "copy");
  -[TUIAXElement setChildren:](v65->_topLevelAXElement, "setChildren:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement axModel](v65->_topLevelAXElement, "axModel"));
  objc_msgSend(v52, "setAccessibilityFrameRelativeToScrollAncestor:", x, y, width, height);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](v65, "view"));
  -[TUIAXElement setAccessibilityContainer:](v65->_topLevelAXElement, "setAccessibilityContainer:", v53);

  v54 = objc_opt_class(TUIAXElement);
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](v65, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "accessibilityElements"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "firstObject"));
  v58 = TUIDynamicCast(v54, v57);
  v59 = (TUIAXElement *)objc_claimAutoreleasedReturnValue(v58);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TUIAXElement children](v65->_topLevelAXElement, "children"));
  if (objc_msgSend(v60, "count"))
  {
    v61 = v65->_topLevelAXElement;

    if (v59 != v61)
    {
      v74 = v65->_topLevelAXElement;
      v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v74, 1));
      v63 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](v65, "view"));
      objc_msgSend(v63, "setAccessibilityElements:", v62);

      v28 = v68;
      if (-[TUIFeedViewController visibilityProviderIsVisible](v65, "visibilityProviderIsVisible"))
        UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v65->_topLevelAXElement);
    }
  }
  else
  {

  }
}

- (void)feedLayoutController:(id)a3 willTransitionToLayoutState:(unint64_t)a4
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 2) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    objc_msgSend(WeakRetained, "feedViewController:willTransitionToLayoutState:", self, a4);

  }
}

- (void)feedLayoutController:(id)a3 didTransitionToLayoutState:(unint64_t)a4
{
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateFlags & 4) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_content);
    objc_msgSend(WeakRetained, "feedViewController:didTransitionToLayoutState:", self, a4);

  }
}

- (void)collectStatsWithCompletion:(id)a3
{
  -[TUIFeedView collectStatsWithCompletion:](self->_feedView, "collectStatsWithCompletion:", a3);
}

- (void)scrollToRefId:(id)a3 refInstance:(id)a4 onEntry:(id)a5 animated:(BOOL)a6 skipVoiceOverFocus:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = a7;
  v8 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uid"));

  v18 = (id)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v15, v16, v14, v13));
  -[NSHashTable addScrollQuery:animated:skipVoiceOverFocus:](self->_heightLayoutConditions, "addScrollQuery:animated:skipVoiceOverFocus:", v18, v8, v7);
  if (_AXSFullKeyboardAccessEnabled(-[NSHashTable attemptPendingScrolls](self->_heightLayoutConditions, "attemptPendingScrolls")))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
    _UIAXAssignFocusToItem();

  }
}

- (id)renderReferencesMatchingQuery:(id)a3
{
  TUISyncLayoutController *syncLayoutController;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  CGAffineTransform v15;

  syncLayoutController = self->_syncLayoutController;
  v5 = a3;
  -[TUISyncLayoutController saveViewStateForVisibleViews](syncLayoutController, "saveViewStateForVisibleViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController currentViewState](self->_syncLayoutController, "currentViewState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceCollector referenceCollectorWithViewState:](TUIRenderReferenceCollector, "referenceCollectorWithViewState:", v6));

  -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController renderModel](self->_syncLayoutController, "renderModel"));
  CGAffineTransformMakeTranslation(&v15, -v9, -v11);
  objc_msgSend(v12, "appendReferencesToCollector:transform:query:liveTransformResolver:", v7, &v15, v5, self->_syncLayoutController);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "renderReferences"));
  return v13;
}

- (id)navigationBarItemMatchingQuery:(id)a3
{
  TUIFeedOverlayDebugView *overlayDebugView;

  overlayDebugView = self->_overlayDebugView;
  if (overlayDebugView)
    overlayDebugView = (TUIFeedOverlayDebugView *)objc_claimAutoreleasedReturnValue(-[TUIFeedOverlayDebugView navigationBarItemMatchingQuery:](overlayDebugView, "navigationBarItemMatchingQuery:", a3));
  return overlayDebugView;
}

- (id)imageResourcesMatchingQuery:(id)a3
{
  void *v3;
  NSMutableDictionary *v4;
  id v5;
  id v6;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  NSMutableDictionary *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController renderReferencesMatchingQuery:](self, "renderReferencesMatchingQuery:", a3));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_111F70;
  v11 = &unk_241A10;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[TUIResourceCollector createImageResourceCollector](TUIResourceCollector, "createImageResourceCollector"));
  v13 = objc_opt_new(NSMutableDictionary);
  v4 = v13;
  v5 = v12;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &v8);
  v6 = -[NSMutableDictionary copy](v4, "copy", v8, v9, v10, v11);

  return v6;
}

- (void)scrollToItemsMatchingQuery:(id)a3 atScrollPosition:(unint64_t)a4 animated:(BOOL)a5 skipVoiceOverFocus:(BOOL)a6
{
  objc_msgSend((id)self->_feedId.uniqueIdentifier, "scrollToItemsMatchingQuery:atScrollPosition:animated:skipVoiceOverFocus:", a3, a4, a5, a6);
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  TUISyncLayoutController *syncLayoutController;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;

  syncLayoutController = self->_syncLayoutController;
  -[TUIFeedViewController _viewSize](self, "_viewSize", a3);
  v30 = v6;
  v31 = v5;
  -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
  v28 = v8;
  v29 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v9, "contentInset");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[TUISyncLayoutController safeAreaInsets](self->_syncLayoutController, "safeAreaInsets");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController tabBarController](self, "tabBarController"));
  -[TUISyncLayoutController updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:](syncLayoutController, "updateLiveTransformsIfNecessaryWithViewSize:contentOffset:contentInsets:safeAreaInsets:hasTabBar:", v26 != 0, v31, v30, v29, v28, v11, v13, v15, v17, v19, v21, v23, v25);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[TUIEmbeddedScrollViewCoordinator rootCollector](self->_embeddedScrollViewCoordinator, "rootCollector"));
  objc_msgSend(v27, "updateVisibleBounds");

  -[TUIHostingController updatedVisibleBoundsOfScrollView:](self->_hostingController, "updatedVisibleBoundsOfScrollView:", self->_syncLayoutController);
}

- (id)waitForVisibleImageResourcesToLoadAssertionWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v22[5];
  id v23;
  id v24;
  os_signpost_id_t v25;
  uint8_t buf[16];

  v6 = a4;
  v7 = TUISignpostFeedViewController();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = TUISignpostFeedViewController();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_0, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "waitForVisibleImageResources", (const char *)&unk_23007A, buf, 2u);
  }

  -[TUISyncLayoutController saveViewStateForVisibleViews](self->_syncLayoutController, "saveViewStateForVisibleViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIRunLoopWaiter sharedInstance](_TUIRunLoopWaiter, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedAutoScrollController userInteractiveCallbackQueue](self->_autoScrollController, "userInteractiveCallbackQueue"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "notReadyAssertionWithTimeout:queue:", v14, a3));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIRunLoopWaiter sharedInstance](_TUIRunLoopWaiter, "sharedInstance"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_112380;
  v22[3] = &unk_241A60;
  v22[4] = self;
  v17 = v15;
  v24 = v6;
  v25 = v9;
  v23 = v17;
  v18 = v6;
  objc_msgSend(v16, "addPreCommitBlock:", v22);

  v19 = v24;
  v20 = v17;

  return v20;
}

- (void)notifyWhenVisibleImageResourcesAreLoadedWithTimeout:(double)a3 completion:(id)a4
{
  id v6;
  _TUIRunLoopAssertion *v7;
  dispatch_time_t v8;
  void *v9;
  _TUIRunLoopAssertion *v10;
  _QWORD v11[5];
  _TUIRunLoopAssertion *v12;
  _QWORD block[5];
  _QWORD v14[5];
  _QWORD v15[5];
  id v16;

  v6 = a4;
  -[TUISyncLayoutController saveViewStateForVisibleViews](self->_syncLayoutController, "saveViewStateForVisibleViews");
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = sub_1127E4;
  v15[4] = sub_11280C;
  v16 = objc_retainBlock(v6);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_112814;
  v14[3] = &unk_240288;
  v14[4] = v15;
  v7 = -[_TUIRunLoopAssertion initWithCompletion:]([_TUIRunLoopAssertion alloc], "initWithCompletion:", v14);
  v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1128BC;
  block[3] = &unk_240288;
  block[4] = v15;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_TUIRunLoopWaiter sharedInstance](_TUIRunLoopWaiter, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_112910;
  v11[3] = &unk_23D7D0;
  v11[4] = self;
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "addPreCommitBlock:", v11);

  _Block_object_dispose(v15, 8);
}

- (void)configureWithSyncLayoutController:(id)a3
{
  objc_storeStrong((id *)&self->_linkEntityTracker, a3);
}

- (id)_effectiveSyncLayoutController
{
  TUIVisibilityTracker *linkEntityTracker;
  void *v4;
  uint64_t v5;
  TUIVisibilityTracker *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id WeakRetained;
  char v12;
  TUIVisibilityTracker *v13;
  TUIVisibilityTracker *v14;

  linkEntityTracker = self->_linkEntityTracker;
  if (!linkEntityTracker)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController parentViewController](self, "parentViewController"));
    if (v4
      || (v5 = objc_claimAutoreleasedReturnValue(-[TUIFeedViewController presentingViewController](self, "presentingViewController")),
          0,
          (v4 = (void *)v5) != 0))
    {
      while (1)
      {
        if ((objc_opt_respondsToSelector(v4, "syncLayoutController") & 1) != 0)
        {
          v6 = (TUIVisibilityTracker *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "syncLayoutController"));
          if (v6)
            break;
        }
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewController"));
        v8 = v7;
        if (v7)
          v9 = v7;
        else
          v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "presentingViewController"));
        v10 = v9;

        v4 = v10;
        if (!v10)
          goto LABEL_10;
      }
      v14 = self->_linkEntityTracker;
      self->_linkEntityTracker = v6;
      v13 = v6;

    }
    else
    {
LABEL_10:
      WeakRetained = objc_loadWeakRetained((id *)&self->_content);
      v12 = objc_opt_respondsToSelector(WeakRetained, "feedViewControllerNeedsSyncLayoutController:");

      if ((v12 & 1) == 0)
      {
        v4 = 0;
LABEL_15:

        linkEntityTracker = self->_linkEntityTracker;
        return linkEntityTracker;
      }
      v13 = (TUIVisibilityTracker *)objc_loadWeakRetained((id *)&self->_content);
      -[TUIVisibilityTracker feedViewControllerNeedsSyncLayoutController:](v13, "feedViewControllerNeedsSyncLayoutController:", self);
      v4 = 0;
    }

    goto LABEL_15;
  }
  return linkEntityTracker;
}

- (void)addRenderOverride:(id)a3
{
  -[TUIFeedViewController addRenderOverride:animated:duration:](self, "addRenderOverride:animated:duration:", a3, 0, 0.0);
}

- (void)removeRenderOverride:(id)a3
{
  -[TUIFeedViewController removeRenderOverride:animated:duration:](self, "removeRenderOverride:animated:duration:", a3, 0, 0.0);
}

- (void)addRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_112D30;
    v10[3] = &unk_23D7D0;
    v10[4] = self;
    v11 = v8;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, a5);

  }
  else
  {
    objc_msgSend((id)self->_feedId.uniqueIdentifier, "addRenderOverride:", v8);
  }

}

- (void)removeRenderOverride:(id)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_112E3C;
    v10[3] = &unk_23D7D0;
    v10[4] = self;
    v11 = v8;
    +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v10, a5);

  }
  else
  {
    objc_msgSend((id)self->_feedId.uniqueIdentifier, "removeRenderOverride:", v8);
  }

}

- (id)viewFactoryDequeueReusableSubviewWithReuseIdentifier:(id)a3 indexPath:(id)a4 host:(id)a5
{
  TUISyncLayoutController *syncLayoutController;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  syncLayoutController = self->_syncLayoutController;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController viewFactory](syncLayoutController, "viewFactory"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewFactoryDequeueReusableSubviewWithReuseIdentifier:indexPath:host:", v10, v9, v8));

  return v12;
}

- (void)viewFactoryPrepareToReuseHost:(id)a3
{
  TUIDynamicInstance *feedContentLayoutStackNameInstance;
  id v4;
  id v5;

  feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TUIDynamicInstance subviewPool](feedContentLayoutStackNameInstance, "subviewPool"));
  objc_msgSend(v5, "prepareToReuseHost:", v4);

}

- (void)viewFactoryReuseSubviews:(id)a3 host:(id)a4
{
  TUIDynamicInstance *feedContentLayoutStackNameInstance;
  id v6;
  id v7;
  id v8;

  feedContentLayoutStackNameInstance = self->_feedContentLayoutStackNameInstance;
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TUIDynamicInstance subviewPool](feedContentLayoutStackNameInstance, "subviewPool"));
  objc_msgSend(v8, "reuseSubviews:host:", v7, v6);

}

- (TUIReusableSubviewPool)subviewPool
{
  return (TUIReusableSubviewPool *)-[TUIDynamicInstance subviewPool](self->_feedContentLayoutStackNameInstance, "subviewPool");
}

- (id)descendentViewWithIdentifier:(id)a3
{
  return -[TUISyncLayoutController descendentViewWithIdentifier:](self->_syncLayoutController, "descendentViewWithIdentifier:", a3);
}

- (BOOL)handleActionForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  TUIVisibilityController *visibilityController;
  unsigned __int8 v17;
  id v18;
  NSObject *v19;
  int v21;
  TUIVisibilityController *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = objc_opt_class(TUIFeedEntry);
  v12 = TUIDynamicCast(v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = TUIDefaultLog();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    visibilityController = self->_visibilityController;
    v21 = 134218498;
    v22 = visibilityController;
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "[fid:%lu] handling action: %@: parameters: %@", (uint8_t *)&v21, 0x20u);
  }

  v17 = objc_msgSend(v13, "handleBehaviorWithName:arguments:", v8, v9);
  if ((v17 & 1) == 0)
  {
    v18 = TUIDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_17ED70((uint64_t)self, (uint64_t)v8, v19);

  }
  return v17;
}

- (id)dragItemForObject:(id)a3 withName:(id)a4 arguments:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD v17[5];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_class(TUIFeedEntry);
  v12 = TUIDynamicCast(v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_113254;
  v17[3] = &unk_241A88;
  v17[4] = self;
  v14 = objc_retainBlock(v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dragItemForFeedEntry:name:arguments:imageResourceBlock:", v10, v9, v8, v14));

  return v15;
}

- (void)didBeginDraggingView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = objc_opt_class(TUIFeedView);
  v5 = TUIPlatformAncestorOfClass(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "suspendReuseOfView:", v3);

}

- (void)didEndDraggingView:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = objc_opt_class(TUIFeedView);
  v5 = TUIPlatformAncestorOfClass(v3, v4);
  v6 = (id)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v6, "resumeReuseOfView:", v3);

}

- (void)performDropWithSession:(id)a3 actionObject:(id)a4 behavior:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(TUIFeedEntry);
  v11 = TUIDynamicCast(v10, v8);
  v12 = (id)objc_claimAutoreleasedReturnValue(v11);

  objc_msgSend(v12, "performDropWithSession:behavior:", v9, v7);
}

- (BOOL)canHandleDropSession:(id)a3 actionObject:(id)a4 behavior:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_opt_class(TUIFeedEntry);
  v11 = TUIDynamicCast(v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  LOBYTE(v8) = objc_msgSend(v12, "canHandleDropSession:behavior:", v9, v7);
  return (char)v8;
}

- (unint64_t)layoutDirection
{
  return -[TUIEnvironment layoutDirection](self->_environment, "layoutDirection");
}

- (void)impressionController:(id)a3 didUpdateSnapshot:(id)a4
{
  id v4;
  _QWORD v5[5];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_113558;
  v5[3] = &unk_23D7D0;
  v5[4] = self;
  v6 = a4;
  v4 = v6;
  TUIDispatchAsyncViaRunLoop((uint64_t)v5);

}

- (id)visibilityProviderHostingLayer
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));

  return v3;
}

- (id)visibilityProviderWindowLayer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layer"));

  return v4;
}

- (CGRect)visibilityProviderVisibleBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v12, "adjustedContentInset");
  v14 = v5 + v13;
  v16 = v7 + v15;
  v18 = v9 - (v13 + v17);
  v20 = v11 - (v15 + v19);

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)visibilityProviderSections
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController _renderModel](self, "_renderModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sections"));

  return v3;
}

- (BOOL)visibilityProviderIsVisible
{
  void *v3;
  id v4;
  id WeakRetained;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController viewIfLoaded](self, "viewIfLoaded"));
  if ((objc_msgSend(v3, "isHidden") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));

    if (v4)
    {
      if ((*(_BYTE *)&self->_delegateFlags & 0x20) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_content);
        v4 = objc_msgSend(WeakRetained, "feedViewControllerIsConsideredVisible:", self);

      }
      else
      {
        v4 = &dword_0 + 1;
      }
    }
  }
  -[TUIHostingController setVisible:](self->_hostingController, "setVisible:", v4);

  return (char)v4;
}

- (BOOL)visibilityProviderIsScrolling
{
  if ((-[TUISyncLayoutController isDragging](self->_syncLayoutController, "isDragging") & 1) != 0
    || (-[TUISyncLayoutController isTracking](self->_syncLayoutController, "isTracking") & 1) != 0
    || (-[TUISyncLayoutController isDecelerating](self->_syncLayoutController, "isDecelerating") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[TUISyncLayoutController _isAnimatingScroll](self->_syncLayoutController, "_isAnimatingScroll");
  }
}

- (void)updateVisibility
{
  -[TUIEmbeddedScrollViewCoordinator updateVisible](self->_embeddedScrollViewCoordinator, "updateVisible");
}

- (CGRect)screenCoordinatesForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
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

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController scrollView](self, "scrollView"));
  objc_msgSend(v7, "convertRect:toView:", 0, x, y, width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  CGPoint result;

  -[TUISyncLayoutController contentOffset](self->_syncLayoutController, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)boundsForFeedView
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TUISyncLayoutController bounds](self->_syncLayoutController, "bounds");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)availableHeight
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[TUISyncLayoutController safeAreaInsets](self->_syncLayoutController, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  -[TUISyncLayoutController bounds](self->_syncLayoutController, "bounds");
  return v7 - v6 - v4;
}

- (id)feedViewForAX
{
  return self->_syncLayoutController;
}

- (void)imagePrefetchControllerDidStartLoadingInitialResources:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController layoutController](self, "layoutController", a3));
  objc_msgSend(v3, "statRecordResourcesStartLoadingDate");

}

- (void)imagePrefetchControllerDidLoadAllResources:(id)a3
{
  id v4;

  -[TUIFeedViewController _updateDatesCollectorInitialResourcesRenderedDate](self, "_updateDatesCollectorInitialResourcesRenderedDate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController layoutController](self, "layoutController"));
  objc_msgSend(v4, "statRecordResourcesLoadedDate");

}

- (void)reportLargeLayer:(id)a3 renderModel:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  TUIVisibilityController *visibilityController;
  CGFloat v12;
  CGFloat v13;
  NSString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[3];
  uint8_t buf[4];
  TUIVisibilityController *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  CGSize v37;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(v6);
  if (v8 != objc_opt_class(CATiledLayer))
  {
    v9 = TUIDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      visibilityController = self->_visibilityController;
      objc_msgSend(v6, "bounds");
      v37.width = v12;
      v37.height = v13;
      v14 = NSStringFromCGSize(v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content"));
      *(_DWORD *)buf = 134219010;
      v28 = visibilityController;
      v29 = 2114;
      v30 = v6;
      v31 = 2114;
      v32 = v15;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = v16;
      _os_log_error_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "[fid:%lu] unexpected large layer used: layer=%{public}@ size=%{public}@ renderModel=%{public}@ content=%{public}@", buf, 0x34u);

    }
    if (_TUIDeviceHasInternalInstall())
    {
      v17 = objc_alloc((Class)NSException);
      v24 = CFSTR("layer");
      v18 = v6;
      if (!v6)
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", v24));
      v26[0] = v18;
      v25 = CFSTR("renderModel");
      v19 = v7;
      if (!v7)
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController content](self, "content", v24, v25, CFSTR("content"), v26[0], v19));
      v21 = v20;
      if (!v20)
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v26[2] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, &v24, 3));
      v23 = objc_autorelease(objc_msgSend(v17, "initWithName:reason:userInfo:", CFSTR("LargeLayer"), CFSTR("A very large layer was used; this is not expected"),
                v22));

      if (!v20)
      if (!v7)

      if (!v6)
      objc_exception_throw(v23);
    }
  }

}

- (void)didAddChildViewController:(id)a3
{
  _objc_msgSend(a3, "didMoveToParentViewController:", self);
}

- (id)renderReferenceOverrideObservers
{
  NSMutableArray *v3;
  id v4;

  v3 = objc_opt_new(NSMutableArray);
  -[TUISyncLayoutController appendRenderOverrideObservers:](self->_syncLayoutController, "appendRenderOverrideObservers:", v3);
  v4 = -[NSMutableArray copy](v3, "copy");

  return v4;
}

- (void)dynamicChanged:(id)a3 transaction:(id)a4
{
  TUIFeedViewState *v6;
  TUIFeedViewState *v7;
  id v8;

  v8 = a4;
  v6 = (TUIFeedViewState *)a3;
  os_unfair_lock_lock(&self->_lock);
  v7 = self->_restoreViewState;
  os_unfair_lock_unlock(&self->_lock);

  if (v7 == v6)
    -[TUIFeedView layoutIfNeededWithTransaction:](self->_feedView, "layoutIfNeededWithTransaction:", v8);

}

- (BOOL)shouldPromoteLargeTitleAccessoryViewButtonsForAccessibility
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedViewController navigationController](self, "navigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationBar"));
  if (objc_msgSend(v3, "prefersLargeTitles"))
    v4 = UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
  else
    v4 = 0;

  return v4;
}

- (id)topLevelAXElement
{
  return self->_topLevelAXElement;
}

- (void)hostingControllerGeometryUpdated:(id)a3
{
  -[TUIFeedViewController _updateHostingGeometryMapWithTransaction:](self, "_updateHostingGeometryMapWithTransaction:", self->_auxiliaryRenderModel);
}

- (id)resolveViewWithPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v17;
    v9 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (v7)
        {
          if ((v9 & 1) != 0)
            v12 = v11;
          else
            v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i), "tui_identifierWithoutUUID"));
          v13 = v12;
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "descendentViewWithIdentifier:", v12, (_QWORD)v16));

          v7 = (void *)v14;
          if (!v14)
            goto LABEL_17;
        }
        else
        {
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUISyncLayoutController descendentViewWithIdentifier:](self->_syncLayoutController, "descendentViewWithIdentifier:", v11, (_QWORD)v16));
          v9 = 0;
          if (!v7)
            goto LABEL_17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
LABEL_17:

  return v7;
}

- (void)setPerformanceIdentifier:(id)a3
{
  TUIManager *v4;
  TUIManager *manager;
  unsigned __int8 v6;
  TUIManager *v7;
  TUIManager *v8;
  void *v9;
  TUIManager *v10;

  v4 = (TUIManager *)a3;
  manager = self->_manager;
  if (manager != v4)
  {
    v10 = v4;
    v6 = -[TUIManager isEqual:](manager, "isEqual:", v4);
    v4 = v10;
    if ((v6 & 1) == 0)
    {
      v7 = (TUIManager *)-[TUIManager copy](v10, "copy");
      v8 = self->_manager;
      self->_manager = v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TUIFeedView transactionCoordinator](self->_feedView, "transactionCoordinator"));
      objc_msgSend(v9, "updatePerformanceIdentifier:", v10);

      v4 = v10;
    }
  }

}

- (void)debugDumpEnvironmentContainerStructure
{
  -[TUIFeedView debugDumpEnvironmentContainerStructure](self->_feedView, "debugDumpEnvironmentContainerStructure");
}

- (TUIPagedScrollableControlling)pagedScrollableController
{
  return self->_delegate;
}

- (TUIEmbeddedScrollViewCoordinator)embeddedScrollViewCoordinator
{
  return (TUIEmbeddedScrollViewCoordinator *)self->_pagedScrollableController;
}

- (TUIVisibilityController)visibilityController
{
  return (TUIVisibilityController *)self->_embeddedScrollViewCoordinator;
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_visibilityController;
}

- (TUIRenderReferenceOverrideProvider)renderOverrideProvider
{
  return (TUIRenderReferenceOverrideProvider *)self->_feedId.uniqueIdentifier;
}

- (void)setRenderOverrideProvider:(id)a3
{
  objc_storeStrong((id *)&self->_feedId, a3);
}

- (TUIHostingController)hostingController
{
  return (TUIHostingController *)self->_renderOverrideProvider;
}

- (TUIViewVisibilityController)viewVisibilityController
{
  return (TUIViewVisibilityController *)self->_hostingController;
}

- (unint64_t)options
{
  return (unint64_t)self->_viewVisibilityController;
}

- (void)setOptions:(unint64_t)a3
{
  self->_viewVisibilityController = (TUIViewVisibilityController *)a3;
}

- (TUIImpressionController)impressionController
{
  return (TUIImpressionController *)self->_options;
}

- (TUILinkEntityController)linkEntityController
{
  return (TUILinkEntityController *)self->_impressionController;
}

- (TUIImagePrefetchController)imagePrefetchController
{
  return (TUIImagePrefetchController *)self->_linkEntityController;
}

- (TUIDropController)dropController
{
  return (TUIDropController *)self->_imagePrefetchController;
}

- (BOOL)avoidSyncTransactionInViewWillAppear
{
  return *((_BYTE *)&self->_flags + 1);
}

- (void)setAvoidSyncTransactionInViewWillAppear:(BOOL)a3
{
  *((_BYTE *)&self->_flags + 1) = a3;
}

- (TUITriggerStateManager)triggerStateManager
{
  return (TUITriggerStateManager *)self->_dropController;
}

- (void)setTriggerStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_dropController, a3);
}

- (TUITemplateFactory)templateFactory
{
  return (TUITemplateFactory *)self->_triggerStateManager;
}

- (TUIManager)manager
{
  return (TUIManager *)self->_templateFactory;
}

- (NSNumber)performanceIdentifier
{
  return (NSNumber *)self->_manager;
}

- (float)visiblePriority
{
  return *(float *)&self->_viewDidDisappearWasCalled;
}

- (void)setVisiblePriority:(float)a3
{
  *(float *)&self->_viewDidDisappearWasCalled = a3;
}

- (float)hiddenPriority
{
  return self->_visiblePriority;
}

- (void)setHiddenPriority:(float)a3
{
  self->_visiblePriority = a3;
}

- (BOOL)updateEnvironmentOnViewLoad
{
  return *((_BYTE *)&self->_flags + 2);
}

- (void)setUpdateEnvironmentOnViewLoad:(BOOL)a3
{
  *((_BYTE *)&self->_flags + 2) = a3;
}

- (NSArray)extraLeftItems
{
  return (NSArray *)self->_performanceIdentifier;
}

- (void)setExtraLeftItems:(id)a3
{
  objc_storeStrong((id *)&self->_performanceIdentifier, a3);
}

- (NSArray)extraRightItems
{
  return self->_extraLeftItems;
}

- (void)setExtraRightItems:(id)a3
{
  objc_storeStrong((id *)&self->_extraLeftItems, a3);
}

- (BOOL)showsVerticalScrollIndicator
{
  return *((_BYTE *)&self->_flags + 3);
}

- (TUIContextMenuConfigurationProviding)contextMenuConfigurationProvider
{
  return (TUIContextMenuConfigurationProviding *)objc_loadWeakRetained((id *)&self->_extraRightItems);
}

- (void)setContextMenuConfigurationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_extraRightItems, a3);
}

- (double)viewTransitionSyncTimeoutDuration
{
  return *(double *)&self->_contextMenuConfigurationProvider;
}

- (void)setViewTransitionSyncTimeoutDuration:(double)a3
{
  *(double *)&self->_contextMenuConfigurationProvider = a3;
}

- (double)viewAppearingingSyncTimeoutDuration
{
  return self->_viewTransitionSyncTimeoutDuration;
}

- (void)setViewAppearingingSyncTimeoutDuration:(double)a3
{
  self->_viewTransitionSyncTimeoutDuration = a3;
}

- (unint64_t)liveResizeOptions
{
  return *(_QWORD *)&self->_viewAppearingingSyncTimeoutDuration;
}

- (unint64_t)heightGuessForScrollingOption
{
  return self->_liveResizeOptions;
}

- (void)setHeightGuessForScrollingOption:(unint64_t)a3
{
  self->_liveResizeOptions = a3;
}

- (TUIKeyboardAvoidingSupport)keyboardSupport
{
  return (TUIKeyboardAvoidingSupport *)self->_heightGuessForScrollingOption;
}

- (void)setKeyboardSupport:(id)a3
{
  objc_storeStrong((id *)&self->_heightGuessForScrollingOption, a3);
}

- (TUIMutableViewState)savedViewState
{
  return (TUIMutableViewState *)self->_keyboardSupport;
}

- (void)setSavedViewState:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSupport, a3);
}

- (NSNumber)visibleOverride
{
  return (NSNumber *)self->_savedViewState;
}

- (void)setVisibleOverride:(id)a3
{
  objc_storeStrong((id *)&self->_savedViewState, a3);
}

- (TUIRenderModelAuxiliary)auxiliaryRenderModel
{
  return (TUIRenderModelAuxiliary *)self->_visibleOverride;
}

- (void)setAuxiliaryRenderModel:(id)a3
{
  objc_storeStrong((id *)&self->_visibleOverride, a3);
}

- (TUITransaction)syncTransaction
{
  return (TUITransaction *)self->_auxiliaryRenderModel;
}

- (void)setSyncTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_auxiliaryRenderModel, a3);
}

- (TUIFeedViewState)suspendedViewState
{
  return (TUIFeedViewState *)self->_syncTransaction;
}

- (void)setSuspendedViewState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (TUIFeedViewState)restoreViewState
{
  return self->_suspendedViewState;
}

- (void)setRestoreViewState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (BOOL)suspendedDueToMemoryPressure
{
  return self->_avoidSyncTransactionInViewWillAppear;
}

- (void)setSuspendedDueToMemoryPressure:(BOOL)a3
{
  self->_avoidSyncTransactionInViewWillAppear = a3;
}

- (BOOL)viewDidDisappearWasCalled
{
  return self->_updateEnvironmentOnViewLoad;
}

- (void)setViewDidDisappearWasCalled:(BOOL)a3
{
  self->_updateEnvironmentOnViewLoad = a3;
}

- (TUIDynamicInstance)feedContentLayoutStackNameInstance
{
  return (TUIDynamicInstance *)self->_restoreViewState;
}

- (void)setFeedContentLayoutStackNameInstance:(id)a3
{
  objc_storeStrong((id *)&self->_restoreViewState, a3);
}

- (TUIViewFactory)viewFactory
{
  return (TUIViewFactory *)self->_feedContentLayoutStackNameInstance;
}

- (void)setViewFactory:(id)a3
{
  objc_storeStrong((id *)&self->_feedContentLayoutStackNameInstance, a3);
}

- (NSHashTable)heightLayoutConditions
{
  return (NSHashTable *)self->_viewFactory;
}

- (void)setHeightLayoutConditions:(id)a3
{
  objc_storeStrong((id *)&self->_viewFactory, a3);
}

- (TUIFeedAutoScrollController)autoScrollController
{
  return (TUIFeedAutoScrollController *)self->_heightLayoutConditions;
}

- (void)setAutoScrollController:(id)a3
{
  objc_storeStrong((id *)&self->_heightLayoutConditions, a3);
}

- (_TUIFeedViewControllerQueueContext)queueContext
{
  return (_TUIFeedViewControllerQueueContext *)self->_autoScrollController;
}

- (void)setQueueContext:(id)a3
{
  objc_storeStrong((id *)&self->_autoScrollController, a3);
}

- (TUIFeedOverlayDebugView)overlayDebugView
{
  return (TUIFeedOverlayDebugView *)self->_queueContext;
}

- (CGPoint)savedContentOffset
{
  TUIFeedDebugDelegate *debugDelegate;
  double x;
  CGPoint result;

  debugDelegate = self->_debugDelegate;
  x = self->_savedContentOffset.x;
  result.y = x;
  result.x = *(double *)&debugDelegate;
  return result;
}

- (void)setSavedContentOffset:(CGPoint)a3
{
  *(CGPoint *)&self->_debugDelegate = a3;
}

- (CGSize)savedContentSize
{
  double y;
  double width;
  CGSize result;

  y = self->_savedContentOffset.y;
  width = self->_savedContentSize.width;
  result.height = width;
  result.width = y;
  return result;
}

- (void)setSavedContentSize:(CGSize)a3
{
  *(CGSize *)&self->_savedContentOffset.y = a3;
}

- (TUIAuxiliaryViewState)auxiliaryViewState
{
  return (TUIAuxiliaryViewState *)self->_overlayDebugView;
}

- (TUIVisibilityTracker)impressionTracker
{
  return (TUIVisibilityTracker *)self->_auxiliaryViewState;
}

- (TUIVisibilityTracker)linkEntityTracker
{
  return self->_impressionTracker;
}

- (TUISyncLayoutController)syncLayoutController
{
  return (TUISyncLayoutController *)self->_linkEntityTracker;
}

- (TUIFeedView)feedView
{
  return (TUIFeedView *)self->_syncLayoutController;
}

- (TUIFeedLayoutController)layoutController
{
  return (TUIFeedLayoutController *)self->_feedView;
}

- (TUIFeedDebugDelegate)debugDelegate
{
  return (TUIFeedDebugDelegate *)objc_loadWeakRetained((id *)&self->_layoutController);
}

- (void)setDebugDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutController);
  objc_storeStrong((id *)&self->_feedView, 0);
  objc_storeStrong((id *)&self->_syncLayoutController, 0);
  objc_storeStrong((id *)&self->_linkEntityTracker, 0);
  objc_storeStrong((id *)&self->_impressionTracker, 0);
  objc_storeStrong((id *)&self->_auxiliaryViewState, 0);
  objc_storeStrong((id *)&self->_overlayDebugView, 0);
  objc_storeStrong((id *)&self->_queueContext, 0);
  objc_storeStrong((id *)&self->_autoScrollController, 0);
  objc_storeStrong((id *)&self->_heightLayoutConditions, 0);
  objc_storeStrong((id *)&self->_viewFactory, 0);
  objc_storeStrong((id *)&self->_feedContentLayoutStackNameInstance, 0);
  objc_storeStrong((id *)&self->_restoreViewState, 0);
  objc_storeStrong((id *)&self->_suspendedViewState, 0);
  objc_storeStrong((id *)&self->_syncTransaction, 0);
  objc_storeStrong((id *)&self->_auxiliaryRenderModel, 0);
  objc_storeStrong((id *)&self->_visibleOverride, 0);
  objc_storeStrong((id *)&self->_savedViewState, 0);
  objc_storeStrong((id *)&self->_keyboardSupport, 0);
  objc_storeStrong((id *)&self->_heightGuessForScrollingOption, 0);
  objc_destroyWeak((id *)&self->_extraRightItems);
  objc_storeStrong((id *)&self->_extraLeftItems, 0);
  objc_storeStrong((id *)&self->_performanceIdentifier, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_templateFactory, 0);
  objc_storeStrong((id *)&self->_triggerStateManager, 0);
  objc_storeStrong((id *)&self->_dropController, 0);
  objc_storeStrong((id *)&self->_imagePrefetchController, 0);
  objc_storeStrong((id *)&self->_linkEntityController, 0);
  objc_storeStrong((id *)&self->_impressionController, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_hostingController, 0);
  objc_storeStrong((id *)&self->_renderOverrideProvider, 0);
  objc_storeStrong((id *)&self->_feedId, 0);
  objc_storeStrong((id *)&self->_embeddedScrollViewCoordinator, 0);
  objc_storeStrong((id *)&self->_pagedScrollableController, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_destroyWeak((id *)&self->_content);
  objc_storeStrong((id *)&self->_hiddenPriority, 0);
  objc_destroyWeak((id *)&self->_interactionBuilder);
  objc_storeStrong((id *)&self->_pendingCoordinatedTransitionTimingProvider, 0);
  objc_storeStrong((id *)&self->_topLevelAXElement, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
